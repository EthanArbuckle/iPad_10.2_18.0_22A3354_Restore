@implementation CDMNLUPreprocessGraph

+ (id)requiredDAGServices
{
  void *v2;
  objc_class *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[10];

  v24[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v5;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v7;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v9;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v11;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v13;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v15;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v17;
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (BOOL)requiresAssets
{
  return 1;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 6;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  NSObject *v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "+[CDMNLUPreprocessGraph getUsageForAssetSetName:withLocale:]";
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v8, 0x16u);

    }
    return 0;
  }
  else
  {
    +[CDMAssetsUtils getAssistantUsages:](CDMAssetsUtils, "getAssistantUsages:", a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

- (void)buildGraph
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[7];
  id v64[5];
  id v65;
  id v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  void *v74;
  uint64_t v75;
  void (*v76)(uint64_t);
  void *v77;
  id v78;
  id v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  void *v85;
  uint64_t v86;
  void (*v87)(uint64_t);
  void *v88;
  id v89;
  id v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD *v93;
  void *v94;
  uint64_t v95;
  void (*v96)(uint64_t);
  void *v97;
  id v98;
  _QWORD *v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD v102[9];
  _QWORD v103[4];
  id v104;
  id v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD v108[4];
  id v109;
  id v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD v113[4];
  id v114;
  id v115;
  _QWORD *v116;
  _QWORD *v117;
  _QWORD v118[4];
  id v119;
  id v120;
  _QWORD *v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(uint64_t);
  void *v126;
  id v127;
  id v128;
  _QWORD *v129;
  _QWORD *v130;
  _QWORD v131[5];
  id v132;
  _QWORD v133[5];
  id v134;
  _QWORD v135[5];
  id v136;
  _QWORD v137[5];
  id v138;
  _QWORD v139[5];
  id v140;
  _QWORD v141[5];
  id v142;
  _QWORD v143[5];
  id v144;
  _QWORD v145[5];
  id v146;
  _QWORD v147[5];
  id v148;
  _QWORD v149[5];
  id v150;
  _QWORD v151[5];
  id v152;
  _QWORD v153[5];
  id v154;
  _QWORD v155[5];
  id v156;
  _QWORD v157[5];
  id v158;
  _QWORD v159[5];
  id v160;
  id location[2];

  objc_initWeak(location, self);
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v56 = (void *)v8;
  v58 = (void *)v7;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();
  v159[0] = 0;
  v159[1] = v159;
  v159[2] = 0x3032000000;
  v159[3] = __Block_byref_object_copy__4771;
  v159[4] = __Block_byref_object_dispose__4772;
  v160 = 0;
  v157[0] = 0;
  v157[1] = v157;
  v157[2] = 0x3032000000;
  v157[3] = __Block_byref_object_copy__4771;
  v157[4] = __Block_byref_object_dispose__4772;
  v158 = 0;
  v155[0] = 0;
  v155[1] = v155;
  v155[2] = 0x3032000000;
  v155[3] = __Block_byref_object_copy__4771;
  v155[4] = __Block_byref_object_dispose__4772;
  v156 = 0;
  v153[0] = 0;
  v153[1] = v153;
  v153[2] = 0x3032000000;
  v153[3] = __Block_byref_object_copy__4771;
  v153[4] = __Block_byref_object_dispose__4772;
  v154 = 0;
  v151[0] = 0;
  v151[1] = v151;
  v151[2] = 0x3032000000;
  v151[3] = __Block_byref_object_copy__4771;
  v151[4] = __Block_byref_object_dispose__4772;
  v152 = 0;
  v149[0] = 0;
  v149[1] = v149;
  v149[2] = 0x3032000000;
  v149[3] = __Block_byref_object_copy__4771;
  v149[4] = __Block_byref_object_dispose__4772;
  v150 = 0;
  v147[0] = 0;
  v147[1] = v147;
  v147[2] = 0x3032000000;
  v147[3] = __Block_byref_object_copy__4771;
  v147[4] = __Block_byref_object_dispose__4772;
  v148 = 0;
  v145[0] = 0;
  v145[1] = v145;
  v145[2] = 0x3032000000;
  v145[3] = __Block_byref_object_copy__4771;
  v145[4] = __Block_byref_object_dispose__4772;
  v146 = 0;
  v143[0] = 0;
  v143[1] = v143;
  v143[2] = 0x3032000000;
  v143[3] = __Block_byref_object_copy__4771;
  v143[4] = __Block_byref_object_dispose__4772;
  v144 = 0;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x3032000000;
  v141[3] = __Block_byref_object_copy__4771;
  v141[4] = __Block_byref_object_dispose__4772;
  v142 = 0;
  v139[0] = 0;
  v139[1] = v139;
  v139[2] = 0x3032000000;
  v139[3] = __Block_byref_object_copy__4771;
  v139[4] = __Block_byref_object_dispose__4772;
  v140 = 0;
  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x3032000000;
  v137[3] = __Block_byref_object_copy__4771;
  v137[4] = __Block_byref_object_dispose__4772;
  v138 = 0;
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x3032000000;
  v135[3] = __Block_byref_object_copy__4771;
  v135[4] = __Block_byref_object_dispose__4772;
  v136 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x3032000000;
  v133[3] = __Block_byref_object_copy__4771;
  v133[4] = __Block_byref_object_dispose__4772;
  v134 = 0;
  -[CDMServiceGraph getGraphInput](self, "getGraphInput");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "siriNLUTypeObj");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getLanguage](self, "getLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph validateRequest:](self, "validateRequest:", v10);
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x3032000000;
  v131[3] = __Block_byref_object_copy__4771;
  v131[4] = __Block_byref_object_dispose__4772;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "utterance");
  v52 = (void *)v9;
  v132 = (id)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph populateRequesterEnumForNluRequest:](self, "populateRequesterEnumForNluRequest:", v10);
  objc_msgSend(v10, "requestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDAC760];
  v123 = MEMORY[0x24BDAC760];
  v124 = 3221225472;
  v125 = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke;
  v126 = &unk_24DCACFE8;
  v129 = v131;
  v46 = v11;
  v127 = v46;
  v130 = v159;
  v128 = v3;
  v47 = v128;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCurrentTokenize"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "requestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v13;
  v118[1] = 3221225472;
  v118[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_395;
  v118[3] = &unk_24DCACFE8;
  v121 = v159;
  v16 = v10;
  v119 = v16;
  v122 = v153;
  v17 = v4;
  v120 = v17;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationDateTime"), v17, v15, v118);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "requestId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v13;
  v113[1] = 3221225472;
  v113[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_398;
  v113[3] = &unk_24DCACFE8;
  v116 = v159;
  v19 = v16;
  v114 = v19;
  v117 = v151;
  v20 = v5;
  v115 = v20;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationRegex"), v20, v18, v113);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "requestId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v13;
  v108[1] = 3221225472;
  v108[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_399;
  v108[3] = &unk_24DCACFE8;
  v111 = v159;
  v22 = v19;
  v109 = v22;
  v112 = v149;
  v23 = v6;
  v110 = v23;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationSiriVocabulary"), v23, v21, v108);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "requestId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v13;
  v103[1] = 3221225472;
  v103[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_400;
  v103[3] = &unk_24DCACFE8;
  v106 = v159;
  v25 = v22;
  v104 = v25;
  v107 = v147;
  v26 = v60;
  v105 = v26;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationVoc"), v26, v24, v103);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = v13;
  v102[1] = 3221225472;
  v102[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_401;
  v102[3] = &unk_24DCAC2A0;
  v102[4] = v145;
  v102[5] = v153;
  v102[6] = v151;
  v102[7] = v149;
  v102[8] = v147;
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("doSpanization"), v27, v102);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v26;

  objc_msgSend(v25, "requestId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v13;
  v95 = 3221225472;
  v96 = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_2;
  v97 = &unk_24DCAC2C8;
  v99 = v159;
  v98 = v58;
  v100 = v157;
  v101 = v155;
  v44 = v98;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doEmbedding"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v20;

  objc_msgSend(v25, "requestId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v13;
  v86 = 3221225472;
  v87 = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_405;
  v88 = &unk_24DCAC2F0;
  v91 = v143;
  v31 = v25;
  v89 = v31;
  v92 = v159;
  v93 = v141;
  v90 = v56;
  v57 = v90;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doContextualSpanMatching"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v23;

  objc_msgSend(v31, "requestId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v13;
  v75 = 3221225472;
  v76 = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_410;
  v77 = &unk_24DCAC318;
  v80 = v139;
  v81 = v159;
  v82 = v157;
  v83 = v155;
  v34 = v31;
  v78 = v34;
  v84 = v137;
  v79 = v54;
  v55 = v79;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doMentionDetection"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v17;

  objc_msgSend(v34, "requestId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v13;
  v64[2] = (id)3221225472;
  v64[3] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_417;
  v64[4] = &unk_24DCAC340;
  v67 = v137;
  v37 = v34;
  v65 = v37;
  v68 = v135;
  v69 = v159;
  v70 = v141;
  v71 = v157;
  v72 = v155;
  v73 = v133;
  v66 = v52;
  v53 = v66;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doMentionResolving"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "requestId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v13;
  v63[1] = 3221225472;
  v63[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_420;
  v63[3] = &unk_24DCAC368;
  v63[4] = v159;
  v63[5] = v145;
  v63[6] = v133;
  objc_copyWeak(v64, location);
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("doPostProcess"), v39, v63);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "addDependency:", v14);
  objc_msgSend(v50, "addDependency:", v14);
  objc_msgSend(v62, "addDependency:", v14);
  objc_msgSend(v61, "addDependency:", v14);
  objc_msgSend(v28, "addDependency:", v51);
  objc_msgSend(v28, "addDependency:", v50);
  objc_msgSend(v28, "addDependency:", v62);
  objc_msgSend(v28, "addDependency:", v61);
  objc_msgSend(v59, "addDependency:", v14);
  objc_msgSend(v32, "addDependency:", v14);
  objc_msgSend(v38, "addDependency:", v32);
  objc_msgSend(v35, "addDependency:", v59);
  objc_msgSend(v38, "addDependency:", v35);
  objc_msgSend(v40, "addDependency:", v28);
  objc_msgSend(v40, "addDependency:", v38);

  objc_destroyWeak(v64);
  _Block_object_dispose(v131, 8);

  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v135, 8);

  _Block_object_dispose(v137, 8);
  _Block_object_dispose(v139, 8);

  _Block_object_dispose(v141, 8);
  _Block_object_dispose(v143, 8);

  _Block_object_dispose(v145, 8);
  _Block_object_dispose(v147, 8);

  _Block_object_dispose(v149, 8);
  _Block_object_dispose(v151, 8);

  _Block_object_dispose(v153, 8);
  _Block_object_dispose(v155, 8);

  _Block_object_dispose(v157, 8);
  _Block_object_dispose(v159, 8);

  objc_destroyWeak(location);
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizationProtoService", (uint8_t *)&v9, 0xCu);
  }

  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = 136315394;
    v10 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest, utterance: %@", (uint8_t *)&v9, 0x16u);
  }

  +[CDMTokenizerProtoService createProtoTokenRequestWithText:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithText:locale:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "handle:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_395(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CDMSpanMatcherRequestCommand *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequest:nlContext:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CDMSpanMatcherRequestCommand initWithRequest:]([CDMSpanMatcherRequestCommand alloc], "initWithRequest:", v7);
  objc_msgSend(*(id *)(a1 + 40), "handle:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_398(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CDMSpanMatcherRequestCommand *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequest:nlContext:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CDMSpanMatcherRequestCommand initWithRequest:]([CDMSpanMatcherRequestCommand alloc], "initWithRequest:", v7);
  objc_msgSend(*(id *)(a1 + 40), "handle:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_399(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CDMSpanMatcherRequestCommand *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequest:nlContext:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CDMSpanMatcherRequestCommand initWithRequest:]([CDMSpanMatcherRequestCommand alloc], "initWithRequest:", v7);
  objc_msgSend(*(id *)(a1 + 40), "handle:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_400(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CDMSpanMatcherRequestCommand *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequest:nlContext:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CDMSpanMatcherRequestCommand initWithRequest:]([CDMSpanMatcherRequestCommand alloc], "initWithRequest:", v7);
  objc_msgSend(*(id *)(a1 + 40), "handle:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_401(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[CDMServiceGraphUtil mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:](CDMServiceGraphUtil, "mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[4] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CDMEmbeddingProtoRequestCommand *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315138;
    v17 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v16, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E1D8]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTokenChain:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v7);

  v8 = -[CDMEmbeddingProtoRequestCommand initWithRequest:]([CDMEmbeddingProtoRequestCommand alloc], "initWithRequest:", v3);
  objc_msgSend(*(id *)(a1 + 32), "handle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "response");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(v9, "embeddingConfigs");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_405(uint64_t a1)
{
  NSObject *v2;
  CDMContextualSpanMatcherRequestCommand *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315138;
    v22 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMContextualSpanMatcherRequestCommand for use in CDMContextualSpanMatcherService", (uint8_t *)&v21, 0xCu);
  }

  v3 = [CDMContextualSpanMatcherRequestCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tokenChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMContextualSpanMatcherServiceUtils buildContextualSpanMatcherRequestWithNLContext:requestId:tokenChain:](CDMContextualSpanMatcherServiceUtils, "buildContextualSpanMatcherRequestWithNLContext:requestId:tokenChain:", v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CDMContextualSpanMatcherRequestCommand initWithContextualSpanMatcherRequest:](v3, "initWithContextualSpanMatcherRequest:", v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 40), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "cmdError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "cmdError");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315394;
      v22 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: ContextualSpanMatcher prediction failed: %@", (uint8_t *)&v21, 0x16u);

    }
  }
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_410(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  CDMMentionDetectorRequestCommand *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionDetectorRequestCommand for use in CDMMentionDetectorService", buf, 0xCu);
  }

  v21 = [CDMMentionDetectorRequestCommand alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "embeddingTensorOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("com.apple.siri.nl.marrs.md"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nluRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMMentionDetectorServiceUtils buildMDRequestWithUtterance:tokenChain:embedding:nluRequestId:resultCandidateId:cdmRequestId:](CDMMentionDetectorServiceUtils, "buildMDRequestWithUtterance:tokenChain:embedding:nluRequestId:resultCandidateId:cdmRequestId:", v22, v4, v6, v8, &stru_24DCAE158, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CDMMentionDetectorRequestCommand initWithMDRequest:withCurrTurn:](v21, "initWithMDRequest:withCurrTurn:", v10, 0);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 40), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "cmdError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "cmdError");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Detection prediction failed: %@", buf, 0x16u);

    }
  }
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_417(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  CDMMentionResolverRequestCommand *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionResolverRequestCommand for use in CDMMentionResolverService", buf, 0xCu);
  }

  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v32 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    v33 = 2112;
    v34 = v23;
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s CDMMentionDetectorResponseCommand: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [CDMMentionResolverRequestCommand alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "response");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tokenChain");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "response");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "contextualSpanMatcherResponse");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "embeddingTensorOutputs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v29, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("com.apple.siri.nl.marrs.md"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "previousTurnInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nluRequestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMMentionResolverServiceUtils buildMRRequestWithCurTurn:tokenChain:mdResponse:contextualSpanMatcherResponse:embedding:utterance:turnIndex:nluRequestId:resultCandidateId:cdmRequestId:](CDMMentionResolverServiceUtils, "buildMRRequestWithCurTurn:tokenChain:mdResponse:contextualSpanMatcherResponse:embedding:utterance:turnIndex:nluRequestId:resultCandidateId:cdmRequestId:", v25, v28, v27, v26, v4, v6, v8, v10, &stru_24DCAE158, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CDMMentionResolverRequestCommand initWithMRRequest:](v24, "initWithMRRequest:", v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(*(id *)(a1 + 40), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "cmdError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "cmdError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Resolver prediction failed: %@", buf, 0x16u);

    }
  }

}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_420(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CDMNLUPreprocessResponseCommand *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Final post process step", (uint8_t *)&v10, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E278]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTokenizerResponse:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BE9E1E0]);
  objc_msgSend(v3, "setEmbeddingResponse:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "spanMatchResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpanMatchResponse:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMentionResolverResponse:", v7);

  v8 = -[CDMNLUPreprocessResponseCommand initWithPreprocessingWrapper:]([CDMNLUPreprocessResponseCommand alloc], "initWithPreprocessingWrapper:", v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setGraphOutput:", v8);

}

@end
