@implementation AMDSQLite

+ (id)clearUserData:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  NSObject *log;
  os_log_type_t type;
  id v17;
  _QWORD __b[8];
  uint64_t v19;
  id v20;
  int v21;
  os_log_type_t v22;
  os_log_t oslog;
  __CFString *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t v30[7];
  char v31;
  id v32;
  id location[2];
  id v34;
  id v35;
  _BYTE v36[128];
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v34 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = MEMORY[0x1E0C81028];
  v31 = 2;
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
  {
    log = v32;
    type = v31;
    __os_log_helper_16_0_0(v30);
    _os_log_debug_impl(&dword_1DC678000, log, type, "SQLITE Clearing user data", v30, 2u);
  }
  objc_storeStrong(&v32, 0);
  v29 = 0;
  v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v26 = v29;
  v14 = (id)objc_msgSend(v34, "truncateEvents:", &v26);
  objc_storeStrong(&v29, v26);
  v27 = v14;
  if (v29)
  {
    v12 = v28;
    v13 = (id)objc_msgSend(v29, "localizedDescription");
    objc_msgSend(v12, "setObject:forKey:");

  }
  else if (v27)
  {
    objc_msgSend(v28, "setObject:forKey:", v27, CFSTR("sqliteDeletionSummary"));
  }
  v25 = (id)objc_msgSend(v34, "getDomainsFrom:", location[0]);
  if (v25)
  {
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v25, "count"));
    memset(__b, 0, sizeof(__b));
    v10 = v25;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
    if (v11)
    {
      v7 = *(_QWORD *)__b[2];
      v8 = 0;
      v9 = v11;
      while (1)
      {
        v6 = v8;
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(v10);
        v19 = *(_QWORD *)(__b[1] + 8 * v8);
        v4 = v20;
        v17 = v29;
        v5 = (id)objc_msgSend(v34, "refreshODTPForDomain:error:", v19, &v17);
        objc_storeStrong(&v29, v17);
        objc_msgSend(v4, "setObject:forKey:", v5, v19);

        ++v8;
        if (v6 + 1 >= v9)
        {
          v8 = 0;
          v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
          if (!v9)
            break;
        }
      }
    }

    objc_msgSend(v28, "setObject:forKey:", v20, CFSTR("sqliteODTPRefreshed"));
    v35 = v28;
    v21 = 1;
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v24 = CFSTR("SQLITE Clear user data: no domains");
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v24);
      _os_log_error_impl(&dword_1DC678000, oslog, v22, "%@", v37, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(v28, "setObject:forKey:", v24, CFSTR("error"));
    v35 = v28;
    v21 = 1;
    objc_storeStrong((id *)&v24, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v35;
}

+ (id)deleteRowsHandler:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  id obj;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[8];
  id v36;
  id v37;
  id v38;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v42;
  id v43;
  id v44;
  int v45;
  id v46;
  id *v47;
  id location[3];
  id v49;
  const __CFString *v50;
  id v51;
  _BYTE v52[128];
  uint8_t v53[24];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = a4;
  v46 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("allDeletes"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v46, "count"))
  {
    v44 = v46;
    v43 = 0;
    memset(__b, 0, sizeof(__b));
    obj = v44;
    if (objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16))
    {
      v42 = *(_QWORD *)__b[1];
      v4 = (id)objc_msgSend(v44, "objectForKey:", v42);
      v5 = v43;
      v43 = v4;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v43, "count"))
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v53, v42);
          _os_log_debug_impl(&dword_1DC678000, oslog, type, "SQLITE Deleting from db '%@'", v53, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v45 = 2;
      }
      else
      {
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Deletion info not an array, or empty"));
        *v47 = v6;
        v49 = 0;
        v45 = 1;
      }
    }
    else
    {
      v45 = 0;
    }

    if (!v45 || v45 == 2)
    {
      v38 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
      if ((objc_msgSend(v38, "isUsable") & 1) != 0)
      {
        v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memset(v35, 0, sizeof(v35));
        v26 = v43;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v35, v52, 16);
        if (v27)
        {
          v23 = *(_QWORD *)v35[2];
          v24 = 0;
          v25 = v27;
          while (1)
          {
            v22 = v24;
            if (*(_QWORD *)v35[2] != v23)
              objc_enumerationMutation(v26);
            v36 = *(id *)(v35[1] + 8 * v24);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = v36;
              v33 = (id)objc_msgSend(v34, "objectForKey:", 0x1EA4BF808);
              if (v33)
              {
                v19 = v38;
                v18 = v33;
                v21 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B9348);
                v20 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B8948);
                v32 = (id)objc_msgSend(v19, "getPredicateExtensionForTable:forUser:andDomain:error:", v18, v21);

                if (*v47)
                {
                  v16 = v37;
                  v17 = (id)objc_msgSend(*v47, "localizedDescription");
                  objc_msgSend(v16, "addObject:");

                  v45 = 5;
                }
                else
                {
                  v31 = (id)objc_msgSend(v34, "objectForKey:", 0x1EA4BF788);
                  if (v31)
                  {
                    if (v32)
                      v8 = (id)objc_msgSend(v31, "stringByAppendingFormat:", CFSTR(" %@"), v32);
                  }
                  else
                  {
                    objc_storeStrong(&v31, v32);
                  }
                  if (v31)
                  {
                    v14 = v31;
                    v15 = (id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                    v9 = (id)objc_msgSend(v14, "stringByTrimmingCharactersInSet:");
                    v10 = v31;
                    v31 = v9;

                    if ((objc_msgSend(v31, "isEqualToString:", &stru_1EA4B7088) & 1) != 0)
                      objc_msgSend(v34, "setValue:forKey:", 0, 0x1EA4BF788);
                    else
                      objc_msgSend(v34, "setValue:forKey:", v31, 0x1EA4BF788);
                  }
                  v30 = (id)objc_msgSend(v38, "deleteRows:error:", v34, v47);
                  if (*v47)
                  {
                    v12 = v37;
                    v13 = (id)objc_msgSend(*v47, "localizedDescription");
                    objc_msgSend(v12, "addObject:");

                  }
                  else
                  {
                    objc_msgSend(v37, "addObject:", v30);
                  }
                  objc_storeStrong(&v30, 0);
                  objc_storeStrong(&v31, 0);
                  v45 = 0;
                }
                objc_storeStrong(&v32, 0);
              }
              else
              {
                objc_msgSend(v37, "addObject:", CFSTR("Table name required"));
                v45 = 5;
              }
              objc_storeStrong(&v33, 0);
              objc_storeStrong(&v34, 0);
            }
            else
            {
              objc_msgSend(v37, "addObject:", CFSTR("Invalid deletion spec: not a dict"));
            }
            ++v24;
            if (v22 + 1 >= v25)
            {
              v24 = 0;
              v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v35, v52, 16);
              if (!v25)
                break;
            }
          }
        }

        v50 = CFSTR("deletionSummary");
        v51 = v37;
        v49 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v45 = 1;
        objc_storeStrong(&v37, 0);
      }
      else
      {
        v7 = (id)objc_msgSend(v38, "generateDBLoadError");
        *v47 = v7;
        v49 = 0;
        v45 = 1;
      }
      objc_storeStrong(&v38, 0);
    }
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v44, 0);
  }
  else
  {
    *v47 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Missing deletion info for all DBs"));
    v49 = 0;
    v45 = 1;
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  return v49;
}

+ (id)deleteEventsWithPredicate:(id)a3 forStreams:(id)a4
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[8];
  uint64_t v31;
  id v32;
  id v33;
  _QWORD __b[8];
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  int v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id location[3];
  id v45;
  const __CFString *v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  const __CFString *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v42, "isUsable") & 1) != 0)
  {
    v38 = (id)objc_msgSend(v42, "getDataSchema");
    v37 = (id)objc_msgSend(v38, "getStreamToTableMap");
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v43)
    {
      memset(__b, 0, sizeof(__b));
      v22 = v43;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
      if (v23)
      {
        v19 = *(_QWORD *)__b[2];
        v20 = 0;
        v21 = v23;
        while (1)
        {
          v18 = v20;
          if (*(_QWORD *)__b[2] != v19)
            objc_enumerationMutation(v22);
          v35 = *(_QWORD *)(__b[1] + 8 * v20);
          v33 = (id)objc_msgSend(v37, "objectForKey:", v35);
          if (v33)
          {
            objc_msgSend(v36, "addObject:", v33);
            v39 = 0;
          }
          else
          {
            v39 = 3;
          }
          objc_storeStrong(&v33, 0);
          ++v20;
          if (v18 + 1 >= v21)
          {
            v20 = 0;
            v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
            if (!v21)
              break;
          }
        }
      }

    }
    else
    {
      v24 = (id)objc_msgSend(v37, "allValues");
      v4 = (void *)objc_msgSend(v24, "mutableCopy");
      v5 = v36;
      v36 = v4;

    }
    v15 = objc_alloc(MEMORY[0x1E0C99E08]);
    v32 = (id)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v36, "count"));
    memset(v30, 0, sizeof(v30));
    v16 = v36;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v30, v48, 16);
    if (v17)
    {
      v12 = *(_QWORD *)v30[2];
      v13 = 0;
      v14 = v17;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)v30[2] != v12)
          objc_enumerationMutation(v16);
        v31 = *(_QWORD *)(v30[1] + 8 * v13);
        v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        objc_msgSend(v29, "setObject:forKey:", v31, 0x1EA4BF808);
        if (location[0])
          objc_msgSend(v29, "setObject:forKey:", location[0], 0x1EA4BF788);
        v28 = 0;
        v26 = 0;
        v10 = (id)objc_msgSend(v42, "deleteRows:error:", v29, &v26);
        objc_storeStrong(&v28, v26);
        v27 = v10;
        if (v28)
        {
          v46 = CFSTR("Error");
          v9 = (id)objc_msgSend(v28, "localizedDescription");
          v47 = v9;
          v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v7 = v27;
          v27 = v6;

        }
        if (v27)
          objc_msgSend(v32, "setObject:forKey:", v27, v31);
        else
          objc_msgSend(v32, "setObject:forKey:", CFSTR("Deletion Failed"), v31);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v30, v48, 16);
          if (!v14)
            break;
        }
      }
    }

    v45 = v32;
    v39 = 1;
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    v41 = (id)objc_msgSend(v42, "connectionState");
    v40 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DB not usable: %@"), v41);
    v50 = CFSTR("eventDeletionError");
    v51[0] = v40;
    v45 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v39 = 1;
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v45;
}

+ (id)deleteEventsOlderThan:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  os_log_type_t v9;
  id location;
  unsigned int v11;
  SEL v12;
  id v13;
  uint8_t v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v12 = a2;
  v11 = a3;
  location = MEMORY[0x1E0C81028];
  v9 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v14, v11);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)location, v9, "SQLITE Deleting events older than %u days", v14, 8u);
  }
  objc_storeStrong(&location, 0);
  v8 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v3 = objc_msgSend(v8, "unsignedLongValue");
  v7 = v3 - 86400 * v11;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ < %llu"), CFSTR("creationTime"), v7);
  v5 = (id)objc_msgSend(v13, "deleteEventsWithPredicate:forStreams:", v6, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  return v5;
}

+ (id)getDomainsFrom:(id)a3
{
  int v4;
  char v5;
  id v6;
  id v7;
  id location[3];
  id v9;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2E08);
  if (!v7)
    objc_storeStrong(&v7, &unk_1EA4D1A58);
  v5 = 0;
  LOBYTE(v4) = 1;
  if (v7)
  {
    objc_opt_class();
    LOBYTE(v4) = 1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LOBYTE(v4) = 1;
      if (objc_msgSend(v7, "count"))
      {
        v6 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v5 = 1;
        objc_opt_class();
        v4 = objc_opt_isKindOfClass() ^ 1;
      }
    }
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
    v9 = 0;
  else
    v9 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)getFeatureValueWithName:(id)a3 inDomain:(id)a4 withColumnName:(id)a5 skipRowset:(BOOL)a6 error:(id *)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  id v16;
  AMDFetchDescriptor *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  os_log_t v26;
  id v27;
  id v28;
  id v29;
  int i;
  os_log_type_t v31;
  os_log_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  os_log_type_t v37;
  os_log_t v38;
  id v39;
  os_log_type_t v40;
  os_log_t oslog;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t v46[7];
  os_log_type_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int v52;
  id v53;
  id v54;
  id v55;
  os_log_type_t type;
  id v57;
  int64_t v58;
  id *v59;
  BOOL v60;
  id v61;
  id v62;
  id location[3];
  id v64;
  uint8_t v65[16];
  uint8_t v66[16];
  uint8_t v67[16];
  uint8_t v68[24];
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  id v72;
  id v73;
  _QWORD v74[4];
  _QWORD v75[4];
  uint8_t v76[24];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v62 = 0;
  objc_storeStrong(&v62, a4);
  v61 = 0;
  objc_storeStrong(&v61, a5);
  v60 = a6;
  v59 = a7;
  v58 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v62);
  v57 = MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v76, (uint64_t)v62, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v57, type, "SQLITE Retrieving feature in domain '%@': %@", v76, 0x16u);
  }
  objc_storeStrong(&v57, 0);
  v55 = 0;
  if (v60)
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("featureName = '%@' AND domain = %ld AND valueType <> %d"), location[0], v58, 3);
  else
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("featureName = '%@' AND domain = %ld"), location[0], v58);
  v8 = v55;
  v55 = v7;

  v74[0] = 0x1EA4BF668;
  v75[0] = CFSTR("getFeatureValue");
  v74[1] = 0x1EA4BF808;
  v75[1] = CFSTR("__AMDTasteProfile");
  v74[2] = 0x1EA4BF648;
  v71 = CFSTR("value");
  v69 = CFSTR("type");
  v70 = AMD_SQLITE_DATA_TYPE_BLOB;
  v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69);
  v72 = v21;
  v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v73 = v20;
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v75[2] = v19;
  v74[3] = 0x1EA4BF788;
  v75[3] = v55;
  v54 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 4);

  v53 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v53, "isUsable") & 1) != 0)
  {
    v17 = [AMDFetchDescriptor alloc];
    v18 = (id)objc_msgSend(v53, "getBootSchema");
    v51 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v17, "initWithDict:usingSchema:error:", v54);

    if (*v59)
    {
      v64 = 0;
      v52 = 1;
    }
    else
    {
      v50 = (id)objc_msgSend(v53, "fetchRows:andPersist:error:", v51, 0, v59);
      v16 = (id)objc_msgSend(v50, "objectForKey:", CFSTR("resultSet"));
      v15 = (id)objc_msgSend(v16, "objectForKey:", CFSTR("fetchResultColumnsData"));
      v49 = (id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0);

      if (v49 && objc_msgSend(v49, "count"))
      {
        v45 = (id)objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
        v44 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v45, 4, v59);
        if (*v59)
        {
          v64 = 0;
          v52 = 1;
        }
        else if (v61)
        {
          v43 = 0;
          if (v44)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = v44;
              v35 = (id)objc_msgSend(v36, "objectForKey:", CFSTR("fetchResultColumnsInfo"));
              v34 = (id)objc_msgSend(v36, "objectForKey:", CFSTR("fetchResultColumnsData"));
              if (v35 && v34)
              {
                for (i = 0; ; ++i)
                {
                  v12 = i;
                  if (v12 >= objc_msgSend(v35, "count"))
                    break;
                  v29 = (id)objc_msgSend(v35, "objectAtIndex:", i);
                  v28 = (id)objc_msgSend(v29, "objectForKey:", CFSTR("name"));
                  if ((objc_msgSend(v28, "isEqualToString:", v61) & 1) != 0)
                  {
                    v9 = (id)objc_msgSend(v34, "objectAtIndex:", i);
                    v10 = v43;
                    v43 = v9;

                    v52 = 2;
                  }
                  else
                  {
                    v52 = 0;
                  }
                  objc_storeStrong(&v28, 0);
                  objc_storeStrong(&v29, 0);
                  if (v52)
                    break;
                }
                if (v43)
                {
                  v64 = v43;
                  v52 = 1;
                }
                else
                {
                  v27 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature %@ in domain %@ missing column %@"), location[0], v62, v61);
                  v26 = (os_log_t)MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v27);
                    _os_log_error_impl(&dword_1DC678000, v26, OS_LOG_TYPE_ERROR, "%@", v65, 0xCu);
                  }
                  objc_storeStrong((id *)&v26, 0);
                  *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v27);
                  v64 = 0;
                  v52 = 1;
                  objc_storeStrong(&v27, 0);
                }
              }
              else
              {
                v33 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature %@ in domain %@ missing column info/data in rowset"), location[0], v62);
                v32 = (os_log_t)MEMORY[0x1E0C81028];
                v31 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v33);
                  _os_log_error_impl(&dword_1DC678000, v32, v31, "%@", v66, 0xCu);
                }
                objc_storeStrong((id *)&v32, 0);
                *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v33);
                v64 = 0;
                v52 = 1;
                objc_storeStrong(&v33, 0);
              }
              objc_storeStrong(&v34, 0);
              objc_storeStrong(&v35, 0);
              objc_storeStrong(&v36, 0);
            }
            else
            {
              v39 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature %@ in domain %@ is incorrectly formatted"), location[0], v62);
              v38 = (os_log_t)MEMORY[0x1E0C81028];
              v37 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v67, (uint64_t)v39);
                _os_log_error_impl(&dword_1DC678000, v38, v37, "%@", v67, 0xCu);
              }
              objc_storeStrong((id *)&v38, 0);
              *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v39);
              v64 = 0;
              v52 = 1;
              objc_storeStrong(&v39, 0);
            }
          }
          else
          {
            v42 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No feature '%@' in domain '%@' of type RowSet"), location[0], v62);
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            v40 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v42);
              _os_log_error_impl(&dword_1DC678000, oslog, v40, "%@", v68, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            *v59 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v42);
            v64 = 0;
            v52 = 1;
            objc_storeStrong(&v42, 0);
          }
          objc_storeStrong(&v43, 0);
        }
        else
        {
          v64 = v44;
          v52 = 1;
        }
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
      }
      else
      {
        v48 = MEMORY[0x1E0C81028];
        v47 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEBUG))
        {
          v13 = v48;
          v14 = v47;
          __os_log_helper_16_0_0(v46);
          _os_log_debug_impl(&dword_1DC678000, v13, v14, "SQLITE Nothing found", v46, 2u);
        }
        objc_storeStrong(&v48, 0);
        v64 = 0;
        v52 = 1;
      }
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v50, 0);
    }
    objc_storeStrong(&v51, 0);
  }
  else
  {
    *v59 = (id)objc_msgSend(v53, "generateDBLoadError");
    v64 = 0;
    v52 = 1;
  }
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
  return v64;
}

+ (id)getSharedInstance
{
  return (id)objc_msgSend(a1, "getSharedInstanceWithOption:", 0, a2, a1);
}

+ (id)allocSharedInstance
{
  return (id)objc_msgSend(a1, "getSharedInstanceWithOption:", 1, a2, a1);
}

+ (id)createSharedInstance
{
  id v2;
  id v3;
  id v5;
  dispatch_queue_t v6;
  id v7;
  id v8;
  id v9[2];
  id v10;

  v10 = a1;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init(AMDSQLite);
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (id)objc_msgSend(v5, "bundleIdentifier");

  v6 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0);
  objc_msgSend(v9[0], "set_executorQueue:");

  objc_msgSend(v9[0], "set_isEnabled:", 0);
  v2 = (id)objc_msgSend(v10, "initSharedInstance:", v9[0]);
  v3 = v9[0];
  v9[0] = v2;

  v7 = v9[0];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  return v7;
}

+ (id)initSharedInstance:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v15;
  v5 = (id)objc_msgSend(location[0], "prepareBootstrapSchema");
  objc_msgSend(v4, "addEntriesFromDictionary:");

  v6 = v15;
  v7 = (id)objc_msgSend(location[0], "loadDb");
  objc_msgSend(v6, "addEntriesFromDictionary:");

  v8 = v15;
  v9 = (id)objc_msgSend(location[0], "loadDataSchema");
  objc_msgSend(v8, "addEntriesFromDictionary:");

  v10 = v15;
  v11 = (id)objc_msgSend(location[0], "loadBiomeSchema");
  objc_msgSend(v10, "addEntriesFromDictionary:");

  v12 = v15;
  v13 = (id)objc_msgSend(location[0], "loadMegadomeSchema");
  objc_msgSend(v12, "addEntriesFromDictionary:");

  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v15, CFSTR("SQLLoadSummary"), 0);
  v14 = location[0];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v14;
}

+ (id)getSharedInstanceWithOption:(BOOL)a3
{
  uint64_t obj;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  BOOL v10;
  SEL v11;
  id v12;
  id v13;
  id location;
  dispatch_once_t *v15;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  if (a3)
  {
    obj = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __41__AMDSQLite_getSharedInstanceWithOption___block_invoke;
    v8 = &__block_descriptor_40_e5_v8__0l;
    v9 = v12;
    v15 = (dispatch_once_t *)&getSharedInstanceWithOption__onceToken;
    location = 0;
    objc_storeStrong(&location, &obj);
    if (*v15 != -1)
      dispatch_once(v15, location);
    objc_storeStrong(&location, 0);
    v13 = (id)getSharedInstanceWithOption__sharedInstance;
  }
  else
  {
    v13 = (id)getSharedInstanceWithOption__sharedInstance;
  }
  return v13;
}

void __41__AMDSQLite_getSharedInstanceWithOption___block_invoke(id *a1)
{
  id v1;
  void *v2;
  NSObject *log;
  os_log_type_t type;
  uint8_t v6[7];
  char v7;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = MEMORY[0x1E0C81028];
  v7 = 1;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    log = location[0];
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1DC678000, log, type, "Running first alloc of DB", v6, 2u);
  }
  objc_storeStrong(location, 0);
  v1 = (id)objc_msgSend(a1[4], "createSharedInstance");
  v2 = (void *)getSharedInstanceWithOption__sharedInstance;
  getSharedInstanceWithOption__sharedInstance = (uint64_t)v1;

}

+ (id)getBootstrapSchemaDict
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
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
  id v27;
  id v28[3];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[6];
  _QWORD v42[6];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[4];
  _QWORD v52[4];
  _QWORD v53[2];
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[6];
  _QWORD v66[6];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[3];
  _QWORD v76[4];

  v76[3] = *MEMORY[0x1E0C80C00];
  v28[2] = a1;
  v28[1] = (id)a2;
  v75[0] = AMD_SQLITE_SCHEMA_NAME;
  v76[0] = CFSTR("bootstrap");
  v75[1] = AMD_SQLITE_SCHEMA_VERSION;
  v76[1] = CFSTR("1");
  v75[2] = AMD_SQLITE_SCHEMA_TABLES;
  v73[0] = CFSTR("__AMDSchema");
  v71[0] = CFSTR("schema");
  v69[0] = AMD_SQLITE_TYPE;
  v70[0] = AMD_SQLITE_DATA_TYPE_BLOB;
  v69[1] = AMD_SQLITE_NOT_NULL;
  v3 = MEMORY[0x1E0C9AAB0];
  v70[1] = MEMORY[0x1E0C9AAB0];
  v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69);
  v72[0] = v26;
  v71[1] = CFSTR("creationTime");
  v67[0] = AMD_SQLITE_TYPE;
  v68[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v67[1] = AMD_SQLITE_NOT_NULL;
  v68[1] = v3;
  v25 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v72[1] = v25;
  v24 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
  v74[0] = v24;
  v73[1] = CFSTR("__AMDTasteProfile");
  v65[0] = CFSTR("domain");
  v63[0] = AMD_SQLITE_TYPE;
  v64[0] = AMD_SQLITE_DATA_TYPE_INT;
  v63[1] = AMD_SQLITE_NOT_NULL;
  v64[1] = v3;
  v23 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v66[0] = v23;
  v65[1] = CFSTR("featureName");
  v61[0] = AMD_SQLITE_TYPE;
  v62[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v61[1] = AMD_SQLITE_NOT_NULL;
  v62[1] = v3;
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v66[1] = v22;
  v65[2] = CFSTR("source");
  v59[0] = AMD_SQLITE_TYPE;
  v60[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v59[1] = AMD_SQLITE_NOT_NULL;
  v60[1] = v3;
  v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v66[2] = v21;
  v65[3] = CFSTR("valueType");
  v57[0] = AMD_SQLITE_TYPE;
  v58[0] = AMD_SQLITE_DATA_TYPE_INT;
  v57[1] = AMD_SQLITE_NOT_NULL;
  v58[1] = v3;
  v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v66[3] = v20;
  v65[4] = CFSTR("value");
  v55 = AMD_SQLITE_TYPE;
  v56 = AMD_SQLITE_DATA_TYPE_BLOB;
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v66[4] = v19;
  v65[5] = CFSTR("creationTime");
  v53[0] = AMD_SQLITE_TYPE;
  v54[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v53[1] = AMD_SQLITE_NOT_NULL;
  v54[1] = v3;
  v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v66[5] = v18;
  v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65);
  v74[1] = v17;
  v73[2] = CFSTR("__AMDAggregations");
  v51[0] = CFSTR("descriptor");
  v49[0] = AMD_SQLITE_TYPE;
  v50[0] = AMD_SQLITE_DATA_TYPE_BLOB;
  v49[1] = AMD_SQLITE_NOT_NULL;
  v50[1] = v3;
  v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v52[0] = v16;
  v51[1] = CFSTR("domain");
  v47[0] = AMD_SQLITE_TYPE;
  v48[0] = AMD_SQLITE_DATA_TYPE_INT;
  v47[1] = AMD_SQLITE_NOT_NULL;
  v48[1] = v3;
  v15 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v52[1] = v15;
  v51[2] = CFSTR("name");
  v45[0] = AMD_SQLITE_TYPE;
  v46[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v45[1] = AMD_SQLITE_NOT_NULL;
  v46[1] = v3;
  v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v52[2] = v14;
  v51[3] = CFSTR("creationTime");
  v43[0] = AMD_SQLITE_TYPE;
  v44[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v43[1] = AMD_SQLITE_NOT_NULL;
  v44[1] = v3;
  v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v52[3] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51);
  v74[2] = v12;
  v73[3] = CFSTR("__AMDVectorDatabases");
  v41[0] = CFSTR("dbName");
  v39[0] = AMD_SQLITE_TYPE;
  v40[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v39[1] = AMD_SQLITE_NOT_NULL;
  v40[1] = v3;
  v39[2] = AMD_SQLITE_UNIQUE;
  v40[2] = &unk_1EA4CEBF0;
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39);
  v42[0] = v11;
  v41[1] = CFSTR("dbPath");
  v37[0] = AMD_SQLITE_TYPE;
  v38[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v37[1] = AMD_SQLITE_NOT_NULL;
  v38[1] = v3;
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v42[1] = v10;
  v41[2] = CFSTR("lastUpdateTime");
  v35[0] = AMD_SQLITE_TYPE;
  v36[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v35[1] = AMD_SQLITE_NOT_NULL;
  v36[1] = v3;
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v42[2] = v9;
  v41[3] = CFSTR("vectorDimension");
  v33[0] = AMD_SQLITE_TYPE;
  v34[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v33[1] = AMD_SQLITE_NOT_NULL;
  v34[1] = v3;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v42[3] = v8;
  v41[4] = CFSTR("distanceMetric");
  v31[0] = AMD_SQLITE_TYPE;
  v32[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v31[1] = AMD_SQLITE_NOT_NULL;
  v32[1] = v3;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v42[4] = v7;
  v41[5] = CFSTR("dataType");
  v29[0] = AMD_SQLITE_TYPE;
  v30[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v29[1] = AMD_SQLITE_NOT_NULL;
  v30[1] = v3;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v42[5] = v6;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 6);
  v74[3] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
  v76[2] = v4;
  v28[0] = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);

  v27 = v28[0];
  objc_storeStrong(v28, 0);
  return v27;
}

+ (id)insertRowsHandler:(id)a3 error:(id *)a4
{
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(v8, "insertRowsInternal:usingSchema:error:", location[0], 0, a4);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)insertRowsInternal:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  _BOOL4 v26;
  id v27;
  id v30;
  id v31;
  id v32;
  _QWORD v33[8];
  id v34;
  id v35;
  os_log_type_t v36;
  os_log_t v37;
  BOOL v38;
  id v39;
  id v40;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v44;
  id v45;
  id v46;
  int v47;
  id v48;
  id *v49;
  id v50;
  id location[3];
  id v52;
  const __CFString *v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  uint8_t v58[16];
  uint8_t v59[24];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = 0;
  objc_storeStrong(&v50, a4);
  v49 = a5;
  v48 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("allInserts"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v48, "count"))
  {
    v46 = v48;
    v45 = 0;
    memset(__b, 0, sizeof(__b));
    v27 = v46;
    if (objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", __b, v60, 16))
    {
      v44 = *(_QWORD *)__b[1];
      v5 = (id)objc_msgSend(v46, "objectForKey:", v44);
      v6 = v45;
      v45 = v5;

      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v59, v44);
        _os_log_debug_impl(&dword_1DC678000, oslog, type, "SQLITE Inserting into db '%@'", v59, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v47 = 2;
    }
    else
    {
      v47 = 0;
    }

    if (v45)
    {
      v40 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
      if ((objc_msgSend(v40, "isUsable") & 1) != 0)
      {
        if (!v50)
        {
          v9 = (id)objc_msgSend(v40, "_schema");
          v10 = v50;
          v50 = v9;

        }
        v39 = (id)objc_msgSend(v45, "objectForKey:", CFSTR("skipValidation"));
        v38 = 0;
        if (v39)
          v26 = objc_msgSend(v39, "intValue") != 0;
        else
          v26 = 0;
        v38 = v26;
        v37 = (os_log_t)MEMORY[0x1E0C81028];
        v36 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          if (v38)
            v11 = "YES";
          else
            v11 = "NO";
          __os_log_helper_16_2_1_8_32((uint64_t)v58, (uint64_t)v11);
          _os_log_debug_impl(&dword_1DC678000, v37, v36, "SQLITE Skip validation: %s", v58, 0xCu);
        }
        objc_storeStrong((id *)&v37, 0);
        v12 = (id)objc_msgSend(v45, "objectForKey:", CFSTR("rowsData"));
        v13 = v48;
        v48 = v12;

        if (v48 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v48, "count"))
        {
          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          memset(v33, 0, sizeof(v33));
          v24 = v48;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v33, v57, 16);
          if (v25)
          {
            v21 = *(_QWORD *)v33[2];
            v22 = 0;
            v23 = v25;
            while (1)
            {
              v20 = v22;
              if (*(_QWORD *)v33[2] != v21)
                objc_enumerationMutation(v24);
              v34 = *(id *)(v33[1] + 8 * v22);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = v34;
                v55[0] = 0x1EA4BF808;
                v19 = (id)objc_msgSend(v32, "objectForKey:", 0x1EA4BF808);
                v56[0] = v19;
                v55[1] = CFSTR("rowsData");
                v18 = (id)objc_msgSend(v32, "objectForKey:");
                v56[1] = v18;
                v31 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);

                v30 = (id)objc_msgSend(v40, "insertRows:usingSchema:skipValidation:error:", v31, v50, v38, v49);
                if (*v49)
                {
                  v16 = v35;
                  v17 = (id)objc_msgSend(*v49, "localizedDescription");
                  objc_msgSend(v16, "addObject:");

                }
                else
                {
                  objc_msgSend(v35, "addObject:", v30);
                }
                objc_storeStrong(&v30, 0);
                objc_storeStrong(&v31, 0);
                objc_storeStrong(&v32, 0);
              }
              else
              {
                objc_msgSend(v35, "addObject:", CFSTR("Invalid rowset"));
              }
              ++v22;
              if (v20 + 1 >= v23)
              {
                v22 = 0;
                v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v33, v57, 16);
                if (!v23)
                  break;
              }
            }
          }

          v53 = CFSTR("insertSummary");
          v54 = v35;
          v52 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v47 = 1;
          objc_storeStrong(&v35, 0);
        }
        else
        {
          v14 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Missing or invalid rowsets"));
          *v49 = v14;
          v52 = 0;
          v47 = 1;
        }
        objc_storeStrong(&v39, 0);
      }
      else
      {
        v8 = (id)objc_msgSend(v40, "generateDBLoadError");
        *v49 = v8;
        v52 = 0;
        v47 = 1;
      }
      objc_storeStrong(&v40, 0);
    }
    else
    {
      v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("No insert info"));
      *v49 = v7;
      v52 = 0;
      v47 = 1;
    }
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
  }
  else
  {
    *v49 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Missing insertion info for all DBs"));
    v52 = 0;
    v47 = 1;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
  return v52;
}

+ (id)loadNewData:(id)a3
{
  id v4;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  uint8_t v9[7];
  char v10;
  id v11;
  id location[3];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = MEMORY[0x1E0C81028];
  v10 = 2;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
  {
    log = v11;
    type = v10;
    __os_log_helper_16_0_0(v9);
    _os_log_debug_impl(&dword_1DC678000, log, type, "SQLITE Loading new events", v9, 2u);
  }
  objc_storeStrong(&v11, 0);
  v8 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2C28);
  v7 = +[AMDDeviceStorage performStorageUpdateWithPayload:](AMDDeviceStorage, "performStorageUpdateWithPayload:", v8);
  v13 = CFSTR("deviceStorageUpdateSummary");
  v14[0] = v7;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (sqlite3_stmt)prepare:(id)a3 usingDb:(sqlite3 *)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v10;
  unsigned int v11;
  int v12;
  os_log_type_t v13;
  os_log_t oslog;
  id v15;
  sqlite3_stmt *ppStmt;
  os_log_type_t v17;
  id v18;
  id *v19;
  sqlite3 *v20;
  id location[3];
  sqlite3_stmt *v22;
  uint8_t v23[16];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v19 = a5;
  v18 = MEMORY[0x1E0C81028];
  v17 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v18, v17, "SQLITE PREPARE: %@", v24, 0xCu);
  }
  objc_storeStrong(&v18, 0);
  ppStmt = 0;
  if (v20)
  {
    v11 = sqlite3_prepare_v2(v20, (const char *)objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String"), -1, &ppStmt, 0);
    if (!v11 && ppStmt)
    {
      v22 = ppStmt;
      v12 = 1;
    }
    else
    {
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE PREPARE failed: %d"), v11);
      v6 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v10);
      *v19 = v6;
      v22 = 0;
      v12 = 1;
      objc_storeStrong(&v10, 0);
    }
  }
  else
  {
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE PREPARE failed: No db!!!"));
    v5 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v15);
    *v19 = v5;
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    v13 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v15);
      _os_log_impl(&dword_1DC678000, oslog, v13, "%@", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v22 = 0;
    v12 = 1;
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
  return v22;
}

- (sqlite3_stmt)prepare:(id)a3 error:(id *)a4
{
  sqlite3_stmt *v6;
  id location[2];
  AMDSQLite *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = +[AMDSQLite prepare:usingDb:error:](AMDSQLite, "prepare:usingDb:error:", location[0], -[AMDSQLite _db](v8, "_db"), a4);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)refreshEntityTableForDomain:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t type;
  os_log_t oslog;
  int v15;
  __CFString *v16;
  id v17;
  id *v18;
  id location[2];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t v26[24];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v20 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17 = CFSTR("RefreshEntityTableForDomain");
  if (location[0])
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)location[0]);
      _os_log_debug_impl(&dword_1DC678000, oslog, type, "SQLITE Refreshing entity table for domain '%@'", v26, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v12 = (id)objc_msgSend(v20, "getSharedInstance");
    if ((objc_msgSend(v12, "isUsable") & 1) != 0)
    {
      if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("apps")) & 1) != 0)
      {
        v21 = (id)objc_msgSend(v12, "refreshAppsTable:", v18);
        v15 = 1;
      }
      else
      {
        v9 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown domain: %@"), location[0]);
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v9);
        *v18 = v6;
        v22 = v17;
        v23 = v9;
        v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v15 = 1;
        objc_storeStrong(&v9, 0);
      }
    }
    else
    {
      v11 = (id)objc_msgSend(v12, "connectionState");
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity table refresh failed. DB not usable: %@"), v11);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v10);
      *v18 = v5;
      v24 = v17;
      v25 = v10;
      v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v15 = 1;
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v16 = CFSTR("No domain");
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v16);
    *v18 = v4;
    v27 = v17;
    v28[0] = v16;
    v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v15 = 1;
    objc_storeStrong((id *)&v16, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

+ (id)refreshODTPForDomain:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  AMDFetchDescriptor *v20;
  AMDFetchDescriptor *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  id v35;
  AMDFetchDescriptor *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v42;
  id v43;
  os_log_type_t v44;
  os_log_t v45;
  id v46;
  uint8_t v47[7];
  os_log_type_t v48;
  os_log_t v49;
  id v50;
  id v51;
  uint8_t v52[15];
  os_log_type_t v53;
  os_log_t v54;
  id v55;
  id v56;
  _QWORD __b[8];
  uint64_t v58;
  id v59;
  id v60;
  unsigned int v61;
  os_log_type_t v62;
  os_log_t v63;
  uint8_t v64[15];
  os_log_type_t v65;
  os_log_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  os_log_type_t type;
  os_log_t oslog;
  __CFString *v79;
  int64_t v80;
  id v81;
  int v82;
  __CFString *v83;
  id v84;
  id *v85;
  id location[2];
  id v87;
  id v88;
  uint8_t v89[16];
  _BYTE v90[128];
  uint8_t v91[24];
  id v92;
  const __CFString *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  _QWORD v98[4];
  _QWORD v99[4];
  uint64_t v100;
  uint64_t v101;
  const __CFString *v102;
  id v103;
  id v104;
  uint8_t v105[24];
  id v106;
  __CFString *v107;
  id v108;
  _QWORD v109[2];

  v109[1] = *MEMORY[0x1E0C80C00];
  v87 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v85 = a4;
  v84 = CFSTR("RefreshODTPSQLite");
  if (location[0])
  {
    v81 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", v84);
    v80 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", location[0]);
    if (v80)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v105, (uint64_t)location[0]);
        _os_log_debug_impl(&dword_1DC678000, oslog, type, "SQLITE Refresh ODTP for domain %@", v105, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v102 = CFSTR("descriptor");
      v100 = AMD_SQLITE_TYPE;
      v101 = AMD_SQLITE_DATA_TYPE_BLOB;
      v40 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100);
      v103 = v40;
      v39 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
      v104 = v39;
      v76 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);

      v75 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %lu"), CFSTR("domain"), v80);
      v98[0] = 0x1EA4BF668;
      v99[0] = CFSTR("__AMDAggregations");
      v98[1] = 0x1EA4BF808;
      v99[1] = CFSTR("__AMDAggregations");
      v98[2] = 0x1EA4BF648;
      v99[2] = v76;
      v98[3] = 0x1EA4BF788;
      v99[3] = v75;
      v74 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
      v73 = (id)objc_msgSend(v87, "getSharedInstance");
      if ((objc_msgSend(v73, "isUsable") & 1) != 0)
      {
        v36 = [AMDFetchDescriptor alloc];
        v37 = (id)objc_msgSend(v73, "_bootstrapSchema");
        v70 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v36, "initWithDict:usingSchema:error:", v74);

        v38 = (id)objc_msgSend(v73, "_bootstrapSchema");
        v69 = (id)objc_msgSend(v73, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");

        if (*v85)
        {
          v94 = v84;
          v35 = (id)objc_msgSend(*v85, "localizedDescription");
          v95 = v35;
          v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);

          v82 = 1;
        }
        else
        {
          v68 = (id)objc_msgSend(v69, "objectForKey:", CFSTR("resultSet"));
          v67 = (id)objc_msgSend(v68, "objectForKey:", CFSTR("fetchResultColumnsData"));
          if (v67 && objc_msgSend(v67, "count") == 1)
          {
            v63 = (os_log_t)MEMORY[0x1E0C81028];
            v62 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              v32 = (id)objc_msgSend(v67, "objectAtIndexedSubscript:", 0);
              v7 = objc_msgSend(v32, "count");
              __os_log_helper_16_2_2_8_0_8_64((uint64_t)v91, v7, (uint64_t)location[0]);
              _os_log_debug_impl(&dword_1DC678000, v63, v62, "SQLITE Refresh %lu ODTP FDs for domain %@", v91, 0x16u);

            }
            objc_storeStrong((id *)&v63, 0);
            v61 = 0;
            v60 = (id)objc_msgSend(v67, "objectAtIndexedSubscript:", 0);
            v59 = 0;
            memset(__b, 0, sizeof(__b));
            v30 = v60;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", __b, v90, 16);
            if (v31)
            {
              v27 = *(_QWORD *)__b[2];
              v28 = 0;
              v29 = v31;
              while (1)
              {
                v26 = v28;
                if (*(_QWORD *)__b[2] != v27)
                  objc_enumerationMutation(v30);
                v58 = *(_QWORD *)(__b[1] + 8 * v28);
                objc_storeStrong(&v59, 0);
                v55 = v59;
                v25 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v58, 4, &v55);
                objc_storeStrong(&v59, v55);
                v56 = v25;
                if (v59)
                {
                  v54 = (os_log_t)MEMORY[0x1E0C81028];
                  v53 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    v23 = v54;
                    v24 = v53;
                    __os_log_helper_16_0_0(v52);
                    _os_log_error_impl(&dword_1DC678000, v23, v24, "SQLITE Stored FD not deserializable.  Check!", v52, 2u);
                  }
                  objc_storeStrong((id *)&v54, 0);
                  ++v61;
                  v82 = 3;
                }
                else
                {
                  v20 = [AMDFetchDescriptor alloc];
                  v19 = v56;
                  v22 = (id)objc_msgSend(v73, "_schema");
                  v50 = v59;
                  v21 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v20, "initWithDict:usingSchema:error:", v19);
                  objc_storeStrong(&v59, v50);
                  v51 = v21;

                  if (v59)
                  {
                    v49 = (os_log_t)MEMORY[0x1E0C81028];
                    v48 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                    {
                      v17 = v49;
                      v18 = v48;
                      __os_log_helper_16_0_0(v47);
                      _os_log_error_impl(&dword_1DC678000, v17, v18, "SQLITE Stored FD not parsable.  Check!", v47, 2u);
                    }
                    objc_storeStrong((id *)&v49, 0);
                    ++v61;
                    v82 = 3;
                  }
                  else
                  {
                    v15 = v73;
                    v16 = (id)objc_msgSend(v73, "_schema");
                    v46 = v59;
                    v8 = (id)objc_msgSend(v15, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");
                    objc_storeStrong(&v59, v46);

                    if (v59)
                    {
                      ++v61;
                    }
                    else
                    {
                      v45 = (os_log_t)MEMORY[0x1E0C81028];
                      v44 = OS_LOG_TYPE_DEBUG;
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                      {
                        v12 = v45;
                        v13 = v44;
                        v14 = (id)objc_msgSend(v51, "getId");
                        v43 = v14;
                        __os_log_helper_16_2_1_8_64((uint64_t)v89, (uint64_t)v43);
                        _os_log_debug_impl(&dword_1DC678000, v12, v13, "SQLITE Saving result for FD '%@'", v89, 0xCu);

                        objc_storeStrong(&v43, 0);
                      }
                      objc_storeStrong((id *)&v45, 0);
                    }
                    v82 = 0;
                  }
                  objc_storeStrong(&v51, 0);
                }
                objc_storeStrong(&v56, 0);
                ++v28;
                if (v26 + 1 >= v29)
                {
                  v28 = 0;
                  v29 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", __b, v90, 16);
                  if (!v29)
                    break;
                }
              }
            }

            v11 = (void *)MEMORY[0x1E0CB3940];
            v9 = objc_msgSend(v67, "count");
            v42 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("SQLITE Refresh FD results: total %lu, failed %u"), v9, v61);
            objc_msgSend(v81, "setObject:forKey:", v42, v84);
            +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", v84);
            v88 = v81;
            v82 = 1;
            objc_storeStrong(&v42, 0);
            objc_storeStrong(&v59, 0);
            objc_storeStrong(&v60, 0);
          }
          else
          {
            v66 = (os_log_t)MEMORY[0x1E0C81028];
            v65 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              v33 = v66;
              v34 = v65;
              __os_log_helper_16_0_0(v64);
              _os_log_debug_impl(&dword_1DC678000, v33, v34, "SQLITE ODTP No FDs", v64, 2u);
            }
            objc_storeStrong((id *)&v66, 0);
            v92 = v84;
            v93 = CFSTR("No FDs");
            v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
            v82 = 1;
          }
          objc_storeStrong(&v67, 0);
          objc_storeStrong(&v68, 0);
        }
        objc_storeStrong(&v69, 0);
        objc_storeStrong(&v70, 0);
      }
      else
      {
        v72 = (id)objc_msgSend(v73, "connectionState");
        v71 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Cannot refresh OD Features: %@"), v72);
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v71);
        *v85 = v6;
        v96 = v84;
        v97 = v71;
        v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v82 = 1;
        objc_storeStrong(&v71, 0);
        objc_storeStrong(&v72, 0);
      }
      objc_storeStrong(&v73, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v76, 0);
    }
    else
    {
      v79 = CFSTR("Unknown domain");
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v79);
      *v85 = v5;
      v106 = v84;
      v107 = v79;
      v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
      v82 = 1;
      objc_storeStrong((id *)&v79, 0);
    }
    objc_storeStrong(&v81, 0);
  }
  else
  {
    v83 = CFSTR("No domain");
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v83);
    *v85 = v4;
    v108 = v84;
    v109[0] = v83;
    v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, &v108, 1);
    v82 = 1;
    objc_storeStrong((id *)&v83, 0);
  }
  objc_storeStrong(&v84, 0);
  objc_storeStrong(location, 0);
  return v88;
}

+ (id)saveEvents:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *log;
  os_log_type_t type;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t v25[7];
  os_log_type_t v26;
  os_log_t oslog;
  id obj;
  id v29;
  id v30;
  id v31;
  uint8_t v32[15];
  char v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __CFString *v43;
  id v44;
  id v45;
  id v46;
  __CFString *v47;
  id v48;
  int v49;
  id v50;
  id v51;
  id *v52;
  id location[2];
  id v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v54 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = a4;
  v51 = CFSTR("saveEvents");
  v50 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v50, "isUsable") & 1) != 0)
  {
    v48 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("streamName"));
    if (v48)
    {
      v23 = (id)objc_msgSend(v50, "_schema");
      v46 = (id)objc_msgSend(v23, "getTableForStream:", v48);

      if (v46)
      {
        v44 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("rowsData"));
        if (v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v56[0] = 0x1EA4BF808;
          v57[0] = v46;
          v56[1] = CFSTR("rowsData");
          v57[1] = v44;
          v42 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
          v22 = (id)objc_msgSend(v50, "_schema");
          v41 = (id)objc_msgSend(v50, "insertRows:usingSchema:error:", v42);

          if (*v52)
          {
            v55 = 0;
            v49 = 1;
          }
          else
          {
            v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            if (v41)
              objc_msgSend(v40, "setObject:forKey:", v41, v51);
            else
              objc_msgSend(v40, "setObject:forKey:", CFSTR("SQL insert failed"), v51);
            v39 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B8948);
            v38 = 0;
            v37 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("refreshEntityTable"));
            if (v37 && objc_msgSend(v37, "intValue"))
            {
              if (v39)
              {
                v35 = v38;
                v21 = (id)objc_msgSend(v54, "refreshEntityTableForDomain:error:", v39, &v35);
                objc_storeStrong(&v38, v35);
                v36 = v21;
                if (v38)
                {
                  v19 = (void *)MEMORY[0x1E0CB3940];
                  v20 = (id)objc_msgSend(v38, "localizedDescription");
                  v7 = (id)objc_msgSend(v19, "stringWithFormat:", CFSTR("Error refreshing entity table: %@"), v20);
                  v8 = v36;
                  v36 = v7;

                }
                objc_msgSend(v40, "setObject:forKey:", v36, CFSTR("refreshEntity"));
                objc_storeStrong(&v36, 0);
              }
              else
              {
                v34 = MEMORY[0x1E0C81028];
                v33 = 16;
                if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
                {
                  log = v34;
                  type = v33;
                  __os_log_helper_16_0_0(v32);
                  _os_log_error_impl(&dword_1DC678000, log, type, "SQLITE SaveEvent RefreshEntity: no domain", v32, 2u);
                }
                objc_storeStrong(&v34, 0);
              }
            }
            v31 = 0;
            v30 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("refreshODTP"));
            if (v30 && objc_msgSend(v30, "intValue"))
            {
              if (v39)
              {
                obj = v31;
                v16 = (id)objc_msgSend(v54, "refreshODTPForDomain:error:", v39, &obj);
                objc_storeStrong(&v31, obj);
                v29 = v16;
                if (v31)
                {
                  v14 = (void *)MEMORY[0x1E0CB3940];
                  v15 = (id)objc_msgSend(v31, "localizedDescription");
                  v9 = (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("Error refreshing ODTP: %@"), v15);
                  v10 = v29;
                  v29 = v9;

                }
                objc_msgSend(v40, "setObject:forKey:", v29, CFSTR("refreshODTP"));
                objc_storeStrong(&v29, 0);
              }
              else
              {
                oslog = (os_log_t)MEMORY[0x1E0C81028];
                v26 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                {
                  v12 = oslog;
                  v13 = v26;
                  __os_log_helper_16_0_0(v25);
                  _os_log_error_impl(&dword_1DC678000, v12, v13, "SQLITE SaveEvent RefreshODTP: no domain", v25, 2u);
                }
                objc_storeStrong((id *)&oslog, 0);
              }
            }
            +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v40, CFSTR("SQLEventSaveSummary"), 0);
            v55 = v40;
            v49 = 1;
            objc_storeStrong(&v30, 0);
            objc_storeStrong(&v31, 0);
            objc_storeStrong(&v37, 0);
            objc_storeStrong(&v38, 0);
            objc_storeStrong(&v39, 0);
            objc_storeStrong(&v40, 0);
          }
          objc_storeStrong(&v41, 0);
          objc_storeStrong(&v42, 0);
        }
        else
        {
          v43 = CFSTR("No rows data");
          v6 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v43);
          *v52 = v6;
          v55 = 0;
          v49 = 1;
          objc_storeStrong((id *)&v43, 0);
        }
        objc_storeStrong(&v44, 0);
      }
      else
      {
        v45 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown stream: %@"), v48);
        v5 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v45);
        *v52 = v5;
        v55 = 0;
        v49 = 1;
        objc_storeStrong(&v45, 0);
      }
      objc_storeStrong(&v46, 0);
    }
    else
    {
      v47 = CFSTR("No stream name");
      v4 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v47);
      *v52 = v4;
      v55 = 0;
      v49 = 1;
      objc_storeStrong((id *)&v47, 0);
    }
    objc_storeStrong(&v48, 0);
  }
  else
  {
    *v52 = (id)objc_msgSend(v50, "generateDBLoadError");
    v55 = 0;
    v49 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  return v55;
}

+ (id)trimEventsForStreams:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  AMDFetchDescriptor *v6;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  AMDFetchDescriptor *v27;
  NSObject *log;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id obj;
  uint64_t v35;
  id v37;
  id v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  uint64_t v42;
  os_log_type_t v43;
  os_log_t v44;
  os_log_type_t v45;
  os_log_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  os_log_type_t type;
  os_log_t oslog;
  id v62;
  _QWORD __b[8];
  uint64_t v64;
  id v65;
  id v66;
  __CFString *v67;
  id v68;
  id v69;
  int v70;
  __CFString *v71;
  id *v72;
  id location[3];
  id v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint64_t v77;
  uint8_t v78[16];
  uint8_t v79[16];
  uint8_t v80[24];
  _QWORD v81[4];
  _QWORD v82[4];
  uint64_t v83;
  uint64_t v84;
  const __CFString *v85;
  id v86;
  id v87;
  uint8_t v88[24];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = a4;
  if (location[0])
  {
    v69 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
    if ((objc_msgSend(v69, "isUsable") & 1) != 0)
    {
      v68 = (id)objc_msgSend(v69, "getDataSchema");
      if (v68)
      {
        v66 = (id)objc_msgSend(v68, "getStreamToTableMap");
        v65 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        memset(__b, 0, sizeof(__b));
        obj = location[0];
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v89, 16);
        if (v35)
        {
          v31 = *(_QWORD *)__b[2];
          v32 = 0;
          v33 = v35;
          while (1)
          {
            v30 = v32;
            if (*(_QWORD *)__b[2] != v31)
              objc_enumerationMutation(obj);
            v64 = *(_QWORD *)(__b[1] + 8 * v32);
            v62 = 0;
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            type = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              log = oslog;
              v29 = type;
              __os_log_helper_16_2_1_8_64((uint64_t)v88, v64);
              _os_log_impl(&dword_1DC678000, log, v29, "Performing cleanup for stream: %@", v88, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            v59 = (id)objc_msgSend(location[0], "objectForKey:", v64);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v58 = v59;
              v57 = (id)objc_msgSend(v66, "objectForKey:", v64);
              v85 = CFSTR("creationTime");
              v83 = AMD_SQLITE_TYPE;
              v84 = AMD_SQLITE_DATA_TYPE_INT64;
              v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83);
              v86 = v26;
              v25 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
              v87 = v25;
              v56 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);

              v81[0] = 0x1EA4BF668;
              v82[0] = v57;
              v81[1] = 0x1EA4BF808;
              v82[1] = v57;
              v81[2] = 0x1EA4BF648;
              v82[2] = v56;
              v81[3] = 0x1EA4BF7E8;
              v82[3] = CFSTR("creationTime ASC");
              v55 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 4);
              v6 = [AMDFetchDescriptor alloc];
              v53 = v62;
              v27 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v6, "initWithDict:usingSchema:error:", v55, v68, &v53);
              objc_storeStrong(&v62, v53);
              v54 = v27;
              if (v62)
              {
                v23 = v65;
                v24 = (id)objc_msgSend(v62, "localizedDescription");
                objc_msgSend(v23, "setObject:forKey:");

                v70 = 3;
              }
              else
              {
                v51 = 0;
                v22 = (id)objc_msgSend(v69, "fetchRowsUsingSchema:andDescriptor:andPersist:error:", v68, v54, 0, &v51);
                objc_storeStrong(&v62, v51);
                v52 = v22;
                if (v62)
                {
                  v20 = v65;
                  v21 = (id)objc_msgSend(v62, "localizedDescription");
                  objc_msgSend(v20, "setObject:forKey:");

                  v70 = 3;
                }
                else
                {
                  v50 = (id)objc_msgSend(v52, "objectForKey:", CFSTR("resultSet"));
                  v49 = (id)objc_msgSend(v50, "objectForKey:", CFSTR("fetchResultColumnsData"));
                  if (objc_msgSend(v49, "count"))
                  {
                    v48 = (id)objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
                    v47 = 0;
                    v47 = objc_msgSend(v48, "count");
                    v46 = (os_log_t)MEMORY[0x1E0C81028];
                    v45 = OS_LOG_TYPE_DEBUG;
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                    {
                      v18 = v46;
                      v19 = v45;
                      __os_log_helper_16_0_1_8_0((uint64_t)v80, objc_msgSend(v58, "longValue"));
                      _os_log_debug_impl(&dword_1DC678000, v18, v19, "Record limit for stream: %ld", v80, 0xCu);
                    }
                    objc_storeStrong((id *)&v46, 0);
                    v44 = (os_log_t)MEMORY[0x1E0C81028];
                    v43 = OS_LOG_TYPE_DEBUG;
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                    {
                      v16 = v44;
                      v17 = v43;
                      __os_log_helper_16_0_1_8_0((uint64_t)v79, v47);
                      _os_log_debug_impl(&dword_1DC678000, v16, v17, "Current record count: %ld", v79, 0xCu);
                    }
                    objc_storeStrong((id *)&v44, 0);
                    v15 = v47;
                    if (v15 > objc_msgSend(v58, "longValue"))
                    {
                      v42 = 0;
                      v14 = v47;
                      v42 = v14 - objc_msgSend(v58, "longValue");
                      v41 = (os_log_t)MEMORY[0x1E0C81028];
                      v40 = OS_LOG_TYPE_DEBUG;
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                      {
                        v12 = v41;
                        v13 = v40;
                        __os_log_helper_16_0_1_8_0((uint64_t)v78, v42);
                        _os_log_debug_impl(&dword_1DC678000, v12, v13, "Elements to delete: %ld", v78, 0xCu);
                      }
                      objc_storeStrong((id *)&v41, 0);
                      v39 = (id)objc_msgSend(v48, "objectAtIndex:", v42);
                      v38 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ < %llu"), CFSTR("creationTime"), objc_msgSend(v39, "longLongValue"));
                      v8 = v38;
                      v77 = v64;
                      v9 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
                      v37 = +[AMDSQLite deleteEventsWithPredicate:forStreams:](AMDSQLite, "deleteEventsWithPredicate:forStreams:", v8);

                      v10 = v65;
                      v75[0] = CFSTR("summary");
                      v76[0] = v37;
                      v75[1] = CFSTR("deletionTimestamp");
                      v76[1] = v39;
                      v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
                      objc_msgSend(v10, "setObject:forKey:");

                      objc_storeStrong(&v37, 0);
                      objc_storeStrong(&v38, 0);
                      objc_storeStrong(&v39, 0);
                      v70 = 0;
                    }
                    else
                    {
                      objc_msgSend(v65, "setObject:forKey:", &unk_1EA4CEC08, v64);
                      v70 = 3;
                    }
                    objc_storeStrong(&v48, 0);
                  }
                  else
                  {
                    objc_msgSend(v65, "setObject:forKey:", CFSTR("Unexpected error: No CreationTime column"), v64);
                    v70 = 3;
                  }
                  objc_storeStrong(&v49, 0);
                  objc_storeStrong(&v50, 0);
                }
                objc_storeStrong(&v52, 0);
              }
              objc_storeStrong(&v54, 0);
              objc_storeStrong(&v55, 0);
              objc_storeStrong(&v56, 0);
              objc_storeStrong(&v57, 0);
              objc_storeStrong(&v58, 0);
            }
            else
            {
              objc_msgSend(v65, "setObject:forKey:", CFSTR("record limit is not of type NSNumber"), v64);
              v70 = 3;
            }
            objc_storeStrong(&v59, 0);
            objc_storeStrong(&v62, 0);
            ++v32;
            if (v30 + 1 >= v33)
            {
              v32 = 0;
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v89, 16);
              if (!v33)
                break;
            }
          }
        }

        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v65, CFSTR("SQLTableTruncationSummary"), 0);
        v74 = v65;
        v70 = 1;
        objc_storeStrong(&v65, 0);
        objc_storeStrong(&v66, 0);
      }
      else
      {
        v67 = CFSTR("SQL database does not have a schema available");
        v5 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v67);
        *v72 = v5;
        v74 = 0;
        v70 = 1;
        objc_storeStrong((id *)&v67, 0);
      }
      objc_storeStrong(&v68, 0);
    }
    else
    {
      *v72 = (id)objc_msgSend(v69, "generateDBLoadError");
      v74 = 0;
      v70 = 1;
    }
    objc_storeStrong(&v69, 0);
  }
  else
  {
    v71 = CFSTR("recordLimits dict is nil");
    v4 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v71);
    *v72 = v4;
    v74 = 0;
    v70 = 1;
    objc_storeStrong((id *)&v71, 0);
  }
  objc_storeStrong(location, 0);
  return v74;
}

+ (id)truncateEvents:(id *)a3
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v6[15];
  char v7;
  id location[3];
  id v9;

  v9 = a1;
  location[2] = (id)a2;
  location[1] = a3;
  location[0] = MEMORY[0x1E0C81028];
  v7 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1DC678000, log, type, "SQLITE Truncating all events tables", v6, 2u);
  }
  objc_storeStrong(location, 0);
  return (id)objc_msgSend(v9, "deleteEventsWithPredicate:forStreams:", 0);
}

+ (id)updateData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *log;
  os_log_type_t v24;
  id v25;
  id v26;
  _QWORD v27[8];
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  _QWORD __b[8];
  uint64_t v33;
  id v34;
  int v35;
  os_log_type_t v36;
  os_log_t v37;
  __CFString *v38;
  id v39;
  unsigned int v40;
  id v41;
  id v42;
  uint8_t v43[7];
  os_log_type_t type;
  os_log_t oslog;
  id location[2];
  id v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint8_t v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v47 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    v24 = type;
    __os_log_helper_16_0_0(v43);
    _os_log_debug_impl(&dword_1DC678000, log, v24, "SQLITE Updating all data", v43, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v42 = 0;
  v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  v40 = 365;
  v22 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2DE8);

  if (v22)
  {
    v21 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2DE8);
    v40 = objc_msgSend(v21, "unsignedIntValue");

  }
  v19 = (id)objc_msgSend(v47, "deleteEventsOlderThan:", v40);
  objc_msgSend(v41, "setObject:forKey:");

  v20 = (id)objc_msgSend(v47, "loadNewData:", location[0]);
  objc_msgSend(v41, "setObject:forKey:");

  v39 = (id)objc_msgSend(v47, "getDomainsFrom:", location[0]);
  if (v39)
  {
    v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v39, "count"));
    memset(__b, 0, sizeof(__b));
    v17 = v39;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
    if (v18)
    {
      v14 = *(_QWORD *)__b[2];
      v15 = 0;
      v16 = v18;
      while (1)
      {
        v13 = v15;
        if (*(_QWORD *)__b[2] != v14)
          objc_enumerationMutation(v17);
        v33 = *(_QWORD *)(__b[1] + 8 * v15);
        v30 = v42;
        v12 = (id)objc_msgSend(v47, "refreshEntityTableForDomain:error:", v33, &v30);
        objc_storeStrong(&v42, v30);
        v31 = v12;
        if (v12)
          objc_msgSend(v34, "setObject:forKey:", v31, v33);
        else
          objc_msgSend(v34, "setObject:forKey:", CFSTR("Entity table refresh failed"), v33);
        objc_storeStrong(&v31, 0);
        ++v15;
        if (v13 + 1 >= v16)
        {
          v15 = 0;
          v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
          if (!v16)
            break;
        }
      }
    }

    objc_msgSend(v41, "setObject:forKey:", v34, CFSTR("refreshEntities"));
    v9 = objc_alloc(MEMORY[0x1E0C99E08]);
    v29 = (id)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v39, "count"));
    memset(v27, 0, sizeof(v27));
    v10 = v39;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v27, v49, 16);
    if (v11)
    {
      v6 = *(_QWORD *)v27[2];
      v7 = 0;
      v8 = v11;
      while (1)
      {
        v5 = v7;
        if (*(_QWORD *)v27[2] != v6)
          objc_enumerationMutation(v10);
        v28 = *(_QWORD *)(v27[1] + 8 * v7);
        v25 = v42;
        v4 = (id)objc_msgSend(v47, "refreshODTPForDomain:error:", v28, &v25);
        objc_storeStrong(&v42, v25);
        v26 = v4;
        if (v4)
          objc_msgSend(v29, "setObject:forKey:", v26, v28);
        else
          objc_msgSend(v29, "setObject:forKey:", CFSTR("ODTP refresh failed"), v28);
        objc_storeStrong(&v26, 0);
        ++v7;
        if (v5 + 1 >= v8)
        {
          v7 = 0;
          v8 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v27, v49, 16);
          if (!v8)
            break;
        }
      }
    }

    objc_msgSend(v41, "setObject:forKey:", v29, CFSTR("refreshAggregations"));
    v48 = v41;
    v35 = 1;
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    v38 = CFSTR("SQLITE Update: no domains");
    v37 = (os_log_t)MEMORY[0x1E0C81028];
    v36 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v38);
      _os_log_error_impl(&dword_1DC678000, v37, v36, "%@", v51, 0xCu);
    }
    objc_storeStrong((id *)&v37, 0);
    objc_msgSend(v41, "setObject:forKey:", v38, CFSTR("error"));
    v48 = v41;
    v35 = 1;
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  return v48;
}

+ (id)updateTablesHandler:(id)a3 error:(id *)a4
{
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(v8, "updateTablesInternal:usingSchema:error:", location[0], 0, a4);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)updateTablesInternal:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v23;
  _QWORD v24[8];
  uint64_t v25;
  id v26;
  id v27;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v31;
  id v32;
  int v33;
  id v34;
  id *v35;
  id v36;
  id location[3];
  id v38;
  const __CFString *v39;
  id v40;
  _BYTE v41[128];
  uint8_t v42[24];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = a5;
  v34 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("allUpdates"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v34, "count"))
  {
    v32 = v34;
    memset(__b, 0, sizeof(__b));
    v20 = v32;
    if (objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v43, 16))
    {
      v31 = *(_QWORD *)__b[1];
      v5 = (id)objc_msgSend(v32, "objectForKey:", v31);
      v6 = v34;
      v34 = v5;

      if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v34, "count"))
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v42, v31);
          _os_log_debug_impl(&dword_1DC678000, oslog, type, "SQLITE Updting db '%@'", v42, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v33 = 2;
      }
      else
      {
        v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("No updates info"));
        *v35 = v7;
        v38 = 0;
        v33 = 1;
      }
    }
    else
    {
      v33 = 0;
    }

    if (!v33 || v33 == 2)
    {
      v27 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
      if ((objc_msgSend(v27, "isUsable") & 1) != 0)
      {
        if (!v36)
        {
          v9 = (id)objc_msgSend(v27, "_schema");
          v10 = v36;
          v36 = v9;

        }
        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memset(v24, 0, sizeof(v24));
        v18 = v34;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v24, v41, 16);
        if (v19)
        {
          v15 = *(_QWORD *)v24[2];
          v16 = 0;
          v17 = v19;
          while (1)
          {
            v14 = v16;
            if (*(_QWORD *)v24[2] != v15)
              objc_enumerationMutation(v18);
            v25 = *(_QWORD *)(v24[1] + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = (id)objc_msgSend(v27, "updateTableUsingDescriptor:andSchema:error:", v25, v36, v35);
              if (*v35)
              {
                v12 = v26;
                v13 = (id)objc_msgSend(*v35, "localizedDescription");
                objc_msgSend(v12, "addObject:");

              }
              else
              {
                objc_msgSend(v26, "addObject:", v23);
              }
              objc_storeStrong(&v23, 0);
            }
            else
            {
              objc_msgSend(v26, "addObject:", CFSTR("Missing or invalid update descriptor"));
            }
            ++v16;
            if (v14 + 1 >= v17)
            {
              v16 = 0;
              v17 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v24, v41, 16);
              if (!v17)
                break;
            }
          }
        }

        v39 = CFSTR("updateSummary");
        v40 = v26;
        v38 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v33 = 1;
        objc_storeStrong(&v26, 0);
      }
      else
      {
        v8 = (id)objc_msgSend(v27, "generateDBLoadError");
        *v35 = v8;
        v38 = 0;
        v33 = 1;
      }
      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong(&v32, 0);
  }
  else
  {
    *v35 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Missing updates info for all DBs"));
    v38 = 0;
    v33 = 1;
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v38;
}

- (id)getPredicateExtensionForTable:(id)a3 forUser:(id)a4 andDomain:(id)a5 error:(id *)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id *v23;
  id v24;
  id v25;
  id location[2];
  AMDSQLite *v27;
  id v28;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = a6;
  v22 = -[AMDSQLite getDataSchema](v27, "getDataSchema");
  if (v22)
  {
    v20 = (id)objc_msgSend(v22, "getSchemaForTable:", location[0]);
    if (!v20)
    {
      v28 = 0;
      v21 = 1;
LABEL_22:
      objc_storeStrong(&v20, 0);
      goto LABEL_23;
    }
    v19 = &stru_1EA4B7088;
    v18 = (id)objc_msgSend(v20, "getColumns");
    v17 = 0;
    v13 = (id)objc_msgSend(v18, "objectForKey:", CFSTR("userId"));

    if (v13)
    {
      objc_storeStrong(&v17, CFSTR("userId"));
    }
    else
    {
      v12 = (id)objc_msgSend(v18, "objectForKey:", CFSTR("dsId"));

      if (v12)
        objc_storeStrong(&v17, CFSTR("dsId"));
    }
    if (v17)
    {
      if (!v25)
      {
        v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("User identifier required"));
        *v23 = v6;
        v28 = 0;
        v21 = 1;
LABEL_21:
        objc_storeStrong(&v17, 0);
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        goto LABEL_22;
      }
      v7 = (id)objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("AND %@ == '%@'"), v17, v25);
    }
    v11 = (id)objc_msgSend(v18, "objectForKey:", CFSTR("domain"));

    if (v11)
    {
      if (!v24)
      {
        v8 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, CFSTR("Domain identifier required"));
        *v23 = v8;
        v28 = 0;
        v21 = 1;
        goto LABEL_21;
      }
      v9 = (id)objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("AND %@ == %@"), CFSTR("domain"), v24);
    }
    if ((objc_msgSend(v19, "isEqualToString:", &stru_1EA4B7088) & 1) != 0)
      v28 = 0;
    else
      v28 = v19;
    v21 = 1;
    goto LABEL_21;
  }
  v28 = 0;
  v21 = 1;
LABEL_23:
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28;
}

- (id)prepareBootstrapSchema
{
  AMDSQLiteSchema *v2;
  AMDSQLiteSchema *v3;
  void *v5;
  id v6;
  AMDSQLiteSchema *v7;
  BOOL v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  AMDSQLite *v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = 0;
  v11 = +[AMDSQLite getBootstrapSchemaDict](AMDSQLite, "getBootstrapSchemaDict");
  v2 = [AMDSQLiteSchema alloc];
  v10 = v12[0];
  v7 = -[AMDSQLiteSchema initWithDict:error:](v2, "initWithDict:error:", v11, &v10);
  objc_storeStrong(v12, v10);
  -[AMDSQLite set_bootstrapSchema:](v13, "set_bootstrapSchema:", v7);

  v3 = -[AMDSQLite _bootstrapSchema](v13, "_bootstrapSchema");
  v8 = v3 != 0;

  if (v8)
  {
    v14 = &unk_1EA4D0C40;
  }
  else
  {
    -[AMDSQLite set_error:](v13, "set_error:", v12[0]);
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (id)objc_msgSend(v12[0], "localizedDescription");
    v9 = (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("SQLITE Boot schema prep failure: %@"), v6);

    v15 = CFSTR("bootSchemaLoadSummary");
    v16[0] = v9;
    v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return v14;
}

- (id)bootstrapDb
{
  id v3;
  id v5;
  AMDSQLiteSchema *v6;
  id v7;
  id v8;
  id v9[2];
  AMDSQLite *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = 0;
  v6 = -[AMDSQLite _bootstrapSchema](self, "_bootstrapSchema");
  v7 = v9[0];
  v5 = -[AMDSQLite applySchema:error:](self, "applySchema:error:");
  objc_storeStrong(v9, v7);
  v8 = v5;

  if (v9[0])
    -[AMDSQLite set_error:](v10, "set_error:", v9[0]);
  v3 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  return v3;
}

- (id)getError
{
  return -[AMDSQLite _error](self, "_error", a2, self);
}

- (sqlite3)getDb
{
  return -[AMDSQLite _db](self, "_db", a2, self);
}

- (id)getDataSchema
{
  return -[AMDSQLite _schema](self, "_schema", a2, self);
}

- (id)getBiomeSchema
{
  return -[AMDSQLite _biomeSchema](self, "_biomeSchema", a2, self);
}

- (id)getMegadomeSchema
{
  return -[AMDSQLite _megadomeSchema](self, "_megadomeSchema", a2, self);
}

- (id)getBootSchema
{
  return -[AMDSQLite _bootstrapSchema](self, "_bootstrapSchema", a2, self);
}

- (id)connectionState
{
  AMDSQLiteSchema *v2;
  AMDSQLiteSchema *v3;
  AMDSQLiteSchema *v4;
  AMDSQLiteSchema *v5;
  id v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  id v11;
  NSString *v12;
  NSError *v13;
  NSError *v14;
  BOOL v15;
  BOOL v16;
  id v17;
  id v18[2];
  AMDSQLite *v19;

  v19 = self;
  v18[1] = (id)a2;
  v18[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[AMDSQLite _isEnabled](v19, "_isEnabled"))
  {
    if (-[AMDSQLite _db](v19, "_db"))
    {
      v2 = -[AMDSQLite _bootstrapSchema](v19, "_bootstrapSchema");
      v16 = v2 != 0;

      if (v16)
      {
        v3 = -[AMDSQLite _schema](v19, "_schema");
        v15 = v3 != 0;

        if (v15)
        {
          v14 = -[AMDSQLite _error](v19, "_error");

          if (v14)
          {
            v10 = (void *)MEMORY[0x1E0CB3940];
            v13 = -[AMDSQLite _error](v19, "_error");
            v12 = -[NSError localizedDescription](v13, "localizedDescription");
            v11 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("SQLITE internal error: %@"), v12);
            objc_msgSend(v18[0], "addObject:");

          }
        }
        else
        {
          objc_msgSend(v18[0], "addObject:", CFSTR("SQLITE db has no data schema"));
        }
      }
      else
      {
        objc_msgSend(v18[0], "addObject:", CFSTR("SQLITE db not bootstrapped"));
      }
    }
    else
    {
      objc_msgSend(v18[0], "addObject:", CFSTR("SQLITE db not loaded"));
    }
  }
  else
  {
    objc_msgSend(v18[0], "addObject:", CFSTR("SQLITE disabled"));
  }
  if (!objc_msgSend(v18[0], "count"))
    objc_msgSend(v18[0], "addObject:", CFSTR("SQLite ready"));
  v4 = -[AMDSQLite _megadomeSchema](v19, "_megadomeSchema");
  v9 = v4 != 0;

  if (!v9)
    objc_msgSend(v18[0], "addObject:", CFSTR("no Megadome schema"));
  v5 = -[AMDSQLite _biomeSchema](v19, "_biomeSchema");
  v8 = v5 != 0;

  if (!v8)
    objc_msgSend(v18[0], "addObject:", CFSTR("no Biome schema"));
  v17 = (id)objc_msgSend(v18[0], "componentsJoinedByString:", CFSTR(";"));
  v7 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  return v7;
}

- (id)generateDBLoadError
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = -[AMDSQLite connectionState](self, "connectionState");
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DB not usable: %@"), v6[0]);
  v4 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 30, v5);
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (BOOL)isUsable
{
  id v3;
  BOOL v4;
  id location;
  os_log_type_t v6;
  id v7;
  int v8;
  char v9;
  AMDSQLiteSchema *v10;
  char v11;
  AMDSQLiteSchema *v12;
  char v13;
  SEL v14;
  AMDSQLite *v15;
  BOOL v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14 = a2;
  v13 = 0;
  v11 = 0;
  v9 = 0;
  v4 = 0;
  if (-[AMDSQLite _isEnabled](self, "_isEnabled"))
  {
    v4 = 0;
    if (-[AMDSQLite _db](v15, "_db"))
    {
      v12 = -[AMDSQLite _bootstrapSchema](v15, "_bootstrapSchema");
      v11 = 1;
      v4 = 0;
      if (v12)
      {
        v10 = -[AMDSQLite _schema](v15, "_schema");
        v9 = 1;
        v4 = v10 != 0;
      }
    }
  }
  v16 = v4;
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  v8 = 1;
  v7 = MEMORY[0x1E0C81028];
  v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    v3 = -[AMDSQLite connectionState](v15, "connectionState");
    location = v3;
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)location);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v7, v6, "%@", v17, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v7, 0);
  if ((v13 & 1) != 0)
    objc_exception_rethrow();
  return v16;
}

- (BOOL)isUsableInternal
{
  id v3;
  BOOL v4;
  id location;
  os_log_type_t v6;
  id v7;
  int v8;
  char v9;
  AMDSQLiteSchema *v10;
  char v11;
  SEL v12;
  AMDSQLite *v13;
  BOOL v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = self;
  v12 = a2;
  v11 = 0;
  v9 = 0;
  v4 = 0;
  if (-[AMDSQLite _isEnabled](self, "_isEnabled"))
  {
    v4 = 0;
    if (-[AMDSQLite _db](v13, "_db"))
    {
      v10 = -[AMDSQLite _bootstrapSchema](v13, "_bootstrapSchema");
      v9 = 1;
      v4 = v10 != 0;
    }
  }
  v14 = v4;
  if ((v9 & 1) != 0)

  v8 = 1;
  v7 = MEMORY[0x1E0C81028];
  v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    v3 = -[AMDSQLite connectionState](v13, "connectionState");
    location = v3;
    __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)location);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v7, v6, "%@", v15, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v7, 0);
  if ((v11 & 1) != 0)
    objc_exception_rethrow();
  return v14;
}

- (void)setEnable:(BOOL)a3
{
  const __CFString *v3;
  os_log_t oslog;
  BOOL v5;
  SEL v6;
  AMDSQLite *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = self;
  v6 = a2;
  v5 = a3;
  -[AMDSQLite set_isEnabled:](self, "set_isEnabled:", a3);
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
      v3 = CFSTR("enabled");
    else
      v3 = CFSTR("disabled");
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v3);
    _os_log_debug_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE set to: %@", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (id)loadDb
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  char v26;
  os_log_t v27;
  uint8_t v28[7];
  os_log_type_t v29;
  os_log_t v30;
  uint8_t v31[7];
  os_log_type_t v32;
  os_log_t v33;
  int flags;
  os_log_type_t v35;
  os_log_t v36;
  uint8_t v37[7];
  os_log_type_t v38;
  os_log_t v39;
  os_log_type_t v40;
  os_log_t v41;
  uint8_t v42[7];
  os_log_type_t v43;
  os_log_t v44;
  uint8_t v45[7];
  os_log_type_t v46;
  os_log_t oslog;
  uint8_t v48[15];
  char v49;
  id v50;
  id v51;
  unsigned int v52;
  sqlite3 *ppDb;
  id v54;
  id v55;
  os_log_type_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  os_log_type_t v62;
  os_log_t location[2];
  AMDSQLite *v64;
  uint8_t v65[16];
  uint8_t v66[16];
  uint8_t v67[16];
  uint8_t v68[16];
  uint8_t v69[24];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v64 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)MEMORY[0x1E0C81028];
  v62 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)CFSTR("0"));
    _os_log_impl(&dword_1DC678000, location[0], v62, "SQLITE Version: %@", v69, 0xCu);
  }
  objc_storeStrong((id *)location, 0);
  v61 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v60 = (id)objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
  v59 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("AMDSQLite.db"), CFSTR("0"));
  v58 = (id)objc_msgSend(v60, "stringByAppendingPathComponent:", v59);
  v57 = MEMORY[0x1E0C81028];
  v56 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v58);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v57, v56, "SQLITE Loading from DB file: %@", v68, 0xCu);
  }
  objc_storeStrong(&v57, 0);
  v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v55, "setObject:forKey:", CFSTR("0"), CFSTR("version"));
  -[AMDSQLite set_error:](v64, "set_error:", 0);
  v54 = 0;
  ppDb = 0;
  v52 = 0;
  v51 = CFSTR("loadDBSummary");
  v25 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v26 = objc_msgSend(v25, "fileExistsAtPath:", v58);

  if ((v26 & 1) != 0)
  {
    v50 = MEMORY[0x1E0C81028];
    v49 = 2;
    if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEBUG))
    {
      v23 = v50;
      v24 = v49;
      __os_log_helper_16_0_0(v48);
      _os_log_debug_impl(&dword_1DC678000, v23, v24, "SQLITE DB found", v48, 2u);
    }
    objc_storeStrong(&v50, 0);
    v52 = sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v58), "UTF8String"), &ppDb, 65538, 0);
    if (v52)
    {
      v2 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE DB loading failed: %d"), v52);
      v3 = v54;
      v54 = v2;

    }
    else
    {
      -[AMDSQLite set_db:](v64, "set_db:", ppDb);
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v46 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v21 = oslog;
        v22 = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_debug_impl(&dword_1DC678000, v21, v22, "SQLITE Loaded DB", v45, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v52 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL;", 0, 0, 0);
      if (v52)
      {
        v41 = (os_log_t)MEMORY[0x1E0C81028];
        v40 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v67, v52);
          _os_log_debug_impl(&dword_1DC678000, v41, v40, "SQLITE Setting journaling to WAL failed: %d", v67, 8u);
        }
        objc_storeStrong((id *)&v41, 0);
        objc_msgSend(v55, "setObject:forKey:", CFSTR("loaded without WAL mode"), v51);
      }
      else
      {
        v44 = (os_log_t)MEMORY[0x1E0C81028];
        v43 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v19 = v44;
          v20 = v43;
          __os_log_helper_16_0_0(v42);
          _os_log_debug_impl(&dword_1DC678000, v19, v20, "SQLITE Journaling set to WAL", v42, 2u);
        }
        objc_storeStrong((id *)&v44, 0);
        objc_msgSend(v55, "setObject:forKey:", CFSTR("loaded in WAL mode"), v51);
      }
      v39 = (os_log_t)MEMORY[0x1E0C81028];
      v38 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v17 = v39;
        v18 = v38;
        __os_log_helper_16_0_0(v37);
        _os_log_impl(&dword_1DC678000, v17, v18, "Running bootstrap schema refresh", v37, 2u);
      }
      objc_storeStrong((id *)&v39, 0);
      v15 = v55;
      v16 = -[AMDSQLite bootstrapDb](v64, "bootstrapDb");
      objc_msgSend(v15, "addEntriesFromDictionary:");

    }
  }
  else
  {
    v36 = (os_log_t)MEMORY[0x1E0C81028];
    v35 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v58);
      _os_log_impl(&dword_1DC678000, v36, v35, "SQLITE Creating new DB at: %@", v66, 0xCu);
    }
    objc_storeStrong((id *)&v36, 0);
    flags = 65542;
    v52 = sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v58), "UTF8String"), &ppDb, 65542, 0);
    if (v52)
    {
      v4 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE DB creation failed: %d"), v52);
      v5 = v54;
      v54 = v4;

    }
    else
    {
      -[AMDSQLite set_db:](v64, "set_db:", ppDb);
      v13 = v55;
      v14 = -[AMDSQLite bootstrapDb](v64, "bootstrapDb");
      objc_msgSend(v13, "addEntriesFromDictionary:");

      v33 = (os_log_t)MEMORY[0x1E0C81028];
      v32 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v11 = v33;
        v12 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_debug_impl(&dword_1DC678000, v11, v12, "SQLITE Created new DB", v31, 2u);
      }
      objc_storeStrong((id *)&v33, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("createdDb"), CFSTR("SQLiteLoadDb"), 2);
      v52 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL;", 0, 0, 0);
      if (v52)
      {
        v27 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v65, v52);
          _os_log_debug_impl(&dword_1DC678000, v27, OS_LOG_TYPE_DEBUG, "SQLITE Setting journaling to WAL failed: %d", v65, 8u);
        }
        objc_storeStrong((id *)&v27, 0);
        objc_msgSend(v55, "setObject:forKey:", CFSTR("created without WAL mode"), v51);
      }
      else
      {
        v30 = (os_log_t)MEMORY[0x1E0C81028];
        v29 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v9 = v30;
          v10 = v29;
          __os_log_helper_16_0_0(v28);
          _os_log_debug_impl(&dword_1DC678000, v9, v10, "SQLITE Journaling set to WAL", v28, 2u);
        }
        objc_storeStrong((id *)&v30, 0);
        objc_msgSend(v55, "setObject:forKey:", CFSTR("created in WAL mode"), v51);
      }
    }
  }
  if (v54)
  {
    v8 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 22, v54);
    -[AMDSQLite set_error:](v64, "set_error:");

    -[AMDSQLite set_db:](v64, "set_db:", 0);
    sqlite3_close(ppDb);
    objc_msgSend(v55, "setObject:forKey:", v54, v51);
  }
  v7 = v55;
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  return v7;
}

- (id)applySchema:(id)a3 error:(id *)a4
{
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  id v18;
  NSObject *log;
  os_log_type_t v20;
  id v21;
  id v23;
  id v24;
  os_log_type_t v25;
  os_log_t v26;
  id v27;
  id v28;
  id v29;
  _QWORD __b[8];
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  os_log_type_t v34;
  os_log_t v35;
  id v36;
  id v37;
  id v38;
  os_log_type_t type;
  os_log_t oslog;
  id *v41;
  id location[2];
  AMDSQLite *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t v46[16];
  _BYTE v47[128];
  uint8_t v48[16];
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = a4;
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    log = oslog;
    v20 = type;
    v21 = (id)objc_msgSend(location[0], "getName");
    v38 = v21;
    __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v38);
    _os_log_impl(&dword_1DC678000, log, v20, "SQLITE applying schema '%@'", v49, 0xCu);

    objc_storeStrong(&v38, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = (id)objc_msgSend(location[0], "getTables");
  v36 = (id)objc_msgSend(v18, "allKeys");

  v35 = (os_log_t)MEMORY[0x1E0C81028];
  v34 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v48, objc_msgSend(v36, "count"));
    _os_log_impl(&dword_1DC678000, v35, v34, "SQLITE Creating %lu tables", v48, 0xCu);
  }
  objc_storeStrong((id *)&v35, 0);
  v33 = 0;
  v32 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v36;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
  if (v17)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v17;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(obj);
      v31 = *(_QWORD *)(__b[1] + 8 * v14);
      v29 = 0;
      v27 = 0;
      v11 = -[AMDSQLite createTable:usingSchema:error:](v43, "createTable:usingSchema:error:", v31, location[0], &v27);
      objc_storeStrong(&v29, v27);
      v28 = v11;
      if (v29)
      {
        ++v33;
      }
      else
      {
        if (v28)
          objc_msgSend(v37, "setObject:forKey:", v28, v31);
        ++v32;
      }
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v29, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
        if (!v15)
          break;
      }
    }
  }

  v26 = (os_log_t)MEMORY[0x1E0C81028];
  v25 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v46, v32, v33);
    _os_log_impl(&dword_1DC678000, v26, v25, "SQLITE table creation: succceed: %u, failed: %u", v46, 0xEu);
  }
  objc_storeStrong((id *)&v26, 0);
  v7 = v37;
  v44[0] = CFSTR("succeeded");
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32);
  v45[0] = v10;
  v44[1] = CFSTR("failed");
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v33);
  v45[1] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  objc_msgSend(v7, "setObject:forKey:");

  if (v33)
  {
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u Errors while applying schema"), v33);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v24);
    *v41 = v4;
    objc_msgSend(v37, "setObject:forKey:", v24, CFSTR("createTableError"));
    objc_storeStrong(&v24, 0);
  }
  v23 = -[AMDSQLite createIndices:error:](v43, "createIndices:error:", location[0], v41);
  objc_msgSend(v37, "setObject:forKey:", v23, CFSTR("createIndicesSummary"));
  v6 = v37;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)createIndices:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  NSObject *log;
  os_log_type_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id obj;
  uint64_t v19;
  id v20;
  id v21;
  os_log_t oslog;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t);
  void *v28;
  AMDSQLite *v29;
  id v30;
  id v31[2];
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  int v36;
  os_log_type_t type;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD __b[8];
  id v44;
  id v45;
  id v46;
  id v47[2];
  id location[2];
  AMDSQLite *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t v52[16];
  uint8_t v53[24];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47[1] = a4;
  v47[0] = (id)objc_msgSend(location[0], "getIndices");
  v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v46 = (id)objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v47[0], "count"));
  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v45 = (id)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v47[0], "count"));
  memset(__b, 0, sizeof(__b));
  obj = v47[0];
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
  if (v19)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v19;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(obj);
      v44 = *(id *)(__b[1] + 8 * v16);
      v42 = (id)objc_msgSend(v47[0], "objectForKey:", v44);
      v41 = (id)objc_msgSend(v42, "objectForKey:", 0x1EA4BF808);
      v40 = (id)objc_msgSend(v42, "objectForKey:", AMD_SQLITE_COLUMNS);
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = v44;
      v13 = v41;
      v10 = (id)objc_msgSend(v40, "componentsJoinedByString:", CFSTR(","));
      v39 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)"), v12, v13, v10);

      v38 = MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
      {
        log = v38;
        v9 = type;
        __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v39);
        _os_log_debug_impl(&dword_1DC678000, log, v9, "SQLITE Creating index:: '%@'", v53, 0xCu);
      }
      objc_storeStrong(&v38, 0);
      v32 = 0;
      v33 = &v32;
      v34 = 0x20000000;
      v35 = 32;
      v36 = 1;
      queue = -[AMDSQLite _executorQueue](v49, "_executorQueue");
      v24 = MEMORY[0x1E0C809B0];
      v25 = -1073741824;
      v26 = 0;
      v27 = __33__AMDSQLite_createIndices_error___block_invoke;
      v28 = &unk_1EA4B5300;
      v31[1] = &v32;
      v29 = v49;
      v30 = v39;
      v31[0] = v44;
      dispatch_sync(queue, &v24);

      if (*((_DWORD *)v33 + 6))
      {
        objc_msgSend(v45, "addObject:", v44);
      }
      else
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          v6 = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v44);
          _os_log_impl(&dword_1DC678000, v6, OS_LOG_TYPE_INFO, "SQLITE Created index: '%@'", v52, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        objc_msgSend(v46, "addObject:", v44);
      }
      objc_storeStrong(v31, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong((id *)&v29, 0);
      _Block_object_dispose(&v32, 8);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
        if (!v17)
          break;
      }
    }
  }

  v50[0] = CFSTR("succeeded");
  v51[0] = v46;
  v50[1] = CFSTR("failed");
  v51[1] = v45;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v47, 0);
  objc_storeStrong(location, 0);
  return v5;
}

void __33__AMDSQLite_createIndices_error___block_invoke(uint64_t a1)
{
  id location;
  id v3;
  char *v4[3];
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4[2] = (char *)a1;
  v4[1] = (char *)a1;
  v4[0] = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "_db"), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), 0, 0, v4);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE CREATE INDEX failure for index '%@': %s"), *(_QWORD *)(a1 + 48), v4[0]);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v3, CFSTR("createIndexError"), 0);
    location = MEMORY[0x1E0C81028];
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_32((uint64_t)v5, *(_QWORD *)(a1 + 48), (uint64_t)v4[0]);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)location, OS_LOG_TYPE_ERROR, "SQLITE CREATE INDEX failure for index '%@': %s", v5, 0x16u);
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v3, 0);
  }
}

- (id)updateSchema:(id)a3 error:(id *)a4
{
  BOOL v4;
  id v5;
  id v6;
  NSError *v8;
  BOOL v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  id v15;
  AMDSQLiteSchema *v16;
  uint64_t v17;
  AMDSQLiteSchema *v18;
  const __CFString *v19;
  void *v20;
  char v22;
  NSString *v23;
  char v24;
  NSError *v25;
  uint8_t v26[7];
  os_log_type_t v27;
  os_log_t v28;
  id v29;
  id v30;
  os_log_type_t v31;
  os_log_t v32;
  id v33;
  os_log_type_t v34;
  os_log_t v35;
  id v36;
  id v37;
  BOOL v38;
  os_log_type_t v39;
  os_log_t oslog;
  id v41;
  char v42;
  __CFString *v43;
  id v44;
  id v45;
  int v46;
  os_log_type_t v47;
  id v48;
  __CFString *v49;
  id v50;
  id v51;
  id *v52;
  id location[2];
  AMDSQLite *v54;
  id v55;
  uint8_t v56[16];
  id v57;
  id v58;
  uint8_t v59[16];
  uint8_t v60[16];
  id v61;
  id v62;
  id v63;
  __CFString *v64;
  uint8_t v65[24];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = a4;
  v51 = CFSTR("UpdateSchema");
  v50 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  if (-[AMDSQLite _isEnabled](v54, "_isEnabled"))
  {
    v45 = -[AMDSQLiteSchema initWithDict:error:]([AMDSQLiteSchema alloc], "initWithDict:error:", location[0], v52);
    if (v45)
    {
      v41 = (id)objc_msgSend(v45, "getVersionNumber");
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v39 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v41);
        _os_log_impl(&dword_1DC678000, oslog, v39, "SQLITE Attempting schema update to version %@", v60, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v38 = 1;
      v37 = 0;
      v18 = -[AMDSQLite _schema](v54, "_schema");

      if (v18)
      {
        v16 = -[AMDSQLite _schema](v54, "_schema");
        v5 = -[AMDSQLiteSchema getVersionNumber](v16, "getVersionNumber");
        v6 = v37;
        v37 = v5;

        v17 = objc_msgSend(v37, "integerValue");
        v38 = v17 < objc_msgSend(v41, "integerValue");
      }
      if (v38)
      {
        v33 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Update schema from version %@ to %@"), v37, v41);
        v32 = (os_log_t)MEMORY[0x1E0C81028];
        v31 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v33);
          _os_log_impl(&dword_1DC678000, v32, v31, "%@", v56, 0xCu);
        }
        objc_storeStrong((id *)&v32, 0);
        v30 = 0;
        v14 = v50;
        v29 = 0;
        v15 = -[AMDSQLite applySchema:error:](v54, "applySchema:error:", v45, &v29);
        objc_storeStrong(&v30, v29);
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("applySchema"));

        if (v30)
        {
          v28 = (os_log_t)MEMORY[0x1E0C81028];
          v27 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v12 = v28;
            v13 = v27;
            __os_log_helper_16_0_0(v26);
            _os_log_error_impl(&dword_1DC678000, v12, v13, "SQLITE Could not apply schema, not saving it in DB", v26, 2u);
          }
          objc_storeStrong((id *)&v28, 0);
          v55 = v50;
          v46 = 1;
        }
        else
        {
          v10 = v50;
          v11 = -[AMDSQLite saveSchema:error:](v54, "saveSchema:error:", location[0], v52);
          objc_msgSend(v10, "setObject:forKey:");

          if (!*v52)
            -[AMDSQLite set_schema:](v54, "set_schema:", v45);
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v33, CFSTR("SQLiteSchemaUpdate"), 2);
          objc_msgSend(v50, "setObject:forKey:", v41, CFSTR("newVersion"));
          v8 = -[AMDSQLite _error](v54, "_error");
          v24 = 0;
          v22 = 0;
          v9 = 0;
          if (v8)
          {
            v25 = -[AMDSQLite _error](v54, "_error");
            v24 = 1;
            v23 = -[NSError localizedDescription](v25, "localizedDescription");
            v22 = 1;
            v9 = -[NSString isEqualToString:](v23, "isEqualToString:", CFSTR("No Schema Data"));
          }
          if ((v22 & 1) != 0)

          if ((v24 & 1) != 0)
          if (v9)
            -[AMDSQLite set_error:](v54, "set_error:", 0);
          v55 = v50;
          v46 = 1;
        }
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v33, 0);
      }
      else
      {
        v36 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Skipping schema update: current version %@"), v37);
        v35 = (os_log_t)MEMORY[0x1E0C81028];
        v34 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v36);
          _os_log_impl(&dword_1DC678000, v35, v34, "%@", v59, 0xCu);
        }
        objc_storeStrong((id *)&v35, 0);
        v57 = v51;
        v58 = v36;
        v55 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v46 = 1;
        objc_storeStrong(&v36, 0);
      }
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v41, 0);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v4 = *v52 == 0;
      v42 = 0;
      if (v4)
      {
        v19 = CFSTR("unknown reason");
      }
      else
      {
        v43 = (__CFString *)(id)objc_msgSend(*v52, "localizedDescription");
        v42 = 1;
        v19 = v43;
      }
      v44 = (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("SQLITE new schema parse failure: %@"), v19);
      if ((v42 & 1) != 0)

      v61 = v51;
      v62 = v44;
      v55 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v46 = 1;
      objc_storeStrong(&v44, 0);
    }
    objc_storeStrong(&v45, 0);
  }
  else
  {
    v49 = CFSTR("SQLITE Cannot update schema: SQLite disabled");
    v48 = MEMORY[0x1E0C81028];
    v47 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v49);
      _os_log_impl(&dword_1DC678000, (os_log_t)v48, v47, "%@", v65, 0xCu);
    }
    objc_storeStrong(&v48, 0);
    v63 = v51;
    v64 = v49;
    v55 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v46 = 1;
    objc_storeStrong((id *)&v49, 0);
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  return v55;
}

- (id)saveSchema:(id)a3 error:(id *)a4
{
  BOOL v4;
  AMDSQLite *v6;
  id v7;
  AMDSQLiteSchema *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  char v22;
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  id *v27;
  id location[2];
  AMDSQLite *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  id v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = CFSTR("SaveSchema");
  v25 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", location[0], 6, a4);
  if (*a4)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v4 = *v27 == 0;
    v22 = 0;
    if (v4)
    {
      v14 = CFSTR("unknown reason");
    }
    else
    {
      v23 = (__CFString *)(id)objc_msgSend(*v27, "localizedDescription");
      v22 = 1;
      v14 = v23;
    }
    v24 = (id)objc_msgSend(v15, "stringWithFormat:", CFSTR("SQLITE new schema serialization failure: %@"), v14);
    if ((v22 & 1) != 0)

    v38 = v26;
    v39[0] = v24;
    v30 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v21 = 1;
    objc_storeStrong(&v24, 0);
  }
  else
  {
    v35[0] = CFSTR("schema");
    v36[0] = v25;
    v35[1] = CFSTR("creationTime");
    v12 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
    v36[1] = v12;
    v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35);
    v37 = v11;
    v20 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);

    v33[0] = 0x1EA4BF808;
    v34[0] = CFSTR("__AMDSchema");
    v33[1] = CFSTR("rowsData");
    v34[1] = v20;
    v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v13 = -[AMDSQLite deleteRowsInternal:error:](v29, "deleteRowsInternal:error:", v19, v27);
    objc_msgSend(v18, "addEntriesFromDictionary:");

    if (*v27)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = (id)objc_msgSend(*v27, "localizedDescription");
      v17 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("SQLITE could not truncate schema table: %@"), v10);

      v31 = v26;
      v32 = v17;
      v30 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v21 = 1;
      objc_storeStrong(&v17, 0);
    }
    else
    {
      v6 = v29;
      v8 = -[AMDSQLite _bootstrapSchema](v29, "_bootstrapSchema");
      v7 = -[AMDSQLite insertRows:usingSchema:error:](v6, "insertRows:usingSchema:error:", v19);
      objc_msgSend(v18, "addEntriesFromDictionary:");

      v30 = v18;
      v21 = 1;
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v30;
}

- (id)loadDataSchema
{
  AMDSQLiteSchema *v2;
  AMDSQLiteSchema *v3;
  AMDSQLiteSchema *v4;
  id v6;
  id v7;
  AMDSQLiteSchema *v8;
  AMDSQLiteSchema *v9;
  const __CFString *v10;
  void *v11;
  AMDSQLiteSchema *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  AMDFetchDescriptor *v29;
  AMDFetchDescriptor *v30;
  AMDSQLiteSchema *v31;
  AMDSQLite *v32;
  id v33;
  AMDSQLiteSchema *v34;
  NSObject *v35;
  os_log_type_t v36;
  BOOL v37;
  NSObject *v38;
  os_log_type_t v39;
  NSObject *log;
  os_log_type_t v41;
  os_log_t v42;
  id v43;
  id v44;
  os_log_type_t v45;
  os_log_t v46;
  char v47;
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
  id v59;
  os_log_type_t v60;
  id v61;
  char v62;
  id v63;
  id v64;
  id v65;
  os_log_type_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint8_t v76[15];
  os_log_type_t v77;
  id v78;
  int v79;
  uint8_t v80[15];
  os_log_type_t v81;
  id v82;
  id v83;
  uint8_t v84[15];
  os_log_type_t type;
  os_log_t location[2];
  AMDSQLite *v87;
  id v88;
  _QWORD v89[2];
  _QWORD v90[2];
  id v91;
  id v92;
  uint8_t v93[16];
  id v94;
  id v95;
  uint8_t v96[16];
  id v97;
  id v98;
  uint8_t v99[16];
  id v100;
  id v101;
  uint8_t v102[16];
  id v103;
  const __CFString *v104;
  uint8_t v105[16];
  id v106;
  id v107;
  uint8_t v108[16];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[2];
  _QWORD v112[2];
  const __CFString *v113;
  id v114;
  id v115;
  id v116;
  const __CFString *v117;
  id v118;
  _QWORD v119[2];

  v119[1] = *MEMORY[0x1E0C80C00];
  v87 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_INFO))
  {
    log = location[0];
    v41 = type;
    __os_log_helper_16_0_0(v84);
    _os_log_impl(&dword_1DC678000, log, v41, "SQLITE Loading run-time schema from DB", v84, 2u);
  }
  objc_storeStrong((id *)location, 0);
  v83 = CFSTR("loadSchemaSummary");
  -[AMDSQLite set_schema:](v87, "set_schema:", 0);
  if (-[AMDSQLite _db](v87, "_db"))
  {
    v2 = -[AMDSQLite _bootstrapSchema](v87, "_bootstrapSchema");
    v37 = v2 != 0;

    if (v37)
    {
      v113 = CFSTR("schema");
      v111[0] = AMD_SQLITE_TYPE;
      v112[0] = AMD_SQLITE_DATA_TYPE_BLOB;
      v111[1] = AMD_SQLITE_NOT_NULL;
      v112[1] = MEMORY[0x1E0C9AAB0];
      v27 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
      v114 = v27;
      v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113);
      v115 = v26;
      v75 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);

      v109[0] = 0x1EA4BF668;
      v110[0] = CFSTR("__AMDSchema");
      v109[1] = 0x1EA4BF808;
      v110[1] = CFSTR("__AMDSchema");
      v109[2] = 0x1EA4BF708;
      v110[2] = CFSTR("1");
      v109[3] = 0x1EA4BF648;
      v110[3] = v75;
      v74 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 4);
      v73 = 0;
      v29 = [AMDFetchDescriptor alloc];
      v28 = v74;
      v31 = -[AMDSQLite _bootstrapSchema](v87, "_bootstrapSchema");
      v71 = v73;
      v30 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v29, "initWithDict:usingSchema:error:", v28);
      objc_storeStrong(&v73, v71);
      v72 = v30;

      v32 = v87;
      v34 = -[AMDSQLite _bootstrapSchema](v87, "_bootstrapSchema");
      v69 = v73;
      v33 = -[AMDSQLite fetchRowsUsingSchema:andDescriptor:andPersist:error:](v32, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");
      objc_storeStrong(&v73, v69);
      v70 = v33;

      if (v73)
      {
        -[AMDSQLite set_error:](v87, "set_error:", v73);
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = (id)objc_msgSend(v73, "localizedDescription");
        v68 = (id)objc_msgSend(v24, "stringWithFormat:", CFSTR("SQLITE schema fetch failure: '%@'"), v25);

        v67 = MEMORY[0x1E0C81028];
        v66 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v108, (uint64_t)v68);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v67, v66, "%@", v108, 0xCu);
        }
        objc_storeStrong(&v67, 0);
        v106 = v83;
        v107 = v68;
        v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
        v79 = 1;
        objc_storeStrong(&v68, 0);
      }
      else
      {
        v65 = (id)objc_msgSend(v70, "objectForKey:", CFSTR("resultSet"));
        v64 = (id)objc_msgSend(v65, "objectForKey:", CFSTR("fetchResultColumnsData"));
        v62 = 0;
        v23 = 1;
        if (v64)
        {
          v23 = 1;
          if (objc_msgSend(v64, "count"))
          {
            v63 = (id)objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
            v62 = 1;
            v23 = objc_msgSend(v63, "count") == 0;
          }
        }
        if ((v62 & 1) != 0)

        if (v23)
        {
          v61 = MEMORY[0x1E0C81028];
          v60 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v105, (uint64_t)CFSTR("No Schema Data"));
            _os_log_error_impl(&dword_1DC678000, (os_log_t)v61, v60, "%@", v105, 0xCu);
          }
          objc_storeStrong(&v61, 0);
          v22 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22);
          -[AMDSQLite set_error:](v87, "set_error:");

          v103 = v83;
          v104 = CFSTR("No Schema Data");
          v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
          v79 = 1;
        }
        else
        {
          v21 = (id)objc_msgSend(v64, "objectAtIndexedSubscript:");
          v59 = (id)objc_msgSend(v21, "objectAtIndexedSubscript:", 0);

          if (v59 && objc_msgSend(v59, "length"))
          {
            v54 = v73;
            v17 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v59, 4, &v54);
            objc_storeStrong(&v73, v54);
            v55 = v17;
            if (v17 && !v73)
            {
              v3 = [AMDSQLiteSchema alloc];
              v50 = v73;
              v12 = -[AMDSQLiteSchema initWithDict:error:](v3, "initWithDict:error:", v55, &v50);
              objc_storeStrong(&v73, v50);
              -[AMDSQLite set_schema:](v87, "set_schema:", v12);

              v4 = -[AMDSQLite _schema](v87, "_schema");
              v13 = v4 != 0;

              if (v13)
              {
                v8 = -[AMDSQLite _schema](v87, "_schema");
                v44 = -[AMDSQLiteSchema getVersion](v8, "getVersion");

                v9 = -[AMDSQLite _schema](v87, "_schema");
                v43 = -[AMDSQLiteSchema getTables](v9, "getTables");

                v42 = (os_log_t)MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v93, (uint64_t)v44);
                  _os_log_impl(&dword_1DC678000, v42, OS_LOG_TYPE_INFO, "SQLITE Loaded schema version %@", v93, 0xCu);
                }
                objc_storeStrong((id *)&v42, 0);
                v91 = v83;
                v89[0] = CFSTR("version");
                v90[0] = v44;
                v89[1] = CFSTR("tableCount");
                v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
                v90[1] = v7;
                v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
                v92 = v6;
                v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);

                v79 = 1;
                objc_storeStrong(&v43, 0);
                objc_storeStrong(&v44, 0);
              }
              else
              {
                -[AMDSQLite set_error:](v87, "set_error:", v73);
                v11 = (void *)MEMORY[0x1E0CB3940];
                v47 = 0;
                if (v73)
                {
                  v48 = (id)objc_msgSend(v73, "localizedDescription");
                  v47 = 1;
                  v10 = (const __CFString *)v48;
                }
                else
                {
                  v10 = CFSTR("unknown");
                }
                v49 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("Fail: '%@'"), v10);
                if ((v47 & 1) != 0)

                v46 = (os_log_t)MEMORY[0x1E0C81028];
                v45 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v96, (uint64_t)v49);
                  _os_log_error_impl(&dword_1DC678000, v46, v45, "%@", v96, 0xCu);
                }
                objc_storeStrong((id *)&v46, 0);
                v94 = v83;
                v95 = v49;
                v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
                v79 = 1;
                objc_storeStrong(&v49, 0);
              }
            }
            else
            {
              objc_storeStrong(&v73, 0);
              v15 = (void *)MEMORY[0x1E0CB3940];
              v16 = (id)objc_msgSend(v73, "localizedDescription");
              v53 = (id)objc_msgSend(v15, "stringWithFormat:", CFSTR("Error deserializing schema: %@"), v16);

              v52 = (os_log_t)MEMORY[0x1E0C81028];
              v51 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v99, (uint64_t)v53);
                _os_log_error_impl(&dword_1DC678000, v52, v51, "%@", v99, 0xCu);
              }
              objc_storeStrong((id *)&v52, 0);
              v14 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v53);
              -[AMDSQLite set_error:](v87, "set_error:");

              v97 = v83;
              v98 = v53;
              v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
              v79 = 1;
              objc_storeStrong(&v53, 0);
            }
            objc_storeStrong(&v55, 0);
          }
          else
          {
            v20 = (void *)MEMORY[0x1E0CB3940];
            if (v59)
              v19 = objc_msgSend(v59, "length");
            else
              v19 = -1;
            v58 = (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("No schema data, size: %d"), v19);
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            v56 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v102, (uint64_t)v58);
              _os_log_error_impl(&dword_1DC678000, oslog, v56, "%@", v102, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            v18 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v58);
            -[AMDSQLite set_error:](v87, "set_error:");

            v100 = v83;
            v101 = v58;
            v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
            v79 = 1;
            objc_storeStrong(&v58, 0);
          }
          objc_storeStrong(&v59, 0);
        }
        objc_storeStrong(&v64, 0);
        objc_storeStrong(&v65, 0);
      }
      objc_storeStrong(&v70, 0);
      objc_storeStrong(&v72, 0);
      objc_storeStrong(&v73, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
    }
    else
    {
      v78 = MEMORY[0x1E0C81028];
      v77 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR))
      {
        v35 = v78;
        v36 = v77;
        __os_log_helper_16_0_0(v76);
        _os_log_error_impl(&dword_1DC678000, v35, v36, "Not bootstrapped", v76, 2u);
      }
      objc_storeStrong(&v78, 0);
      v116 = v83;
      v117 = CFSTR("Not bootstrapped");
      v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v79 = 1;
    }
  }
  else
  {
    v82 = MEMORY[0x1E0C81028];
    v81 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_ERROR))
    {
      v38 = v82;
      v39 = v81;
      __os_log_helper_16_0_0(v80);
      _os_log_error_impl(&dword_1DC678000, v38, v39, "No DB", v80, 2u);
    }
    objc_storeStrong(&v82, 0);
    v118 = v83;
    v119[0] = CFSTR("No DB");
    v88 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
    v79 = 1;
  }
  objc_storeStrong(&v83, 0);
  return v88;
}

- (id)loadBiomeSchema
{
  AMDSQLiteSchema *v3;

  v3 = -[AMDSQLite _schema](self, "_schema");
  -[AMDSQLite set_biomeSchema:](self, "set_biomeSchema:");

  return MEMORY[0x1E0C9AA70];
}

- (id)loadMegadomeSchema
{
  AMDSQLiteSchema *v3;

  v3 = -[AMDSQLite _schema](self, "_schema");
  -[AMDSQLite set_megadomeSchema:](self, "set_megadomeSchema:");

  return MEMORY[0x1E0C9AA70];
}

- (id)createTable:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  NSObject *queue;
  os_log_t oslog;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  AMDSQLite *v16;
  id v17;
  id v18[2];
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  int v23;
  id v24;
  id v25;
  int v26;
  id v27;
  id v28;
  os_log_type_t v29;
  id v30;
  id *v31;
  id v32;
  id location[2];
  AMDSQLite *v34;
  id v35;
  id v36;
  const __CFString *v37;
  uint8_t v38[16];
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = a5;
  v30 = MEMORY[0x1E0C81028];
  v29 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)location[0]);
    _os_log_impl(&dword_1DC678000, (os_log_t)v30, v29, "SQLITE Creating table '%@'", v43, 0xCu);
  }
  objc_storeStrong(&v30, 0);
  v28 = CFSTR("createTableStatus");
  if (-[AMDSQLite _db](v34, "_db"))
  {
    v25 = (id)objc_msgSend(v32, "getCreateTableStatementFor:", location[0]);
    if (v25)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x20000000;
      v22 = 32;
      v23 = 1;
      queue = -[AMDSQLite _executorQueue](v34, "_executorQueue");
      v11 = MEMORY[0x1E0C809B0];
      v12 = -1073741824;
      v13 = 0;
      v14 = __43__AMDSQLite_createTable_usingSchema_error___block_invoke;
      v15 = &unk_1EA4B5300;
      v18[1] = &v19;
      v16 = v34;
      v17 = v25;
      v18[0] = location[0];
      dispatch_sync(queue, &v11);

      if (*((_DWORD *)v20 + 6))
      {
        v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create %@"), location[0]);
        *v31 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, v10);
        v35 = 0;
        v26 = 1;
        objc_storeStrong(&v10, 0);
      }
      else
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)location[0]);
          _os_log_debug_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Created table '%@'", v38, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v36 = v28;
        v37 = CFSTR("created");
        v35 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v26 = 1;
      }
      objc_storeStrong(v18, 0);
      objc_storeStrong(&v17, 0);
      objc_storeStrong((id *)&v16, 0);
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE CREATE: No table '%@' in schema"), location[0]);
      *v31 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v24);
      v39 = v28;
      v40 = v24;
      v35 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v26 = 1;
      objc_storeStrong(&v24, 0);
    }
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v27 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE CREATE: No db!!"));
    *v31 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v27);
    v41 = v28;
    v42 = v27;
    v35 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v26 = 1;
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v35;
}

void __43__AMDSQLite_createTable_usingSchema_error___block_invoke(uint64_t a1)
{
  id location;
  id v3;
  char *v4[3];
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4[2] = (char *)a1;
  v4[1] = (char *)a1;
  v4[0] = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "_db"), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), 0, 0, v4);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE CREATE TABLE failure for table '%@': %s"), *(_QWORD *)(a1 + 48), v4[0]);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v3, CFSTR("createTableError"), 0);
    location = MEMORY[0x1E0C81028];
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_32((uint64_t)v5, *(_QWORD *)(a1 + 48), (uint64_t)v4[0]);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)location, OS_LOG_TYPE_DEBUG, "SQLITE CREATE TABLE failure for table '%@': %s", v5, 0x16u);
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v3, 0);
  }
}

- (id)validateRowsData:(id)a3 tableSchema:(id)a4 error:(id *)a5
{
  NSObject *log;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v17;
  os_log_t v18;
  os_log_type_t type;
  os_log_t oslog;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  _QWORD __b[8];
  id v26;
  id v27;
  char v28;
  id v29;
  int v30;
  __CFString *v31;
  id v32;
  unsigned int i;
  id v34;
  id v35;
  id v36;
  id *v37;
  id v38;
  id location[3];
  id v40;
  uint8_t v41[32];
  uint8_t v42[24];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37 = a5;
  v36 = (id)objc_msgSend(v38, "getColumns");
  v35 = (id)objc_msgSend(v38, "getRequiredColumns");
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v34 = (id)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(location[0], "count"));
  for (i = 0; ; ++i)
  {
    v14 = i;
    if (v14 >= objc_msgSend(location[0], "count"))
      break;
    v32 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v32;
      v28 = 1;
      v27 = (id)objc_msgSend(v35, "mutableCopy");
      memset(__b, 0, sizeof(__b));
      v12 = v29;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
      if (v13)
      {
        v9 = *(_QWORD *)__b[2];
        v10 = 0;
        v11 = v13;
        while (1)
        {
          v8 = v10;
          if (*(_QWORD *)__b[2] != v9)
            objc_enumerationMutation(v12);
          v26 = *(id *)(__b[1] + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          v23 = v26;
          v22 = (id)objc_msgSend(v36, "objectForKey:", v23);
          if (v22)
          {
            objc_msgSend(v27, "removeObject:", v23);
            v21 = (id)objc_msgSend(v29, "objectForKey:", v26);
            v7 = (char)objc_msgSend(v22, "getType");
            if (v7 <= 5)
              __asm { BR              X8 }
            v28 = 0;
            v30 = 5;
            objc_storeStrong(&v21, 0);
          }
          else
          {
            v30 = 6;
          }
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v23, 0);
          if (v30 && v30 != 6)
            goto LABEL_21;
          ++v10;
          if (v8 + 1 >= v11)
          {
            v10 = 0;
            v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
            if (!v11)
              goto LABEL_20;
          }
        }
        v24 = CFSTR("SQLITE INSERT: invalid row data: bad column name");
        *v37 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 15, v24);
        v40 = 0;
        v30 = 1;
        objc_storeStrong((id *)&v24, 0);
      }
      else
      {
LABEL_20:
        v30 = 0;
      }
LABEL_21:

      if (!v30 || v30 == 5)
      {
        if ((v28 & 1) == 0 || objc_msgSend(v27, "count"))
        {
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          type = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            log = oslog;
            __os_log_helper_16_2_2_4_0_8_64((uint64_t)v42, i, (uint64_t)v27);
            _os_log_debug_impl(&dword_1DC678000, log, type, "SQLITE Row %u not valid, missing required columns: %@", v42, 0x12u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        else
        {
          objc_msgSend(v34, "addObject:", v29);
        }
        v30 = 0;
      }
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v29, 0);
    }
    else
    {
      v31 = CFSTR("SQLITE INSERT: invalid row data");
      *v37 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 15, v31);
      v40 = 0;
      v30 = 1;
      objc_storeStrong((id *)&v31, 0);
    }
    objc_storeStrong(&v32, 0);
    if (v30)
      goto LABEL_36;
  }
  v18 = (os_log_t)MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v41, objc_msgSend(location[0], "count"), objc_msgSend(v34, "count"));
    _os_log_debug_impl(&dword_1DC678000, v18, OS_LOG_TYPE_DEBUG, "SQLITE Total rows: %lu, valid: %lu", v41, 0x16u);
  }
  objc_storeStrong((id *)&v18, 0);
  v40 = v34;
  v30 = 1;
LABEL_36:
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (id)insertRows:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id location[2];
  AMDSQLite *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = -[AMDSQLite insertRows:usingSchema:skipValidation:error:](v11, "insertRows:usingSchema:skipValidation:error:", location[0], v9, 0, a5);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)insertRows:(id)a3 usingSchema:(id)a4 skipValidation:(BOOL)a5 error:(id *)a6
{
  id v6;
  id v7;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  NSObject *log;
  os_log_type_t v15;
  os_log_t v19;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27[4];
  os_log_type_t v28;
  os_log_t oslog;
  uint64_t v30;
  uint64_t *v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  uint64_t v38;
  sqlite3_stmt *v39;
  os_log_type_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  os_log_type_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  int v51;
  uint8_t v52[15];
  os_log_type_t type;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id *v59;
  BOOL v60;
  id v61;
  id location[2];
  AMDSQLite *v63;
  id v64;
  _QWORD v65[2];
  _QWORD v66[2];
  uint8_t v67[32];
  uint8_t v68[32];
  uint8_t v69[16];
  uint8_t v70[24];
  _QWORD v71[2];
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  v63 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v61 = 0;
  objc_storeStrong(&v61, a4);
  v60 = a5;
  v59 = a6;
  v58 = CFSTR("insertedRowsCount");
  v57 = CFSTR("totalRowsCount");
  v56 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF808);
  v55 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("rowsData"));
  if (v55)
  {
    v50 = (id)objc_msgSend(v61, "getSchemaForTable:", v56);
    if (v50)
    {
      v48 = v55;
      if (v60)
      {
        v47 = MEMORY[0x1E0C81028];
        v46 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v56);
          _os_log_impl(&dword_1DC678000, (os_log_t)v47, v46, "SQLITE INSERT: Skipping validation for table '%@'", v70, 0xCu);
        }
        objc_storeStrong(&v47, 0);
      }
      else
      {
        v6 = -[AMDSQLite validateRowsData:tableSchema:error:](v63, "validateRowsData:tableSchema:error:", v55, v50, v59);
        v7 = v48;
        v48 = v6;

      }
      if (v48)
      {
        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v44 = 0;
        v42 = 0;
        v13 = (id)objc_msgSend(v61, "getInsertStatementFor:hasColumns:requiresColumns:", v50, v45, &v42);
        objc_storeStrong(&v44, v42);
        v43 = v13;
        v41 = MEMORY[0x1E0C81028];
        v40 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v43);
          _os_log_impl(&dword_1DC678000, (os_log_t)v41, v40, "Prepared INSERT statement: %@", v69, 0xCu);
        }
        objc_storeStrong(&v41, 0);
        v39 = -[AMDSQLite prepare:error:](v63, "prepare:error:", v43, v59);
        if (v39)
        {
          v35 = 0;
          v36 = &v35;
          v37 = 0x20000000;
          v38 = 32;
          HIDWORD(v38) = objc_msgSend(v48, "count");
          v30 = 0;
          v31 = &v30;
          v32 = 0x20000000;
          v33 = 32;
          v34 = 0;
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v28 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_4_0_8_64((uint64_t)v68, *((_DWORD *)v36 + 6), (uint64_t)v56);
            _os_log_debug_impl(&dword_1DC678000, oslog, v28, "SQLITE Inserting %u rows into table '%@'", v68, 0x12u);
          }
          objc_storeStrong((id *)&oslog, 0);
          queue = -[AMDSQLite _executorQueue](v63, "_executorQueue");
          v20 = MEMORY[0x1E0C809B0];
          v21 = -1073741824;
          v22 = 0;
          v23 = __57__AMDSQLite_insertRows_usingSchema_skipValidation_error___block_invoke;
          v24 = &unk_1EA4B5328;
          v27[1] = &v35;
          v27[3] = v39;
          v25 = v48;
          v26 = v45;
          v27[0] = v44;
          v27[2] = &v30;
          dispatch_sync(queue, &v20);

          sqlite3_finalize(v39);
          v19 = (os_log_t)MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_3_4_0_4_0_8_64((uint64_t)v67, *((_DWORD *)v31 + 6), *((_DWORD *)v36 + 6), (uint64_t)v56);
            _os_log_debug_impl(&dword_1DC678000, v19, OS_LOG_TYPE_DEBUG, "SQLITE Inserted %u of %u rows in table '%@'", v67, 0x18u);
          }
          objc_storeStrong((id *)&v19, 0);
          v65[0] = v58;
          v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v31 + 6));
          v66[0] = v10;
          v65[1] = v57;
          v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v36 + 6));
          v66[1] = v9;
          v64 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);

          v51 = 1;
          objc_storeStrong(v27, 0);
          objc_storeStrong(&v26, 0);
          objc_storeStrong(&v25, 0);
          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(&v35, 8);
        }
        else
        {
          v12 = (id)objc_msgSend(*v59, "localizedDescription");
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

          v64 = 0;
          v51 = 1;
        }
        objc_storeStrong(&v43, 0);
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
      }
      else
      {
        v64 = 0;
        v51 = 1;
      }
      objc_storeStrong(&v48, 0);
    }
    else
    {
      v49 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE INSERT: table '%@' does not exist'"), v56);
      *v59 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 15, v49);
      v64 = 0;
      v51 = 1;
      objc_storeStrong(&v49, 0);
    }
    objc_storeStrong(&v50, 0);
  }
  else
  {
    v54 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEBUG))
    {
      log = v54;
      v15 = type;
      __os_log_helper_16_0_0(v52);
      _os_log_debug_impl(&dword_1DC678000, log, v15, "SQLITE Nothing to insert", v52, 2u);
    }
    objc_storeStrong(&v54, 0);
    v71[0] = v58;
    v72[0] = &unk_1EA4CEC08;
    v71[1] = v57;
    v72[1] = &unk_1EA4CEC08;
    v64 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v51 = 1;
  }
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
  return v64;
}

void __57__AMDSQLite_insertRows_usingSchema_skipValidation_error___block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *log;
  os_log_type_t type;
  os_log_t v11;
  os_log_type_t v12;
  os_log_t v13;
  os_log_type_t v14;
  os_log_t oslog;
  char v16;
  int v17;
  id v18;
  id v19;
  id v20;
  unsigned int j;
  char v22;
  id v23;
  char v24;
  id location;
  int v26;
  unsigned int i;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[16];
  uint8_t v31[32];
  uint8_t v32[32];
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = a1;
  v28 = a1;
  for (i = 0; i < *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24); ++i)
  {
    v26 = 0;
    v26 = sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 72));
    if (v26)
    {
      location = MEMORY[0x1E0C81028];
      v24 = 16;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        log = location;
        type = v24;
        __os_log_helper_16_0_2_4_0_4_0((uint64_t)v33, i, v26);
        _os_log_error_impl(&dword_1DC678000, log, type, "SQLITE could not clear bindings for row %u: %d", v33, 0xEu);
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      v23 = (id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v22 = 0;
      for (j = 0; ; ++j)
      {
        v7 = j;
        if (v7 >= objc_msgSend(*(id *)(a1 + 40), "count"))
          break;
        v20 = (id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", j);
        v19 = (id)objc_msgSend(v20, "getName");
        v18 = (id)objc_msgSend(v23, "objectForKey:", v19);
        if (v18)
        {
          v16 = 0;
          v16 = objc_msgSend(v20, "getType");
          v6 = v16;
          if (v6 <= 5)
            __asm { BR              X8 }
          if (v26)
          {
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            v14 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              v4 = oslog;
              v5 = v14;
              __os_log_helper_16_2_4_8_64_4_0_4_0_4_0((uint64_t)v32, (uint64_t)v19, v16, i, v26);
              _os_log_debug_impl(&dword_1DC678000, v4, v5, "SQLITE Bind failed for column '%@', type: %u, row %u: %d", v32, 0x1Eu);
            }
            objc_storeStrong((id *)&oslog, 0);
            v17 = 5;
          }
          else
          {
            v17 = 0;
          }
        }
        else if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v19) & 1) != 0)
        {
          v22 = 1;
          v17 = 5;
        }
        else
        {
          v17 = 7;
        }
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        if (v17 == 5)
          break;
      }
      if ((v22 & 1) != 0 || v26)
      {
        v13 = (os_log_t)MEMORY[0x1E0C81028];
        v12 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v2 = v13;
          v3 = v12;
          __os_log_helper_16_0_3_4_0_4_0_4_0((uint64_t)v31, i, v22 & 1, v26);
          _os_log_impl(&dword_1DC678000, v2, v3, "SQLITE Skipping row %u, rowBad: %u, sqlResponse: %d", v31, 0x14u);
        }
        objc_storeStrong((id *)&v13, 0);
        v17 = 4;
      }
      else
      {
        v26 = sqlite3_step(*(sqlite3_stmt **)(a1 + 72));
        if (v26 == 101)
        {
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        }
        else
        {
          v11 = (os_log_t)MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v1 = v11;
            __os_log_helper_16_0_2_4_0_4_0((uint64_t)v30, i, v26);
            _os_log_error_impl(&dword_1DC678000, v1, OS_LOG_TYPE_ERROR, "SQLITE INSERT failure (row %u): %d", v30, 0xEu);
          }
          objc_storeStrong((id *)&v11, 0);
        }
        sqlite3_reset(*(sqlite3_stmt **)(a1 + 72));
        v17 = 0;
      }
      objc_storeStrong(&v23, 0);
    }
  }
}

- (id)fetchRows:(id)a3 andPersist:(BOOL)a4 error:(id *)a5
{
  AMDSQLite *v6;
  AMDSQLiteSchema *v7;
  id location[2];
  AMDSQLite *v10;
  id v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[AMDSQLite isUsable](v10, "isUsable"))
  {
    v6 = v10;
    v7 = -[AMDSQLite _schema](v10, "_schema");
    v11 = -[AMDSQLite fetchRowsUsingSchema:andDescriptor:andPersist:error:](v6, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");

  }
  else
  {
    *a5 = -[AMDSQLite generateDBLoadError](v10, "generateDBLoadError");
    v11 = 0;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (id)fetchRowsUsingSchema:(id)a3 andDescriptor:(id)a4 andPersist:(BOOL)a5 error:(id *)a6
{
  uint64_t v6;
  AMDSQLite *v11;
  id v12;
  id v13;
  id location[2];
  AMDSQLite *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v11 = v15;
  v6 = -[AMDSQLite _db](v15, "_db");
  v12 = -[AMDSQLite fetchRowsFrom:usingDescriptor:andSchema:columnMajorOutput:rowMajorOutput:andPersist:error:](v11, "fetchRowsFrom:usingDescriptor:andSchema:columnMajorOutput:rowMajorOutput:andPersist:error:", v6, v13, location[0], 1, 0, a5, a6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (id)fetchRowsFrom:(sqlite3 *)a3 usingDescriptor:(id)a4 andSchema:(id)a5 columnMajorOutput:(BOOL)a6 rowMajorOutput:(BOOL)a7 andPersist:(BOOL)a8 error:(id *)a9
{
  id v9;
  id v10;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *queue;
  id v29;
  id v30;
  id v35;
  id v36;
  _QWORD __b[8];
  id v38;
  id v39;
  id v40;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v43;
  int v44;
  int v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  id v49;
  id v50[4];
  BOOL v51;
  BOOL v52;
  uint64_t v53;
  uint64_t *v54;
  int v55;
  int v56;
  void (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  int v62;
  int v63;
  char v64;
  id v65;
  unsigned int i;
  id v67;
  id v68;
  char v69;
  sqlite3_stmt *pStmt;
  int v71;
  id v72;
  id *v73;
  BOOL v74;
  BOOL v75;
  BOOL v76;
  id v77;
  id location;
  sqlite3 *v79;
  SEL v80;
  AMDSQLite *v81;
  id v82;
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[2];
  _QWORD v88[2];
  _BYTE v89[128];
  uint8_t v90[24];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v81 = self;
  v80 = a2;
  v79 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v77 = 0;
  objc_storeStrong(&v77, a5);
  v76 = a6;
  v75 = a7;
  v74 = a8;
  v73 = a9;
  v72 = (id)objc_msgSend(location, "getStatement");
  if (!v72)
  {
    *v73 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, CFSTR("Fetch descriptor unusable!"));
    v82 = 0;
    v71 = 1;
    goto LABEL_28;
  }
  pStmt = +[AMDSQLite prepare:usingDb:error:](AMDSQLite, "prepare:usingDb:error:", v72, v79, v73);
  if (!pStmt)
  {
    v30 = (id)objc_msgSend(*v73, "localizedDescription");
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

    v82 = 0;
    v71 = 1;
    goto LABEL_28;
  }
  v69 = 0;
  v68 = (id)objc_msgSend(location, "getColumnSpecs");
  v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v68, "count"));
  for (i = 0; i < (unint64_t)objc_msgSend(v68, "count"); ++i)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v67, "addObject:", v29);

  }
  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0;
  v61 = &v60;
  v62 = 0x20000000;
  v63 = 32;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 838860800;
  v56 = 48;
  v57 = __Block_byref_object_copy__0;
  v58 = __Block_byref_object_dispose__0;
  v59 = 0;
  queue = -[AMDSQLite _executorQueue](v81, "_executorQueue");
  v43 = MEMORY[0x1E0C809B0];
  v44 = -1073741824;
  v45 = 0;
  v46 = __103__AMDSQLite_fetchRowsFrom_usingDescriptor_andSchema_columnMajorOutput_rowMajorOutput_andPersist_error___block_invoke;
  v47 = &unk_1EA4B5350;
  v50[3] = pStmt;
  v48 = v68;
  v50[1] = &v53;
  v50[2] = &v60;
  v51 = v76;
  v49 = v67;
  v52 = v75;
  v50[0] = v65;
  dispatch_sync(queue, &v43);

  if ((v61[3] & 1) == 0)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v25 = (id)objc_msgSend(v67, "objectAtIndexedSubscript:", 0);
      v26 = objc_msgSend(v25, "count");
      v24 = (id)objc_msgSend(location, "getId");
      v40 = v24;
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v90, v26, (uint64_t)v40);
      _os_log_debug_impl(&dword_1DC678000, oslog, type, "SQLITE Fetched %lu rows from descriptor '%@'", v90, 0x16u);

      objc_storeStrong(&v40, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v39 = (id)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v68, "count"));
    memset(__b, 0, sizeof(__b));
    v21 = v68;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v89, 16);
    if (v22)
    {
      v18 = *(_QWORD *)__b[2];
      v19 = 0;
      v20 = v22;
      while (1)
      {
        v17 = v19;
        if (*(_QWORD *)__b[2] != v18)
          objc_enumerationMutation(v21);
        v38 = *(id *)(__b[1] + 8 * v19);
        v16 = v39;
        v87[0] = CFSTR("name");
        v15 = (id)objc_msgSend(v38, "getSelectColumnName");
        v88[0] = v15;
        v87[1] = AMD_SQLITE_TYPE;
        v14 = (id)objc_msgSend(v38, "getTypeString");
        v88[1] = v14;
        v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
        objc_msgSend(v16, "addObject:");

        ++v19;
        if (v17 + 1 >= v20)
        {
          v19 = 0;
          v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", __b, v89, 16);
          if (!v20)
            break;
        }
      }
    }

    v85[0] = CFSTR("fetchResultColumnsInfo");
    v86[0] = v39;
    v85[1] = CFSTR("fetchResultColumnsData");
    v86[1] = v67;
    v85[2] = CFSTR("fetchResultRowsData");
    v86[2] = v65;
    v36 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
    v35 = 0;
    if (v74)
    {
      v9 = (id)objc_msgSend(location, "persist:error:", v36, v73);
      v10 = v35;
      v35 = v9;

      if (*v73)
      {
        v82 = 0;
        v71 = 1;
LABEL_24:
        objc_storeStrong(&v35, 0);
        objc_storeStrong(&v36, 0);
        objc_storeStrong(&v39, 0);
        goto LABEL_25;
      }
    }
    else
    {
      objc_storeStrong(&v35, CFSTR("Persistance not requested"));
    }
    v83[0] = CFSTR("resultSet");
    v84[0] = v36;
    v83[1] = CFSTR("persistStatus");
    v84[1] = v35;
    v82 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
    v71 = 1;
    goto LABEL_24;
  }
  v27 = objc_retainAutorelease((id)v54[5]);
  *v73 = v27;
  v82 = 0;
  v71 = 1;
LABEL_25:
  objc_storeStrong(v50, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v48, 0);
  _Block_object_dispose(&v53, 8);
  objc_storeStrong(&v59, 0);
  _Block_object_dispose(&v60, 8);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  v12 = v71;
  sqlite3_finalize(pStmt);
  if ((v69 & 1) != 0)
    objc_exception_rethrow();
  v71 = v12;
  if (v12 == 2)
  {
    __break(1u);
    JUMPOUT(0x1DC6B89F0);
  }
LABEL_28:
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(&location, 0);
  return v82;
}

void __103__AMDSQLite_fetchRowsFrom_usingDescriptor_andSchema_columnMajorOutput_rowMajorOutput_andPersist_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int k;
  id v15;
  unsigned int j;
  int v17;
  char v18;
  int v19;
  id location;
  unsigned int i;
  id v22[3];

  v22[2] = (id)a1;
  v22[1] = (id)a1;
  do
  {
    if (sqlite3_step(*(sqlite3_stmt **)(a1 + 72)) != 100)
      break;
    v22[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    for (i = 0; ; ++i)
    {
      v12 = i;
      if (v12 >= objc_msgSend(*(id *)(a1 + 32), "count"))
        break;
      location = (id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v19 = 0;
      v19 = sqlite3_column_type(*(sqlite3_stmt **)(a1 + 72), i);
      v18 = 0;
      v18 = objc_msgSend(location, "getType");
      v11 = v18;
      if (v11 <= 5)
        __asm { BR              X8 }
      v1 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, CFSTR("Unexpected data type. Check!"));
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v3 = *(void **)(v2 + 40);
      *(_QWORD *)(v2 + 40) = v1;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v17 = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) & 1) != 0 ? 4 : 0;
      objc_storeStrong(&location, 0);
      if (v17)
        break;
    }
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) & 1) != 0)
    {
      v17 = 3;
    }
    else
    {
      if ((*(_BYTE *)(a1 + 80) & 1) != 0)
      {
        for (j = 0; ; ++j)
        {
          v10 = j;
          if (v10 >= objc_msgSend(*(id *)(a1 + 32), "count"))
            break;
          v9 = (id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", j);
          v8 = (id)objc_msgSend(v22[0], "objectAtIndexedSubscript:", j);
          objc_msgSend(v9, "addObject:");

        }
      }
      if ((*(_BYTE *)(a1 + 81) & 1) != 0)
      {
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
        for (k = 0; k < (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"); ++k)
        {
          v4 = v15;
          v7 = (id)objc_msgSend(v22[0], "objectAtIndexedSubscript:", k);
          v6 = (id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", k);
          v5 = (id)objc_msgSend(v6, "getName");
          objc_msgSend(v4, "setObject:forKey:", v7);

        }
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
        objc_storeStrong(&v15, 0);
      }
      v17 = 0;
    }
    objc_storeStrong(v22, 0);
  }
  while (!v17);
}

- (id)deleteRows:(id)a3 error:(id *)a4
{
  id location[2];
  AMDSQLite *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[AMDSQLite isUsable](v7, "isUsable"))
  {
    v8 = -[AMDSQLite deleteRowsInternal:error:](v7, "deleteRowsInternal:error:", location[0], a4);
  }
  else
  {
    *a4 = -[AMDSQLite generateDBLoadError](v7, "generateDBLoadError");
    v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (id)deleteRowsInternal:(id)a3 error:(id *)a4
{
  int v5;
  id v6;
  NSObject *v7;
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  os_log_t oslog;
  unsigned int v16;
  id v17;
  uint64_t block;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  sqlite3_stmt *v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  int v29;
  char v30;
  sqlite3_stmt *v31;
  char v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  char v36;
  __CFString *v37;
  char v38;
  __CFString *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int v46;
  id v47;
  id *v48;
  id location[2];
  AMDSQLite *v50;
  id v51;
  const __CFString *v52;
  id v53;
  uint8_t v54[24];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = a4;
  if (-[AMDSQLite _db](v50, "_db"))
  {
    v45 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF808);
    v44 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF788);
    v43 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF7E8);
    v42 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF708);
    v41 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF768);
    v13 = (void *)MEMORY[0x1E0CB3940];
    v38 = 0;
    if (v44)
    {
      v39 = (__CFString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" WHERE %@"), v44);
      v38 = 1;
      v12 = v39;
    }
    else
    {
      v12 = &stru_1EA4B7088;
    }
    v36 = 0;
    if (v43)
    {
      v37 = (__CFString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" ORDER BY %@"), v43);
      v36 = 1;
      v11 = v37;
    }
    else
    {
      v11 = &stru_1EA4B7088;
    }
    v34 = 0;
    if (v42)
    {
      v35 = (__CFString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" LIMIT %@"), v42);
      v34 = 1;
      v10 = v35;
    }
    else
    {
      v10 = &stru_1EA4B7088;
    }
    v32 = 0;
    if (v41)
    {
      v33 = (__CFString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" OFFSET %@"), v41);
      v32 = 1;
      v9 = v33;
    }
    else
    {
      v9 = &stru_1EA4B7088;
    }
    v40 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("DELETE FROM %@%@%@%@%@"), v45, v12, v11, v10, v9);
    if ((v32 & 1) != 0)

    if ((v34 & 1) != 0)
    if ((v36 & 1) != 0)

    if ((v38 & 1) != 0)
    v31 = -[AMDSQLite prepare:error:](v50, "prepare:error:", v40, v48);
    if (v31)
    {
      v30 = 0;
      v25 = 0;
      v26 = &v25;
      v27 = 0x20000000;
      v28 = 32;
      v29 = 1;
      v7 = -[AMDSQLite _executorQueue](v50, "_executorQueue");
      block = MEMORY[0x1E0C809B0];
      v19 = -1073741824;
      v20 = 0;
      v21 = __38__AMDSQLite_deleteRowsInternal_error___block_invoke;
      v22 = &unk_1EA4B5378;
      v23 = &v25;
      v24 = v31;
      dispatch_sync(v7, &block);

      if (*((_DWORD *)v26 + 6) == 101)
      {
        v16 = sqlite3_changes(-[AMDSQLite _db](v50, "_db"));
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_4_0_8_64((uint64_t)v54, v16, (uint64_t)v45);
          _os_log_debug_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Deleted %u rows from table %@", v54, 0x12u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v52 = CFSTR("deleteStatus");
        v6 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleted %u rows"), v16);
        v53 = v6;
        v51 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);

        v46 = 1;
      }
      else
      {
        v17 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE Delete: %d"), *((unsigned int *)v26 + 6));
        *v48 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v17);
        v51 = 0;
        v46 = 1;
        objc_storeStrong(&v17, 0);
      }
      _Block_object_dispose(&v25, 8);
      v5 = v46;
      sqlite3_finalize(v31);
      if ((v30 & 1) != 0)
        objc_exception_rethrow();
      v46 = v5;
      if (v5 == 2)
      {
        __break(1u);
        JUMPOUT(0x1DC6BA01CLL);
      }
    }
    else
    {
      v8 = (id)objc_msgSend(*v48, "localizedDescription");
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      v51 = 0;
      v46 = 1;
    }
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v45, 0);
  }
  else
  {
    v47 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE DELETE: No db!!"));
    *v48 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v47);
    v51 = 0;
    v46 = 1;
    objc_storeStrong(&v47, 0);
  }
  objc_storeStrong(location, 0);
  return v51;
}

uint64_t __38__AMDSQLite_deleteRowsInternal_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)updateTableUsingDescriptor:(id)a3 andSchema:(id)a4 error:(id *)a5
{
  const __CFString *v5;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  const __CFString *v11;
  id v12;
  void *v13;
  id v14;
  const __CFString *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  _BOOL4 v24;
  os_log_t oslog;
  unsigned int v28;
  id v29;
  uint64_t block;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  sqlite3_stmt *v36;
  uint64_t v37;
  uint64_t *v38;
  int v39;
  int v40;
  int v41;
  char v42;
  sqlite3_stmt *v43;
  os_log_type_t type;
  id v45;
  char v46;
  __CFString *v47;
  id v48;
  id v49;
  id v50;
  _QWORD __b[8];
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  BOOL v56;
  id v57;
  int v58;
  id v59;
  id v60;
  id v61;
  id *v62;
  id v63;
  id location[2];
  AMDSQLite *v65;
  id v66;
  const __CFString *v67;
  id v68;
  uint8_t v69[32];
  uint8_t v70[24];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v63 = 0;
  objc_storeStrong(&v63, a4);
  v62 = a5;
  v61 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF808);
  v60 = (id)objc_msgSend(v63, "getSchemaForTable:", v61);
  if (v60)
  {
    v57 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("orReplace"));
    v56 = 0;
    if (v57)
      v24 = objc_msgSend(v57, "intValue") != 0;
    else
      v24 = 0;
    v56 = v24;
    v55 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF7C8);
    if (v55 && objc_msgSend(v55, "count"))
    {
      v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      memset(__b, 0, sizeof(__b));
      v22 = v55;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
      if (v23)
      {
        v19 = *(_QWORD *)__b[2];
        v20 = 0;
        v21 = v23;
        while (1)
        {
          v18 = v20;
          if (*(_QWORD *)__b[2] != v19)
            objc_enumerationMutation(v22);
          v52 = *(_QWORD *)(__b[1] + 8 * v20);
          v50 = (id)objc_msgSend(v55, "objectForKey:", v52);
          v17 = v53;
          v16 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), v52, v50);
          objc_msgSend(v17, "addObject:");

          objc_storeStrong(&v50, 0);
          ++v20;
          if (v18 + 1 >= v21)
          {
            v20 = 0;
            v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
            if (!v21)
              break;
          }
        }
      }

      v49 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BF788);
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = v61;
      v5 = CFSTR(" OR REPLACE");
      if (!v56)
        v5 = &stru_1EA4B7088;
      v15 = v5;
      v12 = (id)objc_msgSend(v53, "componentsJoinedByString:", CFSTR(","));
      v46 = 0;
      if (v49)
      {
        v47 = (__CFString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" WHERE %@"), v49);
        v46 = 1;
        v11 = v47;
      }
      else
      {
        v11 = &stru_1EA4B7088;
      }
      v48 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("UPDATE %@%@ SET %@%@"), v14, v15, v12, v11);
      if ((v46 & 1) != 0)

      v45 = MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v48);
        _os_log_impl(&dword_1DC678000, (os_log_t)v45, type, "Prepared UPDATE statement: %@", v70, 0xCu);
      }
      objc_storeStrong(&v45, 0);
      v43 = -[AMDSQLite prepare:error:](v65, "prepare:error:", v48, v62);
      if (v43)
      {
        v42 = 0;
        v37 = 0;
        v38 = &v37;
        v39 = 0x20000000;
        v40 = 32;
        v41 = 1;
        v9 = -[AMDSQLite _executorQueue](v65, "_executorQueue");
        block = MEMORY[0x1E0C809B0];
        v31 = -1073741824;
        v32 = 0;
        v33 = __56__AMDSQLite_updateTableUsingDescriptor_andSchema_error___block_invoke;
        v34 = &unk_1EA4B5378;
        v35 = &v37;
        v36 = v43;
        dispatch_sync(v9, &block);

        if (*((_DWORD *)v38 + 6) == 101)
        {
          v28 = sqlite3_changes(-[AMDSQLite _db](v65, "_db"));
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_4_0_8_64((uint64_t)v69, v28, (uint64_t)v61);
            _os_log_debug_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Updated %u rows in table %@", v69, 0x12u);
          }
          objc_storeStrong((id *)&oslog, 0);
          v67 = CFSTR("updateStatus");
          v8 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updated %u rows"), v28);
          v68 = v8;
          v66 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);

          v58 = 1;
        }
        else
        {
          v29 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE update: %d"), *((unsigned int *)v38 + 6));
          *v62 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, v29);
          v66 = 0;
          v58 = 1;
          objc_storeStrong(&v29, 0);
        }
        _Block_object_dispose(&v37, 8);
        v7 = v58;
        sqlite3_finalize(v43);
        if ((v42 & 1) != 0)
          objc_exception_rethrow();
        v58 = v7;
        if (v7 == 4)
        {
          __break(1u);
          JUMPOUT(0x1DC6BADE8);
        }
      }
      else
      {
        v10 = (id)objc_msgSend(*v62, "localizedDescription");
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

        v66 = 0;
        v58 = 1;
      }
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v53, 0);
    }
    else
    {
      v54 = CFSTR("SQLITE UPDATE: no SET clause info");
      *v62 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 15, v54);
      v66 = 0;
      v58 = 1;
      objc_storeStrong(&v54, 0);
    }
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v57, 0);
  }
  else
  {
    v59 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLITE UPDATE: table '%@' does not exist'"), v61);
    *v62 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 15, v59);
    v66 = 0;
    v58 = 1;
    objc_storeStrong(&v59, 0);
  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  return v66;
}

uint64_t __56__AMDSQLite_updateTableUsingDescriptor_andSchema_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)refreshAppsTable:(id *)a3
{
  void *v4;
  id v5;
  AMDSQLite *v6;
  AMDSQLiteSchema *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id obj;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int v28;
  os_log_type_t v29;
  os_log_t v30;
  __CFString *v31;
  os_log_type_t type;
  os_log_t oslog;
  id v34;
  _QWORD __b[8];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id *v41;
  SEL v42;
  AMDSQLite *v43;
  id v44;
  const __CFString *v45;
  id v46;
  const __CFString *v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  const __CFString *v51;
  __CFString *v52;
  uint8_t v53[16];
  uint8_t v54[24];
  _QWORD v55[6];
  _QWORD v56[6];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v43 = self;
  v42 = a2;
  v41 = a3;
  v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
  v37 = (id)objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:");
  objc_msgSend(v37, "setFilter:", &__block_literal_global_0);
  memset(__b, 0, sizeof(__b));
  obj = v37;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v57, 16);
  if (v22)
  {
    v18 = *(_QWORD *)__b[2];
    v19 = 0;
    v20 = v22;
    while (1)
    {
      v17 = v19;
      if (*(_QWORD *)__b[2] != v18)
        objc_enumerationMutation(obj);
      v36 = *(id *)(__b[1] + 8 * v19);
      v34 = (id)objc_msgSend(v36, "iTunesMetadata");
      v10 = v39;
      v55[0] = CFSTR("adamId");
      v16 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v34, "storeItemIdentifier"));
      v56[0] = v16;
      v55[1] = CFSTR("genreId");
      v15 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v34, "genreIdentifier"));
      v56[1] = v15;
      v55[2] = CFSTR("isArcade");
      v14 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v36, "isArcadeApp") & 1);
      v56[2] = v14;
      v55[3] = CFSTR("purchasedRedownload");
      v13 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v34, "isPurchasedRedownload") & 1);
      v56[3] = v13;
      v55[4] = CFSTR("ratingRank");
      v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v34, "ratingRank"));
      v56[4] = v12;
      v55[5] = CFSTR("creationTime");
      v56[5] = v38;
      v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 6);
      objc_msgSend(v10, "addObject:");

      objc_storeStrong(&v34, 0);
      ++v19;
      if (v17 + 1 >= v20)
      {
        v19 = 0;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v57, 16);
        if (!v20)
          break;
      }
    }
  }

  if (objc_msgSend(v39, "count"))
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v54, objc_msgSend(v39, "count"));
      _os_log_debug_impl(&dword_1DC678000, oslog, type, "SQLITE found %lu apps", v54, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v49[0] = 0x1EA4BF808;
    v50[0] = CFSTR("apps");
    v49[1] = CFSTR("rowsData");
    v50[1] = v39;
    v27 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v26 = -[AMDSQLite deleteRows:error:](v43, "deleteRows:error:", v27, v41);
    if (*v41)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (id)objc_msgSend(*v41, "localizedDescription");
      v25 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("SQLITE could not truncate '%@': %@"), CFSTR("apps"), v9);

      v47 = CFSTR("error");
      v48 = v25;
      v44 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v28 = 1;
      objc_storeStrong(&v25, 0);
    }
    else
    {
      if (v26)
        objc_msgSend(v40, "addEntriesFromDictionary:", v26);
      else
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Delete Rows Failed"), CFSTR("AppsTableRefreshError"), 0);
      v6 = v43;
      v7 = -[AMDSQLite _schema](v43, "_schema");
      v24 = -[AMDSQLite insertRows:usingSchema:error:](v6, "insertRows:usingSchema:error:", v27);

      if (*v41)
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (id)objc_msgSend(*v41, "localizedDescription");
        v23 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("SQLITE could not insert into '%@': %@"), CFSTR("apps"), v5);

        v45 = CFSTR("error");
        v46 = v23;
        v44 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v28 = 1;
        objc_storeStrong(&v23, 0);
      }
      else
      {
        if (v24)
          objc_msgSend(v40, "addEntriesFromDictionary:", v24);
        else
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Insert Rows Failed"), CFSTR("AppsTableRefreshError"), 0);
        v44 = v40;
        v28 = 1;
      }
      objc_storeStrong(&v24, 0);
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    v31 = CFSTR("SQLITE found no apps. Check!");
    v30 = (os_log_t)MEMORY[0x1E0C81028];
    v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v31);
      _os_log_error_impl(&dword_1DC678000, v30, v29, "%@", v53, 0xCu);
    }
    objc_storeStrong((id *)&v30, 0);
    v51 = CFSTR("error");
    v52 = v31;
    v44 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v28 = 1;
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  return v44;
}

BOOL __30__AMDSQLite_refreshAppsTable___block_invoke(void *a1, void *a2)
{
  id v3;
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "iTunesMetadata");
  v4 = objc_msgSend(v3, "storeItemIdentifier") != 0;

  objc_storeStrong(location, 0);
  return v4;
}

+ (id)fetchVectorDBConfigForDBName:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  AMDFetchDescriptor *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  id v28;
  id *v29;
  id location[3];
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  const __CFString *v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  const __CFString *v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  id v49;
  _QWORD v50[5];

  v50[4] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  v28 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v28, "isUsableInternal") & 1) != 0)
  {
    v48 = CFSTR("dbPath");
    v46[0] = AMD_SQLITE_TYPE;
    v47[0] = AMD_SQLITE_DATA_TYPE_TEXT;
    v46[1] = AMD_SQLITE_NOT_NULL;
    v5 = MEMORY[0x1E0C9AAB0];
    v47[1] = MEMORY[0x1E0C9AAB0];
    v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46);
    v49 = v13;
    v12 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48);
    v50[0] = v12;
    v44 = CFSTR("dataType");
    v42[0] = AMD_SQLITE_TYPE;
    v43[0] = AMD_SQLITE_DATA_TYPE_TEXT;
    v42[1] = AMD_SQLITE_NOT_NULL;
    v43[1] = v5;
    v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v45 = v11;
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v50[1] = v10;
    v40 = CFSTR("vectorDimension");
    v38[0] = AMD_SQLITE_TYPE;
    v39[0] = AMD_SQLITE_DATA_TYPE_INT;
    v38[1] = AMD_SQLITE_NOT_NULL;
    v39[1] = v5;
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v41 = v9;
    v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v50[2] = v8;
    v36 = CFSTR("distanceMetric");
    v34[0] = AMD_SQLITE_TYPE;
    v35[0] = AMD_SQLITE_DATA_TYPE_TEXT;
    v34[1] = AMD_SQLITE_NOT_NULL;
    v35[1] = v5;
    v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v37 = v7;
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v50[3] = v6;
    v26 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);

    v32[0] = 0x1EA4BF668;
    v33[0] = CFSTR("__AMDVectorDatabases");
    v32[1] = 0x1EA4BF808;
    v33[1] = CFSTR("__AMDVectorDatabases");
    v32[2] = 0x1EA4BF708;
    v33[2] = CFSTR("1");
    v32[3] = 0x1EA4BF648;
    v33[3] = v26;
    v32[4] = 0x1EA4BF788;
    v14 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dbName = '%@'"), location[0]);
    v33[4] = v14;
    v25 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);

    v15 = [AMDFetchDescriptor alloc];
    v16 = (id)objc_msgSend(v28, "_bootstrapSchema");
    v24 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v15, "initWithDict:usingSchema:error:", v25);

    v17 = objc_msgSend(v28, "_db");
    v18 = (id)objc_msgSend(v28, "_bootstrapSchema");
    v23 = (id)objc_msgSend(v28, "fetchRowsFrom:usingDescriptor:andSchema:columnMajorOutput:rowMajorOutput:andPersist:error:", v17, v24, v29);

    if (*v29)
    {
      v31 = 0;
      v27 = 1;
    }
    else
    {
      v22 = (id)objc_msgSend(v23, "objectForKey:", CFSTR("resultSet"));
      v21 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("fetchResultRowsData"));
      if (v21)
      {
        if (objc_msgSend(v21, "count"))
        {
          v20 = (id)objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v31 = v20;
          v27 = 1;
          objc_storeStrong(&v20, 0);
        }
        else
        {
          v31 = MEMORY[0x1E0C9AA70];
          v27 = 1;
        }
      }
      else
      {
        *v29 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22, CFSTR("Internal SQL failure"));
        v31 = 0;
        v27 = 1;
      }
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    *v29 = (id)objc_msgSend(v28, "generateDBLoadError");
    v31 = 0;
    v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31;
}

+ (id)persistVectorDBPath:(id)a3 forDBName:(id)a4 withVectorDimension:(int)a5 andDataType:(id)a6 withDistanceMetric:(id)a7 error:(id *)a8
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v20;
  id v21;
  id v22;
  int v23;
  id v24;
  id *v25;
  id v26;
  id v27;
  unsigned int v28;
  id v29;
  id location[3];
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = a5;
  v27 = 0;
  objc_storeStrong(&v27, a6);
  v26 = 0;
  objc_storeStrong(&v26, a7);
  v25 = a8;
  v24 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v24, "isUsableInternal") & 1) != 0)
  {
    v34[0] = CFSTR("dbName");
    v35[0] = v29;
    v34[1] = CFSTR("dbPath");
    v35[1] = location[0];
    v34[2] = CFSTR("lastUpdateTime");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v13 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    objc_msgSend(v13, "timeIntervalSince1970");
    v12 = (id)objc_msgSend(v9, "numberWithDouble:");
    v35[2] = v12;
    v34[3] = CFSTR("vectorDimension");
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
    v35[3] = v11;
    v34[4] = CFSTR("dataType");
    v35[4] = v27;
    v34[5] = CFSTR("distanceMetric");
    v35[5] = v26;
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 6);
    v36[0] = v10;
    v22 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);

    v32[0] = 0x1EA4BF808;
    v33[0] = CFSTR("__AMDVectorDatabases");
    v32[1] = CFSTR("rowsData");
    v33[1] = v22;
    v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v14 = (id)objc_msgSend(v24, "_bootstrapSchema");
    v20 = (id)objc_msgSend(v24, "insertRows:usingSchema:error:", v21);

    if (*v25)
      v31 = 0;
    else
      v31 = v20;
    v23 = 1;
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  else
  {
    *v25 = (id)objc_msgSend(v24, "generateDBLoadError");
    v31 = 0;
    v23 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v31;
}

+ (id)deleteVectorDBEntryForDBName:(id)a3 error:(id *)a4
{
  id v5;
  id v7;
  id v8;
  int v9;
  id v10;
  id *v11;
  id location[3];
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v10 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v10, "isUsableInternal") & 1) != 0)
  {
    v14[0] = 0x1EA4BF668;
    v15[0] = CFSTR("__AMDVectorDatabases");
    v14[1] = 0x1EA4BF808;
    v15[1] = CFSTR("__AMDVectorDatabases");
    v14[2] = 0x1EA4BF788;
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dbName = '%@'"), location[0]);
    v15[2] = v5;
    v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);

    v7 = (id)objc_msgSend(v10, "deleteRowsInternal:error:", v8, v11);
    if (*v11)
      v13 = 0;
    else
      v13 = v7;
    v9 = 1;
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    *v11 = (id)objc_msgSend(v10, "generateDBLoadError");
    v13 = 0;
    v9 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)updateLastVectorDBRefreshTimestamp:(id)a3 error:(id *)a4
{
  double v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  id v14;
  int v15;
  id v16;
  id *v17;
  id location[3];
  id v19;
  const __CFString *v20;
  id v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v16 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v16, "isUsableInternal") & 1) != 0)
  {
    v22[0] = 0x1EA4BF668;
    v23[0] = CFSTR("__AMDVectorDatabases");
    v22[1] = 0x1EA4BF808;
    v23[1] = CFSTR("__AMDVectorDatabases");
    v22[2] = 0x1EA4BF788;
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dbName = '%@'"), location[0]);
    v23[2] = v10;
    v22[3] = 0x1EA4BF7C8;
    v20 = CFSTR("lastUpdateTime");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    objc_msgSend(v9, "timeIntervalSince1970");
    v8 = (id)objc_msgSend(v6, "numberWithLongLong:", (uint64_t)v4);
    v21 = v8;
    v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v23[3] = v7;
    v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);

    v11 = (id)objc_msgSend(v16, "_bootstrapSchema");
    v13 = (id)objc_msgSend(v16, "updateTableUsingDescriptor:andSchema:error:", v14);

    if (*v17)
      v19 = 0;
    else
      v19 = v13;
    v15 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    *v17 = (id)objc_msgSend(v16, "generateDBLoadError");
    v19 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (AMDSQLiteSchema)_bootstrapSchema
{
  return self->__bootstrapSchema;
}

- (void)set_bootstrapSchema:(id)a3
{
  objc_storeStrong((id *)&self->__bootstrapSchema, a3);
}

- (sqlite3)_db
{
  return self->__db;
}

- (void)set_db:(sqlite3 *)a3
{
  self->__db = a3;
}

- (NSError)_error
{
  return self->__error;
}

- (void)set_error:(id)a3
{
  objc_storeStrong((id *)&self->__error, a3);
}

- (OS_dispatch_queue)_executorQueue
{
  return self->__executorQueue;
}

- (void)set_executorQueue:(id)a3
{
  objc_storeStrong((id *)&self->__executorQueue, a3);
}

- (BOOL)_isEnabled
{
  return self->__isEnabled;
}

- (void)set_isEnabled:(BOOL)a3
{
  self->__isEnabled = a3;
}

- (AMDSQLiteSchema)_schema
{
  return self->__schema;
}

- (void)set_schema:(id)a3
{
  objc_storeStrong((id *)&self->__schema, a3);
}

- (AMDSQLiteSchema)_biomeSchema
{
  return self->__biomeSchema;
}

- (void)set_biomeSchema:(id)a3
{
  objc_storeStrong((id *)&self->__biomeSchema, a3);
}

- (AMDSQLiteSchema)_megadomeSchema
{
  return self->__megadomeSchema;
}

- (void)set_megadomeSchema:(id)a3
{
  objc_storeStrong((id *)&self->__megadomeSchema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__megadomeSchema, 0);
  objc_storeStrong((id *)&self->__biomeSchema, 0);
  objc_storeStrong((id *)&self->__schema, 0);
  objc_storeStrong((id *)&self->__executorQueue, 0);
  objc_storeStrong((id *)&self->__error, 0);
  objc_storeStrong((id *)&self->__bootstrapSchema, 0);
}

@end
