@implementation MTConstraintTreatmentFilter

- (id)apply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTObject metricsKit](self, "metricsKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v13[0] = v4;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __37__MTConstraintTreatmentFilter_apply___block_invoke;
    v12[3] = &unk_24C7A0240;
    v12[4] = self;
    objc_msgSend(v9, "thenWithBlock:", v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

void __37__MTConstraintTreatmentFilter_apply___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("treatmentProfiles"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "metricsKit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configValueForKeyPath:sources:", CFSTR("defaultTreatmentProfiles"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || !v9)
  {
    objc_msgSend(a1[6], "finishWithResult:", v2);
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    MTMetricsKitOSLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[5], "metricsKit");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topic");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = v20;
      _os_log_impl(&dword_20D758000, v18, OS_LOG_TYPE_ERROR, "MetricsKit: Configuration for treatment profiles is not valid for topic %@", buf, 0xCu);

    }
    MTError(303, CFSTR("Configuration for treatment profiles is not valid"), v21, v22, v23, v24, v25, v26, v47);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "finishWithError:", v10);
    goto LABEL_19;
  }
  objc_msgSend(v6, "objectsForKeys:notFoundMarker:", v9, MEMORY[0x24BDBD1B8]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (!v11)
    goto LABEL_14;
  v12 = v11;
  v13 = *(_QWORD *)v50;
  obj = v10;
  while (2)
  {
    v14 = 0;
    v15 = v2;
    do
    {
      if (*(_QWORD *)v50 != v13)
        objc_enumerationMutation(obj);
      +[MTTreatmentProfile treatmentProfileWithConfigData:](MTTreatmentProfile, "treatmentProfileWithConfigData:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
      {
        MTMetricsKitOSLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(a1[5], "metricsKit");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "topic");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = v29;
          _os_log_impl(&dword_20D758000, v27, OS_LOG_TYPE_ERROR, "MetricsKit: A treatment profile configuration is not valid for topic %@", buf, 0xCu);

        }
        MTError(303, CFSTR("A treatment profile configuration is not valid"), v30, v31, v32, v33, v34, v35, v47);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      objc_msgSend(v16, "performTreatments:", v15);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v2)
      {
        MTMetricsKitOSLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(0, "objectForKeyedSubscript:", CFSTR("eventType"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "metricsKit");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "topic");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = v38;
          v55 = 2112;
          v56 = v40;
          _os_log_impl(&dword_20D758000, v37, OS_LOG_TYPE_DEBUG, "MetricsKit: Event %@ in topic %@ has been denylisted by one of the configured treatments", buf, 0x16u);

        }
        MTError(304, CFSTR("The event has been denylisted by one of the configured treatments"), v41, v42, v43, v44, v45, v46, v47);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
LABEL_27:
        v10 = obj;
        objc_msgSend(a1[6], "finishWithError:", v36);

        v2 = v15;
        goto LABEL_19;
      }

      ++v14;
      v15 = v2;
    }
    while (v12 != v14);
    v10 = obj;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v12)
      continue;
    break;
  }
LABEL_14:

  objc_msgSend(a1[6], "finishWithResult:", v2);
LABEL_19:

LABEL_20:
}

id __37__MTConstraintTreatmentFilter_apply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)objc_opt_new();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__MTConstraintTreatmentFilter_apply___block_invoke_2;
  block[3] = &unk_24C7A08F8;
  v8 = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  v10 = v3;
  dispatch_async(v6, block);
  v11 = v17;
  v12 = v9;

  return v12;
}

@end
