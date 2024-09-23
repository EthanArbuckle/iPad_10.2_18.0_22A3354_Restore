@implementation MTMetricsUtils

- (id)metricsBuyParamsStringWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 callerSuppliedBuyParams:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  MTMetricsUtils *v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MTObject metricsKit](self, "metricsKit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "config");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke;
  v23[3] = &unk_24C7A1868;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = self;
  v28 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v16, "thenWithBlock:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke(id *a1)
{
  MTCallerSuppliedFields *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  MTCallerSuppliedFields *v12;
  void *v13;
  _QWORD v15[5];
  MTCallerSuppliedFields *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v2 = -[MTCallerSuppliedFields initWithPageId:pageType:pageContext:eventData:]([MTCallerSuppliedFields alloc], "initWithPageId:pageType:pageContext:eventData:", a1[4], a1[5], a1[6], 0);
  objc_msgSend(a1[7], "metricsKit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pageHistory:", v2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke_2;
  v15[3] = &unk_24C7A1840;
  v15[4] = a1[7];
  v16 = v2;
  v17 = a1[4];
  v18 = a1[5];
  v19 = a1[6];
  v20 = a1[8];
  v12 = v2;
  objc_msgSend(v11, "thenWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v50;
  uint64_t v51;
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
  _QWORD v65[16];
  _QWORD v66[18];

  v66[16] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v62 = v3;
  if (v4 > 1)
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4 - 2);
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v65[0] = CFSTR("mtApp");
  objc_msgSend(v7, "app:", *(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v8;
  v66[0] = v8;
  v65[1] = CFSTR("mtEventTime");
  objc_msgSend(MEMORY[0x24BDBCE60], "mt_millisecondsSince1970");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v59;
  v65[2] = CFSTR("mtHardwareFamily");
  objc_msgSend(v7, "hardwareFamily:", *(_QWORD *)(a1 + 40));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v10;
  v66[2] = v10;
  v65[3] = CFSTR("mtHardwareModel");
  objc_msgSend(v7, "hardwareModel:", *(_QWORD *)(a1 + 40));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v12;
  v66[3] = v12;
  v65[4] = CFSTR("mtHostApp");
  objc_msgSend(v7, "hostApp:", *(_QWORD *)(a1 + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v14;
  v66[4] = v14;
  v65[5] = CFSTR("mtHostAppVersion");
  objc_msgSend(v7, "hostAppVersion:", *(_QWORD *)(a1 + 40));
  v16 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v16;
  v66[5] = v16;
  v65[6] = CFSTR("mtOs");
  objc_msgSend(v7, "os:", *(_QWORD *)(a1 + 40));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v57 = v13;
  v45 = (void *)v17;
  v66[6] = v17;
  v65[7] = CFSTR("mtOsBuildNumber");
  objc_msgSend(v7, "osBuildNumber:", *(_QWORD *)(a1 + 40));
  v19 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v19;
  v66[7] = v19;
  v65[8] = CFSTR("mtOsVersion");
  objc_msgSend(v7, "osVersion:", *(_QWORD *)(a1 + 40));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v56 = v15;
  v43 = (void *)v20;
  v66[8] = v20;
  v65[9] = CFSTR("mtPageId");
  v22 = *(_QWORD *)(a1 + 48);
  v51 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v22;
  v66[9] = v22;
  v65[10] = CFSTR("mtPageType");
  v23 = *(_QWORD *)(a1 + 56);
  v24 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v54 = v18;
  v58 = v11;
  v60 = v9;
  v41 = (void *)v24;
  v66[10] = v24;
  v65[11] = CFSTR("mtPageContext");
  v25 = *(_QWORD *)(a1 + 64);
  v26 = v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v26;
  v66[11] = v26;
  v65[12] = CFSTR("mtTopic");
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topic");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  v30 = CFSTR("xp_its_main");
  if (v28)
    v30 = (const __CFString *)v28;
  v66[12] = v30;
  v65[13] = CFSTR("mtRequestId");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[13] = v32;
  v65[14] = CFSTR("mtClientId");
  v61 = v7;
  objc_msgSend(v7, "clientId:", *(_QWORD *)(a1 + 40));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v65[15] = CFSTR("mtPrevPage");
  v66[14] = v34;
  v66[15] = v63;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 16);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)

  if (!v25)
  if (!v23)

  if (!v51)
  if (!v21)

  if (!v53)
  if (!v54)

  if (!v55)
  if (!v56)

  if (!v57)
  if (!v58)

  if (!v60)
  v64 = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 72));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithComposition:](MTPromise, "promiseWithComposition:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "thenWithBlock:", &__block_literal_global_16);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

id __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  +[MTReflectUtil mergeAndCleanDictionaries:](MTReflectUtil, "mergeAndCleanDictionaries:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1808], "mt_queryParameterStringForDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
