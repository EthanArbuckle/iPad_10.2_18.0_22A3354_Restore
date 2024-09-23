@implementation AMDBiomeTest

+ (id)test:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  unsigned int v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  unsigned int v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  id v21;
  NSObject *log;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id obj;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  os_log_type_t v34;
  os_log_t v35;
  id v36;
  unsigned int v37;
  id v38;
  os_log_type_t v39;
  os_log_t v40;
  id v41;
  unsigned int v42;
  id v43;
  int v44;
  os_log_type_t v45;
  os_log_t v46;
  id v47;
  id v48;
  id v49;
  os_log_type_t type;
  os_log_t oslog;
  id v52;
  id v53;
  id v54;
  _QWORD __b[8];
  id v56;
  unsigned int v57;
  id v58;
  id location[3];
  uint8_t v60[16];
  uint8_t v61[16];
  uint8_t v62[16];
  uint8_t v63[24];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = 0;
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
  if (v29)
  {
    v25 = *(_QWORD *)__b[2];
    v26 = 0;
    v27 = v29;
    while (1)
    {
      v24 = v26;
      if (*(_QWORD *)__b[2] != v25)
        objc_enumerationMutation(obj);
      v56 = *(id *)(__b[1] + 8 * v26);
      ++v57;
      v54 = 0;
      v53 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("action"));
      v52 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("table"));
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        log = oslog;
        v23 = type;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v63, (uint64_t)v53, (uint64_t)v52);
        _os_log_debug_impl(&dword_1DC678000, log, v23, "=== Action : %@, table: %@", v63, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v49 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u: %@(%@)"), v57, v53, v52);
      if ((objc_msgSend(v53, "isEqualToString:", CFSTR("fetchRecords")) & 1) != 0)
      {
        v47 = v54;
        v21 = +[AMDStorage fetchRecordsFrom:error:](AMDStorage, "fetchRecordsFrom:error:", v52, &v47);
        objc_storeStrong(&v54, v47);
        v48 = v21;
        if (v54)
        {
          v46 = (os_log_t)MEMORY[0x1E0C81028];
          v45 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v18 = v46;
            v19 = v45;
            v20 = (id)objc_msgSend(v54, "localizedDescription");
            __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v20);
            _os_log_error_impl(&dword_1DC678000, v18, v19, "Fetch error: %@", v62, 0xCu);

          }
          objc_storeStrong((id *)&v46, 0);
          v44 = 3;
        }
        else
        {
          objc_msgSend(v58, "setObject:forKey:", v48, v49);
          v44 = 0;
        }
        objc_storeStrong(&v48, 0);
        if (v44)
          goto LABEL_34;
      }
      else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("insertRecords")) & 1) != 0)
      {
        v43 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("records"));
        v42 = 0;
        v41 = v54;
        v17 = +[AMDStorage saveRecords:inTable:error:](AMDStorage, "saveRecords:inTable:error:", v43, v52, &v41);
        objc_storeStrong(&v54, v41);
        v42 = v17;
        if (v54)
        {
          v40 = (os_log_t)MEMORY[0x1E0C81028];
          v39 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v14 = v40;
            v15 = v39;
            v16 = (id)objc_msgSend(v54, "localizedDescription");
            __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v16);
            _os_log_error_impl(&dword_1DC678000, v14, v15, "Insert error: %@", v61, 0xCu);

          }
          objc_storeStrong((id *)&v40, 0);
          v44 = 3;
        }
        else
        {
          v12 = v58;
          v13 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v42);
          objc_msgSend(v12, "setObject:forKey:");

          v44 = 0;
        }
        objc_storeStrong(&v43, 0);
        if (v44)
          goto LABEL_34;
      }
      else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("deleteRecords")) & 1) != 0)
      {
        v38 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("predicates"));
        v37 = 0;
        v36 = v54;
        v11 = +[AMDStorage deleteRecordsFrom:usingPredicates:error:](AMDStorage, "deleteRecordsFrom:usingPredicates:error:", v52, v38, &v36);
        objc_storeStrong(&v54, v36);
        v37 = v11;
        if (v54)
        {
          v35 = (os_log_t)MEMORY[0x1E0C81028];
          v34 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v8 = v35;
            v9 = v34;
            v10 = (id)objc_msgSend(v54, "localizedDescription");
            __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v10);
            _os_log_error_impl(&dword_1DC678000, v8, v9, "Delete error: %@", v60, 0xCu);

          }
          objc_storeStrong((id *)&v35, 0);
          v44 = 3;
        }
        else
        {
          v6 = v58;
          v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v37);
          objc_msgSend(v6, "setObject:forKey:");

          v44 = 0;
        }
        objc_storeStrong(&v38, 0);
        if (v44)
          goto LABEL_34;
      }
      else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("updateTables")) & 1) != 0)
      {
        v33 = (id)objc_msgSend(v56, "objectForKey:", CFSTR("streamNames"));
        v32 = 0;
        v30 = 0;
        v5 = +[AMDBiomeIntegration queryBiomeFor:withError:](AMDBiomeIntegration, "queryBiomeFor:withError:", v33, &v30);
        objc_storeStrong(&v32, v30);
        v31 = v5;
        objc_msgSend(v58, "setObject:forKey:", v5, v49);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
      }
      v44 = 0;
LABEL_34:
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v52, 0);
      objc_storeStrong(&v53, 0);
      objc_storeStrong(&v54, 0);
      ++v26;
      if (v24 + 1 >= v27)
      {
        v26 = 0;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
        if (!v27)
          break;
      }
    }
  }

  v4 = v58;
  v44 = 1;
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
