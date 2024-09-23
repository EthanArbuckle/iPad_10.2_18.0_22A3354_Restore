@implementation BMSiriOnDeviceDigestExperimentMetricsExperimentDigest

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithSystemBuild:(id)a3 dataSharingOptInStatus:(id)a4 viewInterface:(id)a5 audioInterfaceVendorId:(id)a6 audioInterfaceProductId:(id)a7 asrLocation:(id)a8 nlLocation:(id)a9 siriInputLocale:(id)a10 subDomain:(id)a11 responseCategory:(id)a12 experimentAllocationStatus:(id)a13 isTriggered:(id)a14 isFirstTriggerOrAfterFirstTrigger:(id)a15 codePathIdUUID:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 usdxSessionCount:(id)a30 tuples:(id)a31
{
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  id v68;
  id v69;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  objc_super v91;

  v76 = a3;
  v88 = a4;
  v90 = a5;
  v68 = a6;
  v75 = a6;
  v69 = a7;
  v74 = a7;
  v89 = a8;
  v36 = a9;
  v73 = a10;
  v72 = a11;
  v87 = a12;
  v86 = a13;
  v85 = a14;
  v84 = a15;
  v37 = a16;
  v83 = a17;
  v38 = a18;
  v39 = a19;
  v40 = a20;
  v41 = a21;
  v42 = a22;
  v43 = a23;
  v82 = a24;
  v81 = a25;
  v80 = a26;
  v79 = a27;
  v78 = a28;
  v77 = a29;
  v44 = a30;
  v71 = a31;
  v91.receiver = self;
  v91.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigest;
  v45 = -[BMEventBase init](&v91, sel_init);
  if (v45)
  {
    v45->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v45->_systemBuild, a3);
    if (v88)
    {
      v45->_hasDataSharingOptInStatus = 1;
      v46 = objc_msgSend(v88, "intValue");
    }
    else
    {
      v45->_hasDataSharingOptInStatus = 0;
      v46 = -1;
    }
    v45->_dataSharingOptInStatus = v46;
    if (v90)
    {
      v45->_hasViewInterface = 1;
      v47 = objc_msgSend(v90, "intValue");
    }
    else
    {
      v45->_hasViewInterface = 0;
      v47 = -1;
    }
    v45->_viewInterface = v47;
    objc_storeStrong((id *)&v45->_audioInterfaceVendorId, v68);
    objc_storeStrong((id *)&v45->_audioInterfaceProductId, v69);
    if (v89)
    {
      v45->_hasAsrLocation = 1;
      v48 = objc_msgSend(v89, "intValue");
    }
    else
    {
      v45->_hasAsrLocation = 0;
      v48 = -1;
    }
    v45->_asrLocation = v48;
    if (v36)
    {
      v45->_hasNlLocation = 1;
      v49 = objc_msgSend(v36, "intValue");
    }
    else
    {
      v45->_hasNlLocation = 0;
      v49 = -1;
    }
    v45->_nlLocation = v49;
    objc_storeStrong((id *)&v45->_siriInputLocale, a10);
    objc_storeStrong((id *)&v45->_subDomain, a11);
    if (v87)
    {
      v45->_hasResponseCategory = 1;
      v50 = objc_msgSend(v87, "intValue");
    }
    else
    {
      v45->_hasResponseCategory = 0;
      v50 = -1;
    }
    v45->_responseCategory = v50;
    if (v86)
    {
      v45->_hasExperimentAllocationStatus = 1;
      v51 = objc_msgSend(v86, "intValue");
    }
    else
    {
      v45->_hasExperimentAllocationStatus = 0;
      v51 = -1;
    }
    v45->_experimentAllocationStatus = v51;
    if (v85)
    {
      v45->_hasIsTriggered = 1;
      v45->_isTriggered = objc_msgSend(v85, "BOOLValue");
    }
    else
    {
      v45->_hasIsTriggered = 0;
      v45->_isTriggered = 0;
    }
    if (v84)
    {
      v45->_hasIsFirstTriggerOrAfterFirstTrigger = 1;
      v45->_isFirstTriggerOrAfterFirstTrigger = objc_msgSend(v84, "BOOLValue");
    }
    else
    {
      v45->_hasIsFirstTriggerOrAfterFirstTrigger = 0;
      v45->_isFirstTriggerOrAfterFirstTrigger = 0;
    }
    objc_storeStrong((id *)&v45->_codePathIdUUID, a16);
    v52 = v83;
    if (v83)
    {
      v45->_hasTotalTurnCount = 1;
      v52 = objc_msgSend(v83, "unsignedIntValue");
    }
    else
    {
      v45->_hasTotalTurnCount = 0;
    }
    v45->_totalTurnCount = v52;
    if (v38)
    {
      v45->_hasValidTurnCount = 1;
      v53 = objc_msgSend(v38, "unsignedIntValue");
    }
    else
    {
      v53 = 0;
      v45->_hasValidTurnCount = 0;
    }
    v45->_validTurnCount = v53;
    if (v39)
    {
      v45->_hasSiriTasksStarted = 1;
      v54 = objc_msgSend(v39, "unsignedIntValue");
    }
    else
    {
      v54 = 0;
      v45->_hasSiriTasksStarted = 0;
    }
    v45->_siriTasksStarted = v54;
    if (v40)
    {
      v45->_hasSiriTasksCompleted = 1;
      v55 = objc_msgSend(v40, "unsignedIntValue");
    }
    else
    {
      v55 = 0;
      v45->_hasSiriTasksCompleted = 0;
    }
    v45->_siriTasksCompleted = v55;
    if (v41)
    {
      v45->_hasFlowTasksStarted = 1;
      v56 = objc_msgSend(v41, "unsignedIntValue");
    }
    else
    {
      v56 = 0;
      v45->_hasFlowTasksStarted = 0;
    }
    v45->_flowTasksStarted = v56;
    if (v42)
    {
      v45->_hasFlowTasksCompleted = 1;
      v57 = objc_msgSend(v42, "unsignedIntValue");
    }
    else
    {
      v57 = 0;
      v45->_hasFlowTasksCompleted = 0;
    }
    v45->_flowTasksCompleted = v57;
    if (v43)
    {
      v45->_hasReliabilityRequestCount = 1;
      v58 = objc_msgSend(v43, "unsignedIntValue");
    }
    else
    {
      v58 = 0;
      v45->_hasReliabilityRequestCount = 0;
    }
    v45->_reliabilityRequestCount = v58;
    v59 = v82;
    if (v82)
    {
      v45->_hasReliabilityTurnCount = 1;
      v59 = objc_msgSend(v82, "unsignedIntValue");
    }
    else
    {
      v45->_hasReliabilityTurnCount = 0;
    }
    v45->_reliabilityTurnCount = v59;
    v60 = v81;
    if (v81)
    {
      v45->_hasClientErrorCount = 1;
      v60 = objc_msgSend(v81, "unsignedIntValue");
    }
    else
    {
      v45->_hasClientErrorCount = 0;
    }
    v45->_clientErrorCount = v60;
    v61 = v80;
    if (v80)
    {
      v45->_hasUndesiredResponseCount = 1;
      v61 = objc_msgSend(v80, "unsignedIntValue");
    }
    else
    {
      v45->_hasUndesiredResponseCount = 0;
    }
    v45->_undesiredResponseCount = v61;
    v62 = v79;
    if (v79)
    {
      v45->_hasFatalResponseCount = 1;
      v62 = objc_msgSend(v79, "unsignedIntValue");
    }
    else
    {
      v45->_hasFatalResponseCount = 0;
    }
    v45->_fatalResponseCount = v62;
    v63 = v78;
    if (v78)
    {
      v45->_hasFailureResponseCount = 1;
      v63 = objc_msgSend(v78, "unsignedIntValue");
    }
    else
    {
      v45->_hasFailureResponseCount = 0;
    }
    v45->_failureResponseCount = v63;
    v64 = v77;
    if (v77)
    {
      v45->_hasSiriUnavailableResponseCount = 1;
      v64 = objc_msgSend(v77, "unsignedIntValue");
    }
    else
    {
      v45->_hasSiriUnavailableResponseCount = 0;
    }
    v45->_siriUnavailableResponseCount = v64;
    if (v44)
    {
      v45->_hasUsdxSessionCount = 1;
      v65 = objc_msgSend(v44, "unsignedIntValue");
    }
    else
    {
      v65 = 0;
      v45->_hasUsdxSessionCount = 0;
    }
    v45->_usdxSessionCount = v65;
    objc_storeStrong((id *)&v45->_tuples, a31);
  }

  return v45;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest systemBuild](self, "systemBuild");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest dataSharingOptInStatus](self, "dataSharingOptInStatus"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest viewInterface](self, "viewInterface"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceProductId](self, "audioInterfaceProductId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest asrLocation](self, "asrLocation"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest nlLocation](self, "nlLocation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriInputLocale](self, "siriInputLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest subDomain](self, "subDomain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest responseCategory](self, "responseCategory"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest experimentAllocationStatus](self, "experimentAllocationStatus"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isTriggered](self, "isTriggered"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest codePathIdUUID](self, "codePathIdUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest totalTurnCount](self, "totalTurnCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest validTurnCount](self, "validTurnCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksStarted](self, "siriTasksStarted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksCompleted](self, "siriTasksCompleted"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksStarted](self, "flowTasksStarted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksCompleted](self, "flowTasksCompleted"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityRequestCount](self, "reliabilityRequestCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityTurnCount](self, "reliabilityTurnCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest clientErrorCount](self, "clientErrorCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest undesiredResponseCount](self, "undesiredResponseCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest fatalResponseCount](self, "fatalResponseCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest failureResponseCount](self, "failureResponseCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest usdxSessionCount](self, "usdxSessionCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest tuples](self, "tuples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("BMSiriOnDeviceDigestExperimentMetricsExperimentDigest with systemBuild: %@, dataSharingOptInStatus: %@, viewInterface: %@, audioInterfaceVendorId: %@, audioInterfaceProductId: %@, asrLocation: %@, nlLocation: %@, siriInputLocale: %@, subDomain: %@, responseCategory: %@, experimentAllocationStatus: %@, isTriggered: %@, isFirstTriggerOrAfterFirstTrigger: %@, codePathIdUUID: %@, totalTurnCount: %@, validTurnCount: %@, siriTasksStarted: %@, siriTasksCompleted: %@, flowTasksStarted: %@, flowTasksCompleted: %@, reliabilityRequestCount: %@, reliabilityTurnCount: %@, clientErrorCount: %@, undesiredResponseCount: %@, fatalResponseCount: %@, failureResponseCount: %@, siriUnavailableResponseCount: %@, usdxSessionCount: %@, tuples: %@"), v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v19, v18, v17,
                  v16,
                  v15,
                  v14,
                  v13,
                  v12,
                  v11,
                  v10,
                  v9,
                  v8,
                  v3,
                  v4,
                  v5,
                  v6);

  return (NSString *)v21;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  objc_class *v47;
  uint64_t v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  void *v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  char v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  char v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char v123;
  char v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char v129;
  char v130;
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char v135;
  char v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  char v142;
  unsigned int v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char v147;
  char v148;
  unsigned int v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char v153;
  char v154;
  unsigned int v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char v159;
  void *v160;
  uint64_t v161;
  BOOL v162;
  uint64_t v163;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *v164;
  objc_super v166;
  uint64_t v167;
  uint64_t v168;

  v4 = a3;
  v166.receiver = self;
  v166.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigest;
  v5 = -[BMEventBase init](&v166, sel_init);
  if (!v5)
    goto LABEL_282;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 128;
          goto LABEL_86;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasDataSharingOptInStatus = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_192;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_192:
          v161 = 44;
          goto LABEL_278;
        case 3u:
          v29 = 0;
          v30 = 0;
          v24 = 0;
          v5->_hasViewInterface = 1;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v24 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_196;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_196:
          v161 = 48;
          goto LABEL_278;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 136;
          goto LABEL_86;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 144;
          goto LABEL_86;
        case 6u:
          v35 = 0;
          v36 = 0;
          v24 = 0;
          v5->_hasAsrLocation = 1;
          while (2)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v4[v37];
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
              *(_QWORD *)&v4[v37] = v39;
              v24 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v17 = v36++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_200;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_200:
          v161 = 52;
          goto LABEL_278;
        case 7u:
          v41 = 0;
          v42 = 0;
          v24 = 0;
          v5->_hasNlLocation = 1;
          while (2)
          {
            v43 = *v6;
            v44 = *(_QWORD *)&v4[v43];
            v45 = v44 + 1;
            if (v44 == -1 || v45 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v44);
              *(_QWORD *)&v4[v43] = v45;
              v24 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                v17 = v42++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_204;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_204:
          v161 = 56;
          goto LABEL_278;
        case 8u:
          v167 = 0;
          v168 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_281;
          v47 = -[BMSiriOnDeviceDigestExperimentMetricsISOLocale initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsISOLocale alloc], "initByReadFrom:", v4);
          if (!v47)
            goto LABEL_281;
          v48 = 152;
          goto LABEL_188;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 160;
          goto LABEL_86;
        case 0xAu:
          v49 = 0;
          v50 = 0;
          v24 = 0;
          v5->_hasResponseCategory = 1;
          while (2)
          {
            v51 = *v6;
            v52 = *(_QWORD *)&v4[v51];
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v52);
              *(_QWORD *)&v4[v51] = v53;
              v24 |= (unint64_t)(v54 & 0x7F) << v49;
              if (v54 < 0)
              {
                v49 += 7;
                v17 = v50++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_208;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_208:
          v161 = 60;
          goto LABEL_278;
        case 0xBu:
          v55 = 0;
          v56 = 0;
          v24 = 0;
          v5->_hasExperimentAllocationStatus = 1;
          while (2)
          {
            v57 = *v6;
            v58 = *(_QWORD *)&v4[v57];
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v58);
              *(_QWORD *)&v4[v57] = v59;
              v24 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v17 = v56++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_212;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_212:
          v161 = 64;
          goto LABEL_278;
        case 0xCu:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          v5->_hasIsTriggered = 1;
          while (2)
          {
            v64 = *v6;
            v65 = *(_QWORD *)&v4[v64];
            v66 = v65 + 1;
            if (v65 == -1 || v66 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v65);
              *(_QWORD *)&v4[v64] = v66;
              v63 |= (unint64_t)(v67 & 0x7F) << v61;
              if (v67 < 0)
              {
                v61 += 7;
                v17 = v62++ >= 9;
                if (v17)
                {
                  v63 = 0;
                  goto LABEL_216;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v63 = 0;
LABEL_216:
          v162 = v63 != 0;
          v163 = 22;
          goto LABEL_221;
        case 0xDu:
          v68 = 0;
          v69 = 0;
          v70 = 0;
          v5->_hasIsFirstTriggerOrAfterFirstTrigger = 1;
          while (2)
          {
            v71 = *v6;
            v72 = *(_QWORD *)&v4[v71];
            v73 = v72 + 1;
            if (v72 == -1 || v73 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v72);
              *(_QWORD *)&v4[v71] = v73;
              v70 |= (unint64_t)(v74 & 0x7F) << v68;
              if (v74 < 0)
              {
                v68 += 7;
                v17 = v69++ >= 9;
                if (v17)
                {
                  v70 = 0;
                  goto LABEL_220;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v70 = 0;
LABEL_220:
          v162 = v70 != 0;
          v163 = 24;
LABEL_221:
          *((_BYTE *)&v5->super.super.isa + v163) = v162;
          continue;
        case 0xEu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 168;
LABEL_86:
          v75 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0xFu:
          v76 = 0;
          v77 = 0;
          v24 = 0;
          v5->_hasTotalTurnCount = 1;
          while (2)
          {
            v78 = *v6;
            v79 = *(_QWORD *)&v4[v78];
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v79);
              *(_QWORD *)&v4[v78] = v80;
              v24 |= (unint64_t)(v81 & 0x7F) << v76;
              if (v81 < 0)
              {
                v76 += 7;
                v17 = v77++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_225:
          v161 = 68;
          goto LABEL_278;
        case 0x10u:
          v82 = 0;
          v83 = 0;
          v24 = 0;
          v5->_hasValidTurnCount = 1;
          while (2)
          {
            v84 = *v6;
            v85 = *(_QWORD *)&v4[v84];
            v86 = v85 + 1;
            if (v85 == -1 || v86 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v87 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v85);
              *(_QWORD *)&v4[v84] = v86;
              v24 |= (unint64_t)(v87 & 0x7F) << v82;
              if (v87 < 0)
              {
                v82 += 7;
                v17 = v83++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_229:
          v161 = 72;
          goto LABEL_278;
        case 0x11u:
          v88 = 0;
          v89 = 0;
          v24 = 0;
          v5->_hasSiriTasksStarted = 1;
          while (2)
          {
            v90 = *v6;
            v91 = *(_QWORD *)&v4[v90];
            v92 = v91 + 1;
            if (v91 == -1 || v92 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v93 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v91);
              *(_QWORD *)&v4[v90] = v92;
              v24 |= (unint64_t)(v93 & 0x7F) << v88;
              if (v93 < 0)
              {
                v88 += 7;
                v17 = v89++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_233:
          v161 = 76;
          goto LABEL_278;
        case 0x12u:
          v94 = 0;
          v95 = 0;
          v24 = 0;
          v5->_hasSiriTasksCompleted = 1;
          while (2)
          {
            v96 = *v6;
            v97 = *(_QWORD *)&v4[v96];
            v98 = v97 + 1;
            if (v97 == -1 || v98 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v99 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v97);
              *(_QWORD *)&v4[v96] = v98;
              v24 |= (unint64_t)(v99 & 0x7F) << v94;
              if (v99 < 0)
              {
                v94 += 7;
                v17 = v95++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_237;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_237:
          v161 = 80;
          goto LABEL_278;
        case 0x13u:
          v100 = 0;
          v101 = 0;
          v24 = 0;
          v5->_hasFlowTasksStarted = 1;
          while (2)
          {
            v102 = *v6;
            v103 = *(_QWORD *)&v4[v102];
            v104 = v103 + 1;
            if (v103 == -1 || v104 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v105 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v103);
              *(_QWORD *)&v4[v102] = v104;
              v24 |= (unint64_t)(v105 & 0x7F) << v100;
              if (v105 < 0)
              {
                v100 += 7;
                v17 = v101++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_241;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_241:
          v161 = 84;
          goto LABEL_278;
        case 0x14u:
          v106 = 0;
          v107 = 0;
          v24 = 0;
          v5->_hasFlowTasksCompleted = 1;
          while (2)
          {
            v108 = *v6;
            v109 = *(_QWORD *)&v4[v108];
            v110 = v109 + 1;
            if (v109 == -1 || v110 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v111 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v109);
              *(_QWORD *)&v4[v108] = v110;
              v24 |= (unint64_t)(v111 & 0x7F) << v106;
              if (v111 < 0)
              {
                v106 += 7;
                v17 = v107++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_245;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_245:
          v161 = 88;
          goto LABEL_278;
        case 0x15u:
          v112 = 0;
          v113 = 0;
          v24 = 0;
          v5->_hasReliabilityRequestCount = 1;
          while (2)
          {
            v114 = *v6;
            v115 = *(_QWORD *)&v4[v114];
            v116 = v115 + 1;
            if (v115 == -1 || v116 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v117 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v115);
              *(_QWORD *)&v4[v114] = v116;
              v24 |= (unint64_t)(v117 & 0x7F) << v112;
              if (v117 < 0)
              {
                v112 += 7;
                v17 = v113++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_249;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_249:
          v161 = 92;
          goto LABEL_278;
        case 0x16u:
          v118 = 0;
          v119 = 0;
          v24 = 0;
          v5->_hasReliabilityTurnCount = 1;
          while (2)
          {
            v120 = *v6;
            v121 = *(_QWORD *)&v4[v120];
            v122 = v121 + 1;
            if (v121 == -1 || v122 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v123 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v121);
              *(_QWORD *)&v4[v120] = v122;
              v24 |= (unint64_t)(v123 & 0x7F) << v118;
              if (v123 < 0)
              {
                v118 += 7;
                v17 = v119++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_253;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_253:
          v161 = 96;
          goto LABEL_278;
        case 0x17u:
          v124 = 0;
          v125 = 0;
          v24 = 0;
          v5->_hasClientErrorCount = 1;
          while (2)
          {
            v126 = *v6;
            v127 = *(_QWORD *)&v4[v126];
            v128 = v127 + 1;
            if (v127 == -1 || v128 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v129 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v127);
              *(_QWORD *)&v4[v126] = v128;
              v24 |= (unint64_t)(v129 & 0x7F) << v124;
              if (v129 < 0)
              {
                v124 += 7;
                v17 = v125++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_257;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_257:
          v161 = 100;
          goto LABEL_278;
        case 0x18u:
          v130 = 0;
          v131 = 0;
          v24 = 0;
          v5->_hasUndesiredResponseCount = 1;
          while (2)
          {
            v132 = *v6;
            v133 = *(_QWORD *)&v4[v132];
            v134 = v133 + 1;
            if (v133 == -1 || v134 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v135 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v133);
              *(_QWORD *)&v4[v132] = v134;
              v24 |= (unint64_t)(v135 & 0x7F) << v130;
              if (v135 < 0)
              {
                v130 += 7;
                v17 = v131++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_261;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_261:
          v161 = 104;
          goto LABEL_278;
        case 0x19u:
          v136 = 0;
          v137 = 0;
          v24 = 0;
          v5->_hasFatalResponseCount = 1;
          while (2)
          {
            v138 = *v6;
            v139 = *(_QWORD *)&v4[v138];
            v140 = v139 + 1;
            if (v139 == -1 || v140 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v141 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v139);
              *(_QWORD *)&v4[v138] = v140;
              v24 |= (unint64_t)(v141 & 0x7F) << v136;
              if (v141 < 0)
              {
                v136 += 7;
                v17 = v137++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_265;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_265:
          v161 = 108;
          goto LABEL_278;
        case 0x1Au:
          v142 = 0;
          v143 = 0;
          v24 = 0;
          v5->_hasFailureResponseCount = 1;
          while (2)
          {
            v144 = *v6;
            v145 = *(_QWORD *)&v4[v144];
            v146 = v145 + 1;
            if (v145 == -1 || v146 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v147 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v145);
              *(_QWORD *)&v4[v144] = v146;
              v24 |= (unint64_t)(v147 & 0x7F) << v142;
              if (v147 < 0)
              {
                v142 += 7;
                v17 = v143++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_269;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_269:
          v161 = 112;
          goto LABEL_278;
        case 0x1Bu:
          v148 = 0;
          v149 = 0;
          v24 = 0;
          v5->_hasSiriUnavailableResponseCount = 1;
          while (2)
          {
            v150 = *v6;
            v151 = *(_QWORD *)&v4[v150];
            v152 = v151 + 1;
            if (v151 == -1 || v152 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v153 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v151);
              *(_QWORD *)&v4[v150] = v152;
              v24 |= (unint64_t)(v153 & 0x7F) << v148;
              if (v153 < 0)
              {
                v148 += 7;
                v17 = v149++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_273;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_273:
          v161 = 116;
          goto LABEL_278;
        case 0x1Cu:
          v154 = 0;
          v155 = 0;
          v24 = 0;
          v5->_hasUsdxSessionCount = 1;
          break;
        case 0x1Du:
          v167 = 0;
          v168 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_281;
          v47 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples alloc], "initByReadFrom:", v4);
          if (!v47)
            goto LABEL_281;
          v48 = 176;
LABEL_188:
          v160 = *(Class *)((char *)&v5->super.super.isa + v48);
          *(Class *)((char *)&v5->super.super.isa + v48) = v47;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_281;
          continue;
      }
      while (1)
      {
        v156 = *v6;
        v157 = *(_QWORD *)&v4[v156];
        v158 = v157 + 1;
        if (v157 == -1 || v158 > *(_QWORD *)&v4[*v7])
          break;
        v159 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v157);
        *(_QWORD *)&v4[v156] = v158;
        v24 |= (unint64_t)(v159 & 0x7F) << v154;
        if ((v159 & 0x80) == 0)
          goto LABEL_275;
        v154 += 7;
        v17 = v155++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_277;
        }
      }
      v4[*v8] = 1;
LABEL_275:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_277:
      v161 = 120;
LABEL_278:
      *(_DWORD *)((char *)&v5->super.super.isa + v161) = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_281:
    v164 = 0;
  else
LABEL_282:
    v164 = v5;

  return v164;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_systemBuild)
    PBDataWriterWriteStringField();
  if (self->_hasDataSharingOptInStatus)
    PBDataWriterWriteInt32Field();
  if (self->_hasViewInterface)
    PBDataWriterWriteInt32Field();
  if (self->_audioInterfaceVendorId)
    PBDataWriterWriteStringField();
  if (self->_audioInterfaceProductId)
    PBDataWriterWriteStringField();
  if (self->_hasAsrLocation)
    PBDataWriterWriteInt32Field();
  if (self->_hasNlLocation)
    PBDataWriterWriteInt32Field();
  if (self->_siriInputLocale)
  {
    PBDataWriterPlaceMark();
    -[BMSiriOnDeviceDigestExperimentMetricsISOLocale writeTo:](self->_siriInputLocale, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_subDomain)
    PBDataWriterWriteStringField();
  if (self->_hasResponseCategory)
    PBDataWriterWriteInt32Field();
  if (self->_hasExperimentAllocationStatus)
    PBDataWriterWriteInt32Field();
  if (self->_hasIsTriggered)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFirstTriggerOrAfterFirstTrigger)
    PBDataWriterWriteBOOLField();
  if (self->_codePathIdUUID)
    PBDataWriterWriteStringField();
  if (self->_hasTotalTurnCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasValidTurnCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasSiriTasksStarted)
    PBDataWriterWriteUint32Field();
  if (self->_hasSiriTasksCompleted)
    PBDataWriterWriteUint32Field();
  if (self->_hasFlowTasksStarted)
    PBDataWriterWriteUint32Field();
  if (self->_hasFlowTasksCompleted)
    PBDataWriterWriteUint32Field();
  if (self->_hasReliabilityRequestCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasReliabilityTurnCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasClientErrorCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasUndesiredResponseCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasFatalResponseCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasFailureResponseCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasSiriUnavailableResponseCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasUsdxSessionCount)
    PBDataWriterWriteUint32Field();
  if (self->_tuples)
  {
    PBDataWriterPlaceMark();
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples writeTo:](self->_tuples, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  BMSiriOnDeviceDigestExperimentMetricsISOLocale *v76;
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  id *v97;
  id v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  id *v104;
  id v105;
  uint64_t v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  id *v111;
  id v112;
  uint64_t v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  id *v118;
  id v119;
  uint64_t v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  id *v125;
  id v126;
  uint64_t v127;
  void *v128;
  id v129;
  void *v130;
  id v131;
  id *v132;
  id v133;
  uint64_t v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  id *v139;
  id v140;
  uint64_t v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  id *v146;
  id v147;
  uint64_t v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  id *v153;
  id v154;
  uint64_t v155;
  void *v156;
  id v157;
  void *v158;
  id v159;
  id *v160;
  id v161;
  uint64_t v162;
  void *v163;
  id v164;
  void *v165;
  id v166;
  id *v167;
  id v168;
  uint64_t v169;
  void *v170;
  id v171;
  void *v172;
  id v173;
  id *v174;
  id v175;
  uint64_t v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  id *v181;
  id v182;
  uint64_t v183;
  void *v184;
  id v185;
  void *v186;
  id v187;
  id *v188;
  id v189;
  uint64_t v190;
  void *v191;
  id v192;
  void *v193;
  id v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *v199;
  id v200;
  void *v201;
  id *v202;
  id v203;
  uint64_t v204;
  void *v205;
  id v206;
  void *v207;
  id v208;
  id *v209;
  id v210;
  uint64_t v211;
  void *v212;
  id v213;
  void *v214;
  id v215;
  id v216;
  id v217;
  void *v218;
  id *v219;
  id v220;
  uint64_t v221;
  void *v222;
  id v223;
  void *v224;
  id v225;
  id *v226;
  id v227;
  uint64_t v228;
  void *v229;
  id v230;
  void *v231;
  id v232;
  id *v233;
  id v234;
  uint64_t v235;
  void *v236;
  id v237;
  void *v238;
  id v239;
  id *v240;
  id v241;
  uint64_t v242;
  void *v243;
  id v244;
  void *v245;
  id v246;
  id *v247;
  void *v248;
  id v249;
  void *v250;
  void *v251;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  id v275;
  uint64_t v276;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *v277;
  id v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  id v283;
  void *v284;
  void *v285;
  id v286;
  id v287;
  void *v288;
  id v289;
  void *v290;
  id v291;
  void *v292;
  id v293;
  void *v294;
  id v295;
  void *v296;
  id v297;
  void *v298;
  id v299;
  void *v300;
  id v301;
  id v302;
  void *v303;
  id v304;
  void *v305;
  id v306;
  void *v307;
  id v308;
  void *v309;
  id v310;
  void *v311;
  id v312;
  void *v313;
  id v314;
  void *v315;
  id *v316;
  id v317;
  void *v318;
  void *v319;
  void *v320;
  id v321;
  void *v322;
  id v323;
  void *v324;
  id v325;
  id v326;
  void *v327;
  id v328;
  void *v329;
  void *v330;
  id v331;
  void *v333;
  id v334;
  id v335;
  uint64_t v336;
  void *v337;
  uint64_t v338;
  void *v339;
  uint64_t v340;
  id v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  id v345;
  uint64_t v346;
  id v347;
  uint64_t v348;
  id v349;
  uint64_t v350;
  id v351;
  uint64_t v352;
  id v353;
  uint64_t v354;
  id v355;
  uint64_t v356;
  id v357;
  uint64_t v358;
  id v359;
  uint64_t v360;
  id v361;
  uint64_t v362;
  id v363;
  uint64_t v364;
  id v365;
  uint64_t v366;
  id v367;
  uint64_t v368;
  id v369;
  uint64_t v370;
  id v371;
  uint64_t v372;
  id v373;
  uint64_t v374;
  id v375;
  uint64_t v376;
  id v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  id v381;
  uint64_t v382;
  id v383;
  uint64_t v384;
  id v385;
  uint64_t v386;
  id v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  void *v391;
  uint64_t v392;
  _QWORD v393[3];

  v393[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("systemBuild"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v331 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v331 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dataSharingOptInStatus"));
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v333 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v333;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewInterface"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v330 = v8;
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v328 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v328 = v8;
LABEL_10:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("audioInterfaceVendorId"));
        v9 = objc_claimAutoreleasedReturnValue();
        v329 = (void *)v9;
        if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = a4;
          v325 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = a4;
          v325 = v10;
LABEL_13:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("audioInterfaceProductId"));
          v12 = objc_claimAutoreleasedReturnValue();
          v327 = (void *)v12;
          if (!v12 || (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v326 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v326 = v13;
LABEL_16:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("asrLocation"));
            v14 = objc_claimAutoreleasedReturnValue();
            v324 = (void *)v14;
            if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v323 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v323 = v15;
LABEL_19:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nlLocation"));
              v16 = objc_claimAutoreleasedReturnValue();
              v322 = (void *)v16;
              if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v321 = 0;
LABEL_22:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v320 = v6;
                if (!v18)
                {
                  v319 = 0;
                  goto LABEL_42;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v319 = v18;
                  v18 = 0;
                  goto LABEL_42;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v75 = v18;
                  v335 = 0;
                  v76 = -[BMSiriOnDeviceDigestExperimentMetricsISOLocale initWithJSONDictionary:error:]([BMSiriOnDeviceDigestExperimentMetricsISOLocale alloc], "initWithJSONDictionary:error:", v75, &v335);
                  v77 = v335;
                  if (v77)
                  {
                    v78 = v77;
                    v73 = v325;
                    if (v11)
                      *v11 = objc_retainAutorelease(v77);

                    v25 = 0;
                    v18 = v76;
                    goto LABEL_274;
                  }
                  v319 = v18;

                  v18 = v76;
LABEL_42:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subDomain"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (!v11)
                      {
                        v25 = 0;
                        v73 = v325;
                        v75 = v319;
LABEL_273:

                        goto LABEL_274;
                      }
                      v97 = v11;
                      v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v99 = *MEMORY[0x1E0D025B8];
                      v376 = *MEMORY[0x1E0CB2D50];
                      v100 = v18;
                      v101 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v254 = objc_opt_class();
                      v102 = v101;
                      v18 = v100;
                      v317 = (id)objc_msgSend(v102, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v254, CFSTR("subDomain"));
                      v377 = v317;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v377, &v376, 1);
                      v318 = (void *)objc_claimAutoreleasedReturnValue();
                      v103 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2);
                      v25 = 0;
                      v11 = 0;
                      *v97 = v103;
                      v73 = v325;
                      v75 = v319;
                      v6 = v320;
                      goto LABEL_272;
                    }
                    v316 = v30;
                  }
                  else
                  {
                    v316 = 0;
                  }
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("responseCategory"));
                  v31 = objc_claimAutoreleasedReturnValue();
                  v318 = (void *)v31;
                  if (!v31 || (v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v317 = 0;
                    goto LABEL_48;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v317 = v32;
LABEL_48:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("experimentAllocationStatus"));
                    v33 = objc_claimAutoreleasedReturnValue();
                    v315 = (void *)v33;
                    if (!v33 || (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v314 = 0;
                      goto LABEL_51;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v314 = v34;
LABEL_51:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isTriggered"));
                      v35 = objc_claimAutoreleasedReturnValue();
                      v313 = (void *)v35;
                      if (!v35 || (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v312 = 0;
                        goto LABEL_54;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v312 = v36;
LABEL_54:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFirstTriggerOrAfterFirstTrigger"));
                        v37 = objc_claimAutoreleasedReturnValue();
                        v311 = (void *)v37;
                        if (!v37 || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v310 = 0;
                          goto LABEL_57;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v310 = v38;
LABEL_57:
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("codePathIdUUID"));
                          v39 = objc_claimAutoreleasedReturnValue();
                          v309 = (void *)v39;
                          if (!v39 || (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v308 = 0;
                            goto LABEL_60;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v308 = v40;
LABEL_60:
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalTurnCount"));
                            v41 = objc_claimAutoreleasedReturnValue();
                            v307 = (void *)v41;
                            if (!v41 || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v306 = 0;
                              goto LABEL_63;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v306 = v42;
LABEL_63:
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("validTurnCount"));
                              v43 = objc_claimAutoreleasedReturnValue();
                              v305 = (void *)v43;
                              if (!v43 || (v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v304 = 0;
                                goto LABEL_66;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v304 = v44;
LABEL_66:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("siriTasksStarted"));
                                v45 = objc_claimAutoreleasedReturnValue();
                                v303 = (void *)v45;
                                if (!v45 || (v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v302 = 0;
                                  goto LABEL_69;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v302 = v46;
LABEL_69:
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("siriTasksCompleted"));
                                  v47 = objc_claimAutoreleasedReturnValue();
                                  v300 = (void *)v47;
                                  if (!v47
                                    || (v48 = (void *)v47, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v301 = 0;
                                    goto LABEL_72;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v301 = v48;
LABEL_72:
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flowTasksStarted"));
                                    v49 = objc_claimAutoreleasedReturnValue();
                                    v298 = (void *)v49;
                                    if (!v49
                                      || (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v299 = 0;
                                      goto LABEL_75;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v299 = v50;
LABEL_75:
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flowTasksCompleted"));
                                      v51 = objc_claimAutoreleasedReturnValue();
                                      v296 = (void *)v51;
                                      if (!v51
                                        || (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v297 = 0;
                                        goto LABEL_78;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v297 = v52;
LABEL_78:
                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reliabilityRequestCount"));
                                        v53 = objc_claimAutoreleasedReturnValue();
                                        v294 = (void *)v53;
                                        if (!v53
                                          || (v54 = (void *)v53, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v295 = 0;
                                          goto LABEL_81;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v295 = v54;
LABEL_81:
                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reliabilityTurnCount"));
                                          v55 = objc_claimAutoreleasedReturnValue();
                                          v292 = (void *)v55;
                                          if (!v55
                                            || (v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v293 = 0;
                                            goto LABEL_84;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v293 = v56;
LABEL_84:
                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientErrorCount"));
                                            v57 = objc_claimAutoreleasedReturnValue();
                                            v290 = (void *)v57;
                                            if (!v57
                                              || (v58 = (void *)v57,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v291 = 0;
                                              goto LABEL_87;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v291 = v58;
LABEL_87:
                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("undesiredResponseCount"));
                                              v59 = objc_claimAutoreleasedReturnValue();
                                              v288 = (void *)v59;
                                              if (!v59
                                                || (v60 = (void *)v59,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v289 = 0;
                                                goto LABEL_90;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v289 = v60;
LABEL_90:
                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fatalResponseCount"));
                                                v61 = objc_claimAutoreleasedReturnValue();
                                                v285 = (void *)v61;
                                                if (!v61
                                                  || (v62 = (void *)v61,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v286 = 0;
                                                  goto LABEL_93;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v286 = v62;
LABEL_93:
                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("failureResponseCount"));
                                                  v63 = objc_claimAutoreleasedReturnValue();
                                                  v284 = (void *)v63;
                                                  if (!v63
                                                    || (v64 = (void *)v63,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v287 = 0;
LABEL_96:
                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("siriUnavailableResponseCount"));
                                                    v65 = (id)objc_claimAutoreleasedReturnValue();
                                                    v282 = v65;
                                                    if (!v65)
                                                      goto LABEL_211;
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v65 = 0;
                                                      goto LABEL_211;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v65 = v65;
LABEL_211:
                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("usdxSessionCount"));
                                                      v195 = objc_claimAutoreleasedReturnValue();
                                                      v280 = (void *)v195;
                                                      v281 = v65;
                                                      if (!v195
                                                        || (v196 = (void *)v195,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v283 = 0;
                                                        goto LABEL_214;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v283 = v196;
LABEL_214:
                                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tuples"));
                                                        v197 = objc_claimAutoreleasedReturnValue();
                                                        v279 = (void *)v197;
                                                        if (!v197
                                                          || (v198 = (void *)v197,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v199 = 0;
                                                          v73 = v325;
                                                          v200 = v287;
LABEL_217:
                                                          v275 = v65;
                                                          v287 = v200;
                                                          v11 = v316;
                                                          v201 = v199;
                                                          v25 = objc_retain(-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest initWithSystemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:subDomain:responseCategory:experimentAllocationStatus:isTriggered:isFirstTriggerOrAfterFirstTrigger:codePathIdUUID:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:usdxSessionCount:tuples:](self, "initWithSystemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:subDomain:responseCategory:experimentAllocationStatus:isTriggered:isFirstTriggerOrAfterFirstTrigger:codePathIdUUID:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:usdxSessionCount:tuples:", v331, v7, v328, v73, v326, v323,
                                                                    v321,
                                                                    v18,
                                                                    v316,
                                                                    v317,
                                                                    v314,
                                                                    v312,
                                                                    v310,
                                                                    v308,
                                                                    v306,
                                                                    v304,
                                                                    v302,
                                                                    v301,
                                                                    v299,
                                                                    v297,
                                                                    v295,
                                                                    v293,
                                                                    v291,
                                                                    v289,
                                                                    v286,
                                                                    v200,
                                                                    v275,
                                                                    v283,
                                                                    v199));
                                                          self = v25;
                                                          v75 = v319;
LABEL_252:

                                                          v6 = v320;
LABEL_253:

LABEL_254:
LABEL_255:

LABEL_256:
LABEL_257:

LABEL_258:
                                                          goto LABEL_259;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v216 = v198;
                                                          v334 = 0;
                                                          v277 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples initWithJSONDictionary:error:]([BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples alloc], "initWithJSONDictionary:error:", v216, &v334);
                                                          v217 = v334;
                                                          v73 = v325;
                                                          if (v217)
                                                          {
                                                            v218 = v217;
                                                            if (v11)
                                                              *v11 = objc_retainAutorelease(v217);

                                                            v25 = 0;
                                                            v279 = v216;
                                                            v75 = v319;
                                                            v11 = v316;
                                                            v201 = v277;
                                                            goto LABEL_252;
                                                          }

                                                          v200 = v287;
                                                          v199 = v277;
                                                          goto LABEL_217;
                                                        }
                                                        if (!v11)
                                                        {
                                                          v25 = 0;
                                                          v73 = v325;
                                                          v75 = v319;
                                                          v6 = v320;
                                                          v11 = v316;
                                                          goto LABEL_253;
                                                        }
                                                        v247 = v11;
                                                        v278 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v276 = *MEMORY[0x1E0D025B8];
                                                        v336 = *MEMORY[0x1E0CB2D50];
                                                        v248 = v18;
                                                        v249 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                        v274 = objc_opt_class();
                                                        v250 = v249;
                                                        v18 = v248;
                                                        v201 = (void *)objc_msgSend(v250, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v274, CFSTR("tuples"));
                                                        v337 = v201;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v337, &v336, 1);
                                                        v251 = (void *)objc_claimAutoreleasedReturnValue();
                                                        *v247 = (id)objc_msgSend(v278, "initWithDomain:code:userInfo:", v276, 2, v251);

                                                        v25 = 0;
LABEL_251:
                                                        v73 = v325;
                                                        v75 = v319;
                                                        v11 = v316;
                                                        goto LABEL_252;
                                                      }
                                                      if (v11)
                                                      {
                                                        v240 = v11;
                                                        v241 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v242 = *MEMORY[0x1E0D025B8];
                                                        v338 = *MEMORY[0x1E0CB2D50];
                                                        v243 = v18;
                                                        v244 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                        v273 = objc_opt_class();
                                                        v245 = v244;
                                                        v18 = v243;
                                                        v279 = (void *)objc_msgSend(v245, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v273, CFSTR("usdxSessionCount"));
                                                        v339 = v279;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v339, &v338, 1);
                                                        v201 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v246 = (id)objc_msgSend(v241, "initWithDomain:code:userInfo:", v242, 2, v201);
                                                        v25 = 0;
                                                        v283 = 0;
                                                        *v240 = v246;
                                                        goto LABEL_251;
                                                      }
                                                      v283 = 0;
                                                      v25 = 0;
LABEL_292:
                                                      v73 = v325;
                                                      v75 = v319;
                                                      v6 = v320;
                                                      v11 = v316;
                                                      goto LABEL_254;
                                                    }
                                                    if (v11)
                                                    {
                                                      v233 = v11;
                                                      v234 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v235 = *MEMORY[0x1E0D025B8];
                                                      v340 = *MEMORY[0x1E0CB2D50];
                                                      v236 = v18;
                                                      v237 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                      v272 = objc_opt_class();
                                                      v238 = v237;
                                                      v18 = v236;
                                                      v283 = (id)objc_msgSend(v238, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v272, CFSTR("siriUnavailableResponseCount"));
                                                      v341 = v283;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v341, &v340, 1);
                                                      v280 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v239 = (id)objc_msgSend(v234, "initWithDomain:code:userInfo:", v235, 2);
                                                      v25 = 0;
                                                      v281 = 0;
                                                      *v233 = v239;
                                                      goto LABEL_292;
                                                    }
                                                    v281 = 0;
                                                    v25 = 0;
LABEL_290:
                                                    v73 = v325;
                                                    v75 = v319;
                                                    v6 = v320;
                                                    v11 = v316;
                                                    goto LABEL_255;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v287 = v64;
                                                    goto LABEL_96;
                                                  }
                                                  if (v11)
                                                  {
                                                    v226 = v11;
                                                    v227 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v228 = *MEMORY[0x1E0D025B8];
                                                    v342 = *MEMORY[0x1E0CB2D50];
                                                    v229 = v18;
                                                    v230 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                    v271 = objc_opt_class();
                                                    v231 = v230;
                                                    v18 = v229;
                                                    v281 = (void *)objc_msgSend(v231, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v271, CFSTR("failureResponseCount"));
                                                    v343 = v281;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v343, &v342, 1);
                                                    v282 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v232 = (id)objc_msgSend(v227, "initWithDomain:code:userInfo:", v228, 2);
                                                    v25 = 0;
                                                    v287 = 0;
                                                    *v226 = v232;
                                                    goto LABEL_290;
                                                  }
                                                  v287 = 0;
                                                  v25 = 0;
LABEL_288:
                                                  v73 = v325;
                                                  v75 = v319;
                                                  v6 = v320;
                                                  v11 = v316;
                                                  goto LABEL_256;
                                                }
                                                if (v11)
                                                {
                                                  v219 = v11;
                                                  v220 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v221 = *MEMORY[0x1E0D025B8];
                                                  v344 = *MEMORY[0x1E0CB2D50];
                                                  v222 = v18;
                                                  v223 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v270 = objc_opt_class();
                                                  v224 = v223;
                                                  v18 = v222;
                                                  v287 = (id)objc_msgSend(v224, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v270, CFSTR("fatalResponseCount"));
                                                  v345 = v287;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v345, &v344, 1);
                                                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v225 = (id)objc_msgSend(v220, "initWithDomain:code:userInfo:", v221, 2);
                                                  v25 = 0;
                                                  v286 = 0;
                                                  *v219 = v225;
                                                  goto LABEL_288;
                                                }
                                                v286 = 0;
                                                v25 = 0;
LABEL_286:
                                                v73 = v325;
                                                v75 = v319;
                                                v6 = v320;
                                                v11 = v316;
                                                goto LABEL_257;
                                              }
                                              if (v11)
                                              {
                                                v209 = v11;
                                                v210 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v211 = *MEMORY[0x1E0D025B8];
                                                v346 = *MEMORY[0x1E0CB2D50];
                                                v212 = v18;
                                                v213 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v269 = objc_opt_class();
                                                v214 = v213;
                                                v18 = v212;
                                                v286 = (id)objc_msgSend(v214, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v269, CFSTR("undesiredResponseCount"));
                                                v347 = v286;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v347, &v346, 1);
                                                v285 = (void *)objc_claimAutoreleasedReturnValue();
                                                v215 = (id)objc_msgSend(v210, "initWithDomain:code:userInfo:", v211, 2);
                                                v25 = 0;
                                                v289 = 0;
                                                *v209 = v215;
                                                goto LABEL_286;
                                              }
                                              v289 = 0;
                                              v25 = 0;
LABEL_284:
                                              v73 = v325;
                                              v75 = v319;
                                              v6 = v320;
                                              v11 = v316;
                                              goto LABEL_258;
                                            }
                                            if (v11)
                                            {
                                              v202 = v11;
                                              v203 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v204 = *MEMORY[0x1E0D025B8];
                                              v348 = *MEMORY[0x1E0CB2D50];
                                              v205 = v18;
                                              v206 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v268 = objc_opt_class();
                                              v207 = v206;
                                              v18 = v205;
                                              v289 = (id)objc_msgSend(v207, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v268, CFSTR("clientErrorCount"));
                                              v349 = v289;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v349, &v348, 1);
                                              v288 = (void *)objc_claimAutoreleasedReturnValue();
                                              v208 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v204, 2);
                                              v25 = 0;
                                              v291 = 0;
                                              *v202 = v208;
                                              goto LABEL_284;
                                            }
                                            v291 = 0;
                                            v25 = 0;
LABEL_248:
                                            v73 = v325;
                                            v75 = v319;
                                            v6 = v320;
                                            v11 = v316;
LABEL_259:

                                            goto LABEL_260;
                                          }
                                          if (v11)
                                          {
                                            v188 = v11;
                                            v189 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v190 = *MEMORY[0x1E0D025B8];
                                            v350 = *MEMORY[0x1E0CB2D50];
                                            v191 = v18;
                                            v192 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v267 = objc_opt_class();
                                            v193 = v192;
                                            v18 = v191;
                                            v291 = (id)objc_msgSend(v193, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v267, CFSTR("reliabilityTurnCount"));
                                            v351 = v291;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v351, &v350, 1);
                                            v290 = (void *)objc_claimAutoreleasedReturnValue();
                                            v194 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v190, 2);
                                            v25 = 0;
                                            v293 = 0;
                                            *v188 = v194;
                                            goto LABEL_248;
                                          }
                                          v293 = 0;
                                          v25 = 0;
LABEL_244:
                                          v73 = v325;
                                          v75 = v319;
                                          v6 = v320;
                                          v11 = v316;
LABEL_260:

                                          goto LABEL_261;
                                        }
                                        if (v11)
                                        {
                                          v181 = v11;
                                          v182 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v183 = *MEMORY[0x1E0D025B8];
                                          v352 = *MEMORY[0x1E0CB2D50];
                                          v184 = v18;
                                          v185 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v266 = objc_opt_class();
                                          v186 = v185;
                                          v18 = v184;
                                          v293 = (id)objc_msgSend(v186, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v266, CFSTR("reliabilityRequestCount"));
                                          v353 = v293;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v353, &v352, 1);
                                          v292 = (void *)objc_claimAutoreleasedReturnValue();
                                          v187 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v183, 2);
                                          v25 = 0;
                                          v295 = 0;
                                          *v181 = v187;
                                          goto LABEL_244;
                                        }
                                        v295 = 0;
                                        v25 = 0;
LABEL_240:
                                        v73 = v325;
                                        v75 = v319;
                                        v6 = v320;
                                        v11 = v316;
LABEL_261:

                                        goto LABEL_262;
                                      }
                                      if (v11)
                                      {
                                        v174 = v11;
                                        v175 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v176 = *MEMORY[0x1E0D025B8];
                                        v354 = *MEMORY[0x1E0CB2D50];
                                        v177 = v18;
                                        v178 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v265 = objc_opt_class();
                                        v179 = v178;
                                        v18 = v177;
                                        v295 = (id)objc_msgSend(v179, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v265, CFSTR("flowTasksCompleted"));
                                        v355 = v295;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v355, &v354, 1);
                                        v294 = (void *)objc_claimAutoreleasedReturnValue();
                                        v180 = (id)objc_msgSend(v175, "initWithDomain:code:userInfo:", v176, 2);
                                        v25 = 0;
                                        v297 = 0;
                                        *v174 = v180;
                                        goto LABEL_240;
                                      }
                                      v297 = 0;
                                      v25 = 0;
LABEL_236:
                                      v73 = v325;
                                      v75 = v319;
                                      v6 = v320;
                                      v11 = v316;
LABEL_262:

                                      goto LABEL_263;
                                    }
                                    if (v11)
                                    {
                                      v167 = v11;
                                      v168 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v169 = *MEMORY[0x1E0D025B8];
                                      v356 = *MEMORY[0x1E0CB2D50];
                                      v170 = v18;
                                      v171 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v264 = objc_opt_class();
                                      v172 = v171;
                                      v18 = v170;
                                      v297 = (id)objc_msgSend(v172, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v264, CFSTR("flowTasksStarted"));
                                      v357 = v297;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v357, &v356, 1);
                                      v296 = (void *)objc_claimAutoreleasedReturnValue();
                                      v173 = (id)objc_msgSend(v168, "initWithDomain:code:userInfo:", v169, 2);
                                      v25 = 0;
                                      v299 = 0;
                                      *v167 = v173;
                                      goto LABEL_236;
                                    }
                                    v299 = 0;
                                    v25 = 0;
LABEL_227:
                                    v73 = v325;
                                    v75 = v319;
                                    v6 = v320;
                                    v11 = v316;
LABEL_263:

                                    goto LABEL_264;
                                  }
                                  if (v11)
                                  {
                                    v160 = v11;
                                    v161 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v162 = *MEMORY[0x1E0D025B8];
                                    v358 = *MEMORY[0x1E0CB2D50];
                                    v163 = v18;
                                    v164 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v263 = objc_opt_class();
                                    v165 = v164;
                                    v18 = v163;
                                    v299 = (id)objc_msgSend(v165, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v263, CFSTR("siriTasksCompleted"));
                                    v359 = v299;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v359, &v358, 1);
                                    v298 = (void *)objc_claimAutoreleasedReturnValue();
                                    v166 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v162, 2);
                                    v25 = 0;
                                    v301 = 0;
                                    *v160 = v166;
                                    goto LABEL_227;
                                  }
                                  v301 = 0;
                                  v25 = 0;
LABEL_221:
                                  v73 = v325;
                                  v75 = v319;
                                  v6 = v320;
                                  v11 = v316;
LABEL_264:

                                  goto LABEL_265;
                                }
                                if (v11)
                                {
                                  v153 = v11;
                                  v154 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v155 = *MEMORY[0x1E0D025B8];
                                  v360 = *MEMORY[0x1E0CB2D50];
                                  v156 = v18;
                                  v157 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v262 = objc_opt_class();
                                  v158 = v157;
                                  v18 = v156;
                                  v301 = (id)objc_msgSend(v158, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v262, CFSTR("siriTasksStarted"));
                                  v361 = v301;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v361, &v360, 1);
                                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                                  v159 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v155, 2);
                                  v25 = 0;
                                  v302 = 0;
                                  *v153 = v159;
                                  goto LABEL_221;
                                }
                                v302 = 0;
                                v25 = 0;
LABEL_208:
                                v73 = v325;
                                v75 = v319;
                                v6 = v320;
                                v11 = v316;
LABEL_265:

                                goto LABEL_266;
                              }
                              if (v11)
                              {
                                v146 = v11;
                                v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v148 = *MEMORY[0x1E0D025B8];
                                v362 = *MEMORY[0x1E0CB2D50];
                                v149 = v18;
                                v150 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v261 = objc_opt_class();
                                v151 = v150;
                                v18 = v149;
                                v302 = (id)objc_msgSend(v151, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v261, CFSTR("validTurnCount"));
                                v363 = v302;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v363, &v362, 1);
                                v303 = (void *)objc_claimAutoreleasedReturnValue();
                                v152 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v148, 2);
                                v25 = 0;
                                v304 = 0;
                                *v146 = v152;
                                goto LABEL_208;
                              }
                              v304 = 0;
                              v25 = 0;
LABEL_202:
                              v73 = v325;
                              v75 = v319;
                              v6 = v320;
                              v11 = v316;
LABEL_266:

                              goto LABEL_267;
                            }
                            if (v11)
                            {
                              v139 = v11;
                              v140 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v141 = *MEMORY[0x1E0D025B8];
                              v364 = *MEMORY[0x1E0CB2D50];
                              v142 = v18;
                              v143 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v260 = objc_opt_class();
                              v144 = v143;
                              v18 = v142;
                              v304 = (id)objc_msgSend(v144, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v260, CFSTR("totalTurnCount"));
                              v365 = v304;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v365, &v364, 1);
                              v305 = (void *)objc_claimAutoreleasedReturnValue();
                              v145 = (id)objc_msgSend(v140, "initWithDomain:code:userInfo:", v141, 2);
                              v25 = 0;
                              v306 = 0;
                              *v139 = v145;
                              goto LABEL_202;
                            }
                            v306 = 0;
                            v25 = 0;
LABEL_196:
                            v73 = v325;
                            v75 = v319;
                            v6 = v320;
                            v11 = v316;
LABEL_267:

                            goto LABEL_268;
                          }
                          if (v11)
                          {
                            v132 = v11;
                            v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v134 = *MEMORY[0x1E0D025B8];
                            v366 = *MEMORY[0x1E0CB2D50];
                            v135 = v18;
                            v136 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v259 = objc_opt_class();
                            v137 = v136;
                            v18 = v135;
                            v306 = (id)objc_msgSend(v137, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v259, CFSTR("codePathIdUUID"));
                            v367 = v306;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v367, &v366, 1);
                            v307 = (void *)objc_claimAutoreleasedReturnValue();
                            v138 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v134, 2);
                            v25 = 0;
                            v308 = 0;
                            *v132 = v138;
                            goto LABEL_196;
                          }
                          v308 = 0;
                          v25 = 0;
LABEL_190:
                          v73 = v325;
                          v75 = v319;
                          v6 = v320;
                          v11 = v316;
LABEL_268:

                          goto LABEL_269;
                        }
                        if (v11)
                        {
                          v125 = v11;
                          v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v127 = *MEMORY[0x1E0D025B8];
                          v368 = *MEMORY[0x1E0CB2D50];
                          v128 = v18;
                          v129 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v258 = objc_opt_class();
                          v130 = v129;
                          v18 = v128;
                          v308 = (id)objc_msgSend(v130, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v258, CFSTR("isFirstTriggerOrAfterFirstTrigger"));
                          v369 = v308;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v369, &v368, 1);
                          v309 = (void *)objc_claimAutoreleasedReturnValue();
                          v131 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v127, 2);
                          v25 = 0;
                          v310 = 0;
                          *v125 = v131;
                          goto LABEL_190;
                        }
                        v310 = 0;
                        v25 = 0;
LABEL_184:
                        v73 = v325;
                        v75 = v319;
                        v6 = v320;
                        v11 = v316;
LABEL_269:

                        goto LABEL_270;
                      }
                      if (v11)
                      {
                        v118 = v11;
                        v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v120 = *MEMORY[0x1E0D025B8];
                        v370 = *MEMORY[0x1E0CB2D50];
                        v121 = v18;
                        v122 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v257 = objc_opt_class();
                        v123 = v122;
                        v18 = v121;
                        v310 = (id)objc_msgSend(v123, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v257, CFSTR("isTriggered"));
                        v371 = v310;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v371, &v370, 1);
                        v311 = (void *)objc_claimAutoreleasedReturnValue();
                        v124 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v120, 2);
                        v25 = 0;
                        v312 = 0;
                        *v118 = v124;
                        goto LABEL_184;
                      }
                      v312 = 0;
                      v25 = 0;
LABEL_178:
                      v73 = v325;
                      v75 = v319;
                      v6 = v320;
                      v11 = v316;
LABEL_270:

                      goto LABEL_271;
                    }
                    if (v11)
                    {
                      v111 = v11;
                      v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v113 = *MEMORY[0x1E0D025B8];
                      v372 = *MEMORY[0x1E0CB2D50];
                      v114 = v18;
                      v115 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v256 = objc_opt_class();
                      v116 = v115;
                      v18 = v114;
                      v312 = (id)objc_msgSend(v116, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v256, CFSTR("experimentAllocationStatus"));
                      v373 = v312;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v373, &v372, 1);
                      v313 = (void *)objc_claimAutoreleasedReturnValue();
                      v117 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
                      v25 = 0;
                      v314 = 0;
                      *v111 = v117;
                      goto LABEL_178;
                    }
                    v314 = 0;
                    v25 = 0;
LABEL_172:
                    v73 = v325;
                    v75 = v319;
                    v6 = v320;
                    v11 = v316;
LABEL_271:

                    goto LABEL_272;
                  }
                  if (v11)
                  {
                    v104 = v11;
                    v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v106 = *MEMORY[0x1E0D025B8];
                    v374 = *MEMORY[0x1E0CB2D50];
                    v107 = v18;
                    v108 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v255 = objc_opt_class();
                    v109 = v108;
                    v18 = v107;
                    v314 = (id)objc_msgSend(v109, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v255, CFSTR("responseCategory"));
                    v375 = v314;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v375, &v374, 1);
                    v315 = (void *)objc_claimAutoreleasedReturnValue();
                    v110 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v106, 2);
                    v25 = 0;
                    v317 = 0;
                    *v104 = v110;
                    goto LABEL_172;
                  }
                  v317 = 0;
                  v25 = 0;
                  v73 = v325;
                  v75 = v319;
                  v6 = v320;
                  v11 = v316;
LABEL_272:

                  goto LABEL_273;
                }
                v91 = v18;
                if (!v11)
                {
                  v25 = 0;
                  v73 = v325;
                  v75 = v18;
                  v6 = v320;
LABEL_275:

                  v28 = v328;
                  goto LABEL_276;
                }
                v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v93 = *MEMORY[0x1E0D025B8];
                v378 = *MEMORY[0x1E0CB2D50];
                v94 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("siriInputLocale"));
                v379 = v94;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v379, &v378, 1);
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = v93;
                v18 = (void *)v94;
                *v11 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v96, 2, v95);

                v25 = 0;
                v75 = v91;
                v73 = v325;
                v6 = v320;
LABEL_274:

                goto LABEL_275;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v321 = v17;
                goto LABEL_22;
              }
              if (v11)
              {
                v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v89 = *MEMORY[0x1E0D025B8];
                v380 = *MEMORY[0x1E0CB2D50];
                v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("nlLocation"));
                v381 = v75;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v381, &v380, 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2, v18);
                v25 = 0;
                v321 = 0;
                *v11 = v90;
                v73 = v325;
                goto LABEL_274;
              }
              v321 = 0;
              v25 = 0;
LABEL_150:
              v28 = v328;
              v73 = v325;
LABEL_276:

              goto LABEL_277;
            }
            if (v11)
            {
              v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v86 = *MEMORY[0x1E0D025B8];
              v382 = *MEMORY[0x1E0CB2D50];
              v321 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("asrLocation"));
              v383 = v321;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v383, &v382, 1);
              v322 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, 2);
              v25 = 0;
              v323 = 0;
              *v11 = v87;
              goto LABEL_150;
            }
            v323 = 0;
            v25 = 0;
LABEL_144:
            v28 = v328;
            v73 = v325;
LABEL_277:

            goto LABEL_278;
          }
          if (v11)
          {
            v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v83 = *MEMORY[0x1E0D025B8];
            v384 = *MEMORY[0x1E0CB2D50];
            v323 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("audioInterfaceProductId"));
            v385 = v323;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v385, &v384, 1);
            v324 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2);
            v25 = 0;
            v326 = 0;
            *v11 = v84;
            goto LABEL_144;
          }
          v326 = 0;
          v25 = 0;
          v28 = v328;
          v73 = v325;
LABEL_278:

          goto LABEL_279;
        }
        if (a4)
        {
          v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v80 = *MEMORY[0x1E0D025B8];
          v386 = *MEMORY[0x1E0CB2D50];
          v326 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("audioInterfaceVendorId"));
          v387 = v326;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v387, &v386, 1);
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2);
          v25 = 0;
          v73 = 0;
          *a4 = v81;
          v28 = v328;
          goto LABEL_278;
        }
        v73 = 0;
        v25 = 0;
        v28 = v328;
LABEL_279:

        goto LABEL_280;
      }
      if (a4)
      {
        v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v67 = *MEMORY[0x1E0D025B8];
        v388 = *MEMORY[0x1E0CB2D50];
        v68 = objc_alloc(MEMORY[0x1E0CB3940]);
        v253 = objc_opt_class();
        v69 = v68;
        v8 = v330;
        v70 = objc_msgSend(v69, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v253, CFSTR("viewInterface"));
        v389 = v70;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v389, &v388, 1);
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = v67;
        v73 = (void *)v70;
        v329 = (void *)v71;
        v74 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v72, 2);
        v25 = 0;
        v28 = 0;
        *a4 = v74;
        goto LABEL_279;
      }
      v28 = 0;
      v25 = 0;
LABEL_280:

      goto LABEL_281;
    }
    if (a4)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0D025B8];
      v390 = *MEMORY[0x1E0CB2D50];
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("dataSharingOptInStatus"));
      v391 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v391, &v390, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v8);
      v25 = 0;
      v7 = 0;
      *a4 = v29;
      goto LABEL_280;
    }
    v7 = 0;
    v25 = 0;
LABEL_281:

    goto LABEL_282;
  }
  if (a4)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0D025B8];
    v392 = *MEMORY[0x1E0CB2D50];
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("systemBuild"));
    v393[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v393, &v392, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v20;
    v7 = (id)v21;
    v333 = (void *)v22;
    v24 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v23, 2);
    v25 = 0;
    v331 = 0;
    *a4 = v24;
    goto LABEL_281;
  }
  v25 = 0;
  v331 = 0;
LABEL_282:

  return v25;
}

- (id)jsonDictionary
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  _QWORD v97[29];
  _QWORD v98[31];

  v98[29] = *MEMORY[0x1E0C80C00];
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest systemBuild](self, "systemBuild");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasDataSharingOptInStatus](self, "hasDataSharingOptInStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest dataSharingOptInStatus](self, "dataSharingOptInStatus"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasViewInterface](self, "hasViewInterface"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest viewInterface](self, "viewInterface"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceVendorId](self, "audioInterfaceVendorId");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceProductId](self, "audioInterfaceProductId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasAsrLocation](self, "hasAsrLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest asrLocation](self, "asrLocation"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasNlLocation](self, "hasNlLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest nlLocation](self, "nlLocation"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriInputLocale](self, "siriInputLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest subDomain](self, "subDomain");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasResponseCategory](self, "hasResponseCategory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest responseCategory](self, "responseCategory"));
    v94 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v94 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasExperimentAllocationStatus](self, "hasExperimentAllocationStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest experimentAllocationStatus](self, "experimentAllocationStatus"));
    v93 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v93 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsTriggered](self, "hasIsTriggered"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isTriggered](self, "isTriggered"));
    v92 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v92 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsFirstTriggerOrAfterFirstTrigger](self, "hasIsFirstTriggerOrAfterFirstTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger"));
    v91 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v91 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest codePathIdUUID](self, "codePathIdUUID");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasTotalTurnCount](self, "hasTotalTurnCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest totalTurnCount](self, "totalTurnCount"));
    v89 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v89 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasValidTurnCount](self, "hasValidTurnCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest validTurnCount](self, "validTurnCount"));
    v88 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v88 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriTasksStarted](self, "hasSiriTasksStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksStarted](self, "siriTasksStarted"));
    v87 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v87 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriTasksCompleted](self, "hasSiriTasksCompleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksCompleted](self, "siriTasksCompleted"));
    v86 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v86 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFlowTasksStarted](self, "hasFlowTasksStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksStarted](self, "flowTasksStarted"));
    v85 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v85 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFlowTasksCompleted](self, "hasFlowTasksCompleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksCompleted](self, "flowTasksCompleted"));
    v84 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v84 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityRequestCount](self, "hasReliabilityRequestCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityRequestCount](self, "reliabilityRequestCount"));
    v83 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v83 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityTurnCount](self, "hasReliabilityTurnCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityTurnCount](self, "reliabilityTurnCount"));
    v82 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v82 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasClientErrorCount](self, "hasClientErrorCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest clientErrorCount](self, "clientErrorCount"));
    v81 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v81 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasUndesiredResponseCount](self, "hasUndesiredResponseCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest undesiredResponseCount](self, "undesiredResponseCount"));
    v80 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFatalResponseCount](self, "hasFatalResponseCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest fatalResponseCount](self, "fatalResponseCount"));
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v79 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFailureResponseCount](self, "hasFailureResponseCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest failureResponseCount](self, "failureResponseCount"));
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v78 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriUnavailableResponseCount](self, "hasSiriUnavailableResponseCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
    v77 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v77 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasUsdxSessionCount](self, "hasUsdxSessionCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest usdxSessionCount](self, "usdxSessionCount"));
    v76 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest tuples](self, "tuples");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDictionary");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v97[0] = CFSTR("systemBuild");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v12;
  v98[0] = v12;
  v97[1] = CFSTR("dataSharingOptInStatus");
  v13 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v13;
  v98[1] = v13;
  v97[2] = CFSTR("viewInterface");
  v14 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v14;
  v98[2] = v14;
  v97[3] = CFSTR("audioInterfaceVendorId");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v15;
  v98[3] = v15;
  v97[4] = CFSTR("audioInterfaceProductId");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v16;
  v98[4] = v16;
  v97[5] = CFSTR("asrLocation");
  v17 = (uint64_t)v8;
  v18 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v5;
  v60 = (void *)v17;
  v98[5] = v17;
  v97[6] = CFSTR("nlLocation");
  v20 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v6;
  v59 = (void *)v20;
  v98[6] = v20;
  v97[7] = CFSTR("siriInputLocale");
  v22 = v96;
  if (!v96)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v98[7] = v22;
  v97[8] = CFSTR("subDomain");
  v23 = (uint64_t)v95;
  if (!v95)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v98[8] = v23;
  v97[9] = CFSTR("responseCategory");
  v24 = (uint64_t)v94;
  if (!v94)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v24;
  v98[9] = v24;
  v97[10] = CFSTR("experimentAllocationStatus");
  v25 = (uint64_t)v93;
  if (!v93)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v25;
  v98[10] = v25;
  v97[11] = CFSTR("isTriggered");
  v26 = (uint64_t)v92;
  if (!v92)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v26;
  v98[11] = v26;
  v97[12] = CFSTR("isFirstTriggerOrAfterFirstTrigger");
  v27 = (uint64_t)v91;
  if (!v91)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v27;
  v98[12] = v27;
  v97[13] = CFSTR("codePathIdUUID");
  v29 = (uint64_t)v90;
  if (!v90)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v29;
  v98[13] = v29;
  v97[14] = CFSTR("totalTurnCount");
  v30 = (uint64_t)v89;
  if (!v89)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v30;
  v98[14] = v30;
  v97[15] = CFSTR("validTurnCount");
  v31 = (uint64_t)v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v31;
  v98[15] = v31;
  v97[16] = CFSTR("siriTasksStarted");
  v32 = (uint64_t)v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v32;
  v98[16] = v32;
  v97[17] = CFSTR("siriTasksCompleted");
  v33 = (uint64_t)v86;
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v33;
  v98[17] = v33;
  v97[18] = CFSTR("flowTasksStarted");
  v34 = (uint64_t)v85;
  if (!v85)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v34;
  v98[18] = v34;
  v97[19] = CFSTR("flowTasksCompleted");
  v35 = (uint64_t)v84;
  if (!v84)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v7;
  v50 = (void *)v35;
  v98[19] = v35;
  v97[20] = CFSTR("reliabilityRequestCount");
  v36 = (uint64_t)v83;
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v3;
  v49 = (void *)v36;
  v98[20] = v36;
  v97[21] = CFSTR("reliabilityTurnCount");
  v37 = (uint64_t)v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v73 = v4;
  v47 = v37;
  v98[21] = v37;
  v97[22] = CFSTR("clientErrorCount");
  v38 = v81;
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v37, v49, v50, v51, v52, v53, v54, v55, v56, v57);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v23;
  v72 = v21;
  v98[22] = v38;
  v97[23] = CFSTR("undesiredResponseCount");
  v39 = v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v70 = v9;
  v67 = v18;
  v98[23] = v39;
  v97[24] = CFSTR("fatalResponseCount");
  v40 = v79;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v98[24] = v40;
  v97[25] = CFSTR("failureResponseCount");
  v41 = v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v98[25] = v41;
  v97[26] = CFSTR("siriUnavailableResponseCount");
  v42 = v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v98[26] = v42;
  v97[27] = CFSTR("usdxSessionCount");
  v43 = v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v98[27] = v43;
  v97[28] = CFSTR("tuples");
  v44 = v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v98[28] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 29, v47);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  if (!v75)

  v45 = v28;
  if (!v76)
  {

    v45 = v28;
  }
  if (!v77)
  {

    v45 = v28;
  }
  if (!v78)
  {

    v45 = v28;
  }
  if (!v79)
  {

    v45 = v28;
  }
  if (!v80)
  {

    v45 = v28;
  }
  if (!v81)
  {

    v45 = v28;
  }
  if (!v82)
  {

    v45 = v28;
  }
  if (!v83)
  {

    v45 = v28;
  }
  if (!v84)
  {

    v45 = v28;
  }
  if (!v85)
  {

    v45 = v28;
  }
  if (!v86)
  {

    v45 = v28;
  }
  if (!v87)
  {

    v45 = v28;
  }
  if (!v88)
  {

    v45 = v28;
  }
  if (!v89)
  {

    v45 = v28;
  }
  if (!v90)
  {

    v45 = v28;
  }
  if (!v91)

  if (!v92)
  if (!v93)

  if (!v94)
  if (!v95)

  if (v96)
  {
    if (v70)
      goto LABEL_169;
  }
  else
  {

    if (v70)
    {
LABEL_169:
      if (v67)
        goto LABEL_170;
      goto LABEL_178;
    }
  }

  if (v67)
  {
LABEL_170:
    if (v71)
      goto LABEL_171;
    goto LABEL_179;
  }
LABEL_178:

  if (v71)
  {
LABEL_171:
    if (v72)
      goto LABEL_172;
    goto LABEL_180;
  }
LABEL_179:

  if (v72)
  {
LABEL_172:
    if (v19)
      goto LABEL_173;
    goto LABEL_181;
  }
LABEL_180:

  if (v19)
  {
LABEL_173:
    if (v73)
      goto LABEL_174;
LABEL_182:

    if (v74)
      goto LABEL_175;
LABEL_183:

    goto LABEL_175;
  }
LABEL_181:

  if (!v73)
    goto LABEL_182;
LABEL_174:
  if (!v74)
    goto LABEL_183;
LABEL_175:

  return v66;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest systemBuild](self, "systemBuild");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemBuild");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest systemBuild](self, "systemBuild");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemBuild");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasDataSharingOptInStatus](self, "hasDataSharingOptInStatus")|| objc_msgSend(v5, "hasDataSharingOptInStatus"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasDataSharingOptInStatus](self, "hasDataSharingOptInStatus"))goto LABEL_139;
      if (!objc_msgSend(v5, "hasDataSharingOptInStatus"))
        goto LABEL_139;
      v13 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest dataSharingOptInStatus](self, "dataSharingOptInStatus");
      if (v13 != objc_msgSend(v5, "dataSharingOptInStatus"))
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasViewInterface](self, "hasViewInterface")
      || objc_msgSend(v5, "hasViewInterface"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasViewInterface](self, "hasViewInterface"))
        goto LABEL_139;
      if (!objc_msgSend(v5, "hasViewInterface"))
        goto LABEL_139;
      v14 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest viewInterface](self, "viewInterface");
      if (v14 != objc_msgSend(v5, "viewInterface"))
        goto LABEL_139;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceVendorId](self, "audioInterfaceVendorId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioInterfaceVendorId");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceVendorId](self, "audioInterfaceVendorId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "audioInterfaceVendorId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_139;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceProductId](self, "audioInterfaceProductId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioInterfaceProductId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest audioInterfaceProductId](self, "audioInterfaceProductId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "audioInterfaceProductId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasAsrLocation](self, "hasAsrLocation")
      || objc_msgSend(v5, "hasAsrLocation"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasAsrLocation](self, "hasAsrLocation"))
        goto LABEL_139;
      if (!objc_msgSend(v5, "hasAsrLocation"))
        goto LABEL_139;
      v27 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest asrLocation](self, "asrLocation");
      if (v27 != objc_msgSend(v5, "asrLocation"))
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasNlLocation](self, "hasNlLocation")
      || objc_msgSend(v5, "hasNlLocation"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasNlLocation](self, "hasNlLocation"))
        goto LABEL_139;
      if (!objc_msgSend(v5, "hasNlLocation"))
        goto LABEL_139;
      v28 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest nlLocation](self, "nlLocation");
      if (v28 != objc_msgSend(v5, "nlLocation"))
        goto LABEL_139;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriInputLocale](self, "siriInputLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriInputLocale");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v29 == (void *)v30)
    {

    }
    else
    {
      v31 = (void *)v30;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriInputLocale](self, "siriInputLocale");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriInputLocale");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if (!v34)
        goto LABEL_139;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest subDomain](self, "subDomain");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subDomain");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v35 == (void *)v36)
    {

    }
    else
    {
      v37 = (void *)v36;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest subDomain](self, "subDomain");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subDomain");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqual:", v39);

      if (!v40)
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasResponseCategory](self, "hasResponseCategory")
      || objc_msgSend(v5, "hasResponseCategory"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasResponseCategory](self, "hasResponseCategory"))
        goto LABEL_139;
      if (!objc_msgSend(v5, "hasResponseCategory"))
        goto LABEL_139;
      v41 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest responseCategory](self, "responseCategory");
      if (v41 != objc_msgSend(v5, "responseCategory"))
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasExperimentAllocationStatus](self, "hasExperimentAllocationStatus")|| objc_msgSend(v5, "hasExperimentAllocationStatus"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasExperimentAllocationStatus](self, "hasExperimentAllocationStatus"))goto LABEL_139;
      if (!objc_msgSend(v5, "hasExperimentAllocationStatus"))
        goto LABEL_139;
      v42 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest experimentAllocationStatus](self, "experimentAllocationStatus");
      if (v42 != objc_msgSend(v5, "experimentAllocationStatus"))
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsTriggered](self, "hasIsTriggered")
      || objc_msgSend(v5, "hasIsTriggered"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsTriggered](self, "hasIsTriggered"))
        goto LABEL_139;
      if (!objc_msgSend(v5, "hasIsTriggered"))
        goto LABEL_139;
      v43 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isTriggered](self, "isTriggered");
      if (v43 != objc_msgSend(v5, "isTriggered"))
        goto LABEL_139;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsFirstTriggerOrAfterFirstTrigger](self, "hasIsFirstTriggerOrAfterFirstTrigger")|| objc_msgSend(v5, "hasIsFirstTriggerOrAfterFirstTrigger"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsFirstTriggerOrAfterFirstTrigger](self, "hasIsFirstTriggerOrAfterFirstTrigger"))goto LABEL_139;
      if (!objc_msgSend(v5, "hasIsFirstTriggerOrAfterFirstTrigger"))
        goto LABEL_139;
      v44 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger");
      if (v44 != objc_msgSend(v5, "isFirstTriggerOrAfterFirstTrigger"))
        goto LABEL_139;
    }
    -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest codePathIdUUID](self, "codePathIdUUID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "codePathIdUUID");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v45 == (void *)v46)
    {

    }
    else
    {
      v47 = (void *)v46;
      -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest codePathIdUUID](self, "codePathIdUUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "codePathIdUUID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_139;
    }
    if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasTotalTurnCount](self, "hasTotalTurnCount")
      && !objc_msgSend(v5, "hasTotalTurnCount")
      || -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasTotalTurnCount](self, "hasTotalTurnCount")
      && objc_msgSend(v5, "hasTotalTurnCount")
      && (v51 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest totalTurnCount](self, "totalTurnCount"),
          v51 == objc_msgSend(v5, "totalTurnCount")))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasValidTurnCount](self, "hasValidTurnCount")
        && !objc_msgSend(v5, "hasValidTurnCount")
        || -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasValidTurnCount](self, "hasValidTurnCount")
        && objc_msgSend(v5, "hasValidTurnCount")
        && (v52 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest validTurnCount](self, "validTurnCount"),
            v52 == objc_msgSend(v5, "validTurnCount")))
      {
        if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriTasksStarted](self, "hasSiriTasksStarted")
          && !objc_msgSend(v5, "hasSiriTasksStarted")
          || -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriTasksStarted](self, "hasSiriTasksStarted")
          && objc_msgSend(v5, "hasSiriTasksStarted")
          && (v53 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksStarted](self, "siriTasksStarted"),
              v53 == objc_msgSend(v5, "siriTasksStarted")))
        {
          if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriTasksCompleted](self, "hasSiriTasksCompleted")&& !objc_msgSend(v5, "hasSiriTasksCompleted")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriTasksCompleted](self, "hasSiriTasksCompleted")&& objc_msgSend(v5, "hasSiriTasksCompleted")&& (v54 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksCompleted](self, "siriTasksCompleted"), v54 == objc_msgSend(v5, "siriTasksCompleted")))
          {
            if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFlowTasksStarted](self, "hasFlowTasksStarted")&& !objc_msgSend(v5, "hasFlowTasksStarted")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFlowTasksStarted](self, "hasFlowTasksStarted")&& objc_msgSend(v5, "hasFlowTasksStarted")&& (v55 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksStarted](self, "flowTasksStarted"), v55 == objc_msgSend(v5, "flowTasksStarted")))
            {
              if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFlowTasksCompleted](self, "hasFlowTasksCompleted")&& !objc_msgSend(v5, "hasFlowTasksCompleted")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFlowTasksCompleted](self, "hasFlowTasksCompleted")&& objc_msgSend(v5, "hasFlowTasksCompleted")&& (v56 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksCompleted](self, "flowTasksCompleted"), v56 == objc_msgSend(v5, "flowTasksCompleted")))
              {
                if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityRequestCount](self, "hasReliabilityRequestCount")&& !objc_msgSend(v5, "hasReliabilityRequestCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityRequestCount](self, "hasReliabilityRequestCount")&& objc_msgSend(v5, "hasReliabilityRequestCount")&& (v57 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityRequestCount](self, "reliabilityRequestCount"), v57 == objc_msgSend(v5, "reliabilityRequestCount")))
                {
                  if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityTurnCount](self, "hasReliabilityTurnCount")&& !objc_msgSend(v5, "hasReliabilityTurnCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityTurnCount](self, "hasReliabilityTurnCount")&& objc_msgSend(v5, "hasReliabilityTurnCount")&& (v58 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityTurnCount](self, "reliabilityTurnCount"), v58 == objc_msgSend(v5, "reliabilityTurnCount")))
                  {
                    if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasClientErrorCount](self, "hasClientErrorCount")&& !objc_msgSend(v5, "hasClientErrorCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasClientErrorCount](self, "hasClientErrorCount")&& objc_msgSend(v5, "hasClientErrorCount")&& (v59 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest clientErrorCount](self, "clientErrorCount"), v59 == objc_msgSend(v5, "clientErrorCount")))
                    {
                      if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasUndesiredResponseCount](self, "hasUndesiredResponseCount")&& !objc_msgSend(v5, "hasUndesiredResponseCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasUndesiredResponseCount](self, "hasUndesiredResponseCount")&& objc_msgSend(v5, "hasUndesiredResponseCount")&& (v60 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest undesiredResponseCount](self, "undesiredResponseCount"), v60 == objc_msgSend(v5, "undesiredResponseCount")))
                      {
                        if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFatalResponseCount](self, "hasFatalResponseCount")&& !objc_msgSend(v5, "hasFatalResponseCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFatalResponseCount](self, "hasFatalResponseCount")&& objc_msgSend(v5, "hasFatalResponseCount")&& (v61 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest fatalResponseCount](self, "fatalResponseCount"), v61 == objc_msgSend(v5, "fatalResponseCount")))
                        {
                          if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFailureResponseCount](self, "hasFailureResponseCount")&& !objc_msgSend(v5, "hasFailureResponseCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFailureResponseCount](self, "hasFailureResponseCount")&& objc_msgSend(v5, "hasFailureResponseCount")&& (v62 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest failureResponseCount](self, "failureResponseCount"), v62 == objc_msgSend(v5, "failureResponseCount")))
                          {
                            if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriUnavailableResponseCount](self, "hasSiriUnavailableResponseCount")&& !objc_msgSend(v5, "hasSiriUnavailableResponseCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriUnavailableResponseCount](self, "hasSiriUnavailableResponseCount")&& objc_msgSend(v5, "hasSiriUnavailableResponseCount")&& (v63 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriUnavailableResponseCount](self, "siriUnavailableResponseCount"), v63 == objc_msgSend(v5, "siriUnavailableResponseCount")))
                            {
                              if (!-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasUsdxSessionCount](self, "hasUsdxSessionCount")&& !objc_msgSend(v5, "hasUsdxSessionCount")|| -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasUsdxSessionCount](self, "hasUsdxSessionCount")&& objc_msgSend(v5, "hasUsdxSessionCount")&& (v64 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest usdxSessionCount](self, "usdxSessionCount"), v64 == objc_msgSend(v5, "usdxSessionCount")))
                              {
                                -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest tuples](self, "tuples");
                                v65 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v5, "tuples");
                                v66 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v65 == v66)
                                {
                                  v12 = 1;
                                }
                                else
                                {
                                  -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest tuples](self, "tuples");
                                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v5, "tuples");
                                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                                  v12 = objc_msgSend(v67, "isEqual:", v68);

                                }
                                goto LABEL_140;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_139:
    v12 = 0;
LABEL_140:

    goto LABEL_141;
  }
  v12 = 0;
LABEL_141:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (BOOL)hasDataSharingOptInStatus
{
  return self->_hasDataSharingOptInStatus;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  self->_hasDataSharingOptInStatus = a3;
}

- (int)viewInterface
{
  return self->_viewInterface;
}

- (BOOL)hasViewInterface
{
  return self->_hasViewInterface;
}

- (void)setHasViewInterface:(BOOL)a3
{
  self->_hasViewInterface = a3;
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (NSString)audioInterfaceProductId
{
  return self->_audioInterfaceProductId;
}

- (int)asrLocation
{
  return self->_asrLocation;
}

- (BOOL)hasAsrLocation
{
  return self->_hasAsrLocation;
}

- (void)setHasAsrLocation:(BOOL)a3
{
  self->_hasAsrLocation = a3;
}

- (int)nlLocation
{
  return self->_nlLocation;
}

- (BOOL)hasNlLocation
{
  return self->_hasNlLocation;
}

- (void)setHasNlLocation:(BOOL)a3
{
  self->_hasNlLocation = a3;
}

- (BMSiriOnDeviceDigestExperimentMetricsISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (NSString)subDomain
{
  return self->_subDomain;
}

- (int)responseCategory
{
  return self->_responseCategory;
}

- (BOOL)hasResponseCategory
{
  return self->_hasResponseCategory;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  self->_hasResponseCategory = a3;
}

- (int)experimentAllocationStatus
{
  return self->_experimentAllocationStatus;
}

- (BOOL)hasExperimentAllocationStatus
{
  return self->_hasExperimentAllocationStatus;
}

- (void)setHasExperimentAllocationStatus:(BOOL)a3
{
  self->_hasExperimentAllocationStatus = a3;
}

- (BOOL)isTriggered
{
  return self->_isTriggered;
}

- (BOOL)hasIsTriggered
{
  return self->_hasIsTriggered;
}

- (void)setHasIsTriggered:(BOOL)a3
{
  self->_hasIsTriggered = a3;
}

- (BOOL)isFirstTriggerOrAfterFirstTrigger
{
  return self->_isFirstTriggerOrAfterFirstTrigger;
}

- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger
{
  return self->_hasIsFirstTriggerOrAfterFirstTrigger;
}

- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  self->_hasIsFirstTriggerOrAfterFirstTrigger = a3;
}

- (NSString)codePathIdUUID
{
  return self->_codePathIdUUID;
}

- (unsigned)totalTurnCount
{
  return self->_totalTurnCount;
}

- (BOOL)hasTotalTurnCount
{
  return self->_hasTotalTurnCount;
}

- (void)setHasTotalTurnCount:(BOOL)a3
{
  self->_hasTotalTurnCount = a3;
}

- (unsigned)validTurnCount
{
  return self->_validTurnCount;
}

- (BOOL)hasValidTurnCount
{
  return self->_hasValidTurnCount;
}

- (void)setHasValidTurnCount:(BOOL)a3
{
  self->_hasValidTurnCount = a3;
}

- (unsigned)siriTasksStarted
{
  return self->_siriTasksStarted;
}

- (BOOL)hasSiriTasksStarted
{
  return self->_hasSiriTasksStarted;
}

- (void)setHasSiriTasksStarted:(BOOL)a3
{
  self->_hasSiriTasksStarted = a3;
}

- (unsigned)siriTasksCompleted
{
  return self->_siriTasksCompleted;
}

- (BOOL)hasSiriTasksCompleted
{
  return self->_hasSiriTasksCompleted;
}

- (void)setHasSiriTasksCompleted:(BOOL)a3
{
  self->_hasSiriTasksCompleted = a3;
}

- (unsigned)flowTasksStarted
{
  return self->_flowTasksStarted;
}

- (BOOL)hasFlowTasksStarted
{
  return self->_hasFlowTasksStarted;
}

- (void)setHasFlowTasksStarted:(BOOL)a3
{
  self->_hasFlowTasksStarted = a3;
}

- (unsigned)flowTasksCompleted
{
  return self->_flowTasksCompleted;
}

- (BOOL)hasFlowTasksCompleted
{
  return self->_hasFlowTasksCompleted;
}

- (void)setHasFlowTasksCompleted:(BOOL)a3
{
  self->_hasFlowTasksCompleted = a3;
}

- (unsigned)reliabilityRequestCount
{
  return self->_reliabilityRequestCount;
}

- (BOOL)hasReliabilityRequestCount
{
  return self->_hasReliabilityRequestCount;
}

- (void)setHasReliabilityRequestCount:(BOOL)a3
{
  self->_hasReliabilityRequestCount = a3;
}

- (unsigned)reliabilityTurnCount
{
  return self->_reliabilityTurnCount;
}

- (BOOL)hasReliabilityTurnCount
{
  return self->_hasReliabilityTurnCount;
}

- (void)setHasReliabilityTurnCount:(BOOL)a3
{
  self->_hasReliabilityTurnCount = a3;
}

- (unsigned)clientErrorCount
{
  return self->_clientErrorCount;
}

- (BOOL)hasClientErrorCount
{
  return self->_hasClientErrorCount;
}

- (void)setHasClientErrorCount:(BOOL)a3
{
  self->_hasClientErrorCount = a3;
}

- (unsigned)undesiredResponseCount
{
  return self->_undesiredResponseCount;
}

- (BOOL)hasUndesiredResponseCount
{
  return self->_hasUndesiredResponseCount;
}

- (void)setHasUndesiredResponseCount:(BOOL)a3
{
  self->_hasUndesiredResponseCount = a3;
}

- (unsigned)fatalResponseCount
{
  return self->_fatalResponseCount;
}

- (BOOL)hasFatalResponseCount
{
  return self->_hasFatalResponseCount;
}

- (void)setHasFatalResponseCount:(BOOL)a3
{
  self->_hasFatalResponseCount = a3;
}

- (unsigned)failureResponseCount
{
  return self->_failureResponseCount;
}

- (BOOL)hasFailureResponseCount
{
  return self->_hasFailureResponseCount;
}

- (void)setHasFailureResponseCount:(BOOL)a3
{
  self->_hasFailureResponseCount = a3;
}

- (unsigned)siriUnavailableResponseCount
{
  return self->_siriUnavailableResponseCount;
}

- (BOOL)hasSiriUnavailableResponseCount
{
  return self->_hasSiriUnavailableResponseCount;
}

- (void)setHasSiriUnavailableResponseCount:(BOOL)a3
{
  self->_hasSiriUnavailableResponseCount = a3;
}

- (unsigned)usdxSessionCount
{
  return self->_usdxSessionCount;
}

- (BOOL)hasUsdxSessionCount
{
  return self->_hasUsdxSessionCount;
}

- (void)setHasUsdxSessionCount:(BOOL)a3
{
  self->_hasUsdxSessionCount = a3;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)tuples
{
  return self->_tuples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuples, 0);
  objc_storeStrong((id *)&self->_codePathIdUUID, 0);
  objc_storeStrong((id *)&self->_subDomain, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsExperimentDigest alloc], "initByReadFrom:", v7);
    v4[10] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[31];

  v33[29] = *MEMORY[0x1E0C80C00];
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("systemBuild"), 2, 0, 1, 13, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dataSharingOptInStatus"), 0, 0, 2, 2, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewInterface"), 0, 0, 3, 2, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("audioInterfaceVendorId"), 2, 0, 4, 13, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("audioInterfaceProductId"), 2, 0, 5, 13, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("asrLocation"), 0, 0, 6, 2, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nlLocation"), 0, 0, 7, 2, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("siriInputLocale_json"), 5, 1, &__block_literal_global_353);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subDomain"), 2, 0, 9, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("responseCategory"), 0, 0, 10, 2, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("experimentAllocationStatus"), 0, 0, 11, 2, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTriggered"), 0, 0, 12, 12, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFirstTriggerOrAfterFirstTrigger"), 0, 0, 13, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("codePathIdUUID"), 2, 0, 14, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalTurnCount"), 0, 0, 15, 4, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("validTurnCount"), 0, 0, 16, 4, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriTasksStarted"), 0, 0, 17, 4, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriTasksCompleted"), 0, 0, 18, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("flowTasksStarted"), 0, 0, 19, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("flowTasksCompleted"), 0, 0, 20, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reliabilityRequestCount"), 0, 0, 21, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reliabilityTurnCount"), 0, 0, 22, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientErrorCount"), 0, 0, 23, 4, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("undesiredResponseCount"), 0, 0, 24, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fatalResponseCount"), 0, 0, 25, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("failureResponseCount"), 0, 0, 26, 4, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriUnavailableResponseCount"), 0, 0, 27, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usdxSessionCount"), 0, 0, 28, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("tuples_json"), 5, 1, &__block_literal_global_354);
  v33[0] = v32;
  v33[1] = v31;
  v33[2] = v30;
  v33[3] = v29;
  v33[4] = v28;
  v33[5] = v27;
  v33[6] = v26;
  v33[7] = v25;
  v33[8] = v24;
  v33[9] = v23;
  v33[10] = v22;
  v33[11] = v21;
  v33[12] = v20;
  v33[13] = v19;
  v33[14] = v18;
  v33[15] = v17;
  v33[16] = v16;
  v33[17] = v15;
  v33[18] = v14;
  v33[19] = v2;
  v33[20] = v3;
  v33[21] = v4;
  v33[22] = v13;
  v33[23] = v12;
  v33[24] = v5;
  v33[25] = v6;
  v33[26] = v11;
  v33[27] = v7;
  v33[28] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 29);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D8C0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[31];

  v33[29] = *MEMORY[0x1E0C80C00];
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("systemBuild"), 1, 13, 0);
  v33[0] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dataSharingOptInStatus"), 2, 2, 0);
  v33[1] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewInterface"), 3, 2, 0);
  v33[2] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("audioInterfaceVendorId"), 4, 13, 0);
  v33[3] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("audioInterfaceProductId"), 5, 13, 0);
  v33[4] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("asrLocation"), 6, 2, 0);
  v33[5] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nlLocation"), 7, 2, 0);
  v33[6] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriInputLocale"), 8, 14, objc_opt_class());
  v33[7] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subDomain"), 9, 13, 0);
  v33[8] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("responseCategory"), 10, 2, 0);
  v33[9] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("experimentAllocationStatus"), 11, 2, 0);
  v33[10] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTriggered"), 12, 12, 0);
  v33[11] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFirstTriggerOrAfterFirstTrigger"), 13, 12, 0);
  v33[12] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("codePathIdUUID"), 14, 13, 0);
  v33[13] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalTurnCount"), 15, 4, 0);
  v33[14] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("validTurnCount"), 16, 4, 0);
  v33[15] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriTasksStarted"), 17, 4, 0);
  v33[16] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriTasksCompleted"), 18, 4, 0);
  v33[17] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("flowTasksStarted"), 19, 4, 0);
  v33[18] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("flowTasksCompleted"), 20, 4, 0);
  v33[19] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reliabilityRequestCount"), 21, 4, 0);
  v33[20] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reliabilityTurnCount"), 22, 4, 0);
  v33[21] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientErrorCount"), 23, 4, 0);
  v33[22] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("undesiredResponseCount"), 24, 4, 0);
  v33[23] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fatalResponseCount"), 25, 4, 0);
  v33[24] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("failureResponseCount"), 26, 4, 0);
  v33[25] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriUnavailableResponseCount"), 27, 4, 0);
  v33[26] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usdxSessionCount"), 28, 4, 0);
  v33[27] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tuples"), 29, 14, objc_opt_class());
  v33[28] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __64__BMSiriOnDeviceDigestExperimentMetricsExperimentDigest_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __64__BMSiriOnDeviceDigestExperimentMetricsExperimentDigest_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriInputLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
