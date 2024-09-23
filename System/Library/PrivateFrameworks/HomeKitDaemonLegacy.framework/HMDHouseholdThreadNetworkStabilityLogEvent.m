@implementation HMDHouseholdThreadNetworkStabilityLogEvent

- (HMDHouseholdThreadNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numStabilityReporters:(unint64_t)a4 threadNetworkStatusReport:(id)a5 threadNetworkUptime:(unint64_t)a6 threadNetworkDowntime:(unint64_t)a7 numReadWrites:(unint64_t)a8 numReadErrors:(unint64_t)a9 numWriteErrors:(unint64_t)a10 numSessionErrors:(unint64_t)a11
{
  id v18;
  HMDHouseholdThreadNetworkStabilityLogEvent *v19;
  HMDHouseholdThreadNetworkStabilityLogEvent *v20;
  objc_super v22;

  v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDHouseholdThreadNetworkStabilityLogEvent;
  v19 = -[HMMHomeLogEvent initWithHomeUUID:](&v22, sel_initWithHomeUUID_, a3);
  v20 = v19;
  if (v19)
  {
    v19->_numStabilityReporters = a4;
    objc_storeStrong((id *)&v19->_threadNetworkStatusReport, a5);
    v20->_threadNetworkUptime = a6;
    v20->_threadNetworkDowntime = a7;
    v20->_numReadWrites = a8;
    v20->_numReadErrors = a9;
    v20->_numWriteErrors = a10;
    v20->_numSessionErrors = a11;
  }

  return v20;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.threadnetwork.stability.household");
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
  _QWORD v45[18];
  _QWORD v46[20];

  v46[18] = *MEMORY[0x1E0C80C00];
  v45[0] = CFSTR("numStabilityReporters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numStabilityReporters](self, "numStabilityReporters"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v44;
  v45[1] = CFSTR("numAdvertisedBRs");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v43, "numAdvertisedBRs"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v42;
  v45[2] = CFSTR("numAppleBRs");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v41, "numAppleBRs"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v40;
  v45[3] = CFSTR("numThirdPartyBRs");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v39, "numThirdPartyBRs"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v38;
  v45[4] = CFSTR("numThreadNetworks");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v37, "numThreadNetworks"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v36;
  v45[5] = CFSTR("maxSimuIPPrefixesDetected");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v35, "maxSimuIPPrefixesDetected"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v34;
  v45[6] = CFSTR("txTotal");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v33, "txTotal"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v32;
  v45[7] = CFSTR("txSuccess");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v31, "txSuccess"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v30;
  v45[8] = CFSTR("txDelayAvg");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v29, "txDelayAvg"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v28;
  v45[9] = CFSTR("rxTotal");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v27, "rxTotal"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[9] = v26;
  v45[10] = CFSTR("rxSuccess");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v25, "rxSuccess"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[10] = v13;
  v45[11] = CFSTR("reportDuration");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkStatusReport](self, "threadNetworkStatusReport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "reportDuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46[11] = v16;
  v45[12] = CFSTR("threadNetworkUptime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkUptime](self, "threadNetworkUptime"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[12] = v17;
  v45[13] = CFSTR("threadNetworkDowntime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkDowntime](self, "threadNetworkDowntime"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[13] = v18;
  v45[14] = CFSTR("numReadWrites");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[14] = v19;
  v45[15] = CFSTR("numReadErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[15] = v20;
  v45[16] = CFSTR("numWriteErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[16] = v21;
  v45[17] = CFSTR("numSessionErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[17] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v23;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (unint64_t)numStabilityReporters
{
  return self->_numStabilityReporters;
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

- (unint64_t)numNetworkSignatures
{
  return self->_numNetworkSignatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadNetworkStatusReport, 0);
}

@end
