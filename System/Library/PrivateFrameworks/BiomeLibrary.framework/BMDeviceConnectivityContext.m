@implementation BMDeviceConnectivityContext

- (BMDeviceConnectivityContext)initWithGeohash:(id)a3 counter:(id)a4 event:(id)a5 ratType:(id)a6 rrcState:(id)a7 cellNsaEnabled:(id)a8 isFR1:(id)a9 cellARFCN:(id)a10 cellBandInfo:(id)a11 cellChannelBW:(id)a12 cellRsrp:(id)a13 cellSinr:(id)a14 cellLteRSRQ:(id)a15 cellNrRSRP:(id)a16 cellNrRSRQ:(id)a17 cellNrSNR:(id)a18 maxDLCAConfigured:(id)a19 totalConfiguredBw:(id)a20 nrConfiguredBw:(id)a21 nrTotalScheduledMimoLayers:(id)a22 totalConfiguredMimoLayers:(id)a23 lteMaxScheduledMimoLayersInACell:(id)a24 nrMaxDlModulation:(id)a25 actualHighBandwidth:(id)a26 actualLowBandwidth:(id)a27 pActualLowBandwidth:(id)a28 maxOfActualLowBandwidth:(id)a29 estimatedHighBandwidth:(id)a30 estimatedLowBandwidth:(id)a31 movingAvgHighBandwidth:(id)a32 movingAvgLowBandwidth:(id)a33 cmDataSentCount:(id)a34 cmDataSentDuration:(id)a35 tcpRTTAvg:(id)a36 tcpRTTvar:(id)a37 videoStreamingStallTime:(id)a38 numStall:(id)a39 stallDuration:(id)a40 cellEstimatedBW:(id)a41 cellLoad:(id)a42 cellModelConfidenceLevel:(id)a43 mlPredictedCellBW:(id)a44 qbssLoad:(id)a45 lqmScorecellular:(id)a46
{
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  BMDeviceConnectivityContext *v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  BMDeviceConnectivityContext *v100;
  id v103;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v139;
  id v140;
  objc_super v141;

  v106 = a3;
  v140 = a4;
  v136 = a5;
  v103 = a6;
  v105 = a6;
  v137 = a7;
  v139 = a8;
  v135 = a9;
  v134 = a10;
  v133 = a11;
  v132 = a12;
  v131 = a13;
  v50 = a14;
  v51 = a15;
  v52 = a16;
  v53 = a17;
  v54 = a18;
  v55 = a19;
  v56 = a20;
  v57 = a21;
  v58 = a22;
  v130 = a23;
  v129 = a24;
  v128 = a25;
  v127 = a26;
  v126 = a27;
  v125 = a28;
  v124 = a29;
  v123 = a30;
  v122 = a31;
  v121 = a32;
  v120 = a33;
  v119 = a34;
  v118 = a35;
  v117 = a36;
  v116 = a37;
  v115 = a38;
  v114 = a39;
  v113 = a40;
  v112 = a41;
  v111 = a42;
  v110 = a43;
  v109 = a44;
  v108 = a45;
  v107 = a46;
  v141.receiver = self;
  v141.super_class = (Class)BMDeviceConnectivityContext;
  v59 = -[BMEventBase init](&v141, sel_init);

  if (v59)
  {
    v59->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v59->_geohash, a3);
    if (v140)
    {
      v59->_hasCounter = 1;
      v60 = objc_msgSend(v140, "unsignedIntValue");
    }
    else
    {
      v60 = 0;
      v59->_hasCounter = 0;
    }
    v59->_counter = v60;
    if (v136)
    {
      v59->_hasEvent = 1;
      v61 = objc_msgSend(v136, "unsignedIntValue");
    }
    else
    {
      v61 = 0;
      v59->_hasEvent = 0;
    }
    v59->_event = v61;
    objc_storeStrong((id *)&v59->_ratType, v103);
    if (v137)
    {
      v59->_hasRrcState = 1;
      v62 = objc_msgSend(v137, "unsignedIntValue");
    }
    else
    {
      v62 = 0;
      v59->_hasRrcState = 0;
    }
    v59->_rrcState = v62;
    if (v139)
    {
      v59->_hasCellNsaEnabled = 1;
      v59->_cellNsaEnabled = objc_msgSend(v139, "BOOLValue");
    }
    else
    {
      v59->_hasCellNsaEnabled = 0;
      v59->_cellNsaEnabled = 0;
    }
    if (v135)
    {
      v59->_hasIsFR1 = 1;
      v59->_isFR1 = objc_msgSend(v135, "BOOLValue");
    }
    else
    {
      v59->_hasIsFR1 = 0;
      v59->_isFR1 = 0;
    }
    v63 = v134;
    if (v134)
    {
      v59->_hasCellARFCN = 1;
      v63 = objc_msgSend(v134, "unsignedIntValue");
    }
    else
    {
      v59->_hasCellARFCN = 0;
    }
    v59->_cellARFCN = v63;
    v64 = v133;
    if (v133)
    {
      v59->_hasCellBandInfo = 1;
      v64 = objc_msgSend(v133, "unsignedIntValue");
    }
    else
    {
      v59->_hasCellBandInfo = 0;
    }
    v59->_cellBandInfo = v64;
    v65 = v132;
    if (v132)
    {
      v59->_hasCellChannelBW = 1;
      v65 = objc_msgSend(v132, "unsignedIntValue");
    }
    else
    {
      v59->_hasCellChannelBW = 0;
    }
    v59->_cellChannelBW = v65;
    if (v131)
    {
      v59->_hasCellRsrp = 1;
      v66 = objc_msgSend(v131, "intValue");
    }
    else
    {
      v59->_hasCellRsrp = 0;
      v66 = -1;
    }
    v59->_cellRsrp = v66;
    if (v50)
    {
      v59->_hasCellSinr = 1;
      v67 = objc_msgSend(v50, "intValue");
    }
    else
    {
      v59->_hasCellSinr = 0;
      v67 = -1;
    }
    v59->_cellSinr = v67;
    if (v51)
    {
      v59->_hasCellLteRSRQ = 1;
      v68 = objc_msgSend(v51, "intValue");
    }
    else
    {
      v59->_hasCellLteRSRQ = 0;
      v68 = -1;
    }
    v59->_cellLteRSRQ = v68;
    if (v52)
    {
      v59->_hasCellNrRSRP = 1;
      v69 = objc_msgSend(v52, "intValue");
    }
    else
    {
      v59->_hasCellNrRSRP = 0;
      v69 = -1;
    }
    v59->_cellNrRSRP = v69;
    if (v53)
    {
      v59->_hasCellNrRSRQ = 1;
      v70 = objc_msgSend(v53, "intValue");
    }
    else
    {
      v59->_hasCellNrRSRQ = 0;
      v70 = -1;
    }
    v59->_cellNrRSRQ = v70;
    if (v54)
    {
      v59->_hasCellNrSNR = 1;
      v71 = objc_msgSend(v54, "intValue");
    }
    else
    {
      v59->_hasCellNrSNR = 0;
      v71 = -1;
    }
    v59->_cellNrSNR = v71;
    if (v55)
    {
      v59->_hasMaxDLCAConfigured = 1;
      v72 = objc_msgSend(v55, "unsignedIntValue");
    }
    else
    {
      v72 = 0;
      v59->_hasMaxDLCAConfigured = 0;
    }
    v59->_maxDLCAConfigured = v72;
    if (v56)
    {
      v59->_hasTotalConfiguredBw = 1;
      v73 = objc_msgSend(v56, "unsignedIntValue");
    }
    else
    {
      v73 = 0;
      v59->_hasTotalConfiguredBw = 0;
    }
    v59->_totalConfiguredBw = v73;
    if (v57)
    {
      v59->_hasNrConfiguredBw = 1;
      v74 = objc_msgSend(v57, "unsignedIntValue");
    }
    else
    {
      v74 = 0;
      v59->_hasNrConfiguredBw = 0;
    }
    v59->_nrConfiguredBw = v74;
    if (v58)
    {
      v59->_hasNrTotalScheduledMimoLayers = 1;
      v75 = objc_msgSend(v58, "unsignedIntValue");
    }
    else
    {
      v75 = 0;
      v59->_hasNrTotalScheduledMimoLayers = 0;
    }
    v59->_nrTotalScheduledMimoLayers = v75;
    v76 = v130;
    if (v130)
    {
      v59->_hasTotalConfiguredMimoLayers = 1;
      v76 = objc_msgSend(v130, "unsignedIntValue");
    }
    else
    {
      v59->_hasTotalConfiguredMimoLayers = 0;
    }
    v59->_totalConfiguredMimoLayers = v76;
    v77 = v129;
    if (v129)
    {
      v59->_hasLteMaxScheduledMimoLayersInACell = 1;
      v77 = objc_msgSend(v129, "unsignedIntValue");
    }
    else
    {
      v59->_hasLteMaxScheduledMimoLayersInACell = 0;
    }
    v59->_lteMaxScheduledMimoLayersInACell = v77;
    v78 = v128;
    if (v128)
    {
      v59->_hasNrMaxDlModulation = 1;
      v78 = objc_msgSend(v128, "unsignedIntValue");
    }
    else
    {
      v59->_hasNrMaxDlModulation = 0;
    }
    v59->_nrMaxDlModulation = v78;
    v79 = v127;
    if (v127)
    {
      v59->_hasActualHighBandwidth = 1;
      v79 = objc_msgSend(v127, "unsignedIntValue");
    }
    else
    {
      v59->_hasActualHighBandwidth = 0;
    }
    v59->_actualHighBandwidth = v79;
    v80 = v126;
    if (v126)
    {
      v59->_hasActualLowBandwidth = 1;
      v80 = objc_msgSend(v126, "unsignedIntValue");
    }
    else
    {
      v59->_hasActualLowBandwidth = 0;
    }
    v59->_actualLowBandwidth = v80;
    v81 = v125;
    if (v125)
    {
      v59->_hasPActualLowBandwidth = 1;
      v81 = objc_msgSend(v125, "unsignedIntValue");
    }
    else
    {
      v59->_hasPActualLowBandwidth = 0;
    }
    v59->_pActualLowBandwidth = v81;
    v82 = v124;
    if (v124)
    {
      v59->_hasMaxOfActualLowBandwidth = 1;
      v82 = objc_msgSend(v124, "unsignedIntValue");
    }
    else
    {
      v59->_hasMaxOfActualLowBandwidth = 0;
    }
    v59->_maxOfActualLowBandwidth = v82;
    v83 = v123;
    if (v123)
    {
      v59->_hasEstimatedHighBandwidth = 1;
      v83 = objc_msgSend(v123, "unsignedIntValue");
    }
    else
    {
      v59->_hasEstimatedHighBandwidth = 0;
    }
    v59->_estimatedHighBandwidth = v83;
    v84 = v122;
    if (v122)
    {
      v59->_hasEstimatedLowBandwidth = 1;
      v84 = objc_msgSend(v122, "unsignedIntValue");
    }
    else
    {
      v59->_hasEstimatedLowBandwidth = 0;
    }
    v59->_estimatedLowBandwidth = v84;
    v85 = v121;
    if (v121)
    {
      v59->_hasMovingAvgHighBandwidth = 1;
      v85 = objc_msgSend(v121, "unsignedIntValue");
    }
    else
    {
      v59->_hasMovingAvgHighBandwidth = 0;
    }
    v59->_movingAvgHighBandwidth = v85;
    v86 = v120;
    if (v120)
    {
      v59->_hasMovingAvgLowBandwidth = 1;
      v86 = objc_msgSend(v120, "unsignedIntValue");
    }
    else
    {
      v59->_hasMovingAvgLowBandwidth = 0;
    }
    v59->_movingAvgLowBandwidth = v86;
    v87 = v119;
    if (v119)
    {
      v59->_hasCmDataSentCount = 1;
      v87 = objc_msgSend(v119, "unsignedIntValue");
    }
    else
    {
      v59->_hasCmDataSentCount = 0;
    }
    v59->_cmDataSentCount = v87;
    v88 = v118;
    if (v118)
    {
      v59->_hasCmDataSentDuration = 1;
      v88 = objc_msgSend(v118, "unsignedIntValue");
    }
    else
    {
      v59->_hasCmDataSentDuration = 0;
    }
    v59->_cmDataSentDuration = v88;
    v89 = v117;
    if (v117)
    {
      v59->_hasTcpRTTAvg = 1;
      v89 = objc_msgSend(v117, "unsignedIntValue");
    }
    else
    {
      v59->_hasTcpRTTAvg = 0;
    }
    v59->_tcpRTTAvg = v89;
    v90 = v116;
    if (v116)
    {
      v59->_hasTcpRTTvar = 1;
      v90 = objc_msgSend(v116, "unsignedIntValue");
    }
    else
    {
      v59->_hasTcpRTTvar = 0;
    }
    v59->_tcpRTTvar = v90;
    v91 = v115;
    if (v115)
    {
      v59->_hasVideoStreamingStallTime = 1;
      v91 = objc_msgSend(v115, "unsignedIntValue");
    }
    else
    {
      v59->_hasVideoStreamingStallTime = 0;
    }
    v59->_videoStreamingStallTime = v91;
    v92 = v114;
    if (v114)
    {
      v59->_hasNumStall = 1;
      v92 = objc_msgSend(v114, "unsignedIntValue");
    }
    else
    {
      v59->_hasNumStall = 0;
    }
    v59->_numStall = v92;
    v93 = v113;
    if (v113)
    {
      v59->_hasStallDuration = 1;
      v93 = objc_msgSend(v113, "unsignedIntValue");
    }
    else
    {
      v59->_hasStallDuration = 0;
    }
    v59->_stallDuration = v93;
    v94 = v112;
    if (v112)
    {
      v59->_hasCellEstimatedBW = 1;
      v94 = objc_msgSend(v112, "unsignedIntValue");
    }
    else
    {
      v59->_hasCellEstimatedBW = 0;
    }
    v59->_cellEstimatedBW = v94;
    v95 = v111;
    if (v111)
    {
      v59->_hasCellLoad = 1;
      v95 = objc_msgSend(v111, "unsignedIntValue");
    }
    else
    {
      v59->_hasCellLoad = 0;
    }
    v59->_cellLoad = v95;
    v96 = v110;
    if (v110)
    {
      v59->_hasCellModelConfidenceLevel = 1;
      v96 = objc_msgSend(v110, "unsignedIntValue");
    }
    else
    {
      v59->_hasCellModelConfidenceLevel = 0;
    }
    v59->_cellModelConfidenceLevel = v96;
    v97 = v109;
    if (v109)
    {
      v59->_hasMlPredictedCellBW = 1;
      v97 = objc_msgSend(v109, "unsignedIntValue");
    }
    else
    {
      v59->_hasMlPredictedCellBW = 0;
    }
    v59->_mlPredictedCellBW = v97;
    v98 = v108;
    if (v108)
    {
      v59->_hasQbssLoad = 1;
      v98 = objc_msgSend(v108, "unsignedIntValue");
    }
    else
    {
      v59->_hasQbssLoad = 0;
    }
    v59->_qbssLoad = v98;
    v99 = v107;
    if (v107)
    {
      v59->_hasLqmScorecellular = 1;
      v99 = objc_msgSend(v107, "unsignedIntValue");
    }
    else
    {
      v59->_hasLqmScorecellular = 0;
    }
    v59->_lqmScorecellular = v99;
  }
  v100 = v59;

  return v100;
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
  id v19;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMDeviceConnectivityContext geohash](self, "geohash");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext counter](self, "counter"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext event](self, "event"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceConnectivityContext ratType](self, "ratType");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext rrcState](self, "rrcState"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceConnectivityContext cellNsaEnabled](self, "cellNsaEnabled"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceConnectivityContext isFR1](self, "isFR1"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellARFCN](self, "cellARFCN"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellBandInfo](self, "cellBandInfo"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellChannelBW](self, "cellChannelBW"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellRsrp](self, "cellRsrp"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellSinr](self, "cellSinr"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellLteRSRQ](self, "cellLteRSRQ"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRP](self, "cellNrRSRP"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRQ](self, "cellNrRSRQ"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellNrSNR](self, "cellNrSNR"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxDLCAConfigured](self, "maxDLCAConfigured"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredBw](self, "totalConfiguredBw"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrConfiguredBw](self, "nrConfiguredBw"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrTotalScheduledMimoLayers](self, "nrTotalScheduledMimoLayers"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredMimoLayers](self, "totalConfiguredMimoLayers"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lteMaxScheduledMimoLayersInACell](self, "lteMaxScheduledMimoLayersInACell"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrMaxDlModulation](self, "nrMaxDlModulation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualHighBandwidth](self, "actualHighBandwidth"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualLowBandwidth](self, "actualLowBandwidth"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext pActualLowBandwidth](self, "pActualLowBandwidth"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxOfActualLowBandwidth](self, "maxOfActualLowBandwidth"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedHighBandwidth](self, "estimatedHighBandwidth"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedLowBandwidth](self, "estimatedLowBandwidth"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgHighBandwidth](self, "movingAvgHighBandwidth"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgLowBandwidth](self, "movingAvgLowBandwidth"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentCount](self, "cmDataSentCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentDuration](self, "cmDataSentDuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTAvg](self, "tcpRTTAvg"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTvar](self, "tcpRTTvar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext videoStreamingStallTime](self, "videoStreamingStallTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext numStall](self, "numStall"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext stallDuration](self, "stallDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellEstimatedBW](self, "cellEstimatedBW"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellLoad](self, "cellLoad"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellModelConfidenceLevel](self, "cellModelConfidenceLevel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext mlPredictedCellBW](self, "mlPredictedCellBW"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext qbssLoad](self, "qbssLoad"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lqmScorecellular](self, "lqmScorecellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v19, "initWithFormat:", CFSTR("BMDeviceConnectivityContext with geohash: %@, counter: %@, event: %@, ratType: %@, rrcState: %@, cellNsaEnabled: %@, isFR1: %@, cellARFCN: %@, cellBandInfo: %@, cellChannelBW: %@, cellRsrp: %@, cellSinr: %@, cellLteRSRQ: %@, cellNrRSRP: %@, cellNrRSRQ: %@, cellNrSNR: %@, maxDLCAConfigured: %@, totalConfiguredBw: %@, nrConfiguredBw: %@, nrTotalScheduledMimoLayers: %@, totalConfiguredMimoLayers: %@, lteMaxScheduledMimoLayersInACell: %@, nrMaxDlModulation: %@, actualHighBandwidth: %@, actualLowBandwidth: %@, pActualLowBandwidth: %@, maxOfActualLowBandwidth: %@, estimatedHighBandwidth: %@, estimatedLowBandwidth: %@, movingAvgHighBandwidth: %@, movingAvgLowBandwidth: %@, cmDataSentCount: %@, cmDataSentDuration: %@, tcpRTTAvg: %@, tcpRTTvar: %@, videoStreamingStallTime: %@, numStall: %@, stallDuration: %@, cellEstimatedBW: %@, cellLoad: %@, cellModelConfidenceLevel: %@, mlPredictedCellBW: %@, qbssLoad: %@, lqmScorecellular: %@"), v49, v46, v48, v45, v47, v43, v44, v42, v39, v41, v37, v40, v36, v38, v34, v35,
              v31,
              v33,
              v30,
              v29,
              v28,
              v32,
              v26,
              v27,
              v25,
              v24,
              v23,
              v18,
              v17,
              v22,
              v16,
              v21,
              v15,
              v12,
              v14,
              v11,
              v13,
              v10,
              v9,
              v8,
              v3,
              v4,
              v5,
              v6);

  return (NSString *)v20;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceConnectivityContext *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  char v85;
  unsigned int v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  char v90;
  unsigned int v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  char v95;
  unsigned int v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  unsigned int v111;
  uint64_t v112;
  unint64_t v113;
  char v114;
  char v115;
  unsigned int v116;
  uint64_t v117;
  unint64_t v118;
  char v119;
  char v120;
  unsigned int v121;
  uint64_t v122;
  unint64_t v123;
  char v124;
  char v125;
  unsigned int v126;
  uint64_t v127;
  unint64_t v128;
  char v129;
  char v130;
  unsigned int v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  char v135;
  unsigned int v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  char v140;
  unsigned int v141;
  uint64_t v142;
  unint64_t v143;
  char v144;
  char v145;
  unsigned int v146;
  uint64_t v147;
  unint64_t v148;
  char v149;
  char v150;
  unsigned int v151;
  uint64_t v152;
  unint64_t v153;
  char v154;
  char v155;
  unsigned int v156;
  uint64_t v157;
  unint64_t v158;
  char v159;
  char v160;
  unsigned int v161;
  uint64_t v162;
  unint64_t v163;
  char v164;
  char v165;
  unsigned int v166;
  uint64_t v167;
  unint64_t v168;
  char v169;
  char v170;
  unsigned int v171;
  uint64_t v172;
  unint64_t v173;
  char v174;
  char v175;
  unsigned int v176;
  uint64_t v177;
  unint64_t v178;
  char v179;
  char v180;
  unsigned int v181;
  uint64_t v182;
  unint64_t v183;
  char v184;
  char v185;
  unsigned int v186;
  uint64_t v187;
  unint64_t v188;
  char v189;
  char v190;
  unsigned int v191;
  uint64_t v192;
  unint64_t v193;
  char v194;
  char v195;
  unsigned int v196;
  uint64_t v197;
  unint64_t v198;
  char v199;
  char v200;
  unsigned int v201;
  uint64_t v202;
  unint64_t v203;
  char v204;
  char v205;
  unsigned int v206;
  uint64_t v207;
  unint64_t v208;
  char v209;
  char v210;
  unsigned int v211;
  uint64_t v212;
  unint64_t v213;
  char v214;
  char v215;
  unsigned int v216;
  uint64_t v217;
  unint64_t v218;
  char v219;
  char v220;
  unsigned int v221;
  uint64_t v222;
  unint64_t v223;
  char v224;
  char v225;
  unsigned int v226;
  uint64_t v227;
  unint64_t v228;
  char v229;
  char v230;
  unsigned int v231;
  uint64_t v232;
  unint64_t v233;
  char v234;
  uint64_t v235;
  BOOL v236;
  uint64_t v237;
  BMDeviceConnectivityContext *v238;
  objc_super v240;

  v4 = a3;
  v240.receiver = self;
  v240.super_class = (Class)BMDeviceConnectivityContext;
  v5 = -[BMEventBase init](&v240, sel_init);
  if (!v5)
    goto LABEL_492;
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 224;
          goto LABEL_38;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v5->_hasCounter = 1;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_322;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_322:
          v235 = 64;
          goto LABEL_488;
        case 3u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          v5->_hasEvent = 1;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_326;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_326:
          v235 = 68;
          goto LABEL_488;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 232;
LABEL_38:
          v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 5u:
          v33 = 0;
          v34 = 0;
          v23 = 0;
          v5->_hasRrcState = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v36 + 1;
              v23 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_330;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_330:
          v235 = 72;
          goto LABEL_488;
        case 6u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasCellNsaEnabled = 1;
          while (2)
          {
            v41 = *v6;
            v42 = *(_QWORD *)&v4[v41];
            if (v42 == -1 || v42 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
              *(_QWORD *)&v4[v41] = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v16 = v39++ >= 9;
                if (v16)
                {
                  v40 = 0;
                  goto LABEL_334;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v40 = 0;
LABEL_334:
          v236 = v40 != 0;
          v237 = 19;
          goto LABEL_339;
        case 7u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v5->_hasIsFR1 = 1;
          while (2)
          {
            v47 = *v6;
            v48 = *(_QWORD *)&v4[v47];
            if (v48 == -1 || v48 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
              *(_QWORD *)&v4[v47] = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v16 = v45++ >= 9;
                if (v16)
                {
                  v46 = 0;
                  goto LABEL_338;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v46 = 0;
LABEL_338:
          v236 = v46 != 0;
          v237 = 21;
LABEL_339:
          *((_BYTE *)&v5->super.super.isa + v237) = v236;
          continue;
        case 8u:
          v50 = 0;
          v51 = 0;
          v23 = 0;
          v5->_hasCellARFCN = 1;
          while (2)
          {
            v52 = *v6;
            v53 = *(_QWORD *)&v4[v52];
            if (v53 == -1 || v53 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v53);
              *(_QWORD *)&v4[v52] = v53 + 1;
              v23 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                v16 = v51++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_343;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_343:
          v235 = 76;
          goto LABEL_488;
        case 9u:
          v55 = 0;
          v56 = 0;
          v23 = 0;
          v5->_hasCellBandInfo = 1;
          while (2)
          {
            v57 = *v6;
            v58 = *(_QWORD *)&v4[v57];
            if (v58 == -1 || v58 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v58);
              *(_QWORD *)&v4[v57] = v58 + 1;
              v23 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                v16 = v56++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_347;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_347:
          v235 = 80;
          goto LABEL_488;
        case 0xAu:
          v60 = 0;
          v61 = 0;
          v23 = 0;
          v5->_hasCellChannelBW = 1;
          while (2)
          {
            v62 = *v6;
            v63 = *(_QWORD *)&v4[v62];
            if (v63 == -1 || v63 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v63);
              *(_QWORD *)&v4[v62] = v63 + 1;
              v23 |= (unint64_t)(v64 & 0x7F) << v60;
              if (v64 < 0)
              {
                v60 += 7;
                v16 = v61++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_351;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_351:
          v235 = 84;
          goto LABEL_488;
        case 0xBu:
          v65 = 0;
          v66 = 0;
          v23 = 0;
          v5->_hasCellRsrp = 1;
          while (2)
          {
            v67 = *v6;
            v68 = *(_QWORD *)&v4[v67];
            if (v68 == -1 || v68 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v69 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v68);
              *(_QWORD *)&v4[v67] = v68 + 1;
              v23 |= (unint64_t)(v69 & 0x7F) << v65;
              if (v69 < 0)
              {
                v65 += 7;
                v16 = v66++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_355;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_355:
          v235 = 88;
          goto LABEL_488;
        case 0xCu:
          v70 = 0;
          v71 = 0;
          v23 = 0;
          v5->_hasCellSinr = 1;
          while (2)
          {
            v72 = *v6;
            v73 = *(_QWORD *)&v4[v72];
            if (v73 == -1 || v73 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v73);
              *(_QWORD *)&v4[v72] = v73 + 1;
              v23 |= (unint64_t)(v74 & 0x7F) << v70;
              if (v74 < 0)
              {
                v70 += 7;
                v16 = v71++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_359;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_359:
          v235 = 92;
          goto LABEL_488;
        case 0xDu:
          v75 = 0;
          v76 = 0;
          v23 = 0;
          v5->_hasCellLteRSRQ = 1;
          while (2)
          {
            v77 = *v6;
            v78 = *(_QWORD *)&v4[v77];
            if (v78 == -1 || v78 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v78);
              *(_QWORD *)&v4[v77] = v78 + 1;
              v23 |= (unint64_t)(v79 & 0x7F) << v75;
              if (v79 < 0)
              {
                v75 += 7;
                v16 = v76++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_363;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_363:
          v235 = 96;
          goto LABEL_488;
        case 0xEu:
          v80 = 0;
          v81 = 0;
          v23 = 0;
          v5->_hasCellNrRSRP = 1;
          while (2)
          {
            v82 = *v6;
            v83 = *(_QWORD *)&v4[v82];
            if (v83 == -1 || v83 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v84 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v83);
              *(_QWORD *)&v4[v82] = v83 + 1;
              v23 |= (unint64_t)(v84 & 0x7F) << v80;
              if (v84 < 0)
              {
                v80 += 7;
                v16 = v81++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_367;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_367:
          v235 = 100;
          goto LABEL_488;
        case 0xFu:
          v85 = 0;
          v86 = 0;
          v23 = 0;
          v5->_hasCellNrRSRQ = 1;
          while (2)
          {
            v87 = *v6;
            v88 = *(_QWORD *)&v4[v87];
            if (v88 == -1 || v88 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v89 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v88);
              *(_QWORD *)&v4[v87] = v88 + 1;
              v23 |= (unint64_t)(v89 & 0x7F) << v85;
              if (v89 < 0)
              {
                v85 += 7;
                v16 = v86++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_371;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_371:
          v235 = 104;
          goto LABEL_488;
        case 0x10u:
          v90 = 0;
          v91 = 0;
          v23 = 0;
          v5->_hasCellNrSNR = 1;
          while (2)
          {
            v92 = *v6;
            v93 = *(_QWORD *)&v4[v92];
            if (v93 == -1 || v93 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v94 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v93);
              *(_QWORD *)&v4[v92] = v93 + 1;
              v23 |= (unint64_t)(v94 & 0x7F) << v90;
              if (v94 < 0)
              {
                v90 += 7;
                v16 = v91++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_375;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_375:
          v235 = 108;
          goto LABEL_488;
        case 0x11u:
          v95 = 0;
          v96 = 0;
          v23 = 0;
          v5->_hasMaxDLCAConfigured = 1;
          while (2)
          {
            v97 = *v6;
            v98 = *(_QWORD *)&v4[v97];
            if (v98 == -1 || v98 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v99 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v98);
              *(_QWORD *)&v4[v97] = v98 + 1;
              v23 |= (unint64_t)(v99 & 0x7F) << v95;
              if (v99 < 0)
              {
                v95 += 7;
                v16 = v96++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_379;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_379:
          v235 = 112;
          goto LABEL_488;
        case 0x12u:
          v100 = 0;
          v101 = 0;
          v23 = 0;
          v5->_hasTotalConfiguredBw = 1;
          while (2)
          {
            v102 = *v6;
            v103 = *(_QWORD *)&v4[v102];
            if (v103 == -1 || v103 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v104 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v103);
              *(_QWORD *)&v4[v102] = v103 + 1;
              v23 |= (unint64_t)(v104 & 0x7F) << v100;
              if (v104 < 0)
              {
                v100 += 7;
                v16 = v101++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_383;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_383:
          v235 = 116;
          goto LABEL_488;
        case 0x13u:
          v105 = 0;
          v106 = 0;
          v23 = 0;
          v5->_hasNrConfiguredBw = 1;
          while (2)
          {
            v107 = *v6;
            v108 = *(_QWORD *)&v4[v107];
            if (v108 == -1 || v108 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v109 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v108);
              *(_QWORD *)&v4[v107] = v108 + 1;
              v23 |= (unint64_t)(v109 & 0x7F) << v105;
              if (v109 < 0)
              {
                v105 += 7;
                v16 = v106++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_387;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_387:
          v235 = 120;
          goto LABEL_488;
        case 0x14u:
          v110 = 0;
          v111 = 0;
          v23 = 0;
          v5->_hasNrTotalScheduledMimoLayers = 1;
          while (2)
          {
            v112 = *v6;
            v113 = *(_QWORD *)&v4[v112];
            if (v113 == -1 || v113 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v114 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v113);
              *(_QWORD *)&v4[v112] = v113 + 1;
              v23 |= (unint64_t)(v114 & 0x7F) << v110;
              if (v114 < 0)
              {
                v110 += 7;
                v16 = v111++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_391;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_391:
          v235 = 124;
          goto LABEL_488;
        case 0x15u:
          v115 = 0;
          v116 = 0;
          v23 = 0;
          v5->_hasTotalConfiguredMimoLayers = 1;
          while (2)
          {
            v117 = *v6;
            v118 = *(_QWORD *)&v4[v117];
            if (v118 == -1 || v118 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v119 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v118);
              *(_QWORD *)&v4[v117] = v118 + 1;
              v23 |= (unint64_t)(v119 & 0x7F) << v115;
              if (v119 < 0)
              {
                v115 += 7;
                v16 = v116++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_395;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_395:
          v235 = 128;
          goto LABEL_488;
        case 0x16u:
          v120 = 0;
          v121 = 0;
          v23 = 0;
          v5->_hasLteMaxScheduledMimoLayersInACell = 1;
          while (2)
          {
            v122 = *v6;
            v123 = *(_QWORD *)&v4[v122];
            if (v123 == -1 || v123 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v124 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v123);
              *(_QWORD *)&v4[v122] = v123 + 1;
              v23 |= (unint64_t)(v124 & 0x7F) << v120;
              if (v124 < 0)
              {
                v120 += 7;
                v16 = v121++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_399;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_399:
          v235 = 132;
          goto LABEL_488;
        case 0x17u:
          v125 = 0;
          v126 = 0;
          v23 = 0;
          v5->_hasNrMaxDlModulation = 1;
          while (2)
          {
            v127 = *v6;
            v128 = *(_QWORD *)&v4[v127];
            if (v128 == -1 || v128 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v129 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v128);
              *(_QWORD *)&v4[v127] = v128 + 1;
              v23 |= (unint64_t)(v129 & 0x7F) << v125;
              if (v129 < 0)
              {
                v125 += 7;
                v16 = v126++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_403;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_403:
          v235 = 136;
          goto LABEL_488;
        case 0x18u:
          v130 = 0;
          v131 = 0;
          v23 = 0;
          v5->_hasActualHighBandwidth = 1;
          while (2)
          {
            v132 = *v6;
            v133 = *(_QWORD *)&v4[v132];
            if (v133 == -1 || v133 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v134 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v133);
              *(_QWORD *)&v4[v132] = v133 + 1;
              v23 |= (unint64_t)(v134 & 0x7F) << v130;
              if (v134 < 0)
              {
                v130 += 7;
                v16 = v131++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_407;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_407:
          v235 = 140;
          goto LABEL_488;
        case 0x19u:
          v135 = 0;
          v136 = 0;
          v23 = 0;
          v5->_hasActualLowBandwidth = 1;
          while (2)
          {
            v137 = *v6;
            v138 = *(_QWORD *)&v4[v137];
            if (v138 == -1 || v138 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v139 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v138);
              *(_QWORD *)&v4[v137] = v138 + 1;
              v23 |= (unint64_t)(v139 & 0x7F) << v135;
              if (v139 < 0)
              {
                v135 += 7;
                v16 = v136++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_411;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_411:
          v235 = 144;
          goto LABEL_488;
        case 0x1Au:
          v140 = 0;
          v141 = 0;
          v23 = 0;
          v5->_hasPActualLowBandwidth = 1;
          while (2)
          {
            v142 = *v6;
            v143 = *(_QWORD *)&v4[v142];
            if (v143 == -1 || v143 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v144 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v143);
              *(_QWORD *)&v4[v142] = v143 + 1;
              v23 |= (unint64_t)(v144 & 0x7F) << v140;
              if (v144 < 0)
              {
                v140 += 7;
                v16 = v141++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_415;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_415:
          v235 = 148;
          goto LABEL_488;
        case 0x1Bu:
          v145 = 0;
          v146 = 0;
          v23 = 0;
          v5->_hasMaxOfActualLowBandwidth = 1;
          while (2)
          {
            v147 = *v6;
            v148 = *(_QWORD *)&v4[v147];
            if (v148 == -1 || v148 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v149 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v148);
              *(_QWORD *)&v4[v147] = v148 + 1;
              v23 |= (unint64_t)(v149 & 0x7F) << v145;
              if (v149 < 0)
              {
                v145 += 7;
                v16 = v146++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_419;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_419:
          v235 = 152;
          goto LABEL_488;
        case 0x1Cu:
          v150 = 0;
          v151 = 0;
          v23 = 0;
          v5->_hasEstimatedHighBandwidth = 1;
          while (2)
          {
            v152 = *v6;
            v153 = *(_QWORD *)&v4[v152];
            if (v153 == -1 || v153 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v154 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v153);
              *(_QWORD *)&v4[v152] = v153 + 1;
              v23 |= (unint64_t)(v154 & 0x7F) << v150;
              if (v154 < 0)
              {
                v150 += 7;
                v16 = v151++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_423;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_423:
          v235 = 156;
          goto LABEL_488;
        case 0x1Du:
          v155 = 0;
          v156 = 0;
          v23 = 0;
          v5->_hasEstimatedLowBandwidth = 1;
          while (2)
          {
            v157 = *v6;
            v158 = *(_QWORD *)&v4[v157];
            if (v158 == -1 || v158 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v159 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v158);
              *(_QWORD *)&v4[v157] = v158 + 1;
              v23 |= (unint64_t)(v159 & 0x7F) << v155;
              if (v159 < 0)
              {
                v155 += 7;
                v16 = v156++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_427;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_427:
          v235 = 160;
          goto LABEL_488;
        case 0x1Eu:
          v160 = 0;
          v161 = 0;
          v23 = 0;
          v5->_hasMovingAvgHighBandwidth = 1;
          while (2)
          {
            v162 = *v6;
            v163 = *(_QWORD *)&v4[v162];
            if (v163 == -1 || v163 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v164 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v163);
              *(_QWORD *)&v4[v162] = v163 + 1;
              v23 |= (unint64_t)(v164 & 0x7F) << v160;
              if (v164 < 0)
              {
                v160 += 7;
                v16 = v161++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_431;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_431:
          v235 = 164;
          goto LABEL_488;
        case 0x1Fu:
          v165 = 0;
          v166 = 0;
          v23 = 0;
          v5->_hasMovingAvgLowBandwidth = 1;
          while (2)
          {
            v167 = *v6;
            v168 = *(_QWORD *)&v4[v167];
            if (v168 == -1 || v168 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v169 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v168);
              *(_QWORD *)&v4[v167] = v168 + 1;
              v23 |= (unint64_t)(v169 & 0x7F) << v165;
              if (v169 < 0)
              {
                v165 += 7;
                v16 = v166++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_435;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_435:
          v235 = 168;
          goto LABEL_488;
        case 0x20u:
          v170 = 0;
          v171 = 0;
          v23 = 0;
          v5->_hasCmDataSentCount = 1;
          while (2)
          {
            v172 = *v6;
            v173 = *(_QWORD *)&v4[v172];
            if (v173 == -1 || v173 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v174 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v173);
              *(_QWORD *)&v4[v172] = v173 + 1;
              v23 |= (unint64_t)(v174 & 0x7F) << v170;
              if (v174 < 0)
              {
                v170 += 7;
                v16 = v171++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_439;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_439:
          v235 = 172;
          goto LABEL_488;
        case 0x21u:
          v175 = 0;
          v176 = 0;
          v23 = 0;
          v5->_hasCmDataSentDuration = 1;
          while (2)
          {
            v177 = *v6;
            v178 = *(_QWORD *)&v4[v177];
            if (v178 == -1 || v178 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v179 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v178);
              *(_QWORD *)&v4[v177] = v178 + 1;
              v23 |= (unint64_t)(v179 & 0x7F) << v175;
              if (v179 < 0)
              {
                v175 += 7;
                v16 = v176++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_443;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_443:
          v235 = 176;
          goto LABEL_488;
        case 0x22u:
          v180 = 0;
          v181 = 0;
          v23 = 0;
          v5->_hasTcpRTTAvg = 1;
          while (2)
          {
            v182 = *v6;
            v183 = *(_QWORD *)&v4[v182];
            if (v183 == -1 || v183 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v184 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v183);
              *(_QWORD *)&v4[v182] = v183 + 1;
              v23 |= (unint64_t)(v184 & 0x7F) << v180;
              if (v184 < 0)
              {
                v180 += 7;
                v16 = v181++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_447;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_447:
          v235 = 180;
          goto LABEL_488;
        case 0x23u:
          v185 = 0;
          v186 = 0;
          v23 = 0;
          v5->_hasTcpRTTvar = 1;
          while (2)
          {
            v187 = *v6;
            v188 = *(_QWORD *)&v4[v187];
            if (v188 == -1 || v188 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v189 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v188);
              *(_QWORD *)&v4[v187] = v188 + 1;
              v23 |= (unint64_t)(v189 & 0x7F) << v185;
              if (v189 < 0)
              {
                v185 += 7;
                v16 = v186++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_451;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_451:
          v235 = 184;
          goto LABEL_488;
        case 0x24u:
          v190 = 0;
          v191 = 0;
          v23 = 0;
          v5->_hasVideoStreamingStallTime = 1;
          while (2)
          {
            v192 = *v6;
            v193 = *(_QWORD *)&v4[v192];
            if (v193 == -1 || v193 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v194 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v193);
              *(_QWORD *)&v4[v192] = v193 + 1;
              v23 |= (unint64_t)(v194 & 0x7F) << v190;
              if (v194 < 0)
              {
                v190 += 7;
                v16 = v191++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_455;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_455:
          v235 = 188;
          goto LABEL_488;
        case 0x25u:
          v195 = 0;
          v196 = 0;
          v23 = 0;
          v5->_hasNumStall = 1;
          while (2)
          {
            v197 = *v6;
            v198 = *(_QWORD *)&v4[v197];
            if (v198 == -1 || v198 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v199 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v198);
              *(_QWORD *)&v4[v197] = v198 + 1;
              v23 |= (unint64_t)(v199 & 0x7F) << v195;
              if (v199 < 0)
              {
                v195 += 7;
                v16 = v196++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_459;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_459:
          v235 = 192;
          goto LABEL_488;
        case 0x26u:
          v200 = 0;
          v201 = 0;
          v23 = 0;
          v5->_hasStallDuration = 1;
          while (2)
          {
            v202 = *v6;
            v203 = *(_QWORD *)&v4[v202];
            if (v203 == -1 || v203 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v204 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v203);
              *(_QWORD *)&v4[v202] = v203 + 1;
              v23 |= (unint64_t)(v204 & 0x7F) << v200;
              if (v204 < 0)
              {
                v200 += 7;
                v16 = v201++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_463;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_463:
          v235 = 196;
          goto LABEL_488;
        case 0x27u:
          v205 = 0;
          v206 = 0;
          v23 = 0;
          v5->_hasCellEstimatedBW = 1;
          while (2)
          {
            v207 = *v6;
            v208 = *(_QWORD *)&v4[v207];
            if (v208 == -1 || v208 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v209 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v208);
              *(_QWORD *)&v4[v207] = v208 + 1;
              v23 |= (unint64_t)(v209 & 0x7F) << v205;
              if (v209 < 0)
              {
                v205 += 7;
                v16 = v206++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_467;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_467:
          v235 = 200;
          goto LABEL_488;
        case 0x28u:
          v210 = 0;
          v211 = 0;
          v23 = 0;
          v5->_hasCellLoad = 1;
          while (2)
          {
            v212 = *v6;
            v213 = *(_QWORD *)&v4[v212];
            if (v213 == -1 || v213 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v214 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v213);
              *(_QWORD *)&v4[v212] = v213 + 1;
              v23 |= (unint64_t)(v214 & 0x7F) << v210;
              if (v214 < 0)
              {
                v210 += 7;
                v16 = v211++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_471;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_471:
          v235 = 204;
          goto LABEL_488;
        case 0x29u:
          v215 = 0;
          v216 = 0;
          v23 = 0;
          v5->_hasCellModelConfidenceLevel = 1;
          while (2)
          {
            v217 = *v6;
            v218 = *(_QWORD *)&v4[v217];
            if (v218 == -1 || v218 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v219 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v218);
              *(_QWORD *)&v4[v217] = v218 + 1;
              v23 |= (unint64_t)(v219 & 0x7F) << v215;
              if (v219 < 0)
              {
                v215 += 7;
                v16 = v216++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_475;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_475:
          v235 = 208;
          goto LABEL_488;
        case 0x2Au:
          v220 = 0;
          v221 = 0;
          v23 = 0;
          v5->_hasMlPredictedCellBW = 1;
          while (2)
          {
            v222 = *v6;
            v223 = *(_QWORD *)&v4[v222];
            if (v223 == -1 || v223 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v224 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v223);
              *(_QWORD *)&v4[v222] = v223 + 1;
              v23 |= (unint64_t)(v224 & 0x7F) << v220;
              if (v224 < 0)
              {
                v220 += 7;
                v16 = v221++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_479;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_479:
          v235 = 212;
          goto LABEL_488;
        case 0x2Bu:
          v225 = 0;
          v226 = 0;
          v23 = 0;
          v5->_hasQbssLoad = 1;
          while (2)
          {
            v227 = *v6;
            v228 = *(_QWORD *)&v4[v227];
            if (v228 == -1 || v228 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v229 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v228);
              *(_QWORD *)&v4[v227] = v228 + 1;
              v23 |= (unint64_t)(v229 & 0x7F) << v225;
              if (v229 < 0)
              {
                v225 += 7;
                v16 = v226++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_483;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_483:
          v235 = 216;
          goto LABEL_488;
        case 0x2Cu:
          v230 = 0;
          v231 = 0;
          v23 = 0;
          v5->_hasLqmScorecellular = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_491;
          continue;
      }
      while (1)
      {
        v232 = *v6;
        v233 = *(_QWORD *)&v4[v232];
        if (v233 == -1 || v233 >= *(_QWORD *)&v4[*v7])
          break;
        v234 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v233);
        *(_QWORD *)&v4[v232] = v233 + 1;
        v23 |= (unint64_t)(v234 & 0x7F) << v230;
        if ((v234 & 0x80) == 0)
          goto LABEL_485;
        v230 += 7;
        v16 = v231++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_487;
        }
      }
      v4[*v8] = 1;
LABEL_485:
      if (v4[*v8])
        LODWORD(v23) = 0;
LABEL_487:
      v235 = 220;
LABEL_488:
      *(_DWORD *)((char *)&v5->super.super.isa + v235) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_491:
    v238 = 0;
  else
LABEL_492:
    v238 = v5;

  return v238;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_geohash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasCounter)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasEvent)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_ratType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRrcState)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCellNsaEnabled)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsFR1)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasCellARFCN)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCellBandInfo)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCellChannelBW)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCellRsrp)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCellSinr)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCellLteRSRQ)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCellNrRSRP)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCellNrRSRQ)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCellNrSNR)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasMaxDLCAConfigured)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasTotalConfiguredBw)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasNrConfiguredBw)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasNrTotalScheduledMimoLayers)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasTotalConfiguredMimoLayers)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasLteMaxScheduledMimoLayersInACell)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasNrMaxDlModulation)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasActualHighBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasActualLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasPActualLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasMaxOfActualLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasEstimatedHighBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasEstimatedLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasMovingAvgHighBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasMovingAvgLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCmDataSentCount)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCmDataSentDuration)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasTcpRTTAvg)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasTcpRTTvar)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasVideoStreamingStallTime)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasNumStall)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasStallDuration)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCellEstimatedBW)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCellLoad)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCellModelConfidenceLevel)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasMlPredictedCellBW)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasQbssLoad)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasLqmScorecellular)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceConnectivityContext writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceConnectivityContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  BMDeviceConnectivityContext *v20;
  id v21;
  uint64_t v22;
  id *v23;
  id *v24;
  id *v25;
  id v26;
  BMDeviceConnectivityContext *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  id v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  id v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  id v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  id v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  void *v235;
  id v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  void *v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  id v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  id v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  id v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  id v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  id v268;
  uint64_t v269;
  id v270;
  id v271;
  uint64_t v272;
  id v273;
  id v274;
  uint64_t v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  id v282;
  id v283;
  void *v284;
  id v285;
  void *v286;
  id v287;
  void *v288;
  void *v289;
  id v290;
  void *v291;
  id v292;
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
  id v316;
  void *v317;
  id v318;
  void *v319;
  id v320;
  void *v321;
  id v322;
  void *v323;
  id v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  _QWORD *v329;
  id v330;
  void *v331;
  id v332;
  void *v333;
  void *v334;
  void *v335;
  _QWORD *v336;
  void *v337;
  id v338;
  id v339;
  void *v340;
  id v341;
  _QWORD *v342;
  void *v343;
  void *v344;
  id v345;
  void *v346;
  void *v347;
  id v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  id v388;
  id *v389;
  void *v390;
  id v391;
  void *v392;
  id v393;
  id v394;
  BMDeviceConnectivityContext *v395;
  id v396;
  void *v397;
  id v398;
  void *v399;
  id v400;
  id v401;
  void *v402;
  void *v403;
  uint64_t v404;
  void *v405;
  uint64_t v406;
  void *v407;
  uint64_t v408;
  id v409;
  uint64_t v410;
  id v411;
  uint64_t v412;
  id v413;
  uint64_t v414;
  id v415;
  uint64_t v416;
  id v417;
  uint64_t v418;
  id v419;
  uint64_t v420;
  id v421;
  uint64_t v422;
  id v423;
  uint64_t v424;
  id v425;
  uint64_t v426;
  id v427;
  uint64_t v428;
  id v429;
  uint64_t v430;
  id v431;
  uint64_t v432;
  id v433;
  uint64_t v434;
  id v435;
  uint64_t v436;
  id v437;
  uint64_t v438;
  id v439;
  uint64_t v440;
  id v441;
  uint64_t v442;
  id v443;
  uint64_t v444;
  id v445;
  uint64_t v446;
  id v447;
  uint64_t v448;
  id v449;
  uint64_t v450;
  id v451;
  uint64_t v452;
  id v453;
  uint64_t v454;
  id v455;
  uint64_t v456;
  void *v457;
  uint64_t v458;
  void *v459;
  uint64_t v460;
  id v461;
  uint64_t v462;
  void *v463;
  uint64_t v464;
  id v465;
  uint64_t v466;
  id v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  void *v471;
  uint64_t v472;
  _QWORD *v473;
  uint64_t v474;
  id v475;
  uint64_t v476;
  id v477;
  uint64_t v478;
  id v479;
  uint64_t v480;
  id v481;
  uint64_t v482;
  id v483;
  uint64_t v484;
  id v485;
  uint64_t v486;
  id v487;
  uint64_t v488;
  id *v489;
  uint64_t v490;
  _QWORD v491[3];

  v491[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("geohash"));
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v403 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v401 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v401 = v403;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("counter"));
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v402 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v400 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v400 = v402;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("event"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v8 = a4;
        a4 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = a4;
        a4 = v7;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ratType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v398 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v398 = v9;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rrcState"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v395 = self;
          if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v392 = v10;
            v396 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v392 = v10;
            v396 = v10;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellNsaEnabled"));
            v399 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v399 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v394 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v394 = v399;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isFR1"));
              v397 = (void *)objc_claimAutoreleasedReturnValue();
              v389 = a4;
              if (!v397 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v391 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v391 = v397;
LABEL_22:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellARFCN"));
                v11 = objc_claimAutoreleasedReturnValue();
                v390 = (void *)v11;
                if (!v11 || (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v388 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v388 = v12;
LABEL_25:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellBandInfo"));
                  v13 = objc_claimAutoreleasedReturnValue();
                  v349 = (void *)v13;
                  if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v348 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v348 = v14;
LABEL_28:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellChannelBW"));
                    v15 = objc_claimAutoreleasedReturnValue();
                    v346 = (void *)v15;
                    if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v345 = 0;
LABEL_31:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellRsrp"));
                      v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                      v344 = v17;
                      if (!v17)
                        goto LABEL_69;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v17 = 0;
                        goto LABEL_69;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v17 = v17;
LABEL_69:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellSinr"));
                        v48 = v8;
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v342 = v17;
                        if (!v49 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v341 = 0;
                          goto LABEL_72;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v341 = v49;
LABEL_72:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellLteRSRQ"));
                          v50 = objc_claimAutoreleasedReturnValue();
                          v343 = (void *)v50;
                          if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v336 = 0;
                            goto LABEL_75;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v336 = v51;
LABEL_75:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellNrRSRP"));
                            v52 = objc_claimAutoreleasedReturnValue();
                            v337 = (void *)v52;
                            if (!v52 || (v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v54 = v49;
                              v338 = 0;
                              goto LABEL_78;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v54 = v49;
                              v338 = v53;
LABEL_78:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellNrRSRQ"));
                              v55 = objc_claimAutoreleasedReturnValue();
                              v333 = v54;
                              v335 = (void *)v55;
                              if (!v55 || (v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v57 = 0;
                                goto LABEL_81;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v57 = v56;
LABEL_81:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellNrSNR"));
                                v58 = objc_claimAutoreleasedReturnValue();
                                v334 = (void *)v58;
                                if (!v58 || (v59 = (void *)v58, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v329 = v48;
                                  v339 = 0;
LABEL_84:
                                  v330 = v57;
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxDLCAConfigured"));
                                  v60 = objc_claimAutoreleasedReturnValue();
                                  v331 = (void *)v60;
                                  if (!v60)
                                  {
                                    v332 = 0;
                                    v63 = v339;
                                    goto LABEL_119;
                                  }
                                  v61 = (void *)v60;
                                  objc_opt_class();
                                  v62 = v339;
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v63 = v339;
                                    v332 = 0;
                                    goto LABEL_119;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v63 = v339;
                                    v332 = v61;
LABEL_119:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalConfiguredBw"));
                                    v89 = objc_claimAutoreleasedReturnValue();
                                    v328 = (void *)v89;
                                    if (!v89
                                      || (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v91 = 0;
LABEL_122:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nrConfiguredBw"));
                                      v62 = v63;
                                      v92 = (id)objc_claimAutoreleasedReturnValue();
                                      v327 = v92;
                                      v340 = v62;
                                      if (!v92)
                                        goto LABEL_137;
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v92 = 0;
                                        goto LABEL_137;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v92 = v92;
LABEL_137:
                                        v101 = v91;
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nrTotalScheduledMimoLayers"));
                                        v102 = objc_claimAutoreleasedReturnValue();
                                        v325 = (void *)v102;
                                        v326 = v92;
                                        if (!v102
                                          || (v103 = (void *)v102, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v324 = 0;
LABEL_140:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalConfiguredMimoLayers"));
                                          v104 = objc_claimAutoreleasedReturnValue();
                                          v105 = v101;
                                          v323 = (void *)v104;
                                          if (!v104)
                                          {
                                            v322 = 0;
                                            v62 = v340;
                                            goto LABEL_156;
                                          }
                                          v106 = (void *)v104;
                                          objc_opt_class();
                                          v62 = v340;
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v322 = 0;
                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v322 = v106;
LABEL_156:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lteMaxScheduledMimoLayersInACell"));
                                            v115 = objc_claimAutoreleasedReturnValue();
                                            v321 = (void *)v115;
                                            if (!v115
                                              || (v116 = (void *)v115,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v320 = 0;
                                              goto LABEL_159;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v320 = v116;
LABEL_159:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nrMaxDlModulation"));
                                              v117 = objc_claimAutoreleasedReturnValue();
                                              v319 = (void *)v117;
                                              if (!v117
                                                || (v118 = (void *)v117,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v318 = 0;
                                                goto LABEL_162;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v318 = v118;
LABEL_162:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actualHighBandwidth"));
                                                v119 = objc_claimAutoreleasedReturnValue();
                                                v317 = (void *)v119;
                                                if (!v119
                                                  || (v120 = (void *)v119,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v316 = 0;
                                                  goto LABEL_165;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v316 = v120;
LABEL_165:
                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actualLowBandwidth"));
                                                  v121 = objc_claimAutoreleasedReturnValue();
                                                  v315 = (void *)v121;
                                                  if (!v121
                                                    || (v122 = (void *)v121,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v314 = 0;
                                                    goto LABEL_168;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v314 = v122;
LABEL_168:
                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pActualLowBandwidth"));
                                                    v123 = objc_claimAutoreleasedReturnValue();
                                                    v313 = (void *)v123;
                                                    if (!v123
                                                      || (v124 = (void *)v123,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v312 = 0;
                                                      goto LABEL_171;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v312 = v124;
LABEL_171:
                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxOfActualLowBandwidth"));
                                                      v125 = objc_claimAutoreleasedReturnValue();
                                                      v311 = (void *)v125;
                                                      if (!v125
                                                        || (v126 = (void *)v125,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v310 = 0;
                                                        goto LABEL_174;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v310 = v126;
LABEL_174:
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("estimatedHighBandwidth"));
                                                        v127 = objc_claimAutoreleasedReturnValue();
                                                        v309 = (void *)v127;
                                                        if (!v127
                                                          || (v128 = (void *)v127,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v308 = 0;
                                                          goto LABEL_177;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v308 = v128;
LABEL_177:
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("estimatedLowBandwidth"));
                                                          v129 = objc_claimAutoreleasedReturnValue();
                                                          v307 = (void *)v129;
                                                          if (!v129
                                                            || (v130 = (void *)v129,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v306 = 0;
                                                            goto LABEL_180;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v306 = v130;
LABEL_180:
                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("movingAvgHighBandwidth"));
                                                            v131 = objc_claimAutoreleasedReturnValue();
                                                            v305 = (void *)v131;
                                                            if (!v131
                                                              || (v132 = (void *)v131,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v304 = 0;
                                                              goto LABEL_183;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v304 = v132;
LABEL_183:
                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("movingAvgLowBandwidth"));
                                                              v133 = objc_claimAutoreleasedReturnValue();
                                                              v303 = (void *)v133;
                                                              if (!v133
                                                                || (v134 = (void *)v133,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v302 = 0;
                                                                goto LABEL_186;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v302 = v134;
LABEL_186:
                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cmDataSentCount"));
                                                                v135 = objc_claimAutoreleasedReturnValue();
                                                                v300 = (void *)v135;
                                                                if (!v135
                                                                  || (v136 = (void *)v135,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v301 = 0;
                                                                  goto LABEL_189;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v301 = v136;
LABEL_189:
                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cmDataSentDuration"));
                                                                  v137 = objc_claimAutoreleasedReturnValue();
                                                                  v298 = (void *)v137;
                                                                  if (!v137
                                                                    || (v138 = (void *)v137,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v299 = 0;
                                                                    goto LABEL_192;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v299 = v138;
LABEL_192:
                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tcpRTTAvg"));
                                                                    v139 = objc_claimAutoreleasedReturnValue();
                                                                    v296 = (void *)v139;
                                                                    if (!v139
                                                                      || (v140 = (void *)v139,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v297 = 0;
LABEL_195:
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tcpRTTvar"));
                                                                      v141 = objc_claimAutoreleasedReturnValue();
                                                                      v294 = (void *)v141;
                                                                      if (v141
                                                                        && (v142 = (void *)v141,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v235 = v105;
                                                                          if (!v329)
                                                                          {
                                                                            v295 = 0;
                                                                            v20 = 0;
                                                                            v37 = v392;
                                                                            v82 = v341;
                                                                            v48 = v336;
                                                                            v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_365;
                                                                          }
                                                                          v236 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v380 = v9;
                                                                          v237 = *MEMORY[0x1E0D025B8];
                                                                          v422 = *MEMORY[0x1E0CB2D50];
                                                                          v293 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tcpRTTvar"));
                                                                          v423 = v293;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v423, &v422, 1);
                                                                          v238 = objc_claimAutoreleasedReturnValue();
                                                                          v239 = v237;
                                                                          v9 = v380;
                                                                          v20 = 0;
                                                                          v295 = 0;
                                                                          *v329 = (id)objc_msgSend(v236, "initWithDomain:code:userInfo:", v239, 2, v238);
                                                                          v240 = (void *)v238;
                                                                          v37 = v392;
                                                                          v82 = v341;
                                                                          v48 = v336;
                                                                          v57 = v330;
                                                                          v105 = v235;
                                                                          v62 = v340;
LABEL_364:

LABEL_365:
                                                                          v234 = v294;
                                                                          goto LABEL_366;
                                                                        }
                                                                        v295 = v142;
                                                                      }
                                                                      else
                                                                      {
                                                                        v295 = 0;
                                                                      }
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("videoStreamingStallTime"));
                                                                      v143 = objc_claimAutoreleasedReturnValue();
                                                                      v291 = (void *)v143;
                                                                      if (v143
                                                                        && (v144 = (void *)v143,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v241 = v105;
                                                                          if (!v329)
                                                                          {
                                                                            v293 = 0;
                                                                            v20 = 0;
                                                                            v37 = v392;
                                                                            v82 = v341;
                                                                            v48 = v336;
                                                                            v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_363;
                                                                          }
                                                                          v242 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v381 = v9;
                                                                          v243 = *MEMORY[0x1E0D025B8];
                                                                          v420 = *MEMORY[0x1E0CB2D50];
                                                                          v292 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("videoStreamingStallTime"));
                                                                          v421 = v292;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v421, &v420, 1);
                                                                          v244 = objc_claimAutoreleasedReturnValue();
                                                                          v245 = v243;
                                                                          v9 = v381;
                                                                          v20 = 0;
                                                                          v293 = 0;
                                                                          *v329 = (id)objc_msgSend(v242, "initWithDomain:code:userInfo:", v245, 2, v244);
                                                                          v246 = (void *)v244;
                                                                          v37 = v392;
                                                                          v82 = v341;
                                                                          v48 = v336;
                                                                          v57 = v330;
                                                                          v105 = v241;
                                                                          v62 = v340;
LABEL_362:

LABEL_363:
                                                                          v240 = v291;
                                                                          goto LABEL_364;
                                                                        }
                                                                        v293 = v144;
                                                                      }
                                                                      else
                                                                      {
                                                                        v293 = 0;
                                                                      }
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numStall"));
                                                                      v145 = objc_claimAutoreleasedReturnValue();
                                                                      v289 = (void *)v145;
                                                                      if (v145
                                                                        && (v146 = (void *)v145,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          if (!v329)
                                                                          {
                                                                            v292 = 0;
                                                                            v20 = 0;
                                                                            v37 = v392;
                                                                            v82 = v341;
                                                                            v48 = v336;
                                                                            v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_361;
                                                                          }
                                                                          v247 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v382 = v9;
                                                                          v248 = *MEMORY[0x1E0D025B8];
                                                                          v418 = *MEMORY[0x1E0CB2D50];
                                                                          v290 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numStall"));
                                                                          v419 = v290;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v419, &v418, 1);
                                                                          v249 = objc_claimAutoreleasedReturnValue();
                                                                          v250 = v248;
                                                                          v9 = v382;
                                                                          v288 = (void *)v249;
                                                                          v20 = 0;
                                                                          v292 = 0;
                                                                          *v329 = (id)objc_msgSend(v247, "initWithDomain:code:userInfo:", v250, 2);
                                                                          goto LABEL_413;
                                                                        }
                                                                        v292 = v146;
                                                                      }
                                                                      else
                                                                      {
                                                                        v292 = 0;
                                                                      }
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stallDuration"));
                                                                      v147 = objc_claimAutoreleasedReturnValue();
                                                                      v288 = (void *)v147;
                                                                      if (!v147
                                                                        || (v148 = (void *)v147,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v290 = 0;
                                                                        goto LABEL_207;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v290 = v148;
LABEL_207:
                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellEstimatedBW"));
                                                                        v149 = objc_claimAutoreleasedReturnValue();
                                                                        v286 = (void *)v149;
                                                                        if (!v149
                                                                          || (v150 = (void *)v149,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          v287 = 0;
                                                                          goto LABEL_210;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v287 = v150;
LABEL_210:
                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellLoad"));
                                                                          v151 = objc_claimAutoreleasedReturnValue();
                                                                          v284 = (void *)v151;
                                                                          if (!v151
                                                                            || (v152 = (void *)v151,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            v285 = 0;
                                                                            goto LABEL_213;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v285 = v152;
LABEL_213:
                                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellModelConfidenceLevel"));
                                                                            v153 = objc_claimAutoreleasedReturnValue();
                                                                            v281 = (void *)v153;
                                                                            if (!v153
                                                                              || (v154 = (void *)v153,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              v283 = 0;
LABEL_216:
                                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mlPredictedCellBW"));
                                                                              v155 = objc_claimAutoreleasedReturnValue();
                                                                              v280 = (void *)v155;
                                                                              if (v155
                                                                                && (v156 = (void *)v155,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (!v329)
                                                                                  {
                                                                                    v282 = 0;
                                                                                    v20 = 0;
                                                                                    v37 = v392;
                                                                                    v82 = v341;
                                                                                    v48 = v336;
                                                                                    v62 = v340;
                                                                                    v57 = v330;
                                                                                    goto LABEL_356;
                                                                                  }
                                                                                  v268 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                  v269 = *MEMORY[0x1E0D025B8];
                                                                                  v408 = *MEMORY[0x1E0CB2D50];
                                                                                  v393 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mlPredictedCellBW"));
                                                                                  v409 = v393;
                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v409, &v408, 1);
                                                                                  v347 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v270 = (id)objc_msgSend(v268, "initWithDomain:code:userInfo:", v269, 2);
                                                                                  v20 = 0;
                                                                                  v282 = 0;
                                                                                  *v329 = v270;
                                                                                  goto LABEL_425;
                                                                                }
                                                                                v282 = v156;
                                                                              }
                                                                              else
                                                                              {
                                                                                v282 = 0;
                                                                              }
                                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("qbssLoad"));
                                                                              v157 = objc_claimAutoreleasedReturnValue();
                                                                              v347 = (void *)v157;
                                                                              if (!v157
                                                                                || (v158 = (void *)v157,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                v393 = 0;
LABEL_222:
                                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lqmScorecellular"));
                                                                                v159 = (id)objc_claimAutoreleasedReturnValue();
                                                                                v57 = v330;
                                                                                v279 = v159;
                                                                                if (v159)
                                                                                {
                                                                                  v160 = v159;
                                                                                  objc_opt_class();
                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                  {
                                                                                    v159 = 0;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                    {
                                                                                      v387 = v9;
                                                                                      if (v329)
                                                                                      {
                                                                                        v274 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                        v275 = *MEMORY[0x1E0D025B8];
                                                                                        v404 = *MEMORY[0x1E0CB2D50];
                                                                                        v276 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lqmScorecellular"));
                                                                                        v405 = v276;
                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v405, &v404, 1);
                                                                                        v277 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        *v329 = (id)objc_msgSend(v274, "initWithDomain:code:userInfo:", v275, 2, v277);

                                                                                      }
                                                                                      v278 = 0;
                                                                                      v20 = 0;
                                                                                      v9 = v387;
                                                                                      v37 = v392;
                                                                                      v82 = v341;
                                                                                      v48 = v336;
                                                                                      goto LABEL_354;
                                                                                    }
                                                                                    v159 = v160;
                                                                                  }
                                                                                }
                                                                                v37 = v392;
                                                                                v278 = v159;
                                                                                v48 = v336;
                                                                                v82 = v341;
                                                                                v20 = objc_retain(-[BMDeviceConnectivityContext initWithGeohash:counter:event:ratType:rrcState:cellNsaEnabled:isFR1:cellARFCN:cellBandInfo:cellChannelBW:cellRsrp:cellSinr:cellLteRSRQ:cellNrRSRP:cellNrRSRQ:cellNrSNR:maxDLCAConfigured:totalConfiguredBw:nrConfiguredBw:nrTotalScheduledMimoLayers:totalConfiguredMimoLayers:lteMaxScheduledMimoLayersInACell:nrMaxDlModulation:actualHighBandwidth:actualLowBandwidth:pActualLowBandwidth:maxOfActualLowBandwidth:estimatedHighBandwidth:estimatedLowBandwidth:movingAvgHighBandwidth:movingAvgLowBandwidth:cmDataSentCount:cmDataSentDuration:tcpRTTAvg:tcpRTTvar:videoStreamingStallTime:numStall:stallDuration:cellEstimatedBW:cellLoad:cellModelConfidenceLevel:mlPredictedCellBW:qbssLoad:lqmScorecellular:](v395, "initWithGeohash:counter:event:ratType:rrcState:cellNsaEnabled:isFR1:cellARFCN:cellBandInfo:cellChannelBW:cellRsrp:cellSinr:cellLteRSRQ:cellNrRSRP:cellNrRSRQ:cellNrSNR:maxDLCAConfigured:totalConfiguredBw:nrConfiguredBw:nrTotalScheduledMimoLayers:totalConfiguredMimoLayers:lteMaxScheduledMimoLayersInACell:nrMaxDlModulation:actualHighBandwidth:actualLowBandwidth:pActualLowBandwidth:maxOfActualLowBandwidth:estimatedHighBandwidth:estimatedLowBandwidth:movingAvgHighBandwidth:movingAvgLowBandwidth:cmDataSentCount"
                                                                                          ":cmDataSentDuration:tcpRTTAvg:"
                                                                                          "tcpRTTvar:videoStreamingStallT"
                                                                                          "ime:numStall:stallDuration:cel"
                                                                                          "lEstimatedBW:cellLoad:cellMode"
                                                                                          "lConfidenceLevel:mlPredictedCe"
                                                                                          "llBW:qbssLoad:lqmScorecellular:",
                                                                                          v401,
                                                                                          v400,
                                                                                          v389,
                                                                                          v398,
                                                                                          v396,
                                                                                          v394,
                                                                                          v391,
                                                                                          v388,
                                                                                          v348,
                                                                                          v345,
                                                                                          v342,
                                                                                          v341,
                                                                                          v336,
                                                                                          v338,
                                                                                          v330,
                                                                                          v62,
                                                                                          v332,
                                                                                          v105,
                                                                                          v326,
                                                                                          v324,
                                                                                          v322,
                                                                                          v320,
                                                                                          v318,
                                                                                          v316,
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
                                                                                          v292,
                                                                                          v290,
                                                                                          v287,
                                                                                          v285,
                                                                                          v283,
                                                                                          v282,
                                                                                          v393,
                                                                                          v159));
                                                                                v395 = v20;
LABEL_354:

LABEL_355:
LABEL_356:

LABEL_357:
LABEL_358:

LABEL_359:
LABEL_360:

LABEL_361:
                                                                                v246 = v289;
                                                                                goto LABEL_362;
                                                                              }
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                v393 = v158;
                                                                                goto LABEL_222;
                                                                              }
                                                                              if (v329)
                                                                              {
                                                                                v271 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v272 = *MEMORY[0x1E0D025B8];
                                                                                v406 = *MEMORY[0x1E0CB2D50];
                                                                                v278 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("qbssLoad"));
                                                                                v407 = v278;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v407, &v406, 1);
                                                                                v279 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                v273 = (id)objc_msgSend(v271, "initWithDomain:code:userInfo:", v272, 2);
                                                                                v20 = 0;
                                                                                v393 = 0;
                                                                                *v329 = v273;
                                                                                v37 = v392;
                                                                                v82 = v341;
                                                                                v48 = v336;
                                                                                v62 = v340;
                                                                                v57 = v330;
                                                                                goto LABEL_354;
                                                                              }
                                                                              v393 = 0;
                                                                              v20 = 0;
LABEL_425:
                                                                              v37 = v392;
                                                                              v82 = v341;
                                                                              v48 = v336;
                                                                              v62 = v340;
                                                                              v57 = v330;
                                                                              goto LABEL_355;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v283 = v154;
                                                                              goto LABEL_216;
                                                                            }
                                                                            if (v329)
                                                                            {
                                                                              v264 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v386 = v9;
                                                                              v265 = *MEMORY[0x1E0D025B8];
                                                                              v410 = *MEMORY[0x1E0CB2D50];
                                                                              v282 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellModelConfidenceLevel"));
                                                                              v411 = v282;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v411, &v410, 1);
                                                                              v266 = objc_claimAutoreleasedReturnValue();
                                                                              v267 = v265;
                                                                              v9 = v386;
                                                                              v280 = (void *)v266;
                                                                              v20 = 0;
                                                                              v283 = 0;
                                                                              *v329 = (id)objc_msgSend(v264, "initWithDomain:code:userInfo:", v267, 2);
                                                                              v37 = v392;
                                                                              v82 = v341;
                                                                              v48 = v336;
                                                                              v57 = v330;
                                                                              v62 = v340;
                                                                              goto LABEL_356;
                                                                            }
                                                                            v283 = 0;
                                                                            v20 = 0;
LABEL_422:
                                                                            v37 = v392;
                                                                            v82 = v341;
                                                                            v48 = v336;
                                                                            v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_357;
                                                                          }
                                                                          if (v329)
                                                                          {
                                                                            v260 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v385 = v9;
                                                                            v261 = *MEMORY[0x1E0D025B8];
                                                                            v412 = *MEMORY[0x1E0CB2D50];
                                                                            v283 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellLoad"));
                                                                            v413 = v283;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v413, &v412, 1);
                                                                            v262 = objc_claimAutoreleasedReturnValue();
                                                                            v263 = v261;
                                                                            v9 = v385;
                                                                            v281 = (void *)v262;
                                                                            v20 = 0;
                                                                            v285 = 0;
                                                                            *v329 = (id)objc_msgSend(v260, "initWithDomain:code:userInfo:", v263, 2);
                                                                            goto LABEL_422;
                                                                          }
                                                                          v285 = 0;
                                                                          v20 = 0;
LABEL_420:
                                                                          v37 = v392;
                                                                          v82 = v341;
                                                                          v48 = v336;
                                                                          v57 = v330;
                                                                          v62 = v340;
                                                                          goto LABEL_358;
                                                                        }
                                                                        if (v329)
                                                                        {
                                                                          v255 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v384 = v9;
                                                                          v256 = *MEMORY[0x1E0D025B8];
                                                                          v414 = *MEMORY[0x1E0CB2D50];
                                                                          v285 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellEstimatedBW"));
                                                                          v415 = v285;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v415, &v414, 1);
                                                                          v257 = objc_claimAutoreleasedReturnValue();
                                                                          v258 = v256;
                                                                          v9 = v384;
                                                                          v284 = (void *)v257;
                                                                          v20 = 0;
                                                                          v287 = 0;
                                                                          *v329 = (id)objc_msgSend(v255, "initWithDomain:code:userInfo:", v258, 2);
                                                                          goto LABEL_420;
                                                                        }
                                                                        v287 = 0;
                                                                        v20 = 0;
LABEL_418:
                                                                        v37 = v392;
                                                                        v82 = v341;
                                                                        v48 = v336;
                                                                        v57 = v330;
                                                                        v62 = v340;
                                                                        goto LABEL_359;
                                                                      }
                                                                      if (v329)
                                                                      {
                                                                        v251 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v383 = v9;
                                                                        v252 = *MEMORY[0x1E0D025B8];
                                                                        v416 = *MEMORY[0x1E0CB2D50];
                                                                        v287 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stallDuration"));
                                                                        v417 = v287;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v417, &v416, 1);
                                                                        v253 = objc_claimAutoreleasedReturnValue();
                                                                        v254 = v252;
                                                                        v9 = v383;
                                                                        v286 = (void *)v253;
                                                                        v20 = 0;
                                                                        v290 = 0;
                                                                        *v329 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v254, 2);
                                                                        goto LABEL_418;
                                                                      }
                                                                      v290 = 0;
                                                                      v20 = 0;
LABEL_413:
                                                                      v37 = v392;
                                                                      v82 = v341;
                                                                      v48 = v336;
                                                                      v57 = v330;
                                                                      v62 = v340;
                                                                      goto LABEL_360;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v297 = v140;
                                                                      goto LABEL_195;
                                                                    }
                                                                    v229 = v105;
                                                                    if (v329)
                                                                    {
                                                                      v230 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v379 = v9;
                                                                      v231 = *MEMORY[0x1E0D025B8];
                                                                      v424 = *MEMORY[0x1E0CB2D50];
                                                                      v295 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tcpRTTAvg"));
                                                                      v425 = v295;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v425, &v424, 1);
                                                                      v232 = objc_claimAutoreleasedReturnValue();
                                                                      v233 = v231;
                                                                      v9 = v379;
                                                                      v20 = 0;
                                                                      v297 = 0;
                                                                      *v329 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v233, 2, v232);
                                                                      v234 = (void *)v232;
                                                                      v37 = v392;
                                                                      v82 = v341;
                                                                      v48 = v336;
                                                                      v57 = v330;
                                                                      v105 = v229;
                                                                      v62 = v340;
LABEL_366:

                                                                      goto LABEL_367;
                                                                    }
                                                                    v297 = 0;
                                                                    v20 = 0;
                                                                    v37 = v392;
                                                                    v82 = v341;
                                                                    v48 = v336;
                                                                    v57 = v330;
LABEL_350:
                                                                    v62 = v340;
LABEL_367:

                                                                    goto LABEL_368;
                                                                  }
                                                                  if (v329)
                                                                  {
                                                                    v225 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v378 = v9;
                                                                    v226 = *MEMORY[0x1E0D025B8];
                                                                    v426 = *MEMORY[0x1E0CB2D50];
                                                                    v297 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cmDataSentDuration"));
                                                                    v427 = v297;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v427, &v426, 1);
                                                                    v227 = objc_claimAutoreleasedReturnValue();
                                                                    v228 = v226;
                                                                    v9 = v378;
                                                                    v296 = (void *)v227;
                                                                    v20 = 0;
                                                                    v299 = 0;
                                                                    *v329 = (id)objc_msgSend(v225, "initWithDomain:code:userInfo:", v228, 2);
                                                                    v37 = v392;
                                                                    v82 = v341;
                                                                    v48 = v336;
                                                                    v57 = v330;
                                                                    goto LABEL_350;
                                                                  }
                                                                  v299 = 0;
                                                                  v20 = 0;
LABEL_344:
                                                                  v37 = v392;
                                                                  v82 = v341;
                                                                  v48 = v336;
                                                                  v57 = v330;
                                                                  v62 = v340;
LABEL_368:

                                                                  goto LABEL_369;
                                                                }
                                                                if (v329)
                                                                {
                                                                  v221 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v377 = v9;
                                                                  v222 = *MEMORY[0x1E0D025B8];
                                                                  v428 = *MEMORY[0x1E0CB2D50];
                                                                  v299 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cmDataSentCount"));
                                                                  v429 = v299;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v429, &v428, 1);
                                                                  v223 = objc_claimAutoreleasedReturnValue();
                                                                  v224 = v222;
                                                                  v9 = v377;
                                                                  v298 = (void *)v223;
                                                                  v20 = 0;
                                                                  v301 = 0;
                                                                  *v329 = (id)objc_msgSend(v221, "initWithDomain:code:userInfo:", v224, 2);
                                                                  goto LABEL_344;
                                                                }
                                                                v301 = 0;
                                                                v20 = 0;
LABEL_338:
                                                                v37 = v392;
                                                                v82 = v341;
                                                                v48 = v336;
                                                                v57 = v330;
                                                                v62 = v340;
LABEL_369:

                                                                goto LABEL_370;
                                                              }
                                                              if (v329)
                                                              {
                                                                v217 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v376 = v9;
                                                                v218 = *MEMORY[0x1E0D025B8];
                                                                v430 = *MEMORY[0x1E0CB2D50];
                                                                v301 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("movingAvgLowBandwidth"));
                                                                v431 = v301;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v431, &v430, 1);
                                                                v219 = objc_claimAutoreleasedReturnValue();
                                                                v220 = v218;
                                                                v9 = v376;
                                                                v300 = (void *)v219;
                                                                v20 = 0;
                                                                v302 = 0;
                                                                *v329 = (id)objc_msgSend(v217, "initWithDomain:code:userInfo:", v220, 2);
                                                                goto LABEL_338;
                                                              }
                                                              v302 = 0;
                                                              v20 = 0;
LABEL_332:
                                                              v37 = v392;
                                                              v82 = v341;
                                                              v48 = v336;
                                                              v57 = v330;
                                                              v62 = v340;
LABEL_370:

                                                              goto LABEL_371;
                                                            }
                                                            if (v329)
                                                            {
                                                              v213 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v375 = v9;
                                                              v214 = *MEMORY[0x1E0D025B8];
                                                              v432 = *MEMORY[0x1E0CB2D50];
                                                              v302 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("movingAvgHighBandwidth"));
                                                              v433 = v302;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v433, &v432, 1);
                                                              v215 = objc_claimAutoreleasedReturnValue();
                                                              v216 = v214;
                                                              v9 = v375;
                                                              v303 = (void *)v215;
                                                              v20 = 0;
                                                              v304 = 0;
                                                              *v329 = (id)objc_msgSend(v213, "initWithDomain:code:userInfo:", v216, 2);
                                                              goto LABEL_332;
                                                            }
                                                            v304 = 0;
                                                            v20 = 0;
LABEL_326:
                                                            v37 = v392;
                                                            v82 = v341;
                                                            v48 = v336;
                                                            v57 = v330;
                                                            v62 = v340;
LABEL_371:

                                                            goto LABEL_372;
                                                          }
                                                          if (v329)
                                                          {
                                                            v209 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v374 = v9;
                                                            v210 = *MEMORY[0x1E0D025B8];
                                                            v434 = *MEMORY[0x1E0CB2D50];
                                                            v304 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("estimatedLowBandwidth"));
                                                            v435 = v304;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v435, &v434, 1);
                                                            v211 = objc_claimAutoreleasedReturnValue();
                                                            v212 = v210;
                                                            v9 = v374;
                                                            v305 = (void *)v211;
                                                            v20 = 0;
                                                            v306 = 0;
                                                            *v329 = (id)objc_msgSend(v209, "initWithDomain:code:userInfo:", v212, 2);
                                                            goto LABEL_326;
                                                          }
                                                          v306 = 0;
                                                          v20 = 0;
LABEL_320:
                                                          v37 = v392;
                                                          v82 = v341;
                                                          v48 = v336;
                                                          v57 = v330;
                                                          v62 = v340;
LABEL_372:

                                                          goto LABEL_373;
                                                        }
                                                        if (v329)
                                                        {
                                                          v205 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v373 = v9;
                                                          v206 = *MEMORY[0x1E0D025B8];
                                                          v436 = *MEMORY[0x1E0CB2D50];
                                                          v306 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("estimatedHighBandwidth"));
                                                          v437 = v306;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v437, &v436, 1);
                                                          v207 = objc_claimAutoreleasedReturnValue();
                                                          v208 = v206;
                                                          v9 = v373;
                                                          v307 = (void *)v207;
                                                          v20 = 0;
                                                          v308 = 0;
                                                          *v329 = (id)objc_msgSend(v205, "initWithDomain:code:userInfo:", v208, 2);
                                                          goto LABEL_320;
                                                        }
                                                        v308 = 0;
                                                        v20 = 0;
LABEL_314:
                                                        v37 = v392;
                                                        v82 = v341;
                                                        v48 = v336;
                                                        v57 = v330;
                                                        v62 = v340;
LABEL_373:

                                                        goto LABEL_374;
                                                      }
                                                      if (v329)
                                                      {
                                                        v201 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v372 = v9;
                                                        v202 = *MEMORY[0x1E0D025B8];
                                                        v438 = *MEMORY[0x1E0CB2D50];
                                                        v308 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("maxOfActualLowBandwidth"));
                                                        v439 = v308;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v439, &v438, 1);
                                                        v203 = objc_claimAutoreleasedReturnValue();
                                                        v204 = v202;
                                                        v9 = v372;
                                                        v309 = (void *)v203;
                                                        v20 = 0;
                                                        v310 = 0;
                                                        *v329 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v204, 2);
                                                        goto LABEL_314;
                                                      }
                                                      v310 = 0;
                                                      v20 = 0;
LABEL_308:
                                                      v37 = v392;
                                                      v82 = v341;
                                                      v48 = v336;
                                                      v57 = v330;
                                                      v62 = v340;
LABEL_374:

                                                      goto LABEL_375;
                                                    }
                                                    if (v329)
                                                    {
                                                      v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v371 = v9;
                                                      v198 = *MEMORY[0x1E0D025B8];
                                                      v440 = *MEMORY[0x1E0CB2D50];
                                                      v310 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("pActualLowBandwidth"));
                                                      v441 = v310;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v441, &v440, 1);
                                                      v199 = objc_claimAutoreleasedReturnValue();
                                                      v200 = v198;
                                                      v9 = v371;
                                                      v311 = (void *)v199;
                                                      v20 = 0;
                                                      v312 = 0;
                                                      *v329 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v200, 2);
                                                      goto LABEL_308;
                                                    }
                                                    v312 = 0;
                                                    v20 = 0;
LABEL_302:
                                                    v37 = v392;
                                                    v82 = v341;
                                                    v48 = v336;
                                                    v57 = v330;
                                                    v62 = v340;
LABEL_375:

                                                    goto LABEL_376;
                                                  }
                                                  if (v329)
                                                  {
                                                    v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v370 = v9;
                                                    v194 = *MEMORY[0x1E0D025B8];
                                                    v442 = *MEMORY[0x1E0CB2D50];
                                                    v312 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("actualLowBandwidth"));
                                                    v443 = v312;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v443, &v442, 1);
                                                    v195 = objc_claimAutoreleasedReturnValue();
                                                    v196 = v194;
                                                    v9 = v370;
                                                    v313 = (void *)v195;
                                                    v20 = 0;
                                                    v314 = 0;
                                                    *v329 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v196, 2);
                                                    goto LABEL_302;
                                                  }
                                                  v314 = 0;
                                                  v20 = 0;
LABEL_296:
                                                  v37 = v392;
                                                  v82 = v341;
                                                  v48 = v336;
                                                  v57 = v330;
                                                  v62 = v340;
LABEL_376:

                                                  goto LABEL_377;
                                                }
                                                if (v329)
                                                {
                                                  v189 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v369 = v9;
                                                  v190 = *MEMORY[0x1E0D025B8];
                                                  v444 = *MEMORY[0x1E0CB2D50];
                                                  v314 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("actualHighBandwidth"));
                                                  v445 = v314;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v445, &v444, 1);
                                                  v191 = objc_claimAutoreleasedReturnValue();
                                                  v192 = v190;
                                                  v9 = v369;
                                                  v315 = (void *)v191;
                                                  v20 = 0;
                                                  v316 = 0;
                                                  *v329 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v192, 2);
                                                  goto LABEL_296;
                                                }
                                                v316 = 0;
                                                v20 = 0;
LABEL_290:
                                                v37 = v392;
                                                v82 = v341;
                                                v48 = v336;
                                                v57 = v330;
                                                v62 = v340;
LABEL_377:

                                                goto LABEL_378;
                                              }
                                              if (v329)
                                              {
                                                v185 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v368 = v9;
                                                v186 = *MEMORY[0x1E0D025B8];
                                                v446 = *MEMORY[0x1E0CB2D50];
                                                v316 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("nrMaxDlModulation"));
                                                v447 = v316;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v447, &v446, 1);
                                                v187 = objc_claimAutoreleasedReturnValue();
                                                v188 = v186;
                                                v9 = v368;
                                                v317 = (void *)v187;
                                                v20 = 0;
                                                v318 = 0;
                                                *v329 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v188, 2);
                                                goto LABEL_290;
                                              }
                                              v318 = 0;
                                              v20 = 0;
LABEL_284:
                                              v37 = v392;
                                              v82 = v341;
                                              v48 = v336;
                                              v57 = v330;
                                              v62 = v340;
LABEL_378:

                                              goto LABEL_379;
                                            }
                                            if (v329)
                                            {
                                              v181 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v367 = v9;
                                              v182 = *MEMORY[0x1E0D025B8];
                                              v448 = *MEMORY[0x1E0CB2D50];
                                              v318 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lteMaxScheduledMimoLayersInACell"));
                                              v449 = v318;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v449, &v448, 1);
                                              v183 = objc_claimAutoreleasedReturnValue();
                                              v184 = v182;
                                              v9 = v367;
                                              v319 = (void *)v183;
                                              v20 = 0;
                                              v320 = 0;
                                              *v329 = (id)objc_msgSend(v181, "initWithDomain:code:userInfo:", v184, 2);
                                              goto LABEL_284;
                                            }
                                            v320 = 0;
                                            v20 = 0;
                                            v37 = v392;
                                            v82 = v341;
                                            v48 = v336;
                                            v57 = v330;
                                            v62 = v340;
LABEL_379:

                                            goto LABEL_380;
                                          }
                                          if (v329)
                                          {
                                            v177 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v366 = v9;
                                            v178 = *MEMORY[0x1E0D025B8];
                                            v450 = *MEMORY[0x1E0CB2D50];
                                            v320 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalConfiguredMimoLayers"));
                                            v451 = v320;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v451, &v450, 1);
                                            v179 = objc_claimAutoreleasedReturnValue();
                                            v180 = v178;
                                            v9 = v366;
                                            v321 = (void *)v179;
                                            v20 = 0;
                                            v322 = 0;
                                            *v329 = (id)objc_msgSend(v177, "initWithDomain:code:userInfo:", v180, 2);
                                            v37 = v392;
                                            v82 = v341;
                                            v48 = v336;
                                            v57 = v330;
                                            goto LABEL_379;
                                          }
                                          v322 = 0;
                                          v20 = 0;
                                          v37 = v392;
                                          v82 = v341;
                                          v48 = v336;
                                          v57 = v330;
LABEL_380:

                                          goto LABEL_381;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v324 = v103;
                                          goto LABEL_140;
                                        }
                                        if (v329)
                                        {
                                          v173 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v365 = v9;
                                          v174 = *MEMORY[0x1E0D025B8];
                                          v452 = *MEMORY[0x1E0CB2D50];
                                          v322 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("nrTotalScheduledMimoLayers"));
                                          v453 = v322;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v453, &v452, 1);
                                          v175 = objc_claimAutoreleasedReturnValue();
                                          v176 = v174;
                                          v9 = v365;
                                          v323 = (void *)v175;
                                          v20 = 0;
                                          v324 = 0;
                                          *v329 = (id)objc_msgSend(v173, "initWithDomain:code:userInfo:", v176, 2);
                                          v37 = v392;
                                          v82 = v341;
                                          v48 = v336;
                                          v57 = v330;
                                          v105 = v101;
                                          v62 = v340;
                                          goto LABEL_380;
                                        }
                                        v324 = 0;
                                        v20 = 0;
                                        v37 = v392;
                                        v82 = v341;
                                        v48 = v336;
                                        v57 = v330;
                                        v105 = v101;
                                        v62 = v340;
LABEL_381:

                                        goto LABEL_382;
                                      }
                                      if (v329)
                                      {
                                        v169 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v364 = v9;
                                        v170 = *MEMORY[0x1E0D025B8];
                                        v454 = *MEMORY[0x1E0CB2D50];
                                        v324 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("nrConfiguredBw"));
                                        v455 = v324;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v455, &v454, 1);
                                        v171 = objc_claimAutoreleasedReturnValue();
                                        v172 = v170;
                                        v9 = v364;
                                        v325 = (void *)v171;
                                        v20 = 0;
                                        v326 = 0;
                                        *v329 = (id)objc_msgSend(v169, "initWithDomain:code:userInfo:", v172, 2);
                                        v37 = v392;
                                        v82 = v341;
                                        v48 = v336;
                                        v105 = v91;
                                        v57 = v330;
                                        goto LABEL_381;
                                      }
                                      v326 = 0;
                                      v20 = 0;
                                      v37 = v392;
                                      v82 = v341;
                                      v48 = v336;
                                      v105 = v91;
                                      v57 = v330;
LABEL_382:

                                      goto LABEL_383;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v91 = v90;
                                      goto LABEL_122;
                                    }
                                    if (v329)
                                    {
                                      v165 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v363 = v9;
                                      v166 = *MEMORY[0x1E0D025B8];
                                      v456 = *MEMORY[0x1E0CB2D50];
                                      v326 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalConfiguredBw"));
                                      v457 = v326;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v457, &v456, 1);
                                      v167 = objc_claimAutoreleasedReturnValue();
                                      v168 = v166;
                                      v9 = v363;
                                      v327 = (void *)v167;
                                      v20 = 0;
                                      *v329 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v168, 2);
                                      v37 = v392;
                                      v82 = v341;
                                      v48 = v336;
                                      v62 = v63;
                                      v105 = 0;
                                      goto LABEL_382;
                                    }
                                    v20 = 0;
                                    v37 = v392;
                                    v82 = v341;
                                    v48 = v336;
                                    v62 = v63;
                                    v105 = 0;
LABEL_383:

                                    goto LABEL_384;
                                  }
                                  if (v329)
                                  {
                                    v161 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v362 = v9;
                                    v162 = *MEMORY[0x1E0D025B8];
                                    v458 = *MEMORY[0x1E0CB2D50];
                                    v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("maxDLCAConfigured"));
                                    v459 = v105;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v459, &v458, 1);
                                    v163 = objc_claimAutoreleasedReturnValue();
                                    v164 = v162;
                                    v9 = v362;
                                    v328 = (void *)v163;
                                    v20 = 0;
                                    v332 = 0;
                                    *v329 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v164, 2);
                                    v37 = v392;
                                    v82 = v341;
                                    v48 = v336;
                                    goto LABEL_383;
                                  }
                                  v332 = 0;
                                  v20 = 0;
                                  v37 = v392;
                                  v82 = v341;
                                  v48 = v336;
LABEL_384:

                                  goto LABEL_385;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v329 = v48;
                                  v339 = v59;
                                  goto LABEL_84;
                                }
                                if (v48)
                                {
                                  v111 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v361 = v9;
                                  v112 = *MEMORY[0x1E0D025B8];
                                  v460 = *MEMORY[0x1E0CB2D50];
                                  v332 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellNrSNR"));
                                  v461 = v332;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v461, &v460, 1);
                                  v113 = objc_claimAutoreleasedReturnValue();
                                  v114 = v112;
                                  v9 = v361;
                                  v331 = (void *)v113;
                                  v20 = 0;
                                  *v48 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v114, 2);
                                  v37 = v392;
                                  v82 = v341;
                                  v48 = v336;
                                  v62 = 0;
                                  goto LABEL_384;
                                }
                                v20 = 0;
                                v37 = v392;
                                v82 = v341;
                                v48 = v336;
                                v62 = 0;
LABEL_385:

                                v49 = v333;
                                goto LABEL_386;
                              }
                              if (v48)
                              {
                                v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v360 = v9;
                                v108 = *MEMORY[0x1E0D025B8];
                                v462 = *MEMORY[0x1E0CB2D50];
                                v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellNrRSRQ"));
                                v463 = v62;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v463, &v462, 1);
                                v109 = objc_claimAutoreleasedReturnValue();
                                v110 = v108;
                                v9 = v360;
                                v334 = (void *)v109;
                                v20 = 0;
                                v57 = 0;
                                *v48 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v110, 2);
                                v37 = v392;
                                v82 = v341;
                                v48 = v336;
                                goto LABEL_385;
                              }
                              v57 = 0;
                              v20 = 0;
                              v37 = v392;
                              v82 = v341;
                              v48 = v336;
                              v49 = v54;
LABEL_386:

                              goto LABEL_387;
                            }
                            if (v48)
                            {
                              v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v359 = v9;
                              v98 = *MEMORY[0x1E0D025B8];
                              v464 = *MEMORY[0x1E0CB2D50];
                              v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellNrRSRP"));
                              v465 = v57;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v465, &v464, 1);
                              v99 = objc_claimAutoreleasedReturnValue();
                              v100 = v98;
                              v9 = v359;
                              v335 = (void *)v99;
                              v20 = 0;
                              v338 = 0;
                              *v48 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v100, 2);
                              v37 = v392;
                              v82 = v341;
                              v48 = v336;
                              goto LABEL_386;
                            }
                            v338 = 0;
                            v20 = 0;
                            v37 = v392;
                            v82 = v341;
                            v48 = v336;
LABEL_387:

                            goto LABEL_388;
                          }
                          if (v48)
                          {
                            v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v358 = v9;
                            v94 = *MEMORY[0x1E0D025B8];
                            v466 = *MEMORY[0x1E0CB2D50];
                            v338 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellLteRSRQ"));
                            v467 = v338;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v467, &v466, 1);
                            v95 = objc_claimAutoreleasedReturnValue();
                            v96 = v94;
                            v9 = v358;
                            v337 = (void *)v95;
                            v20 = 0;
                            *v48 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v96, 2);
                            v48 = 0;
                            v37 = v392;
                            v82 = v341;
                            goto LABEL_387;
                          }
                          v20 = 0;
                          v37 = v392;
                          v82 = v341;
LABEL_388:

                          v17 = v342;
                          goto LABEL_389;
                        }
                        if (v48)
                        {
                          v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v357 = v9;
                          v85 = *MEMORY[0x1E0D025B8];
                          v468 = *MEMORY[0x1E0CB2D50];
                          v86 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellSinr"));
                          v469 = v86;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v469, &v468, 1);
                          v87 = objc_claimAutoreleasedReturnValue();
                          v88 = v85;
                          v9 = v357;
                          v343 = (void *)v87;
                          v20 = 0;
                          v82 = 0;
                          *v48 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v88, 2);
                          v48 = (_QWORD *)v86;
                          v37 = v392;
                          goto LABEL_388;
                        }
                        v82 = 0;
                        v20 = 0;
LABEL_228:
                        v37 = v392;
LABEL_389:

                        goto LABEL_390;
                      }
                      v17 = v8;
                      if (v8)
                      {
                        v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v356 = v9;
                        v81 = *MEMORY[0x1E0D025B8];
                        v470 = *MEMORY[0x1E0CB2D50];
                        v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellRsrp"));
                        v471 = v82;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v471, &v470, 1);
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v83 = v81;
                        v9 = v356;
                        v20 = 0;
                        *v17 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v83, 2, v49);
                        v17 = 0;
                        goto LABEL_228;
                      }
                      v20 = 0;
LABEL_153:
                      v37 = v392;
LABEL_390:

                      goto LABEL_391;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v345 = v16;
                      goto LABEL_31;
                    }
                    if (v8)
                    {
                      v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v355 = v9;
                      v77 = *MEMORY[0x1E0D025B8];
                      v472 = *MEMORY[0x1E0CB2D50];
                      v17 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellChannelBW"));
                      v473 = v17;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v473, &v472, 1);
                      v78 = objc_claimAutoreleasedReturnValue();
                      v79 = v77;
                      v9 = v355;
                      v344 = (void *)v78;
                      v20 = 0;
                      v345 = 0;
                      *v8 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v79, 2);
                      goto LABEL_153;
                    }
                    v345 = 0;
                    v20 = 0;
LABEL_146:
                    v37 = v392;
LABEL_391:

                    goto LABEL_392;
                  }
                  if (v8)
                  {
                    v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v354 = v9;
                    v73 = *MEMORY[0x1E0D025B8];
                    v474 = *MEMORY[0x1E0CB2D50];
                    v345 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellBandInfo"));
                    v475 = v345;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v475, &v474, 1);
                    v74 = objc_claimAutoreleasedReturnValue();
                    v75 = v73;
                    v9 = v354;
                    v346 = (void *)v74;
                    v20 = 0;
                    v348 = 0;
                    *v8 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v75, 2);
                    goto LABEL_146;
                  }
                  v348 = 0;
                  v20 = 0;
LABEL_134:
                  v37 = v392;
LABEL_392:

                  goto LABEL_393;
                }
                if (v8)
                {
                  v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v353 = v9;
                  v69 = *MEMORY[0x1E0D025B8];
                  v476 = *MEMORY[0x1E0CB2D50];
                  v348 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellARFCN"));
                  v477 = v348;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v477, &v476, 1);
                  v70 = objc_claimAutoreleasedReturnValue();
                  v71 = v69;
                  v9 = v353;
                  v349 = (void *)v70;
                  v20 = 0;
                  v388 = 0;
                  *v8 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v71, 2);
                  goto LABEL_134;
                }
                v388 = 0;
                v20 = 0;
LABEL_128:
                v37 = v392;
LABEL_393:

                a4 = v389;
                goto LABEL_394;
              }
              if (v8)
              {
                v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v352 = v9;
                v65 = *MEMORY[0x1E0D025B8];
                v478 = *MEMORY[0x1E0CB2D50];
                v388 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFR1"));
                v479 = v388;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v479, &v478, 1);
                v66 = objc_claimAutoreleasedReturnValue();
                v67 = v65;
                v9 = v352;
                v390 = (void *)v66;
                v20 = 0;
                v391 = 0;
                *v8 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v67, 2);
                goto LABEL_128;
              }
              v391 = 0;
              v20 = 0;
LABEL_116:
              v37 = v392;
LABEL_394:

              goto LABEL_395;
            }
            if (v8)
            {
              v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v351 = v9;
              v45 = *MEMORY[0x1E0D025B8];
              v480 = *MEMORY[0x1E0CB2D50];
              v391 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cellNsaEnabled"));
              v481 = v391;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v481, &v480, 1);
              v46 = objc_claimAutoreleasedReturnValue();
              v47 = v45;
              v9 = v351;
              v397 = (void *)v46;
              v20 = 0;
              v394 = 0;
              *v8 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v47, 2);
              goto LABEL_116;
            }
            v394 = 0;
            v20 = 0;
            v37 = v392;
LABEL_395:

            self = v395;
            goto LABEL_396;
          }
          v37 = v10;
          if (v8)
          {
            v38 = a4;
            v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v350 = v9;
            v40 = *MEMORY[0x1E0D025B8];
            v482 = *MEMORY[0x1E0CB2D50];
            v394 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rrcState"));
            v483 = v394;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v483, &v482, 1);
            v41 = objc_claimAutoreleasedReturnValue();
            v42 = v39;
            a4 = v38;
            v43 = v40;
            v9 = v350;
            v399 = (void *)v41;
            v20 = 0;
            v396 = 0;
            *v8 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2);
            goto LABEL_395;
          }
          v396 = 0;
          v20 = 0;
LABEL_396:

          goto LABEL_397;
        }
        v32 = v9;
        if (v8)
        {
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v484 = *MEMORY[0x1E0CB2D50];
          v396 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("ratType"));
          v485 = v396;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v485, &v484, 1);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v34;
          v37 = (void *)v35;
          v20 = 0;
          v398 = 0;
          *v8 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v36, 2, v35);
          v9 = v32;
          goto LABEL_396;
        }
        v398 = 0;
        v20 = 0;
LABEL_397:

        goto LABEL_398;
      }
      if (a4)
      {
        v25 = a4;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = self;
        v28 = *MEMORY[0x1E0D025B8];
        v486 = *MEMORY[0x1E0CB2D50];
        v398 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("event"));
        v487 = v398;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v487, &v486, 1);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v26;
        v9 = (void *)v29;
        v31 = v28;
        self = v27;
        v20 = 0;
        a4 = 0;
        *v25 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v29);
        goto LABEL_397;
      }
      v20 = 0;
LABEL_398:

      goto LABEL_399;
    }
    if (a4)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0D025B8];
      v488 = *MEMORY[0x1E0CB2D50];
      v23 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("counter"));
      v489 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v489, &v488, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = a4;
      a4 = v23;
      v20 = 0;
      v400 = 0;
      *v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v7);
      goto LABEL_398;
    }
    v400 = 0;
    v20 = 0;
LABEL_399:

    goto LABEL_400;
  }
  if (a4)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = *MEMORY[0x1E0D025B8];
    v490 = *MEMORY[0x1E0CB2D50];
    v400 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("geohash"));
    v491[0] = v400;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v491, &v490, 1);
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v401 = 0;
    *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2);
    goto LABEL_399;
  }
  v20 = 0;
  v401 = 0;
LABEL_400:

  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
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
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
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
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  _QWORD v141[44];
  _QWORD v142[46];

  v142[44] = *MEMORY[0x1E0C80C00];
  -[BMDeviceConnectivityContext geohash](self, "geohash");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceConnectivityContext hasCounter](self, "hasCounter"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext counter](self, "counter"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMDeviceConnectivityContext hasEvent](self, "hasEvent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext event](self, "event"));
    v104 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v104 = 0;
  }
  -[BMDeviceConnectivityContext ratType](self, "ratType");
  v5 = objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceConnectivityContext hasRrcState](self, "hasRrcState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext rrcState](self, "rrcState"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellNsaEnabled](self, "hasCellNsaEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceConnectivityContext cellNsaEnabled](self, "cellNsaEnabled"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMDeviceConnectivityContext hasIsFR1](self, "hasIsFR1"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceConnectivityContext isFR1](self, "isFR1"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellARFCN](self, "hasCellARFCN"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellARFCN](self, "cellARFCN"));
    v140 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v140 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellBandInfo](self, "hasCellBandInfo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellBandInfo](self, "cellBandInfo"));
    v139 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v139 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellChannelBW](self, "hasCellChannelBW"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellChannelBW](self, "cellChannelBW"));
    v138 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v138 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellRsrp](self, "hasCellRsrp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellRsrp](self, "cellRsrp"));
    v137 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v137 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellSinr](self, "hasCellSinr"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellSinr](self, "cellSinr"));
    v136 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v136 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellLteRSRQ](self, "hasCellLteRSRQ"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellLteRSRQ](self, "cellLteRSRQ"));
    v135 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v135 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellNrRSRP](self, "hasCellNrRSRP"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRP](self, "cellNrRSRP"));
    v134 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v134 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellNrRSRQ](self, "hasCellNrRSRQ"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRQ](self, "cellNrRSRQ"));
    v133 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v133 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellNrSNR](self, "hasCellNrSNR"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceConnectivityContext cellNrSNR](self, "cellNrSNR"));
    v132 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v132 = 0;
  }
  if (-[BMDeviceConnectivityContext hasMaxDLCAConfigured](self, "hasMaxDLCAConfigured"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxDLCAConfigured](self, "maxDLCAConfigured"));
    v131 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v131 = 0;
  }
  if (-[BMDeviceConnectivityContext hasTotalConfiguredBw](self, "hasTotalConfiguredBw"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredBw](self, "totalConfiguredBw"));
    v130 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v130 = 0;
  }
  if (-[BMDeviceConnectivityContext hasNrConfiguredBw](self, "hasNrConfiguredBw"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrConfiguredBw](self, "nrConfiguredBw"));
    v129 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v129 = 0;
  }
  if (-[BMDeviceConnectivityContext hasNrTotalScheduledMimoLayers](self, "hasNrTotalScheduledMimoLayers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrTotalScheduledMimoLayers](self, "nrTotalScheduledMimoLayers"));
    v128 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v128 = 0;
  }
  if (-[BMDeviceConnectivityContext hasTotalConfiguredMimoLayers](self, "hasTotalConfiguredMimoLayers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredMimoLayers](self, "totalConfiguredMimoLayers"));
    v127 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v127 = 0;
  }
  if (-[BMDeviceConnectivityContext hasLteMaxScheduledMimoLayersInACell](self, "hasLteMaxScheduledMimoLayersInACell"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lteMaxScheduledMimoLayersInACell](self, "lteMaxScheduledMimoLayersInACell"));
    v126 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v126 = 0;
  }
  if (-[BMDeviceConnectivityContext hasNrMaxDlModulation](self, "hasNrMaxDlModulation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrMaxDlModulation](self, "nrMaxDlModulation"));
    v125 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v125 = 0;
  }
  if (-[BMDeviceConnectivityContext hasActualHighBandwidth](self, "hasActualHighBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualHighBandwidth](self, "actualHighBandwidth"));
    v124 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v124 = 0;
  }
  if (-[BMDeviceConnectivityContext hasActualLowBandwidth](self, "hasActualLowBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualLowBandwidth](self, "actualLowBandwidth"));
    v123 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v123 = 0;
  }
  if (-[BMDeviceConnectivityContext hasPActualLowBandwidth](self, "hasPActualLowBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext pActualLowBandwidth](self, "pActualLowBandwidth"));
    v122 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v122 = 0;
  }
  if (-[BMDeviceConnectivityContext hasMaxOfActualLowBandwidth](self, "hasMaxOfActualLowBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxOfActualLowBandwidth](self, "maxOfActualLowBandwidth"));
    v121 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v121 = 0;
  }
  if (-[BMDeviceConnectivityContext hasEstimatedHighBandwidth](self, "hasEstimatedHighBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedHighBandwidth](self, "estimatedHighBandwidth"));
    v120 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v120 = 0;
  }
  if (-[BMDeviceConnectivityContext hasEstimatedLowBandwidth](self, "hasEstimatedLowBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedLowBandwidth](self, "estimatedLowBandwidth"));
    v119 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v119 = 0;
  }
  if (-[BMDeviceConnectivityContext hasMovingAvgHighBandwidth](self, "hasMovingAvgHighBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgHighBandwidth](self, "movingAvgHighBandwidth"));
    v118 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v118 = 0;
  }
  if (-[BMDeviceConnectivityContext hasMovingAvgLowBandwidth](self, "hasMovingAvgLowBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgLowBandwidth](self, "movingAvgLowBandwidth"));
    v117 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v117 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCmDataSentCount](self, "hasCmDataSentCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentCount](self, "cmDataSentCount"));
    v116 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v116 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCmDataSentDuration](self, "hasCmDataSentDuration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentDuration](self, "cmDataSentDuration"));
    v115 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v115 = 0;
  }
  if (-[BMDeviceConnectivityContext hasTcpRTTAvg](self, "hasTcpRTTAvg"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTAvg](self, "tcpRTTAvg"));
    v114 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v114 = 0;
  }
  if (-[BMDeviceConnectivityContext hasTcpRTTvar](self, "hasTcpRTTvar"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTvar](self, "tcpRTTvar"));
    v113 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v113 = 0;
  }
  if (-[BMDeviceConnectivityContext hasVideoStreamingStallTime](self, "hasVideoStreamingStallTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext videoStreamingStallTime](self, "videoStreamingStallTime"));
    v112 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v112 = 0;
  }
  if (-[BMDeviceConnectivityContext hasNumStall](self, "hasNumStall"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext numStall](self, "numStall"));
    v111 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v111 = 0;
  }
  if (-[BMDeviceConnectivityContext hasStallDuration](self, "hasStallDuration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext stallDuration](self, "stallDuration"));
    v110 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v110 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellEstimatedBW](self, "hasCellEstimatedBW"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellEstimatedBW](self, "cellEstimatedBW"));
    v109 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v109 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellLoad](self, "hasCellLoad"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellLoad](self, "cellLoad"));
    v108 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v108 = 0;
  }
  if (-[BMDeviceConnectivityContext hasCellModelConfidenceLevel](self, "hasCellModelConfidenceLevel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellModelConfidenceLevel](self, "cellModelConfidenceLevel"));
    v107 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v107 = 0;
  }
  if (-[BMDeviceConnectivityContext hasMlPredictedCellBW](self, "hasMlPredictedCellBW"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext mlPredictedCellBW](self, "mlPredictedCellBW"));
    v106 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v106 = 0;
  }
  if (-[BMDeviceConnectivityContext hasQbssLoad](self, "hasQbssLoad"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext qbssLoad](self, "qbssLoad"));
    v105 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v105 = 0;
  }
  if (-[BMDeviceConnectivityContext hasLqmScorecellular](self, "hasLqmScorecellular"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lqmScorecellular](self, "lqmScorecellular"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v141[0] = CFSTR("geohash");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v10;
  v142[0] = v10;
  v141[1] = CFSTR("counter");
  v11 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v11;
  v142[1] = v11;
  v141[2] = CFSTR("event");
  v12 = (uint64_t)v104;
  if (!v104)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v93 = (void *)v12;
  v142[2] = v12;
  v141[3] = CFSTR("ratType");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v13;
  v142[3] = v13;
  v141[4] = CFSTR("rrcState");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v91 = (void *)v14;
  v142[4] = v14;
  v141[5] = CFSTR("cellNsaEnabled");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)v15;
  v142[5] = v15;
  v141[6] = CFSTR("isFR1");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v89 = (void *)v16;
  v142[6] = v16;
  v141[7] = CFSTR("cellARFCN");
  v17 = (uint64_t)v140;
  if (!v140)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v142[7] = v17;
  v141[8] = CFSTR("cellBandInfo");
  v18 = (uint64_t)v139;
  if (!v139)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v142[8] = v18;
  v141[9] = CFSTR("cellChannelBW");
  v19 = (uint64_t)v138;
  if (!v138)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v5;
  v98 = (void *)v19;
  v142[9] = v19;
  v141[10] = CFSTR("cellRsrp");
  v21 = (uint64_t)v137;
  if (!v137)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v3;
  v97 = (void *)v21;
  v142[10] = v21;
  v141[11] = CFSTR("cellSinr");
  v23 = (uint64_t)v136;
  if (!v136)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v23;
  v142[11] = v23;
  v141[12] = CFSTR("cellLteRSRQ");
  v25 = (uint64_t)v135;
  if (!v135)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v86 = (void *)v25;
  v142[12] = v25;
  v141[13] = CFSTR("cellNrRSRP");
  v26 = (uint64_t)v134;
  if (!v134)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v85 = (void *)v26;
  v142[13] = v26;
  v141[14] = CFSTR("cellNrRSRQ");
  v27 = (uint64_t)v133;
  if (!v133)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v84 = (void *)v27;
  v142[14] = v27;
  v141[15] = CFSTR("cellNrSNR");
  v28 = (uint64_t)v132;
  if (!v132)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v83 = (void *)v28;
  v142[15] = v28;
  v141[16] = CFSTR("maxDLCAConfigured");
  v29 = (uint64_t)v131;
  if (!v131)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)v29;
  v142[16] = v29;
  v141[17] = CFSTR("totalConfiguredBw");
  v30 = (uint64_t)v130;
  if (!v130)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)v30;
  v142[17] = v30;
  v141[18] = CFSTR("nrConfiguredBw");
  v31 = (uint64_t)v129;
  if (!v129)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v31;
  v142[18] = v31;
  v141[19] = CFSTR("nrTotalScheduledMimoLayers");
  v32 = (uint64_t)v128;
  if (!v128)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v32;
  v142[19] = v32;
  v141[20] = CFSTR("totalConfiguredMimoLayers");
  v33 = (uint64_t)v127;
  if (!v127)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v33;
  v142[20] = v33;
  v141[21] = CFSTR("lteMaxScheduledMimoLayersInACell");
  v34 = (uint64_t)v126;
  if (!v126)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v77 = (void *)v34;
  v142[21] = v34;
  v141[22] = CFSTR("nrMaxDlModulation");
  v35 = (uint64_t)v125;
  if (!v125)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v76 = (void *)v35;
  v142[22] = v35;
  v141[23] = CFSTR("actualHighBandwidth");
  v36 = (uint64_t)v124;
  if (!v124)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v36;
  v142[23] = v36;
  v141[24] = CFSTR("actualLowBandwidth");
  v37 = (uint64_t)v123;
  if (!v123)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v37;
  v142[24] = v37;
  v141[25] = CFSTR("pActualLowBandwidth");
  v38 = (uint64_t)v122;
  if (!v122)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v38;
  v142[25] = v38;
  v141[26] = CFSTR("maxOfActualLowBandwidth");
  v39 = (uint64_t)v121;
  if (!v121)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v39;
  v142[26] = v39;
  v141[27] = CFSTR("estimatedHighBandwidth");
  v40 = (uint64_t)v120;
  if (!v120)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v40;
  v142[27] = v40;
  v141[28] = CFSTR("estimatedLowBandwidth");
  v41 = (uint64_t)v119;
  if (!v119)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v41;
  v142[28] = v41;
  v141[29] = CFSTR("movingAvgHighBandwidth");
  v42 = (uint64_t)v118;
  if (!v118)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v42;
  v142[29] = v42;
  v141[30] = CFSTR("movingAvgLowBandwidth");
  v43 = (uint64_t)v117;
  if (!v117)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v43;
  v142[30] = v43;
  v141[31] = CFSTR("cmDataSentCount");
  v44 = (uint64_t)v116;
  if (!v116)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v44;
  v142[31] = v44;
  v141[32] = CFSTR("cmDataSentDuration");
  v45 = (uint64_t)v115;
  if (!v115)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v45;
  v142[32] = v45;
  v141[33] = CFSTR("tcpRTTAvg");
  v46 = (uint64_t)v114;
  if (!v114)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v46;
  v142[33] = v46;
  v141[34] = CFSTR("tcpRTTvar");
  v47 = (uint64_t)v113;
  if (!v113)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v102 = v4;
  v64 = (void *)v47;
  v142[34] = v47;
  v141[35] = CFSTR("videoStreamingStallTime");
  v48 = (uint64_t)v112;
  if (!v112)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v101 = v6;
  v63 = (void *)v48;
  v142[35] = v48;
  v141[36] = CFSTR("numStall");
  v49 = (uint64_t)v111;
  if (!v111)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v88 = (void *)v17;
  v62 = (void *)v49;
  v142[36] = v49;
  v141[37] = CFSTR("stallDuration");
  v50 = (uint64_t)v110;
  if (!v110)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v100 = v7;
  v60 = v50;
  v142[37] = v50;
  v141[38] = CFSTR("cellEstimatedBW");
  v51 = v109;
  if (!v109)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v50, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77,
      v78,
      v79,
      v80,
      v81,
      v82,
      v83,
      v84,
      v85,
      v86);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v99 = v22;
  v142[38] = v51;
  v141[39] = CFSTR("cellLoad");
  v52 = v108;
  if (!v108)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v87 = (void *)v18;
  v103 = v9;
  v142[39] = v52;
  v141[40] = CFSTR("cellModelConfidenceLevel");
  v53 = v107;
  if (!v107)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v142[40] = v53;
  v141[41] = CFSTR("mlPredictedCellBW");
  v54 = v106;
  if (!v106)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55 = v8;
  v142[41] = v54;
  v141[42] = CFSTR("qbssLoad");
  v56 = v105;
  if (!v105)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v142[42] = v56;
  v141[43] = CFSTR("lqmScorecellular");
  v57 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v142[43] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 44, v60);
  v96 = (id)objc_claimAutoreleasedReturnValue();
  if (!v57)

  v58 = v24;
  if (!v105)
  {

    v58 = v24;
  }
  if (!v106)
  {

    v58 = v24;
  }
  if (!v107)
  {

    v58 = v24;
  }
  if (!v108)
  {

    v58 = v24;
  }
  if (!v109)
  {

    v58 = v24;
  }
  if (!v110)
  {

    v58 = v24;
  }
  if (!v111)
  {

    v58 = v24;
  }
  if (!v112)
  {

    v58 = v24;
  }
  if (!v113)
  {

    v58 = v24;
  }
  if (!v114)
  {

    v58 = v24;
  }
  if (!v115)
  {

    v58 = v24;
  }
  if (!v116)
  {

    v58 = v24;
  }
  if (!v117)
  {

    v58 = v24;
  }
  if (!v118)
  {

    v58 = v24;
  }
  if (!v119)
  {

    v58 = v24;
  }
  if (!v120)
  {

    v58 = v24;
  }
  if (!v121)
  {

    v58 = v24;
  }
  if (!v122)
  {

    v58 = v24;
  }
  if (!v123)
  {

    v58 = v24;
  }
  if (!v124)
  {

    v58 = v24;
  }
  if (!v125)
  {

    v58 = v24;
  }
  if (!v126)
  {

    v58 = v24;
  }
  if (!v127)
  {

    v58 = v24;
  }
  if (!v128)
  {

    v58 = v24;
  }
  if (!v129)
  {

    v58 = v24;
  }
  if (!v130)
  {

    v58 = v24;
  }
  if (!v131)
  {

    v58 = v24;
  }
  if (!v132)
  {

    v58 = v24;
  }
  if (!v133)
  {

    v58 = v24;
  }
  if (!v134)
  {

    v58 = v24;
  }
  if (!v135)
  {

    v58 = v24;
  }
  if (!v136)

  if (!v137)
  if (!v138)

  if (!v139)
  if (v140)
  {
    if (v55)
      goto LABEL_289;
  }
  else
  {

    if (v55)
    {
LABEL_289:
      if (v100)
        goto LABEL_290;
      goto LABEL_298;
    }
  }

  if (v100)
  {
LABEL_290:
    if (v101)
      goto LABEL_291;
    goto LABEL_299;
  }
LABEL_298:

  if (v101)
  {
LABEL_291:
    if (v20)
      goto LABEL_292;
    goto LABEL_300;
  }
LABEL_299:

  if (v20)
  {
LABEL_292:
    if (v104)
      goto LABEL_293;
    goto LABEL_301;
  }
LABEL_300:

  if (v104)
  {
LABEL_293:
    if (v102)
      goto LABEL_294;
LABEL_302:

    if (v99)
      goto LABEL_295;
LABEL_303:

    goto LABEL_295;
  }
LABEL_301:

  if (!v102)
    goto LABEL_302;
LABEL_294:
  if (!v99)
    goto LABEL_303;
LABEL_295:

  return v96;
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
  BOOL v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
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

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDeviceConnectivityContext geohash](self, "geohash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "geohash");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDeviceConnectivityContext geohash](self, "geohash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "geohash");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_221;
    }
    if (-[BMDeviceConnectivityContext hasCounter](self, "hasCounter") || objc_msgSend(v5, "hasCounter"))
    {
      if (!-[BMDeviceConnectivityContext hasCounter](self, "hasCounter"))
        goto LABEL_221;
      if (!objc_msgSend(v5, "hasCounter"))
        goto LABEL_221;
      v13 = -[BMDeviceConnectivityContext counter](self, "counter");
      if (v13 != objc_msgSend(v5, "counter"))
        goto LABEL_221;
    }
    if (-[BMDeviceConnectivityContext hasEvent](self, "hasEvent") || objc_msgSend(v5, "hasEvent"))
    {
      if (!-[BMDeviceConnectivityContext hasEvent](self, "hasEvent"))
        goto LABEL_221;
      if (!objc_msgSend(v5, "hasEvent"))
        goto LABEL_221;
      v14 = -[BMDeviceConnectivityContext event](self, "event");
      if (v14 != objc_msgSend(v5, "event"))
        goto LABEL_221;
    }
    -[BMDeviceConnectivityContext ratType](self, "ratType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ratType");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[BMDeviceConnectivityContext ratType](self, "ratType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ratType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_221;
    }
    if (!-[BMDeviceConnectivityContext hasRrcState](self, "hasRrcState")
      && !objc_msgSend(v5, "hasRrcState")
      || -[BMDeviceConnectivityContext hasRrcState](self, "hasRrcState")
      && objc_msgSend(v5, "hasRrcState")
      && (v21 = -[BMDeviceConnectivityContext rrcState](self, "rrcState"),
          v21 == objc_msgSend(v5, "rrcState")))
    {
      if (!-[BMDeviceConnectivityContext hasCellNsaEnabled](self, "hasCellNsaEnabled")
        && !objc_msgSend(v5, "hasCellNsaEnabled")
        || -[BMDeviceConnectivityContext hasCellNsaEnabled](self, "hasCellNsaEnabled")
        && objc_msgSend(v5, "hasCellNsaEnabled")
        && (v22 = -[BMDeviceConnectivityContext cellNsaEnabled](self, "cellNsaEnabled"),
            v22 == objc_msgSend(v5, "cellNsaEnabled")))
      {
        if (!-[BMDeviceConnectivityContext hasIsFR1](self, "hasIsFR1") && !objc_msgSend(v5, "hasIsFR1")
          || -[BMDeviceConnectivityContext hasIsFR1](self, "hasIsFR1")
          && objc_msgSend(v5, "hasIsFR1")
          && (v23 = -[BMDeviceConnectivityContext isFR1](self, "isFR1"), v23 == objc_msgSend(v5, "isFR1")))
        {
          if (!-[BMDeviceConnectivityContext hasCellARFCN](self, "hasCellARFCN")
            && !objc_msgSend(v5, "hasCellARFCN")
            || -[BMDeviceConnectivityContext hasCellARFCN](self, "hasCellARFCN")
            && objc_msgSend(v5, "hasCellARFCN")
            && (v24 = -[BMDeviceConnectivityContext cellARFCN](self, "cellARFCN"),
                v24 == objc_msgSend(v5, "cellARFCN")))
          {
            if (!-[BMDeviceConnectivityContext hasCellBandInfo](self, "hasCellBandInfo")
              && !objc_msgSend(v5, "hasCellBandInfo")
              || -[BMDeviceConnectivityContext hasCellBandInfo](self, "hasCellBandInfo")
              && objc_msgSend(v5, "hasCellBandInfo")
              && (v25 = -[BMDeviceConnectivityContext cellBandInfo](self, "cellBandInfo"),
                  v25 == objc_msgSend(v5, "cellBandInfo")))
            {
              if (!-[BMDeviceConnectivityContext hasCellChannelBW](self, "hasCellChannelBW")
                && !objc_msgSend(v5, "hasCellChannelBW")
                || -[BMDeviceConnectivityContext hasCellChannelBW](self, "hasCellChannelBW")
                && objc_msgSend(v5, "hasCellChannelBW")
                && (v26 = -[BMDeviceConnectivityContext cellChannelBW](self, "cellChannelBW"),
                    v26 == objc_msgSend(v5, "cellChannelBW")))
              {
                if (!-[BMDeviceConnectivityContext hasCellRsrp](self, "hasCellRsrp")
                  && !objc_msgSend(v5, "hasCellRsrp")
                  || -[BMDeviceConnectivityContext hasCellRsrp](self, "hasCellRsrp")
                  && objc_msgSend(v5, "hasCellRsrp")
                  && (v27 = -[BMDeviceConnectivityContext cellRsrp](self, "cellRsrp"),
                      v27 == objc_msgSend(v5, "cellRsrp")))
                {
                  if (!-[BMDeviceConnectivityContext hasCellSinr](self, "hasCellSinr")
                    && !objc_msgSend(v5, "hasCellSinr")
                    || -[BMDeviceConnectivityContext hasCellSinr](self, "hasCellSinr")
                    && objc_msgSend(v5, "hasCellSinr")
                    && (v28 = -[BMDeviceConnectivityContext cellSinr](self, "cellSinr"),
                        v28 == objc_msgSend(v5, "cellSinr")))
                  {
                    if (!-[BMDeviceConnectivityContext hasCellLteRSRQ](self, "hasCellLteRSRQ")
                      && !objc_msgSend(v5, "hasCellLteRSRQ")
                      || -[BMDeviceConnectivityContext hasCellLteRSRQ](self, "hasCellLteRSRQ")
                      && objc_msgSend(v5, "hasCellLteRSRQ")
                      && (v29 = -[BMDeviceConnectivityContext cellLteRSRQ](self, "cellLteRSRQ"),
                          v29 == objc_msgSend(v5, "cellLteRSRQ")))
                    {
                      if (!-[BMDeviceConnectivityContext hasCellNrRSRP](self, "hasCellNrRSRP")
                        && !objc_msgSend(v5, "hasCellNrRSRP")
                        || -[BMDeviceConnectivityContext hasCellNrRSRP](self, "hasCellNrRSRP")
                        && objc_msgSend(v5, "hasCellNrRSRP")
                        && (v30 = -[BMDeviceConnectivityContext cellNrRSRP](self, "cellNrRSRP"),
                            v30 == objc_msgSend(v5, "cellNrRSRP")))
                      {
                        if (!-[BMDeviceConnectivityContext hasCellNrRSRQ](self, "hasCellNrRSRQ")
                          && !objc_msgSend(v5, "hasCellNrRSRQ")
                          || -[BMDeviceConnectivityContext hasCellNrRSRQ](self, "hasCellNrRSRQ")
                          && objc_msgSend(v5, "hasCellNrRSRQ")
                          && (v31 = -[BMDeviceConnectivityContext cellNrRSRQ](self, "cellNrRSRQ"),
                              v31 == objc_msgSend(v5, "cellNrRSRQ")))
                        {
                          if (!-[BMDeviceConnectivityContext hasCellNrSNR](self, "hasCellNrSNR")
                            && !objc_msgSend(v5, "hasCellNrSNR")
                            || -[BMDeviceConnectivityContext hasCellNrSNR](self, "hasCellNrSNR")
                            && objc_msgSend(v5, "hasCellNrSNR")
                            && (v32 = -[BMDeviceConnectivityContext cellNrSNR](self, "cellNrSNR"),
                                v32 == objc_msgSend(v5, "cellNrSNR")))
                          {
                            if (!-[BMDeviceConnectivityContext hasMaxDLCAConfigured](self, "hasMaxDLCAConfigured")
                              && !objc_msgSend(v5, "hasMaxDLCAConfigured")
                              || -[BMDeviceConnectivityContext hasMaxDLCAConfigured](self, "hasMaxDLCAConfigured")
                              && objc_msgSend(v5, "hasMaxDLCAConfigured")
                              && (v33 = -[BMDeviceConnectivityContext maxDLCAConfigured](self, "maxDLCAConfigured"),
                                  v33 == objc_msgSend(v5, "maxDLCAConfigured")))
                            {
                              if (!-[BMDeviceConnectivityContext hasTotalConfiguredBw](self, "hasTotalConfiguredBw")
                                && !objc_msgSend(v5, "hasTotalConfiguredBw")
                                || -[BMDeviceConnectivityContext hasTotalConfiguredBw](self, "hasTotalConfiguredBw")
                                && objc_msgSend(v5, "hasTotalConfiguredBw")
                                && (v34 = -[BMDeviceConnectivityContext totalConfiguredBw](self, "totalConfiguredBw"),
                                    v34 == objc_msgSend(v5, "totalConfiguredBw")))
                              {
                                if (!-[BMDeviceConnectivityContext hasNrConfiguredBw](self, "hasNrConfiguredBw")
                                  && !objc_msgSend(v5, "hasNrConfiguredBw")
                                  || -[BMDeviceConnectivityContext hasNrConfiguredBw](self, "hasNrConfiguredBw")
                                  && objc_msgSend(v5, "hasNrConfiguredBw")
                                  && (v35 = -[BMDeviceConnectivityContext nrConfiguredBw](self, "nrConfiguredBw"),
                                      v35 == objc_msgSend(v5, "nrConfiguredBw")))
                                {
                                  if (!-[BMDeviceConnectivityContext hasNrTotalScheduledMimoLayers](self, "hasNrTotalScheduledMimoLayers")&& !objc_msgSend(v5, "hasNrTotalScheduledMimoLayers")|| -[BMDeviceConnectivityContext hasNrTotalScheduledMimoLayers](self, "hasNrTotalScheduledMimoLayers")&& objc_msgSend(v5, "hasNrTotalScheduledMimoLayers")&& (v36 = -[BMDeviceConnectivityContext nrTotalScheduledMimoLayers](self, "nrTotalScheduledMimoLayers"), v36 == objc_msgSend(v5, "nrTotalScheduledMimoLayers")))
                                  {
                                    if (!-[BMDeviceConnectivityContext hasTotalConfiguredMimoLayers](self, "hasTotalConfiguredMimoLayers")&& !objc_msgSend(v5, "hasTotalConfiguredMimoLayers")|| -[BMDeviceConnectivityContext hasTotalConfiguredMimoLayers](self, "hasTotalConfiguredMimoLayers")&& objc_msgSend(v5, "hasTotalConfiguredMimoLayers")&& (v37 = -[BMDeviceConnectivityContext totalConfiguredMimoLayers](self, "totalConfiguredMimoLayers"), v37 == objc_msgSend(v5, "totalConfiguredMimoLayers")))
                                    {
                                      if (!-[BMDeviceConnectivityContext hasLteMaxScheduledMimoLayersInACell](self, "hasLteMaxScheduledMimoLayersInACell")&& !objc_msgSend(v5, "hasLteMaxScheduledMimoLayersInACell")|| -[BMDeviceConnectivityContext hasLteMaxScheduledMimoLayersInACell](self, "hasLteMaxScheduledMimoLayersInACell")&& objc_msgSend(v5, "hasLteMaxScheduledMimoLayersInACell")&& (v38 = -[BMDeviceConnectivityContext lteMaxScheduledMimoLayersInACell](self, "lteMaxScheduledMimoLayersInACell"), v38 == objc_msgSend(v5, "lteMaxScheduledMimoLayersInACell")))
                                      {
                                        if (!-[BMDeviceConnectivityContext hasNrMaxDlModulation](self, "hasNrMaxDlModulation")&& !objc_msgSend(v5, "hasNrMaxDlModulation")|| -[BMDeviceConnectivityContext hasNrMaxDlModulation](self, "hasNrMaxDlModulation")&& objc_msgSend(v5, "hasNrMaxDlModulation")&& (v39 = -[BMDeviceConnectivityContext nrMaxDlModulation](self, "nrMaxDlModulation"), v39 == objc_msgSend(v5, "nrMaxDlModulation")))
                                        {
                                          if (!-[BMDeviceConnectivityContext hasActualHighBandwidth](self, "hasActualHighBandwidth")&& !objc_msgSend(v5, "hasActualHighBandwidth")|| -[BMDeviceConnectivityContext hasActualHighBandwidth](self, "hasActualHighBandwidth")&& objc_msgSend(v5, "hasActualHighBandwidth")&& (v40 = -[BMDeviceConnectivityContext actualHighBandwidth](self, "actualHighBandwidth"), v40 == objc_msgSend(v5, "actualHighBandwidth")))
                                          {
                                            if (!-[BMDeviceConnectivityContext hasActualLowBandwidth](self, "hasActualLowBandwidth")&& !objc_msgSend(v5, "hasActualLowBandwidth")|| -[BMDeviceConnectivityContext hasActualLowBandwidth](self, "hasActualLowBandwidth")&& objc_msgSend(v5, "hasActualLowBandwidth")&& (v41 = -[BMDeviceConnectivityContext actualLowBandwidth](self, "actualLowBandwidth"), v41 == objc_msgSend(v5, "actualLowBandwidth")))
                                            {
                                              if (!-[BMDeviceConnectivityContext hasPActualLowBandwidth](self, "hasPActualLowBandwidth")&& !objc_msgSend(v5, "hasPActualLowBandwidth")|| -[BMDeviceConnectivityContext hasPActualLowBandwidth](self, "hasPActualLowBandwidth")&& objc_msgSend(v5, "hasPActualLowBandwidth")&& (v42 = -[BMDeviceConnectivityContext pActualLowBandwidth](self, "pActualLowBandwidth"), v42 == objc_msgSend(v5, "pActualLowBandwidth")))
                                              {
                                                if (!-[BMDeviceConnectivityContext hasMaxOfActualLowBandwidth](self, "hasMaxOfActualLowBandwidth")&& !objc_msgSend(v5, "hasMaxOfActualLowBandwidth")|| -[BMDeviceConnectivityContext hasMaxOfActualLowBandwidth](self, "hasMaxOfActualLowBandwidth")&& objc_msgSend(v5, "hasMaxOfActualLowBandwidth")&& (v43 = -[BMDeviceConnectivityContext maxOfActualLowBandwidth](self, "maxOfActualLowBandwidth"), v43 == objc_msgSend(v5, "maxOfActualLowBandwidth")))
                                                {
                                                  if (!-[BMDeviceConnectivityContext hasEstimatedHighBandwidth](self, "hasEstimatedHighBandwidth")&& !objc_msgSend(v5, "hasEstimatedHighBandwidth")|| -[BMDeviceConnectivityContext hasEstimatedHighBandwidth](self, "hasEstimatedHighBandwidth")&& objc_msgSend(v5, "hasEstimatedHighBandwidth")&& (v44 = -[BMDeviceConnectivityContext estimatedHighBandwidth](self, "estimatedHighBandwidth"), v44 == objc_msgSend(v5, "estimatedHighBandwidth")))
                                                  {
                                                    if (!-[BMDeviceConnectivityContext hasEstimatedLowBandwidth](self, "hasEstimatedLowBandwidth")&& !objc_msgSend(v5, "hasEstimatedLowBandwidth")|| -[BMDeviceConnectivityContext hasEstimatedLowBandwidth](self, "hasEstimatedLowBandwidth")&& objc_msgSend(v5, "hasEstimatedLowBandwidth")&& (v45 = -[BMDeviceConnectivityContext estimatedLowBandwidth](self, "estimatedLowBandwidth"), v45 == objc_msgSend(v5, "estimatedLowBandwidth")))
                                                    {
                                                      if (!-[BMDeviceConnectivityContext hasMovingAvgHighBandwidth](self, "hasMovingAvgHighBandwidth")&& !objc_msgSend(v5, "hasMovingAvgHighBandwidth")|| -[BMDeviceConnectivityContext hasMovingAvgHighBandwidth](self, "hasMovingAvgHighBandwidth")&& objc_msgSend(v5, "hasMovingAvgHighBandwidth")&& (v46 = -[BMDeviceConnectivityContext movingAvgHighBandwidth](self, "movingAvgHighBandwidth"), v46 == objc_msgSend(v5, "movingAvgHighBandwidth")))
                                                      {
                                                        if (!-[BMDeviceConnectivityContext hasMovingAvgLowBandwidth](self, "hasMovingAvgLowBandwidth")&& !objc_msgSend(v5, "hasMovingAvgLowBandwidth")|| -[BMDeviceConnectivityContext hasMovingAvgLowBandwidth](self, "hasMovingAvgLowBandwidth")&& objc_msgSend(v5, "hasMovingAvgLowBandwidth")&& (v47 = -[BMDeviceConnectivityContext movingAvgLowBandwidth](self, "movingAvgLowBandwidth"), v47 == objc_msgSend(v5, "movingAvgLowBandwidth")))
                                                        {
                                                          if (!-[BMDeviceConnectivityContext hasCmDataSentCount](self, "hasCmDataSentCount")&& !objc_msgSend(v5, "hasCmDataSentCount")|| -[BMDeviceConnectivityContext hasCmDataSentCount](self, "hasCmDataSentCount")&& objc_msgSend(v5, "hasCmDataSentCount")&& (v48 = -[BMDeviceConnectivityContext cmDataSentCount](self, "cmDataSentCount"), v48 == objc_msgSend(v5, "cmDataSentCount")))
                                                          {
                                                            if (!-[BMDeviceConnectivityContext hasCmDataSentDuration](self, "hasCmDataSentDuration")&& !objc_msgSend(v5, "hasCmDataSentDuration")|| -[BMDeviceConnectivityContext hasCmDataSentDuration](self, "hasCmDataSentDuration")&& objc_msgSend(v5, "hasCmDataSentDuration")&& (v49 = -[BMDeviceConnectivityContext cmDataSentDuration](self, "cmDataSentDuration"), v49 == objc_msgSend(v5, "cmDataSentDuration")))
                                                            {
                                                              if (!-[BMDeviceConnectivityContext hasTcpRTTAvg](self, "hasTcpRTTAvg")&& !objc_msgSend(v5, "hasTcpRTTAvg")|| -[BMDeviceConnectivityContext hasTcpRTTAvg](self, "hasTcpRTTAvg")&& objc_msgSend(v5, "hasTcpRTTAvg")&& (v50 = -[BMDeviceConnectivityContext tcpRTTAvg](self, "tcpRTTAvg"), v50 == objc_msgSend(v5, "tcpRTTAvg")))
                                                              {
                                                                if (!-[BMDeviceConnectivityContext hasTcpRTTvar](self, "hasTcpRTTvar")&& !objc_msgSend(v5, "hasTcpRTTvar")|| -[BMDeviceConnectivityContext hasTcpRTTvar](self, "hasTcpRTTvar")&& objc_msgSend(v5, "hasTcpRTTvar")&& (v51 = -[BMDeviceConnectivityContext tcpRTTvar](self, "tcpRTTvar"), v51 == objc_msgSend(v5, "tcpRTTvar")))
                                                                {
                                                                  if (!-[BMDeviceConnectivityContext hasVideoStreamingStallTime](self, "hasVideoStreamingStallTime")&& !objc_msgSend(v5, "hasVideoStreamingStallTime")|| -[BMDeviceConnectivityContext hasVideoStreamingStallTime](self, "hasVideoStreamingStallTime")&& objc_msgSend(v5, "hasVideoStreamingStallTime")&& (v52 = -[BMDeviceConnectivityContext videoStreamingStallTime](self, "videoStreamingStallTime"), v52 == objc_msgSend(v5, "videoStreamingStallTime")))
                                                                  {
                                                                    if (!-[BMDeviceConnectivityContext hasNumStall](self, "hasNumStall")&& !objc_msgSend(v5, "hasNumStall")|| -[BMDeviceConnectivityContext hasNumStall](self, "hasNumStall")&& objc_msgSend(v5, "hasNumStall")&& (v53 = -[BMDeviceConnectivityContext numStall](self, "numStall"), v53 == objc_msgSend(v5, "numStall")))
                                                                    {
                                                                      if (!-[BMDeviceConnectivityContext hasStallDuration](self, "hasStallDuration")&& !objc_msgSend(v5, "hasStallDuration")|| -[BMDeviceConnectivityContext hasStallDuration](self, "hasStallDuration")&& objc_msgSend(v5, "hasStallDuration")&& (v54 = -[BMDeviceConnectivityContext stallDuration](self, "stallDuration"), v54 == objc_msgSend(v5, "stallDuration")))
                                                                      {
                                                                        if (!-[BMDeviceConnectivityContext hasCellEstimatedBW](self, "hasCellEstimatedBW")&& !objc_msgSend(v5, "hasCellEstimatedBW")|| -[BMDeviceConnectivityContext hasCellEstimatedBW](self, "hasCellEstimatedBW")&& objc_msgSend(v5, "hasCellEstimatedBW")&& (v55 = -[BMDeviceConnectivityContext cellEstimatedBW](self, "cellEstimatedBW"), v55 == objc_msgSend(v5, "cellEstimatedBW")))
                                                                        {
                                                                          if (!-[BMDeviceConnectivityContext hasCellLoad](self, "hasCellLoad")&& !objc_msgSend(v5, "hasCellLoad")|| -[BMDeviceConnectivityContext hasCellLoad](self, "hasCellLoad")&& objc_msgSend(v5, "hasCellLoad")&& (v56 = -[BMDeviceConnectivityContext cellLoad](self, "cellLoad"), v56 == objc_msgSend(v5, "cellLoad")))
                                                                          {
                                                                            if (!-[BMDeviceConnectivityContext hasCellModelConfidenceLevel](self, "hasCellModelConfidenceLevel")&& !objc_msgSend(v5, "hasCellModelConfidenceLevel")|| -[BMDeviceConnectivityContext hasCellModelConfidenceLevel](self, "hasCellModelConfidenceLevel")&& objc_msgSend(v5, "hasCellModelConfidenceLevel")&& (v57 = -[BMDeviceConnectivityContext cellModelConfidenceLevel](self, "cellModelConfidenceLevel"), v57 == objc_msgSend(v5, "cellModelConfidenceLevel")))
                                                                            {
                                                                              if (!-[BMDeviceConnectivityContext hasMlPredictedCellBW](self, "hasMlPredictedCellBW")&& !objc_msgSend(v5, "hasMlPredictedCellBW")|| -[BMDeviceConnectivityContext hasMlPredictedCellBW](self, "hasMlPredictedCellBW")&& objc_msgSend(v5, "hasMlPredictedCellBW")&& (v58 = -[BMDeviceConnectivityContext mlPredictedCellBW](self, "mlPredictedCellBW"), v58 == objc_msgSend(v5, "mlPredictedCellBW")))
                                                                              {
                                                                                if (!-[BMDeviceConnectivityContext hasQbssLoad](self, "hasQbssLoad")&& !objc_msgSend(v5, "hasQbssLoad")|| -[BMDeviceConnectivityContext hasQbssLoad](self, "hasQbssLoad")&& objc_msgSend(v5, "hasQbssLoad")&& (v59 = -[BMDeviceConnectivityContext qbssLoad](self, "qbssLoad"), v59 == objc_msgSend(v5, "qbssLoad")))
                                                                                {
                                                                                  if (!-[BMDeviceConnectivityContext hasLqmScorecellular](self, "hasLqmScorecellular")&& !objc_msgSend(v5, "hasLqmScorecellular"))
                                                                                  {
                                                                                    v12 = 1;
                                                                                    goto LABEL_222;
                                                                                  }
                                                                                  if (-[BMDeviceConnectivityContext hasLqmScorecellular](self, "hasLqmScorecellular")&& objc_msgSend(v5, "hasLqmScorecellular"))
                                                                                  {
                                                                                    v60 = -[BMDeviceConnectivityContext lqmScorecellular](self, "lqmScorecellular");
                                                                                    v12 = v60 == objc_msgSend(v5, "lqmScorecellular");
LABEL_222:

                                                                                    goto LABEL_223;
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
LABEL_221:
    v12 = 0;
    goto LABEL_222;
  }
  v12 = 0;
LABEL_223:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)geohash
{
  return self->_geohash;
}

- (unsigned)counter
{
  return self->_counter;
}

- (BOOL)hasCounter
{
  return self->_hasCounter;
}

- (void)setHasCounter:(BOOL)a3
{
  self->_hasCounter = a3;
}

- (unsigned)event
{
  return self->_event;
}

- (BOOL)hasEvent
{
  return self->_hasEvent;
}

- (void)setHasEvent:(BOOL)a3
{
  self->_hasEvent = a3;
}

- (NSString)ratType
{
  return self->_ratType;
}

- (unsigned)rrcState
{
  return self->_rrcState;
}

- (BOOL)hasRrcState
{
  return self->_hasRrcState;
}

- (void)setHasRrcState:(BOOL)a3
{
  self->_hasRrcState = a3;
}

- (BOOL)cellNsaEnabled
{
  return self->_cellNsaEnabled;
}

- (BOOL)hasCellNsaEnabled
{
  return self->_hasCellNsaEnabled;
}

- (void)setHasCellNsaEnabled:(BOOL)a3
{
  self->_hasCellNsaEnabled = a3;
}

- (BOOL)isFR1
{
  return self->_isFR1;
}

- (BOOL)hasIsFR1
{
  return self->_hasIsFR1;
}

- (void)setHasIsFR1:(BOOL)a3
{
  self->_hasIsFR1 = a3;
}

- (unsigned)cellARFCN
{
  return self->_cellARFCN;
}

- (BOOL)hasCellARFCN
{
  return self->_hasCellARFCN;
}

- (void)setHasCellARFCN:(BOOL)a3
{
  self->_hasCellARFCN = a3;
}

- (unsigned)cellBandInfo
{
  return self->_cellBandInfo;
}

- (BOOL)hasCellBandInfo
{
  return self->_hasCellBandInfo;
}

- (void)setHasCellBandInfo:(BOOL)a3
{
  self->_hasCellBandInfo = a3;
}

- (unsigned)cellChannelBW
{
  return self->_cellChannelBW;
}

- (BOOL)hasCellChannelBW
{
  return self->_hasCellChannelBW;
}

- (void)setHasCellChannelBW:(BOOL)a3
{
  self->_hasCellChannelBW = a3;
}

- (int)cellRsrp
{
  return self->_cellRsrp;
}

- (BOOL)hasCellRsrp
{
  return self->_hasCellRsrp;
}

- (void)setHasCellRsrp:(BOOL)a3
{
  self->_hasCellRsrp = a3;
}

- (int)cellSinr
{
  return self->_cellSinr;
}

- (BOOL)hasCellSinr
{
  return self->_hasCellSinr;
}

- (void)setHasCellSinr:(BOOL)a3
{
  self->_hasCellSinr = a3;
}

- (int)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (BOOL)hasCellLteRSRQ
{
  return self->_hasCellLteRSRQ;
}

- (void)setHasCellLteRSRQ:(BOOL)a3
{
  self->_hasCellLteRSRQ = a3;
}

- (int)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (BOOL)hasCellNrRSRP
{
  return self->_hasCellNrRSRP;
}

- (void)setHasCellNrRSRP:(BOOL)a3
{
  self->_hasCellNrRSRP = a3;
}

- (int)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (BOOL)hasCellNrRSRQ
{
  return self->_hasCellNrRSRQ;
}

- (void)setHasCellNrRSRQ:(BOOL)a3
{
  self->_hasCellNrRSRQ = a3;
}

- (int)cellNrSNR
{
  return self->_cellNrSNR;
}

- (BOOL)hasCellNrSNR
{
  return self->_hasCellNrSNR;
}

- (void)setHasCellNrSNR:(BOOL)a3
{
  self->_hasCellNrSNR = a3;
}

- (unsigned)maxDLCAConfigured
{
  return self->_maxDLCAConfigured;
}

- (BOOL)hasMaxDLCAConfigured
{
  return self->_hasMaxDLCAConfigured;
}

- (void)setHasMaxDLCAConfigured:(BOOL)a3
{
  self->_hasMaxDLCAConfigured = a3;
}

- (unsigned)totalConfiguredBw
{
  return self->_totalConfiguredBw;
}

- (BOOL)hasTotalConfiguredBw
{
  return self->_hasTotalConfiguredBw;
}

- (void)setHasTotalConfiguredBw:(BOOL)a3
{
  self->_hasTotalConfiguredBw = a3;
}

- (unsigned)nrConfiguredBw
{
  return self->_nrConfiguredBw;
}

- (BOOL)hasNrConfiguredBw
{
  return self->_hasNrConfiguredBw;
}

- (void)setHasNrConfiguredBw:(BOOL)a3
{
  self->_hasNrConfiguredBw = a3;
}

- (unsigned)nrTotalScheduledMimoLayers
{
  return self->_nrTotalScheduledMimoLayers;
}

- (BOOL)hasNrTotalScheduledMimoLayers
{
  return self->_hasNrTotalScheduledMimoLayers;
}

- (void)setHasNrTotalScheduledMimoLayers:(BOOL)a3
{
  self->_hasNrTotalScheduledMimoLayers = a3;
}

- (unsigned)totalConfiguredMimoLayers
{
  return self->_totalConfiguredMimoLayers;
}

- (BOOL)hasTotalConfiguredMimoLayers
{
  return self->_hasTotalConfiguredMimoLayers;
}

- (void)setHasTotalConfiguredMimoLayers:(BOOL)a3
{
  self->_hasTotalConfiguredMimoLayers = a3;
}

- (unsigned)lteMaxScheduledMimoLayersInACell
{
  return self->_lteMaxScheduledMimoLayersInACell;
}

- (BOOL)hasLteMaxScheduledMimoLayersInACell
{
  return self->_hasLteMaxScheduledMimoLayersInACell;
}

- (void)setHasLteMaxScheduledMimoLayersInACell:(BOOL)a3
{
  self->_hasLteMaxScheduledMimoLayersInACell = a3;
}

- (unsigned)nrMaxDlModulation
{
  return self->_nrMaxDlModulation;
}

- (BOOL)hasNrMaxDlModulation
{
  return self->_hasNrMaxDlModulation;
}

- (void)setHasNrMaxDlModulation:(BOOL)a3
{
  self->_hasNrMaxDlModulation = a3;
}

- (unsigned)actualHighBandwidth
{
  return self->_actualHighBandwidth;
}

- (BOOL)hasActualHighBandwidth
{
  return self->_hasActualHighBandwidth;
}

- (void)setHasActualHighBandwidth:(BOOL)a3
{
  self->_hasActualHighBandwidth = a3;
}

- (unsigned)actualLowBandwidth
{
  return self->_actualLowBandwidth;
}

- (BOOL)hasActualLowBandwidth
{
  return self->_hasActualLowBandwidth;
}

- (void)setHasActualLowBandwidth:(BOOL)a3
{
  self->_hasActualLowBandwidth = a3;
}

- (unsigned)pActualLowBandwidth
{
  return self->_pActualLowBandwidth;
}

- (BOOL)hasPActualLowBandwidth
{
  return self->_hasPActualLowBandwidth;
}

- (void)setHasPActualLowBandwidth:(BOOL)a3
{
  self->_hasPActualLowBandwidth = a3;
}

- (unsigned)maxOfActualLowBandwidth
{
  return self->_maxOfActualLowBandwidth;
}

- (BOOL)hasMaxOfActualLowBandwidth
{
  return self->_hasMaxOfActualLowBandwidth;
}

- (void)setHasMaxOfActualLowBandwidth:(BOOL)a3
{
  self->_hasMaxOfActualLowBandwidth = a3;
}

- (unsigned)estimatedHighBandwidth
{
  return self->_estimatedHighBandwidth;
}

- (BOOL)hasEstimatedHighBandwidth
{
  return self->_hasEstimatedHighBandwidth;
}

- (void)setHasEstimatedHighBandwidth:(BOOL)a3
{
  self->_hasEstimatedHighBandwidth = a3;
}

- (unsigned)estimatedLowBandwidth
{
  return self->_estimatedLowBandwidth;
}

- (BOOL)hasEstimatedLowBandwidth
{
  return self->_hasEstimatedLowBandwidth;
}

- (void)setHasEstimatedLowBandwidth:(BOOL)a3
{
  self->_hasEstimatedLowBandwidth = a3;
}

- (unsigned)movingAvgHighBandwidth
{
  return self->_movingAvgHighBandwidth;
}

- (BOOL)hasMovingAvgHighBandwidth
{
  return self->_hasMovingAvgHighBandwidth;
}

- (void)setHasMovingAvgHighBandwidth:(BOOL)a3
{
  self->_hasMovingAvgHighBandwidth = a3;
}

- (unsigned)movingAvgLowBandwidth
{
  return self->_movingAvgLowBandwidth;
}

- (BOOL)hasMovingAvgLowBandwidth
{
  return self->_hasMovingAvgLowBandwidth;
}

- (void)setHasMovingAvgLowBandwidth:(BOOL)a3
{
  self->_hasMovingAvgLowBandwidth = a3;
}

- (unsigned)cmDataSentCount
{
  return self->_cmDataSentCount;
}

- (BOOL)hasCmDataSentCount
{
  return self->_hasCmDataSentCount;
}

- (void)setHasCmDataSentCount:(BOOL)a3
{
  self->_hasCmDataSentCount = a3;
}

- (unsigned)cmDataSentDuration
{
  return self->_cmDataSentDuration;
}

- (BOOL)hasCmDataSentDuration
{
  return self->_hasCmDataSentDuration;
}

- (void)setHasCmDataSentDuration:(BOOL)a3
{
  self->_hasCmDataSentDuration = a3;
}

- (unsigned)tcpRTTAvg
{
  return self->_tcpRTTAvg;
}

- (BOOL)hasTcpRTTAvg
{
  return self->_hasTcpRTTAvg;
}

- (void)setHasTcpRTTAvg:(BOOL)a3
{
  self->_hasTcpRTTAvg = a3;
}

- (unsigned)tcpRTTvar
{
  return self->_tcpRTTvar;
}

- (BOOL)hasTcpRTTvar
{
  return self->_hasTcpRTTvar;
}

- (void)setHasTcpRTTvar:(BOOL)a3
{
  self->_hasTcpRTTvar = a3;
}

- (unsigned)videoStreamingStallTime
{
  return self->_videoStreamingStallTime;
}

- (BOOL)hasVideoStreamingStallTime
{
  return self->_hasVideoStreamingStallTime;
}

- (void)setHasVideoStreamingStallTime:(BOOL)a3
{
  self->_hasVideoStreamingStallTime = a3;
}

- (unsigned)numStall
{
  return self->_numStall;
}

- (BOOL)hasNumStall
{
  return self->_hasNumStall;
}

- (void)setHasNumStall:(BOOL)a3
{
  self->_hasNumStall = a3;
}

- (unsigned)stallDuration
{
  return self->_stallDuration;
}

- (BOOL)hasStallDuration
{
  return self->_hasStallDuration;
}

- (void)setHasStallDuration:(BOOL)a3
{
  self->_hasStallDuration = a3;
}

- (unsigned)cellEstimatedBW
{
  return self->_cellEstimatedBW;
}

- (BOOL)hasCellEstimatedBW
{
  return self->_hasCellEstimatedBW;
}

- (void)setHasCellEstimatedBW:(BOOL)a3
{
  self->_hasCellEstimatedBW = a3;
}

- (unsigned)cellLoad
{
  return self->_cellLoad;
}

- (BOOL)hasCellLoad
{
  return self->_hasCellLoad;
}

- (void)setHasCellLoad:(BOOL)a3
{
  self->_hasCellLoad = a3;
}

- (unsigned)cellModelConfidenceLevel
{
  return self->_cellModelConfidenceLevel;
}

- (BOOL)hasCellModelConfidenceLevel
{
  return self->_hasCellModelConfidenceLevel;
}

- (void)setHasCellModelConfidenceLevel:(BOOL)a3
{
  self->_hasCellModelConfidenceLevel = a3;
}

- (unsigned)mlPredictedCellBW
{
  return self->_mlPredictedCellBW;
}

- (BOOL)hasMlPredictedCellBW
{
  return self->_hasMlPredictedCellBW;
}

- (void)setHasMlPredictedCellBW:(BOOL)a3
{
  self->_hasMlPredictedCellBW = a3;
}

- (unsigned)qbssLoad
{
  return self->_qbssLoad;
}

- (BOOL)hasQbssLoad
{
  return self->_hasQbssLoad;
}

- (void)setHasQbssLoad:(BOOL)a3
{
  self->_hasQbssLoad = a3;
}

- (unsigned)lqmScorecellular
{
  return self->_lqmScorecellular;
}

- (BOOL)hasLqmScorecellular
{
  return self->_hasLqmScorecellular;
}

- (void)setHasLqmScorecellular:(BOOL)a3
{
  self->_hasLqmScorecellular = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratType, 0);
  objc_storeStrong((id *)&self->_geohash, 0);
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

    v4 = -[BMDeviceConnectivityContext initByReadFrom:]([BMDeviceConnectivityContext alloc], "initByReadFrom:", v7);
    v4[15] = 0;

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
  void *v9;
  void *v10;
  id v12;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[46];

  v48[44] = *MEMORY[0x1E0C80C00];
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("geohash"), 2, 0, 1, 13, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("counter"), 0, 0, 2, 4, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("event"), 0, 0, 3, 4, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ratType"), 2, 0, 4, 13, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rrcState"), 0, 0, 5, 4, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellNsaEnabled"), 0, 0, 6, 12, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFR1"), 0, 0, 7, 12, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellARFCN"), 0, 0, 8, 4, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellBandInfo"), 0, 0, 9, 4, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellChannelBW"), 0, 0, 10, 4, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellRsrp"), 0, 0, 11, 2, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellSinr"), 0, 0, 12, 2, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellLteRSRQ"), 0, 0, 13, 2, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellNrRSRP"), 0, 0, 14, 2, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellNrRSRQ"), 0, 0, 15, 2, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellNrSNR"), 0, 0, 16, 2, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("maxDLCAConfigured"), 0, 0, 17, 4, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalConfiguredBw"), 0, 0, 18, 4, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nrConfiguredBw"), 0, 0, 19, 4, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nrTotalScheduledMimoLayers"), 0, 0, 20, 4, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalConfiguredMimoLayers"), 0, 0, 21, 4, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lteMaxScheduledMimoLayersInACell"), 0, 0, 22, 4, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nrMaxDlModulation"), 0, 0, 23, 4, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actualHighBandwidth"), 0, 0, 24, 4, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actualLowBandwidth"), 0, 0, 25, 4, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pActualLowBandwidth"), 0, 0, 26, 4, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("maxOfActualLowBandwidth"), 0, 0, 27, 4, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("estimatedHighBandwidth"), 0, 0, 28, 4, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("estimatedLowBandwidth"), 0, 0, 29, 4, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("movingAvgHighBandwidth"), 0, 0, 30, 4, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("movingAvgLowBandwidth"), 0, 0, 31, 4, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cmDataSentCount"), 0, 0, 32, 4, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cmDataSentDuration"), 0, 0, 33, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tcpRTTAvg"), 0, 0, 34, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tcpRTTvar"), 0, 0, 35, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("videoStreamingStallTime"), 0, 0, 36, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numStall"), 0, 0, 37, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stallDuration"), 0, 0, 38, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellEstimatedBW"), 0, 0, 39, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellLoad"), 0, 0, 40, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cellModelConfidenceLevel"), 0, 0, 41, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mlPredictedCellBW"), 0, 0, 42, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("qbssLoad"), 0, 0, 43, 4, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lqmScorecellular"), 0, 0, 44, 4, 0);
  v48[0] = v47;
  v48[1] = v46;
  v48[2] = v45;
  v48[3] = v44;
  v48[4] = v43;
  v48[5] = v42;
  v48[6] = v41;
  v48[7] = v40;
  v48[8] = v39;
  v48[9] = v38;
  v48[10] = v37;
  v48[11] = v36;
  v48[12] = v35;
  v48[13] = v34;
  v48[14] = v33;
  v48[15] = v32;
  v48[16] = v31;
  v48[17] = v30;
  v48[18] = v29;
  v48[19] = v28;
  v48[20] = v27;
  v48[21] = v26;
  v48[22] = v25;
  v48[23] = v24;
  v48[24] = v23;
  v48[25] = v22;
  v48[26] = v21;
  v48[27] = v20;
  v48[28] = v19;
  v48[29] = v18;
  v48[30] = v17;
  v48[31] = v16;
  v48[32] = v15;
  v48[33] = v14;
  v48[34] = v2;
  v48[35] = v3;
  v48[36] = v4;
  v48[37] = v5;
  v48[38] = v6;
  v48[39] = v7;
  v48[40] = v8;
  v48[41] = v13;
  v48[42] = v9;
  v48[43] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 44);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BDF0;
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
  id v13;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[46];

  v48[44] = *MEMORY[0x1E0C80C00];
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("geohash"), 1, 13, 0);
  v48[0] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("counter"), 2, 4, 0);
  v48[1] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("event"), 3, 4, 0);
  v48[2] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ratType"), 4, 13, 0);
  v48[3] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rrcState"), 5, 4, 0);
  v48[4] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellNsaEnabled"), 6, 12, 0);
  v48[5] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFR1"), 7, 12, 0);
  v48[6] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellARFCN"), 8, 4, 0);
  v48[7] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellBandInfo"), 9, 4, 0);
  v48[8] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellChannelBW"), 10, 4, 0);
  v48[9] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellRsrp"), 11, 2, 0);
  v48[10] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellSinr"), 12, 2, 0);
  v48[11] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellLteRSRQ"), 13, 2, 0);
  v48[12] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellNrRSRP"), 14, 2, 0);
  v48[13] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellNrRSRQ"), 15, 2, 0);
  v48[14] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellNrSNR"), 16, 2, 0);
  v48[15] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("maxDLCAConfigured"), 17, 4, 0);
  v48[16] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalConfiguredBw"), 18, 4, 0);
  v48[17] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nrConfiguredBw"), 19, 4, 0);
  v48[18] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nrTotalScheduledMimoLayers"), 20, 4, 0);
  v48[19] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalConfiguredMimoLayers"), 21, 4, 0);
  v48[20] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lteMaxScheduledMimoLayersInACell"), 22, 4, 0);
  v48[21] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nrMaxDlModulation"), 23, 4, 0);
  v48[22] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actualHighBandwidth"), 24, 4, 0);
  v48[23] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actualLowBandwidth"), 25, 4, 0);
  v48[24] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pActualLowBandwidth"), 26, 4, 0);
  v48[25] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("maxOfActualLowBandwidth"), 27, 4, 0);
  v48[26] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("estimatedHighBandwidth"), 28, 4, 0);
  v48[27] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("estimatedLowBandwidth"), 29, 4, 0);
  v48[28] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("movingAvgHighBandwidth"), 30, 4, 0);
  v48[29] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("movingAvgLowBandwidth"), 31, 4, 0);
  v48[30] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cmDataSentCount"), 32, 4, 0);
  v48[31] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cmDataSentDuration"), 33, 4, 0);
  v48[32] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tcpRTTAvg"), 34, 4, 0);
  v48[33] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tcpRTTvar"), 35, 4, 0);
  v48[34] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("videoStreamingStallTime"), 36, 4, 0);
  v48[35] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numStall"), 37, 4, 0);
  v48[36] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stallDuration"), 38, 4, 0);
  v48[37] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellEstimatedBW"), 39, 4, 0);
  v48[38] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellLoad"), 40, 4, 0);
  v48[39] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cellModelConfidenceLevel"), 41, 4, 0);
  v48[40] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mlPredictedCellBW"), 42, 4, 0);
  v48[41] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("qbssLoad"), 43, 4, 0);
  v48[42] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lqmScorecellular"), 44, 4, 0);
  v48[43] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 44);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
