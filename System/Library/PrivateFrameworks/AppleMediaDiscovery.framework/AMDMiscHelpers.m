@implementation AMDMiscHelpers

+ (void)setAppStoreDirAttributes
{
  id location;
  dispatch_once_t *v3;

  v3 = (dispatch_once_t *)&setAppStoreDirAttributes_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v3 != -1)
    dispatch_once(v3, location);
  objc_storeStrong(&location, 0);
}

void __42__AMDMiscHelpers_setAppStoreDirAttributes__block_invoke(void *a1)
{
  NSObject *v1;
  os_log_type_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  uint8_t v9[7];
  char v10;
  id v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19[3];
  uint8_t v20[24];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v19[2] = a1;
  v19[1] = a1;
  v19[0] = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (id)objc_msgSend(v19[0], "URLsForDirectory:inDomains:", 14);
  v18 = (id)objc_msgSend(v5, "lastObject");

  v17 = 0;
  v16 = 0;
  v6 = v18;
  v21 = *MEMORY[0x1E0C999D8];
  v22[0] = MEMORY[0x1E0C9AAB0];
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v15 = v17;
  v8 = objc_msgSend(v6, "setResourceValues:error:");
  objc_storeStrong(&v17, v15);

  v16 = v8 & 1;
  if ((v8 & 1) != 0 && !v17)
  {
    v11 = MEMORY[0x1E0C81028];
    v10 = 2;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
    {
      v1 = v11;
      v2 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_debug_impl(&dword_1DC678000, v1, v2, "Set NSURLIsExcludedFromBackupKey on root directory", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (id)objc_msgSend(v17, "localizedDescription");
    v14 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Failed to set NSURLIsExcludedFromBackupKey flag: %@"), v4);

    v13 = MEMORY[0x1E0C81028];
    v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)v14);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v13, v12, "%@", v20, 0xCu);
    }
    objc_storeStrong(&v13, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v14, CFSTR("SetAppStoreDirAttributesError"), 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (BOOL)ensureDir:(id)a3 removeIfExists:(BOOL)a4
{
  char v5;
  char v6;
  os_log_t v8;
  os_log_type_t v9;
  os_log_t v10;
  id obj;
  char v12;
  id v13;
  os_log_type_t v14;
  os_log_t oslog;
  os_log_type_t v16;
  id v17;
  id v18;
  id v19;
  int v20;
  os_log_type_t v21;
  id v22;
  id v23;
  char v24;
  id v25;
  BOOL v26;
  id location[3];
  char v28;
  uint8_t v29[16];
  uint8_t v30[32];
  uint8_t v31[16];
  uint8_t v32[32];
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = a4;
  v25 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = 0;
  v23 = (id)objc_msgSend(location[0], "path");
  if ((objc_msgSend(v25, "fileExistsAtPath:isDirectory:", v23, &v24) & 1) == 0)
    goto LABEL_15;
  if (!v26)
  {
    v22 = MEMORY[0x1E0C81028];
    v21 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v33, (uint64_t)v23, v24 & 1);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v22, v21, "Existing %@, is-directory: %d", v33, 0x12u);
    }
    objc_storeStrong(&v22, 0);
    v28 = v24 & 1;
    v20 = 1;
    goto LABEL_24;
  }
  v19 = 0;
  v18 = 0;
  v6 = objc_msgSend(v25, "removeItemAtURL:error:", location[0], &v18);
  objc_storeStrong(&v19, v18);
  if ((v6 & 1) != 0 && !v19)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    v14 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v23);
      _os_log_debug_impl(&dword_1DC678000, oslog, v14, "Removed dir %@", v31, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v20 = 0;
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v32, (uint64_t)v23, (uint64_t)v19);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v17, v16, "Could not remove existing dir %@, %@", v32, 0x16u);
    }
    objc_storeStrong(&v17, 0);
    v28 = 1;
    v20 = 1;
  }
  objc_storeStrong(&v19, 0);
  if (!v20)
  {
LABEL_15:
    v13 = 0;
    v12 = 0;
    obj = 0;
    v5 = objc_msgSend(v25, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", location[0], 1, 0, &obj);
    objc_storeStrong(&v13, obj);
    v12 = v5 & 1;
    if ((v5 & 1) != 0 && !v13)
    {
      v8 = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v23);
        _os_log_debug_impl(&dword_1DC678000, v8, OS_LOG_TYPE_DEBUG, "Created dir %@", v29, 0xCu);
      }
      objc_storeStrong((id *)&v8, 0);
      v28 = 1;
      v20 = 1;
    }
    else
    {
      v10 = (os_log_t)MEMORY[0x1E0C81028];
      v9 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v30, (uint64_t)v23, (uint64_t)v13);
        _os_log_error_impl(&dword_1DC678000, v10, v9, "Could not create dir %@, %@", v30, 0x16u);
      }
      objc_storeStrong((id *)&v10, 0);
      v28 = 0;
      v20 = 1;
    }
    objc_storeStrong(&v13, 0);
  }
LABEL_24:
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

+ (BOOL)createOrMoveSymbolicLinkAtURL:(id)a3 toDestinationURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  NSObject *log;
  os_log_type_t type;
  id v13;
  id v14;
  id v15;
  char v16;
  BOOL v17;
  id v19;
  id v20;
  id v21;
  os_log_t v22;
  os_log_type_t v23;
  os_log_t oslog;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  int v31;
  id v32;
  char v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id location[3];
  char v42;
  uint8_t v43[32];
  uint8_t v44[32];
  uint8_t v45[16];
  uint8_t v46[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = 0;
  objc_storeStrong(&v40, a4);
  v39 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v38 = 0;
  v19 = v39;
  v21 = (id)objc_msgSend(location[0], "path");
  v36 = v38;
  v20 = (id)objc_msgSend(v19, "attributesOfItemAtPath:error:");
  objc_storeStrong(&v38, v36);
  v37 = v20;

  if (v20 && !v38)
  {
    v14 = v39;
    v15 = (id)objc_msgSend(location[0], "path");
    v35 = v38;
    v16 = objc_msgSend(v14, "removeItemAtPath:error:");
    objc_storeStrong(&v38, v35);
    v17 = 1;
    if ((v16 & 1) != 0)
      v17 = v38 != 0;

    if (v17)
    {
      v34 = MEMORY[0x1E0C81028];
      v33 = 16;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        log = v34;
        type = v33;
        v13 = (id)objc_msgSend(location[0], "path");
        v32 = v13;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v46, (uint64_t)v32, (uint64_t)v38);
        _os_log_error_impl(&dword_1DC678000, log, type, "Could not remove existing link %@, %@", v46, 0x16u);

        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(&v34, 0);
      v42 = 0;
      v31 = 1;
      goto LABEL_21;
    }
    v30 = MEMORY[0x1E0C81028];
    v29 = 2;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
    {
      v8 = v30;
      v9 = v29;
      v10 = (id)objc_msgSend(location[0], "path");
      v28 = v10;
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v28);
      _os_log_debug_impl(&dword_1DC678000, v8, v9, "Removed existing link %@", v45, 0xCu);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v30, 0);
  }
  v27 = v38;
  objc_msgSend(v39, "createSymbolicLinkAtURL:withDestinationURL:error:", location[0], v40, &v27);
  objc_storeStrong(&v38, v27);
  objc_storeStrong(&v38, 0);
  v5 = v39;
  v7 = (id)objc_msgSend(location[0], "path");
  v25 = v38;
  v6 = (id)objc_msgSend(v5, "attributesOfItemAtPath:error:");
  objc_storeStrong(&v38, v25);
  v26 = v6;

  if (v6 && !v38)
  {
    v22 = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v43, (uint64_t)location[0], (uint64_t)v40);
      _os_log_debug_impl(&dword_1DC678000, v22, OS_LOG_TYPE_DEBUG, "Created link %@ to %@", v43, 0x16u);
    }
    objc_storeStrong((id *)&v22, 0);
    v42 = 1;
    v31 = 1;
  }
  else
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    v23 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v44, (uint64_t)location[0], (uint64_t)v40, (uint64_t)v38);
      _os_log_error_impl(&dword_1DC678000, oslog, v23, "Could not create symbolic link %@ to %@, %@", v44, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v42 = 0;
    v31 = 1;
  }
  objc_storeStrong(&v26, 0);
LABEL_21:
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  return v42 & 1;
}

+ (void)printInput:(id)a3 withRawData:(void *)a4 withType:(int64_t)a5 andSize:(int)a6
{
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v16;
  int v17;
  os_log_type_t type;
  os_log_t oslog;
  unsigned int v20;
  int k;
  double *v22;
  int v23;
  int j;
  double *v25;
  double v26;
  int i;
  double *v28;
  id v29;
  id v30;
  int v31;
  uint64_t v32;
  double *v33;
  id location[3];
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = (double *)a4;
  v32 = a5;
  v31 = a6;
  v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a6);
  v29 = 0;
  if (a5 == 65600)
  {
    objc_storeStrong(&v29, CFSTR("double"));
    v28 = v33;
    for (i = 0; i < v31; ++i)
    {
      v26 = 0.0;
      v26 = *v28++;
      v11 = v30;
      v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      objc_msgSend(v11, "addObject:");

    }
LABEL_19:
    v16 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature name: %@, type: %@, value: %@"), location[0], v29, v30);
    +[AMDPerf log:atLevel:](AMDPerf, "log:atLevel:", v16, 3);
    objc_storeStrong(&v16, 0);
    v17 = 0;
    goto LABEL_20;
  }
  if (v32 == 65568)
  {
    objc_storeStrong(&v29, CFSTR("float"));
    v25 = v33;
    for (j = 0; j < v31; ++j)
    {
      v23 = 0;
      v23 = *(_DWORD *)v25;
      v25 = (double *)((char *)v25 + 4);
      v9 = v30;
      LODWORD(v6) = v23;
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      objc_msgSend(v9, "addObject:");

    }
    goto LABEL_19;
  }
  if (v32 == 131104)
  {
    objc_storeStrong(&v29, CFSTR("int"));
    v22 = v33;
    for (k = 0; k < v31; ++k)
    {
      v20 = 0;
      v20 = *(_DWORD *)v22;
      v22 = (double *)((char *)v22 + 4);
      v7 = v30;
      v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
      objc_msgSend(v7, "addObject:");

    }
    goto LABEL_19;
  }
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v35, v32);
    _os_log_error_impl(&dword_1DC678000, oslog, type, "Unsupported Input Data Type: %ld", v35, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v17 = 1;
LABEL_20:
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)isValidDSID:(id)a3
{
  id location[3];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "longLongValue");
  v5 = 1;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

+ (void)AMDInitialize:(id)a3
{
  _BOOL4 v3;
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("disableCoreData"));
  v9 = 0;
  if (v10)
    v5 = objc_msgSend(v10, "intValue") != 0;
  else
    v5 = 0;
  v9 = v5;
  if (!v5)
  {
    v4 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
    v8 = (id)objc_msgSend(v4, "getManagedObjectContext");

    objc_storeStrong(&v8, 0);
  }
  v7 = +[AMDSQLite allocSharedInstance](AMDSQLite, "allocSharedInstance");
  v6 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B9248);
  if (v6)
    v3 = objc_msgSend(v6, "intValue") != 0;
  else
    v3 = 0;
  objc_msgSend(v7, "setEnable:", v3);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (void)AMDPerformCleanup
{
  NSObject *v2;
  os_log_type_t v3;
  NSObject *log;
  os_log_type_t type;
  id v6;
  uint8_t v7[15];
  char v8;
  id v9;
  unsigned int v10;
  int v11;
  uint8_t v12[15];
  char v13;
  id location;
  id v15[3];

  v15[2] = a1;
  v15[1] = (id)a2;
  v15[0] = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if (objc_msgSend(v15[0], "getDb"))
  {
    v10 = sqlite3_close((sqlite3 *)objc_msgSend(v15[0], "getDb"));
    if (v10)
    {
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQL Connection could not be closed with error code: %u"), v10);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v6, CFSTR("AMDCleanupFailed"), 0);
      objc_storeStrong(&v6, 0);
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v8 = 1;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
      {
        v2 = v9;
        v3 = v8;
        __os_log_helper_16_0_0(v7);
        _os_log_impl(&dword_1DC678000, v2, v3, "SQL Connection closed successfully", v7, 2u);
      }
      objc_storeStrong(&v9, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("SQL connection closed"), CFSTR("AMDCleanupSuccess"), 0);
    }
    v11 = 0;
  }
  else
  {
    location = MEMORY[0x1E0C81028];
    v13 = 1;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      log = location;
      type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_impl(&dword_1DC678000, log, type, "Nil SQL database connection", v12, 2u);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("SQL database unusable"), CFSTR("AMDCleanupFailed"), 0);
    v11 = 1;
  }
  objc_storeStrong(v15, 0);
}

+ (id)logAndCreateError:(int64_t)a3 errorMessage:(id)a4
{
  id v5;
  os_log_t oslog;
  id location;
  int64_t v8;
  SEL v9;
  id v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)location);
    _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v11, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", v8, location);
  objc_storeStrong(&location, 0);
  return v5;
}

+ (id)getCurrentEpochSeconds
{
  double v2;
  id v4;
  id v5[3];

  v5[2] = a1;
  v5[1] = (id)a2;
  v5[0] = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(v5[0], "timeIntervalSince1970");
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  objc_storeStrong(v5, 0);
  return v4;
}

+ (id)sortArrayElements:(id)a3 inDescendingOrder:(BOOL)a4 withComparisonKey:(id)a5 isKeyString:(BOOL)a6
{
  id v7;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(_QWORD *, void *, void *);
  void *v16;
  id v17[3];
  _QWORD v18[2];
  int v19;
  int v20;
  BOOL v21;
  _QWORD v22[2];
  int v23;
  int v24;
  BOOL v25;
  BOOL v26;
  id v27;
  BOOL v28;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = a6;
  v22[0] = 0;
  v22[1] = v22;
  v23 = 0x20000000;
  v24 = 32;
  v25 = a6;
  v18[0] = 0;
  v18[1] = v18;
  v19 = 0x20000000;
  v20 = 32;
  v21 = v28;
  v11 = location[0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __84__AMDMiscHelpers_sortArrayElements_inDescendingOrder_withComparisonKey_isKeyString___block_invoke;
  v16 = &unk_1EA4B5688;
  v17[1] = v18;
  v17[0] = v27;
  v17[2] = v22;
  v7 = (id)objc_msgSend(v11, "sortedArrayUsingComparator:", &v12);
  objc_storeStrong(v17, 0);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v22, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v7;
}

uint64_t __84__AMDMiscHelpers_sortArrayElements_inDescendingOrder_withComparisonKey_isKeyString___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v12;
  id v13[2];
  id v14;
  id location[2];
  uint64_t v16;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = 0;
  v12 = 0;
  if ((*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) & 1) != 0)
  {
    v3 = (id)objc_msgSend(v14, "objectForKey:", a1[4]);
    v4 = v13[0];
    v13[0] = v3;

    v5 = (id)objc_msgSend(location[0], "objectForKey:", a1[4]);
  }
  else
  {
    v7 = (id)objc_msgSend(location[0], "objectForKey:", a1[4]);
    v8 = v13[0];
    v13[0] = v7;

    v5 = (id)objc_msgSend(v14, "objectForKey:", a1[4]);
  }
  v6 = v12;
  v12 = v5;

  v16 = objc_msgSend(v13[0], "compare:", v12);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)convertDataArrayToBase64StringArray:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id v10;
  _QWORD __b[8];
  id v12;
  id v13;
  int v14;
  id location[3];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(__b, 0, sizeof(__b));
    obj = location[0];
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
    if (v9)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v12 = *(id *)(__b[1] + 8 * v6);
        v10 = (id)objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
        objc_msgSend(v13, "addObject:", v10);
        objc_storeStrong(&v10, 0);
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
          if (!v7)
            break;
        }
      }
    }
    v14 = 0;

    if (!v14)
    {
      v16 = v13;
      v14 = 1;
    }
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v16 = 0;
    v14 = 1;
  }
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)extractPECSimilarityScores:(id)a3 error:(id *)a4
{
  id v4;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id obj;
  uint64_t v18;
  id v20;
  id v21;
  _QWORD __b[8];
  id v23;
  id v24;
  int v25;
  id *v26;
  id location[3];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = a4;
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      memset(__b, 0, sizeof(__b));
      obj = location[0];
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
      if (v18)
      {
        v14 = *(_QWORD *)__b[2];
        v15 = 0;
        v16 = v18;
        while (1)
        {
          v13 = v15;
          if (*(_QWORD *)__b[2] != v14)
            objc_enumerationMutation(obj);
          v23 = *(id *)(__b[1] + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v7 = v21;
          v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "identifier"));
          objc_msgSend(v7, "setObject:forKey:");

          v10 = v21;
          v9 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "score");
          v11 = (id)objc_msgSend(v9, "numberWithFloat:");
          objc_msgSend(v10, "setObject:forKey:");

          v12 = (id)objc_msgSend(v23, "metadata");
          if (v12)
          {
            v6 = (id)objc_msgSend(v23, "metadata");
            v20 = (id)objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);

            objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("metadata"));
            objc_storeStrong(&v20, 0);
          }
          objc_msgSend(v24, "addObject:", v21);
          objc_storeStrong(&v21, 0);
          ++v15;
          if (v13 + 1 >= v16)
          {
            v15 = 0;
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
            if (!v16)
              goto LABEL_15;
          }
        }
        v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("score not an instance of CMLSimilarityScore"));
        *v26 = v4;
        v28 = 0;
        v25 = 1;
      }
      else
      {
LABEL_15:
        v25 = 0;
      }

      if (!v25)
      {
        v28 = v24;
        v25 = 1;
      }
      objc_storeStrong(&v24, 0);
    }
    else
    {
      *v26 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 14, CFSTR("similarityScoresArray not an instance of NSArray"));
      v28 = 0;
      v25 = 1;
    }
  }
  else
  {
    v28 = 0;
    v25 = 1;
  }
  objc_storeStrong(location, 0);
  return v28;
}

@end
