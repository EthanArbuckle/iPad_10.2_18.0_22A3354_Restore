@implementation AMDClient

- (id)callDebugEvent:(id)a3 withPayload:(id)a4
{
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[3];
  id v18;
  const __CFString *v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = objc_alloc_init(AMDAMSEngagementEvent);
  v21[0] = CFSTR("action");
  v22[0] = CFSTR("amd.debug");
  v21[1] = CFSTR("dsid");
  v22[1] = CFSTR("1");
  v21[2] = CFSTR("storefrontId");
  v22[2] = CFSTR("2");
  v21[3] = CFSTR("event");
  v22[3] = location[0];
  v21[4] = CFSTR("testPayload");
  v22[4] = v16;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  objc_msgSend(v15, "setEngagementData:");

  v14 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  v13 = (id)objc_msgSend(v14, "enqueueEvent:", v15);
  v12 = 0;
  v10 = 0;
  v9 = (id)objc_msgSend(v13, "resultWithError:", &v10);
  objc_storeStrong(&v12, v10);
  v11 = v9;
  if (v12)
  {
    v19 = CFSTR("error");
    v6 = (id)objc_msgSend(v12, "localizedDescription");
    v20 = v6;
    v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);

  }
  else if (v11)
  {
    v5 = (id)objc_msgSend(v11, "data");
    v18 = (id)objc_msgSend(v5, "objectForKey:", CFSTR("response"));

  }
  else
  {
    v18 = &unk_1EA4D0CB8;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (id)getFeatureStub:(id)a3
{
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  int k;
  id v29;
  id v30;
  int j;
  id v32;
  int i;
  id v34;
  int v35;
  id location[3];
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = (id)objc_msgSend(location[0], "featureName");
  v26 = objc_msgSend(v25, "isEqual:", CFSTR("testFeatureList"));

  if ((v26 & 1) != 0)
  {
    v62[0] = CFSTR("status");
    v63[0] = CFSTR("OK");
    v62[1] = CFSTR("data");
    v63[1] = &unk_1EA4D1A70;
    v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v35 = 1;
  }
  else
  {
    v23 = (id)objc_msgSend(location[0], "featureName");
    v24 = objc_msgSend(v23, "isEqual:", CFSTR("testFeatureDict"));

    if ((v24 & 1) != 0)
    {
      v60[0] = CFSTR("status");
      v61[0] = CFSTR("OK");
      v60[1] = CFSTR("data");
      v61[1] = &unk_1EA4D0CE0;
      v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v35 = 1;
    }
    else
    {
      v21 = (id)objc_msgSend(location[0], "featureName");
      v22 = objc_msgSend(v21, "isEqual:", CFSTR("testFeatureDictLongKey"));

      if ((v22 & 1) != 0)
      {
        v58[0] = CFSTR("status");
        v59[0] = CFSTR("OK");
        v58[1] = CFSTR("data");
        v56[0] = &unk_1EA4CECC8;
        v57[0] = &unk_1EA4D1DF8;
        v56[1] = &unk_1EA4CECE0;
        v57[1] = &unk_1EA4D1E08;
        v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56);
        v59[1] = v20;
        v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);

        v35 = 1;
      }
      else
      {
        v18 = (id)objc_msgSend(location[0], "featureName");
        v19 = objc_msgSend(v18, "isEqual:", CFSTR("testFeatureDictFloatKey"));

        if ((v19 & 1) != 0)
        {
          v54[0] = CFSTR("status");
          v55[0] = CFSTR("OK");
          v54[1] = CFSTR("data");
          v52[0] = &unk_1EA4D1DF8;
          v53[0] = &unk_1EA4D1DF8;
          v52[1] = &unk_1EA4D1E08;
          v53[1] = &unk_1EA4D1E08;
          v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52);
          v55[1] = v17;
          v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);

          v35 = 1;
        }
        else
        {
          v15 = (id)objc_msgSend(location[0], "featureName");
          v16 = objc_msgSend(v15, "isEqual:", CFSTR("dictOfArrays"));

          if ((v16 & 1) != 0)
          {
            v50[0] = CFSTR("status");
            v51[0] = CFSTR("OK");
            v50[1] = CFSTR("data");
            v51[1] = &unk_1EA4D0D08;
            v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
            v35 = 1;
          }
          else
          {
            v13 = (id)objc_msgSend(location[0], "featureName");
            v14 = objc_msgSend(v13, "isEqual:", CFSTR("dictOfDicts"));

            if ((v14 & 1) != 0)
            {
              v48[0] = CFSTR("status");
              v49[0] = CFSTR("OK");
              v48[1] = CFSTR("data");
              v49[1] = &unk_1EA4D0D80;
              v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
              v35 = 1;
            }
            else
            {
              v11 = (id)objc_msgSend(location[0], "featureName");
              v12 = objc_msgSend(v11, "isEqual:", CFSTR("dictOfDictsWithString"));

              if ((v12 & 1) != 0)
              {
                v46[0] = CFSTR("status");
                v47[0] = CFSTR("OK");
                v46[1] = CFSTR("data");
                v47[1] = &unk_1EA4D0DF8;
                v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
                v35 = 1;
              }
              else
              {
                v9 = (id)objc_msgSend(location[0], "featureName");
                v10 = objc_msgSend(v9, "isEqual:", CFSTR("98apps"));

                if ((v10 & 1) != 0)
                {
                  v34 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  for (i = 0; i < 50; ++i)
                  {
                    v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (10 * i));
                    objc_msgSend(v34, "addObject:");

                  }
                  v44[0] = CFSTR("status");
                  v45[0] = CFSTR("OK");
                  v44[1] = CFSTR("data");
                  v45[1] = v34;
                  v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
                  v35 = 1;
                  objc_storeStrong(&v34, 0);
                }
                else
                {
                  v6 = (id)objc_msgSend(location[0], "featureName");
                  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("purchase_id"));

                  if ((v7 & 1) != 0)
                  {
                    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    for (j = 0; j < 500; ++j)
                    {
                      v30 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", arc4random() % 0x9C40);
                      objc_msgSend(v32, "addObject:", v30);
                      objc_storeStrong(&v30, 0);
                    }
                    v42[0] = CFSTR("status");
                    v43[0] = CFSTR("OK");
                    v42[1] = CFSTR("data");
                    v43[1] = v32;
                    v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
                    v35 = 1;
                    objc_storeStrong(&v32, 0);
                  }
                  else
                  {
                    v4 = (id)objc_msgSend(location[0], "featureName");
                    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("label"));

                    if ((v5 & 1) != 0)
                    {
                      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      for (k = 0; k < 500; ++k)
                      {
                        v27 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", arc4random() % 0x78);
                        objc_msgSend(v29, "addObject:", v27);
                        objc_storeStrong(&v27, 0);
                      }
                      v40[0] = CFSTR("status");
                      v41[0] = CFSTR("OK");
                      v40[1] = CFSTR("data");
                      v41[1] = v29;
                      v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
                      v35 = 1;
                      objc_storeStrong(&v29, 0);
                    }
                    else
                    {
                      v38[0] = CFSTR("status");
                      v39[0] = CFSTR("executionError");
                      v38[1] = CFSTR("error");
                      v39[1] = CFSTR("Execution error");
                      v37 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
                      v35 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  return v37;
}

- (id)getFeature:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  id obj;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[3];
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  v7 = (id)objc_msgSend(location[0], "getAMSRequest");
  v14 = (id)objc_msgSend(v15, "enqueueEvent:");

  v13 = 0;
  obj = 0;
  v8 = (id)objc_msgSend(v14, "resultWithError:", &obj);
  objc_storeStrong(&v13, obj);
  v12 = v8;
  if (v13)
  {
    v22[0] = CFSTR("status");
    v23[0] = CFSTR("executionError");
    v22[1] = CFSTR("error");
    v6 = (id)objc_msgSend(v13, "localizedDescription");
    v23[1] = v6;
    v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);

    v10 = 1;
  }
  else
  {
    v5 = (id)objc_msgSend(v12, "data");
    v4 = (id)objc_msgSend(v5, "objectForKey:", CFSTR("response"));
    v9 = (id)objc_msgSend(v4, "objectForKey:", CFSTR("featureData"));

    if (v9)
    {
      v18[0] = CFSTR("status");
      v19[0] = CFSTR("OK");
      v18[1] = CFSTR("data");
      v19[1] = v9;
      v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    }
    else
    {
      v20[0] = CFSTR("status");
      v21[0] = CFSTR("executionError");
      v20[1] = CFSTR("error");
      v21[1] = CFSTR("Null feature response");
      v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    }
    v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (void)clearDataForDSID:(id)a3 completion:(id)a4
{
  AMDClientRequestEvent *v4;
  void (**v5)(id, _QWORD);
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  os_log_t oslog;
  __CFString *v13;
  id v14;
  int v15;
  os_log_type_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[3];
  uint8_t v26[16];
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v23 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  v4 = [AMDClientRequestEvent alloc];
  v22 = -[AMDClientRequestEvent initClearUserDataFor:inDomain:](v4, "initClearUserDataFor:inDomain:", location[0], CFSTR("apps"));
  v10 = (id)objc_msgSend(v22, "getAMSRequest");
  v21 = (id)objc_msgSend(v23, "enqueueEvent:");

  v20 = 0;
  v18 = 0;
  v11 = (id)objc_msgSend(v21, "resultWithError:", &v18);
  objc_storeStrong(&v20, v18);
  v19 = v11;
  if (v20)
  {
    v17 = MEMORY[0x1E0C81028];
    v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      v8 = (id)objc_msgSend(v20, "localizedDescription");
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v8);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v17, v16, "Error clearing user data: %@", v27, 0xCu);

    }
    objc_storeStrong(&v17, 0);
    (*((void (**)(id, _QWORD, id))v24 + 2))(v24, 0, v20);
    v15 = 1;
  }
  else
  {
    v7 = (id)objc_msgSend(v19, "data");
    v14 = (id)objc_msgSend(v7, "objectForKey:", CFSTR("response"));

    if (v14)
    {
      NSLog(CFSTR("Clear user data summary: %@"), v14);
      (*((void (**)(id, uint64_t, _QWORD))v24 + 2))(v24, 1, 0);
      v15 = 0;
    }
    else
    {
      v13 = CFSTR("Nil clear user data response");
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v13);
        _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v5 = (void (**)(id, _QWORD))v24;
      v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v13);
      v5[2](v5, 0);

      v15 = 1;
      objc_storeStrong((id *)&v13, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)getAppSegmentDataWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)appSegmentData:(id)a3 completion:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)fetchAppSegments:(id)a3 completion:(id)a4
{
  AMDAppSegmentInfo *v4;
  AMDFetchAppSegmentsResponse *v5;
  void *v6;
  id v7;
  id v8;
  AMDAppSegmentInfo *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  void (**v16)(id, _QWORD);
  id v17;
  void (**v18)(id, _QWORD);
  id v19;
  void (**v20)(id, _QWORD);
  id v21;
  id v22;
  NSObject *log;
  os_log_type_t v24;
  id v25;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD __b[8];
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  int v38;
  id v39;
  os_log_type_t type;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id location[3];
  _BYTE v49[128];
  uint8_t v50[24];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = 0;
  objc_storeStrong(&v47, a4);
  v46 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  v27 = (id)objc_msgSend(location[0], "getAMSRequest");
  v45 = (id)objc_msgSend(v46, "enqueueEvent:");

  v44 = 0;
  v42 = 0;
  v28 = (id)objc_msgSend(v45, "resultWithError:", &v42);
  objc_storeStrong(&v44, v42);
  v43 = v28;
  if (v44)
  {
    v41 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
    {
      log = v41;
      v24 = type;
      v25 = (id)objc_msgSend(v44, "localizedDescription");
      v39 = v25;
      __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v39);
      _os_log_error_impl(&dword_1DC678000, log, v24, "error retrieving segment data: %@", v50, 0xCu);

      objc_storeStrong(&v39, 0);
    }
    objc_storeStrong(&v41, 0);
    (*((void (**)(id, _QWORD, id))v47 + 2))(v47, 0, v44);
    v38 = 1;
  }
  else
  {
    v22 = (id)objc_msgSend(v43, "data");
    v37 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("response"));

    if (v37)
    {
      v36 = (id)objc_msgSend(v37, "objectForKey:", CFSTR("segmentDataType"));
      if (v36 && !objc_msgSend(v36, "unsignedIntValue"))
      {
        v35 = (id)objc_msgSend(v37, "objectForKey:", CFSTR("segmentData"));
        if (v35)
        {
          v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
          memset(__b, 0, sizeof(__b));
          v14 = v35;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
          if (v15)
          {
            v11 = *(_QWORD *)__b[2];
            v12 = 0;
            v13 = v15;
            while (1)
            {
              v10 = v12;
              if (*(_QWORD *)__b[2] != v11)
                objc_enumerationMutation(v14);
              v33 = *(_QWORD *)(__b[1] + 8 * v12);
              v6 = (void *)MEMORY[0x1E0C99E60];
              v7 = (id)objc_msgSend(v35, "objectForKey:", v33);
              v31 = (id)objc_msgSend(v6, "setWithArray:");

              v8 = v34;
              v4 = [AMDAppSegmentInfo alloc];
              v9 = -[AMDAppSegmentInfo initWithAppIdentifier:andSegments:](v4, "initWithAppIdentifier:andSegments:", v33, v31);
              objc_msgSend(v8, "addObject:");

              objc_storeStrong(&v31, 0);
              ++v12;
              if (v10 + 1 >= v13)
              {
                v12 = 0;
                v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
                if (!v13)
                  break;
              }
            }
          }

          v30 = (id)objc_msgSend(v37, "objectForKey:", CFSTR("metadata"));
          v5 = [AMDFetchAppSegmentsResponse alloc];
          v29 = -[AMDFetchAppSegmentsResponse initWithSegmentInfo:ofType:andMetaData:](v5, "initWithSegmentInfo:ofType:andMetaData:", v34, v36, v30);
          (*((void (**)(id, uint64_t))v47 + 2))(v47, v29);
          objc_storeStrong((id *)&v29, 0);
          objc_storeStrong(&v30, 0);
          objc_storeStrong(&v34, 0);
          v38 = 0;
        }
        else
        {
          v16 = (void (**)(id, _QWORD))v47;
          v17 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, CFSTR("Null response data"));
          v16[2](v16, 0);

          v38 = 1;
        }
        objc_storeStrong(&v35, 0);
      }
      else
      {
        v18 = (void (**)(id, _QWORD))v47;
        v19 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, CFSTR("Unexpected response type"));
        v18[2](v18, 0);

        v38 = 1;
      }
      objc_storeStrong(&v36, 0);
    }
    else
    {
      v20 = (void (**)(id, _QWORD))v47;
      v21 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, CFSTR("Null segment response"));
      v20[2](v20, 0);

      v38 = 1;
    }
    objc_storeStrong(&v37, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

- (void)iaeSegmentNotificationHandler:(id)a3
{
  NSString *v3;
  id v4;
  AMDAppSegmentInfo *v5;
  AMDFetchAppSegmentsResponse *v6;
  void (**v7)(id, uint64_t);
  void *v8;
  id v9;
  id v10;
  AMDAppSegmentInfo *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void (**v19)(id, _QWORD);
  id v20;
  void (**v21)(id, _QWORD);
  void *v22;
  NSString *v23;
  int v24;
  id v25;
  void (**v26)(id, _QWORD);
  BOOL v27;
  id v28;
  void (**v29)(id, _QWORD);
  BOOL v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD __b[8];
  uint64_t v35;
  id v36;
  id v37;
  os_log_type_t v38;
  os_log_t v39;
  id v40;
  id v41;
  os_log_type_t v42;
  os_log_t v43;
  id v44;
  char v45;
  id v46;
  id v47;
  os_log_type_t v48;
  os_log_t v49;
  __CFString *v50;
  os_log_type_t v51;
  os_log_t v52;
  __CFString *v53;
  os_log_type_t type;
  os_log_t oslog;
  id v56;
  id v57;
  id location[2];
  AMDClient *v59;
  _BYTE v60[128];
  uint8_t v61[16];
  uint8_t v62[16];
  uint8_t v63[16];
  uint8_t v64[16];
  uint8_t v65[24];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = (id)objc_msgSend(location[0], "name");
  v56 = (id)objc_msgSend(location[0], "userInfo");
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v65, (uint64_t)v57, (uint64_t)v56);
    _os_log_debug_impl(&dword_1DC678000, oslog, type, "IAE segment notification: name: %@ userInfo: %@", v65, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = -[AMDClient dsId](v59, "dsId");
  v30 = v3 != 0;

  if (!v30)
  {
    v53 = CFSTR("Programmer error: no dsId, dropping IAE segments notification");
    v52 = (os_log_t)MEMORY[0x1E0C81028];
    v51 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v53);
      _os_log_debug_impl(&dword_1DC678000, v52, v51, "%@", v64, 0xCu);
    }
    objc_storeStrong((id *)&v52, 0);
    v29 = (void (**)(id, _QWORD))-[AMDClient callback](v59, "callback");
    v28 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 28, v53);
    v29[2](v29, 0);

    objc_storeStrong((id *)&v53, 0);
  }
  v4 = -[AMDClient callback](v59, "callback");
  v27 = v4 != 0;

  if (!v27)
  {
    v50 = CFSTR("Programmer error: no callback, dropping IAE segments notification");
    v49 = (os_log_t)MEMORY[0x1E0C81028];
    v48 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v50);
      _os_log_debug_impl(&dword_1DC678000, v49, v48, "%@", v63, 0xCu);
    }
    objc_storeStrong((id *)&v49, 0);
    v26 = (void (**)(id, _QWORD))-[AMDClient callback](v59, "callback");
    v25 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 28, v50);
    v26[2](v26, 0);

    objc_storeStrong((id *)&v50, 0);
  }
  v47 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("dsId"));
  v45 = 0;
  LOBYTE(v24) = 1;
  if (v47)
  {
    v46 = -[AMDClient dsId](v59, "dsId");
    v45 = 1;
    v24 = objc_msgSend(v47, "isEqualToString:") ^ 1;
  }
  if ((v45 & 1) != 0)

  if ((v24 & 1) != 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = -[AMDClient dsId](v59, "dsId");
    v44 = (id)objc_msgSend(v22, "stringWithFormat:", CFSTR("Programmer error: dsId mismatch: payload: %@, expected: %@"), v47, v23);

    v43 = (os_log_t)MEMORY[0x1E0C81028];
    v42 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v44);
      _os_log_debug_impl(&dword_1DC678000, v43, v42, "%@", v62, 0xCu);
    }
    objc_storeStrong((id *)&v43, 0);
    v21 = (void (**)(id, _QWORD))-[AMDClient callback](v59, "callback");
    v20 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 28, v44);
    v21[2](v21, 0);

    objc_storeStrong(&v44, 0);
  }
  v41 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("segmentDataType"));
  if (!v41 || objc_msgSend(v41, "unsignedIntValue"))
  {
    v40 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Programmer error: Unexpected response type in IAE segments notification: %@"), v41);
    v39 = (os_log_t)MEMORY[0x1E0C81028];
    v38 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v40);
      _os_log_debug_impl(&dword_1DC678000, v39, v38, "%@", v61, 0xCu);
    }
    objc_storeStrong((id *)&v39, 0);
    v19 = (void (**)(id, _QWORD))-[AMDClient callback](v59, "callback");
    v18 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 28, v40);
    v19[2](v19, 0);

    objc_storeStrong(&v40, 0);
  }
  v37 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("segmentData"));
  v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v37, "count"));
  memset(__b, 0, sizeof(__b));
  v16 = v37;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v60, 16);
  if (v17)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v17;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(v16);
      v35 = *(_QWORD *)(__b[1] + 8 * v14);
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = (id)objc_msgSend(v37, "objectForKey:", v35);
      v33 = (id)objc_msgSend(v8, "setWithArray:");

      v10 = v36;
      v5 = [AMDAppSegmentInfo alloc];
      v11 = -[AMDAppSegmentInfo initWithAppIdentifier:andSegments:](v5, "initWithAppIdentifier:andSegments:", v35, v33);
      objc_msgSend(v10, "addObject:");

      objc_storeStrong(&v33, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v60, 16);
        if (!v15)
          break;
      }
    }
  }

  v32 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("metadata"));
  v6 = [AMDFetchAppSegmentsResponse alloc];
  v31 = -[AMDFetchAppSegmentsResponse initWithSegmentInfo:ofType:andMetaData:](v6, "initWithSegmentInfo:ofType:andMetaData:", v36, v41, v32);
  v7 = (void (**)(id, uint64_t))-[AMDClient callback](v59, "callback");
  v7[2](v7, v31);

  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

- (void)subscribeToSegmentNotificationWithCallback:(id)a3 forAccountDSID:(id)a4
{
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(id *, void *);
  void *v12;
  AMDClient *v13;
  id v14;
  id v15;
  id location[2];
  AMDClient *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  -[AMDClient setDsId:](v17, "setDsId:", v15);
  -[AMDClient setCallback:](v17, "setCallback:", location[0]);
  v14 = (id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v6 = v14;
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __71__AMDClient_subscribeToSegmentNotificationWithCallback_forAccountDSID___block_invoke;
  v12 = &unk_1EA4B5718;
  v13 = v17;
  v4 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.AppleMediaDiscovery.IAESegmentNotification"), 0, v7);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __71__AMDClient_subscribeToSegmentNotificationWithCallback_forAccountDSID___block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "iaeSegmentNotificationHandler:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)unsubscribeFromSegmentNotification
{
  id v2[2];
  AMDClient *v3;

  v3 = self;
  v2[1] = (id)a2;
  v2[0] = (id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  objc_msgSend(v2[0], "removeObserver:name:object:", v3, CFSTR("com.apple.AppleMediaDiscovery.IAESegmentNotification"));
  objc_storeStrong(v2, 0);
}

- (void)callIAESegmentNotificationHandler
{
  id v2[2];
  AMDClient *v3;

  v3 = self;
  v2[1] = (id)a2;
  v2[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("com.apple.AppleMediaDiscovery.IAESegmentNotification"));
  -[AMDClient iaeSegmentNotificationHandler:](v3, "iaeSegmentNotificationHandler:", v2[0]);
  objc_storeStrong(v2, 0);
}

- (id)getModelPath:(id)a3 error:(id *)a4
{
  AMDClientRequestEvent *v4;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  id *v14;
  id location[3];
  id v16;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  if (location[0])
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
    v4 = [AMDClientRequestEvent alloc];
    v11 = -[AMDClientRequestEvent initModelPathRequestForUsecaseId:andModelId:withTreatmentId:inDomain:](v4, "initModelPathRequestForUsecaseId:andModelId:withTreatmentId:inDomain:", 0, location[0], 0);
    v7 = (id)objc_msgSend(v11, "getAMSRequest");
    v10 = (id)objc_msgSend(v12, "enqueueEvent:");

    v9 = (id)objc_msgSend(v10, "resultWithError:", v14);
    if (!*v14 && v9)
    {
      v6 = (id)objc_msgSend(v9, "data");
      v16 = (id)objc_msgSend(v6, "objectForKey:", CFSTR("response"));

      v13 = 1;
    }
    else
    {
      v16 = 0;
      v13 = 1;
    }
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    *v14 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("Nil modelId passed"));
    v16 = 0;
    v13 = 1;
  }
  objc_storeStrong(location, 0);
  return v16;
}

- (id)getModelPathForUsecase:(id)a3 withTreatmentId:(id)a4 inDomain:(id)a5 error:(id *)a6
{
  AMDClientRequestEvent *v6;
  id v8;
  id v9;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  id *v18;
  id v19;
  id v20;
  id location[3];
  id v22;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = a6;
  if (location[0])
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
    v6 = [AMDClientRequestEvent alloc];
    v15 = -[AMDClientRequestEvent initModelPathRequestForUsecaseId:andModelId:withTreatmentId:inDomain:](v6, "initModelPathRequestForUsecaseId:andModelId:withTreatmentId:inDomain:", location[0], 0, v20, v19);
    v9 = (id)objc_msgSend(v15, "getAMSRequest");
    v14 = (id)objc_msgSend(v16, "enqueueEvent:");

    v13 = (id)objc_msgSend(v14, "resultWithError:", v18);
    if (!*v18 && v13)
    {
      v8 = (id)objc_msgSend(v13, "data");
      v22 = (id)objc_msgSend(v8, "objectForKey:", CFSTR("response"));

      v17 = 1;
    }
    else
    {
      v22 = 0;
      v17 = 1;
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    *v18 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("Nil usecaseId passed"));
    v22 = 0;
    v17 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v22;
}

- (id)getMusicModelPathForUsecase:(id)a3 withTreatmentId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id location[2];
  AMDClient *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = -[AMDClient getModelPathForUsecase:withTreatmentId:inDomain:error:](v11, "getModelPathForUsecase:withTreatmentId:inDomain:error:", location[0], v9, CFSTR("music"), a5);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)sendPIRData:(id)a3 forKeyword:(id)a4 withCallHandle:(id)a5 andRequestError:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  id v14;
  id v15;
  AMDClientRequestEvent *v16;
  id v17;
  AMDClientRequestEvent *v18;
  id v19;
  id v20;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  id *v32;
  id v33;
  id v34;
  id v35;
  id location[3];
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = 0;
  objc_storeStrong(&v34, a5);
  v33 = 0;
  objc_storeStrong(&v33, a6);
  v32 = a7;
  if (!location[0] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v35)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v34)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v33 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v30 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
              v29 = 0;
              if (location[0])
              {
                v18 = [AMDClientRequestEvent alloc];
                v40[0] = v35;
                v20 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40);
                v39 = location[0];
                v19 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
                v7 = -[AMDClientRequestEvent initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:](v18, "initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:", v20);
                v8 = v29;
                v29 = v7;

              }
              else
              {
                v16 = [AMDClientRequestEvent alloc];
                v38 = v35;
                v17 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
                v9 = -[AMDClientRequestEvent initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:](v16, "initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:", 0);
                v10 = v29;
                v29 = v9;

              }
              v15 = (id)objc_msgSend(v29, "getAMSRequestForCipherML");
              v28 = (id)objc_msgSend(v30, "enqueueEvent:");

              v27 = (id)objc_msgSend(v28, "resultWithError:", v32);
              if (*v32)
              {
                v37 = 0;
                v31 = 1;
              }
              else if (v27)
              {
                v13 = (id)objc_msgSend(v27, "data");
                v26 = (id)objc_msgSend(v13, "objectForKey:", CFSTR("response"));

                v14 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("frameworkError"));
                if (v14)
                {
                  v25 = (id)objc_msgSend(v26, "objectForKey:", CFSTR("frameworkError"));
                  v11 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, v25);
                  *v32 = v11;
                  v37 = 0;
                  v31 = 1;
                  objc_storeStrong(&v25, 0);
                }
                else
                {
                  v37 = v26;
                  v31 = 1;
                }
                objc_storeStrong(&v26, 0);
              }
              else
              {
                *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("Nil result obtained from PIR call to AMD"));
                v37 = 0;
                v31 = 1;
              }
              objc_storeStrong(&v27, 0);
              objc_storeStrong(&v28, 0);
              objc_storeStrong(&v29, 0);
              objc_storeStrong(&v30, 0);
            }
            else
            {
              *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("requestError not an instance of NSError"));
              v37 = 0;
              v31 = 1;
            }
          }
          else
          {
            *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle not an instance of NSString"));
            v37 = 0;
            v31 = 1;
          }
        }
        else
        {
          *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle cannot be nil"));
          v37 = 0;
          v31 = 1;
        }
      }
      else
      {
        *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("keyword not an instance of NSData"));
        v37 = 0;
        v31 = 1;
      }
    }
    else
    {
      *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("keyword cannot be nil"));
      v37 = 0;
      v31 = 1;
    }
  }
  else
  {
    *v32 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("PIRData not an instance of NSData"));
    v37 = 0;
    v31 = 1;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  return v37;
}

- (id)sendBatchedPIRData:(id)a3 forKeywords:(id)a4 withCallHandle:(id)a5 andRequestError:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  AMDClientRequestEvent *v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  int i;
  id v37;
  id v38;
  id v39;
  int v40;
  id *v41;
  id v42;
  id v43;
  id v44;
  id location[3];
  id v46;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = 0;
  objc_storeStrong(&v44, a4);
  v43 = 0;
  objc_storeStrong(&v43, a5);
  v42 = 0;
  objc_storeStrong(&v42, a6);
  v41 = a7;
  if (!location[0] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!v44)
    {
      *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("keywordArray cannot be nil"));
      v46 = 0;
      v40 = 1;
      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("keywordArray not an instance of NSArray"));
      v46 = 0;
      v40 = 1;
      goto LABEL_38;
    }
    if (!v43)
    {
      *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle cannot be nil"));
      v46 = 0;
      v40 = 1;
      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle not an instance of NSString"));
      v46 = 0;
      v40 = 1;
      goto LABEL_38;
    }
    if (v42)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("requestError not an instance of NSError"));
        v46 = 0;
        v40 = 1;
        goto LABEL_38;
      }
    }
    v39 = 0;
    v38 = 0;
    v37 = 0;
    if (location[0])
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = v39;
      v39 = v7;

      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = v38;
      v38 = v9;

      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = v37;
      v37 = v11;

      v22 = objc_msgSend(location[0], "count");
      if (v22 != objc_msgSend(v44, "count"))
      {
        *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("Unequal number of keywords and PIR responses"));
        v46 = 0;
        v40 = 1;
LABEL_37:
        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v39, 0);
        goto LABEL_38;
      }
      for (i = 0; ; ++i)
      {
        v21 = i;
        if (v21 >= objc_msgSend(location[0], "count"))
          break;
        v35 = (id)objc_msgSend(location[0], "objectAtIndex:", i);
        v34 = (id)objc_msgSend(v44, "objectAtIndex:", i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v39, "addObject:", v34);
          v40 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = v35;
            objc_msgSend(v38, "addObject:", v34);
            objc_msgSend(v37, "addObject:", v33);
            objc_storeStrong(&v33, 0);
            v40 = 0;
          }
          else
          {
            v13 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("NSObject enqueued to AMDClient needs to be of type NSNull or NSData"));
            *v41 = v13;
            v46 = 0;
            v40 = 1;
          }
        }
        objc_storeStrong(&v34, 0);
        objc_storeStrong(&v35, 0);
        if (v40 && v40 != 4)
          goto LABEL_37;
      }
    }
    v32 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
    v14 = [AMDClientRequestEvent alloc];
    v31 = -[AMDClientRequestEvent initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:](v14, "initPIRResponseForKeywordArray:withDataArray:withMissingKeywords:requestError:andCallHandle:", v38, v37, v39, v42, v43);
    v20 = (id)objc_msgSend(v31, "getAMSRequestForCipherML");
    v30 = (id)objc_msgSend(v32, "enqueueEvent:");

    v29 = (id)objc_msgSend(v30, "resultWithError:", v41);
    if (*v41)
    {
      v46 = 0;
      v40 = 1;
    }
    else if (v29)
    {
      v18 = (id)objc_msgSend(v29, "data");
      v28 = (id)objc_msgSend(v18, "objectForKey:", CFSTR("response"));

      v19 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("frameworkError"));
      if (v19)
      {
        v27 = (id)objc_msgSend(v28, "objectForKey:", CFSTR("frameworkError"));
        v16 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, v27);
        *v41 = v16;
        v46 = 0;
        v40 = 1;
        objc_storeStrong(&v27, 0);
      }
      else
      {
        v46 = v28;
        v40 = 1;
      }
      objc_storeStrong(&v28, 0);
    }
    else
    {
      v15 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("Nil result obtained from PIR call to AMD"));
      *v41 = v15;
      v46 = 0;
      v40 = 1;
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    goto LABEL_37;
  }
  *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("PIRDataArray not an instance of NSArray"));
  v46 = 0;
  v40 = 1;
LABEL_38:
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  return v46;
}

- (id)sendPECSimilarityScores:(id)a3 withCallHandle:(id)a4 andRequestError:(id)a5 error:(id *)a6
{
  void *v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int v25;
  id *v26;
  id v27;
  id v28;
  id location[3];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = a6;
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v24 = +[AMDMiscHelpers extractPECSimilarityScores:error:](AMDMiscHelpers, "extractPECSimilarityScores:error:", location[0], v26);
        if (*v26)
        {
          v30 = 0;
          v25 = 1;
        }
        else
        {
          v23 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
          v22 = [AMDClientRequestEvent alloc];
          v12 = v22;
          v31[0] = v24;
          v13 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
          v6 = (void *)objc_msgSend(v12, "initPECResponseForSimilarityScores:requestError:andCallHandle:");
          v7 = v22;
          v22 = v6;

          v14 = (id)objc_msgSend(v22, "getAMSRequestForCipherML");
          v21 = (id)objc_msgSend(v23, "enqueueEvent:");

          v20 = (id)objc_msgSend(v21, "resultWithError:", v26);
          if (*v26)
          {
            v30 = 0;
            v25 = 1;
          }
          else if (v20)
          {
            v10 = (id)objc_msgSend(v20, "data");
            v19 = (id)objc_msgSend(v10, "objectForKey:", CFSTR("response"));

            v11 = (id)objc_msgSend(v19, "objectForKey:", CFSTR("frameworkError"));
            if (v11)
            {
              v18 = (id)objc_msgSend(v19, "objectForKey:", CFSTR("frameworkError"));
              v8 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, v18);
              *v26 = v8;
              v30 = 0;
              v25 = 1;
              objc_storeStrong(&v18, 0);
            }
            else
            {
              v30 = v19;
              v25 = 1;
            }
            objc_storeStrong(&v19, 0);
          }
          else
          {
            *v26 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("Nil result obtained from PIR call to AMD"));
            v30 = 0;
            v25 = 1;
          }
          objc_storeStrong(&v20, 0);
          objc_storeStrong(&v21, 0);
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v23, 0);
        }
        objc_storeStrong(&v24, 0);
      }
      else
      {
        *v26 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("requestError not an instance of NSError"));
        v30 = 0;
        v25 = 1;
      }
    }
    else
    {
      *v26 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle not an instance of NSString"));
      v30 = 0;
      v25 = 1;
    }
  }
  else
  {
    *v26 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle cannot be nil"));
    v30 = 0;
    v25 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v30;
}

- (id)sendBatchedPECSimilarityScores:(id)a3 withCallHandle:(id)a4 andRequestError:(id)a5 error:(id *)a6
{
  id v6;
  id v7;
  AMDClientRequestEvent *v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD __b[8];
  uint64_t v32;
  id v33;
  int v34;
  id *v35;
  id v36;
  id v37;
  id location[3];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = 0;
  objc_storeStrong(&v36, a5);
  v35 = a6;
  if (v37)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *v35 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle not an instance of NSString"));
      v39 = 0;
      v34 = 1;
      goto LABEL_33;
    }
    if (v36)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *v35 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("requestError not an instance of NSError"));
        v39 = 0;
        v34 = 1;
        goto LABEL_33;
      }
    }
    v33 = 0;
    if (location[0])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *v35 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("batchedSimilarityScoresArray not an instance of NSArray"));
        v39 = 0;
        v34 = 1;
LABEL_32:
        objc_storeStrong(&v33, 0);
        goto LABEL_33;
      }
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = v33;
      v33 = v6;

      memset(__b, 0, sizeof(__b));
      v19 = location[0];
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
      if (v20)
      {
        v16 = *(_QWORD *)__b[2];
        v17 = 0;
        v18 = v20;
        while (1)
        {
          v15 = v17;
          if (*(_QWORD *)__b[2] != v16)
            objc_enumerationMutation(v19);
          v32 = *(_QWORD *)(__b[1] + 8 * v17);
          v30 = +[AMDMiscHelpers extractPECSimilarityScores:error:](AMDMiscHelpers, "extractPECSimilarityScores:error:", v32, v35);
          if (*v35)
          {
            v39 = 0;
            v34 = 1;
          }
          else
          {
            objc_msgSend(v33, "addObject:", v30);
            v34 = 0;
          }
          objc_storeStrong(&v30, 0);
          if (v34)
            break;
          ++v17;
          if (v15 + 1 >= v18)
          {
            v17 = 0;
            v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
            if (!v18)
              goto LABEL_21;
          }
        }
      }
      else
      {
LABEL_21:
        v34 = 0;
      }

      if (v34)
        goto LABEL_32;
    }
    v29 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
    v8 = [AMDClientRequestEvent alloc];
    v28 = -[AMDClientRequestEvent initPECResponseForSimilarityScores:requestError:andCallHandle:](v8, "initPECResponseForSimilarityScores:requestError:andCallHandle:", v33, v36, v37);
    v14 = (id)objc_msgSend(v28, "getAMSRequestForCipherML");
    v27 = (id)objc_msgSend(v29, "enqueueEvent:");

    v26 = (id)objc_msgSend(v27, "resultWithError:", v35);
    if (*v35)
    {
      v39 = 0;
      v34 = 1;
    }
    else if (v26)
    {
      v12 = (id)objc_msgSend(v26, "data");
      v25 = (id)objc_msgSend(v12, "objectForKey:", CFSTR("response"));

      v13 = (id)objc_msgSend(v25, "objectForKey:", CFSTR("frameworkError"));
      if (v13)
      {
        v24 = (id)objc_msgSend(v25, "objectForKey:", CFSTR("frameworkError"));
        v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, v24);
        *v35 = v10;
        v39 = 0;
        v34 = 1;
        objc_storeStrong(&v24, 0);
      }
      else
      {
        v39 = v25;
        v34 = 1;
      }
      objc_storeStrong(&v25, 0);
    }
    else
    {
      v9 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("Nil result obtained from PIR call to AMD"));
      *v35 = v9;
      v39 = 0;
      v34 = 1;
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    goto LABEL_32;
  }
  *v35 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("callHandle cannot be nil"));
  v39 = 0;
  v34 = 1;
LABEL_33:
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v39;
}

- (id)sendPIRData:(id)a3 forKeyword:(id)a4 withCallHandle:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  *a6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 18, CFSTR("Deprecated method"));
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)dsId
{
  return self->_dsId;
}

- (void)setDsId:(id)a3
{
  objc_storeStrong((id *)&self->_dsId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsId, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
