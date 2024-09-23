@implementation AMDModelDownloader

- (int)getVersionForModel:(id)a3
{
  id v4;
  id v5;
  int v6;
  id obj;
  id v8;
  id v9;
  id location[3];
  int v11;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  obj = 0;
  v4 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", location[0], &obj);
  objc_storeStrong(&v9, obj);
  v8 = v4;
  if (!v9 && v8)
  {
    v5 = (id)objc_msgSend(v8, "objectForKey:", 0x1EA4B7368);
    v11 = objc_msgSend(v5, "intValue");
    v6 = 1;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v11 = -1;
    v6 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)downloadModel:(id)a3 forVersion:(id)a4 usingUrl:(id)a5 withStorefrontId:(id)a6 andSkipDecision:(BOOL *)a7 error:(id *)a8
{
  dispatch_time_t v8;
  id v9;
  NSObject *group;
  id v12;
  id v13;
  int v19;
  id v20;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(uint64_t, void *, void *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29[3];
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int v36;
  int v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  int v43;
  int v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  uint64_t v47;
  int v48;
  id *v49;
  BOOL *v50;
  id v51;
  id v52;
  id v53;
  id location[2];
  AMDModelDownloader *v55;
  id v56;

  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = 0;
  objc_storeStrong(&v53, a4);
  v52 = 0;
  objc_storeStrong(&v52, a5);
  v51 = 0;
  objc_storeStrong(&v51, a6);
  v50 = a7;
  v49 = a8;
  *a7 = 0;
  v19 = -[AMDModelDownloader getVersionForModel:](v55, "getVersionForModel:", location[0]);
  if (v19 == objc_msgSend(v53, "intValue"))
  {
    *v50 = 1;
    v56 = 0;
    v48 = 1;
  }
  else
  {
    v41 = 0;
    v42 = &v41;
    v43 = 838860800;
    v44 = 48;
    v45 = __Block_byref_object_copy__6;
    v46 = __Block_byref_object_dispose__6;
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v34 = 0;
    v35 = &v34;
    v36 = 838860800;
    v37 = 48;
    v38 = __Block_byref_object_copy__6;
    v39 = __Block_byref_object_dispose__6;
    v40 = 0;
    v33 = dispatch_group_create();
    v32 = (id)objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v31 = (id)objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v32, 0);
    v13 = v31;
    v12 = v52;
    v21 = MEMORY[0x1E0C809B0];
    v22 = -1073741824;
    v23 = 0;
    v24 = __95__AMDModelDownloader_downloadModel_forVersion_usingUrl_withStorefrontId_andSkipDecision_error___block_invoke;
    v25 = &unk_1EA4B58A8;
    v29[1] = &v34;
    v26 = location[0];
    v27 = v53;
    v28 = v51;
    v29[2] = &v41;
    v29[0] = v33;
    v30 = (id)objc_msgSend(v13, "downloadTaskWithURL:completionHandler:", v12, &v21);
    v20 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model_download_%@"), location[0]);
    +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", v20);
    dispatch_group_enter((dispatch_group_t)v33);
    objc_msgSend(v30, "resume");
    group = v33;
    v8 = dispatch_time(0, 120000000000);
    dispatch_group_wait(group, v8);
    +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", v20);
    if (v35[5])
    {
      v9 = objc_retainAutorelease((id)v35[5]);
      *v49 = v9;
      v56 = 0;
    }
    else
    {
      v56 = (id)v42[5];
    }
    v48 = 1;
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(v29, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    _Block_object_dispose(&v34, 8);
    objc_storeStrong(&v40, 0);
    _Block_object_dispose(&v41, 8);
    objc_storeStrong((id *)&v47, 0);
  }
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  return v56;
}

void __95__AMDModelDownloader_downloadModel_forVersion_usingUrl_withStorefrontId_andSkipDecision_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  int v26;
  char v27;
  uint64_t v28;
  id v29;
  id v30;
  id location[2];
  uint8_t v32[24];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v30 = 0;
  objc_storeStrong(&v30, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = a1;
  v27 = 0;
  if (v29)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v29);
    v26 = 1;
  }
  else if (location[0])
  {
    v25 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("download_callback_%@"), *(_QWORD *)(a1 + 32));
    +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", v25);
    v24 = -[AMDBaseRecoModel initWithId:andVersion:]([AMDBaseRecoModel alloc], "initWithId:andVersion:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
    v23 = +[AMDModelDownloader parseModelWithId:withStorefrontId:fromArchive:withBaseRecoModel:](AMDModelDownloader, "parseModelWithId:withStorefrontId:fromArchive:withBaseRecoModel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), location[0], v24);
    +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", v25);
    memset(__b, 0, sizeof(__b));
    v13 = v23;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v13);
        v22 = *(_QWORD *)(__b[1] + 8 * v11);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v7 = (id)objc_msgSend(v23, "objectForKey:", v22);
        objc_msgSend(v8, "setObject:forKey:");

        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
          if (!v12)
            break;
        }
      }
    }

    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v32, *(_QWORD *)(a1 + 32));
      _os_log_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_DEFAULT, "successfully downloaded and parsed model %@", v32, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("modelId"));
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    v26 = 0;
  }
  else
  {
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to download data for model %@"), *(_QWORD *)(a1 + 32));
    v16 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v16;

    v26 = 1;
  }
  v6 = v26;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  if ((v27 & 1) != 0)
    objc_exception_rethrow();
  v26 = v6;
  if (!v6)
    v26 = 0;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)printJson:(id)a3
{
  id v3;
  id v4;
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v5);
  v3 = (id)objc_msgSend(v4, "dataTaskWithURL:completionHandler:", location[0], &__block_literal_global_5);
  objc_msgSend(v3, "resume");
  while (!objc_msgSend(v3, "state"))
    NSLog(CFSTR("%ld"), objc_msgSend(v3, "state"));
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

void __32__AMDModelDownloader_printJson___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  NSLog(CFSTR("%@"), location[0]);
  NSLog(CFSTR("task done"));
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

+ (id)parseModelWithId:(id)a3 withStorefrontId:(id)a4 fromArchive:(id)a5 withBaseRecoModel:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v10;
  int v11;
  id v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  int v16;
  char v17;
  __int16 v18;
  char v19;
  __int16 v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int16 v27;
  char v28;
  id v29;
  int v30;
  char v31;
  AMDByteBuffer *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v43;
  id v44;
  os_log_type_t v45;
  os_log_t v46;
  id v47;
  os_log_type_t v48;
  os_log_t v49;
  os_log_type_t v50;
  os_log_t v51;
  id v52;
  int v53;
  id v54;
  BOOL v55;
  id v56;
  __int16 v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  id v62;
  os_log_type_t v63;
  os_log_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  os_log_type_t v69;
  os_log_t v70;
  id v71;
  id v72;
  id v73;
  __int16 v74;
  id v75;
  int v76;
  os_log_type_t v77;
  os_log_t v78;
  id v79;
  char v80;
  id v81;
  os_log_type_t type;
  os_log_t oslog;
  unint64_t v84;
  id v85;
  id v86;
  char v87;
  id v88;
  id v89;
  id v90;
  id v91;
  char v92;
  id v93;
  id v94;
  id v95;
  id location[2];
  id v97;
  id v98;
  uint8_t v99[16];
  uint8_t v100[16];
  uint8_t v101[16];
  uint8_t v102[32];
  uint8_t v103[16];
  uint8_t v104[32];
  uint8_t v105[24];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v97 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v95 = 0;
  objc_storeStrong(&v95, a4);
  v94 = 0;
  objc_storeStrong(&v94, a5);
  v93 = 0;
  objc_storeStrong(&v93, a6);
  v92 = 0;
  v91 = 0;
  v90 = 0;
  v89 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v88 = 0;
  v87 = 0;
  +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("parseModelStart"));
  v39 = (id)objc_msgSend(v94, "path");
  v85 = 0;
  v38 = (id)objc_msgSend(v89, "attributesOfItemAtPath:error:");
  objc_storeStrong(&v90, 0);
  v86 = v38;

  v84 = 0;
  v36 = (id)objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
  v37 = objc_msgSend(v36, "unsignedLongLongValue");

  v84 = v37;
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v105, (uint64_t)v94, COERCE__INT64((float)((float)v84 / 1048600.0)));
    _os_log_debug_impl(&dword_1DC678000, oslog, type, "Reading model archive from %@, %.3fMB", v105, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v35 = objc_alloc(MEMORY[0x1E0C99DB0]);
  v33 = (id)objc_msgSend(v94, "path");
  v34 = (void *)objc_msgSend(v35, "initWithFileAtPath:");
  v6 = v88;
  v88 = v34;

  objc_msgSend(v88, "open");
  v32 = [AMDByteBuffer alloc];
  v81 = -[AMDByteBuffer initWithInputStream:withFileSize:](v32, "initWithInputStream:withFileSize:", v88, v84);
  v80 = 0;
  v79 = v90;
  v31 = objc_msgSend(v81, "getByteWithError:", &v79);
  objc_storeStrong(&v90, v79);
  v80 = v31;
  if (!v90 && v80 == 1)
  {
    v75 = v90;
    v28 = objc_msgSend(v93, "parseModelInfoFromBuffer:error:", v81, &v75);
    objc_storeStrong(&v90, v75);
    if ((v28 & 1) != 0)
    {
      +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("ParseModelPostModelParse"));
      v74 = 0;
      v73 = v90;
      v27 = objc_msgSend(v81, "getShortWithError:", &v73);
      objc_storeStrong(&v90, v73);
      v74 = v27;
      if (v90)
      {
        v98 = 0;
        v76 = 1;
      }
      else
      {
        v71 = 0;
        v26 = (id)objc_msgSend(v81, "getDataOfLength:error:", v74, &v71);
        objc_storeStrong(&v90, v71);
        v72 = v26;
        if (v90)
        {
          v98 = 0;
          v76 = 1;
        }
        else
        {
          v70 = (os_log_t)MEMORY[0x1E0C81028];
          v69 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            v25 = objc_alloc(MEMORY[0x1E0CB3940]);
            v24 = (id)objc_msgSend(v25, "initWithData:encoding:", v72, 4);
            v68 = v24;
            __os_log_helper_16_2_1_8_64((uint64_t)v103, (uint64_t)v68);
            _os_log_debug_impl(&dword_1DC678000, v70, v69, "Checksum algorithm: %@", v103, 0xCu);

            objc_storeStrong(&v68, 0);
          }
          objc_storeStrong((id *)&v70, 0);
          v66 = v90;
          v23 = (id)objc_msgSend(v81, "getDataOfLength:error:", 32, &v66);
          objc_storeStrong(&v90, v66);
          v67 = v23;
          if (!v90 && v67)
          {
            v21 = location[0];
            v22 = objc_msgSend(v93, "getVersion");
            v65 = +[AMDModelDownloader ensureNewVersionDirURLForModel:withVersion:andCreationTime:](AMDModelDownloader, "ensureNewVersionDirURLForModel:withVersion:andCreationTime:", v21, v22, objc_msgSend(v93, "getAssetCreationTimestamp"));
            if (v65)
            {
              v62 = (id)objc_msgSend(v65, "first");
              v7 = (id)objc_msgSend(v65, "second");
              v8 = v91;
              v91 = v7;

              v61 = 0;
              v60 = 0;
              v59 = v90;
              v20 = objc_msgSend(v81, "getShortWithError:", &v59);
              objc_storeStrong(&v90, v59);
              v60 = v20;
              if (v90)
              {
                v92 = 1;
                v98 = 0;
                v76 = 1;
              }
              else
              {
                v58 = 0;
                while (1)
                {
                  v19 = 0;
                  if (v60 != v58)
                  {
                    v19 = 0;
                    if ((objc_msgSend(v81, "hasRemaining") & 1) != 0)
                      v19 = v92 ^ 1;
                  }
                  if ((v19 & 1) == 0)
                    break;
                  v57 = 0;
                  v56 = v90;
                  v18 = objc_msgSend(v81, "getShortWithError:", &v56);
                  objc_storeStrong(&v90, v56);
                  v57 = v18;
                  if (v90)
                  {
                    v92 = 1;
                    break;
                  }
                  v55 = 0;
                  v54 = 0;
                  v17 = objc_msgSend(v81, "getByteWithError:", &v54);
                  objc_storeStrong(&v90, v54);
                  v55 = v17 == 1;
                  if (v90)
                  {
                    v92 = 1;
                    break;
                  }
                  v53 = 0;
                  v52 = 0;
                  v16 = objc_msgSend(v81, "getIntWithError:", &v52);
                  objc_storeStrong(&v90, v52);
                  v53 = v16;
                  if (v90)
                  {
                    v92 = 1;
                    break;
                  }
                  v15 = (v57 - 1);
                  if (v15 <= 4)
                    __asm { BR              X8 }
                  v51 = (os_log_t)MEMORY[0x1E0C81028];
                  v50 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    v14 = v51;
                    __os_log_helper_16_0_1_4_0((uint64_t)v101, v57);
                    _os_log_error_impl(&dword_1DC678000, v14, v50, "unknown asset type %d", v101, 8u);
                  }
                  objc_storeStrong((id *)&v51, 0);
                  v92 = 1;
                }
                if ((v92 & 1) == 0 && v58 == v60)
                {
                  v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  objc_msgSend(v47, "setValue:forKey:", v62, CFSTR("modelSubdirURL"));
                  objc_msgSend(v47, "setValue:forKey:", v91, CFSTR("newVersionDirURL"));
                  objc_msgSend(v47, "setValue:forKey:", v61, CFSTR("compiledModelDir"));
                  v13 = (id)objc_msgSend(v93, "modelMetadata");
                  v12 = (id)objc_msgSend(v13, "getModelUid");
                  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

                  objc_msgSend(v97, "cleanupDiskForModelDirectory:withSavedVersionURL:", v62, v91);
                  v98 = v47;
                  v76 = 1;
                  objc_storeStrong(&v47, 0);
                }
                else
                {
                  v49 = (os_log_t)MEMORY[0x1E0C81028];
                  v48 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v100, v60, v58);
                    _os_log_error_impl(&dword_1DC678000, v49, v48, "Expecting to save %d assets, found %d", v100, 0xEu);
                  }
                  objc_storeStrong((id *)&v49, 0);
                  v92 = 1;
                  v98 = 0;
                  v76 = 1;
                }
              }
              objc_storeStrong(&v61, 0);
              objc_storeStrong(&v62, 0);
            }
            else
            {
              v64 = (os_log_t)MEMORY[0x1E0C81028];
              v63 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_2_8_64_8_0((uint64_t)v102, (uint64_t)location[0], objc_msgSend(v93, "getVersion"));
                _os_log_error_impl(&dword_1DC678000, v64, v63, "Could not create new subdir for model %@, version %llu", v102, 0x16u);
              }
              objc_storeStrong((id *)&v64, 0);
              v98 = 0;
              v76 = 1;
            }
            objc_storeStrong(&v65, 0);
          }
          else
          {
            v98 = 0;
            v76 = 1;
          }
          objc_storeStrong(&v67, 0);
        }
        objc_storeStrong(&v72, 0);
      }
    }
    else
    {
      v98 = 0;
      v76 = 1;
    }
  }
  else
  {
    v78 = (os_log_t)MEMORY[0x1E0C81028];
    v77 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v30 = v80;
      v29 = (id)objc_msgSend(v90, "localizedDescription");
      __os_log_helper_16_2_3_4_0_4_0_8_64((uint64_t)v104, v30, 1, (uint64_t)v29);
      _os_log_error_impl(&dword_1DC678000, v78, v77, "Archive format version (%d) != ARCHIVE_FORMAT_VERSION (%d), error: %@", v104, 0x18u);

    }
    objc_storeStrong((id *)&v78, 0);
    v98 = 0;
    v76 = 1;
  }
  objc_storeStrong(&v81, 0);
  objc_storeStrong(&v86, 0);
  v11 = v76;
  if (v90)
  {
    v46 = (os_log_t)MEMORY[0x1E0C81028];
    v45 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v10 = (id)objc_msgSend(v90, "localizedDescription");
      v44 = v10;
      __os_log_helper_16_2_1_8_64((uint64_t)v99, (uint64_t)v44);
      _os_log_error_impl(&dword_1DC678000, v46, v45, "%@", v99, 0xCu);

      objc_storeStrong(&v44, 0);
    }
    objc_storeStrong((id *)&v46, 0);
  }
  if (v88)
    objc_msgSend(v88, "close");
  if ((v92 & 1) != 0 && v91)
  {
    v43 = v90;
    objc_msgSend(v89, "removeItemAtURL:error:", v91, &v43);
    objc_storeStrong(&v90, v43);
  }
  if ((v87 & 1) != 0)
    objc_exception_rethrow();
  v76 = v11;
  if (v11 == 3)
  {
    __break(1u);
    JUMPOUT(0x1DC6F5144);
  }
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v91, 0);
  objc_storeStrong(&v93, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong(&v95, 0);
  objc_storeStrong(location, 0);
  return v98;
}

+ (id)saveMapFile:(id)a3 ofSize:(int)a4 isCompressed:(BOOL)a5 inDirURL:(id)a6 fromBuffer:(id)a7
{
  id v8;
  const __CFString *v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v25;
  os_log_t v26;
  char v27;
  id v28;
  os_log_type_t v29;
  os_log_t oslog;
  id v31;
  os_log_type_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  int v37;
  os_log_type_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  BOOL v46;
  int v47;
  id location[3];
  id v49;
  uint8_t v50[16];
  uint8_t v51[32];
  uint8_t v52[16];
  uint8_t v53[24];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = a4;
  v46 = a5;
  v45 = 0;
  objc_storeStrong(&v45, a6);
  v44 = 0;
  objc_storeStrong(&v44, a7);
  v25 = (id)objc_msgSend(v45, "URLByAppendingPathComponent:", location[0]);
  v43 = (id)objc_msgSend(v25, "URLByAppendingPathExtension:", CFSTR("bin"));

  v42 = 0;
  v41 = 0;
  objc_msgSend(v44, "copyDataOfLength:toFile:isCompressed:error:", v47, v43, v46, &v41);
  objc_storeStrong(&v42, v41);
  if (v42)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    v20 = (id)objc_msgSend(v43, "path");
    v19 = (id)objc_msgSend(v42, "localizedDescription");
    v40 = (id)objc_msgSend(v18, "stringWithFormat:", CFSTR("Error saving map file %@: %@"), v20, v19);

    v39 = MEMORY[0x1E0C81028];
    v38 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v40);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v39, v38, "%@", v53, 0xCu);
    }
    objc_storeStrong(&v39, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v40, CFSTR("saveMapFileFail"), 0);
    v49 = 0;
    v37 = 1;
    objc_storeStrong(&v40, 0);
  }
  else
  {
    v17 = (id)objc_msgSend(v45, "path");
    v35 = v42;
    v16 = +[AMDModelAssets loadMapFromDir:andFile:error:](AMDModelAssets, "loadMapFromDir:andFile:error:");
    objc_storeStrong(&v42, v35);
    v36 = v16;

    if (v42)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v15 = (id)objc_msgSend(v43, "path");
      v14 = (id)objc_msgSend(v42, "localizedDescription");
      v34 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("Error reading back map data from file %@: %@"), v15, v14);

      v33 = MEMORY[0x1E0C81028];
      v32 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v34);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v33, v32, "%@", v52, 0xCu);
      }
      objc_storeStrong(&v33, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v34, CFSTR("verifyMapFileFail"), 0);
      objc_storeStrong(&v42, 0);
      v11 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v31 = v42;
      v12 = objc_msgSend(v11, "removeItemAtURL:error:", v43, &v31);
      objc_storeStrong(&v42, v31);

      if ((v12 & 1) == 0)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        v29 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v10 = (id)objc_msgSend(v43, "path");
          v27 = 0;
          if (v42)
          {
            v28 = (id)objc_msgSend(v42, "localizedDescription");
            v27 = 1;
            v9 = (const __CFString *)v28;
          }
          else
          {
            v9 = CFSTR("dont know why");
          }
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v51, (uint64_t)v10, (uint64_t)v9);
          _os_log_error_impl(&dword_1DC678000, oslog, v29, "Error deleting file (for cleamup) %@: %@", v51, 0x16u);
          if ((v27 & 1) != 0)

        }
        objc_storeStrong((id *)&oslog, 0);
      }
      v49 = 0;
      v37 = 1;
      objc_storeStrong(&v34, 0);
    }
    else
    {
      if (v36)
      {
        v26 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v8 = (id)objc_msgSend(v43, "path");
          __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v8);
          _os_log_debug_impl(&dword_1DC678000, v26, OS_LOG_TYPE_DEBUG, "Saved the map file %@", v50, 0xCu);

        }
        objc_storeStrong((id *)&v26, 0);
      }
      v49 = v36;
      v37 = 1;
    }
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v49;
}

+ (id)ensureNewVersionDirURLForModel:(id)a3 withVersion:(unint64_t)a4 andCreationTime:(int64_t)a5
{
  id v6;
  id v7;
  id v8;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int64_t v21;
  unint64_t v22;
  id location[3];
  AMDPair *v24;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = a5;
  v20 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (id)objc_msgSend(v20, "URLsForDirectory:inDomains:", 14, 1);
  v19 = (id)objc_msgSend(v11, "lastObject");

  v18 = (id)objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("reco"));
  v17 = (id)objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("models"));
  v16 = (id)objc_msgSend(v17, "URLByAppendingPathComponent:", location[0]);
  if (+[AMDMiscHelpers ensureDir:removeIfExists:](AMDMiscHelpers, "ensureDir:removeIfExists:", v16, 0))
  {
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
    v14 = (id)objc_msgSend(v6, "stringValue");

    v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v21);
    v13 = (id)objc_msgSend(v7, "stringValue");

    v8 = (id)objc_msgSend(v16, "URLByAppendingPathComponent:", v14);
    v12 = (id)objc_msgSend(v8, "URLByAppendingPathComponent:", v13);

    if (+[AMDMiscHelpers ensureDir:removeIfExists:](AMDMiscHelpers, "ensureDir:removeIfExists:", v12, 1))
    {
      v24 = -[AMDPair initWith:and:]([AMDPair alloc], "initWith:and:", v16, v12);
    }
    else
    {
      v24 = 0;
    }
    v15 = 1;
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v24 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v24;
}

+ (void)cleanupDiskForModelDirectory:(id)a3 withSavedVersionURL:(id)a4
{
  NSObject *v4;
  id v5;
  id v6;
  NSObject *log;
  os_log_type_t v8;
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  os_log_t v22;
  os_log_type_t type;
  os_log_t oslog;
  id v25;
  int v26;
  id v27;
  id v28;
  _QWORD __b[8];
  id v30;
  id v31[2];
  id v32;
  id v33;
  id v34;
  id location[3];
  uint8_t v36[32];
  uint8_t v37[32];
  _BYTE v38[128];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (id)objc_msgSend(v34, "URLByDeletingLastPathComponent");
  v32 = (id)objc_msgSend(v16, "lastPathComponent");

  v31[1] = (id)1;
  v18 = v33;
  v17 = location[0];
  v39[0] = *MEMORY[0x1E0C999D0];
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39);
  v31[0] = (id)objc_msgSend(v18, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v17);

  memset(__b, 0, sizeof(__b));
  v20 = v31[0];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
  if (v21)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v21;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(v20);
      v30 = *(id *)(__b[1] + 8 * v13);
      v28 = 0;
      v27 = (id)objc_msgSend(v30, "lastPathComponent");
      if ((objc_msgSend(v32, "isEqualToString:", v27) & 1) != 0)
      {
        v26 = 3;
      }
      else
      {
        v25 = v28;
        v10 = objc_msgSend(v33, "removeItemAtURL:error:", v30, &v25);
        objc_storeStrong(&v28, v25);
        if ((v10 & 1) != 0)
        {
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            v8 = type;
            v9 = (id)objc_msgSend(v30, "lastPathComponent");
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v9, (uint64_t)v30);
            _os_log_impl(&dword_1DC678000, log, v8, "Deleted directory for version: %@ at %@", v37, 0x16u);

          }
          objc_storeStrong((id *)&oslog, 0);
        }
        else
        {
          v22 = (os_log_t)MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v4 = v22;
            v6 = (id)objc_msgSend(v30, "lastPathComponent");
            v5 = (id)objc_msgSend(v28, "localizedDescription");
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v36, (uint64_t)v6, (uint64_t)v5);
            _os_log_error_impl(&dword_1DC678000, v4, OS_LOG_TYPE_ERROR, "Error deleting directory for version: %@: %@", v36, 0x16u);

          }
          objc_storeStrong((id *)&v22, 0);
        }
        v26 = 0;
      }
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
        if (!v14)
          break;
      }
    }
  }

  objc_storeStrong(v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
}

+ (id)processColdstartBinaryDownload:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id v16;
  id v17;
  id v18;
  id v19;
  os_log_type_t v20;
  os_log_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  os_log_type_t v26;
  os_log_t v27;
  id v28;
  os_log_type_t v29;
  os_log_t oslog;
  id v31;
  id v32;
  id v33;
  id v34;
  os_log_type_t v35;
  id v36;
  os_log_type_t v37;
  id v38;
  id v39;
  int v40;
  os_log_type_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id *v46;
  id location[2];
  id v48;
  id v49;
  uint8_t v50[32];
  uint8_t v51[16];
  uint8_t v52[16];
  uint8_t v53[16];
  uint8_t v54[16];
  uint8_t v55[24];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v48 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v46 = a4;
  v45 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("status"));
  v44 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("modelId"));
  if (v45)
  {
    if (v44)
    {
      if ((objc_msgSend(v45, "isEqualToString:", CFSTR("Failure")) & 1) != 0)
      {
        v36 = MEMORY[0x1E0C81028];
        v35 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v44);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v36, v35, "Coldstart binary download failed for modelId: %@", v53, 0xCu);
        }
        objc_storeStrong(&v36, 0);
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Coldstart binary download failed in AMS"));
        *v46 = v6;
        v49 = 0;
        v40 = 1;
      }
      else
      {
        v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v33 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("modelLocation"));
        v32 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("version"));
        if (v33)
        {
          if (v32)
          {
            v25 = +[AMDColdstartOperation saveColdStartBinaryforModel:atLocation:withVersion:error:](AMDColdstartOperation, "saveColdStartBinaryforModel:atLocation:withVersion:error:", v44, v33, v32, v46);
            if (*v46)
            {
              v49 = 0;
              v40 = 1;
            }
            else
            {
              v24 = 0;
              v22 = 0;
              v14 = +[AMDColdstartURL getColdstartURLForModel:error:](AMDColdstartURL, "getColdstartURLForModel:error:", v44, &v22);
              objc_storeStrong(&v24, v22);
              v23 = v14;
              +[AMDColdstartURL saveColdstartURL:error:](AMDColdstartURL, "saveColdstartURL:error:", v25, v46);
              if (*v46)
              {
                v21 = (os_log_t)MEMORY[0x1E0C81028];
                v20 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  v11 = v21;
                  v12 = v20;
                  v10 = v44;
                  v13 = (id)objc_msgSend(*v46, "localizedDescription");
                  v19 = v13;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v50, (uint64_t)v10, (uint64_t)v19);
                  _os_log_error_impl(&dword_1DC678000, v11, v12, "Save to the Coldstart binary table failed for modelId: %@ with error: %@", v50, 0x16u);

                  objc_storeStrong(&v19, 0);
                }
                objc_storeStrong((id *)&v21, 0);
                v49 = 0;
                v40 = 1;
              }
              else
              {
                if (!v24 && v23)
                {
                  v18 = v24;
                  objc_msgSend(v48, "deleteColdstartBinaryFromStorage:forModel:isVersionChange:error:", v23, v44, 1, &v18);
                  objc_storeStrong(&v24, v18);
                  if (v24)
                  {
                    v17 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deletion of older version coldstart file failed for model: %@"), v44);
                    objc_msgSend(v34, "setObject:forKey:", v17, CFSTR("OlderVersionDeletionError"));
                    objc_storeStrong(&v17, 0);
                  }
                  else
                  {
                    v16 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Successfully deleted older version coldstart file for model: %@"), v44);
                    objc_msgSend(v34, "setObject:forKey:", v16, CFSTR("OlderVersionDeletionSummary"));
                    objc_storeStrong(&v16, 0);
                  }
                }
                objc_msgSend(v34, "setObject:forKey:", v44, CFSTR("savedColdstartModelId"));
                objc_msgSend(v34, "setObject:forKey:", v32, CFSTR("savedColdstartModelVersion"));
                +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v34, CFSTR("coldstartBinaryDownloadSummary"), 0);
                v49 = v34;
                v40 = 1;
              }
              objc_storeStrong(&v23, 0);
              objc_storeStrong(&v24, 0);
            }
            objc_storeStrong(&v25, 0);
          }
          else
          {
            v28 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No binary version provided in the payload for model: %@"), v44);
            v27 = (os_log_t)MEMORY[0x1E0C81028];
            v26 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v28);
              _os_log_error_impl(&dword_1DC678000, v27, v26, "%@", v51, 0xCu);
            }
            objc_storeStrong((id *)&v27, 0);
            v8 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v28);
            *v46 = v8;
            v49 = 0;
            v40 = 1;
            objc_storeStrong(&v28, 0);
          }
        }
        else
        {
          v31 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No binary location provided in the payload for model: %@"), v44);
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v29 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v31);
            _os_log_error_impl(&dword_1DC678000, oslog, v29, "%@", v52, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v31);
          *v46 = v7;
          v49 = 0;
          v40 = 1;
          objc_storeStrong(&v31, 0);
        }
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
      }
    }
    else
    {
      v39 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid input to process coldstart binary download handler: Missing modelId"));
      v38 = MEMORY[0x1E0C81028];
      v37 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v39);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v38, v37, "%@", v54, 0xCu);
      }
      objc_storeStrong(&v38, 0);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v39);
      *v46 = v5;
      v49 = 0;
      v40 = 1;
      objc_storeStrong(&v39, 0);
    }
  }
  else
  {
    v43 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Input to process coldstart binary download handler: Missing status"));
    v42 = MEMORY[0x1E0C81028];
    v41 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)v43);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v42, v41, "%@", v55, 0xCu);
    }
    objc_storeStrong(&v42, 0);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v43);
    *v46 = v4;
    v49 = 0;
    v40 = 1;
    objc_storeStrong(&v43, 0);
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v49;
}

+ (id)updateAppTabInfoForWorkflows:(id)a3
{
  id v3;
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *log;
  os_log_type_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id obj;
  uint64_t v24;
  os_log_t v25;
  os_log_type_t v26;
  os_log_t v27;
  id v28;
  id v29;
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  id v33;
  id v34;
  int v35;
  os_log_type_t type;
  os_log_t oslog;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD __b[8];
  id v44;
  id v45;
  id location[3];
  uint8_t v47[32];
  uint8_t v48[16];
  uint8_t v49[16];
  uint8_t v50[24];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
  if (v24)
  {
    v20 = *(_QWORD *)__b[2];
    v21 = 0;
    v22 = v24;
    while (1)
    {
      v19 = v21;
      if (*(_QWORD *)__b[2] != v20)
        objc_enumerationMutation(obj);
      v44 = *(id *)(__b[1] + 8 * v21);
      v42 = 0;
      v41 = (id)objc_msgSend(v44, "objectForKey:", 0x1EA4BACC8);
      v39 = v42;
      v18 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v41, 4, &v39);
      objc_storeStrong(&v42, v39);
      v40 = v18;
      if (v42)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = (id)objc_msgSend(v44, "objectForKey:", 0x1EA4B9148);
        v38 = (id)objc_msgSend(v16, "stringWithFormat:", CFSTR("Workflow could not be parsed for usecase: %@"), v17);

        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v15 = type;
          __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v38);
          _os_log_error_impl(&dword_1DC678000, log, v15, "%@", v50, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v38, CFSTR("TabInfoUpdateError"), 0);
        v35 = 3;
        objc_storeStrong(&v38, 0);
      }
      else
      {
        v34 = (id)objc_msgSend(v40, "objectForKey:", CFSTR("tab_ids"));
        v33 = (id)objc_msgSend(v40, "objectForKey:", CFSTR("use_case_id"));
        if (v34)
        {
          v29 = v42;
          v3 = +[AMDAppTabInfo refreshTabsForUseCase:tabs:error:](AMDAppTabInfo, "refreshTabsForUseCase:tabs:error:", v33, v34, &v29);
          objc_storeStrong(&v42, v29);
          if (v42)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            v11 = (id)objc_msgSend(v44, "objectForKey:", 0x1EA4B9148);
            v10 = (id)objc_msgSend(v42, "localizedDescription");
            v28 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("Tab Id update failed for usecase: %@ with error: %@"), v11, v10);

            v27 = (os_log_t)MEMORY[0x1E0C81028];
            v26 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v7 = v27;
              v8 = v26;
              __os_log_helper_16_2_1_8_64((uint64_t)v48, (uint64_t)v28);
              _os_log_error_impl(&dword_1DC678000, v7, v8, "%@", v48, 0xCu);
            }
            objc_storeStrong((id *)&v27, 0);
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v28, CFSTR("TabInfoUpdateError"), 0);
            v35 = 3;
            objc_storeStrong(&v28, 0);
          }
          else
          {
            objc_msgSend(v45, "setObject:forKey:", v34, v33);
            v25 = (os_log_t)MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v6 = v25;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v47, (uint64_t)v33, (uint64_t)v34);
              _os_log_impl(&dword_1DC678000, v6, OS_LOG_TYPE_INFO, "Usecase:%@ mapped to tabs: %@", v47, 0x16u);
            }
            objc_storeStrong((id *)&v25, 0);
            v35 = 0;
          }
        }
        else
        {
          v32 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TabIds not defined for usecase: %@"), v33);
          v31 = (os_log_t)MEMORY[0x1E0C81028];
          v30 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v12 = v31;
            v13 = v30;
            __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v32);
            _os_log_error_impl(&dword_1DC678000, v12, v13, "%@", v49, 0xCu);
          }
          objc_storeStrong((id *)&v31, 0);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v32, CFSTR("NilTabIdError"), 0);
          v35 = 3;
          objc_storeStrong(&v32, 0);
        }
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
      }
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      ++v21;
      if (v19 + 1 >= v22)
      {
        v21 = 0;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
        if (!v22)
          break;
      }
    }
  }

  v5 = v45;
  v35 = 1;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)performModelCleanup
{
  id v3;
  NSObject *log;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v14;
  id v15;
  os_log_type_t type;
  os_log_t oslog;
  id v18;
  id v19;
  int v20;
  id v21;
  id v22;
  id v23;
  _QWORD __b[8];
  uint64_t v25;
  id v26;
  id v27[2];
  id v28;
  uint8_t v29[24];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = a1;
  v27[1] = (id)a2;
  v27[0] = +[AMDModel getCurrentModelInfoByModelId](AMDModel, "getCurrentModelInfoByModelId");
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = v27[0];
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v14)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v14;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v25 = *(_QWORD *)(__b[1] + 8 * v11);
      v23 = 0;
      v21 = 0;
      v8 = +[AMDWorkflow getWorkflowsForModelId:error:](AMDWorkflow, "getWorkflowsForModelId:error:", v25, &v21);
      objc_storeStrong(&v23, v21);
      v22 = v8;
      if (v23)
      {
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Workflow fetch failed during model cleanup"), CFSTR("WorkflowFetchError"), 0);
        v20 = 3;
      }
      else
      {
        if (v22 && objc_msgSend(v22, "count"))
          goto LABEL_18;
        v18 = v23;
        v7 = +[AMDWorkflowInFlight getAllWorkflowsWithModelId:error:](AMDWorkflowInFlight, "getAllWorkflowsWithModelId:error:", v25, &v18);
        objc_storeStrong(&v23, v18);
        v19 = v7;
        if (v23)
        {
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Inflight workflow fetch failed during model cleanup"), CFSTR("InfightWorkflowFetchError"), 0);
          v20 = 3;
        }
        else
        {
          if (!v19 || !objc_msgSend(v19, "count"))
          {
            v5 = v26;
            v6 = (id)objc_msgSend(v27[0], "objectForKey:", v25);
            objc_msgSend(v5, "addObject:");

            oslog = (os_log_t)MEMORY[0x1E0C81028];
            type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              __os_log_helper_16_2_1_8_64((uint64_t)v29, v25);
              _os_log_debug_impl(&dword_1DC678000, log, type, "Model to delete :%@", v29, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          v20 = 0;
        }
        objc_storeStrong(&v19, 0);
        if (!v20)
LABEL_18:
          v20 = 0;
      }
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v12)
          break;
      }
    }
  }

  v15 = (id)objc_msgSend(v28, "removeOldModels:", v26);
  v3 = v15;
  v20 = 1;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
  return v3;
}

+ (id)processModelDownload:(id)a3 withStorefrontID:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  os_log_t oslog;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id v46;
  id v47;
  _QWORD __b[8];
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  os_log_type_t v60;
  id v61;
  os_log_type_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  os_log_type_t v67;
  id v68;
  os_log_type_t v69;
  id v70;
  id v71;
  os_log_type_t v72;
  id v73;
  id v74;
  id v75;
  os_log_type_t v76;
  id v77;
  id v78;
  os_log_type_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  os_log_type_t v87;
  id v88;
  id v89;
  id v90;
  os_log_type_t v91;
  id v92;
  id v93;
  id v94;
  os_log_type_t v95;
  id v96;
  id v97;
  int64_t v98;
  uint8_t v99[15];
  os_log_type_t v100;
  id v101;
  id v102;
  id v103;
  os_log_type_t v104;
  id v105;
  id v106;
  os_log_type_t v107;
  id v108;
  id v109;
  int v110;
  os_log_type_t type;
  id v112;
  id v113;
  id v114;
  id v115;
  id *v116;
  id v117;
  id location[2];
  id v119;
  id v120;
  uint8_t v121[16];
  _BYTE v122[128];
  uint8_t v123[16];
  uint8_t v124[32];
  uint8_t v125[16];
  uint8_t v126[16];
  uint8_t v127[16];
  uint8_t v128[16];
  uint8_t v129[16];
  uint8_t v130[16];
  uint8_t v131[16];
  uint8_t v132[16];
  uint8_t v133[16];
  uint8_t v134[16];
  uint8_t v135[24];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v119 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v117 = 0;
  objc_storeStrong(&v117, a4);
  v116 = a5;
  v115 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("status"));
  v114 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("modelId"));
  if (!v115)
  {
    v113 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Input to Process Model Download Handler: Missing status"));
    v112 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v112, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v135, (uint64_t)v113);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v112, type, "%@", v135, 0xCu);
    }
    objc_storeStrong(&v112, 0);
    *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v113);
    v120 = 0;
    v110 = 1;
    objc_storeStrong(&v113, 0);
    goto LABEL_91;
  }
  if (!v114)
  {
    v109 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Input to Process Model Download Handler: Missing modelId"));
    v108 = MEMORY[0x1E0C81028];
    v107 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v108, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v134, (uint64_t)v109);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v108, v107, "%@", v134, 0xCu);
    }
    objc_storeStrong(&v108, 0);
    *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v109);
    v120 = 0;
    v110 = 1;
    objc_storeStrong(&v109, 0);
    goto LABEL_91;
  }
  if ((objc_msgSend(v115, "isEqualToString:", CFSTR("Failure")) & 1) == 0)
  {
    v103 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v102 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("domain"));
    if (!v102)
    {
      v101 = MEMORY[0x1E0C81028];
      v100 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v101, OS_LOG_TYPE_ERROR))
      {
        v38 = v101;
        v39 = v100;
        __os_log_helper_16_0_0(v99);
        _os_log_error_impl(&dword_1DC678000, v38, v39, "No domain provided in modelDownloadPayload", v99, 2u);
      }
      objc_storeStrong(&v101, 0);
      *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("No domain provided in modelDownloadPayload"));
      v120 = 0;
      v110 = 1;
      goto LABEL_90;
    }
    v98 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v102);
    v97 = +[AMDWorkflowInFlight getAllWorkflowsForDomain:withModelId:error:](AMDWorkflowInFlight, "getAllWorkflowsForDomain:withModelId:error:", v98, v114, v116);
    if (*v116)
    {
      v96 = MEMORY[0x1E0C81028];
      v95 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v96, OS_LOG_TYPE_ERROR))
      {
        v35 = v96;
        v36 = v95;
        v37 = (id)objc_msgSend(*v116, "localizedDescription");
        v94 = v37;
        __os_log_helper_16_2_1_8_64((uint64_t)v132, (uint64_t)v94);
        _os_log_error_impl(&dword_1DC678000, v35, v36, "Error querying In-Flight Workflow table: %@", v132, 0xCu);

        objc_storeStrong(&v94, 0);
      }
      objc_storeStrong(&v96, 0);
      v120 = 0;
      v110 = 1;
      goto LABEL_89;
    }
    if (!v97 || !objc_msgSend(v97, "count"))
    {
      v93 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No In-Flight workflows found for modelId: %@"), v114);
      v92 = MEMORY[0x1E0C81028];
      v91 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v92, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v131, (uint64_t)v93);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v92, v91, "%@", v131, 0xCu);
      }
      objc_storeStrong(&v92, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v93, CFSTR("modelDownloadError"), 0);
      v120 = 0;
      v110 = 1;
      objc_storeStrong(&v93, 0);
      goto LABEL_89;
    }
    v90 = (id)objc_msgSend(v97, "firstObject");
    v33 = (void *)MEMORY[0x1E0CB36D8];
    v34 = (id)objc_msgSend(v90, "objectForKey:", 0x1EA4BACC8);
    v89 = (id)objc_msgSend(v33, "JSONObjectWithData:options:error:");

    if (*v116)
    {
      v88 = MEMORY[0x1E0C81028];
      v87 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v88, OS_LOG_TYPE_ERROR))
      {
        v30 = v88;
        v31 = v87;
        v32 = (id)objc_msgSend(*v116, "localizedDescription");
        v86 = v32;
        __os_log_helper_16_2_1_8_64((uint64_t)v130, (uint64_t)v86);
        _os_log_error_impl(&dword_1DC678000, v30, v31, "Inflight workflow serialization failed: %@", v130, 0xCu);

        objc_storeStrong(&v86, 0);
      }
      objc_storeStrong(&v88, 0);
      v120 = 0;
      v110 = 1;
      goto LABEL_88;
    }
    v85 = (id)objc_msgSend(v89, "objectForKey:", CFSTR("model_format"));
    v84 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("modelLocation"));
    v83 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("version"));
    v82 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("type"));
    if (!v84)
    {
      v81 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No model location provided in the payload for model: %@"), v114);
      v80 = MEMORY[0x1E0C81028];
      v79 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v129, (uint64_t)v81);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v80, v79, "%@", v129, 0xCu);
      }
      objc_storeStrong(&v80, 0);
      *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v81);
      v120 = 0;
      v110 = 1;
      objc_storeStrong(&v81, 0);
      goto LABEL_87;
    }
    if (!v83)
    {
      v78 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No model version provided in the payload for model: %@"), v114);
      v77 = MEMORY[0x1E0C81028];
      v76 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v128, (uint64_t)v78);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v77, v76, "%@", v128, 0xCu);
      }
      objc_storeStrong(&v77, 0);
      *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v78);
      v120 = 0;
      v110 = 1;
      objc_storeStrong(&v78, 0);
      goto LABEL_87;
    }
    v75 = 0;
    if ((objc_msgSend(v85, "isEqualToString:", CFSTR("CoreML")) & 1) != 0)
    {
      if (v82 && (objc_msgSend(v82, "isEqualToString:", CFSTR("uncompiled")) & 1) == 0)
      {
        if ((objc_msgSend(v82, "isEqualToString:", CFSTR("compiled")) & 1) == 0)
        {
          v74 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized model type sent to JS Handler: %@"), v82);
          v73 = MEMORY[0x1E0C81028];
          v72 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v127, (uint64_t)v74);
            _os_log_error_impl(&dword_1DC678000, (os_log_t)v73, v72, "%@", v127, 0xCu);
          }
          objc_storeStrong(&v73, 0);
          *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v74);
          v120 = 0;
          v110 = 1;
          objc_storeStrong(&v74, 0);
          goto LABEL_86;
        }
        v7 = (id)objc_msgSend(v119, "unzipAndValidateCompiledModelBundle:atLocation:withVersion:error:", v114, v84, v83, v116);
        v8 = v75;
        v75 = v7;

      }
      else
      {
        v5 = (id)objc_msgSend(v119, "parseModel:atLocation:withVersion:withStorefrontId:error:", v114, v84, v83, v117, v116);
        v6 = v75;
        v75 = v5;

      }
    }
    else
    {
      if ((objc_msgSend(v85, "isEqualToString:", CFSTR("Espresso")) & 1) == 0)
      {
        v71 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported model format present in inflight workflow: %@"), v85);
        v70 = MEMORY[0x1E0C81028];
        v69 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v126, (uint64_t)v71);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v70, v69, "%@", v126, 0xCu);
        }
        objc_storeStrong(&v70, 0);
        *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v71);
        v120 = 0;
        v110 = 1;
        objc_storeStrong(&v71, 0);
        goto LABEL_86;
      }
      v9 = (id)objc_msgSend(v119, "unzipDownloadedModelBundle:atLocation:withVersion:error:", v114, v84, v83, v116);
      v10 = v75;
      v75 = v9;

    }
    if (*v116)
    {
      v120 = 0;
      v110 = 1;
    }
    else if (v75)
    {
      v66 = 0;
      v64 = 0;
      v29 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", v114, &v64);
      objc_storeStrong(&v66, v64);
      v65 = v29;
      +[AMDModel saveModels:error:](AMDModel, "saveModels:error:", v75, v116);
      if (*v116)
      {
        v63 = MEMORY[0x1E0C81028];
        v62 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR))
        {
          v27 = v114;
          v28 = (id)objc_msgSend(*v116, "localizedDescription");
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v124, (uint64_t)v27, (uint64_t)v28);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v63, v62, "Model url save failed, modelId: %@, error: %@", v124, 0x16u);

        }
        objc_storeStrong(&v63, 0);
        v120 = 0;
        v110 = 1;
      }
      else
      {
        v61 = MEMORY[0x1E0C81028];
        v60 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v123, (uint64_t)v114);
          _os_log_debug_impl(&dword_1DC678000, (os_log_t)v61, v60, "Added modelUrl for '%@'", v123, 0xCu);
        }
        objc_storeStrong(&v61, 0);
        if (!v66 && v65)
        {
          v59 = v66;
          objc_msgSend(v119, "deleteModelFromStorage:isVersionChange:error:", v65, 1, &v59);
          objc_storeStrong(&v66, v59);
          if (v66)
          {
            v58 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deletion of older version model file failed for model: %@"), v114);
            objc_msgSend(v103, "setObject:forKey:", v58, CFSTR("OlderVersionDeletionError"));
            objc_storeStrong(&v58, 0);
          }
          else
          {
            v57 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Successfully deleted older model version for model: %@"), v114);
            objc_msgSend(v103, "setObject:forKey:", v57, CFSTR("OlderVersionDeletionSummary"));
            objc_storeStrong(&v57, 0);
          }
        }
        objc_msgSend(v103, "setObject:forKey:", v114, CFSTR("savedModelId"));
        objc_msgSend(v103, "setObject:forKey:", v83, CFSTR("savedModelVersion"));
        v56 = +[AMDWorkflowInFlight moveInflightWorkflowsToWorkflows:withDomain:error:](AMDWorkflowInFlight, "moveInflightWorkflowsToWorkflows:withDomain:error:", v97, v98, v116);
        v55 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("savedWorkflows"));
        v54 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("deletionSummary"));
        v53 = (id)objc_msgSend(v119, "updateAppTabInfoForWorkflows:", v55);
        v52 = (id)objc_msgSend(v119, "performModelCleanup");
        v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v50 = 0;
        memset(__b, 0, sizeof(__b));
        v25 = v97;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v122, 16);
        if (v26)
        {
          v22 = *(_QWORD *)__b[2];
          v23 = 0;
          v24 = v26;
          while (1)
          {
            v21 = v23;
            if (*(_QWORD *)__b[2] != v22)
              objc_enumerationMutation(v25);
            v49 = *(id *)(__b[1] + 8 * v23);
            v47 = (id)objc_msgSend(v49, "objectForKey:", 0x1EA4BAC28);
            v46 = (id)objc_msgSend(v49, "objectForKey:", 0x1EA4B9308);
            if (v47)
              objc_msgSend(v51, "addObject:", v47);
            if (v46)
              v50 = objc_msgSend(v46, "longLongValue");
            objc_storeStrong(&v46, 0);
            objc_storeStrong(&v47, 0);
            ++v23;
            if (v21 + 1 >= v24)
            {
              v23 = 0;
              v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v122, 16);
              if (!v24)
                break;
            }
          }
        }

        v45 = (id)objc_msgSend(v51, "allObjects");
        v19 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
        objc_msgSend(v19, "timeIntervalSince1970");
        v20 = (unint64_t)v11;

        v44 = v20;
        v43 = v20 - v50;
        objc_msgSend(v103, "setObject:forKey:", v45, CFSTR("SyncUUIDs"));
        if (v50)
        {
          v17 = v103;
          v18 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43);
          objc_msgSend(v17, "setObject:forKey:");

        }
        else
        {
          objc_msgSend(v103, "setObject:forKey:", CFSTR("SyncTime not found"), CFSTR("Error:modelAvailabilityLatency"));
        }
        v13 = v103;
        v14 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v50);
        objc_msgSend(v13, "setObject:forKey:");

        v15 = v103;
        v16 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v44);
        objc_msgSend(v15, "setObject:forKey:");

        objc_msgSend(v103, "setObject:forKey:", v54, CFSTR("workflowCleanupInformation"));
        objc_msgSend(v103, "setObject:forKey:", v52, CFSTR("modelsDeleted"));
        objc_msgSend(v103, "setObject:forKey:", v53, CFSTR("updatedTabInfo"));
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v121, v43);
          _os_log_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_INFO, "Total model availability latency(seconds) : %lld", v121, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v103, CFSTR("downloadProcessSummary"), 0);
        v120 = v103;
        v110 = 1;
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v51, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v54, 0);
        objc_storeStrong(&v55, 0);
        objc_storeStrong(&v56, 0);
      }
      objc_storeStrong(&v65, 0);
      objc_storeStrong(&v66, 0);
    }
    else
    {
      v68 = MEMORY[0x1E0C81028];
      v67 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v125, (uint64_t)v114);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v68, v67, "Parse model information operation failed for modelId: %@", v125, 0xCu);
      }
      objc_storeStrong(&v68, 0);
      *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, CFSTR("Parse model information operation failed"));
      v120 = 0;
      v110 = 1;
    }
LABEL_86:
    objc_storeStrong(&v75, 0);
LABEL_87:
    objc_storeStrong(&v82, 0);
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v84, 0);
    objc_storeStrong(&v85, 0);
LABEL_88:
    objc_storeStrong(&v89, 0);
    objc_storeStrong(&v90, 0);
LABEL_89:
    objc_storeStrong(&v97, 0);
LABEL_90:
    objc_storeStrong(&v102, 0);
    objc_storeStrong(&v103, 0);
    goto LABEL_91;
  }
  v106 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model Download Failed for modelId: %@"), v114);
  v105 = MEMORY[0x1E0C81028];
  v104 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v105, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v133, (uint64_t)v106);
    _os_log_error_impl(&dword_1DC678000, (os_log_t)v105, v104, "%@", v133, 0xCu);
  }
  objc_storeStrong(&v105, 0);
  *v116 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v106);
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v106, CFSTR("modelDownloadFailure"), 0);
  v120 = 0;
  v110 = 1;
  objc_storeStrong(&v106, 0);
LABEL_91:
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(location, 0);
  return v120;
}

+ (id)parseModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 withStorefrontId:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  uint64_t v9;
  id v11;
  id v12;
  AMDBaseRecoModel *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *context;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  int v32;
  os_log_type_t v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38[2];
  id v39;
  id v40;
  id v41;
  id location[2];
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v43 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = 0;
  objc_storeStrong(&v40, a5);
  v39 = 0;
  objc_storeStrong(&v39, a6);
  v38[1] = a7;
  v38[0] = CFSTR("ModelFilesHandling");
  v37 = 0;
  context = (void *)MEMORY[0x1DF0CD388](+[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", v38[0]));
  v17 = [AMDBaseRecoModel alloc];
  v36 = -[AMDBaseRecoModel initWithId:andVersion:](v17, "initWithId:andVersion:", location[0], objc_msgSend(v40, "longLongValue"));
  v20 = v43;
  v18 = location[0];
  v19 = v39;
  v21 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v41);
  v7 = (id)objc_msgSend(v20, "parseModelWithId:withStorefrontId:fromArchive:withBaseRecoModel:", v18, v19);
  v8 = v37;
  v37 = v7;

  objc_storeStrong((id *)&v36, 0);
  objc_autoreleasePoolPop(context);
  +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", v38[0]);
  v35 = (id)objc_msgSend(v37, "objectForKey:", CFSTR("newVersionDirURL"));
  if (v35)
  {
    v31 = (id)objc_msgSend(v37, "objectForKey:");
    v30 = (id)objc_msgSend(v35, "absoluteString");
    v29 = (id)objc_msgSend(v30, "stringByRemovingPercentEncoding");
    v27 = objc_msgSend(v29, "rangeOfString:", CFSTR("file://"));
    v28 = v9;
    v45 = v27;
    v46 = v9;
    v26 = (id)objc_msgSend(v29, "substringFromIndex:", v27 + v9);
    v25 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v26, 1);
    v11 = (id)objc_msgSend(v25, "URLByDeletingLastPathComponent");
    v24 = (id)objc_msgSend(v11, "lastPathComponent");

    v49 = location[0];
    v47[0] = CFSTR("modelId");
    v48[0] = location[0];
    v47[1] = CFSTR("url");
    v48[1] = v26;
    v47[2] = CFSTR("compiledModelDir");
    v48[2] = v31;
    v47[3] = CFSTR("version");
    v48[3] = v24;
    v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
    v50 = v12;
    v23 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);

    v44 = v23;
    v32 = 1;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v34 = MEMORY[0x1E0C81028];
    v33 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v34, v33, "Model file not correctly parsed for modelId: %@", v51, 0xCu);
    }
    objc_storeStrong(&v34, 0);
    v44 = 0;
    v32 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v44;
}

+ (void)saveMinimalContentToLogicalMapForModelId:(id)a3 fromMapData:(id)a4
{
  id v5;
  os_log_t oslog;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  v7 = 0;
  v5 = +[AMDTasteProfile getPurchasedAppsSet:](AMDTasteProfile, "getPurchasedAppsSet:", &v7);
  objc_storeStrong(&v9, v7);
  v8 = v5;
  if (objc_msgSend(v5, "count"))
  {
    +[AMDTasteProfile saveMinimalCToLMapForModelId:usingMapData:andPurchases:](AMDTasteProfile, "saveMinimalCToLMapForModelId:usingMapData:andPurchases:", location[0], v10, v8);
  }
  else
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v12, (uint64_t)location[0]);
      _os_log_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_INFO, "No purchases to map to logicalIds for modelId %@", v12, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (void)unzipModelFile:(id)a3 copyToDestination:(id)a4 error:(id *)a5
{
  id v5;
  int v8;
  id v9;
  id v10;
  int v11;
  id v12[6];
  id *v13;
  id v14;
  id location[3];
  uint8_t v16[24];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = a5;
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("ModelUnzip"));
  v12[5] = (id)BOMCopierNew();
  v12[2] = (id)objc_msgSend(objc_retainAutorelease(location[0]), "fileSystemRepresentation");
  v12[1] = (id)objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation");
  v17[0] = CFSTR("extractPKZip");
  v18[0] = *MEMORY[0x1E0C9AE50];
  v17[1] = CFSTR("sequesterResources");
  v18[1] = *MEMORY[0x1E0C9AE50];
  v17[2] = CFSTR("copyResources");
  v18[2] = *MEMORY[0x1E0C9AE50];
  v12[0] = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = BOMCopierCopyWithOptions();
  BOMCopierFree();
  if (v11)
  {
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model at path %@ could not be unzipped"), location[0]);
    v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)v10);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%@", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v10);
    *v13 = v5;
    v8 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(v12, 0);
  if (!v8)
    +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("ModelUnzip"));
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

+ (id)unzipModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  id v6;
  double v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  os_log_type_t v26;
  id v27;
  id v28;
  id v29[2];
  int v30;
  os_log_type_t v31;
  id v32;
  id v33;
  id v34;
  id *v35;
  id v36;
  id v37;
  id location[2];
  id v39;
  id v40;
  uint8_t v41[16];
  uint8_t v42[16];
  uint8_t v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v39 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = 0;
  objc_storeStrong(&v36, a5);
  v35 = a6;
  v34 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if ((objc_msgSend(v34, "fileExistsAtPath:", v37) & 1) != 0)
  {
    v16 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    objc_msgSend(v16, "timeIntervalSince1970");
    v17 = (void *)(uint64_t)v7;

    v29[1] = v17;
    v29[0] = (id)objc_msgSend(v39, "ensureNewVersionDirURLForModel:withVersion:andCreationTime:", location[0], objc_msgSend(v36, "longLongValue"), v17);
    if (v29[0])
    {
      v25 = (id)objc_msgSend(v29[0], "second");
      v14 = v39;
      v13 = v37;
      v15 = (id)objc_msgSend(v25, "path");
      objc_msgSend(v14, "unzipModelFile:copyToDestination:error:", v13);

      if (*v35)
      {
        v12 = (id)objc_msgSend(*v35, "localizedDescription");
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

        v40 = 0;
        v30 = 1;
      }
      else
      {
        v24 = 0;
        v10 = v34;
        v11 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v37, 0);
        v23 = v24;
        objc_msgSend(v10, "removeItemAtURL:error:");
        objc_storeStrong(&v24, v23);

        if (v24)
        {
          v22 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not delete downloaded zipped model at location: %@"), v37);
          v21 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v22);
            _os_log_error_impl(&dword_1DC678000, (os_log_t)v21, OS_LOG_TYPE_ERROR, "%@", v41, 0xCu);
          }
          objc_storeStrong(&v21, 0);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v22, CFSTR("downloadedModelDeletionError"), 0);
          objc_storeStrong(&v22, 0);
        }
        v40 = v25;
        v30 = 1;
        objc_storeStrong(&v24, 0);
      }
      objc_storeStrong(&v25, 0);
    }
    else
    {
      v28 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New directory could not be created at path: %@ for model: %@"), v37, location[0]);
      v27 = MEMORY[0x1E0C81028];
      v26 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v42, (uint64_t)v28);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v27, v26, "%@", v42, 0xCu);
      }
      objc_storeStrong(&v27, 0);
      v8 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v28);
      *v35 = v8;
      v40 = 0;
      v30 = 1;
      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(v29, 0);
  }
  else
  {
    v33 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Downloaded Model unavailable at path: %@ for model: %@"), v37, location[0]);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v33, CFSTR("parseDownloadedModelError"), 0);
    v32 = MEMORY[0x1E0C81028];
    v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v33);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v32, v31, "%@", v43, 0xCu);
    }
    objc_storeStrong(&v32, 0);
    v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v33);
    *v35 = v6;
    v40 = 0;
    v30 = 1;
    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v40;
}

+ (id)unzipDownloadedModelBundle:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  id v9;
  id v13;
  int v14;
  id v15[2];
  id v16;
  id v17;
  id location[2];
  id v19;
  id v20;
  _QWORD v21[4];
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v19 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15[1] = a6;
  v15[0] = (id)objc_msgSend(v19, "unzipModel:atLocation:withVersion:error:", location[0], v17, v16, a6);
  if (*a6)
  {
    v20 = 0;
    v14 = 1;
  }
  else
  {
    v23 = location[0];
    v21[0] = CFSTR("modelId");
    v22[0] = location[0];
    v21[1] = CFSTR("url");
    v9 = (id)objc_msgSend(v15[0], "path");
    v22[1] = v9;
    v21[2] = CFSTR("compiledModelDir");
    v22[2] = &stru_1EA4B7088;
    v21[3] = CFSTR("version");
    v8 = (id)objc_msgSend(v16, "stringValue");
    v22[3] = v8;
    v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v24[0] = v7;
    v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);

    v20 = v13;
    v14 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

+ (id)unzipAndValidateCompiledModelBundle:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  id v9;
  id v13;
  id v14;
  int v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  id location[2];
  id v21;
  id v22;
  _QWORD v23[4];
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = a6;
  v16 = (id)objc_msgSend(v21, "unzipModel:atLocation:withVersion:error:", location[0], v19, v18, a6);
  if (*a6)
  {
    v22 = 0;
    v15 = 1;
  }
  else
  {
    objc_msgSend(v21, "validateDownloadAtLocation:withModelId:andVersion:error:", v16, location[0], v18, v17);
    if (*v17)
    {
      v22 = 0;
      v15 = 1;
    }
    else
    {
      v14 = (id)objc_msgSend(location[0], "stringByAppendingString:", CFSTR(".mlmodelc"));
      v25 = location[0];
      v23[0] = CFSTR("modelId");
      v24[0] = location[0];
      v23[1] = CFSTR("url");
      v9 = (id)objc_msgSend(v16, "path");
      v24[1] = v9;
      v23[2] = CFSTR("compiledModelDir");
      v24[2] = v14;
      v23[3] = CFSTR("version");
      v8 = (id)objc_msgSend(v18, "stringValue");
      v24[3] = v8;
      v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
      v26[0] = v7;
      v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);

      v22 = v13;
      v15 = 1;
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v22;
}

+ (void)validateDownloadAtLocation:(id)a3 withModelId:(id)a4 andVersion:(id)a5 error:(id *)a6
{
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  id v25;
  AMDModelAssets *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  char v32;
  id v33;
  NSObject *log;
  os_log_type_t type;
  id v36;
  id v37;
  AMDBaseRecoModel *v41;
  BOOL v42;
  os_log_t v43;
  id v44;
  os_log_type_t v45;
  os_log_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  os_log_type_t v51;
  os_log_t v52;
  id v53;
  id v54;
  id v55;
  os_log_type_t v56;
  os_log_t oslog;
  id v58;
  os_log_type_t v59;
  id v60;
  id v61;
  int v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  id v68;
  id *v69;
  id v70;
  id v71;
  id location[2];
  id v73;
  uint8_t v74[16];
  uint8_t v75[16];
  uint8_t v76[16];
  uint8_t v77[32];
  uint8_t v78[16];
  uint8_t v79[24];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v73 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v71 = 0;
  objc_storeStrong(&v71, a4);
  v70 = 0;
  objc_storeStrong(&v70, a5);
  v69 = a6;
  v41 = [AMDBaseRecoModel alloc];
  v68 = -[AMDBaseRecoModel initWithId:andVersion:](v41, "initWithId:andVersion:", v71, objc_msgSend(v70, "longLongValue"));
  objc_msgSend(v68, "loadModelMetadataFromDir:error:", location[0], a6);
  v6 = *a6 != 0;
  v66 = 0;
  v42 = 1;
  if (!v6)
  {
    v67 = (id)objc_msgSend(v68, "modelMetadata");
    v66 = 1;
    v42 = v67 == 0;
  }
  if ((v66 & 1) != 0)

  if (v42)
  {
    v65 = MEMORY[0x1E0C81028];
    v64 = 16;
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
    {
      log = v65;
      type = v64;
      v37 = (id)objc_msgSend(location[0], "path");
      v36 = (id)objc_msgSend(*v69, "localizedDescription");
      v63 = v36;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v79, (uint64_t)v37, (uint64_t)v63);
      _os_log_error_impl(&dword_1DC678000, log, type, "Error loading model metadata from %@: %@", v79, 0x16u);

      objc_storeStrong(&v63, 0);
    }
    objc_storeStrong(&v65, 0);
    v33 = (id)objc_msgSend(*v69, "localizedDescription");
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

    v62 = 1;
  }
  else
  {
    v31 = (id)objc_msgSend(v68, "modelMetadata");
    v32 = objc_msgSend(v31, "isValid");

    if ((v32 & 1) != 0)
    {
      v26 = [AMDModelAssets alloc];
      v27 = (id)objc_msgSend(location[0], "path");
      v58 = -[AMDModelAssets initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:](v26, "initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:", v69);

      if (*v69)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        v56 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v22 = oslog;
          v23 = v56;
          v25 = (id)objc_msgSend(location[0], "path");
          v24 = (id)objc_msgSend(*v69, "localizedDescription");
          v55 = v24;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, (uint64_t)v25, (uint64_t)v55);
          _os_log_error_impl(&dword_1DC678000, v22, v23, "Error  loading assets from %@: %@", v77, 0x16u);

          objc_storeStrong(&v55, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        v21 = (id)objc_msgSend(*v69, "localizedDescription");
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

        v62 = 1;
      }
      else
      {
        v20 = (id)objc_msgSend(v68, "modelMetadata");
        v54 = (id)objc_msgSend(v20, "getMappingFileRequirement");

        if (v54 && (objc_msgSend(v54, "BOOLValue") & 1) == 1 && (objc_msgSend(v58, "isValid") & 1) == 0)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = (id)objc_msgSend(location[0], "path");
          v53 = (id)objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid assets loaded from filepath: %@"), v19);

          v52 = (os_log_t)MEMORY[0x1E0C81028];
          v51 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v53);
            _os_log_error_impl(&dword_1DC678000, v52, v51, "%@", v76, 0xCu);
          }
          objc_storeStrong((id *)&v52, 0);
          *v69 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v53);
          v17 = (id)objc_msgSend(*v69, "localizedDescription");
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

          v62 = 1;
          objc_storeStrong(&v53, 0);
        }
        else
        {
          v16 = (id)objc_msgSend(v58, "getContentToLogicalMap");

          if (v16)
          {
            v14 = v73;
            v13 = v71;
            v15 = (id)objc_msgSend(v58, "getContentToLogicalMap");
            objc_msgSend(v14, "saveMinimalContentToLogicalMapForModelId:fromMapData:", v13);

          }
          v12 = (id)objc_msgSend(location[0], "URLByAppendingPathComponent:", v71);
          v50 = (id)objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("mlmodelc"));

          v49 = objc_alloc_init(MEMORY[0x1E0C9E958]);
          objc_msgSend(v49, "setComputeUnits:", 0);
          v48 = (id)objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v50, v49, v69);
          if (*v69)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            v11 = (id)objc_msgSend(v50, "path");
            v10 = (id)objc_msgSend(*v69, "localizedDescription");
            v47 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("Error while loading the model from %@: %@"), v11, v10);

            v46 = (os_log_t)MEMORY[0x1E0C81028];
            v45 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v47);
              _os_log_error_impl(&dword_1DC678000, v46, v45, "%@", v75, 0xCu);
            }
            objc_storeStrong((id *)&v46, 0);
            *v69 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v47);
            v8 = (id)objc_msgSend(*v69, "localizedDescription");
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

            v62 = 1;
            objc_storeStrong(&v47, 0);
          }
          else if (v48)
          {
            v62 = 0;
          }
          else
          {
            v44 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ML model loaded incorrectly. Nil value returned"));
            v43 = (os_log_t)MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v44);
              _os_log_error_impl(&dword_1DC678000, v43, OS_LOG_TYPE_ERROR, "%@", v74, 0xCu);
            }
            objc_storeStrong((id *)&v43, 0);
            *v69 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v44);
            v7 = (id)objc_msgSend(*v69, "localizedDescription");
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

            v62 = 1;
            objc_storeStrong(&v44, 0);
          }
          objc_storeStrong(&v48, 0);
          objc_storeStrong(&v49, 0);
          objc_storeStrong(&v50, 0);
        }
        objc_storeStrong(&v54, 0);
      }
      objc_storeStrong(&v58, 0);
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = (id)objc_msgSend(location[0], "path");
      v61 = (id)objc_msgSend(v29, "stringWithFormat:", CFSTR("Invalid model metadata from filepath: %@"), v30);

      v60 = MEMORY[0x1E0C81028];
      v59 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v61);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v60, v59, "%@", v78, 0xCu);
      }
      objc_storeStrong(&v60, 0);
      *v69 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v61);
      v28 = (id)objc_msgSend(*v69, "localizedDescription");
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      v62 = 1;
      objc_storeStrong(&v61, 0);
    }
  }
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
}

+ (void)deleteModelFromStorage:(id)a3 isVersionChange:(BOOL)a4 error:(id *)a5
{
  id v5;
  void *v8;
  id v9;
  os_log_t v10;
  id v11;
  os_log_type_t type;
  os_log_t oslog;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  BOOL v19;
  id location[3];
  uint8_t v21[32];
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  v18 = a5;
  v17 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)MEMORY[0x1E0C99E98];
  v9 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BB0A8);
  v16 = (id)objc_msgSend(v8, "fileURLWithPath:");

  v15 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B8F88);
  if (a4)
  {
    v14 = (id)objc_msgSend(v16, "URLByDeletingLastPathComponent");
    if ((objc_msgSend(v17, "removeItemAtURL:error:", v14, v18) & 1) != 0 && !*v18)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)v15, (uint64_t)v14);
        _os_log_impl(&dword_1DC678000, oslog, type, "Deleted directory for modelId '%@': %@", v22, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v5 = (id)objc_msgSend(v16, "URLByDeletingLastPathComponent");
    v11 = (id)objc_msgSend(v5, "URLByDeletingLastPathComponent");

    if ((objc_msgSend(v17, "removeItemAtURL:error:", v11, v18) & 1) != 0 && !*v18)
    {
      v10 = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)v15, (uint64_t)v11);
        _os_log_impl(&dword_1DC678000, v10, OS_LOG_TYPE_INFO, "Deleted directory for modelId '%@': %@", v21, 0x16u);
      }
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (void)deleteColdstartBinaryFromStorage:(id)a3 forModel:(id)a4 isVersionChange:(BOOL)a5 error:(id *)a6
{
  id v6;
  id v7;
  id v8;
  os_log_t v12;
  os_log_type_t v13;
  os_log_t v14;
  id v15;
  os_log_type_t v16;
  os_log_t v17;
  os_log_type_t type;
  os_log_t oslog;
  id v20;
  id v21;
  id v22;
  id *v23;
  BOOL v24;
  id v25;
  id location[3];
  uint8_t v27[32];
  uint8_t v28[32];
  uint8_t v29[32];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = a5;
  v23 = a6;
  v22 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", location[0]);
  if (a5)
  {
    v8 = (id)objc_msgSend(v21, "URLByDeletingLastPathComponent");
    v20 = (id)objc_msgSend(v8, "URLByDeletingLastPathComponent");

    if ((objc_msgSend(v22, "removeItemAtURL:error:", v20, v23) & 1) != 0 && !*v23)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v30, (uint64_t)v25, (uint64_t)v20);
        _os_log_error_impl(&dword_1DC678000, oslog, type, "Deleted directory for modelId '%@': %@", v30, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v17 = (os_log_t)MEMORY[0x1E0C81028];
      v16 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v25, (uint64_t)v20);
        _os_log_impl(&dword_1DC678000, v17, v16, "Deleted directory for modelId '%@': %@", v29, 0x16u);
      }
      objc_storeStrong((id *)&v17, 0);
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v7 = (id)objc_msgSend(v21, "URLByDeletingLastPathComponent");
    v6 = (id)objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v15 = (id)objc_msgSend(v6, "URLByDeletingLastPathComponent");

    if ((objc_msgSend(v22, "removeItemAtURL:error:", v15, v23) & 1) != 0 && !*v23)
    {
      v14 = (os_log_t)MEMORY[0x1E0C81028];
      v13 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v28, (uint64_t)v25, (uint64_t)v15);
        _os_log_error_impl(&dword_1DC678000, v14, v13, "Deleted directory for modelId '%@': %@", v28, 0x16u);
      }
      objc_storeStrong((id *)&v14, 0);
      v12 = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v27, (uint64_t)v25, (uint64_t)v15);
        _os_log_impl(&dword_1DC678000, v12, OS_LOG_TYPE_INFO, "Deleted directory for modelId '%@': %@", v27, 0x16u);
      }
      objc_storeStrong((id *)&v12, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

+ (id)removeOldModels:(id)a3
{
  id v3;
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  id v17;
  NSObject *log;
  os_log_type_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  id obj;
  uint64_t v31;
  os_log_t v32;
  os_log_type_t v33;
  os_log_t v34;
  id v35;
  id v36;
  os_log_type_t v37;
  os_log_t v38;
  os_log_type_t v39;
  os_log_t v40;
  id v41;
  id v42;
  int v43;
  os_log_type_t type;
  os_log_t oslog;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD __b[8];
  id v53;
  id v54;
  id v55;
  id location[2];
  id v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t v60[16];
  uint8_t v61[24];
  id v62;
  uint8_t v63[16];
  uint8_t v64[32];
  uint8_t v65[24];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v57 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v54 = (id)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v66, 16);
  if (v31)
  {
    v26 = *(_QWORD *)__b[2];
    v27 = 0;
    v28 = v31;
    while (1)
    {
      v25 = v27;
      if (*(_QWORD *)__b[2] != v26)
        objc_enumerationMutation(obj);
      v53 = *(id *)(__b[1] + 8 * v27);
      v51 = 0;
      v50 = (id)objc_msgSend(v53, "objectForKey:", 0x1EA4B8F88);
      v49 = v51;
      objc_msgSend(v57, "deleteModelFromStorage:isVersionChange:error:", v53, 0, &v49);
      objc_storeStrong(&v51, v49);
      if (v51)
      {
        v20 = (void *)MEMORY[0x1E0C99E98];
        v21 = (id)objc_msgSend(v53, "objectForKey:", 0x1EA4BB0A8);
        v48 = (id)objc_msgSend(v20, "fileURLWithPath:");

        v47 = (id)objc_msgSend(v48, "URLByDeletingLastPathComponent");
        v23 = (void *)MEMORY[0x1E0CB3940];
        v22 = v47;
        v24 = (id)objc_msgSend(v51, "localizedDescription");
        v46 = (id)objc_msgSend(v23, "stringWithFormat:", CFSTR("Error deleting directory '%@': %@"), v22, v24);

        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v19 = type;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v65, (uint64_t)v50, (uint64_t)v46);
          _os_log_error_impl(&dword_1DC678000, log, v19, "'%@': %@", v65, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        objc_msgSend(v55, "setObject:forKey:", v46, v50);
        v43 = 3;
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v48, 0);
      }
      else
      {
        v42 = 0;
        v3 = +[AMDWorkflow deleteWorkflowsForModelId:error:](AMDWorkflow, "deleteWorkflowsForModelId:error:", v50, &v42);
        objc_storeStrong(&v51, v42);
        if (v51)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v17 = (id)objc_msgSend(v51, "localizedDescription");
          v41 = (id)objc_msgSend(v16, "stringWithFormat:", CFSTR("Error deleting workflows: %@"), v17);

          v40 = (os_log_t)MEMORY[0x1E0C81028];
          v39 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v14 = v40;
            v15 = v39;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v64, (uint64_t)v50, (uint64_t)v41);
            _os_log_error_impl(&dword_1DC678000, v14, v15, "'%@': %@", v64, 0x16u);
          }
          objc_storeStrong((id *)&v40, 0);
          objc_msgSend(v55, "setObject:forKey:", v41, v50);
          v43 = 3;
          objc_storeStrong(&v41, 0);
        }
        else
        {
          v38 = (os_log_t)MEMORY[0x1E0C81028];
          v37 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v12 = v38;
            v13 = v37;
            __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v50);
            _os_log_debug_impl(&dword_1DC678000, v12, v13, "Deleted workflow for modelId '%@'", v63, 0xCu);
          }
          objc_storeStrong((id *)&v38, 0);
          v62 = v53;
          v11 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
          v36 = v51;
          +[AMDModel deleteModels:error:](AMDModel, "deleteModels:error:");
          objc_storeStrong(&v51, v36);

          if (v51)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            v10 = (id)objc_msgSend(v51, "localizedDescription");
            v35 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("Error deleting AMDModel: %@"), v10);

            v34 = (os_log_t)MEMORY[0x1E0C81028];
            v33 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v7 = v34;
              v8 = v33;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v61, (uint64_t)v50, (uint64_t)v35);
              _os_log_error_impl(&dword_1DC678000, v7, v8, "'%@': %@", v61, 0x16u);
            }
            objc_storeStrong((id *)&v34, 0);
            objc_msgSend(v55, "setObject:forKey:", v35, v50);
            v43 = 3;
            objc_storeStrong(&v35, 0);
          }
          else
          {
            v32 = (os_log_t)MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              v6 = v32;
              __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v50);
              _os_log_debug_impl(&dword_1DC678000, v6, OS_LOG_TYPE_DEBUG, "Deleted model url for modelId '%@'", v60, 0xCu);
            }
            objc_storeStrong((id *)&v32, 0);
            objc_msgSend(v54, "addObject:", v50);
            v43 = 0;
          }
        }
      }
      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v51, 0);
      ++v27;
      if (v25 + 1 >= v28)
      {
        v27 = 0;
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v66, 16);
        if (!v28)
          break;
      }
    }
  }

  v58[0] = CFSTR("deleted");
  v59[0] = v54;
  v58[1] = CFSTR("failures");
  v59[1] = v55;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v43 = 1;
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)removeOldColdstartBinaries:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *log;
  os_log_type_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  id obj;
  uint64_t v20;
  os_log_t v21;
  id v22;
  id v23;
  int v24;
  os_log_type_t type;
  os_log_t oslog;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD __b[8];
  id v33;
  id v34;
  id v35;
  id location[2];
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t v40[24];
  id v41;
  uint8_t v42[24];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v34 = (id)objc_msgSend(v18, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
  if (v20)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v20;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(obj);
      v33 = *(id *)(__b[1] + 8 * v16);
      v31 = 0;
      v30 = (id)objc_msgSend(v33, "objectForKey:", 0x1EA4B8F88);
      v29 = (id)objc_msgSend(v33, "objectForKey:", 0x1EA4BB0A8);
      v28 = v31;
      objc_msgSend(v37, "deleteColdstartBinaryFromStorage:forModel:isVersionChange:error:", v29, v30, 0, &v28);
      objc_storeStrong(&v31, v28);
      if (v31)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v11 = v29;
        v13 = (id)objc_msgSend(v31, "localizedDescription");
        v27 = (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("Error deleting directory '%@': %@"), v11, v13);

        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v10 = type;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v42, (uint64_t)v30, (uint64_t)v27);
          _os_log_error_impl(&dword_1DC678000, log, v10, "'%@': %@", v42, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        objc_msgSend(v35, "setObject:forKey:", v27, v30);
        v24 = 3;
        objc_storeStrong(&v27, 0);
      }
      else
      {
        v41 = v33;
        v8 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
        v23 = v31;
        +[AMDColdstartURL deleteColdstartURLs:error:](AMDColdstartURL, "deleteColdstartURLs:error:");
        objc_storeStrong(&v31, v23);

        if (v31)
        {
          v6 = (void *)MEMORY[0x1E0CB3940];
          v7 = (id)objc_msgSend(v31, "localizedDescription");
          v22 = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("Error deleting AMDColdstartBinary: %@"), v7);

          v21 = (os_log_t)MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v5 = v21;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v40, (uint64_t)v30, (uint64_t)v22);
            _os_log_error_impl(&dword_1DC678000, v5, OS_LOG_TYPE_ERROR, "'%@': %@", v40, 0x16u);
          }
          objc_storeStrong((id *)&v21, 0);
          objc_msgSend(v35, "setObject:forKey:", v22, v30);
          v24 = 3;
          objc_storeStrong(&v22, 0);
        }
        else
        {
          objc_msgSend(v34, "addObject:", v30);
          v24 = 0;
        }
      }
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
        if (!v17)
          break;
      }
    }
  }

  v38[0] = CFSTR("deleted");
  v39[0] = v34;
  v38[1] = CFSTR("failures");
  v39[1] = v35;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v24 = 1;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
