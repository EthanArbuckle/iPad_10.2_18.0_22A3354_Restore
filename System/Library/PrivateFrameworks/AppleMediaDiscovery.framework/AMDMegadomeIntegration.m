@implementation AMDMegadomeIntegration

+ (id)handleJSRequest:(id)a3 error:(id *)a4
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
  id v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id obj;
  uint64_t v33;
  BOOL v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  char v42;
  id v43;
  char v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD __b[8];
  id v50;
  id v51;
  id v52;
  id v53;
  int v54;
  id v55;
  id *v56;
  id location[2];
  id v58;
  id v59;
  _QWORD v60[2];
  _QWORD v61[2];
  const __CFString *v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v58 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = a4;
  v55 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
  if ((objc_msgSend(v55, "isUsable") & 1) != 0)
  {
    v4 = (id)objc_msgSend(v55, "getMegadomeSchema");
    v34 = v4 != 0;

    if (!v34)
    {
      *v56 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 17, CFSTR("Megadome: no megadome db"));
      v59 = 0;
      v54 = 1;
      goto LABEL_53;
    }
    v53 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("queries"));
    if (!v53 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      *v56 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 17, CFSTR("Megadome: bad payload"));
      v59 = 0;
      v54 = 1;
LABEL_52:
      objc_storeStrong(&v53, 0);
      goto LABEL_53;
    }
    v52 = v53;
    v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v52, "count"));
    memset(__b, 0, sizeof(__b));
    obj = v52;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
    if (!v33)
    {
LABEL_51:

      v59 = v51;
      v54 = 1;
      objc_storeStrong(&v51, 0);
      objc_storeStrong(&v52, 0);
      goto LABEL_52;
    }
    v29 = *(_QWORD *)__b[2];
    v30 = 0;
    v31 = v33;
    while (1)
    {
      v28 = v30;
      if (*(_QWORD *)__b[2] != v29)
        objc_enumerationMutation(obj);
      v50 = *(id *)(__b[1] + 8 * v30);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v51, "addObject:", &unk_1EA4D0A10);
        goto LABEL_49;
      }
      v48 = v50;
      v5 = (id)objc_msgSend(v48, "objectForKey:", CFSTR("sourceView"));
      v6 = v53;
      v53 = v5;

      if (v53)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      objc_msgSend(v51, "addObject:", &unk_1EA4D0A38);
      v54 = 3;
LABEL_48:
      objc_storeStrong(&v48, 0);
LABEL_49:
      ++v30;
      if (v28 + 1 >= v31)
      {
        v30 = 0;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
        if (!v31)
          goto LABEL_51;
      }
    }
    v47 = v53;
    v7 = (id)objc_msgSend(v48, "objectForKey:", CFSTR("fd"));
    v8 = v53;
    v53 = v7;

    if (!v53 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v51, "addObject:", &unk_1EA4D0A60);
      v54 = 3;
LABEL_47:
      objc_storeStrong(&v47, 0);
      goto LABEL_48;
    }
    v46 = v53;
    v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v44 = 0;
    v43 = 0;
    v9 = (id)objc_msgSend(v48, "objectForKey:", CFSTR("persist"));
    v10 = v53;
    v53 = v9;

    if (v53 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v53, "BOOLValue") & 1) != 0)
    {
      v11 = (id)objc_msgSend(v48, "objectForKey:", CFSTR("targetTable"));
      v12 = v53;
      v53 = v11;

      if (!v53 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(v51, "addObject:", &unk_1EA4D0A88);
        v54 = 3;
LABEL_46:
        objc_storeStrong(&v43, 0);
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v46, 0);
        goto LABEL_47;
      }
      objc_storeStrong(&v43, v53);
      v44 = 1;
    }
    else
    {
      objc_msgSend(v45, "setObject:forKey:", CFSTR("Not persisting"), CFSTR("persistStatus"));
    }
    v13 = (id)objc_msgSend(v48, "objectForKey:", CFSTR("returnResult"));
    v14 = v53;
    v53 = v13;

    v42 = 0;
    v27 = 0;
    if (v53)
    {
      objc_opt_class();
      v27 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = objc_msgSend(v53, "BOOLValue");
    }
    v42 = v27 & 1;
    if ((v27 & 1) != 0 || (v44 & 1) != 0)
    {
      v41 = 0;
      v39 = 0;
      v26 = (id)objc_msgSend(v58, "run:usingView:andDb:returnColumnMajor:returnRowMajor:withError:", v46, v47, v55, v42 & 1, v44 & 1, &v39);
      objc_storeStrong(&v41, v39);
      v40 = v26;
      if (v41)
      {
        v23 = v51;
        v62 = CFSTR("error");
        v25 = (id)objc_msgSend(v41, "localizedDescription");
        v63 = v25;
        v24 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        objc_msgSend(v23, "addObject:");

        v54 = 3;
      }
      else
      {
        v15 = (id)objc_msgSend(v40, "objectForKey:", 0x1EA4B7968);
        v16 = v40;
        v40 = v15;

        if ((v44 & 1) != 0 && v43)
        {
          v37 = v41;
          v22 = (id)objc_msgSend(v58, "save:into:inDb:withError:", v40, v43, v55, &v37);
          objc_storeStrong(&v41, v37);
          v38 = v22;
          if (v41)
          {
            v20 = v45;
            v21 = (id)objc_msgSend(v41, "localizedDescription");
            objc_msgSend(v20, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v45, "setObject:forKey:", v38, CFSTR("persistStatus"));
          }
          objc_storeStrong(&v38, 0);
        }
        if ((v42 & 1) != 0)
        {
          v60[0] = 0x1EA4B94E8;
          v19 = (id)objc_msgSend(v40, "objectForKeyedSubscript:", 0x1EA4B94E8);
          v61[0] = v19;
          v60[1] = 0x1EA4B9508;
          v18 = (id)objc_msgSend(v40, "objectForKeyedSubscript:", 0x1EA4B9508);
          v61[1] = v18;
          v36 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);

          objc_msgSend(v45, "setObject:forKey:", v36, CFSTR("resultSet"));
          objc_storeStrong(&v36, 0);
        }
        objc_msgSend(v51, "addObject:", v45);
        v54 = 0;
      }
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
    }
    else
    {
      objc_msgSend(v51, "addObject:", &unk_1EA4D0AB0);
      v54 = 3;
    }
    goto LABEL_46;
  }
  *v56 = (id)objc_msgSend(v55, "generateDBLoadError");
  v59 = 0;
  v54 = 1;
LABEL_53:
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  return v59;
}

+ (id)run:(id)a3 usingView:(id)a4 andDb:(id)a5 returnColumnMajor:(BOOL)a6 returnRowMajor:(BOOL)a7 withError:(id *)a8
{
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
  int v29;
  os_log_t v35;
  os_log_type_t v36;
  os_log_t v37;
  os_log_type_t v38;
  os_log_t v39;
  os_log_type_t type;
  os_log_t oslog;
  char v42;
  id v43;
  sqlite3 *ppDb;
  unsigned int v45;
  id v46;
  id v47;
  id v48;
  int v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id *v56;
  BOOL v57;
  BOOL v58;
  id v59;
  id v60;
  id location[3];
  id v62;
  uint8_t v63[32];
  uint8_t v64[16];
  uint8_t v65[16];
  uint8_t v66[24];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v60 = 0;
  objc_storeStrong(&v60, a4);
  v59 = 0;
  objc_storeStrong(&v59, a5);
  v58 = a6;
  v57 = a7;
  v56 = a8;
  v55 = 0;
  v54 = (id)objc_msgSend(getGDViewServiceClass(), "clientService");
  v53 = 0;
  v52 = 0;
  v51 = 0;
  v50 = 0;
  if ((objc_msgSend(v60, "isEqualToString:", CFSTR("ShortTermTopics")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(v54, "firstPartyShortTermTopicViewWithError:", v56);
    v9 = v52;
    v52 = v8;

    if (*v56)
    {
      v62 = 0;
      v49 = 1;
      goto LABEL_37;
    }
  }
  else
  {
    if ((objc_msgSend(v60, "isEqualToString:", CFSTR("LongTermTopics")) & 1) == 0)
    {
      if ((objc_msgSend(v60, "isEqualToString:", CFSTR("languageView")) & 1) == 0)
      {
        v20 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported view: %@"), v60);
        v21 = v55;
        v55 = v20;

        *v56 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 17, v55);
        v62 = 0;
        v49 = 1;
        goto LABEL_37;
      }
      v14 = (id)objc_msgSend(getGDViewServiceHelperClass(), "remoteViewAccessRequester");
      v15 = v51;
      v51 = v14;

      v16 = (id)objc_msgSend(v51, "requestAssertionForViewName:error:", CFSTR("languageView"), v56);
      v17 = v50;
      v50 = v16;

      if (*v56)
      {
        v62 = 0;
        v49 = 1;
        goto LABEL_37;
      }
      v48 = (id)objc_msgSend(v50, "viewArtifactURL");
      v18 = (id)objc_msgSend(v48, "path");
      v19 = v53;
      v53 = v18;

      objc_storeStrong(&v48, 0);
      goto LABEL_14;
    }
    v12 = (id)objc_msgSend(v54, "firstPartyLongTermTopicViewWithError:", v56);
    v13 = v52;
    v52 = v12;

    if (*v56)
    {
      v62 = 0;
      v49 = 1;
      goto LABEL_37;
    }
  }
  v10 = (id)objc_msgSend(v52, "databaseFilePath");
  v11 = v53;
  v53 = v10;

LABEL_14:
  v47 = (id)objc_msgSend(v59, "getMegadomeSchema");
  v46 = -[AMDFetchDescriptor initWithDict:usingSchema:error:]([AMDFetchDescriptor alloc], "initWithDict:usingSchema:error:", location[0], v47, v56);
  if (*v56)
  {
    v62 = 0;
    v49 = 1;
  }
  else
  {
    v45 = 0;
    ppDb = 0;
    v43 = MEMORY[0x1E0C9AA70];
    v42 = 0;
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v66, (uint64_t)v53, (uint64_t)v60);
      _os_log_debug_impl(&dword_1DC678000, oslog, type, "MEGADOME opening DB '%@' for view '%@'", v66, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v45 = sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v53), "UTF8String"), &ppDb, 32769, 0);
    if (v45)
    {
      v22 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load megadome db from path '%@': %d"), v53, v45);
      v23 = v55;
      v55 = v22;

      *v56 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 17, v55);
      v62 = 0;
      v49 = 1;
    }
    else
    {
      v39 = (os_log_t)MEMORY[0x1E0C81028];
      v38 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v60);
        _os_log_debug_impl(&dword_1DC678000, v39, v38, "MEGADOME reading from view '%@'", v65, 0xCu);
      }
      objc_storeStrong((id *)&v39, 0);
      v24 = (id)objc_msgSend(v59, "fetchRowsFrom:usingDescriptor:andSchema:columnMajorOutput:rowMajorOutput:andPersist:error:", ppDb, v46, v47, v58, v57, 0, v56);
      v25 = v43;
      v43 = v24;

      v49 = 0;
    }
    v29 = v49;
    if (ppDb)
    {
      v45 = sqlite3_close_v2(ppDb);
      if (v45)
      {
        v26 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to close megadome db, path '%@': %d"), v53, v45);
        v27 = v55;
        v55 = v26;

        v37 = (os_log_t)MEMORY[0x1E0C81028];
        v36 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v55);
          _os_log_error_impl(&dword_1DC678000, v37, v36, "%@", v64, 0xCu);
        }
        objc_storeStrong((id *)&v37, 0);
      }
      else
      {
        v35 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v63, (uint64_t)v53, (uint64_t)v60);
          _os_log_debug_impl(&dword_1DC678000, v35, OS_LOG_TYPE_DEBUG, "MEGADOME closed DB '%@' for view '%@'", v63, 0x16u);
        }
        objc_storeStrong((id *)&v35, 0);
      }
    }
    if ((v42 & 1) != 0)
      objc_exception_rethrow();
    v49 = v29;
    if (!v29)
    {
      v62 = v43;
      v49 = 1;
    }
    objc_storeStrong(&v43, 0);
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
LABEL_37:
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
  return v62;
}

+ (id)save:(id)a3 into:(id)a4 inDb:(id)a5 withError:(id *)a6
{
  id v7;
  id v8;
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  id location[3];
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = a6;
  v24[0] = 0x1EA4BF808;
  v25[0] = v19;
  v24[1] = 0x1EA4B92C8;
  v12 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", 0x1EA4B9528);
  v25[1] = v12;
  v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);

  v15 = (id)objc_msgSend(v18, "deleteRows:error:", v16, a6);
  if (*a6)
  {
    v21 = 0;
    v14 = 1;
  }
  else
  {
    v7 = v18;
    v8 = (id)objc_msgSend(v18, "getDataSchema");
    v13 = (id)objc_msgSend(v7, "insertRows:usingSchema:error:", v16);

    if (*v17)
    {
      v21 = 0;
    }
    else
    {
      v22[0] = CFSTR("truncationSummary");
      v23[0] = v15;
      v22[1] = CFSTR("saveSummary");
      v23[1] = v13;
      v21 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    }
    v14 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v21;
}

@end
