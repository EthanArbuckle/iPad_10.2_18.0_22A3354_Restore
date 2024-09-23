@implementation HMDHouseholdThreadNetworkStabilityLogEventFactory

- (HMDHouseholdThreadNetworkStabilityLogEventFactory)initWithThreadNetworkObserver:(id)a3
{
  id v5;
  HMDHouseholdThreadNetworkStabilityLogEventFactory *v6;
  HMDHouseholdThreadNetworkStabilityLogEventFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHouseholdThreadNetworkStabilityLogEventFactory;
  v6 = -[HMDHouseholdThreadNetworkStabilityLogEventFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_threadNetworkObserver, a3);

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

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HMDHouseholdThreadNetworkStabilityLogEventFactory threadNetworkObserver](self, "threadNetworkObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventForHomeWithUUID:associatedWithDate:isDailySummary:", v7, v6, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
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

  v10[1] = *MEMORY[0x1E0C80C00];
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
    v9 = CFSTR("threadNetworkStabilityLogEvent");
    objc_msgSend(v5, "serializedLogEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
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
  HMDThreadNetworkStabilityLogEvent *v6;
  HMDThreadNetworkStabilityLogEvent *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("threadNetworkStabilityLogEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5
    && (v6 = -[HMDThreadNetworkStabilityLogEvent initWithDictionary:]([HMDThreadNetworkStabilityLogEvent alloc], "initWithDictionary:", v5)) != 0)
  {
    v7 = v6;
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
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
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  id v16;
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
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  HMDHouseholdThreadNetworkStabilityLogEvent *v39;
  HMDThreadNetworkStatusReport *v40;
  HMDHouseholdThreadNetworkStabilityLogEvent *v41;
  void *v42;
  id v44;
  id obj;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  HMDHouseholdThreadNetworkStabilityLogEvent *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v5;
  v54 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v54)
  {
    v44 = v6;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v52 = 0;
    v7 = 0;
    v55 = 0;
    v56 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v57 = 0;
    v58 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v12 = 0;
    v53 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v63 != v53)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (v16)
        {
          objc_msgSend(v16, "threadNetworkStatusReport");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48 <= objc_msgSend(v17, "numAdvertisedBRs"))
          {
            objc_msgSend(v16, "threadNetworkStatusReport");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v18, "numAdvertisedBRs");

          }
          objc_msgSend(v16, "threadNetworkStatusReport");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49 <= objc_msgSend(v19, "numAppleBRs"))
          {
            objc_msgSend(v16, "threadNetworkStatusReport");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v20, "numAppleBRs");

          }
          objc_msgSend(v16, "threadNetworkStatusReport");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50 <= objc_msgSend(v21, "numThirdPartyBRs"))
          {
            objc_msgSend(v16, "threadNetworkStatusReport");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v22, "numThirdPartyBRs");

          }
          objc_msgSend(v16, "threadNetworkStatusReport");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51 <= objc_msgSend(v23, "numThreadNetworks"))
          {
            objc_msgSend(v16, "threadNetworkStatusReport");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v24, "numThreadNetworks");

          }
          objc_msgSend(v16, "threadNetworkStatusReport");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52 <= objc_msgSend(v25, "maxSimuIPPrefixesDetected"))
          {
            objc_msgSend(v16, "threadNetworkStatusReport");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v26, "maxSimuIPPrefixesDetected");

          }
          ++v12;

          objc_msgSend(v16, "threadNetworkStatusReport");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v8 += objc_msgSend(v27, "txDelayAvg");

          objc_msgSend(v16, "threadNetworkStatusReport");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v7 += objc_msgSend(v28, "txTotal");

          objc_msgSend(v16, "threadNetworkStatusReport");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v55 += objc_msgSend(v29, "txSuccess");

          objc_msgSend(v16, "threadNetworkStatusReport");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v30, "rxTotal");

          objc_msgSend(v16, "threadNetworkStatusReport");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v10 += objc_msgSend(v31, "rxSuccess");

          objc_msgSend(v16, "threadNetworkStatusReport");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v11 += objc_msgSend(v32, "reportDuration");

          v59 += objc_msgSend(v16, "threadNetworkUptime");
          v60 += objc_msgSend(v16, "threadNetworkDowntime");
          v61 += objc_msgSend(v16, "numReadWrites");
          v58 += objc_msgSend(v16, "numReadErrors");
          v57 += objc_msgSend(v16, "numWriteErrors");
          v56 += objc_msgSend(v16, "numSessionErrors");
          objc_msgSend(v16, "threadNetworkStatusReport");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "reportDuration");

          if (v34)
          {
            objc_msgSend(v16, "threadNetworkStatusReport");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46 <= objc_msgSend(v35, "txDelayAvg"))
            {
              objc_msgSend(v16, "threadNetworkStatusReport");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v36, "txDelayAvg");

            }
            ++v47;

          }
        }

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v54);
    if (v12)
    {
      v37 = v12;
      if (v47)
        v38 = v8 / v47;
      else
        v38 = v46;
      v39 = [HMDHouseholdThreadNetworkStabilityLogEvent alloc];
      v40 = -[HMDThreadNetworkStatusReport initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:]([HMDThreadNetworkStatusReport alloc], "initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:", v48, v49, v50, v51, v52, v7, v55, v38, v9, v10, v11);
      v6 = v44;
      v41 = -[HMDHouseholdThreadNetworkStabilityLogEvent initWithHomeUUID:numStabilityReporters:threadNetworkStatusReport:threadNetworkUptime:threadNetworkDowntime:numReadWrites:numReadErrors:numWriteErrors:numSessionErrors:](v39, "initWithHomeUUID:numStabilityReporters:threadNetworkStatusReport:threadNetworkUptime:threadNetworkDowntime:numReadWrites:numReadErrors:numWriteErrors:numSessionErrors:", v44, v37, v40, v59, v60, v61, v58, v57, v56);
      v66 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42 = (void *)MEMORY[0x1E0C9AA60];
      v6 = v44;
    }
  }
  else
  {
    v42 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v42;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHouseholdThreadNetworkStabilityLogEventFactory threadNetworkObserver](self, "threadNetworkObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCountersBeforeDate:", v4);

}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHouseholdThreadNetworkStabilityLogEventFactory threadNetworkObserver](self, "threadNetworkObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCountersAfterDate:", v4);

}

- (HMDThreadNetworkObserver)threadNetworkObserver
{
  return self->_threadNetworkObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadNetworkObserver, 0);
}

@end
