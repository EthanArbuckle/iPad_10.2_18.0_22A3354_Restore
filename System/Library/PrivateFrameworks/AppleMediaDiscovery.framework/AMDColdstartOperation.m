@implementation AMDColdstartOperation

+ (id)ensureNewDirectoryForBinaryWithModelId:(id)a3 andVersion:(id)a4
{
  double v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13[2];
  id v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location[3];
  id v23;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (id)objc_msgSend(v20, "URLsForDirectory:inDomains:", 14, 1);
  v19 = (id)objc_msgSend(v11, "lastObject");

  v18 = (id)objc_msgSend(v19, "URLByAppendingPathComponent:", 0x1EA4BD648);
  v17 = (id)objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("coldstartBinaries"));
  v16 = (id)objc_msgSend(v17, "URLByAppendingPathComponent:", location[0]);
  if (+[AMDMiscHelpers ensureDir:removeIfExists:](AMDMiscHelpers, "ensureDir:removeIfExists:", v16, 0))
  {
    v14 = (id)objc_msgSend(v21, "stringValue");
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    objc_msgSend(v6, "timeIntervalSince1970");
    v7 = (void *)v4;

    v13[1] = v7;
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v7);
    v13[0] = (id)objc_msgSend(v8, "stringValue");

    v9 = (id)objc_msgSend(v16, "URLByAppendingPathComponent:", v14);
    v12 = (id)objc_msgSend(v9, "URLByAppendingPathComponent:", v13[0]);

    if (+[AMDMiscHelpers ensureDir:removeIfExists:](AMDMiscHelpers, "ensureDir:removeIfExists:", v12, 1))
    {
      v23 = v12;
    }
    else
    {
      v23 = 0;
    }
    v15 = 1;
    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v23 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v23;
}

+ (id)saveColdStartBinaryforModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  os_log_t v21;
  id v22;
  id v23;
  os_log_type_t v24;
  os_log_t v25;
  id v26;
  id v27;
  id v28;
  os_log_type_t v29;
  os_log_t v30;
  id v31;
  int v32;
  os_log_type_t v33;
  os_log_t oslog;
  id v35;
  unsigned __int16 v36;
  int *v37;
  int *v38;
  uLong v39;
  int v40;
  id v41;
  int v42;
  os_log_type_t type;
  id v44;
  id v45;
  id v46;
  id *v47;
  id v48;
  id v49;
  id location[3];
  id v51;
  _QWORD v52[3];
  id v53[3];
  uint8_t v54[16];
  uint8_t v55[32];
  uint8_t v56[16];
  uint8_t v57[16];
  uint8_t v58[24];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v49 = 0;
  objc_storeStrong(&v49, a4);
  v48 = 0;
  objc_storeStrong(&v48, a5);
  v47 = a6;
  v46 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if ((objc_msgSend(v46, "fileExistsAtPath:", v49) & 1) != 0)
  {
    v16 = (void *)MEMORY[0x1E0C99D50];
    v17 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v49);
    v41 = (id)objc_msgSend(v16, "dataWithContentsOfURL:");

    v40 = 6;
    v39 = crc32(0, (const Bytef *)(objc_msgSend(objc_retainAutorelease(v41), "bytes") + 6), objc_msgSend(v41, "length") - 6);
    v38 = (int *)objc_msgSend(objc_retainAutorelease(v41), "bytes");
    v37 = v38;
    v36 = 0;
    v36 = *(_WORD *)v38;
    if (v36)
    {
      v35 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Format mismatch. Expected format:0 got:%d Binary cannot be processed for model: %@"), v36, location[0]);
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v33 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v35);
        _os_log_error_impl(&dword_1DC678000, oslog, v33, "%@", v57, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      *v47 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v35);
      v51 = 0;
      v42 = 1;
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v37 = (int *)((char *)v37 + 2);
      v32 = 0;
      v32 = *v37;
      if (v39 == v32)
      {
        v28 = +[AMDColdstartOperation ensureNewDirectoryForBinaryWithModelId:andVersion:](AMDColdstartOperation, "ensureNewDirectoryForBinaryWithModelId:andVersion:", location[0], v48);
        v27 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v49, 0);
        v15 = (id)objc_msgSend(v28, "URLByAppendingPathComponent:", CFSTR("coldstartbinary"));
        v26 = (id)objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("bin"));

        if ((objc_msgSend(v46, "copyItemAtURL:toURL:error:", v27, v26, v47) & 1) != 0 && !*v47)
        {
          objc_msgSend(v46, "removeItemAtURL:error:", v27, v47);
          if (*v47)
          {
            v21 = (os_log_t)MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v49);
              _os_log_error_impl(&dword_1DC678000, v21, OS_LOG_TYPE_ERROR, "could not delete downloaded Coldstart binary at location: %@", v54, 0xCu);
            }
            objc_storeStrong((id *)&v21, 0);
            v51 = 0;
            v42 = 1;
          }
          else
          {
            v52[0] = CFSTR("modelId");
            v53[0] = location[0];
            v52[1] = CFSTR("url");
            v8 = (id)objc_msgSend(v26, "path");
            v53[1] = v8;
            v52[2] = CFSTR("version");
            v7 = (id)objc_msgSend(v48, "stringValue");
            v53[2] = v7;
            v51 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);

            v42 = 1;
          }
        }
        else
        {
          v25 = (os_log_t)MEMORY[0x1E0C81028];
          v24 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v11 = v25;
            v12 = v24;
            v14 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v49);
            v9 = v14;
            v23 = v9;
            v10 = v28;
            v13 = (id)objc_msgSend(*v47, "localizedDescription");
            v22 = v13;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v55, (uint64_t)v9, (uint64_t)v10, (uint64_t)v22);
            _os_log_error_impl(&dword_1DC678000, v11, v12, "could not copy the compiled model from %@ to %@, %@", v55, 0x20u);

            objc_storeStrong(&v22, 0);
            objc_storeStrong(&v23, 0);
          }
          objc_storeStrong((id *)&v25, 0);
          v51 = 0;
          v42 = 1;
        }
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
      }
      else
      {
        v31 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CRC value mismatch. Binary cannot be processed for model: %@"), location[0]);
        v30 = (os_log_t)MEMORY[0x1E0C81028];
        v29 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v31);
          _os_log_error_impl(&dword_1DC678000, v30, v29, "%@", v56, 0xCu);
        }
        objc_storeStrong((id *)&v30, 0);
        *v47 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v31);
        v51 = 0;
        v42 = 1;
        objc_storeStrong(&v31, 0);
      }
    }
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v45 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Binary unavailable at path: %@ for model: %@"), v49, location[0]);
    v44 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v45);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v44, type, "%@", v58, 0xCu);
    }
    objc_storeStrong(&v44, 0);
    *v47 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v45);
    v51 = 0;
    v42 = 1;
    objc_storeStrong(&v45, 0);
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
  return v51;
}

+ (id)computeUpdatedScoresV2:(id)a3 withModel:(id)a4 andMappingDictionary:(id)a5
{
  id v5;
  id v6;
  int v7;
  id v8;
  double v9;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
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
  BOOL v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  os_log_t oslog;
  id v43;
  id v44;
  signed int k;
  signed int j;
  SparseMatrix_Float __dst;
  DenseVector_Float v48;
  DenseVector_Float v49;
  int i;
  id v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  _BYTE __b[40];
  int v57;
  unsigned __int8 v58;
  uint64_t v59;
  float v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  int v65;
  uint64_t *v66;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  float *v72;
  int *v73;
  int *v74;
  id v75;
  id v76;
  uint64_t v77;
  int v78;
  int v79;
  void (*v80)(id *, void *, void *);
  void *v81;
  id v82;
  id v83;
  unsigned int v84;
  unsigned int v85;
  os_log_type_t v86;
  id v87;
  id v88;
  id v89;
  os_log_type_t v90;
  id v91;
  int v92;
  uint64_t v93;
  os_log_type_t v94;
  id v95;
  id v96;
  id v97;
  id v98;
  os_log_type_t v99;
  id v100;
  id v101;
  id v102;
  os_log_type_t v103;
  id v104;
  id v105;
  os_log_type_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  int v111;
  os_log_type_t type;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id location[3];
  id v119;
  _QWORD v120[2];
  _QWORD v121[2];
  uint8_t v122[16];
  uint8_t v123[16];
  uint8_t v124[32];
  uint8_t v125[16];
  uint8_t v126[16];
  uint8_t v127[16];
  uint8_t v128[16];
  uint8_t v129[24];
  uint64_t v130;
  DenseVector_Float v131;
  DenseVector_Float v132;

  v130 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v117 = 0;
  objc_storeStrong(&v117, a4);
  v116 = 0;
  objc_storeStrong(&v116, a5);
  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", CFSTR("ColdStart"));
  v115 = 0;
  if (v117)
  {
    v109 = v115;
    v39 = +[AMDColdstartURL getColdstartURLForModel:error:](AMDColdstartURL, "getColdstartURLForModel:error:", v117, &v109);
    objc_storeStrong(&v115, v109);
    v110 = v39;
    if (v115)
    {
      v108 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error retrieving binary file from Coredata for model: %@"), v117);
      v107 = MEMORY[0x1E0C81028];
      v106 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v107, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v128, (uint64_t)v108);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v107, v106, "%@", v128, 0xCu);
      }
      objc_storeStrong(&v107, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v108, CFSTR("coldstartError"), 2);
      v119 = 0;
      v111 = 1;
      objc_storeStrong(&v108, 0);
    }
    else if (v110)
    {
      v102 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      if ((objc_msgSend(v102, "fileExistsAtPath:", v110) & 1) != 0)
      {
        v97 = v115;
        v38 = (id)objc_msgSend(v102, "attributesOfItemAtPath:error:", v110, &v97);
        objc_storeStrong(&v115, v97);
        v98 = v38;
        if (v115)
        {
          v96 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error extracting attributes of file: %@ for model: %@"), v110, v117);
          v95 = MEMORY[0x1E0C81028];
          v94 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v95, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v125, (uint64_t)v96);
            _os_log_error_impl(&dword_1DC678000, (os_log_t)v95, v94, "%@", v125, 0xCu);
          }
          objc_storeStrong(&v95, 0);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v96, CFSTR("coldstartError"), 2);
          v119 = 0;
          v111 = 1;
          objc_storeStrong(&v96, 0);
        }
        else
        {
          v93 = 0;
          v36 = (id)objc_msgSend(v98, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
          v37 = objc_msgSend(v36, "unsignedLongLongValue");

          v93 = v37;
          v92 = (v37 - 6) / 0x14uLL;
          v91 = MEMORY[0x1E0C81028];
          v90 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v124, (uint64_t)v110, (uint64_t)v117);
            _os_log_debug_impl(&dword_1DC678000, (os_log_t)v91, v90, "Loading Coldstart binary: %@ for model: %@", v124, 0x16u);
          }
          objc_storeStrong(&v91, 0);
          v35 = (void *)MEMORY[0x1E0C99D50];
          v34 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v110);
          v89 = (id)objc_msgSend(v35, "dataWithContentsOfURL:");

          if (v89)
          {
            v85 = 0;
            v85 = objc_msgSend(v116, "count");
            v84 = v85;
            v83 = (id)objc_opt_new();
            v33 = v116;
            v77 = MEMORY[0x1E0C809B0];
            v78 = -1073741824;
            v79 = 0;
            v80 = __79__AMDColdstartOperation_computeUpdatedScoresV2_withModel_andMappingDictionary___block_invoke;
            v81 = &unk_1EA4B5D08;
            v82 = v83;
            objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", &v77);
            v76 = (id)objc_msgSend(v83, "copy");
            v75 = (id)objc_msgSend(v116, "mutableCopy");
            v74 = (int *)malloc_type_malloc(4 * v92, 0x100004052888210uLL);
            v73 = (int *)malloc_type_malloc(4 * v92, 0x100004052888210uLL);
            v72 = (float *)malloc_type_malloc(4 * v92, 0x100004052888210uLL);
            v71 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v74, malloc_size(v74));
            v70 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v73, malloc_size(v73));
            v69 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v72, malloc_size(v72));
            v68 = 0;
            v67 = objc_msgSend(objc_retainAutorelease(v89), "bytes");
            v66 = (uint64_t *)(v67 + 6);
            v65 = 0;
            while (v65 < v92)
            {
              v64 = 0;
              v64 = *v66;
              v32 = v76;
              v31 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v64);
              v5 = (id)objc_msgSend(v32, "objectForKey:");
              v30 = v5 == 0;

              if (v30)
              {
                v29 = v83;
                v28 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v64);
                v6 = (id)objc_msgSend(v29, "objectForKey:");
                v27 = v6 != 0;

                if (v27)
                {
                  v20 = v83;
                  v19 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v64);
                  v63 = (id)objc_msgSend(v20, "objectForKey:");

                  v74[v65] = objc_msgSend(v63, "intValue");
                  objc_storeStrong(&v63, 0);
                }
                else
                {
                  v26 = v83;
                  v25 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v84);
                  v24 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v64);
                  objc_msgSend(v26, "setObject:forKey:", v25);

                  v23 = v75;
                  v22 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v64);
                  v21 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v84);
                  objc_msgSend(v23, "setObject:forKey:", v22);

                  v74[v65] = v84++;
                }
                ++v66;
                v62 = 0;
                v62 = *v66;
                v18 = v83;
                v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v62);
                v61 = (id)objc_msgSend(v18, "objectForKey:");

                v73[v65] = objc_msgSend(v61, "intValue");
                ++v66;
                v60 = 0.0;
                v60 = *(float *)v66;
                v66 = (uint64_t *)((char *)v66 + 4);
                v72[v65++] = v60;
                objc_storeStrong(&v61, 0);
              }
              else
              {
                v66 = (uint64_t *)((char *)v66 + 20);
                ++v65;
              }
            }
            v59 = v65;
            v58 = 1;
            v57 = 0;
            memset(__b, 0, sizeof(__b));
            LODWORD(v55) = 0;
            SparseConvertFromCoordinate(v55, v74, v73, v72, v84, v85, v65, 1u, (uint64_t)__b);
            v54 = malloc_type_malloc(4 * v92, 0x100004052888210uLL);
            v53 = malloc_type_malloc(4 * (int)v84, 0x100004052888210uLL);
            v52 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v54, malloc_size(v54));
            v51 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v53, malloc_size(v53));
            for (i = 0; i < (unint64_t)objc_msgSend(location[0], "count"); ++i)
            {
              v16 = (id)objc_msgSend(location[0], "objectAtIndex:", i);
              objc_msgSend(v16, "floatValue");
              *((_DWORD *)v54 + i) = v7;

            }
            *(_QWORD *)&v49.count = v85;
            v49.data = (float *)v54;
            v48 = (DenseVector_Float)0;
            v48.count = v84;
            v48.data = (float *)v53;
            memcpy(&__dst, __b, sizeof(__dst));
            *(_QWORD *)&v131.count = v85;
            v131.data = (float *)v54;
            *(_QWORD *)&v132.count = *(_QWORD *)&v48.count;
            v132.data = (float *)v53;
            SparseMultiply(&__dst, v131, v132);
            for (j = 0; j < (int)v85; ++j)
              *((_DWORD *)v53 + j) = *((_DWORD *)v54 + j);
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (int)v84);
            v8 = v68;
            v68 = v15;

            for (k = 0; k < (int)v84; ++k)
            {
              v14 = v68;
              LODWORD(v9) = *((_DWORD *)v53 + k);
              v13 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
              objc_msgSend(v14, "addObject:");

            }
            v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v85);
            objc_msgSend(v44, "setObject:forKey:");

            v11 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v84);
            objc_msgSend(v44, "setObject:forKey:");

            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v44, CFSTR("coldstartSummary"), 2);
            +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("ColdStart"));
            objc_storeStrong(&v44, 0);
            objc_storeStrong(&v51, 0);
            objc_storeStrong(&v52, 0);
            if (v68)
            {
              v120[0] = CFSTR("recomputedScores");
              v121[0] = v68;
              v120[1] = CFSTR("updatedRemapdict");
              v121[1] = v75;
              v119 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 2);
              v111 = 1;
            }
            else
            {
              v43 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Coldstart: Error computing updated scores"));
              oslog = (os_log_t)MEMORY[0x1E0C81028];
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v122, (uint64_t)v43);
                _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v122, 0xCu);
              }
              objc_storeStrong((id *)&oslog, 0);
              +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v43, CFSTR("coldstartError"), 2);
              v119 = 0;
              v111 = 1;
              objc_storeStrong(&v43, 0);
            }
            objc_storeStrong(&v68, 0);
            objc_storeStrong(&v69, 0);
            objc_storeStrong(&v70, 0);
            objc_storeStrong(&v71, 0);
            objc_storeStrong(&v75, 0);
            objc_storeStrong(&v76, 0);
            objc_storeStrong(&v82, 0);
            objc_storeStrong(&v83, 0);
          }
          else
          {
            v88 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not read from file %@"), v110);
            v87 = MEMORY[0x1E0C81028];
            v86 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v87, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v123, (uint64_t)v88);
              _os_log_error_impl(&dword_1DC678000, (os_log_t)v87, v86, "%@", v123, 0xCu);
            }
            objc_storeStrong(&v87, 0);
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v88, CFSTR("coldstartError"), 2);
            v119 = 0;
            v111 = 1;
            objc_storeStrong(&v88, 0);
          }
          objc_storeStrong(&v89, 0);
        }
        objc_storeStrong(&v98, 0);
      }
      else
      {
        v101 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Binary unavailable at path: %@ for model: %@"), v110, v117);
        v100 = MEMORY[0x1E0C81028];
        v99 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v100, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v126, (uint64_t)v101);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v100, v99, "%@", v126, 0xCu);
        }
        objc_storeStrong(&v100, 0);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v101, CFSTR("coldstartError"), 2);
        v119 = 0;
        v111 = 1;
        objc_storeStrong(&v101, 0);
      }
      objc_storeStrong(&v102, 0);
    }
    else
    {
      v105 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Coldstart binary missing for model: %@"), v117);
      v104 = MEMORY[0x1E0C81028];
      v103 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v104, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v127, (uint64_t)v105);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v104, v103, "%@", v127, 0xCu);
      }
      objc_storeStrong(&v104, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v105, CFSTR("coldstartError"), 2);
      v119 = 0;
      v111 = 1;
      objc_storeStrong(&v105, 0);
    }
    objc_storeStrong(&v110, 0);
  }
  else
  {
    v114 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Coldstart modelId being passed is nil"));
    v113 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v129, (uint64_t)v114);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v113, type, "%@", v129, 0xCu);
    }
    objc_storeStrong(&v113, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v114, CFSTR("coldstartError"), 2);
    v119 = 0;
    v111 = 1;
    objc_storeStrong(&v114, 0);
  }
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(location, 0);
  return v119;
}

void __79__AMDColdstartOperation_computeUpdatedScoresV2_withModel_andMappingDictionary___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

@end
