@implementation CADConferenceUtils

+ (void)performConferenceLinkRenewalIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  char v17;
  unsigned int v18;
  NSObject *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "ConferenceRenewal: Starting. Checking whether it is time to run conference link renewal.", buf, 2u);
  }
  v4 = CalDatabaseCreateWithOptions();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = (void *)CalDatabaseCopyProperty();
    v7 = v6;
    if (v6
      && (objc_msgSend(v6, "doubleValue"), v8 > 1.0)
      && (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:"),
          (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (void *)v9;
      v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_INFO, "ConferenceRenewal: Found next scheduled run date: %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      if (v14 <= v15)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 31622400.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceReferenceDate");
        v30 = v29;
        objc_msgSend(v28, "timeIntervalSinceReferenceDate");
        v32 = v31;

        if (v30 <= v32)
        {
LABEL_20:
          CFRelease(v5);
          v26 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6A18000, v26, OS_LOG_TYPE_INFO, "ConferenceRenewal: Complete.", buf, 2u);
          }

          return;
        }
      }
      else
      {
        v16 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v34 = v12;
          v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_INFO, "ConferenceRenewal: Current date (%@) is after next scheduled run date (%@). Performing link renewal.", buf, 0x16u);
        }
        v17 = objc_msgSend(a1, "_performConferenceURLRenewalWithDatabase:", v5);

        if ((v17 & 1) == 0)
          goto LABEL_20;
      }
      v18 = 7776000;
      v20 = 20736000.0;
    }
    else
    {
      v18 = 2592000;
      v19 = CADLogHandle;
      v20 = 1296000.0;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: No date found for next scheduled run date. Will generate one within 45 days.", buf, 2u);
      }
      v10 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v20 + (double)(arc4random() % v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%lf"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_INFO, "ConferenceRenewal: Setting next scheduled run date to %@", buf, 0xCu);
    }
    CalDatabaseSetProperty();
    CalDatabaseSave();

    goto LABEL_20;
  }
  v27 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v27, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Database is nil. Cannot check renewal dates. Aborting", buf, 2u);
  }
}

+ (void)setNextConferenceLinkRenewalDate:(id)a3
{
  id v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = CalDatabaseCreateWithOptions();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%lf"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CalDatabaseSetProperty();
    CalDatabaseSave();
    CFRelease(v5);

  }
  else
  {
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_ERROR, "setNextConferenceLinkRenewalDate: Database is nil. Cannot set renewal date. Aborting", buf, 2u);
    }
  }

}

+ (void)removeNextConferenceLinkRenewalDate
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = CalDatabaseCreateWithOptions();
  if (v2)
  {
    v3 = (const void *)v2;
    CalDatabaseRemoveProperty();
    CalDatabaseSave();
    CFRelease(v3);
  }
  else
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_ERROR, "setNextConferenceLinkRenewalDate: Database is nil. Cannot set renewal date. Aborting", v5, 2u);
    }
  }
}

+ (BOOL)_performConferenceURLRenewalWithDatabase:(CalDatabase *)a3
{
  NSObject *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  double v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  dispatch_time_t v44;
  double v45;
  double v46;
  NSObject *v47;
  float v48;
  uint64_t v49;
  NSObject *v50;
  BOOL v51;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  id v56;
  id obj;
  _QWORD v58[5];
  NSObject *v59;
  _BYTE *v60;
  __int128 *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  NSObject *v75;
  uint8_t *v76;
  uint8_t buf[8];
  uint8_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint8_t v83[4];
  double v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  unint64_t v88;
  uint8_t v89[128];
  _BYTE v90[24];
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_INFO, "ConferenceRenewal: Starting URL renewal.", buf, 2u);
  }
  v53 = mach_absolute_time();
  v6 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_INFO, "ConferenceRenewal: Retrieving all active conversation links.", buf, 2u);
  }
  v56 = objc_alloc_init(MEMORY[0x1E0DBD298]);
  *(_QWORD *)buf = 0;
  v78 = buf;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__10;
  v81 = __Block_byref_object_dispose__10;
  v82 = 0;
  v7 = dispatch_semaphore_create(0);
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke;
  v74[3] = &unk_1E6A384E0;
  v76 = buf;
  v8 = v7;
  v75 = v8;
  objc_msgSend(v56, "getActiveLinksWithCreatedOnly:completionHandler:", 1, v74);
  v9 = dispatch_time(0, 60000000000);
  v54 = v8;
  dispatch_semaphore_wait(v8, v9);
  if (*((_QWORD *)v78 + 5))
  {
    v10 = (id)CADLogHandle;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(*((id *)v78 + 5), "count");
      LODWORD(v92) = 134217984;
      *(_QWORD *)((char *)&v92 + 4) = v11;
      _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_INFO, "ConferenceRenewal: Found %lu links.", (uint8_t *)&v92, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*((id *)v78 + 5), "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v13 = *((id *)v78 + 5);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v96, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v71 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v17, "URL", v53, v54);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "absoluteString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v17, v19);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v96, 16);
      }
      while (v14);
    }

    v20 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      LOWORD(v92) = 0;
      _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_INFO, "ConferenceRenewal: Searching for events that contain conference URLs that require renewal.", (uint8_t *)&v92, 2u);
    }
    objc_msgSend(MEMORY[0x1E0DBD290], "baseURLs", v53);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v21;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v67 != v24)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "host");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_conferenceURLsToRenewWithDatabase:URLString:", a3, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObjectsFromArray:", v27);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
      }
      while (v23);
    }

    v28 = dispatch_group_create();
    *(_QWORD *)&v92 = 0;
    *((_QWORD *)&v92 + 1) = &v92;
    v93 = 0x2020000000;
    v94 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 31622400.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)CADLogHandle;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v22, "count");
      *(_DWORD *)v90 = 134218242;
      *(_QWORD *)&v90[4] = v30;
      *(_WORD *)&v90[12] = 2112;
      *(_QWORD *)&v90[14] = v55;
      _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_INFO, "ConferenceRenewal: Found a total of %lu conference URLs from events to renew. Setting new expiration date to %@", v90, 0x16u);
    }

    *(_QWORD *)v90 = 0;
    *(_QWORD *)&v90[8] = v90;
    *(_QWORD *)&v90[16] = 0x2020000000;
    v91 = 0;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v31 = v22;
    v32 = 0;
    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v63;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v63 != v34)
            objc_enumerationMutation(v31);
          v36 = *(double *)(*((_QWORD *)&v62 + 1) + 8 * k);
          objc_msgSend(v12, "objectForKey:", *(_QWORD *)&v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (!v37)
          {
            v40 = CADLogHandle;
            if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
              goto LABEL_42;
            *(_DWORD *)v83 = 138412290;
            v84 = v36;
            v41 = v40;
            v42 = "ConferenceRenewal: Skipping URL because it isn't owned by this account: %@";
            goto LABEL_41;
          }
          if (objc_msgSend(v37, "isLocallyCreated"))
          {
            v39 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v83 = 138412290;
              v84 = v36;
              _os_log_impl(&dword_1B6A18000, v39, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Attempting to renew URL: %@", v83, 0xCu);
            }
            dispatch_group_enter(v28);
            v58[0] = MEMORY[0x1E0C809B0];
            v58[1] = 3221225472;
            v58[2] = __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke_13;
            v58[3] = &unk_1E6A38508;
            *(double *)&v58[4] = v36;
            v60 = v90;
            v61 = &v92;
            v59 = v28;
            objc_msgSend(v56, "renewLink:expirationDate:reason:completionHandler:", v38, v55, 1, v58);

            ++v32;
          }
          else if ((objc_msgSend(v38, "isLocallyCreated") & 1) == 0)
          {
            v43 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v83 = 138412290;
              v84 = v36;
              v41 = v43;
              v42 = "ConferenceRenewal: Skipping URL because it wasn't locally created: %@";
LABEL_41:
              _os_log_impl(&dword_1B6A18000, v41, OS_LOG_TYPE_DEBUG, v42, v83, 0xCu);
            }
          }
LABEL_42:

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
      }
      while (v33);
    }

    v44 = dispatch_time(0, (uint64_t)(((double)(unint64_t)objc_msgSend(v31, "count") * 2.0 + 30.0) * 1000000000.0));
    dispatch_group_wait(v28, v44);
    mach_absolute_time();
    CalAnalyticsTimeIntervalFromMachTimes();
    v46 = v45;
    v47 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v48 = v46;
      v49 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 24);
      *(_DWORD *)v83 = 134218496;
      v84 = v48;
      v85 = 2048;
      v86 = v49;
      v87 = 2048;
      v88 = v32;
      _os_log_impl(&dword_1B6A18000, v47, OS_LOG_TYPE_INFO, "ConferenceRenewal: Finished URL renewal in %f seconds. Renewed %lu / %lu links.", v83, 0x20u);
    }
    if (v32 < 3 || *(_QWORD *)(*((_QWORD *)&v92 + 1) + 24) || *(_QWORD *)(*(_QWORD *)&v90[8] + 24) != v32)
    {
      v51 = 1;
    }
    else
    {
      v50 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v83 = 0;
        _os_log_impl(&dword_1B6A18000, v50, OS_LOG_TYPE_ERROR, "ConferenceRenewal: all link renewals failed with seemingly transient errors. Will retry later.", v83, 2u);
      }
      v51 = 0;
    }
    _Block_object_dispose(v90, 8);

    _Block_object_dispose(&v92, 8);
  }
  else
  {
    v51 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v51;
}

void __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Failed to retrieve links. error = %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke_13(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v6 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Successfully renewed URL: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Unable to renew URL: %@, error = %@", (uint8_t *)&v12, 0x16u);
    }
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB28A8]))
    {
      if (objc_msgSend(v5, "code") == 4099)
      {

      }
      else
      {
        v11 = objc_msgSend(v5, "code");

        if (v11 != 4097)
          goto LABEL_12;
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      goto LABEL_12;
    }

  }
LABEL_12:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (id)_conferenceURLsToRenewWithDatabase:(CalDatabase *)a3 URLString:(id)a4
{
  id v6;
  NSObject *v7;
  const void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  const void *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  uint64_t Count;
  void *v18;
  NSObject *v19;
  const CFArrayCallBacks *v20;
  __CFArray *Mutable;
  char *v22;
  CFIndex i;
  uint64_t v24;
  const void *v25;
  CFNumberRef v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  CFIndex v32;
  NSObject *v33;
  void *v34;
  uint64_t HaveOccurrencesAfterDate;
  const __CFArray *v36;
  CFIndex v37;
  __CFArray *v38;
  CFIndex v39;
  const __CFNumber *ValueAtIndex;
  const void *v41;
  CFIndex v42;
  NSObject *v43;
  CFIndex v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  id v52;
  void *v53;
  const void *v54;
  const void *v55;
  __CFArray *theArray;
  uint8_t buf[4];
  CFIndex v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = CADLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v58 = (CFIndex)v6;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Starting search for conference URLs with base host: %@", buf, 0xCu);
    }
    v8 = (const void *)CalFilterCreateWithDatabaseShowingAll();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;

    v12 = CalDatabaseCopyEventOccurrenceCache();
    v13 = CADLogHandle;
    if (v12)
    {
      v14 = (const void *)v12;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = (CFIndex)v6;
        _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: searching for events containing the base URL %@", buf, 0xCu);
      }
      v15 = (const __CFArray *)CalDatabaseCopyEventIDsOfEventsMatching();
      if (v15)
      {
        v16 = v15;
        v54 = v14;
        v55 = v8;
        Count = CFArrayGetCount(v15);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v58 = (CFIndex)v6;
          v59 = 2048;
          v60 = Count;
          _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Search for events containing URL %@ returned %lu results", buf, 0x16u);
        }
        v52 = v6;
        v20 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
        theArray = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
        Mutable = CFArrayCreateMutable(0, Count, v20);
        if (Count < 1)
        {
          v22 = 0;
        }
        else
        {
          v22 = 0;
          for (i = 0; i != Count; ++i)
          {
            *(_DWORD *)buf = CFArrayGetValueAtIndex(v16, i);
            v24 = MEMORY[0x1BCC9BEF0](a3);
            if (v24)
            {
              v25 = (const void *)v24;
              if (CalCalendarItemHasRecurrenceRules())
              {
                v26 = CFNumberCreate(0, kCFNumberIntType, buf);
                CFArrayAppendValue(theArray, v26);
                CFArrayAppendValue(Mutable, v25);
                CFRelease(v26);
              }
              else
              {
                CalEventGetEndDate();
                if (v27 > v11)
                {
                  objc_msgSend(a1, "_extractURLStringsFromCalEvent:", v25);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v28, "count"))
                    objc_msgSend(v18, "addObjectsFromArray:", v28);
                  ++v22;

                }
              }
              CFRelease(v25);
            }
          }
        }
        v30 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          v31 = v30;
          v32 = CFArrayGetCount(theArray);
          *(_DWORD *)buf = 134217984;
          v58 = v32;
          _os_log_impl(&dword_1B6A18000, v31, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Of those, %lu have recurrences", buf, 0xCu);

        }
        v33 = CADLogHandle;
        v14 = v54;
        v8 = v55;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v58 = (CFIndex)v22;
          _os_log_impl(&dword_1B6A18000, v33, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Also found %lu events in the future", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date", v52);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceReferenceDate");

        HaveOccurrencesAfterDate = CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate();
        if (HaveOccurrencesAfterDate)
        {
          v36 = (const __CFArray *)HaveOccurrencesAfterDate;
          v37 = CFArrayGetCount(Mutable);
          v38 = CFArrayCreateMutable(0, v37, MEMORY[0x1E0C9B378]);
          v6 = v53;
          if (CFArrayGetCount(v36) >= 1)
          {
            v39 = 0;
            do
            {
              ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v36, v39);
              *(_DWORD *)buf = 0;
              CFNumberGetValue(ValueAtIndex, kCFNumberIntType, buf);
              if (*(_DWORD *)buf)
              {
                v41 = CFArrayGetValueAtIndex(Mutable, v39);
                CFArrayAppendValue(v38, v41);
              }
              ++v39;
            }
            while (v39 < CFArrayGetCount(v36));
          }
          v42 = CFArrayGetCount(v38);
          v43 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v58 = v42;
            _os_log_impl(&dword_1B6A18000, v43, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: And of those, %lu events with future occurrences.", buf, 0xCu);
          }
          if (CFArrayGetCount(v38) >= 1)
          {
            v44 = 0;
            do
            {
              objc_msgSend(a1, "_extractURLStringsFromCalEvent:", CFArrayGetValueAtIndex(v38, v44));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v45, "count"))
                objc_msgSend(v18, "addObjectsFromArray:", v45);

              ++v44;
            }
            while (v44 < CFArrayGetCount(v38));
          }
          CFRelease(v36);
          CFRelease(v38);
          v14 = v54;
          v8 = v55;
        }
        else
        {
          v46 = CADLogHandle;
          v6 = v53;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6A18000, v46, OS_LOG_TYPE_INFO, "ConferenceRenewal: No events found with occurrences after date.", buf, 2u);
          }
        }
        CFRelease(v16);
        CFRelease(theArray);
        CFRelease(Mutable);
      }
      else
      {
        v29 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v58 = (CFIndex)v6;
          _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_INFO, "ConferenceRenewal: Search for events containing URL %@ returned nil", buf, 0xCu);
        }
        v18 = 0;
      }
      CFRelease(v14);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Occurrence cache is nil. Will not perform link renewal.", buf, 2u);
      }
      v18 = 0;
    }
    CFRelease(v8);
    v47 = objc_msgSend(v18, "count");
    v48 = CADLogHandle;
    if (v47)
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        v49 = v48;
        v50 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134218242;
        v58 = v50;
        v59 = 2112;
        v60 = (uint64_t)v6;
        _os_log_impl(&dword_1B6A18000, v49, OS_LOG_TYPE_INFO, "ConferenceRenewal: Search completed. Found %lu URLs with host %@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v58 = (CFIndex)v6;
      _os_log_impl(&dword_1B6A18000, v48, OS_LOG_TYPE_ERROR, "ConferenceRenewal. Search completed. Unable to find URLs for with host %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_INFO, "ConferenceRenewal: conference URL search returning nil because no URLString was provided.", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)_extractURLStringsFromCalEvent:(void *)a3
{
  uint64_t v3;
  const void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v30;
  void *v31;
  const void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = CalCalendarItemCopyDescription();
  if (v3)
  {
    v4 = (const void *)v3;
    objc_msgSend(MEMORY[0x1E0D0C280], "deserializeConference:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "joinMethods");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v32 = v4;
      v9 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v5, "conference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "joinMethods");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = v5;
      objc_msgSend(v5, "conference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "joinMethods");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x1E0D0C288];
            objc_msgSend(v19, "URL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v20) = objc_msgSend(v20, "isTUConversationLink:", v21);

            if ((_DWORD)v20)
            {
              v22 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
              {
                v23 = v22;
                objc_msgSend(v19, "URL");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "absoluteString");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v38 = v25;
                _os_log_impl(&dword_1B6A18000, v23, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: adding URL: %@", buf, 0xCu);

              }
              objc_msgSend(v19, "URL");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "absoluteString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v27);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v16);
      }

      v5 = v31;
      v4 = v32;
    }
    else
    {
      v30 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6A18000, v30, OS_LOG_TYPE_INFO, "ConferenceRenewal: Skipping a found event because was unable to deserialize conference data", buf, 2u);
      }
      v12 = 0;
    }
    CFRelease(v4);

    return v12;
  }
  else
  {
    v28 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v28, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Skipping a found event because it has no notes", buf, 2u);
    }
    return 0;
  }
}

@end
