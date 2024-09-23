@implementation AMDJSPIRResponseHandler

+ (id)persistPIRData:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  NSObject *log;
  os_log_type_t v26;
  id v27;
  id v29;
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  id v33;
  id v34;
  os_log_type_t v35;
  os_log_t v36;
  id v37;
  id v38;
  os_log_type_t v39;
  os_log_t v40;
  id v41;
  id v42;
  os_log_type_t v43;
  os_log_t oslog;
  id v45;
  id v46;
  id v47;
  id v48;
  os_log_type_t type;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  int v56;
  id v57;
  id v58;
  id *v59;
  id location[3];
  id v61;
  uint8_t v62[16];
  id v63;
  id v64;
  uint8_t v65[16];
  uint8_t v66[16];
  uint8_t v67[32];
  uint8_t v68[24];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v59 = a4;
  v58 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("PIRKeywordArray"));
  if (v58)
  {
    v55 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("PIRDataArray"));
    if (v55)
    {
      v53 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("CipherMLCallHandle"));
      if (v53)
      {
        v51 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v58, 4, v59);
        if (*v59)
        {
          v50 = MEMORY[0x1E0C81028];
          type = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
          {
            log = v50;
            v26 = type;
            v27 = (id)objc_msgSend(*v59, "localizedDescription");
            v48 = v27;
            __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v48);
            _os_log_error_impl(&dword_1DC678000, log, v26, "Error deserializing PIR keyword: %@", v68, 0xCu);

            objc_storeStrong(&v48, 0);
          }
          objc_storeStrong(&v50, 0);
          v61 = 0;
          v56 = 1;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = v51;
            v45 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v55, 4, v59);
            if (*v59)
            {
              oslog = (os_log_t)MEMORY[0x1E0C81028];
              v43 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                v22 = oslog;
                v23 = v43;
                v24 = (id)objc_msgSend(*v59, "localizedDescription");
                v42 = v24;
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v67, (uint64_t)v46, (uint64_t)v42);
                _os_log_error_impl(&dword_1DC678000, v22, v23, "Error deserializing PIR data for keyword %@: %@", v67, 0x16u);

                objc_storeStrong(&v42, 0);
              }
              objc_storeStrong((id *)&oslog, 0);
              v61 = 0;
              v56 = 1;
            }
            else
            {
              v41 = +[AMDKVStore fetchValueForKey:error:](AMDKVStore, "fetchValueForKey:error:", v53, v59);
              if (*v59)
              {
                v40 = (os_log_t)MEMORY[0x1E0C81028];
                v39 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  v19 = v40;
                  v20 = v39;
                  v21 = (id)objc_msgSend(*v59, "localizedDescription");
                  v38 = v21;
                  __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v38);
                  _os_log_error_impl(&dword_1DC678000, v19, v20, "KVStore fetch failed: %@", v66, 0xCu);

                  objc_storeStrong(&v38, 0);
                }
                objc_storeStrong((id *)&v40, 0);
                v61 = 0;
                v56 = 1;
              }
              else if (v41)
              {
                v18 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("key == %@"), v53);
                v9 = +[AMDKVStore deleteWithPredicate:error:](AMDKVStore, "deleteWithPredicate:error:");

                if (*v59)
                {
                  v36 = (os_log_t)MEMORY[0x1E0C81028];
                  v35 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    v15 = v36;
                    v16 = v35;
                    v17 = (id)objc_msgSend(*v59, "localizedDescription");
                    v34 = v17;
                    __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v34);
                    _os_log_error_impl(&dword_1DC678000, v15, v16, "KVStore cleanup failed: %@", v65, 0xCu);

                    objc_storeStrong(&v34, 0);
                  }
                  objc_storeStrong((id *)&v36, 0);
                  v61 = 0;
                  v56 = 1;
                }
                else
                {
                  v33 = (id)objc_msgSend(v41, "objectForKey:", CFSTR("domain"));
                  v63 = v46;
                  v64 = v45;
                  v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
                  v32 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:");

                  if (*v59)
                  {
                    v31 = (os_log_t)MEMORY[0x1E0C81028];
                    v30 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                    {
                      v11 = v31;
                      v12 = v30;
                      v13 = (id)objc_msgSend(*v59, "localizedDescription");
                      v29 = v13;
                      __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v29);
                      _os_log_error_impl(&dword_1DC678000, v11, v12, "Taste profile save failed: %@", v62, 0xCu);

                      objc_storeStrong(&v29, 0);
                    }
                    objc_storeStrong((id *)&v31, 0);
                    v61 = 0;
                    v56 = 1;
                  }
                  else
                  {
                    v61 = v32;
                    v56 = 1;
                  }
                  objc_storeStrong(&v32, 0);
                  objc_storeStrong(&v33, 0);
                }
              }
              else
              {
                v37 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PIR Error: Unrecognized call handler"));
                v8 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v37);
                *v59 = v8;
                v61 = 0;
                v56 = 1;
                objc_storeStrong(&v37, 0);
              }
              objc_storeStrong(&v41, 0);
            }
            objc_storeStrong(&v45, 0);
            objc_storeStrong(&v46, 0);
          }
          else
          {
            v47 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Non string keyword present in PIR response"));
            v7 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v47);
            *v59 = v7;
            v61 = 0;
            v56 = 1;
            objc_storeStrong(&v47, 0);
          }
        }
        objc_storeStrong(&v51, 0);
      }
      else
      {
        v52 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nil call handle present in PIR response"));
        v6 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v52);
        *v59 = v6;
        v61 = 0;
        v56 = 1;
        objc_storeStrong(&v52, 0);
      }
      objc_storeStrong(&v53, 0);
    }
    else
    {
      v54 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nil data present in PIR response"));
      v5 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v54);
      *v59 = v5;
      v61 = 0;
      v56 = 1;
      objc_storeStrong(&v54, 0);
    }
    objc_storeStrong(&v55, 0);
  }
  else
  {
    v57 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nil keyword present in PIR response"));
    v4 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v57);
    *v59 = v4;
    v61 = 0;
    v56 = 1;
    objc_storeStrong(&v57, 0);
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v61;
}

@end
