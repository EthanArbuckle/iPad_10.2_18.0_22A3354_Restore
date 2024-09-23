@implementation C2ReportMetrics

+ (void)_c2FormatValueForRTC:(id)a3 keyPrefix:(id)a4 targetDictionary:(id)a5 multipleOperationGroups:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  unint64_t v26;
  const __CFString *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  _BOOL4 v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v6 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = 0x1E0C99000uLL;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __91__C2ReportMetrics__c2FormatValueForRTC_keyPrefix_targetDictionary_multipleOperationGroups___block_invoke;
      v49[3] = &unk_1E98986F8;
      v53 = v6;
      v50 = v11;
      v52 = a1;
      v51 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v49);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v10;
        v38 = v14;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("generic_event_metric")))
        {
          v42 = v11;
          v43 = a1;
          v40 = v6;
          v41 = v12;
          v37 = v10;
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v46;
            v19 = CFSTR("key");
            v20 = 0x1E0CB3000uLL;
            v39 = v15;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v46 != v18)
                  objc_enumerationMutation(v15);
                v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v21);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v23 = v22;
                  objc_msgSend(v23, "objectForKeyedSubscript:", v19);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v24)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("value"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v25)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v56 = v24;
                          v57 = v25;
                          objc_msgSend(*(id *)(v13 + 3456), "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
                          v26 = v13;
                          v27 = v19;
                          v28 = v20;
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v43, "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v29, v42, v41, v40);

                          v20 = v28;
                          v19 = v27;
                          v13 = v26;
                          v15 = v39;
                        }
                      }

                    }
                  }

                }
                ++v21;
              }
              while (v17 != v21);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
            }
            while (v17);
          }

          v10 = v37;
          v14 = v38;
          v12 = v41;
          v11 = v42;
        }
        else if (objc_msgSend(v14, "count") == 1)
        {
          objc_msgSend(v14, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v30, v11, v12, v6);

        }
        else
        {
          v31 = objc_msgSend(v14, "count");
          v44 = a1;
          if (v31)
          {
            v32 = v31;
            for (i = 0; i != v32; ++i)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), i);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = v34;
              objc_msgSend(v14, "objectAtIndexedSubscript:", i);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v35;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v36, v11, v12, v6);

              v14 = v38;
            }
          }
        }

      }
      else
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v11);
      }
    }
  }

}

void __91__C2ReportMetrics__c2FormatValueForRTC_keyPrefix_targetDictionary_multipleOperationGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("triggers")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_frequency")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_frequency_base")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("operation_triggered")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_client_operation_frequency")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_client_operation_frequency_base")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("operation_group_triggered")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_operation_group_frequency")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_operation_group_frequency_base")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_transport_allow_expensive_access")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("report_transport_allow_power_nap_scheduling")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("is_apple_internal")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("product_build")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("product_type")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("product_version")) & 1) == 0
    && (*(_BYTE *)(a1 + 56) || (objc_msgSend(v8, "isEqualToString:", CFSTR("operation_group_index")) & 1) == 0))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), *(_QWORD *)(a1 + 32), v8);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v8;
    }
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 48), "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v5, v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

  }
}

+ (void)reportNetworkEvent:(id)a3 triggers:(int)a4 originalSessionTask:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  C2MetricRequestOptions *v10;
  id v11;

  v6 = *(_QWORD *)&a4;
  v11 = a3;
  v7 = a5;
  v8 = (void *)MEMORY[0x1D8269840]();
  objc_msgSend(v7, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[C2MetricRequestOptions initWithRequestOptions:]([C2MetricRequestOptions alloc], "initWithRequestOptions:", v9);
  objc_msgSend((id)objc_opt_class(), "_reportWithOptions:networkEvent:genericEvent:triggers:eventName:startTime:endTime:attributes:", v10, v11, 0, v6, 0, 0, 0, 0);

  objc_autoreleasePoolPop(v8);
}

+ (void)reportMetricWithOptions:(id)a3 genericMetricType:(int64_t)a4 eventName:(id)a5 startTime:(id)a6 endTime:(id)a7 attributes:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = (void *)MEMORY[0x1D8269840]();
  objc_msgSend(v21, "metricOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "generateTriggerWithResponseHeader:", 0);

  +[C2Metric generateGenericEventWithName:genericMetricType:startTime:endTime:attributes:](C2Metric, "generateGenericEventWithName:genericMetricType:startTime:endTime:attributes:", v13, a4, v14, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_reportWithOptions:networkEvent:genericEvent:triggers:eventName:startTime:endTime:attributes:", v21, 0, v20, v19, v13, v14, v15, v16);

  objc_autoreleasePoolPop(v17);
}

+ (id)metricsForMetricRequestOptions:(id)a3 networkEvent:(id)a4 genericEvent:(id)a5 triggers:(int)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  C2MPMetric *v15;
  C2MPMetric *v16;
  void *v17;
  void *v18;
  C2MPMetric *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "metricOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[C2Metric generateDeviceInfo](C2Metric, "generateDeviceInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v19 = 0;
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v12, "generateCloudKitInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v15 = objc_alloc_init(C2MPMetric);
    v16 = v15;
    if (v15)
    {
      -[C2MPMetric setDeviceInfo:](v15, "setDeviceInfo:", v13);
      -[C2MPMetric setCloudkitInfo:](v16, "setCloudkitInfo:", v14);
      -[C2MPMetric setTriggers:](v16, "setTriggers:", a6);
      -[C2MPMetric setReportFrequency:](v16, "setReportFrequency:", objc_msgSend(v12, "reportFrequency"));
      -[C2MPMetric setReportFrequencyBase:](v16, "setReportFrequencyBase:", objc_msgSend(v12, "reportFrequencyBase"));
      -[C2MPMetric setReportTransportAllowExpensiveAccess:](v16, "setReportTransportAllowExpensiveAccess:", objc_msgSend(v9, "_allowsExpensiveAccess") != 0);
      -[C2MPMetric setReportTransportAllowPowerNapScheduling:](v16, "setReportTransportAllowPowerNapScheduling:", objc_msgSend(v9, "_allowsPowerNapScheduling") != 0);
      objc_msgSend(v9, "_sourceApplicationBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPMetric setReportTransportSourceApplicationBundleIdentifier:](v16, "setReportTransportSourceApplicationBundleIdentifier:", v17);

      objc_msgSend(v9, "_sourceApplicationSecondaryIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPMetric setReportTransportSourceApplicationSecondaryIdentifier:](v16, "setReportTransportSourceApplicationSecondaryIdentifier:", v18);

      if (v10 || !v11)
      {
        v19 = 0;
        if (!v10 || v11)
          goto LABEL_16;
        -[C2MPMetric setMetricType:](v16, "setMetricType:", 200);
        -[C2MPMetric setNetworkEvent:](v16, "setNetworkEvent:", v10);
      }
      else
      {
        -[C2MPMetric setMetricType:](v16, "setMetricType:", 201);
        -[C2MPMetric setGenericEvent:](v16, "setGenericEvent:", v11);
      }
      -[C2MPMetric deviceInfo](v16, "deviceInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setProcessUuid:", 0);

      -[C2MPMetric cloudkitInfo](v16, "cloudkitInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setContainerScopedDeviceIdentifier:", 0);

      -[C2MPMetric cloudkitInfo](v16, "cloudkitInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setContainerScopedUserIdentifier:", 0);

      -[C2MPMetric networkEvent](v16, "networkEvent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNetworkConnectionUuid:", 0);

      v19 = v16;
    }
    else
    {
      v19 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

+ (void)_reportWithOptions:(id)a3 networkEvent:(id)a4 genericEvent:(id)a5 triggers:(int)a6 eventName:(id)a7 startTime:(id)a8 endTime:(id)a9 attributes:(id)a10
{
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  unsigned __int16 v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  __int16 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  id CloudTelemetryReporterClass;
  _BOOL8 v52;
  _BOOL8 v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  char v68;
  id v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void (**v83)(_QWORD, _QWORD);
  uint64_t v84;
  __CFString *v85;
  void *v86;
  C2ReportMetrics *v87;
  void *v88;
  void *v89;
  void *v90;
  void (**v91)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v92;
  void *v93;
  void *v94;
  void (**v95)(_QWORD, _QWORD);
  void *v96;
  __int16 v97;
  id v98;
  id v99;
  id v100;
  id v101;
  int v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[5];
  _QWORD v113[5];
  __int128 buf;
  Class (*v115)(uint64_t);
  void *v116;
  uint64_t *v117;
  uint64_t v118;

  v12 = *(_QWORD *)&a6;
  v118 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v98 = a7;
  v101 = a8;
  v100 = a9;
  v99 = a10;
  v103 = v18;
  v104 = v17;
  v102 = v12;
  +[C2ReportMetrics metricsForMetricRequestOptions:networkEvent:genericEvent:triggers:](C2ReportMetrics, "metricsForMetricRequestOptions:networkEvent:genericEvent:triggers:", v16, v17, v18, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "cloudkitInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "operationGroupsCount");

    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = objc_msgSend(v20, "metricType");
    if ((_DWORD)v24)
    {
      if ((_DWORD)v24 == 201)
      {
        v25 = CFSTR("generic_event_type");
      }
      else if ((_DWORD)v24 == 200)
      {
        v25 = CFSTR("network_event_type");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = CFSTR("none_type");
    }
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("metric_type"));

    if (objc_msgSend(v20, "metricType") == 200)
    {
      objc_msgSend(v20, "networkEvent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v27, CFSTR("network_event"), v23, v22 > 1);

      v28 = 1;
LABEL_35:

LABEL_36:
      objc_msgSend(v20, "cloudkitInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "dictionaryRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v47, CFSTR("cloudkit_info"), v23, v22 > 1);

      objc_msgSend(v20, "deviceInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v49, CFSTR("device_info"), v23, v22 > 1);

      if (v28 == 1)
      {
        v50 = CFSTR("Network");
      }
      else
      {
        if (v28 != 2162)
        {
          +[C2ReportMetrics useCloudTelemetryService](C2ReportMetrics, "useCloudTelemetryService");
          goto LABEL_44;
        }
        v50 = CFSTR("Operation");
      }
      if (+[C2ReportMetrics useCloudTelemetryService](C2ReportMetrics, "useCloudTelemetryService"))
      {
        getCloudTelemetryReporterClass();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          CloudTelemetryReporterClass = getCloudTelemetryReporterClass();
          v52 = objc_msgSend(v16, "allowsCellularAccess") != 0;
          v53 = objc_msgSend(v16, "_allowsExpensiveAccess") != 0;
          objc_msgSend(v16, "_sourceApplicationBundleIdentifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CloudTelemetryReporterClass, "reportWithTeamID:eventType:event:allowCellularAccess:allowExpensiveAccess:bundleID:error:", CFSTR("4K9A2JBQ2X"), v50, v23, v52, v53, v54, 0);

        }
        else
        {
          v106 = 0;
          v107 = &v106;
          v108 = 0x2050000000;
          v71 = (void *)getCloudTelemetryClass_softClass;
          v109 = getCloudTelemetryClass_softClass;
          if (!getCloudTelemetryClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v115 = __getCloudTelemetryClass_block_invoke;
            v116 = &unk_1E9898720;
            v117 = &v106;
            __getCloudTelemetryClass_block_invoke((uint64_t)&buf);
            v71 = (void *)v107[3];
          }
          v72 = objc_retainAutorelease(v71);
          _Block_object_dispose(&v106, 8);
          objc_msgSend(v72, "reportWithTeamID:eventName:event:error:", CFSTR("4K9A2JBQ2X"), v50, v23, 0);
        }
LABEL_58:

        goto LABEL_59;
      }
LABEL_44:
      v55 = *MEMORY[0x1E0D83888];
      v112[0] = *MEMORY[0x1E0D83880];
      v112[1] = v55;
      v113[0] = &unk_1E98A5980;
      v113[1] = &unk_1E98A5998;
      v56 = *MEMORY[0x1E0D83870];
      v112[2] = *MEMORY[0x1E0D838A8];
      v112[3] = v56;
      v113[2] = &unk_1E98A5998;
      v113[3] = MEMORY[0x1E0C9AAB0];
      v112[4] = *MEMORY[0x1E0D83878];
      objc_msgSend(v16, "_sourceApplicationBundleIdentifier");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v57;
      v59 = CFSTR("com.apple.cloudd");
      if (v57)
        v59 = (const __CFString *)v57;
      v113[4] = v59;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 5);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = *MEMORY[0x1E0D838B0];
      v111[0] = CFSTR("com.apple.C2ReportMetrics");
      v62 = *MEMORY[0x1E0D838B8];
      v110[0] = v61;
      v110[1] = v62;
      objc_msgSend(v20, "cloudkitInfo");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "container");
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v64;
      if (v64)
        v66 = (const __CFString *)v64;
      else
        v66 = CFSTR("com.apple.C2ReportMetrics");
      v111[1] = v66;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v105 = 0;
      v68 = objc_msgSend(MEMORY[0x1E0D83848], "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v60, v67, v28, 0, v23, &v105);
      v69 = v105;
      if ((v68 & 1) == 0)
      {
        if (C2_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&C2_DEFAULT_LOG_BLOCK, &__block_literal_global_1);
        v70 = C2_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v69;
          _os_log_impl(&dword_1D4DC3000, v70, OS_LOG_TYPE_ERROR, "Publishing metric to RTCReporting encountered error: %@", (uint8_t *)&buf, 0xCu);
        }
      }

      goto LABEL_58;
    }
    if (objc_msgSend(v20, "metricType") != 201)
    {
      v28 = 3;
      goto LABEL_36;
    }
    objc_msgSend(v20, "genericEvent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "type");
    if ((int)v30 > 200)
    {
      if ((_DWORD)v30 == 201)
      {
        v31 = CFSTR("cloudkit_client");
        goto LABEL_23;
      }
      if ((_DWORD)v30 == 301)
      {
        v31 = CFSTR("server");
        goto LABEL_23;
      }
    }
    else
    {
      if (!(_DWORD)v30)
      {
        v31 = CFSTR("none");
        goto LABEL_23;
      }
      if ((_DWORD)v30 == 101)
      {
        v31 = CFSTR("cloudkit");
LABEL_23:
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, CFSTR("generic_event_type"));

        v32 = v98;
        objc_msgSend(v20, "genericEvent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "type");

        if (v34 == 201)
        {
          v35 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v20, "cloudkitInfo");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "container");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@:%@"), v37, v32);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = 6;
        }
        else
        {
          v38 = 2;
          v26 = v32;
        }
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, CFSTR("generic_event_name"));
        v97 = objc_msgSend(v26, "c2UniformlyDistributedIdentifier");
        if (v101)
        {
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v101, CFSTR("generic_event_startTime"));
          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v101, "timeIntervalSince1970");
          objc_msgSend(v39, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v40, CFSTR("generic_event_startTimestampMS"));

        }
        if (v100)
        {
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v100, CFSTR("generic_event_endTime"));
          v41 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v100, "timeIntervalSince1970");
          objc_msgSend(v41, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v42, CFSTR("generic_event_endTimestampMS"));

          if (v101 != v100 && v101 != 0)
          {
            v44 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v100, "timeIntervalSinceDate:", v101);
            objc_msgSend(v44, "numberWithDouble:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v45, CFSTR("generic_event_durationSeconds"));

          }
        }
        v28 = v38 | (16 * v97);
        objc_msgSend(a1, "_c2FormatValueForRTC:keyPrefix:targetDictionary:multipleOperationGroups:", v99, CFSTR("generic_event_key"), v23, v22 > 1);
        goto LABEL_35;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_59:
  if (v102)
  {
    +[C2ReportMetrics requestForMetricRequestOptions:metrics:](C2ReportMetrics, "requestForMetricRequestOptions:metrics:", v16, v20);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "metricOptions");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "container");
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)v76;
    if (v104)
    {
      objc_msgSend(v74, "stringWithFormat:", CFSTR("NetworkEvent %@ %llu"), v76, 100);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 100;
LABEL_76:

      v87 = -[C2ReportMetrics initWithMetricRequest:metricRequestOptions:ignoreRequestThrottle:requestThrottleIdentifier:requestThrottleLimit:]([C2ReportMetrics alloc], "initWithMetricRequest:metricRequestOptions:ignoreRequestThrottle:requestThrottleIdentifier:requestThrottleLimit:", v73, v16, v102 & 1, v78, v79);
      objc_msgSend(v16, "metricOptions");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "testBehavior_reportMetric");
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
      {
        objc_msgSend(v16, "metricOptions");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "testBehavior_reportMetric");
        v91 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, C2ReportMetrics *, void *, void *))v91)[2](v91, v87, v104, v103);

      }
      if (v87)
      {
        -[C2ReportMetrics send](v87, "send");
      }
      else
      {
        objc_msgSend(v16, "metricOptions");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "didCompleteWithError");
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        if (v93)
        {
          objc_msgSend(v16, "metricOptions");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "didCompleteWithError");
          v95 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v95[2](v95, 0);

        }
        objc_msgSend(v16, "metricOptions");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setDidCompleteWithError:", 0);

      }
      goto LABEL_84;
    }
    v84 = objc_msgSend(v103, "type");
    if ((int)v84 > 200)
    {
      if ((_DWORD)v84 == 201)
      {
        v85 = CFSTR("cloudkit_client");
        goto LABEL_75;
      }
      if ((_DWORD)v84 == 301)
      {
        v85 = CFSTR("server");
        goto LABEL_75;
      }
    }
    else
    {
      if (!(_DWORD)v84)
      {
        v85 = CFSTR("none");
        goto LABEL_75;
      }
      if ((_DWORD)v84 == 101)
      {
        v85 = CFSTR("cloudkit");
LABEL_75:
        objc_msgSend(v103, "name");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "stringWithFormat:", CFSTR("GenericEvent %@ %@ %@ %llu"), v77, v85, v86, 5);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = 5;
        goto LABEL_76;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v84);
    v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_75;
  }
  objc_msgSend(v16, "metricOptions");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "didCompleteWithError");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    objc_msgSend(v16, "metricOptions");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "didCompleteWithError");
    v83 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v83[2](v83, 0);

  }
  objc_msgSend(v16, "metricOptions");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setDidCompleteWithError:", 0);
LABEL_84:

}

- (void)send
{
  __assert_rtn("-[C2ReportMetrics send]", "C2ReportMetrics.m", 531, "sOutstandingTaskCountMap");
}

- (C2ReportMetrics)initWithMetricRequest:(id)a3 metricRequestOptions:(id)a4 ignoreRequestThrottle:(BOOL)a5 requestThrottleIdentifier:(id)a6 requestThrottleLimit:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  C2ReportMetrics *v17;
  void *v18;
  void *v19;
  void *v20;
  C2ReportMetrics *v21;
  C2ReportMetrics *v22;
  uint64_t v23;
  C2MetricOptions *metricOptions;
  void *v25;
  unint64_t v27;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = v15;
  v17 = 0;
  if (v13 && v14 && v15)
  {
    objc_msgSend(v14, "metricRequestTransportOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v27 = a7;
      objc_msgSend(v14, "metricUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v28.receiver = self;
        v28.super_class = (Class)C2ReportMetrics;
        v21 = -[C2ReportMetrics init](&v28, sel_init);
        v22 = v21;
        if (v21)
        {
          v21->_ignoreRequestThrottle = a5;
          objc_storeStrong((id *)&v21->_requestThrottleIdentifier, a6);
          v22->_requestThrottleLimit = v27;
          objc_storeStrong((id *)&v22->_metricRequest, a3);
          objc_msgSend(v14, "metricOptions");
          v23 = objc_claimAutoreleasedReturnValue();
          metricOptions = v22->_metricOptions;
          v22->_metricOptions = (C2MetricOptions *)v23;

          -[NSMutableURLRequest setValue:forHTTPHeaderField:](v22->_metricRequest, "setValue:forHTTPHeaderField:", v20, CFSTR("x-apple-request-uuid"));
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MetricRequest-%@"), v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setIdentifier:", v25);

          objc_storeStrong((id *)&v22->_metricsTransportRequestOptions, v18);
        }
        self = v22;
        v17 = self;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  void (**testBehavior_didCompleteWithError)(id, id);
  char *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  testBehavior_didCompleteWithError = (void (**)(id, id))self->_testBehavior_didCompleteWithError;
  if (testBehavior_didCompleteWithError)
    testBehavior_didCompleteWithError[2](testBehavior_didCompleteWithError, v9);
  pthread_mutex_lock(&sOutstandingTaskCountMutex);
  if (!sOutstandingTaskCountMap)
    -[C2ReportMetrics URLSession:task:didCompleteWithError:].cold.1();
  v11 = (char *)NSMapGet((NSMapTable *)sOutstandingTaskCountMap, self->_requestThrottleIdentifier);
  if (!v11)
    -[C2ReportMetrics URLSession:task:didCompleteWithError:].cold.2();
  NSMapInsert((NSMapTable *)sOutstandingTaskCountMap, self->_requestThrottleIdentifier, v11 - 1);
  pthread_mutex_unlock(&sOutstandingTaskCountMutex);
  -[C2MetricOptions didCompleteWithError](self->_metricOptions, "didCompleteWithError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[C2MetricOptions didCompleteWithError](self->_metricOptions, "didCompleteWithError");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v13)[2](v13, v9);

  }
  -[C2MetricOptions setDidCompleteWithError:](self->_metricOptions, "setDidCompleteWithError:", 0);

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, id))a6 + 2))(a6, a5);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testBehavior_didCompleteWithError, 0);
  objc_storeStrong(&self->_testBehavior_tooManyTasksRunning, 0);
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_metricTask, 0);
  objc_storeStrong((id *)&self->_metricsTransportRequestOptions, 0);
  objc_storeStrong((id *)&self->_metricRequest, 0);
  objc_storeStrong((id *)&self->_requestThrottleIdentifier, 0);
}

+ (id)requestForMetricRequestOptions:(id)a3 metrics:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    objc_msgSend(a3, "metricOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "c2MetricsEndpoint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("c2"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v12);
          if (v13)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0D82B98]);
            if (v14)
            {
              objc_msgSend(v6, "writeTo:", v14);
              objc_msgSend(v14, "immutableData");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend((id)objc_opt_class(), "gzipEncode:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
                  objc_msgSend(v13, "setHTTPBody:", v16);
                  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/protobuf"), CFSTR("Content-Type"));
                  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));
                  v7 = v13;
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

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (id)gzipEncode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  z_stream v8;
  _BYTE v9[8192];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  bzero(v9, 0x2000uLL);
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v8, 0, sizeof(v8));
  if (deflateInit2_(&v8, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    v5 = 0;
  }
  else
  {
    v6 = v3;
    v8.avail_in = objc_msgSend(v6, "length", objc_msgSend(v6, "bytes"));
    do
    {
      v8.avail_out = 0x2000;
      v8.next_out = v9;
      if (deflate(&v8, 4) == -2)
        +[C2ReportMetrics gzipEncode:].cold.1();
      objc_msgSend(v4, "appendBytes:length:", v9, 0x2000 - v8.avail_out);
    }
    while (!v8.avail_out);
    if (v8.avail_in)
      +[C2ReportMetrics gzipEncode:].cold.2();
    deflateEnd(&v8);
    v5 = v4;

  }
  return v5;
}

+ (id)gzipDecode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  z_stream v8;
  _BYTE v9[8192];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  bzero(v9, 0x2000uLL);
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v8, 0, sizeof(v8));
  if (inflateInit2_(&v8, 31, "1.2.12", 112))
  {
    v5 = 0;
  }
  else
  {
    v6 = v3;
    v8.avail_in = objc_msgSend(v6, "length", objc_msgSend(v6, "bytes"));
    do
    {
      v8.avail_out = 0x2000;
      v8.next_out = v9;
      if (inflate(&v8, 4) == -2)
        +[C2ReportMetrics gzipDecode:].cold.1();
      objc_msgSend(v4, "appendBytes:length:", v9, 0x2000 - v8.avail_out);
    }
    while (!v8.avail_out);
    if (v8.avail_in)
      +[C2ReportMetrics gzipDecode:].cold.2();
    inflateEnd(&v8);
    v5 = v4;

  }
  return v5;
}

+ (BOOL)useCloudTelemetryService
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = MGGetProductType() != 3348380076;
  return v2;
}

void __112__C2ReportMetrics__reportWithOptions_networkEvent_genericEvent_triggers_eventName_startTime_endTime_attributes___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL;
  C2_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __23__C2ReportMetrics_send__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL;
  C2_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2ReportMetrics.m"), 555, CFSTR("Unexpected callback."));

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2ReportMetrics.m"), 592, CFSTR("Unexpected callback."));

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, id))a7 + 2))(a7, a6);
}

- (BOOL)ignoreRequestThrottle
{
  return self->_ignoreRequestThrottle;
}

- (void)setIgnoreRequestThrottle:(BOOL)a3
{
  self->_ignoreRequestThrottle = a3;
}

- (NSString)requestThrottleIdentifier
{
  return self->_requestThrottleIdentifier;
}

- (void)setRequestThrottleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestThrottleIdentifier, a3);
}

- (unint64_t)requestThrottleLimit
{
  return self->_requestThrottleLimit;
}

- (void)setRequestThrottleLimit:(unint64_t)a3
{
  self->_requestThrottleLimit = a3;
}

- (NSMutableURLRequest)metricRequest
{
  return self->_metricRequest;
}

- (void)setMetricRequest:(id)a3
{
  objc_storeStrong((id *)&self->_metricRequest, a3);
}

- (C2RequestOptions)metricsTransportRequestOptions
{
  return self->_metricsTransportRequestOptions;
}

- (void)setMetricsTransportRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_metricsTransportRequestOptions, a3);
}

- (NSURLSessionTask)metricTask
{
  return self->_metricTask;
}

- (void)setMetricTask:(id)a3
{
  objc_storeStrong((id *)&self->_metricTask, a3);
}

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (void)setMetricOptions:(id)a3
{
  objc_storeStrong((id *)&self->_metricOptions, a3);
}

- (id)testBehavior_tooManyTasksRunning
{
  return self->_testBehavior_tooManyTasksRunning;
}

- (void)setTestBehavior_tooManyTasksRunning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)testBehavior_didCompleteWithError
{
  return self->_testBehavior_didCompleteWithError;
}

- (void)setTestBehavior_didCompleteWithError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

+ (void)gzipEncode:.cold.1()
{
  __assert_rtn("+[C2ReportMetrics gzipEncode:]", "C2ReportMetrics.m", 209, "ret != Z_STREAM_ERROR");
}

+ (void)gzipEncode:.cold.2()
{
  __assert_rtn("+[C2ReportMetrics gzipEncode:]", "C2ReportMetrics.m", 213, "_zlibStream.avail_in == 0");
}

+ (void)gzipDecode:.cold.1()
{
  __assert_rtn("+[C2ReportMetrics gzipDecode:]", "C2ReportMetrics.m", 243, "ret != Z_STREAM_ERROR");
}

+ (void)gzipDecode:.cold.2()
{
  __assert_rtn("+[C2ReportMetrics gzipDecode:]", "C2ReportMetrics.m", 247, "_zlibStream.avail_in == 0");
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  __assert_rtn("-[C2ReportMetrics URLSession:task:didCompleteWithError:]", "C2ReportMetrics.m", 577, "sOutstandingTaskCountMap");
}

- (void)URLSession:task:didCompleteWithError:.cold.2()
{
  __assert_rtn("-[C2ReportMetrics URLSession:task:didCompleteWithError:]", "C2ReportMetrics.m", 579, "outstandingTaskCountForThrottleIdentifier > 0");
}

@end
