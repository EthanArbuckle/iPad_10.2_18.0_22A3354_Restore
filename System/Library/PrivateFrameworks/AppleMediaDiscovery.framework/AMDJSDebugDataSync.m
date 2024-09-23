@implementation AMDJSDebugDataSync

+ (id)testNewDevicePayloadCreation:(id *)a3
{
  id v4;
  id location;
  id v6;
  id v7;
  id *v8;
  SEL v9;
  id v10;
  id v11;

  v10 = a1;
  v9 = a2;
  v8 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = &unk_1EA4D16B8;
  location = +[AMDDataSync processDataReplicationPayload:error:](AMDDataSync, "processDataReplicationPayload:error:", v6, v8);
  if (*v8)
  {
    v4 = (id)objc_msgSend(*v8, "localizedDescription");
    objc_msgSend(v7, "setObject:forKey:");

    v11 = v7;
  }
  else
  {
    if (location)
      objc_msgSend(v7, "setObject:forKey:", location, CFSTR("ckConfigSetup"));
    else
      objc_msgSend(v7, "setObject:forKey:", CFSTR("nil response"), CFSTR("ckResponseError"));
    v11 = v7;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  return v11;
}

+ (id)testEventDeltaAlgorithm:(id *)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location;
  id v28;
  id v29;
  id *v30;
  SEL v31;
  id v32;
  id v33;
  _QWORD v34[16];
  _QWORD v35[16];
  id v36;
  const __CFString *v37;
  id v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[16];
  _QWORD v42[16];
  id v43;
  const __CFString *v44;
  id v45;
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x1E0C80C00];
  v32 = a1;
  v31 = a2;
  v30 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50[0] = CFSTR("drConfig");
  v51[0] = &unk_1EA4D16E0;
  v50[1] = CFSTR("deviceRegistry");
  v51[1] = &unk_1EA4D1708;
  v50[2] = CFSTR("drData");
  v48[0] = CFSTR("__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257");
  v49[0] = &unk_1EA4D1730;
  v48[1] = CFSTR("dev3");
  v46[0] = CFSTR("checkpoints");
  v3 = MEMORY[0x1E0C9AA70];
  v47[0] = MEMORY[0x1E0C9AA70];
  v46[1] = CFSTR("bookmarks");
  v47[1] = MEMORY[0x1E0C9AA70];
  v46[2] = CFSTR("eventsDict");
  v44 = CFSTR("AppUsageDataCoreData");
  v41[0] = CFSTR("adamId");
  v42[0] = &unk_1EA4CF640;
  v41[1] = CFSTR("appVersion");
  v42[1] = CFSTR("11.21.0");
  v41[2] = CFSTR("batteryUsage");
  v42[2] = &unk_1EA4CF628;
  v41[3] = CFSTR("deviceId");
  v42[3] = CFSTR("dev3");
  v41[4] = CFSTR("eventSubType");
  v42[4] = &unk_1EA4CF628;
  v41[5] = CFSTR("foregroundDuration");
  v42[5] = &unk_1EA4CF658;
  v41[6] = CFSTR("latitude");
  v42[6] = &unk_1EA4CF628;
  v41[7] = CFSTR("locationAccuracy");
  v42[7] = &unk_1EA4CF628;
  v41[8] = CFSTR("longitude");
  v42[8] = &unk_1EA4CF628;
  v41[9] = CFSTR("networkType");
  v42[9] = &unk_1EA4CF628;
  v41[10] = CFSTR("platform");
  v42[10] = &unk_1EA4CF670;
  v41[11] = CFSTR("storageUsed");
  v42[11] = &unk_1EA4CF628;
  v41[12] = CFSTR("time");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v26 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v25 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v26, "longLongValue"));
  v42[12] = v25;
  v41[13] = CFSTR("timeZoneOffset");
  v42[13] = &unk_1EA4CF628;
  v41[14] = CFSTR("type");
  v42[14] = &unk_1EA4CF688;
  v41[15] = CFSTR("userId");
  v42[15] = CFSTR("20160157686");
  v24 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41);
  v43 = v24;
  v23 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43);
  v45 = v23;
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v47[2] = v22;
  v46[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v21 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v20 = (id)objc_msgSend(v7, "numberWithLongLong:", 1000 * objc_msgSend(v21, "longLongValue"));
  v47[3] = v20;
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46);
  v49[1] = v19;
  v48[2] = CFSTR("dev4");
  v39[0] = CFSTR("checkpoints");
  v40[0] = v3;
  v39[1] = CFSTR("bookmarks");
  v40[1] = v3;
  v39[2] = CFSTR("eventsDict");
  v37 = CFSTR("AppUsageDataCoreData");
  v34[0] = CFSTR("adamId");
  v35[0] = &unk_1EA4CF6A0;
  v34[1] = CFSTR("appVersion");
  v35[1] = CFSTR("11.21.0");
  v34[2] = CFSTR("batteryUsage");
  v35[2] = &unk_1EA4CF628;
  v34[3] = CFSTR("deviceId");
  v35[3] = CFSTR("dev4");
  v34[4] = CFSTR("eventSubType");
  v35[4] = &unk_1EA4CF628;
  v34[5] = CFSTR("foregroundDuration");
  v35[5] = &unk_1EA4CF658;
  v34[6] = CFSTR("latitude");
  v35[6] = &unk_1EA4CF628;
  v34[7] = CFSTR("locationAccuracy");
  v35[7] = &unk_1EA4CF628;
  v34[8] = CFSTR("longitude");
  v35[8] = &unk_1EA4CF628;
  v34[9] = CFSTR("networkType");
  v35[9] = &unk_1EA4CF628;
  v34[10] = CFSTR("platform");
  v35[10] = &unk_1EA4CF670;
  v34[11] = CFSTR("storageUsed");
  v35[11] = &unk_1EA4CF628;
  v34[12] = CFSTR("time");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v18 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v17 = (id)objc_msgSend(v8, "numberWithLongLong:", 1000 * objc_msgSend(v18, "longLongValue"));
  v35[12] = v17;
  v34[13] = CFSTR("timeZoneOffset");
  v35[13] = &unk_1EA4CF628;
  v34[14] = CFSTR("type");
  v35[14] = &unk_1EA4CF688;
  v34[15] = CFSTR("userId");
  v35[15] = CFSTR("20160157686");
  v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 16);
  v36 = v16;
  v15 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v38 = v15;
  v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v40[2] = v14;
  v39[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v13 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v12 = (id)objc_msgSend(v9, "numberWithLongLong:", 1000 * objc_msgSend(v13, "longLongValue"));
  v40[3] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v49[2] = v11;
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48);
  v51[2] = v10;
  v28 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);

  location = +[AMDDataSync processDataReplicationPayload:error:](AMDDataSync, "processDataReplicationPayload:error:", v28, v30);
  if (*v30)
  {
    v5 = (id)objc_msgSend(*v30, "localizedDescription");
    objc_msgSend(v29, "setObject:forKey:");

    v33 = v29;
  }
  else
  {
    if (location)
      objc_msgSend(v29, "setObject:forKey:", location, CFSTR("fsDataConsumption"));
    else
      objc_msgSend(v29, "setObject:forKey:", CFSTR("nil response"), CFSTR("drResponseError"));
    v33 = v29;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  return v33;
}

+ (id)testfullSyncInitiation:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id location;
  id v11;
  id v12;
  id *v13;
  SEL v14;
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[4];
  const __CFString *v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21[0] = CFSTR("drConfig");
  v22[0] = &unk_1EA4D1758;
  v21[1] = CFSTR("deviceRegistry");
  v22[1] = &unk_1EA4D1780;
  v21[2] = CFSTR("drData");
  v19 = CFSTR("dev2");
  v17[0] = CFSTR("checkpoints");
  v18[0] = MEMORY[0x1E0C9AA70];
  v17[1] = CFSTR("bookmarks");
  v18[1] = MEMORY[0x1E0C9AA70];
  v17[2] = CFSTR("eventsDict");
  v18[2] = &unk_1EA4D17F8;
  v17[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v9 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v8 = (id)objc_msgSend(v5, "numberWithLongLong:", 1000 * objc_msgSend(v9, "longLongValue"));
  v18[3] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v20 = v7;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v22[2] = v6;
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);

  location = +[AMDDataSync processDataReplicationPayload:error:](AMDDataSync, "processDataReplicationPayload:error:", v11, v13);
  if (*v13)
  {
    v4 = (id)objc_msgSend(*v13, "localizedDescription");
    objc_msgSend(v12, "setObject:forKey:");

    v16 = v12;
  }
  else
  {
    if (location)
      objc_msgSend(v12, "setObject:forKey:", location, CFSTR("fsInitiation"));
    else
      objc_msgSend(v12, "setObject:forKey:", CFSTR("nil response"), CFSTR("drResponseError"));
    v16 = v12;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  return v16;
}

+ (id)testfullSyncDataIngestion:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location;
  id v37;
  id v38;
  id *v39;
  SEL v40;
  id v41;
  id v42;
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[16];
  _QWORD v50[16];
  id v51;
  const __CFString *v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[16];
  _QWORD v57[16];
  id v58;
  const __CFString *v59;
  id v60;
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[4];

  v66[3] = *MEMORY[0x1E0C80C00];
  v41 = a1;
  v40 = a2;
  v39 = a3;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v65[0] = CFSTR("drConfig");
  v66[0] = &unk_1EA4D1820;
  v65[1] = CFSTR("deviceRegistry");
  v66[1] = &unk_1EA4D1848;
  v65[2] = CFSTR("drData");
  v63[0] = CFSTR("dev2");
  v61[0] = CFSTR("checkpoints");
  v10 = MEMORY[0x1E0C9AA70];
  v62[0] = MEMORY[0x1E0C9AA70];
  v61[1] = CFSTR("bookmarks");
  v62[1] = MEMORY[0x1E0C9AA70];
  v61[2] = CFSTR("eventsDict");
  v59 = CFSTR("AppUsageDataCoreData");
  v56[0] = CFSTR("adamId");
  v57[0] = &unk_1EA4CF6B8;
  v56[1] = CFSTR("appVersion");
  v57[1] = CFSTR("11.21.0");
  v56[2] = CFSTR("batteryUsage");
  v57[2] = &unk_1EA4CF628;
  v56[3] = CFSTR("deviceId");
  v57[3] = CFSTR("undefined");
  v56[4] = CFSTR("eventSubType");
  v57[4] = &unk_1EA4CF628;
  v56[5] = CFSTR("foregroundDuration");
  v57[5] = &unk_1EA4CF6D0;
  v56[6] = CFSTR("latitude");
  v57[6] = &unk_1EA4CF628;
  v56[7] = CFSTR("locationAccuracy");
  v57[7] = &unk_1EA4CF628;
  v56[8] = CFSTR("longitude");
  v57[8] = &unk_1EA4CF628;
  v56[9] = CFSTR("networkType");
  v57[9] = &unk_1EA4CF628;
  v56[10] = CFSTR("platform");
  v57[10] = &unk_1EA4CF670;
  v56[11] = CFSTR("storageUsed");
  v57[11] = &unk_1EA4CF628;
  v56[12] = CFSTR("time");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v35 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v34 = (id)objc_msgSend(v5, "numberWithLongLong:", 1000 * objc_msgSend(v35, "longLongValue"));
  v57[12] = v34;
  v56[13] = CFSTR("timeZoneOffset");
  v57[13] = &unk_1EA4CF628;
  v56[14] = CFSTR("type");
  v57[14] = &unk_1EA4CF688;
  v56[15] = CFSTR("userId");
  v57[15] = CFSTR("20160157686");
  v33 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56);
  v58 = v33;
  v32 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58);
  v60 = v32;
  v31 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v62[2] = v31;
  v61[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v30 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v29 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v30, "longLongValue"));
  v62[3] = v29;
  v61[4] = CFSTR("fullSyncResponse");
  v54[0] = CFSTR("targetUUID");
  v55[0] = CFSTR("__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257");
  v54[1] = CFSTR("events");
  v52 = CFSTR("AppUsageDataCoreData");
  v49[0] = CFSTR("adamId");
  v50[0] = &unk_1EA4CF730;
  v49[1] = CFSTR("appVersion");
  v50[1] = CFSTR("11.21.0");
  v49[2] = CFSTR("batteryUsage");
  v50[2] = &unk_1EA4CF628;
  v49[3] = CFSTR("deviceId");
  v50[3] = CFSTR("dev2");
  v49[4] = CFSTR("eventSubType");
  v50[4] = &unk_1EA4CF628;
  v49[5] = CFSTR("foregroundDuration");
  v50[5] = &unk_1EA4CF658;
  v49[6] = CFSTR("latitude");
  v50[6] = &unk_1EA4CF628;
  v49[7] = CFSTR("locationAccuracy");
  v50[7] = &unk_1EA4CF628;
  v49[8] = CFSTR("longitude");
  v50[8] = &unk_1EA4CF628;
  v49[9] = CFSTR("networkType");
  v50[9] = &unk_1EA4CF628;
  v49[10] = CFSTR("platform");
  v50[10] = &unk_1EA4CF670;
  v49[11] = CFSTR("storageUsed");
  v50[11] = &unk_1EA4CF628;
  v49[12] = CFSTR("time");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v28 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v27 = (id)objc_msgSend(v7, "numberWithLongLong:", 1000 * objc_msgSend(v28, "longLongValue"));
  v50[12] = v27;
  v49[13] = CFSTR("timeZoneOffset");
  v50[13] = &unk_1EA4CF628;
  v49[14] = CFSTR("type");
  v50[14] = &unk_1EA4CF688;
  v49[15] = CFSTR("userId");
  v50[15] = CFSTR("20160157686");
  v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 16);
  v51 = v26;
  v25 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v53 = v25;
  v24 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v55[1] = v24;
  v23 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v62[4] = v23;
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61);
  v64[0] = v22;
  v63[1] = CFSTR("__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257");
  v47[0] = CFSTR("checkpoints");
  v48[0] = v10;
  v47[1] = CFSTR("bookmarks");
  v48[1] = v10;
  v47[2] = CFSTR("eventsDict");
  v48[2] = &unk_1EA4D1870;
  v47[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v21 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v20 = (id)objc_msgSend(v8, "numberWithLongLong:", 1000 * objc_msgSend(v21, "longLongValue"));
  v48[3] = v20;
  v47[4] = CFSTR("fullSyncRequest");
  v45[0] = CFSTR("fsCheckpoint");
  v46[0] = v10;
  v45[1] = CFSTR("fsRequestTime");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v19 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v18 = (id)objc_msgSend(v9, "numberWithLongLong:", 1000 * objc_msgSend(v19, "longLongValue"));
  v46[1] = v18;
  v45[2] = CFSTR("sourceUUID");
  v46[2] = CFSTR("dev2");
  v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45);
  v48[4] = v17;
  v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 5);
  v64[1] = v16;
  v63[2] = CFSTR("dev3");
  v43[0] = CFSTR("checkpoints");
  v44[0] = v10;
  v43[1] = CFSTR("bookmarks");
  v44[1] = v10;
  v43[2] = CFSTR("eventsDict");
  v44[2] = &unk_1EA4D18C0;
  v43[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v15 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v14 = (id)objc_msgSend(v11, "numberWithLongLong:", 1000 * objc_msgSend(v15, "longLongValue"));
  v44[3] = v14;
  v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
  v64[2] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
  v66[2] = v12;
  v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);

  location = +[AMDDataSync processDataReplicationPayload:error:](AMDDataSync, "processDataReplicationPayload:error:", v37, v39);
  if (*v39)
  {
    v4 = (id)objc_msgSend(*v39, "localizedDescription");
    objc_msgSend(v38, "setObject:forKey:");

    v42 = v38;
  }
  else
  {
    if (location)
      objc_msgSend(v38, "setObject:forKey:", location, CFSTR("fsDataConsumption"));
    else
      objc_msgSend(v38, "setObject:forKey:", CFSTR("nil response"), CFSTR("drResponseError"));
    v42 = v38;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  return v42;
}

+ (id)testfullSyncRequestCompletion:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  id v26;
  id v27;
  id *v28;
  SEL v29;
  id v30;
  id v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[16];
  _QWORD v35[16];
  id v36;
  const __CFString *v37;
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  v30 = a1;
  v29 = a2;
  v28 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v45[0] = CFSTR("drConfig");
  v46[0] = &unk_1EA4D18E8;
  v45[1] = CFSTR("deviceRegistry");
  v46[1] = &unk_1EA4D1910;
  v45[2] = CFSTR("drData");
  v43[0] = CFSTR("__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257");
  v41[0] = CFSTR("checkpoints");
  v8 = MEMORY[0x1E0C9AA70];
  v42[0] = MEMORY[0x1E0C9AA70];
  v41[1] = CFSTR("bookmarks");
  v42[1] = MEMORY[0x1E0C9AA70];
  v41[2] = CFSTR("eventsDict");
  v42[2] = &unk_1EA4D1938;
  v41[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v24 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v23 = (id)objc_msgSend(v5, "numberWithLongLong:", 1000 * objc_msgSend(v24, "longLongValue"));
  v42[3] = v23;
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
  v44[0] = v22;
  v43[1] = CFSTR("dev3");
  v39[0] = CFSTR("checkpoints");
  v40[0] = v8;
  v39[1] = CFSTR("bookmarks");
  v40[1] = v8;
  v39[2] = CFSTR("eventsDict");
  v37 = CFSTR("AppUsageDataCoreData");
  v34[0] = CFSTR("adamId");
  v35[0] = &unk_1EA4CF640;
  v34[1] = CFSTR("appVersion");
  v35[1] = CFSTR("11.21.0");
  v34[2] = CFSTR("batteryUsage");
  v35[2] = &unk_1EA4CF628;
  v34[3] = CFSTR("deviceId");
  v35[3] = CFSTR("dev2");
  v34[4] = CFSTR("eventSubType");
  v35[4] = &unk_1EA4CF628;
  v34[5] = CFSTR("foregroundDuration");
  v35[5] = &unk_1EA4CF658;
  v34[6] = CFSTR("latitude");
  v35[6] = &unk_1EA4CF628;
  v34[7] = CFSTR("locationAccuracy");
  v35[7] = &unk_1EA4CF628;
  v34[8] = CFSTR("longitude");
  v35[8] = &unk_1EA4CF628;
  v34[9] = CFSTR("networkType");
  v35[9] = &unk_1EA4CF628;
  v34[10] = CFSTR("platform");
  v35[10] = &unk_1EA4CF670;
  v34[11] = CFSTR("storageUsed");
  v35[11] = &unk_1EA4CF628;
  v34[12] = CFSTR("time");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v21 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v20 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v21, "longLongValue"));
  v35[12] = v20;
  v34[13] = CFSTR("timeZoneOffset");
  v35[13] = &unk_1EA4CF628;
  v34[14] = CFSTR("type");
  v35[14] = &unk_1EA4CF688;
  v34[15] = CFSTR("userId");
  v35[15] = CFSTR("20160157686");
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 16);
  v36 = v19;
  v18 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36);
  v38 = v18;
  v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v40[2] = v17;
  v39[3] = CFSTR("lastUpdateTimeMilliSeconds");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v16 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v15 = (id)objc_msgSend(v7, "numberWithLongLong:", 1000 * objc_msgSend(v16, "longLongValue"));
  v40[3] = v15;
  v39[4] = CFSTR("fullSyncRequest");
  v32[0] = CFSTR("fsCheckpoint");
  v33[0] = v8;
  v32[1] = CFSTR("fsRequestTime");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v14 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v13 = (id)objc_msgSend(v9, "numberWithLongLong:", 1000 * objc_msgSend(v14, "longLongValue"));
  v33[1] = v13;
  v32[2] = CFSTR("sourceUUID");
  v33[2] = CFSTR("__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257");
  v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32);
  v40[4] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
  v44[1] = v11;
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v46[2] = v10;
  v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);

  location = +[AMDDataSync processDataReplicationPayload:error:](AMDDataSync, "processDataReplicationPayload:error:", v26, v28);
  if (*v28)
  {
    v4 = (id)objc_msgSend(*v28, "localizedDescription");
    objc_msgSend(v27, "setObject:forKey:");

    v31 = v27;
  }
  else
  {
    if (location)
      objc_msgSend(v27, "setObject:forKey:", location, CFSTR("fsDataConsumption"));
    else
      objc_msgSend(v27, "setObject:forKey:", CFSTR("nil response"), CFSTR("drResponseError"));
    v31 = v27;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  return v31;
}

@end
