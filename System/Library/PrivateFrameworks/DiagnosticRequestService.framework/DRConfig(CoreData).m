@implementation DRConfig(CoreData)

- (id)ON_CONTEXT_QUEUE_initWithConfigMO:()CoreData
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = (objc_class *)MEMORY[0x1E0D1D258];
  v4 = a3;
  v17 = [v3 alloc];
  objc_msgSend(v4, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "receivedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "payloadIsJSON");
  LOBYTE(v3) = objc_msgSend(v4, "skippedHysteresis");

  BYTE1(v15) = (_BYTE)v3;
  LOBYTE(v15) = v12;
  v13 = (void *)objc_msgSend(v17, "initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:", v16, v5, v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (DRConfigMO)ON_CONTEXT_QUEUE_configMOInContext:()CoreData
{
  id v4;
  DRConfigMO *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[DRConfigMO initWithContext:]([DRConfigMO alloc], "initWithContext:", v4);

  objc_msgSend(a1, "teamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setTeamID:](v5, "setTeamID:", v6);

  objc_msgSend(a1, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setBuild:](v5, "setBuild:", v7);

  objc_msgSend(a1, "configDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setConfigDescription:](v5, "setConfigDescription:", v8);

  objc_msgSend(a1, "configUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setConfigUUID:](v5, "setConfigUUID:", v9);

  objc_msgSend(a1, "receivedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setReceivedDate:](v5, "setReceivedDate:", v10);

  objc_msgSend(a1, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setStartDate:](v5, "setStartDate:", v11);

  objc_msgSend(a1, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setEndDate:](v5, "setEndDate:", v12);

  objc_msgSend(a1, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRConfigMO setPayload:](v5, "setPayload:", v13);

  -[DRConfigMO setPayloadIsJSON:](v5, "setPayloadIsJSON:", objc_msgSend(a1, "payloadIsJSON"));
  -[DRConfigMO setSkippedHysteresis:](v5, "setSkippedHysteresis:", objc_msgSend(a1, "skippedHysteresis"));
  return v5;
}

@end
