@implementation NAUAnalyticsEnvelopeTracker

+ (void)registerEnvelopeCreationAnticipatedForContentType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v3 = *(_QWORD *)&a3;
  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3 >= 9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeCreationAnticipatedForContentType:].cold.1();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_registerContentTypes:withEventName:", v6, CFSTR("anticipated"));

}

+ (void)registerEnvelopesAsCreated:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsCreated:].cold.2();
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_4)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsCreated:].cold.1();
  }
  objc_msgSend(a1, "_registerEnvelopes:withEventName:", v4, CFSTR("created"));

}

BOOL __58__NAUAnalyticsEnvelopeTracker_registerEnvelopesAsCreated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentType") > 8;
}

+ (void)registerEnvelopesAsSubmittedToUploader:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsSubmittedToUploader:].cold.2();
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_16)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsSubmittedToUploader:].cold.1();
  }
  objc_msgSend(a1, "_registerEnvelopes:withEventName:", v4, CFSTR("submitted"));

}

BOOL __70__NAUAnalyticsEnvelopeTracker_registerEnvelopesAsSubmittedToUploader___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentType") > 8;
}

+ (void)registerEnvelopesAsReceivedByUploader:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsReceivedByUploader:].cold.2();
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_19)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopesAsReceivedByUploader:].cold.1();
  }
  objc_msgSend(a1, "_registerEnvelopes:withEventName:", v4, CFSTR("received"));

}

BOOL __69__NAUAnalyticsEnvelopeTracker_registerEnvelopesAsReceivedByUploader___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentType") > 8;
}

+ (void)registerEnvelopeContentTypesAsPreparedForUpload:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsPreparedForUpload:].cold.2();
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_24)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsPreparedForUpload:].cold.1();
  }
  objc_msgSend(a1, "_registerContentTypes:withEventName:", v4, CFSTR("prepared"));

}

BOOL __79__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsPreparedForUpload___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unsignedIntegerValue") > 8;
}

+ (void)registerEnvelopeContentTypesAsRetainedForUploadRetry:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsRetainedForUploadRetry:].cold.2();
  if (objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_28)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsRetainedForUploadRetry:].cold.1();
  }
  objc_msgSend(a1, "_registerContentTypes:withEventName:", v4, CFSTR("retained"));

}

BOOL __84__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsRetainedForUploadRetry___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unsignedIntegerValue") > 8;
}

+ (void)registerEnvelopeContentTypesAsUploaded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsUploaded:].cold.2();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fc_containsObjectPassingTest:", &__block_literal_global_32);

  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsUploaded:].cold.1();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsInTimeZone:fromDate:", v9, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v24, "hour");
  objc_msgSend(MEMORY[0x24BE799E0], "propertyWithName:range:", CFSTR("localHour"), 0, 24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE799F0]);
  objc_msgSend(a1, "_contentTypeProperty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  objc_msgSend(a1, "_daysSinceSubmissionDateProperty");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  v31[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithFeatureId:event:registerProperties:", CFSTR("newsenvelopetracker"), CFSTR("uploaded"), v14);

  v16 = objc_alloc(MEMORY[0x24BE799D8]);
  objc_msgSend(a1, "_contentTypeProperty");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithFeatureId:event:registerProperties:", CFSTR("newsenvelopetracker"), CFSTR("uploaded_interval"), v18);

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_46;
  v25[3] = &unk_24D1DF210;
  v26 = v15;
  v27 = v7;
  v28 = v19;
  v29 = v23;
  v20 = v19;
  v21 = v7;
  v22 = v15;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v25);

}

BOOL __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unsignedIntegerValue") > 8;
}

void __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_2;
  v7[3] = &unk_24D1DF1E8;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v12 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __70__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsUploaded___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "fc_GregorianCalendarDaysSinceDate:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v14[0] = *(_QWORD *)(a1 + 40);
  v14[1] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackEventWithPropertyValues:", v8);

  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", v4);
  v10 = v9;

  v11 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackEventWithPropertyValues:value:", v12, v10 / 60.0);

}

+ (void)registerEnvelopeContentTypesAsDropped:(id)a3 forReason:(unint64_t)a4 withError:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __CFString *v37;
  id v38;
  char v39;
  __CFString *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  __CFString *v46;
  id v47;
  char v48;
  _QWORD v49[4];
  id v50;
  id v51;
  unint64_t v52;
  _QWORD v53[4];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[5];

  v58[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v43 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker registerEnvelopeContentTypesAsDropped:forReason:withError:].cold.1();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BE799F0]);
  objc_msgSend(a1, "_contentTypeProperty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v11;
  v12 = (void *)MEMORY[0x24BE799E0];
  v56[0] = &unk_24D1E3598;
  v56[1] = &unk_24D1E35B0;
  v57[0] = CFSTR("sampling");
  v57[1] = CFSTR("failed");
  v56[2] = &unk_24D1E35C8;
  v56[3] = &unk_24D1E35E0;
  v57[2] = CFSTR("missingconfig");
  v57[3] = CFSTR("pruned");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertyWithName:enumMapping:", CFSTR("reason"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v14;
  objc_msgSend(a1, "_daysSinceSubmissionDateProperty");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v10, "initWithFeatureId:event:registerProperties:", CFSTR("newsenvelopetracker"), CFSTR("dropped"), v16);

  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke;
  v49[3] = &unk_24D1DF260;
  v18 = v9;
  v50 = v18;
  v19 = v17;
  v51 = v19;
  v52 = a4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v49);
  v20 = a4 == 2;
  v21 = v43;
  if (v20 && v43)
  {
    v22 = *MEMORY[0x24BE6C9A0];
    v55[0] = *MEMORY[0x24BDD1308];
    v55[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "domain");
    v23 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v23;
    v24 = objc_msgSend(v42, "containsObject:", v23);
    v25 = CFSTR("unknown");
    if (v24)
      v25 = (__CFString *)v23;
    v40 = v25;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v43, "code"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(&unk_24D1E3758, "containsObject:", v26);
    objc_msgSend(MEMORY[0x24BE799E0], "freeValuedPropertyWithName:", CFSTR("errorDomain"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BE799E0];
    v54[0] = CFSTR("yes");
    v54[1] = CFSTR("no");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "propertyWithName:possibleValues:", CFSTR("errorCodeValid"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE799E0], "freeValuedPropertyWithName:", CFSTR("errorCode"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc(MEMORY[0x24BE799F0]);
    objc_msgSend(a1, "_contentTypeProperty");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v33;
    v53[1] = v27;
    v53[2] = v30;
    v53[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v32, "initWithFeatureId:event:registerProperties:", CFSTR("newsenvelopetracker"), CFSTR("upload_error"), v34);

    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_92;
    v44[3] = &unk_24D1DF288;
    v45 = v35;
    v46 = v40;
    v48 = v39;
    v47 = v26;
    v36 = v26;
    v37 = v40;
    v38 = v35;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v44);

    v21 = v43;
  }

}

void __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_2;
  v7[3] = &unk_24D1DF238;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 48);
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*(id *)(a1 + 32), "fc_GregorianCalendarDaysSinceDate:", a2);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEventWithPropertyValues:", v7);

}

void __89__NAUAnalyticsEnvelopeTracker_registerEnvelopeContentTypesAsDropped_forReason_withError___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v13[0] = a2;
  v13[1] = v4;
  if (*(_BYTE *)(a1 + 56))
    v6 = CFSTR("yes");
  else
    v6 = CFSTR("no");
  v13[2] = v6;
  v7 = *(void **)(a1 + 48);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "count");

  objc_msgSend(v5, "trackEventWithPropertyValues:value:", v11, v12);
}

+ (void)_registerEnvelopes:(id)a3 withEventName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker _registerEnvelopes:withEventName:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker _registerEnvelopes:withEventName:].cold.1();
LABEL_6:
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_95);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_registerContentTypes:withEventName:", v8, v7);

}

uint64_t __64__NAUAnalyticsEnvelopeTracker__registerEnvelopes_withEventName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "contentType"));
}

+ (void)_registerContentTypes:(id)a3 withEventName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NAUAnalyticsEnvelopeTracker _registerContentTypes:withEventName:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NAUAnalyticsEnvelopeTracker _registerContentTypes:withEventName:].cold.1();
LABEL_6:
  v8 = objc_alloc(MEMORY[0x24BE799F0]);
  objc_msgSend(a1, "_contentTypeProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFeatureId:event:registerProperties:", CFSTR("newsenvelopetracker"), v7, v10);

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v6);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v18 = objc_msgSend(v12, "countForObject:", v17, (_QWORD)v20);
        v24 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "trackEventWithPropertyValues:value:", v19, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v14);
  }

}

+ (id)_contentTypeProperty
{
  return (id)objc_msgSend(MEMORY[0x24BE799E0], "propertyWithName:range:", CFSTR("contentType"), 0, 9);
}

+ (id)_daysSinceSubmissionDateProperty
{
  return (id)objc_msgSend(MEMORY[0x24BE799E0], "propertyWithName:range:", CFSTR("daysSinceSubmission"), 0, 10);
}

+ (void)registerEnvelopeCreationAnticipatedForContentType:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(contentType)", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopesAsCreated:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![envelopes fc_containsObjectPassingTest:^BOOL(NTPBEnvelope *envelope) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(envelope.contentType); }]",
    v6,
    2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopesAsCreated:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopesAsSubmittedToUploader:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![envelopes fc_containsObjectPassingTest:^BOOL(NTPBEnvelope *envelope) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(envelope.contentType); }]",
    v6,
    2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopesAsSubmittedToUploader:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopesAsReceivedByUploader:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![envelopes fc_containsObjectPassingTest:^BOOL(NTPBEnvelope *envelope) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(envelope.contentType); }]",
    v6,
    2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopesAsReceivedByUploader:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopeContentTypesAsPreparedForUpload:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![contentTypes fc_containsObjectPassingTest:^BOOL(NSNumber *contentType) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported((NTPBEnvelope_ContentType)[contentType unsignedIntegerValue]); }]",
    v6,
    2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopeContentTypesAsPreparedForUpload:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopeContentTypesAsRetainedForUploadRetry:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![contentTypes fc_containsObjectPassingTest:^BOOL(NSNumber *contentType) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported((NTPBEnvelope_ContentType)[contentType unsignedIntegerValue]); }]",
    v6,
    2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopeContentTypesAsRetainedForUploadRetry:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopeContentTypesAsUploaded:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"![submissionDatesByContentType.allKeys fc_containsObjectPassingTest:^BOOL(NSNumber *contentType) { return !NAUAnalyticsEnvelopeTrackerContentTypeIsSupported((NTPBEnvelope_ContentType)[contentType unsignedIntegerValue]); }]",
    v6,
    2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopeContentTypesAsUploaded:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"submissionDatesByContentType", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)registerEnvelopeContentTypesAsDropped:forReason:withError:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"submissionDatesByContentType", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)_registerEnvelopes:withEventName:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"eventName", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)_registerEnvelopes:withEventName:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)_registerContentTypes:withEventName:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"eventName", v6, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)_registerContentTypes:withEventName:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

@end
