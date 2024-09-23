@implementation AMDTestDataCommon

+ (id)getSampleEvent
{
  double v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[15];
  _QWORD v9[16];

  v9[15] = *MEMORY[0x1E0C80C00];
  v8[0] = 0x1EA4BCB88;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v7, "timeIntervalSince1970");
  v5 = (id)objc_msgSend(v4, "numberWithUnsignedLongLong:", (unint64_t)v2);
  v9[0] = v5;
  v8[1] = 0x1EA4BCF28;
  v9[1] = &unk_1EA4CF418;
  v8[2] = 0x1EA4BCEA8;
  v9[2] = CFSTR("1.1");
  v8[3] = 0x1EA4BCEC8;
  v9[3] = &unk_1EA4D1E48;
  v8[4] = 0x1EA4BCF08;
  v9[4] = &unk_1EA4CF430;
  v8[5] = 0x1EA4BCF48;
  v9[5] = &unk_1EA4D1E58;
  v8[6] = 0x1EA4BCF68;
  v9[6] = &unk_1EA4D1E68;
  v8[7] = 0x1EA4BCF88;
  v9[7] = &unk_1EA4D1E78;
  v8[8] = 0x1EA4BCFA8;
  v9[8] = CFSTR("Some misc data");
  v8[9] = 0x1EA4BCFC8;
  v9[9] = &unk_1EA4CF448;
  v8[10] = 0x1EA4BCFE8;
  v9[10] = CFSTR("iPhone");
  v8[11] = 0x1EA4BD008;
  v9[11] = &unk_1EA4CF460;
  v8[12] = 0x1EA4BD028;
  v9[12] = &unk_1EA4CF478;
  v8[13] = 0x1EA4BD048;
  v9[13] = &unk_1EA4CF490;
  v8[14] = 0x1EA4BD068;
  v9[14] = CFSTR("installs");
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 15);

  return v6;
}

+ (id)getSampleEventInstalls
{
  double v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[16];
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  v8[0] = 0x1EA4BCB88;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v7, "timeIntervalSince1970");
  v5 = (id)objc_msgSend(v4, "numberWithUnsignedLongLong:", (unint64_t)v2);
  v9[0] = v5;
  v8[1] = 0x1EA4BCF28;
  v9[1] = &unk_1EA4CF418;
  v8[2] = 0x1EA4BCEA8;
  v9[2] = CFSTR("1.1");
  v8[3] = 0x1EA4BCEC8;
  v9[3] = &unk_1EA4D1E48;
  v8[4] = 0x1EA4BCF08;
  v9[4] = &unk_1EA4CF430;
  v8[5] = 0x1EA4BCF48;
  v9[5] = &unk_1EA4D1E58;
  v8[6] = 0x1EA4BCF68;
  v9[6] = &unk_1EA4D1E68;
  v8[7] = 0x1EA4BCF88;
  v9[7] = &unk_1EA4D1E78;
  v8[8] = 0x1EA4BCFA8;
  v9[8] = CFSTR("Some misc data");
  v8[9] = 0x1EA4BCFC8;
  v9[9] = &unk_1EA4CF448;
  v8[10] = 0x1EA4BCFE8;
  v9[10] = CFSTR("iPhone");
  v8[11] = 0x1EA4BD008;
  v9[11] = &unk_1EA4CF460;
  v8[12] = 0x1EA4BD028;
  v9[12] = &unk_1EA4CF478;
  v8[13] = 0x1EA4BD048;
  v9[13] = &unk_1EA4CF490;
  v8[14] = 0x1EA4BD068;
  v9[14] = CFSTR("installs");
  v8[15] = CFSTR("installType");
  v9[15] = &unk_1EA4CF478;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 16);

  return v6;
}

+ (id)getSampleEventUninstall
{
  double v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = 0x1EA4BCF28;
  v9[0] = &unk_1EA4CF418;
  v8[1] = 0x1EA4BCEA8;
  v9[1] = CFSTR("1.1");
  v8[2] = 0x1EA4BCFE8;
  v9[2] = CFSTR("iPhone");
  v8[3] = 0x1EA4BCB88;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v7, "timeIntervalSince1970");
  v5 = (id)objc_msgSend(v4, "numberWithUnsignedLongLong:", (unint64_t)v2);
  v9[3] = v5;
  v8[4] = 0x1EA4BD068;
  v9[4] = CFSTR("uninstalls");
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);

  return v6;
}

+ (id)getSampleEventCrashes
{
  double v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = 0x1EA4BCF28;
  v9[0] = &unk_1EA4CF418;
  v8[1] = 0x1EA4BCEA8;
  v9[1] = CFSTR("1.1");
  v8[2] = 0x1EA4BCFE8;
  v9[2] = CFSTR("iPhone");
  v8[3] = 0x1EA4BCB88;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v7, "timeIntervalSince1970");
  v5 = (id)objc_msgSend(v4, "numberWithUnsignedLongLong:", (unint64_t)v2);
  v9[3] = v5;
  v8[4] = 0x1EA4BD068;
  v9[4] = CFSTR("crashes");
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);

  return v6;
}

+ (id)getSampleEventLaunches
{
  _QWORD v3[6];
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1EA4BD068;
  v4[0] = CFSTR("launches");
  v3[1] = 0x1EA4BCEA8;
  v4[1] = CFSTR("2.1");
  v3[2] = 0x1EA4C2CA8;
  v4[2] = &unk_1EA4D1BD8;
  v3[3] = 0x1EA4BCFE8;
  v4[3] = CFSTR("iPhone");
  v3[4] = 0x1EA4BCF28;
  v4[4] = &unk_1EA4CF4F0;
  v3[5] = 0x1EA4BCEC8;
  v4[5] = &unk_1EA4CF508;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
}

+ (id)getEventPayload:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id *v12;
  id v13;
  id v14;
  id location[3];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  if ((objc_msgSend(location[0], "isEqualToString:", 0x1EA4C3048) & 1) != 0)
  {
    v3 = +[AMDTestDataCommon getSampleEventInstalls](AMDTestDataCommon, "getSampleEventInstalls");
    v4 = v14;
    v14 = v3;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", 0x1EA4C30C8) & 1) != 0)
  {
    v5 = +[AMDTestDataCommon getSampleEventUninstall](AMDTestDataCommon, "getSampleEventUninstall");
    v6 = v14;
    v14 = v5;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", 0x1EA4C3028) & 1) != 0)
  {
    v7 = +[AMDTestDataCommon getSampleEventCrashes](AMDTestDataCommon, "getSampleEventCrashes");
    v8 = v14;
    v14 = v7;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", 0x1EA4C3088) & 1) != 0)
  {
    v9 = +[AMDTestDataCommon getSampleEventLaunches](AMDTestDataCommon, "getSampleEventLaunches");
    v10 = v14;
    v14 = v9;

  }
  v16[0] = CFSTR("data");
  v17[0] = v14;
  v16[1] = CFSTR("action");
  v17[1] = location[0];
  v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2, &v14);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)getNonAggregationDescriptor
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[2];
  _QWORD v12[2];
  id v13;
  id v14;
  __CFString *v15;
  const __CFString *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v18[0] = 0x1EA4C4D08;
  v19[0] = CFSTR("AMDAppEvent");
  v18[1] = 0x1EA4C4C68;
  v15 = CFSTR("property_name");
  v16 = CFSTR("adamId");
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15);
  v17 = v10;
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v19[1] = v9;
  v18[2] = 0x1EA4C2088;
  v8 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ > 100"), CFSTR("time"));
  v14 = v8;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v19[2] = v7;
  v18[3] = 0x1EA4C42C8;
  v11[0] = 0x1EA4C4CA8;
  v12[0] = CFSTR("time");
  v11[1] = 0x1EA4C4CE8;
  v12[1] = &unk_1EA4CF520;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v13 = v6;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v19[3] = v5;
  v18[4] = 0x1EA4C4C48;
  v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 9);
  v19[4] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);

  return v4;
}

+ (id)getAggregationDescriptorDict
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[3];
  __CFString *v10;
  void *v11;
  id v12;
  __CFString *v13;
  const __CFString *v14;
  _QWORD v15[2];
  _QWORD v16[6];
  _QWORD v17[6];
  __CFString *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v9[2] = a1;
  v9[1] = (id)a2;
  v19[0] = 0x1EA4C4C88;
  v20[0] = CFSTR("aggregatedProp");
  v19[1] = 0x1EA4C4A88;
  v20[1] = CFSTR("count:");
  v19[2] = 0x1EA4C4A68;
  v20[2] = 0x1EA4C3C48;
  v19[3] = 0x1EA4C4AA8;
  v18 = CFSTR("foregroundDuration");
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18);
  v20[3] = v3;
  v9[0] = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);

  v16[0] = 0x1EA4C4D08;
  v17[0] = CFSTR("AMDAppEvent");
  v16[1] = 0x1EA4C4C68;
  v13 = CFSTR("property_name");
  v14 = CFSTR("adamId");
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v15[0] = v8;
  v15[1] = v9[0];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v17[1] = v7;
  v16[2] = 0x1EA4C2088;
  v17[2] = &unk_1EA4D1BF0;
  v16[3] = 0x1EA4C4B08;
  v17[3] = &unk_1EA4D1C08;
  v16[4] = 0x1EA4C42C8;
  v10 = CFSTR("sort_order");
  v11 = &unk_1EA4CF520;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v12 = v6;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v17[4] = v4;
  v16[5] = 0x1EA4C4C48;
  v17[5] = &unk_1EA4CF538;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);

  objc_storeStrong(v9, 0);
  return v5;
}

+ (id)gettabInfoDict
{
  return &unk_1EA4D13C0;
}

+ (id)getRefreshServerTasteProfilePayload
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("data");
  v8[0] = CFSTR("domain");
  v9[0] = CFSTR("apps");
  v8[1] = CFSTR("tasteProfiles");
  v6[0] = CFSTR("user_id");
  v7[0] = CFSTR("268533468");
  v6[1] = CFSTR("storefront_id");
  v7[1] = &unk_1EA4CF550;
  v6[2] = CFSTR("PURCHASED_ITEM_AFFINITY");
  v7[2] = &unk_1EA4D13E8;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v9[1] = v5;
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8);
  v11[0] = v3;
  v10[1] = CFSTR("action");
  v11[1] = CFSTR("refresh_server_taste_profile");
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);

  return v4;
}

+ (id)getRefreshOnDeviceTasteProfilePayload
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("data");
  v8[0] = CFSTR("domain");
  v9[0] = CFSTR("apps");
  v8[1] = CFSTR("tasteProfiles");
  v6[0] = CFSTR("user_id");
  v7[0] = CFSTR("268533468");
  v6[1] = CFSTR("storefront_id");
  v7[1] = &unk_1EA4CF550;
  v6[2] = CFSTR("PURCHASED_ITEM_AFFINITY");
  v7[2] = &unk_1EA4D1410;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v9[1] = v5;
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8);
  v11[0] = v3;
  v10[1] = CFSTR("action");
  v11[1] = CFSTR("refresh_on_device_taste_profile");
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);

  return v4;
}

+ (id)getInferencePayload
{
  id v3;
  id v4;
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("data");
  v5[0] = CFSTR("domain");
  v6[0] = CFSTR("apps");
  v5[1] = CFSTR("useCaseIds");
  v6[1] = &unk_1EA4D1C38;
  v5[2] = CFSTR("storefrontId");
  v6[2] = &unk_1EA4CF550;
  v5[3] = CFSTR("dsid");
  v6[3] = CFSTR("268533468");
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v8[0] = v3;
  v7[1] = CFSTR("action");
  v8[1] = CFSTR("run_inference");
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);

  return v4;
}

+ (id)getSaveConfigDownloadModelPayload
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  id v11;
  _QWORD v12[13];
  _QWORD v13[13];
  id v14;
  _QWORD v15[3];
  _QWORD v16[3];
  const __CFString *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("data");
  v17 = CFSTR("apps");
  v15[0] = CFSTR("modelUrls");
  v16[0] = &unk_1EA4D1438;
  v15[1] = CFSTR("workflows");
  v12[0] = CFSTR("workflow_id");
  v13[0] = &unk_1EA4CF568;
  v12[1] = CFSTR("workflow_name");
  v13[1] = CFSTR("MGYML Default");
  v12[2] = CFSTR("tab_ids");
  v13[2] = &unk_1EA4D1C50;
  v12[3] = CFSTR("use_case_id");
  v13[3] = CFSTR("mgyml");
  v12[4] = CFSTR("included_device_families");
  v13[4] = &unk_1EA4D1C68;
  v12[5] = CFSTR("model_id");
  v13[5] = CFSTR("games_od_phl_monetize_classifier_global");
  v12[6] = CFSTR("model_format");
  v13[6] = CFSTR("CoreML");
  v12[7] = CFSTR("included_storefront_ids");
  v13[7] = MEMORY[0x1E0C9AA60];
  v12[8] = CFSTR("excluded_storefront_ids");
  v13[8] = MEMORY[0x1E0C9AA60];
  v12[9] = CFSTR("js_resources");
  v13[9] = &unk_1EA4D1C80;
  v12[10] = CFSTR("max_items_to_display");
  v13[10] = &unk_1EA4CF580;
  v12[11] = CFSTR("input_definitions");
  v13[11] = &unk_1EA4D1488;
  v12[12] = CFSTR("output_definitions");
  v13[12] = &unk_1EA4D1550;
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 13);
  v14 = v9;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14);
  v16[1] = v8;
  v15[2] = CFSTR("descriptors");
  v10 = CFSTR("sort_descriptors");
  v7 = +[AMDTestDataCommon getAggregationDescriptorDict](AMDTestDataCommon, "getAggregationDescriptorDict");
  v11 = v7;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v16[2] = v6;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v18 = v5;
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v20[0] = v3;
  v19[1] = CFSTR("action");
  v20[1] = CFSTR("save_config_download_model");
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);

  return v4;
}

+ (id)getSampleWorkflow
{
  id v3;
  id v4;
  _QWORD v5[12];
  _QWORD v6[12];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("workflow_id");
  v6[0] = &unk_1EA4CF568;
  v5[1] = CFSTR("workflow_name");
  v6[1] = CFSTR("MGYML Default");
  v5[2] = CFSTR("use_case_id");
  v6[2] = CFSTR("mgyml");
  v5[3] = CFSTR("included_device_families");
  v6[3] = &unk_1EA4D1CF8;
  v5[4] = CFSTR("model_id");
  v6[4] = CFSTR("games_od_phl_monetize_classifier_global");
  v5[5] = CFSTR("model_format");
  v6[5] = CFSTR("CoreML");
  v5[6] = CFSTR("included_storefront_ids");
  v6[6] = MEMORY[0x1E0C9AA60];
  v5[7] = CFSTR("excluded_storefront_ids");
  v6[7] = MEMORY[0x1E0C9AA60];
  v5[8] = CFSTR("js_resources");
  v6[8] = &unk_1EA4D1D10;
  v5[9] = CFSTR("max_items_to_display");
  v6[9] = &unk_1EA4CF580;
  v5[10] = CFSTR("input_definitions");
  v6[10] = &unk_1EA4D15A0;
  v5[11] = CFSTR("output_definitions");
  v6[11] = &unk_1EA4D1668;
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 12);
  v7[0] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);

  return v4;
}

@end
