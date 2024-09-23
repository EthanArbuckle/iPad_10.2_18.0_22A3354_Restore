@implementation AMSMetricsLoadURLEvent

AMSMetricsLoadURLEvent *__57__AMSMetricsLoadURLEvent_loadURLEventPromiseWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSMetricsLoadURLEvent loadURLEventWithTopic:context:](AMSMetricsLoadURLEvent, "loadURLEventWithTopic:context:", a2, *(_QWORD *)(a1 + 32));
}

- (void)setMetricsOverlay:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSDictionary *metricsOverlay;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  AMSMetricsLoadURLEvent *v19;
  NSDictionary *v20;
  NSDictionary *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  AMSMetricsLoadURLEvent *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "allKeys"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    metricsOverlay = self->_metricsOverlay;
    self->_metricsOverlay = 0;

    goto LABEL_22;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v6);
  objc_msgSend(v9, "objectForKey:", CFSTR("topic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_7:
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("topic"));
    objc_msgSend(v9, "removeObjectForKey:", 0x1E254B6C0);
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      v18 = v17;
      if (v15)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v3);
      }
      else
      {
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
      }
      v19 = (AMSMetricsLoadURLEvent *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing topic from overlay", buf, 0xCu);
      if (v15)
      {

        v19 = (AMSMetricsLoadURLEvent *)v3;
      }

    }
    goto LABEL_17;
  }
  objc_msgSend(v9, "objectForKey:", 0x1E254B6C0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_7;
LABEL_17:
  v20 = (NSDictionary *)objc_msgSend(v9, "copy");
  v21 = self->_metricsOverlay;
  self->_metricsOverlay = v20;

  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    AMSHashIfNeeded(self->_metricsOverlay);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v24;
    _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_INFO, "%{public}@: Adding metrics overlay %{public}@", buf, 0x16u);

  }
  -[AMSMetricsEvent addPropertiesWithDictionary:](self, "addPropertiesWithDictionary:", self->_metricsOverlay);

LABEL_22:
}

- (void)setRadioType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("radioType"));
}

- (void)setRadioTechnology:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("radioTechnology"));
}

- (void)setNetworkQualityReports:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("networkQualityReports"));
}

+ (id)_fetchNetworkQualityReportsPromise
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  +[AMSNetworkQualityInquiry sharedInstance](AMSNetworkQualityInquiry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "investigateNetworks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__AMSMetricsLoadURLEvent__fetchNetworkQualityReportsPromise__block_invoke;
    v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v9[4] = a1;
    objc_msgSend(v5, "addErrorBlock:", v9);
    objc_msgSend(v5, "promiseWithTimeout:", 10.0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(12, CFSTR("Failed to get network quality inquiry singleton"), CFSTR("Network quality inquiry is not available"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)_addSharedURLCacheProperties
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C92C50], "sharedURLCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoadURLEvent setUrlCacheDiskCapacity:](self, "setUrlCacheDiskCapacity:", objc_msgSend(v3, "diskCapacity"));
  -[AMSMetricsLoadURLEvent setUrlCacheMemoryCapacity:](self, "setUrlCacheMemoryCapacity:", objc_msgSend(v3, "memoryCapacity"));
  objc_msgSend(v3, "_maxCacheableEntrySizeRatio");
  -[AMSMetricsLoadURLEvent setUrlCacheMaxCacheableEntrySizeRatio:](self, "setUrlCacheMaxCacheableEntrySizeRatio:");

}

- (void)setUrlCacheMemoryCapacity:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("urlCacheMemoryCapacity"));

}

- (void)setUrlCacheMaxCacheableEntrySizeRatio:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("urlCacheMaxCacheableEntrySizeRatio"));

}

- (void)setUrlCacheDiskCapacity:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("urlCacheDiskCapacity"));

}

+ (id)_propertyValueClassesForKnownProperties
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[51];
  _QWORD v9[52];

  v9[51] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("appleTimingApp");
  v9[0] = objc_opt_class();
  v8[1] = CFSTR("apsRelayAttempted");
  v9[1] = objc_opt_class();
  v8[2] = CFSTR("apsRelayDidFallback");
  v9[2] = objc_opt_class();
  v8[3] = CFSTR("apsRelaySucceeded");
  v9[3] = objc_opt_class();
  v8[4] = CFSTR("cachedResponse");
  v9[4] = objc_opt_class();
  v8[5] = CFSTR("cellularDataBearerTechnology");
  v9[5] = objc_opt_class();
  v8[6] = CFSTR("clientCorrelationKey");
  v9[6] = objc_opt_class();
  v8[7] = CFSTR("clientError");
  v9[7] = objc_opt_class();
  v8[8] = CFSTR("connectionEndTime");
  v9[8] = objc_opt_class();
  v8[9] = CFSTR("connectionInterface");
  v9[9] = objc_opt_class();
  v8[10] = CFSTR("connectionReused");
  v9[10] = objc_opt_class();
  v8[11] = CFSTR("connectionStartNStatRXBytes");
  v9[11] = objc_opt_class();
  v8[12] = CFSTR("connectionStartNStatTXBytes");
  v9[12] = objc_opt_class();
  v8[13] = CFSTR("connectionStartTime");
  v9[13] = objc_opt_class();
  v8[14] = CFSTR("connectionStopNStatRXBytes");
  v9[14] = objc_opt_class();
  v8[15] = CFSTR("connectionStopNStatTXBytes");
  v9[15] = objc_opt_class();
  v8[16] = CFSTR("connectionType");
  v9[16] = objc_opt_class();
  v8[17] = CFSTR("dnsServersIPAddresses");
  v9[17] = objc_opt_class();
  v8[18] = CFSTR("domainLookupEndTime");
  v9[18] = objc_opt_class();
  v8[19] = CFSTR("domainLookupStartTime");
  v9[19] = objc_opt_class();
  v8[20] = CFSTR("edgeNodeCacheStatus");
  v9[20] = objc_opt_class();
  v8[21] = CFSTR("edgeRelayWasUsed");
  v9[21] = objc_opt_class();
  v8[22] = CFSTR("environmentDataCenter");
  v9[22] = objc_opt_class();
  v8[23] = CFSTR("fetchStartTime");
  v9[23] = objc_opt_class();
  v8[24] = CFSTR("networkQualityReports");
  v9[24] = objc_opt_class();
  v8[25] = CFSTR("app");
  v9[25] = objc_opt_class();
  v8[26] = CFSTR("radioTechnology");
  v9[26] = objc_opt_class();
  v8[27] = CFSTR("radioType");
  v9[27] = objc_opt_class();
  v8[28] = CFSTR("redirectCount");
  v9[28] = objc_opt_class();
  v8[29] = CFSTR("redirectEndTime");
  v9[29] = objc_opt_class();
  v8[30] = CFSTR("redirectStartTime");
  v9[30] = objc_opt_class();
  v8[31] = CFSTR("requestMessageSize");
  v9[31] = objc_opt_class();
  v8[32] = CFSTR("requestStartTime");
  v9[32] = objc_opt_class();
  v8[33] = CFSTR("requestUrl");
  v9[33] = objc_opt_class();
  v8[34] = CFSTR("resolvedIPAddress");
  v9[34] = objc_opt_class();
  v8[35] = CFSTR("responseDate");
  v9[35] = objc_opt_class();
  v8[36] = CFSTR("responseEndTime");
  v9[36] = objc_opt_class();
  v8[37] = CFSTR("responseMessageSize");
  v9[37] = objc_opt_class();
  v8[38] = CFSTR("responseMessageSizeUncompressed");
  v9[38] = objc_opt_class();
  v8[39] = CFSTR("responseStartTime");
  v9[39] = objc_opt_class();
  v8[40] = CFSTR("secureConnectionStartTime");
  v9[40] = objc_opt_class();
  v8[41] = CFSTR("statusCode");
  v9[41] = objc_opt_class();
  v8[42] = CFSTR("TFOEnabled");
  v9[42] = objc_opt_class();
  v8[43] = CFSTR("tidState");
  v9[43] = objc_opt_class();
  v8[44] = CFSTR("TLSSessionTickets");
  v9[44] = objc_opt_class();
  v8[45] = CFSTR("wt");
  v9[45] = objc_opt_class();
  v8[46] = CFSTR("xpSessionDuration");
  v9[46] = objc_opt_class();
  v8[47] = CFSTR("xpSamplingForced");
  v9[47] = objc_opt_class();
  v8[48] = CFSTR("xpSamplingPercentageUsers");
  v9[48] = objc_opt_class();
  v8[49] = CFSTR("xpSamplingPercentageCachedResponses");
  v9[49] = objc_opt_class();
  v8[50] = CFSTR("XXDC");
  v9[50] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 51);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSMetricsLoadURLEvent;
  objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
}

+ (id)loadURLEventPromiseWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "loadURLTopicFromContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__AMSMetricsLoadURLEvent_loadURLEventPromiseWithContext___block_invoke;
  v9[3] = &unk_1E253D750;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_prepareEventPromiseWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  AMSMetricsLoadURLEvent *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "metricsDictionaryPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke;
  v12[3] = &unk_1E2543F08;
  v13 = v4;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  objc_msgSend(v6, "addFinishBlock:", v12);

  v9 = v15;
  v10 = v7;

  return v10;
}

void __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
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
  uint64_t v91;
  void *v92;
  NSObject *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  int64_t v108;
  void *v109;
  id v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  id v128;
  id obj;
  uint64_t v130;
  id *v131;
  void *v132;
  _QWORD v133[5];
  id v134;
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint8_t buf[4];
  uint64_t v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  uint64_t v146;
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v122 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("performance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("edgerelay_domains"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v128 = v7;
  else
    v128 = 0;

  objc_msgSend(a1[4], "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(a1[4], "task");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originalRequest");
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "task");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_timingData");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "taskMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transactionMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ams_valueForHTTPHeaderField:", CFSTR("apple-timing-app"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setAppleTimingApp:", v15);

  objc_msgSend(v14, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setApsRelayAttempted:", objc_msgSend(v16, "_apsRelayAttempted"));

  objc_msgSend(v10, "ams_valueForHTTPHeaderField:", CFSTR("x-apple-aps-delivery-type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v17;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v17, "integerValue");
  else
    v18 = 0;
  v123 = v5;
  objc_msgSend(a1[5], "setApsRelayDidFallback:", v18 == 1001);
  objc_msgSend(v14, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setApsRelaySucceeded:", objc_msgSend(v19, "_apsRelaySucceeded"));

  +[AMSMetricsLoadURLEvent _buildVariant](AMSMetricsLoadURLEvent, "_buildVariant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = a1;
  objc_msgSend(a1[5], "setBuildVariant:", v20);

  v125 = v10;
  v130 = objc_msgSend(v10, "statusCode");
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  obj = v14;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v132 = 0;
    v24 = 0;
    v25 = *(_QWORD *)v138;
    while (1)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v138 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
        if (objc_msgSend(v27, "resourceFetchType") == 3)
        {
          v28 = v23;
          +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v29)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v29, "OSLogObject");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v31 = objc_opt_class();
            AMSLogKey();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v142 = v31;
            v143 = 2114;
            v144 = v32;
            _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Received cached response", buf, 0x16u);

          }
          objc_msgSend(v27, "response");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "URL");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "absoluteString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = 1;
        }
        if (v132)
        {
          if (!v23)
            continue;
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_edgeRelayWasUsedFor:domains:", v27, v128);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
            continue;
        }
        objc_msgSend(v27, "response");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "URL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "absoluteString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v23;
        v39 = objc_msgSend(v23, "isEqualToString:", v37);

        if (v39)
        {
          objc_msgSend(v27, "response");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "ams_statusCode");

          v42 = v130;
          if (v41 == 304)
            v42 = 304;
          v130 = v42;
        }
        v23 = v38;
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
      if (!v22)
        goto LABEL_34;
    }
  }
  v23 = 0;
  v132 = 0;
  v24 = 0;
LABEL_34:

  objc_msgSend(v131[5], "setCachedResponse:", v24 & 1);
  objc_msgSend(v131[5], "setEdgeRelayWasUsed:", v132);
  objc_msgSend(obj, "lastObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_dataTransferReport");
  v44 = objc_claimAutoreleasedReturnValue();

  if (v44 && nw_data_transfer_report_get_path_count(v44))
  {
    +[AMSMetricsLoadURLEvent _radioTypeStringValueFromRadioType:](AMSMetricsLoadURLEvent, "_radioTypeStringValueFromRadioType:", nw_data_transfer_report_get_path_radio_type(v44, *MEMORY[0x1E0CCED08]));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131[5], "setCellularDataBearerTechnology:", v45);

  }
  v127 = v44;
  v46 = v125;
  objc_msgSend(v125, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Jingle-Correlation-Key"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v124;
  if (v47)
  {
    objc_msgSend(v131[5], "setClientCorrelationKey:", v47);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "UUIDString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131[5], "setClientCorrelationKey:", v50);

  }
  objc_msgSend(v131[4], "error");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "localizedDescription");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setClientError:", v52);

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectEnd"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v53);
  objc_msgSend(v131[5], "setConnectionEndTime:");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setConnectionInterface:");
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionReused"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setConnectionReused:", objc_msgSend(v54, "BOOLValue"));

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionStartTimeCounts"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataNStatRXBytes"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131[5], "setConnectionStartNStatRXBytes:", objc_msgSend(v57, "unsignedIntegerValue"));

    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataNStatTXBytes"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131[5], "setConnectionStartNStatTXBytes:", objc_msgSend(v58, "unsignedIntegerValue"));

  }
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectStart"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v59);
  objc_msgSend(v131[5], "setConnectionStartTime:");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionStopTimeCounts"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
  {
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataNStatRXBytes"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131[5], "setConnectionStopNStatRXBytes:", objc_msgSend(v62, "unsignedIntegerValue"));

    objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataNStatTXBytes"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131[5], "setConnectionStopNStatTXBytes:", objc_msgSend(v63, "unsignedIntegerValue"));

  }
  objc_msgSend(v124, "valueForHTTPHeaderField:", CFSTR("X-Apple-Connection-Type"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setConnectionType:", v64);

  objc_msgSend(v131[5], "setDNUSubmissionAllowed:", +[AMSMetrics diagnosticsSubmissionAllowed](AMSMetrics, "diagnosticsSubmissionAllowed"));
  +[AMSMetricsLoadURLEvent _DNSServerIPAddresses](AMSMetricsLoadURLEvent, "_DNSServerIPAddresses");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "componentsJoinedByString:", CFSTR(","));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setDNSServers:", v66);

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataDomainLookupEnd"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v67);
  objc_msgSend(v131[5], "setDomainLookupEndTime:");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataDomainLookupStart"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v68);
  objc_msgSend(v131[5], "setDomainLookupStartTime:");

  objc_msgSend(v125, "ams_valueForHTTPHeaderField:", CFSTR("X-CACHE"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setEdgeNodeCacheStatus:", v69);

  objc_msgSend(v125, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Application-Site"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setEnvironmentDataCenter:", v70);

  objc_msgSend(v131[5], "setEventType:", CFSTR("loadUrl"));
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataFetchStart"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v71);
  objc_msgSend(v131[5], "setFetchStartTime:");

  objc_msgSend(obj, "lastObject");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "networkProtocolName");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setNetworkProtocolName:", v73);

  objc_msgSend(v131[4], "processInfo");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bundleIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v56;
  if (v75)
  {
    objc_msgSend(v131[5], "setOriginalApp:", v75);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "bundleIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131[5], "setOriginalApp:", v77);

    v48 = v124;
    v46 = v125;

  }
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRedirectCount"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setRedirectCount:", objc_msgSend(v78, "unsignedIntegerValue"));

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRedirectEnd"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v79);
  objc_msgSend(v131[5], "setRedirectEndTime:");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRedirectStart"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v80);
  objc_msgSend(v131[5], "setRedirectStartTime:");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataTotalBytesSent"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setRequestMessageSize:", objc_msgSend(v81, "unsignedIntegerValue"));

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRequestStart"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v82);
  objc_msgSend(v131[5], "setRequestStartTime:");

  objc_msgSend(v48, "URL");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "absoluteString");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setRequestURL:", v84);

  objc_msgSend(v131[4], "task");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _resolvedIPAddressFromTask:](AMSMetricsLoadURLEvent, "_resolvedIPAddressFromTask:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setResolvedIPAddress:", v86);

  objc_msgSend(v46, "ams_valueForHTTPHeaderField:", CFSTR("Date"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setResponseDate:", v87);

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseEnd"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v88);
  objc_msgSend(v131[5], "setResponseEndTime:");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataTotalBytesReceived"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setResponseMessageSize:", objc_msgSend(v89, "unsignedIntegerValue"));

  objc_msgSend(obj, "lastObject");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "countOfResponseBodyBytesAfterDecoding");

  if (v91 < 0)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v92)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v92, "OSLogObject", v118);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = (void *)objc_opt_class();
      v95 = v94;
      AMSLogKey();
      v96 = v23;
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v142 = (uint64_t)v94;
      v143 = 2114;
      v144 = v97;
      v145 = 2048;
      v146 = v91;
      _os_log_impl(&dword_18C849000, v93, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] countOfResponseBodyBytesAfterDecoding in metrics doesn't fit in NSUInteger bounds. It will be ignored. The provided metrics are probably malformed. size = %lld", buf, 0x20u);

      v23 = v96;
    }

    v48 = v124;
    v46 = v125;
  }
  else
  {
    objc_msgSend(v131[5], "setResponseMessageSizeUncompressed:", v91);
  }
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseStart"), v118);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v98);
  objc_msgSend(v131[5], "setResponseStartTime:");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataSecureConnectionStart"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:](AMSMetricsLoadURLEvent, "_timingDataMetricToServerTimeInterval:", v99);
  objc_msgSend(v131[5], "setSecureConnectionStartTime:");

  objc_msgSend(v131[5], "setStatusCode:", v130);
  objc_msgSend(v131[4], "session");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "configuration");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setTFOEnabled:", objc_msgSend(v101, "_allowsTCPFastOpen"));

  objc_msgSend(v48, "valueForHTTPHeaderField:", CFSTR("X-Apple-TID-State"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setTIDState:", v102);

  objc_msgSend(v131[4], "session");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "configuration");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setTLSSessionTickets:", objc_msgSend(v104, "_allowsTLSSessionTickets"));

  objc_msgSend(v131[5], "_addSharedURLCacheProperties");
  if (v123)
  {
    objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("performance"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v106 = v105;
    else
      v106 = 0;

    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("sessionDuration"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "doubleValue");
    objc_msgSend(v131[5], "setXpSessionDuration:");

    v108 = +[AMSDefaults forceLoadUrlMetrics](AMSDefaults, "forceLoadUrlMetrics");
    if (v108 == 2)
    {
      objc_msgSend(v131[5], "setXpSamplingPercentageUsers:", 0.0);
      v110 = v131[5];
      v111 = 0.0;
    }
    else
    {
      if (v108 != 1)
      {
        if (!v108)
        {
          if (+[AMSMetricsLoadURLEvent isPerHostLoadURLSamplingEnabled:](AMSMetricsLoadURLEvent, "isPerHostLoadURLSamplingEnabled:", v123))
          {
            objc_msgSend(v131[4], "task");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSMetricsLoadURLEvent _samplingPercentageForURLSessionTask:performanceDictionary:](AMSMetricsLoadURLEvent, "_samplingPercentageForURLSessionTask:performanceDictionary:", v109, v106);
          }
          else
          {
            objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("samplingPercentageUsers"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "doubleValue");
          }
          objc_msgSend(v131[5], "setXpSamplingPercentageUsers:");

          objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("samplingPercentageCachedResponses"));
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "doubleValue");
          objc_msgSend(v131[5], "setXpSamplingPercentageCachedResponses:");

        }
        goto LABEL_68;
      }
      objc_msgSend(v131[5], "setXpSamplingForced:", 1);
      objc_msgSend(v131[5], "setXpSamplingPercentageUsers:", 1.0);
      v110 = v131[5];
      v111 = 1.0;
    }
    objc_msgSend(v110, "setXpSamplingPercentageCachedResponses:", v111);
LABEL_68:

  }
  objc_msgSend(v46, "ams_valueForHTTPHeaderField:", CFSTR("wt"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setWt:", v113);

  objc_msgSend(v46, "ams_valueForHTTPHeaderField:", CFSTR("X-XDC"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131[5], "setXxdc:", v114);

  +[AMSMetricsLoadURLEvent _fetchNetworkQualityReportsPromise](AMSMetricsLoadURLEvent, "_fetchNetworkQualityReportsPromise");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke_284;
  v133[3] = &unk_1E2543EE0;
  v116 = v131[4];
  v133[4] = v131[5];
  v134 = v126;
  v135 = v116;
  v136 = v131[6];
  v117 = v126;
  objc_msgSend(v115, "addFinishBlock:", v133);

}

+ (double)_timingDataMetricToServerTimeInterval:(id)a3
{
  double v3;
  double v4;
  double result;

  objc_msgSend(a3, "doubleValue");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    if (qword_1ECEAD728 != -1)
      dispatch_once(&qword_1ECEAD728, &__block_literal_global_93);
    return v4 + *(double *)&_MergedGlobals_131;
  }
  return result;
}

+ (double)_samplingPercentageForURLSessionTask:(id)a3 performanceDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  char isKindOfClass;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("samplingPercentageUsers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = a1;
      v45 = 2114;
      v46 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch fallback sampling percentage value from performance metrics dictionary, will use %{public}@", buf, 0x16u);

    }
    v10 = 0.0;
  }
  objc_msgSend(v7, "originalRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("samplingPercentagePerHost"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v20, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = a1;
        v45 = 2114;
        v46 = v31;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch per-host sampling percentage values from performance metrics dictionary, falling back to global sampling percentage value of %{public}@", buf, 0x16u);

      }
      goto LABEL_35;
    }
    objc_msgSend(v18, "objectForKeyedSubscript:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v19;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if ((isKindOfClass & 1) != 0)
      {
        if (!v22)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v23 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v23, "OSLogObject");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          AMSHashIfNeeded(v17);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = a1;
          v45 = 2114;
          v46 = v41;
          v47 = 2114;
          v48 = v26;
          _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_INFO, "%{public}@: Found per-host sampling percentage value in per-host dictionary for %{public}@: %{public}@. Using that", buf, 0x20u);

        }
        -[NSObject doubleValue](v20, "doubleValue");
        v10 = v27;
        goto LABEL_36;
      }
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v23, "OSLogObject");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        AMSHashIfNeeded(v17);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = a1;
        v45 = 2114;
        v46 = v42;
        v47 = 2114;
        v48 = v39;
        _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected type for per-host sampling percentage value in per-host dictionary for %{public}@, falling back to global sampling percentage value of %{public}@", buf, 0x20u);

      }
LABEL_35:

      goto LABEL_36;
    }
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      AMSHashIfNeeded(v17);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = a1;
      v45 = 2114;
      v46 = v34;
      v47 = 2114;
      v48 = v36;
      _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_INFO, "%{public}@: No per-host sampling percentage value in per-host dictionary for %{public}@, falling back to global sampling percentage value of %{public}@", buf, 0x20u);

    }
    v20 = 0;
  }
  else
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = a1;
      v45 = 2114;
      v46 = v29;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve original request's hostname from url session task, falling back to global sampling percentage value of %{public}@", buf, 0x16u);

    }
  }
LABEL_36:

  return v10;
}

+ (id)shouldCollectMetricsPromiseForContext:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = +[AMSDefaults forceLoadUrlMetrics](AMSDefaults, "forceLoadUrlMetrics");
  if (v5 == 2)
  {
    v6 = MEMORY[0x1E0C9AAA0];
  }
  else
  {
    if (v5 != 1)
    {
      objc_msgSend(v4, "metricsDictionaryPromise");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__AMSMetricsLoadURLEvent_shouldCollectMetricsPromiseForContext___block_invoke;
      v10[3] = &unk_1E25430A0;
      v12 = a1;
      v11 = v4;
      objc_msgSend(v8, "thenWithBlock:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v6 = MEMORY[0x1E0C9AAB0];
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

+ (BOOL)isPerHostLoadURLSamplingEnabled:(id)a3
{
  return objc_msgSend(a1, "isPerHostLoadURLSamplingEnabled:perHostSamplingSuppressed:featureFlagEnabled:", a3, 0, 0);
}

- (void)setXxdc:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("XXDC"));
}

- (void)setXpSessionDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSessionDuration"));

}

- (void)setXpSamplingPercentageUsers:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingPercentageUsers"));

}

- (void)setXpSamplingPercentageCachedResponses:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingPercentageCachedResponses"));

}

- (void)setWt:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("wt"));
}

- (void)setTLSSessionTickets:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("TLSSessionTickets"));

}

- (void)setTIDState:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("tidState"));
}

- (void)setTFOEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("TFOEnabled"));

}

- (void)setStatusCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("statusCode"));

}

- (void)setSecureConnectionStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("secureConnectionStartTime"));

}

- (void)setResponseStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseStartTime"));

}

- (void)setResponseMessageSizeUncompressed:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseMessageSizeUncompressed"));

}

- (void)setResponseMessageSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseMessageSize"));

}

- (void)setResponseEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseEndTime"));

}

- (void)setResponseDate:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("responseDate"));
}

- (void)setRequestMessageSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("requestMessageSize"));

}

- (void)setRedirectStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("redirectStartTime"));

}

- (void)setRedirectEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("redirectEndTime"));

}

- (void)setRedirectCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("redirectCount"));

}

- (void)setOriginalApp:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("app"));
}

- (void)setNetworkProtocolName:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("networkProtocolName"));
}

- (void)setFetchStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("fetchStartTime"));

}

- (void)setEnvironmentDataCenter:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("environmentDataCenter"));
}

- (void)setEdgeNodeCacheStatus:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("edgeNodeCacheStatus"));
}

- (void)setDomainLookupStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("domainLookupStartTime"));

}

- (void)setDomainLookupEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("domainLookupEndTime"));

}

- (void)setDNUSubmissionAllowed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("DNUSubmissionAllowed"));

}

- (void)setDNSServers:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("dnsServersIPAddresses"));
}

- (void)setConnectionType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("connectionType"));
}

- (void)setConnectionStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStartTime"));

}

- (void)setConnectionReused:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionReused"));

}

- (void)setConnectionInterface:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("connectionInterface"));
}

- (void)setConnectionEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionEndTime"));

}

- (void)setClientError:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientError"));
}

- (void)setClientCorrelationKey:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientCorrelationKey"));
}

- (void)setCachedResponse:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("cachedResponse"));

}

- (void)setBuildVariant:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("buildVariant"));
}

- (void)setApsRelaySucceeded:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("apsRelaySucceeded"));

}

- (void)setApsRelayDidFallback:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("apsRelayDidFallback"));

}

- (void)setApsRelayAttempted:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("apsRelayAttempted"));

}

- (void)setAppleTimingApp:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("appleTimingApp"));
}

+ (id)_DNSServerIPAddresses
{
  id v2;
  __res_9_state *v3;
  res_9_sockaddr_union *v4;
  unint64_t v5;
  char *v6;
  int v7;
  int v8;
  char *v9;
  socklen_t v10;
  void *v11;
  void *v12;
  id v13;
  char v15[46];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (__res_9_state *)malloc_type_calloc(1uLL, 0x228uLL, 0x10B20402089BC1DuLL);
  if (!res_9_ninit(v3))
  {
    v4 = (res_9_sockaddr_union *)malloc_type_malloc((uint64_t)v3->nscount << 7, 0x1000040AE2C30F4uLL);
    res_9_getservers(v3, v4, v3->nscount);
    if (v3->nscount)
    {
      v5 = 0;
      v6 = &v4->__space[4];
      while (1)
      {
        v7 = *(v6 - 3);
        if (v7 == 30)
          break;
        if (v7 == 2)
        {
          v8 = 2;
          v9 = v6;
          v10 = 16;
          goto LABEL_8;
        }
LABEL_10:
        ++v5;
        v6 += 128;
        if (v5 >= v3->nscount)
          goto LABEL_11;
      }
      v9 = v6 + 4;
      v8 = 30;
      v10 = 46;
LABEL_8:
      inet_ntop(v8, v9, v15, v10);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v2, "addObject:", v11);

      }
      goto LABEL_10;
    }
LABEL_11:
    free(v4);
  }
  res_9_ndestroy(v3);
  free(v3);
  if (objc_msgSend(v2, "count"))
    v12 = v2;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (void)setResolvedIPAddress:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("resolvedIPAddress"));
}

- (void)setRequestURL:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("requestUrl"));
}

- (void)setRequestStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("requestStartTime"));

}

- (void)setCellularDataBearerTechnology:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("cellularDataBearerTechnology"));
}

+ (id)_radioTypeStringValueFromRadioType:(int)a3
{
  __CFString *v3;
  id result;

  switch(a3)
  {
    case 128:
      v3 = CFSTR("cell_lte");
LABEL_3:
      result = v3;
      break;
    case 129:
      result = CFSTR("cell_endc_sub6");
      break;
    case 130:
      result = CFSTR("cell_endc_mmw");
      break;
    case 131:
      result = CFSTR("cell_nr_sa_sub6");
      break;
    case 132:
      result = CFSTR("cell_nr_sa_mmw");
      break;
    case 133:
      result = CFSTR("cell_wcdma");
      break;
    case 134:
      result = CFSTR("cell_gsm");
      break;
    case 135:
      result = CFSTR("cell_cdma");
      break;
    case 136:
      result = CFSTR("cell_evdo");
      break;
    default:
      v3 = CFSTR("unknown");
      switch(a3)
      {
        case 0:
          goto LABEL_3;
        case 1:
          result = CFSTR("wifi_b");
          break;
        case 2:
          result = CFSTR("wifi_a");
          break;
        case 3:
          result = CFSTR("wifi_g");
          break;
        case 4:
          result = CFSTR("wifi_n");
          break;
        case 5:
          result = CFSTR("wifi_ac");
          break;
        case 6:
          result = CFSTR("wifi_ax");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
      }
      break;
  }
  return result;
}

id __64__AMSMetricsLoadURLEvent_shouldCollectMetricsPromiseForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  uint64_t v38;
  void *v39;
  double v40;
  void *v41;
  __int16 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("performance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v45 = (id)objc_opt_class();
      v18 = v45;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch performance metrics from bag", buf, 0xCu);

    }
    v15 = MEMORY[0x1E0C9AAA0];
    goto LABEL_14;
  }
  v43 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 40), "isPerHostLoadURLSamplingEnabled:perHostSamplingSuppressed:featureFlagEnabled:", v3, (char *)&v43 + 1, &v43);
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_opt_class();
      v22 = CFSTR("true");
      if (HIBYTE(v43))
        v23 = CFSTR("true");
      else
        v23 = CFSTR("false");
      *(_DWORD *)buf = 138543874;
      v45 = v21;
      if (!(_BYTE)v43)
        v22 = CFSTR("false");
      v46 = 2112;
      v47 = v23;
      v48 = 2112;
      v49 = v22;
      v24 = v21;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_INFO, "%{public}@: Using host-agnostic LoadURL sampling logic, perHostSamplingSuppressed = %@, featureFlagEnabled = %@", buf, 0x20u);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("samplingPercentageUsers"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionDuration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v32);
    v34 = v33;

    +[AMSDefaults metricsTimingWindowStartTime](AMSDefaults, "metricsTimingWindowStartTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dateByAddingTimeInterval:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v31, "compare:", v36) == -1)
    {
      v38 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      +[AMSRandomNumberGenerator normalizedRandomDouble](AMSRandomNumberGenerator, "normalizedRandomDouble");
      if (v37 != 0.0)
      {
        v40 = v37;
        if (v37 <= v27)
          +[AMSDefaults setMetricsTimingWindowStartTime:](AMSDefaults, "setMetricsTimingWindowStartTime:", v31);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40 <= v27);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v41);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_33;
      }
      v38 = MEMORY[0x1E0C9AAA0];
    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v38);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

    goto LABEL_34;
  }
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v45 = v9;
    v10 = v9;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@: Using per-host LoadURL sampling logic", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "task");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsLoadURLEvent _samplingPercentageForURLSessionTask:performanceDictionary:](AMSMetricsLoadURLEvent, "_samplingPercentageForURLSessionTask:performanceDictionary:", v11, v4);
  v13 = v12;

  +[AMSRandomNumberGenerator normalizedRandomDouble](AMSRandomNumberGenerator, "normalizedRandomDouble");
  if (v14 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14 <= v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }
  v15 = MEMORY[0x1E0C9AAA0];
LABEL_14:
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v19;
}

+ (BOOL)isPerHostLoadURLSamplingEnabled:(id)a3 perHostSamplingSuppressed:(BOOL *)a4 featureFlagEnabled:(BOOL *)a5
{
  void *v7;
  id v8;
  char v9;
  char v10;

  objc_msgSend(a3, "ams_objectForKey:defaultValue:", CFSTR("suppressPerHostSampling"), MEMORY[0x1E0C9AAA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v9 = objc_msgSend(v8, "BOOLValue");
  v10 = _os_feature_enabled_impl();
  if (a4)
    *a4 = v9;
  if (a5)
    *a5 = v10;
  return v10 & ~v9;
}

+ (id)_buildVariant
{
  unint64_t v2;

  v2 = +[AMSDevice buildVariant](AMSDevice, "buildVariant");
  if (v2 - 1 > 2)
    return CFSTR("customer");
  else
    return off_1E2543F28[v2 - 1];
}

+ (id)_resolvedIPAddressFromTask:(id)a3
{
  void *v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  socklen_t v8;
  char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_CFURLResponse");

  if (!v4)
    return 0;
  v5 = (const __CFData *)CFURLResponseCopyPeerAddress();
  if (!v5)
    return 0;
  v6 = v5;
  BytePtr = CFDataGetBytePtr(v5);
  v8 = *BytePtr;
  v9 = (char *)v12 - (((_WORD)v8 + 15) & 0x1F0);
  inet_ntop(BytePtr[1], BytePtr + 4, v9, v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v6);
  return v10;
}

void __64__AMSMetricsLoadURLEvent__timingDataMetricToServerTimeInterval___block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v0);
  _MergedGlobals_131 = v1;

}

- (AMSMetricsLoadURLEvent)initWithContext:(id)a3
{
  id v4;
  AMSMetricsLoadURLEvent *v5;
  AMSMetricsLoadURLEvent *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMetricsLoadURLEvent;
  v5 = -[AMSMetricsEvent initWithTopic:](&v9, sel_initWithTopic_, CFSTR("xp_amp_clientperf"));
  v6 = v5;
  if (v5)
  {
    -[AMSMetricsLoadURLEvent _prepareEventPromiseWithContext:](v5, "_prepareEventPromiseWithContext:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "waitUntilFinished");

  }
  return v6;
}

+ (id)loadURLTopicFromContext:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "metricsDictionaryPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AMSMetricsLoadURLEvent_loadURLTopicFromContext___block_invoke;
  v7[3] = &__block_descriptor_40_e46___AMSPromise_24__0__NSDictionary_8__NSError_16l;
  v7[4] = a1;
  objc_msgSend(v4, "continueWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__AMSMetricsLoadURLEvent_loadURLTopicFromContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      v24 = 2114;
      v25 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] error getting load url metrics bag [%{public}@]", (uint8_t *)&v20, 0x20u);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", CFSTR("xp_amp_clientperf"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("performance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("loadUrlTopic"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (-[__CFString length](v13, "length"))
    {
      v14 = v13;
    }
    else
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v17;
        v22 = 2114;
        v23 = v18;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] No loadUrlTopic in metrics bag", (uint8_t *)&v20, 0x16u);

      }
      v14 = CFSTR("xp_amp_clientperf");
    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)loadURLEventWithTopic:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] creating load url event for [%{public}@]", buf, 0x20u);

  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTopic:", v6);
  objc_msgSend(v12, "_prepareEventPromiseWithContext:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "promiseAdapter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__AMSMetricsLoadURLEvent_loadURLEventWithTopic_context___block_invoke;
  v18[3] = &unk_1E253E440;
  v19 = v12;
  v15 = v12;
  objc_msgSend(v14, "thenWithBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

AMSPromise *__56__AMSMetricsLoadURLEvent_loadURLEventWithTopic_context___block_invoke(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

+ (id)_hostnameFrom:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "_establishmentReport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "_establishmentReport");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = nw_establishment_report_copy_proxy_endpoint(v5);

    if (v6 && nw_endpoint_get_type(v6) == nw_endpoint_type_host)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", nw_endpoint_get_hostname(v6), 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_isAnEdgeRelayServer:(id)a3 domains:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      v11 = (void *)MEMORY[0x1E0C9AAB0];
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "isEqualToString:", v5, (_QWORD)v14) & 1) != 0)
          break;
        if (v9 == ++v12)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v11 = 0;
    }

  }
  else if (objc_msgSend(CFSTR("tether.edge.apple"), "isEqualToString:", v5))
  {
    v11 = (void *)MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_edgeRelayWasUsedFor:(id)a3 domains:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isProxyConnection"))
  {
    objc_msgSend(a1, "_hostnameFrom:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_isAnEdgeRelayServer:domains:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke_284(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "setNetworkQualityReports:", v4);
    +[AMSNetworkQualityInquiry reportForTaskTimingData:fromReports:](AMSNetworkQualityInquiry, "reportForTaskTimingData:fromReports:", *(_QWORD *)(a1 + 40), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("interface"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRadioType:", v6);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radioTechnology"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRadioTechnology:", v7);

  }
  objc_msgSend(*(id *)(a1 + 48), "metricsOverlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMetricsOverlay:", v8);

  return objc_msgSend(*(id *)(a1 + 56), "finishWithSuccess");
}

+ (BOOL)shouldCollectMetricsForContext:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "shouldCollectMetricsPromiseForContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (NSString)appleTimingApp
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("appleTimingApp"));
}

- (BOOL)apsRelayAttempted
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("apsRelayAttempted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)apsRelayDidFallback
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("apsRelayDidFallback"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)apsRelaySucceeded
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("apsRelaySucceeded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)buildVariant
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("buildVariant"));
}

- (BOOL)cachedResponse
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("cachedResponse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)cellularDataBearerTechnology
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("cellularDataBearerTechnology"));
}

- (NSString)clientCorrelationKey
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientCorrelationKey"));
}

- (NSString)clientError
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientError"));
}

- (double)connectionEndTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionEndTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (NSString)connectionInterface
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionInterface"));
}

- (BOOL)connectionReused
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionReused"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)connectionStartNStatRXBytes
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStartNStatRXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)connectionStartNStatTXBytes
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStartNStatTXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)connectionStopNStatRXBytes
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStopNStatRXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)connectionStopNStatTXBytes
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStopNStatTXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)connectionStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (NSString)connectionType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionType"));
}

- (NSString)DNSServers
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("dnsServersIPAddresses"));
}

- (BOOL)isDNUSubmissionAllowed
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("DNUSubmissionAllowed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (double)domainLookupEndTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("domainLookupEndTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (double)domainLookupStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("domainLookupStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (NSString)edgeNodeCacheStatus
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("edgeNodeCacheStatus"));
}

- (NSNumber)edgeRelayWasUsed
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("edgeRelayWasUsed"));
}

- (NSString)environmentDataCenter
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("environmentDataCenter"));
}

- (double)fetchStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("fetchStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (NSString)networkProtocolName
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("networkProtocolName"));
}

- (NSArray)networkQualityReports
{
  return (NSArray *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("networkQualityReports"));
}

- (NSString)originalApp
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("app"));
}

- (NSString)radioTechnology
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("radioTechnology"));
}

- (NSString)radioType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("radioType"));
}

- (unint64_t)redirectCount
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("redirectCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)redirectEndTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("redirectEndTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (double)redirectStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("redirectStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (unint64_t)requestMessageSize
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestMessageSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)requestStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (NSString)requestURL
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestUrl"));
}

- (NSString)resolvedIPAddress
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("resolvedIPAddress"));
}

- (NSString)responseDate
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseDate"));
}

- (double)responseEndTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseEndTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (unint64_t)responseMessageSize
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseMessageSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)responseMessageSizeUncompressed
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseMessageSizeUncompressed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)responseStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (double)secureConnectionStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("secureConnectionStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (int64_t)statusCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("statusCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)TFOEnabled
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("TFOEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)TIDState
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("tidState"));
}

- (BOOL)TLSSessionTickets
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("TLSSessionTickets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)urlCacheDiskCapacity
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("urlCacheDiskCapacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)urlCacheMemoryCapacity
{
  void *v2;
  unint64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("urlCacheMemoryCapacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)urlCacheMaxCacheableEntrySizeRatio
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("urlCacheMaxCacheableEntrySizeRatio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSString)wt
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("wt"));
}

- (double)xpSessionDuration
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSessionDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (BOOL)xpSamplingForced
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingForced"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (double)xpSamplingPercentageUsers
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingPercentageUsers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)xpSamplingPercentageCachedResponses
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingPercentageCachedResponses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSString)xxdc
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("XXDC"));
}

- (void)setConnectionStartNStatRXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStartNStatRXBytes"));

}

- (void)setConnectionStartNStatTXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStartNStatTXBytes"));

}

- (void)setConnectionStopNStatRXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStopNStatRXBytes"));

}

- (void)setConnectionStopNStatTXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStopNStatTXBytes"));

}

- (void)setEdgeRelayWasUsed:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("edgeRelayWasUsed"));
}

- (void)setXpSamplingForced:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingForced"));

}

void __60__AMSMetricsLoadURLEvent__fetchNetworkQualityReportsPromise__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSLogableError(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Metrics network inquiry error occurred. Error: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

@end
