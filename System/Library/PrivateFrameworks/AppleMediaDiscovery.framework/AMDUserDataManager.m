@implementation AMDUserDataManager

+ (id)deleteAllUserData:(id *)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *log;
  os_log_type_t type;
  id v17;
  os_log_t v18;
  id v19;
  os_log_type_t v20;
  os_log_t v21;
  id v22;
  uint8_t v23[7];
  os_log_type_t v24;
  os_log_t v25;
  os_log_type_t v26;
  os_log_t oslog;
  id v28;
  os_log_type_t v29;
  id v30;
  id v31;
  uint8_t v32[7];
  char v33;
  id v34;
  os_log_type_t v35;
  id v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41;
  id *v42;
  SEL v43;
  id v44;
  const __CFString *v45;
  id v46;
  uint8_t v47[16];
  uint8_t v48[16];
  uint8_t v49[16];
  uint8_t v50[16];
  uint8_t v51[16];
  uint8_t v52[24];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v44 = a1;
  v43 = a2;
  v42 = a3;
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = +[AMDAppEvent deleteAllEvents:](AMDAppEvent, "deleteAllEvents:", v42);
  if (*v42)
  {
    v39 = MEMORY[0x1E0C81028];
    v38 = 16;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
    {
      log = v39;
      type = v38;
      v17 = (id)objc_msgSend(*v42, "localizedDescription");
      v37 = v17;
      __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v37);
      _os_log_error_impl(&dword_1DC678000, log, type, "Error deleting previous user's events: %@", v52, 0xCu);

      objc_storeStrong(&v37, 0);
    }
    objc_storeStrong(&v39, 0);
  }
  else
  {
    v36 = MEMORY[0x1E0C81028];
    v35 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v40);
      _os_log_impl(&dword_1DC678000, (os_log_t)v36, v35, "Deleted %@ events", v51, 0xCu);
    }
    objc_storeStrong(&v36, 0);
    objc_msgSend(v41, "setObject:forKey:", v40, CFSTR("eventsDeleted"));
  }
  v34 = MEMORY[0x1E0C81028];
  v33 = 1;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
  {
    v13 = v34;
    v14 = v33;
    __os_log_helper_16_0_0(v32);
    _os_log_impl(&dword_1DC678000, v13, v14, "Deleting in-app segments data", v32, 2u);
  }
  objc_storeStrong(&v34, 0);
  v31 = +[AMDAppSegment deleteAllSegments:](AMDAppSegment, "deleteAllSegments:", v42);
  if (*v42)
  {
    v30 = MEMORY[0x1E0C81028];
    v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      v10 = v30;
      v11 = v29;
      v12 = (id)objc_msgSend(*v42, "localizedDescription");
      v28 = v12;
      __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v28);
      _os_log_error_impl(&dword_1DC678000, v10, v11, "Error deleting previous user's in-app segments: %@", v50, 0xCu);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v30, 0);
  }
  else
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    v26 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v31);
      _os_log_impl(&dword_1DC678000, oslog, v26, "Deleted %@ in-app segments", v49, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(v41, "setObject:forKey:", v31, CFSTR("segmentsDeleted"));
  }
  v25 = (os_log_t)MEMORY[0x1E0C81028];
  v24 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v8 = v25;
    v9 = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_impl(&dword_1DC678000, v8, v9, "Deleting taste profile", v23, 2u);
  }
  objc_storeStrong((id *)&v25, 0);
  v22 = +[AMDTasteProfile deleteAll:](AMDTasteProfile, "deleteAll:", v42);
  if (*v42)
  {
    v21 = (os_log_t)MEMORY[0x1E0C81028];
    v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v5 = v21;
      v6 = v20;
      v7 = (id)objc_msgSend(*v42, "localizedDescription");
      v19 = v7;
      __os_log_helper_16_2_1_8_64((uint64_t)v48, (uint64_t)v19);
      _os_log_error_impl(&dword_1DC678000, v5, v6, "Error deleting previous user's taste profile: %@", v48, 0xCu);

      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong((id *)&v21, 0);
  }
  else
  {
    v18 = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v47, (uint64_t)v22);
      _os_log_impl(&dword_1DC678000, v18, OS_LOG_TYPE_INFO, "Deleted %@ TP entries", v47, 0xCu);
    }
    objc_storeStrong((id *)&v18, 0);
    objc_msgSend(v41, "setObject:forKey:", v22, CFSTR("tpFeaturesDeleted"));
  }
  *v42 = 0;
  v45 = CFSTR("userDataDeletionSummary");
  v46 = v41;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  return v4;
}

+ (id)clearDataForUser:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  id v25;
  id v26;
  id v28;
  os_log_type_t v29;
  os_log_t v30;
  id v31;
  id v32;
  os_log_type_t v33;
  os_log_t v34;
  id v35;
  id v36;
  os_log_type_t v37;
  os_log_t v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  os_log_type_t v43;
  os_log_t v44;
  id v45;
  id v46;
  id v47;
  os_log_type_t v48;
  os_log_t oslog;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  int v54;
  os_log_type_t v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id *v61;
  id location[3];
  id v63;
  uint8_t v64[16];
  uint8_t v65[16];
  uint8_t v66[16];
  uint8_t v67[16];
  uint8_t v68[16];
  uint8_t v69[16];
  const __CFString *v70;
  id v71;
  uint8_t v72[24];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v61 = a4;
  v60 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("dsid"));
  v59 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("domain"));
  v58 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("storefrontId"));
  if (v60 && v59 && v58)
  {
    v53 = 0;
    v52 = +[AMDMiscHelpers getCurrentEpochSeconds](AMDMiscHelpers, "getCurrentEpochSeconds");
    v51 = 1000 * objc_msgSend(v52, "longLongValue");
    v70 = CFSTR("time");
    v26 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v51);
    v71 = v26;
    v25 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v50 = v53;
    +[AMDKVStore setValue:forKey:error:](AMDKVStore, "setValue:forKey:error:");
    objc_storeStrong(&v53, v50);

    if (v53)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v48 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v22 = oslog;
        v23 = v48;
        v24 = (id)objc_msgSend(v53, "localizedDescription");
        v47 = v24;
        __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v47);
        _os_log_error_impl(&dword_1DC678000, v22, v23, "KV store update with clear data timestamp failed: %@", v69, 0xCu);

        objc_storeStrong(&v47, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = +[AMDAppEvent deleteAllEventsForUser:error:](AMDAppEvent, "deleteAllEventsForUser:error:", v60, v61);
    if (*v61)
    {
      v44 = (os_log_t)MEMORY[0x1E0C81028];
      v43 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v19 = v44;
        v20 = v43;
        v21 = (id)objc_msgSend(*v61, "localizedDescription");
        v42 = v21;
        __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v42);
        _os_log_error_impl(&dword_1DC678000, v19, v20, "Clearing user data failed: Engagement events could not be deleted: %@", v68, 0xCu);

        objc_storeStrong(&v42, 0);
      }
      objc_storeStrong((id *)&v44, 0);
      v63 = 0;
      v54 = 1;
    }
    else
    {
      v41 = (os_log_t)MEMORY[0x1E0C81028];
      v40 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v67, (uint64_t)v45);
        _os_log_debug_impl(&dword_1DC678000, v41, v40, "Deleted %@ events", v67, 0xCu);
      }
      objc_storeStrong((id *)&v41, 0);
      objc_msgSend(v46, "setObject:forKey:", v45, CFSTR("engagmentEventsDeleted"));
      v39 = +[AMDAppStoreEvent deleteEventsForUser:error:](AMDAppStoreEvent, "deleteEventsForUser:error:", v60, v61);
      if (*v61)
      {
        v38 = (os_log_t)MEMORY[0x1E0C81028];
        v37 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v16 = v38;
          v17 = v37;
          v18 = (id)objc_msgSend(*v61, "localizedDescription");
          v36 = v18;
          __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v36);
          _os_log_error_impl(&dword_1DC678000, v16, v17, "Clearing user data failed: Impression events could not be deleted: %@", v66, 0xCu);

          objc_storeStrong(&v36, 0);
        }
        objc_storeStrong((id *)&v38, 0);
        v63 = 0;
        v54 = 1;
      }
      else
      {
        objc_msgSend(v46, "setObject:forKey:", v39, CFSTR("impressionEventsDeleted"));
        v14 = v59;
        v15 = v60;
        v5 = objc_msgSend(v58, "intValue");
        v35 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:](AMDTasteProfile, "refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:", v14, v15, v5, v61);
        if (*v61)
        {
          v34 = (os_log_t)MEMORY[0x1E0C81028];
          v33 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v11 = v34;
            v12 = v33;
            v13 = (id)objc_msgSend(*v61, "localizedDescription");
            v32 = v13;
            __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v32);
            _os_log_error_impl(&dword_1DC678000, v11, v12, "Clearing user data failed: Taste profiles could not be refreshed: %@", v65, 0xCu);

            objc_storeStrong(&v32, 0);
          }
          objc_storeStrong((id *)&v34, 0);
          v63 = 0;
          v54 = 1;
        }
        else
        {
          objc_msgSend(v46, "setObject:forKey:", v35, CFSTR("tasteProfilesRefreshed"));
          v31 = +[AMDAppSegment refreshSegmentsForAllTreatmentsForUser:error:](AMDAppSegment, "refreshSegmentsForAllTreatmentsForUser:error:", v60, v61);
          if (*v61)
          {
            v30 = (os_log_t)MEMORY[0x1E0C81028];
            v29 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v8 = v30;
              v9 = v29;
              v10 = (id)objc_msgSend(*v61, "localizedDescription");
              v28 = v10;
              __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v28);
              _os_log_error_impl(&dword_1DC678000, v8, v9, "Clearing user data failed: Segments could not be refreshed: %@", v64, 0xCu);

              objc_storeStrong(&v28, 0);
            }
            objc_storeStrong((id *)&v30, 0);
          }
          if (v31)
            v7 = v31;
          else
            v7 = (id)MEMORY[0x1E0C9AA70];
          objc_storeStrong(&v31, v7);
          objc_msgSend(v46, "setObject:forKey:", v31, CFSTR("segmentsRefreshed"));
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v46, CFSTR("clearUserDataSummary"), 0);
          v63 = v46;
          v54 = 1;
          objc_storeStrong(&v31, 0);
        }
        objc_storeStrong(&v35, 0);
      }
      objc_storeStrong(&v39, 0);
    }
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v53, 0);
  }
  else
  {
    v57 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incomplete parameters provided for clear user data request."));
    v56 = MEMORY[0x1E0C81028];
    v55 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v57);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v56, v55, "%@", v72, 0xCu);
    }
    objc_storeStrong(&v56, 0);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v57);
    *v61 = v4;
    v63 = 0;
    v54 = 1;
    objc_storeStrong(&v57, 0);
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
  return v63;
}

@end
