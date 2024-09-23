@implementation HMDHouseholdNetworkStabilityLogEventFactory

- (HMDHouseholdNetworkStabilityLogEventFactory)initWithNetworkObserver:(id)a3
{
  id v5;
  HMDHouseholdNetworkStabilityLogEventFactory *v6;
  HMDHouseholdNetworkStabilityLogEventFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHouseholdNetworkStabilityLogEventFactory;
  v6 = -[HMDHouseholdNetworkStabilityLogEventFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_networkObserver, a3);

  return v7;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[HMDHouseholdNetworkStabilityLogEventFactory networkObserver](self, "networkObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventForHomeWithUUID:associatedWithDate:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)serializeLogEvents:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v9 = CFSTR("networkStabilityLogEvent");
    objc_msgSend(v5, "serializedLogEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)logEventsFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  HMDNetworkStabilityLogEvent *v6;
  HMDNetworkStabilityLogEvent *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("networkStabilityLogEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5
    && (v6 = -[HMDNetworkStabilityLogEvent initWithDictionary:]([HMDNetworkStabilityLogEvent alloc], "initWithDictionary:", v5)) != 0)
  {
    v7 = v6;
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMDHouseholdNetworkStabilityLogEvent *v32;
  void *v33;
  id v35;
  void *v36;
  id obj;
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
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  HMDHouseholdNetworkStabilityLogEvent *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v5;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if (v40)
  {
    v48 = 0;
    v49 = 0;
    v9 = 0;
    v50 = 0;
    v51 = 0;
    v47 = 0;
    v39 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v53 != v39)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
        {
          v43 = v7;
          v44 = v8;
          v45 = v6;
          v46 = v9;
          v14 = objc_msgSend(v13, "numWifiAssociations");
          v15 = objc_msgSend(v13, "numWifiDisassociations");
          v16 = objc_msgSend(v13, "numAPChanges");
          v17 = objc_msgSend(v13, "numGatewayChanges");
          v18 = objc_msgSend(v13, "numReadWrites");
          v19 = objc_msgSend(v13, "numReadErrors");
          v42 = objc_msgSend(v13, "numWriteErrors");
          v41 = objc_msgSend(v13, "numSessionErrors");
          objc_msgSend(v13, "ssid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "gatewayMACAddress");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v20)
            v23 = v21 == 0;
          else
            v23 = 1;
          if (!v23)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v20, v21);
            v38 = v19;
            v24 = v18;
            v25 = v17;
            v26 = v16;
            v27 = v15;
            v28 = v14;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v29);

            v14 = v28;
            v15 = v27;
            v16 = v26;
            v17 = v25;
            v18 = v24;
            v19 = v38;
          }
          v47 += v14;
          v49 += v15;
          v50 += v16;
          ++v51;
          v9 = v17 + v46;
          v48 += v18;
          v8 = v19 + v44;
          v6 = v42 + v45;
          v7 = v41 + v43;

        }
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v40);
  }
  else
  {
    v48 = 0;
    v49 = 0;
    v9 = 0;
    v50 = 0;
    v51 = 0;
    v47 = 0;
  }

  v30 = objc_msgSend(v36, "count");
  if (v51)
  {
    v31 = v35;
    v32 = -[HMDHouseholdNetworkStabilityLogEvent initWithHomeUUID:numStabilityReporters:WifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:numSessionErrors:numNetworkSignatures:]([HMDHouseholdNetworkStabilityLogEvent alloc], "initWithHomeUUID:numStabilityReporters:WifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:numSessionErrors:numNetworkSignatures:", v35, v51, v47, v49, v50, v9, v48, v8, v6, v7, v30);
    v56 = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = (void *)MEMORY[0x24BDBD1A8];
    v31 = v35;
  }

  return v33;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHouseholdNetworkStabilityLogEventFactory networkObserver](self, "networkObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCountersBeforeDate:", v4);

}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHouseholdNetworkStabilityLogEventFactory networkObserver](self, "networkObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCountersAfterDate:", v4);

}

- (HMDNetworkObserver)networkObserver
{
  return self->_networkObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkObserver, 0);
}

@end
