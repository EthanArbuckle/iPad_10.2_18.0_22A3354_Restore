@implementation HMDThreadNetworkStabilityLogEvent

- (HMDThreadNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 threadNetworkStatusReport:(id)a4 threadNetworkUptime:(unint64_t)a5 threadNetworkDowntime:(unint64_t)a6 numReadWrites:(unint64_t)a7 numReadErrors:(unint64_t)a8 numWriteErrors:(unint64_t)a9 topReadWriteError:(id)a10 topSessionError:(id)a11 numSessionErrors:(unint64_t)a12 logTriggerReason:(id)a13
{
  id v20;
  id v21;
  id v22;
  HMDThreadNetworkStabilityLogEvent *v23;
  HMDThreadNetworkStabilityLogEvent *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  id v29;
  objc_super v30;

  v29 = a4;
  v20 = a10;
  v21 = a11;
  v22 = a13;
  v30.receiver = self;
  v30.super_class = (Class)HMDThreadNetworkStabilityLogEvent;
  v23 = -[HMMHomeLogEvent initWithHomeUUID:](&v30, sel_initWithHomeUUID_, a3);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_threadNetworkStatusReport, a4);
    v24->_threadNetworkUptime = a5;
    v24->_threadNetworkDowntime = a6;
    v24->_numReadWrites = a7;
    v24->_numReadErrors = a8;
    v24->_numWriteErrors = a9;
    if (v20)
      v25 = (__CFString *)objc_msgSend(v20, "copy");
    else
      v25 = CFSTR("<NO ERROR>");
    objc_storeStrong((id *)&v24->_topReadWriteError, v25);
    if (v20)

    if (v21)
      v26 = (__CFString *)objc_msgSend(v21, "copy");
    else
      v26 = CFSTR("<NO ERROR>");
    objc_storeStrong((id *)&v24->_topSessionError, v26);
    if (v21)

    v24->_numSessionErrors = a12;
    if (v22)
      v27 = (__CFString *)objc_msgSend(v22, "copy");
    else
      v27 = CFSTR("Periodic Snapshot");
    objc_storeStrong((id *)&v24->_logTriggerReason, v27);
    if (v22)

  }
  return v24;
}

- (HMDThreadNetworkStabilityLogEvent)initWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
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
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  HMDThreadNetworkStabilityLogEvent *v51;
  void *v52;
  HMDThreadNetworkStatusReport *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  unsigned int v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v72 = v6;
  if (v6)
    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v6);
  else
    v88 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numAdvertisedBRs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v87 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numAppleBRs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v78 = v10;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numThirdPartyBRs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v77 = v12;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numThreadNetworks"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v76 = v14;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxSimuIPPrefixesDetected"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v71 = v16;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("txTotal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v80 = v18;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("txSuccess"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v84 = v20;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("txDelayAvg"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v86 = v22;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rxTotal"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rxSuccess"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v85 = v27;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reportDuration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v30 = v29;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("threadNetworkUptime"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;
  v83 = v32;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("threadNetworkDowntime"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v34 = v33;
  else
    v34 = 0;
  v82 = v34;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numReadWrites"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;
  v81 = v36;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numReadErrors"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v38 = v37;
  else
    v38 = 0;
  v75 = v38;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numWriteErrors"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = v39;
  else
    v40 = 0;
  v74 = v40;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topReadWriteError"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v42 = v41;
  else
    v42 = 0;
  v43 = v42;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topSessionError"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v45 = v44;
  else
    v45 = 0;
  v73 = v45;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numSessionErrors"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v47 = v46;
  else
    v47 = 0;
  v48 = v47;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logTriggerReason"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v50 = v49;
  else
    v50 = 0;
  v68 = v50;

  v51 = 0;
  v69 = v30;
  v70 = v25;
  if (!v88 || !v87)
  {
    v62 = v71;
    v60 = v80;
    v55 = v74;
    v52 = v75;
    v59 = v73;
    v58 = v68;
    goto LABEL_94;
  }
  v52 = v75;
  if (!v78
    || !v77
    || !v76
    || !v71
    || !v80
    || !v84
    || !v86
    || !v25
    || !v85
    || !v30
    || !v83
    || !v82
    || !v81
    || !v75
    || !v74
    || !v43)
  {
    v55 = v74;
    v59 = v73;
    goto LABEL_92;
  }
  if (!v73 || !v48)
  {
    v55 = v74;
    v59 = v73;
LABEL_92:
    v58 = v68;
    goto LABEL_93;
  }
  if (!v68)
  {
    v55 = v74;
    v52 = v75;
    v58 = 0;
    v59 = v73;
LABEL_93:
    v51 = 0;
    v62 = v71;
    v60 = v80;
    goto LABEL_94;
  }
  v53 = -[HMDThreadNetworkStatusReport initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:]([HMDThreadNetworkStatusReport alloc], "initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:", objc_msgSend(v87, "unsignedIntValue"), objc_msgSend(v78, "unsignedIntValue"), objc_msgSend(v77, "unsignedIntValue"), objc_msgSend(v76, "unsignedIntValue"), objc_msgSend(v71, "unsignedIntValue"), objc_msgSend(v80, "unsignedIntValue"), objc_msgSend(v84, "unsignedIntValue"), objc_msgSend(v86, "unsignedIntValue"), objc_msgSend(v25, "unsignedIntValue"), objc_msgSend(v85, "unsignedIntValue"), objc_msgSend(v30, "unsignedIntValue"));
  v54 = objc_msgSend(v83, "unsignedIntValue");
  v67 = objc_msgSend(v82, "unsignedIntValue");
  v66 = objc_msgSend(v81, "unsignedIntValue");
  v52 = v75;
  v65 = objc_msgSend(v75, "unsignedIntValue");
  v55 = v74;
  v56 = objc_msgSend(v74, "unsignedIntValue");
  v57 = objc_msgSend(v48, "unsignedIntValue");
  v58 = v68;
  v59 = v73;
  v64 = v56;
  v60 = v80;
  v61 = v54;
  v62 = v71;
  v51 = -[HMDThreadNetworkStabilityLogEvent initWithHomeUUID:threadNetworkStatusReport:threadNetworkUptime:threadNetworkDowntime:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:logTriggerReason:](self, "initWithHomeUUID:threadNetworkStatusReport:threadNetworkUptime:threadNetworkDowntime:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:logTriggerReason:", v88, v53, v61, v67, v66, v65, v64, v43, v73, v57, v68);

  self = v51;
LABEL_94:

  return v51;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.threadnetwork.stability");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
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
  _QWORD v47[20];
  _QWORD v48[22];

  v48[20] = *MEMORY[0x24BDAC8D0];
  v47[0] = CFSTR("numAdvertisedBRs");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v46, "numAdvertisedBRs"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v45;
  v47[1] = CFSTR("numAppleBRs");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v44, "numAppleBRs"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v43;
  v47[2] = CFSTR("numThirdPartyBRs");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v42, "numThirdPartyBRs"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v41;
  v47[3] = CFSTR("numThreadNetworks");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v40, "numThreadNetworks"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v39;
  v47[4] = CFSTR("maxSimuIPPrefixesDetected");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v38, "maxSimuIPPrefixesDetected"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v37;
  v47[5] = CFSTR("txTotal");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v36, "txTotal"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v35;
  v47[6] = CFSTR("txSuccess");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v34, "txSuccess"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v33;
  v47[7] = CFSTR("txDelayAvg");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v32, "txDelayAvg"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v31;
  v47[8] = CFSTR("rxTotal");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v30, "rxTotal"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v29;
  v47[9] = CFSTR("rxSuccess");
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v28, "rxSuccess"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v27;
  v47[10] = CFSTR("reportDuration");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v26, "reportDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v14;
  v47[11] = CFSTR("threadNetworkUptime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkUptime](self, "threadNetworkUptime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v15;
  v47[12] = CFSTR("threadNetworkDowntime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkDowntime](self, "threadNetworkDowntime"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v16;
  v47[13] = CFSTR("numReadWrites");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v17;
  v47[14] = CFSTR("numReadErrors");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[14] = v18;
  v47[15] = CFSTR("numWriteErrors");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[15] = v19;
  v47[16] = CFSTR("topReadWriteError");
  -[HMDThreadNetworkStabilityLogEvent topReadWriteError](self, "topReadWriteError");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[16] = v20;
  v47[17] = CFSTR("topSessionError");
  -[HMDThreadNetworkStabilityLogEvent topSessionError](self, "topSessionError");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[17] = v21;
  v47[18] = CFSTR("numSessionErrors");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[18] = v22;
  v47[19] = CFSTR("logTriggerReason");
  -[HMDThreadNetworkStabilityLogEvent logTriggerReason](self, "logTriggerReason");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[19] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 20);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v25;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (id)serializedLogEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeLogEvent homeUUIDString](self, "homeUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("homeUUID"));

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "numAdvertisedBRs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numAdvertisedBRs"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "numAppleBRs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numAppleBRs"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "numThirdPartyBRs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numThirdPartyBRs"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "numThreadNetworks"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("numThreadNetworks"));

  v17 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "maxSimuIPPrefixesDetected"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("maxSimuIPPrefixesDetected"));

  v20 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "txTotal"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("txTotal"));

  v23 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "txSuccess"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("txSuccess"));

  v26 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "txDelayAvg"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("txDelayAvg"));

  v29 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "rxTotal"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("rxTotal"));

  v32 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "rxSuccess"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("rxSuccess"));

  v35 = (void *)MEMORY[0x24BDD16E0];
  -[HMDThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "reportDuration"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("reportDuration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkUptime](self, "threadNetworkUptime"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("threadNetworkUptime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkDowntime](self, "threadNetworkDowntime"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("threadNetworkDowntime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("numReadWrites"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("numReadErrors"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("numWriteErrors"));

  -[HMDThreadNetworkStabilityLogEvent topReadWriteError](self, "topReadWriteError");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("topReadWriteError"));

  -[HMDThreadNetworkStabilityLogEvent topSessionError](self, "topSessionError");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("topSessionError"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("numSessionErrors"));

  -[HMDThreadNetworkStabilityLogEvent logTriggerReason](self, "logTriggerReason");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("logTriggerReason"));

  v47 = (void *)objc_msgSend(v3, "copy");
  return v47;
}

- (HMDThreadNetworkStatusReport)threadNetworkStatusReport
{
  return self->_threadNetworkStatusReport;
}

- (unint64_t)threadNetworkUptime
{
  return self->_threadNetworkUptime;
}

- (unint64_t)threadNetworkDowntime
{
  return self->_threadNetworkDowntime;
}

- (unint64_t)numReadWrites
{
  return self->_numReadWrites;
}

- (unint64_t)numReadErrors
{
  return self->_numReadErrors;
}

- (unint64_t)numWriteErrors
{
  return self->_numWriteErrors;
}

- (unint64_t)numSessionErrors
{
  return self->_numSessionErrors;
}

- (NSString)topReadWriteError
{
  return self->_topReadWriteError;
}

- (NSString)topSessionError
{
  return self->_topSessionError;
}

- (NSString)logTriggerReason
{
  return self->_logTriggerReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logTriggerReason, 0);
  objc_storeStrong((id *)&self->_topSessionError, 0);
  objc_storeStrong((id *)&self->_topReadWriteError, 0);
  objc_storeStrong((id *)&self->_threadNetworkStatusReport, 0);
}

@end
