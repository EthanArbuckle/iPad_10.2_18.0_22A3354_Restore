@implementation HMDMatterThirdPartyPairingTagProcessor

- (HMDMatterThirdPartyPairingTagProcessor)initWithSubmitter:(id)a3
{
  HMDMatterThirdPartyPairingTagProcessor *v3;
  HMDMatterThirdPartyPairingLogEvent *v4;
  HMDMatterThirdPartyPairingLogEvent *logEvent;
  uint64_t v6;
  HMMStateTracker *stateTracker;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDMatterThirdPartyPairingTagProcessor;
  v3 = -[HMMLogEventTagProcessor initWithSubmitter:](&v9, sel_initWithSubmitter_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(HMDMatterThirdPartyPairingLogEvent);
    logEvent = v3->_logEvent;
    v3->_logEvent = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE4F1B8]), "initAutoStopPreviousState:", 0);
    stateTracker = v3->_stateTracker;
    v3->_stateTracker = (HMMStateTracker *)v6;

  }
  return v3;
}

- (id)tagProcessingBlocks
{
  if (tagProcessingBlocks_token != -1)
    dispatch_once(&tagProcessingBlocks_token, &__block_literal_global_244531);
  return (id)tagProcessingBlocks_processingBlocks;
}

- (void)processPairingStartEvent:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[HMDMatterThirdPartyPairingTagProcessor setStartTime:](self, "setStartTime:", objc_msgSend(v4, "tagTime"));
  -[HMDMatterThirdPartyPairingTagProcessor stateTracker](self, "stateTracker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tagTime");

  objc_msgSend(v6, "startWithTime:", v5);
}

- (void)processPairingErrorEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "tagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4F148]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v28, "tagData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE4F150]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setErrorDomain:", v11);

    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v7;
  }
  else
  {
    v16 = *MEMORY[0x24BDD5BD8];
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setErrorDomain:", v16);

    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = &unk_24E96D5B0;
  }
  objc_msgSend(v13, "setErrorCode:", v15);

  objc_msgSend(v28, "tagData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE4F158]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (v21)
  {
    objc_msgSend(v28, "tagData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BE4F160]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUnderlyingErrorDomain:", v25);

    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setUnderlyingErrorCode:", v21);

  }
  -[HMDMatterThirdPartyPairingTagProcessor closeSessionWithEvent:](self, "closeSessionWithEvent:", v28);

}

- (void)processPairingErrorCancelledEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x24BDD5BD8];
  v7 = a3;
  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setErrorDomain:", v4);

  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setErrorCode:", &unk_24E96D5C8);

  -[HMDMatterThirdPartyPairingTagProcessor closeSessionWithEvent:](self, "closeSessionWithEvent:", v7);
}

- (void)processAccessoryInfoEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;

  v64 = a3;
  objc_msgSend(v64, "tagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4EEB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCommunicationProtocol:", v7);

  }
  objc_msgSend(v64, "tagData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE4EEB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMatterCategoryNumber:", v12);

  }
  objc_msgSend(v64, "tagData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE4EF18]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMatterVendorNumber:", v17);

  }
  objc_msgSend(v64, "tagData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE4EED8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMatterProductNumber:", v22);

  }
  v62 = v17;
  objc_msgSend(v64, "tagData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BE4EED0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  if (v27)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMatterProductID:", v27);

  }
  v60 = v27;
  v61 = v22;
  objc_msgSend(v64, "tagData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BE4EEA8]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v31 = v30;
  else
    v31 = 0;
  v32 = v31;

  if (v32)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setClient:", v32);

  }
  objc_msgSend(v64, "tagData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x24BE4EF08]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;
  v37 = v36;

  if (v37)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSupportsSoftAP:", v37);

  }
  objc_msgSend(v64, "tagData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x24BE4EEC8]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v41 = v40;
  else
    v41 = 0;
  v42 = v41;

  if (v42)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setHasShortDiscriminator:", v42);

  }
  v63 = v12;
  objc_msgSend(v64, "tagData");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE4EEE0]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;
  v47 = v46;

  if (v47)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setRequiresMatterCustomCommissioningFlow:", v47);

  }
  v49 = v7;
  objc_msgSend(v64, "tagData");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE88]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v52 = v51;
  else
    v52 = 0;
  v53 = v52;

  if (v53)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDiscoveredOverBLE:", v53);

  }
  objc_msgSend(v64, "tagData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x24BE4EEA0]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v57 = v56;
  else
    v57 = 0;
  v58 = v57;

  if (v58)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setKnownToSystemCommissioner:", v58);

  }
}

- (void)processCASESanityCheckEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "tagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v8 = v6;

  if (v8)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCaseSessionSanityCheckPassed:", v8);

  }
}

- (void)processThreadSetupDuration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "tagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v8 = v6;

  if (v8)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setThreadSetupDuration:", v8);

  }
}

- (void)processAccessoryTransport:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "tagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v8 = v6;

  if (v8)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessoryTransportType:", v8);

  }
}

- (void)processPairingEventWindowOpenedSetupDuration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "tagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v8 = v6;

  if (v8)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPairingWindowOpenedWithPasscodeDuration:", v8);

  }
}

- (void)processFirmwareVersionEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "tagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v8 = v6;

  if (v8)
  {
    -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFirmwareVersion:", v8);

  }
}

- (void)processThreadScanResultsEvent:(id)a3
{
  id v3;

  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProvidedThreadScanResults:", MEMORY[0x24BDBD1C8]);

}

- (void)processWiFiScanResultsEvent:(id)a3
{
  id v3;

  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProvidedWiFiScanResults:", MEMORY[0x24BDBD1C8]);

}

- (void)processCredentialsToClientEvent:(id)a3
{
  id v3;

  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCredentialsSentToClient:", MEMORY[0x24BDBD1C8]);

}

- (void)processLongestPairingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "tagData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLongestStateName:", v8);

  objc_msgSend(v4, "tagData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE20]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLongestStateDuration:", v13);

}

- (void)processStateChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  HMDMatterThirdPartyPairingTagProcessor *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "tagData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE4EE60];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4EE60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = CFSTR("Adding WiFi Credentials");
    v11 = CFSTR("Discovery");
    switch(objc_msgSend(v9, "integerValue"))
    {
      case 12:
        goto LABEL_26;
      case 13:
        v11 = CFSTR("Adding System Commissioner");
        goto LABEL_26;
      case 14:
      case 15:
        v11 = CFSTR("Adding WiFi Credentials");
        goto LABEL_26;
      case 16:
        goto LABEL_24;
      case 17:
      case 18:
        v11 = CFSTR("Network Scan");
        goto LABEL_26;
      case 19:
        v10 = CFSTR("Network Scan");
        goto LABEL_24;
      case 20:
      case 21:
      case 22:
        v11 = CFSTR("Opening Pairing Window");
        goto LABEL_26;
      case 23:
        v10 = CFSTR("Opening Pairing Window");
        goto LABEL_24;
      case 24:
      case 25:
        v11 = CFSTR("Opening Pairing Window With Passcode");
        goto LABEL_26;
      case 26:
        v10 = CFSTR("Opening Pairing Window With Passcode - Failed");
        goto LABEL_24;
      case 27:
      case 28:
        v11 = CFSTR("Commissioning Accessory");
        goto LABEL_26;
      case 29:
        v10 = CFSTR("Commissioning Accessory");
        goto LABEL_24;
      case 30:
      case 31:
        v11 = CFSTR("Retrieving Thread Credentials");
        goto LABEL_26;
      case 32:
        v10 = CFSTR("Retrieving Thread Credentials");
        goto LABEL_24;
      case 33:
      case 34:
        v11 = CFSTR("CASE session sanity check");
        goto LABEL_26;
      case 35:
        v10 = CFSTR("CASE session sanity check");
        goto LABEL_24;
      case 36:
        v11 = CFSTR("Resident Confirmation");
LABEL_26:
        -[HMDMatterThirdPartyPairingTagProcessor stateTracker](self, "stateTracker");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v4, "tagTime");
        objc_msgSend(v4, "tagData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "enterState:enterTime:enterData:", v11, v19, v18);
        goto LABEL_27;
      case 37:
      case 38:
        v10 = CFSTR("Resident Confirmation");
LABEL_24:
        -[HMDMatterThirdPartyPairingTagProcessor stateTracker](self, "stateTracker");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v4, "tagTime");
        objc_msgSend(v4, "tagData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "exitState:exitTime:exitData:", v10, v17, v18);
LABEL_27:

        break;
      default:
        break;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Missing tag field %@, or not an NSNumber", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)closeSessionWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMatterThirdPartyPairingTagProcessor *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HMDMatterThirdPartyPairingTagProcessor *v24;
  NSObject *v25;
  uint64_t v26;
  HMDMatterThirdPartyPairingTagProcessor *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMatterThirdPartyPairingTagProcessor stateTracker](self, "stateTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endWithTime:", objc_msgSend(v4, "tagTime"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[HMDMatterThirdPartyPairingTagProcessor stateTracker](self, "stateTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "totalDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPairingDuration:", v8);

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = self;
  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", v13 == 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSuccess:", v14);

  -[HMMLogEventTagProcessor closeForReason:](v11, "closeForReason:", 0);
  if (isInternalBuild())
  {
    v31 = v4;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[HMDMatterThirdPartyPairingTagProcessor stateTracker](v11, "stateTracker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "states");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v17;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v18)
    {
      v19 = v18;
      v34 = 0;
      v20 = *(_QWORD *)v36;
      do
      {
        v21 = 0;
        v32 = v19;
        do
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x227676638]();
          v24 = v11;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = v20;
            v27 = v11;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v22, "duration");
            *(_DWORD *)buf = 138544130;
            v40 = v28;
            v41 = 2048;
            v42 = v34 + v21;
            v43 = 2112;
            v44 = v29;
            v45 = 2048;
            v46 = v30;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Matter pairing state %ld: %@ for %lu msec", buf, 0x2Au);

            v11 = v27;
            v20 = v26;
            v19 = v32;
          }

          objc_autoreleasePoolPop(v23);
          ++v21;
        }
        while (v19 != v21);
        v34 += v21;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v19);
    }

    v4 = v31;
  }

}

- (void)setLogEventCloseReason:(unint64_t)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3 == 0;
  -[HMDMatterThirdPartyPairingTagProcessor logEvent](self, "logEvent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCleanClose:", v3);

}

- (HMDMatterThirdPartyPairingLogEvent)logEvent
{
  return self->_logEvent;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(int64_t)a3
{
  self->_startTime = a3;
}

- (HMMStateTracker)stateTracker
{
  return self->_stateTracker;
}

- (void)setStateTracker:(id)a3
{
  objc_storeStrong((id *)&self->_stateTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_logEvent, 0);
}

void __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[15];
  _QWORD v10[16];

  v10[15] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE4EF00];
  v9[0] = *MEMORY[0x24BE4EEF8];
  v9[1] = v0;
  v10[0] = &__block_literal_global_8_244532;
  v10[1] = &__block_literal_global_9_244533;
  v1 = *MEMORY[0x24BE4EE68];
  v9[2] = *MEMORY[0x24BE4EEF0];
  v9[3] = v1;
  v10[2] = &__block_literal_global_10_244534;
  v10[3] = &__block_literal_global_11_244535;
  v2 = *MEMORY[0x24BE4EE30];
  v9[4] = *MEMORY[0x24BE4EE28];
  v9[5] = v2;
  v10[4] = &__block_literal_global_12_244536;
  v10[5] = &__block_literal_global_13_244537;
  v3 = *MEMORY[0x24BE4EEE8];
  v9[6] = *MEMORY[0x24BE4EE78];
  v9[7] = v3;
  v10[6] = &__block_literal_global_14_244538;
  v10[7] = &__block_literal_global_15_244539;
  v4 = *MEMORY[0x24BE4EF10];
  v9[8] = *MEMORY[0x24BE4EE90];
  v9[9] = v4;
  v10[8] = &__block_literal_global_16_244540;
  v10[9] = &__block_literal_global_17_244541;
  v5 = *MEMORY[0x24BE4EE58];
  v9[10] = *MEMORY[0x24BE4EF20];
  v9[11] = v5;
  v10[10] = &__block_literal_global_18_244542;
  v10[11] = &__block_literal_global_19_244543;
  v6 = *MEMORY[0x24BE4EE38];
  v9[12] = *MEMORY[0x24BE4EEC0];
  v9[13] = v6;
  v10[12] = &__block_literal_global_20_244544;
  v10[13] = &__block_literal_global_21_244545;
  v9[14] = *MEMORY[0x24BE4EE50];
  v10[14] = &__block_literal_global_22_244546;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 15);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)tagProcessingBlocks_processingBlocks;
  tagProcessingBlocks_processingBlocks = v7;

}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingErrorCancelledEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processCASESanityCheckEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processCredentialsToClientEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processLongestPairingState:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processWiFiScanResultsEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processThreadScanResultsEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processFirmwareVersionEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processAccessoryInfoEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processAccessoryTransport:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingEventWindowOpenedSetupDuration:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processThreadSetupDuration:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processStateChange:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingErrorEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingSuccessEvent:");
}

uint64_t __61__HMDMatterThirdPartyPairingTagProcessor_tagProcessingBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processPairingStartEvent:");
}

@end
