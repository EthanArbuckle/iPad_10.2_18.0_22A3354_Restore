@implementation AMDModelAssets

- (id)getContentToLogicalMap
{
  return -[AMDModelAssets contentToLogicalMap](self, "contentToLogicalMap", a2, self);
}

- (id)getLogicalToContentMap
{
  return -[AMDModelAssets logicalToContentMap](self, "logicalToContentMap", a2, self);
}

- (BOOL)getMinimalMapPresent
{
  return -[AMDModelAssets minimalMapPresent](self, "minimalMapPresent", a2, self);
}

+ (id)loadMapFromDir:(id)a3 andFile:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  void *v8;
  id v9;
  id v12;
  id v13;
  char v14;
  os_log_t v15;
  os_log_type_t v16;
  os_log_t oslog;
  id v18;
  unsigned int v19;
  int v20;
  int *v21;
  os_log_type_t v22;
  id v23;
  id v24;
  id v25;
  os_log_type_t v26;
  id v27;
  int v28;
  os_log_type_t v29;
  id v30;
  id v31;
  id *v32;
  id v33;
  id location[3];
  id v35;
  uint8_t v36[32];
  uint8_t v37[16];
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t v40[24];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = a5;
  v12 = (id)objc_msgSend(location[0], "stringByAppendingPathComponent:", v33);
  v31 = (id)objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("bin"));

  v13 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v31);

  if ((v14 & 1) != 0)
  {
    v27 = MEMORY[0x1E0C81028];
    v26 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v39, (uint64_t)v31);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v27, v26, "Loading binary map data from %@", v39, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    v8 = (void *)MEMORY[0x1E0C99D50];
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v31);
    v25 = (id)objc_msgSend(v8, "dataWithContentsOfURL:");

    if (v25)
    {
      v21 = (int *)objc_msgSend(objc_retainAutorelease(v25), "bytes");
      v20 = 0;
      v20 = *v21++;
      v19 = 12 * v20 + 4;
      if (objc_msgSend(v25, "length") == v19)
      {
        v15 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_2_4_0_8_0((uint64_t)v36, v20, objc_msgSend(v25, "length"));
          _os_log_debug_impl(&dword_1DC678000, v15, OS_LOG_TYPE_DEBUG, "Number of map entries: %u, buffer size: %lu", v36, 0x12u);
        }
        objc_storeStrong((id *)&v15, 0);
        v35 = v25;
        v28 = 1;
      }
      else
      {
        v18 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected buffer size: %lu (expected: %u)"), objc_msgSend(v25, "length"), v19);
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        v16 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v18);
          _os_log_error_impl(&dword_1DC678000, oslog, v16, "%@", v37, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v18);
        *v32 = v6;
        v35 = 0;
        v28 = 1;
        objc_storeStrong(&v18, 0);
      }
    }
    else
    {
      v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not read from file %@"), v31);
      v23 = MEMORY[0x1E0C81028];
      v22 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)v24);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v23, v22, "%@", v38, 0xCu);
      }
      objc_storeStrong(&v23, 0);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v24);
      *v32 = v5;
      v35 = 0;
      v28 = 1;
      objc_storeStrong(&v24, 0);
    }
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v30 = MEMORY[0x1E0C81028];
    v29 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v31);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v30, v29, "Data file not present: %@", v40, 0xCu);
    }
    objc_storeStrong(&v30, 0);
    *v32 = 0;
    v35 = 0;
    v28 = 1;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v35;
}

- (void)loadCToLMapFromDir:(id)a3 error:(id *)a4
{
  id v4;
  NSData *v5;
  id location[2];
  AMDModelAssets *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[AMDModelAssets useBinaryInputMap](v8, "useBinaryInputMap"))
  {
    v4 = +[AMDModelAssets loadMapFromDir:andFile:error:](AMDModelAssets, "loadMapFromDir:andFile:error:", location[0], CFSTR("content_id_to_logical_id"), a4);
    -[AMDModelAssets setContentToLogicalMap:](v8, "setContentToLogicalMap:");

    v5 = -[AMDModelAssets contentToLogicalMap](v8, "contentToLogicalMap");
    if (v5)
      +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("loadedCToL"));
  }
  objc_storeStrong(location, 0);
}

- (void)loadLToCMapFromDir:(id)a3 error:(id *)a4
{
  id v4;
  NSData *v5;
  id location[2];
  AMDModelAssets *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[AMDModelAssets useBinaryOutputMap](v8, "useBinaryOutputMap"))
  {
    v4 = +[AMDModelAssets loadMapFromDir:andFile:error:](AMDModelAssets, "loadMapFromDir:andFile:error:", location[0], CFSTR("label_index_to_content_id"), a4);
    -[AMDModelAssets setLogicalToContentMap:](v8, "setLogicalToContentMap:");

    v5 = -[AMDModelAssets logicalToContentMap](v8, "logicalToContentMap");
    if (v5)
      +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("loadedLToC"));
  }
  objc_storeStrong(location, 0);
}

+ (void)saveMap:(id)a3 toDir:(id)a4 inFile:(id)a5 keyIsInt64:(BOOL)a6 error:(id *)a7
{
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  char v23;
  id v24;
  os_log_t v29;
  id v30;
  uint64_t v31;
  os_log_type_t v32;
  os_log_t v33;
  id v34;
  char v35;
  id v36;
  os_log_type_t v37;
  os_log_t oslog;
  _QWORD v39[8];
  id v40;
  _QWORD __b[8];
  id v42;
  _DWORD *v43;
  _DWORD *v44;
  os_log_type_t v45;
  id v46;
  unsigned int v47;
  int v48;
  int v49;
  os_log_type_t type;
  id v51;
  id v52;
  id *v53;
  BOOL v54;
  id v55;
  id v56;
  id location[3];
  uint8_t v58[16];
  uint8_t v59[16];
  uint8_t v60[32];
  _BYTE v61[128];
  _BYTE v62[128];
  uint8_t v63[16];
  uint8_t v64[24];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = 0;
  objc_storeStrong(&v56, a4);
  v55 = 0;
  objc_storeStrong(&v55, a5);
  v54 = a6;
  v53 = a7;
  v24 = (id)objc_msgSend(v56, "stringByAppendingPathComponent:", v55);
  v52 = (id)objc_msgSend(v24, "stringByAppendingPathExtension:", CFSTR("bin"));

  v22 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = objc_msgSend(v22, "fileExistsAtPath:", v52);

  if ((v23 & 1) != 0)
  {
    v51 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v52);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v51, type, "Data file already present: %@", v64, 0xCu);
    }
    objc_storeStrong(&v51, 0);
    v49 = 1;
  }
  else
  {
    v48 = objc_msgSend(location[0], "count");
    v47 = 12 * v48 + 4;
    v46 = MEMORY[0x1E0C81028];
    v45 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_2_4_0_4_0((uint64_t)v63, v48, v47);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v46, v45, "Preparing %u entries, buffer size: %u", v63, 0xEu);
    }
    objc_storeStrong(&v46, 0);
    v44 = malloc_type_malloc(v47, 0x7F2C589BuLL);
    v43 = v44;
    *v44 = v48;
    ++v43;
    if (v54)
    {
      memset(__b, 0, sizeof(__b));
      v20 = location[0];
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
      if (v21)
      {
        v17 = *(_QWORD *)__b[2];
        v18 = 0;
        v19 = v21;
        while (1)
        {
          v16 = v18;
          if (*(_QWORD *)__b[2] != v17)
            objc_enumerationMutation(v20);
          v42 = *(id *)(__b[1] + 8 * v18);
          v15 = (id)objc_msgSend(location[0], "objectForKey:", v42);
          *v43 = objc_msgSend(v15, "intValue");

          *(_QWORD *)++v43 = objc_msgSend(v42, "longLongValue");
          v43 += 2;
          ++v18;
          if (v16 + 1 >= v19)
          {
            v18 = 0;
            v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
            if (!v19)
              break;
          }
        }
      }

    }
    else
    {
      memset(v39, 0, sizeof(v39));
      v13 = location[0];
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v39, v61, 16);
      if (v14)
      {
        v10 = *(_QWORD *)v39[2];
        v11 = 0;
        v12 = v14;
        while (1)
        {
          v9 = v11;
          if (*(_QWORD *)v39[2] != v10)
            objc_enumerationMutation(v13);
          v40 = *(id *)(v39[1] + 8 * v11);
          *v43++ = objc_msgSend(v40, "intValue");
          v8 = (id)objc_msgSend(location[0], "objectForKey:", v40);
          *(_QWORD *)v43 = objc_msgSend(v8, "longLongValue");

          v43 += 2;
          ++v11;
          if (v9 + 1 >= v12)
          {
            v11 = 0;
            v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v39, v61, 16);
            if (!v12)
              break;
          }
        }
      }

    }
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    v37 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_4_0_8_64((uint64_t)v60, v48, (uint64_t)v52);
      _os_log_debug_impl(&dword_1DC678000, oslog, v37, "Saving binary map data (%u entries) to %@", v60, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v36 = (id)objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:", v52, 0);
    v35 = 0;
    if (v36)
    {
      objc_msgSend(v36, "open");
      v31 = objc_msgSend(v36, "write:maxLength:", v44, v47);
      if (v31 > 0)
      {
        v49 = 0;
      }
      else
      {
        v30 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error writing to %@"), v52);
        v29 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v30);
          _os_log_error_impl(&dword_1DC678000, v29, OS_LOG_TYPE_ERROR, "%@", v58, 0xCu);
        }
        objc_storeStrong((id *)&v29, 0);
        *v53 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v30);
        v49 = 1;
        objc_storeStrong(&v30, 0);
      }
    }
    else
    {
      v34 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not open output stream to file %@"), v52);
      v33 = (os_log_t)MEMORY[0x1E0C81028];
      v32 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v34);
        _os_log_error_impl(&dword_1DC678000, v33, v32, "%@", v59, 0xCu);
      }
      objc_storeStrong((id *)&v33, 0);
      *v53 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v34);
      v49 = 1;
      objc_storeStrong(&v34, 0);
    }
    v7 = v49;
    free(v44);
    objc_msgSend(v36, "close");
    if ((v35 & 1) != 0)
      objc_exception_rethrow();
    v49 = v7;
    if (v7)
    {
      if (v7 == 6)
      {
        __break(1u);
        JUMPOUT(0x1DC6ED070);
      }
    }
    else
    {
      v49 = 0;
    }
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
}

- (void)saveCToLMap:(id)a3 toDir:(id)a4 error:(id *)a5
{
  id v7;
  id location[2];
  AMDModelAssets *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (-[AMDModelAssets useBinaryInputMap](v9, "useBinaryInputMap"))
  {
    +[AMDModelAssets saveMap:toDir:inFile:keyIsInt64:error:](AMDModelAssets, "saveMap:toDir:inFile:keyIsInt64:error:", location[0], v7, CFSTR("content_id_to_logical_id"), 1, a5);
    +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("savedCToL"));
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)saveLToCMap:(id)a3 toDir:(id)a4 error:(id *)a5
{
  id v7;
  id location[2];
  AMDModelAssets *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (-[AMDModelAssets useBinaryInputMap](v9, "useBinaryInputMap"))
  {
    +[AMDModelAssets saveMap:toDir:inFile:keyIsInt64:error:](AMDModelAssets, "saveMap:toDir:inFile:keyIsInt64:error:", location[0], v7, CFSTR("label_index_to_content_id"), 0, a5);
    +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("savedLToC"));
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)initFromDir:(id)a3 andMetadata:(id)a4 useBinaryInputMap:(BOOL)a5 useBinaryOutputMap:(BOOL)a6 withModelId:(id)a7 isInference:(BOOL)a8 error:(id *)a9
{
  id v9;
  NSObject *log;
  os_log_type_t v12;
  id v13;
  uint8_t v19[7];
  os_log_type_t type;
  os_log_t oslog;
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  objc_super v27;
  id *v28;
  BOOL v29;
  id v30;
  BOOL v31;
  BOOL v32;
  id v33;
  id location[2];
  id v35;
  id v36;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = a5;
  v31 = a6;
  v30 = 0;
  objc_storeStrong(&v30, a7);
  v29 = a8;
  v28 = a9;
  v9 = v35;
  v35 = 0;
  v27.receiver = v9;
  v27.super_class = (Class)AMDModelAssets;
  v35 = -[AMDModelAssets init](&v27, sel_init);
  objc_storeStrong(&v35, v35);
  objc_msgSend(v35, "setContentToLogicalMap:", 0);
  objc_msgSend(v35, "setLogicalToContentMap:", 0);
  objc_msgSend(v35, "setUseBinaryInputMap:", v32);
  objc_msgSend(v35, "setUseBinaryOutputMap:", v31);
  objc_msgSend(v35, "setAssetsMetadata:", v33);
  objc_msgSend(v35, "loadLToCMapFromDir:error:", location[0], v28);
  if (*v28)
  {
    v36 = 0;
    v26 = 1;
  }
  else
  {
    if (!v29)
      goto LABEL_11;
    v25 = 0;
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), 0x1EA4C23E8, v30);
    v22 = v25;
    v13 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v24, CFSTR("apps"), &v22);
    objc_storeStrong(&v25, v22);
    v23 = v13;
    if (!v13 || v25)
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v35, "setMinimalMapPresent:", 1);
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        v12 = type;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_1DC678000, log, v12, "Minimal map of content to logical Id is present. Skipping binary map loading", v19, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v36 = v35;
      v26 = 1;
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    if (!v26)
    {
LABEL_11:
      objc_msgSend(v35, "setMinimalMapPresent:", 0);
      objc_msgSend(v35, "loadCToLMapFromDir:error:", location[0], v28);
      if (*v28)
        v36 = 0;
      else
        v36 = v35;
      v26 = 1;
    }
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v35, 0);
  return v36;
}

- (BOOL)isValid
{
  BOOL v3;
  NSData *v4;
  char v5;
  NSData *v6;

  v4 = -[AMDModelAssets contentToLogicalMap](self, "contentToLogicalMap");
  v5 = 0;
  if (!v4
    || (v6 = -[AMDModelAssets logicalToContentMap](self, "logicalToContentMap"),
        v5 = 1,
        v3 = 1,
        !v6))
  {
    v3 = -[AMDModelAssets minimalMapPresent](self, "minimalMapPresent");
  }
  if ((v5 & 1) != 0)

  return v3;
}

- (AMDModelAssetsMetadata)assetsMetadata
{
  return self->_assetsMetadata;
}

- (void)setAssetsMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_assetsMetadata, a3);
}

- (NSData)contentToLogicalMap
{
  return self->_contentToLogicalMap;
}

- (void)setContentToLogicalMap:(id)a3
{
  objc_storeStrong((id *)&self->_contentToLogicalMap, a3);
}

- (NSData)logicalToContentMap
{
  return self->_logicalToContentMap;
}

- (void)setLogicalToContentMap:(id)a3
{
  objc_storeStrong((id *)&self->_logicalToContentMap, a3);
}

- (BOOL)useBinaryInputMap
{
  return self->_useBinaryInputMap;
}

- (void)setUseBinaryInputMap:(BOOL)a3
{
  self->_useBinaryInputMap = a3;
}

- (BOOL)useBinaryOutputMap
{
  return self->_useBinaryOutputMap;
}

- (void)setUseBinaryOutputMap:(BOOL)a3
{
  self->_useBinaryOutputMap = a3;
}

- (BOOL)minimalMapPresent
{
  return self->_minimalMapPresent;
}

- (void)setMinimalMapPresent:(BOOL)a3
{
  self->_minimalMapPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logicalToContentMap, 0);
  objc_storeStrong((id *)&self->_contentToLogicalMap, 0);
  objc_storeStrong((id *)&self->_assetsMetadata, 0);
}

@end
