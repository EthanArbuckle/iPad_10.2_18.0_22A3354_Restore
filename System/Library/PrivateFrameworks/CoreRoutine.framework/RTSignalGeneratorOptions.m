@implementation RTSignalGeneratorOptions

+ (id)visitsDescriptionDataAtPath:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  RTMotionActivity *v34;
  RTMotionActivity *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  os_log_t log;
  _QWORD v47[4];
  id v48;
  NSObject *v49;
  id v50;
  __int128 *p_buf;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  __int128 buf;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v45);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v45);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (log)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](log, "objectForKey:", CFSTR("Locations"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      -[NSObject objectForKey:](log, "objectForKey:", CFSTR("WeeklyVisits"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v43, "count");
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "components:fromDate:", 764, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke;
      v61[3] = &unk_1E4FB1500;
      v39 = v9;
      v62 = v39;
      v65 = v42;
      v10 = v5;
      v63 = v10;
      v11 = v7;
      v64 = v11;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v61);
      v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v44, "setObject:forKey:", v11, CFSTR("Locations"));
      -[NSObject objectForKey:](log, "objectForKey:", CFSTR("CustomizedVisits"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_new();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_53;
      v57[3] = &unk_1E4FB14D8;
      v40 = v12;
      v58 = v40;
      v37 = v10;
      v59 = v37;
      v13 = v11;
      v60 = v13;
      objc_msgSend(v41, "enumerateObjectsUsingBlock:", v57);
      if ((objc_msgSend((id)objc_opt_class(), "visitsOverlapping:", v40) & 1) != 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityFramework);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "Error: found overlapping customized visits", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v14 = v40;
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v53, v71, 16, v37, v39);
        if (v16)
        {
          v17 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v54 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend(v13, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKey:", CFSTR("visits"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21 == 0;

              if (v22)
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", v19);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (void *)objc_opt_new();
                objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("visits"));

              }
              objc_msgSend(v13, "objectForKeyedSubscript:", v19);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", CFSTR("visits"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKey:](v14, "objectForKey:", v19);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObjectsFromArray:", v27);

            }
            v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
          }
          while (v16);
        }
      }

      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("LocationFrequency"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("LocationFrequency"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v29, CFSTR("LocationFrequency"));

      }
      -[NSObject objectForKey:](log, "objectForKey:", CFSTR("WeeklyActivities"), v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v67 = 0x3032000000;
      v68 = __Block_byref_object_copy__0;
      v69 = __Block_byref_object_dispose__0;
      v70 = 0;
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_56;
      v47[3] = &unk_1E4FB1550;
      v32 = v39;
      v48 = v32;
      v52 = v42;
      v15 = v38;
      v49 = v15;
      p_buf = &buf;
      v33 = v31;
      v50 = v33;
      objc_msgSend(v30, "enumerateObjectsUsingBlock:", v47);
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v34 = [RTMotionActivity alloc];
        v35 = -[RTMotionActivity initWithType:confidence:startDate:](v34, "initWithType:confidence:startDate:", 0, 3, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
        objc_msgSend(v33, "addObject:", v35);

      }
      objc_msgSend(v44, "setObject:forKey:", v33, CFSTR("MotionActivities"));

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v45;
        _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "issue creating dictionary with contents of file, %@", (uint8_t *)&buf, 0xCu);
      }
      v44 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v45;
      _os_log_error_impl(&dword_1A5E26000, log, OS_LOG_TYPE_ERROR, "file doesn't exist at path, %@", (uint8_t *)&buf, 0xCu);
    }
    v44 = 0;
  }

  return v44;
}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v9 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", -7 * (*(_QWORD *)(a1 + 56) + ~a3) - objc_msgSend(*(id *)(a1 + 32), "weekday") + 2);
  objc_msgSend(v5, "setHour:", -objc_msgSend(*(id *)(a1 + 32), "hour"));
  objc_msgSend(v5, "setMinute:", -objc_msgSend(*(id *)(a1 + 32), "minute"));
  objc_msgSend(v5, "setSecond:", -objc_msgSend(*(id *)(a1 + 32), "second"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, *(_QWORD *)(a1 + 40), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2;
  v10[3] = &unk_1E4FB14D8;
  v11 = v7;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v8 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  RTLocation *v46;
  void *v47;
  void *v48;
  RTLocationOfInterestVisit *v49;
  void *v50;
  RTLocationOfInterestVisit *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Exit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 240, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDay:", objc_msgSend(v8, "day") - 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 240, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v8, *(_QWORD *)(a1 + 32), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingComponents:toDate:options:", v10, *(_QWORD *)(a1 + 32), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "compare:", *(_QWORD *)(a1 + 40)) == 1
    || objc_msgSend(v14, "compare:", *(_QWORD *)(a1 + 40)) == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
      v52 = v5;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringFromDate:", *(_QWORD *)(a1 + 40));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v54;
      _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "adjusted dates are newer than current date, %@", buf, 0xCu);

      v5 = v52;
    }

  }
  else
  {
    v60 = v5;
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("visits"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_opt_new();
      objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("visits"));

    }
    if (objc_msgSend(v12, "compare:", v14) == 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringFromDate:", v12);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringFromDate:", v14);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v55;
        v63 = 2112;
        v64 = v57;
        _os_log_error_impl(&dword_1A5E26000, v20, OS_LOG_TYPE_ERROR, "ERROR: adjusted entry, %@, postdates adjusted exit, %@", buf, 0x16u);

      }
      v5 = v60;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Latitude"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Longitude"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("HorizontalUncertainty"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v32 = v31;

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Altitude"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v36 = v35;

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("VerticalUncertainty"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      v40 = v39;

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKey:", CFSTR("sourceAccuracy"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = v6;
      if (v42)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKey:", CFSTR("sourceAccuracy"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "unsignedIntValue");

      }
      else
      {
        v45 = 1;
      }
      v46 = -[RTLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:]([RTLocation alloc], "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, 0, v45, v24, v28, v32, v36, v40, -1.0);
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKey:", CFSTR("visits"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = [RTLocationOfInterestVisit alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[RTLocationOfInterestVisit initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:](v49, "initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:", v50, v12, v14, v46, 0, 1.0);
      objc_msgSend(v48, "addObject:", v51);

      v6 = v59;
      v5 = v60;
    }
  }

}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RTLocation *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  RTLocationOfInterestVisit *v38;
  void *v39;
  RTLocationOfInterestVisit *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "setObject:forKey:", v7, v4);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Entry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Exit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "compare:", *(_QWORD *)(a1 + 40)) == 1
    || objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 40)) == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v10 = (RTLocation *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringFromDate:", *(_QWORD *)(a1 + 40));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringFromDate:", v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringFromDate:", v9);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 138412802;
    v50 = v37;
    v51 = 2112;
    v52 = v39;
    v53 = 2112;
    v54 = v44;
    _os_log_error_impl(&dword_1A5E26000, &v10->super, OS_LOG_TYPE_ERROR, "visit entry/exit dates are newer than current date, %@, visit entry, %@, exit, %@", (uint8_t *)&v49, 0x20u);

LABEL_17:
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "compare:", v9) != 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Latitude"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Longitude"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("HorizontalUncertainty"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Altitude"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("VerticalUncertainty"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("sourceAccuracy"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", CFSTR("sourceAccuracy"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedIntValue");

    }
    else
    {
      v36 = 1;
    }
    v10 = -[RTLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:]([RTLocation alloc], "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, 0, v36, v15, v19, v23, v27, v31, -1.0);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = [RTLocationOfInterestVisit alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[RTLocationOfInterestVisit initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:](v38, "initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:", v39, v8, v9, v10, 0, 1.0);
    objc_msgSend(v37, "addObject:", v40);

    goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringFromDate:", v8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringFromDate:", v9);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 138412546;
    v50 = v46;
    v51 = 2112;
    v52 = v48;
    _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "ERROR: entry, %@, postdates exit, %@", (uint8_t *)&v49, 0x16u);

  }
LABEL_7:

}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_56(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  __int128 v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  v11 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", -7 * (*(_QWORD *)(a1 + 64) + ~a3) - objc_msgSend(*(id *)(a1 + 32), "weekday") + 2);
  objc_msgSend(v5, "setHour:", -objc_msgSend(*(id *)(a1 + 32), "hour"));
  objc_msgSend(v5, "setMinute:", -objc_msgSend(*(id *)(a1 + 32), "minute"));
  objc_msgSend(v5, "setSecond:", -objc_msgSend(*(id *)(a1 + 32), "second"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, *(_QWORD *)(a1 + 40), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2_57;
  v12[3] = &unk_1E4FB1528;
  v13 = v7;
  v14 = *(id *)(a1 + 40);
  v16 = a3;
  v10 = *(_OWORD *)(a1 + 48);
  v8 = (id)v10;
  v15 = v10;
  v9 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2_57(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RTMotionActivity *v16;
  NSObject *v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Mode of Transportation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = +[RTMotionActivity motionActivityTypeFromString:](RTMotionActivity, "motionActivityTypeFromString:", v4);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Confidence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[RTMotionActivity motionActivityConfidenceFromString:](RTMotionActivity, "motionActivityConfidenceFromString:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Start"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("End"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 240, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDay:", objc_msgSend(v9, "day") - 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 240, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setDay:", objc_msgSend(v11, "day") - 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v9, *(_QWORD *)(a1 + 32), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v11, *(_QWORD *)(a1 + 32), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "compare:", *(_QWORD *)(a1 + 40)) == 1
    || objc_msgSend(v15, "compare:", *(_QWORD *)(a1 + 40)) == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v16 = (RTMotionActivity *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringFromDate:", *(_QWORD *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v22;
      _os_log_error_impl(&dword_1A5E26000, &v16->super, OS_LOG_TYPE_ERROR, "adjusted dates are newer than current date, %@", buf, 0xCu);

    }
    goto LABEL_5;
  }
  if (objc_msgSend(v13, "compare:", v15) != 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v15);
    v26 = *(_QWORD *)(a1 + 64);
    v27 = (void *)MEMORY[0x1E0CB3940];
    +[RTMotionActivity motionActivityTypeToString:](RTMotionActivity, "motionActivityTypeToString:", v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMotionActivity motionActivityConfidenceToString:](RTMotionActivity, "motionActivityConfidenceToString:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("index %d (day), activity type %@, confidence %@, adjustedStart %@, adjustedEnd %@\n"), v26, v28, v18, v13, v15);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    fputs(v20, (FILE *)*MEMORY[0x1E0C80C10]);

    v16 = -[RTMotionActivity initWithType:confidence:startDate:]([RTMotionActivity alloc], "initWithType:confidence:startDate:", v30, v29, v13);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
LABEL_5:

    goto LABEL_6;
  }
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringFromDate:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateFormatter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringFromDate:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v23;
    v34 = 2112;
    v35 = v25;
    _os_log_error_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_ERROR, "ERROR: adjusted start, %@, postdates adjusted end, %@", buf, 0x16u);

  }
LABEL_6:

}

+ (BOOL)visitsOverlapping:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingDescriptors:", v12);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    while (1)
    {
      if (*(_QWORD *)v19 != v16)
        objc_enumerationMutation(v13);
      if (!--v15)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (!v15)
          break;
      }
    }
  }

  return 0;
}

+ (id)getVisitsFromVisitsDescriptionData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke;
  v10[3] = &unk_1E4FB15A0;
  v12 = &v18;
  v13 = &v14;
  v5 = v4;
  v11 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v19[3];
    v8 = v15[3];
    *(_DWORD *)buf = 134218240;
    v23 = v7;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_INFO, "lois injected, %lu, visits injected, %lu", buf, 0x16u);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_3);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v5;
}

void __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visits"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke_2;
  v11[3] = &unk_1E4FB1578;
  v12 = v5;
  v13 = v6;
  v15 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v10[0] = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

}

void __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  RTVisit *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RTVisit *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      v8 = (void *)a1[5];
      *(_DWORD *)buf = 138412546;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_INFO, "%@, %@", buf, 0x16u);
    }

    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  v9 = (void *)a1[6];
  v10 = [RTVisit alloc];
  objc_msgSend(v5, "exitDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exitDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[RTVisit initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:](v10, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v11, 0, v12, v13, v14, 0, 0.0, 0);
  objc_msgSend(v9, "addObject:", v15);

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = a3 + 1;
    objc_msgSend(v5, "exitDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v19);
    *(_DWORD *)buf = 134218498;
    v22 = v17;
    v23 = 2112;
    v24 = v5;
    v25 = 2048;
    v26 = v20 / 60.0;
    _os_log_impl(&dword_1A5E26000, v16, OS_LOG_TYPE_INFO, "visit %lu, %@, %f minutes", buf, 0x20u);

  }
}

uint64_t __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "entry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (RTSignalGeneratorOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStartLocation_endLocation_expectedVisits_);
}

- (RTSignalGeneratorOptions)initWithVisitsDescriptionData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RTSignalGeneratorOptions *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("Locations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "getVisitsFromVisitsDescriptionData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RTSignalGeneratorOptions initWithStartLocation:endLocation:expectedVisits:](self, "initWithStartLocation:endLocation:expectedVisits:", 0, 0, v7);

  return v8;
}

- (RTSignalGeneratorOptions)initWithVisitsDescriptionPListPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RTSignalGeneratorOptions *v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "visitsDescriptionDataAtPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Locations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getVisitsFromVisitsDescriptionData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RTSignalGeneratorOptions initWithStartLocation:endLocation:expectedVisits:](self, "initWithStartLocation:endLocation:expectedVisits:", 0, 0, v8);

  return v9;
}

- (RTSignalGeneratorOptions)initWithStartLocation:(id)a3 endLocation:(id)a4 expectedVisits:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  RTSignalGeneratorOptions *v12;
  RTLocation *v13;
  void *startLocation;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  RTLocation *v24;
  RTLocation *v25;
  void *endLocation;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  RTLocation *v36;
  RTLocation *v38;
  RTLocation *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[RTSignalGeneratorOptions initWithStartLocation:endLocation:expectedVisits:]";
      v47 = 1024;
      v48 = 407;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expectedVisits (in %s:%d)", buf, 0x12u);
    }

  }
  v44.receiver = self;
  v44.super_class = (Class)RTSignalGeneratorOptions;
  v12 = -[RTSignalGeneratorOptions init](&v44, sel_init);
  if (v12)
  {
    if (v8)
    {
      v13 = (RTLocation *)v8;
      startLocation = v12->_startLocation;
      v12->_startLocation = v13;
    }
    else
    {
      v38 = [RTLocation alloc];
      objc_msgSend(v10, "firstObject");
      startLocation = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(startLocation, "location");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "latitude");
      v16 = v15 + -0.1;
      objc_msgSend(v10, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "longitude");
      v19 = v18;
      objc_msgSend(v10, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "entry");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateByAddingTimeInterval:", -1800.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[RTLocation initWithLatitude:longitude:horizontalUncertainty:date:](v38, "initWithLatitude:longitude:horizontalUncertainty:date:", v22, v16, v19, 10.0);
      v24 = v12->_startLocation;
      v12->_startLocation = (RTLocation *)v23;

    }
    if (v9)
    {
      v25 = (RTLocation *)v9;
      endLocation = v12->_endLocation;
      v12->_endLocation = v25;
    }
    else
    {
      v39 = [RTLocation alloc];
      objc_msgSend(v10, "lastObject");
      endLocation = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(endLocation, "location");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "latitude");
      v28 = v27 + 0.1;
      objc_msgSend(v10, "lastObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "location");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "longitude");
      v31 = v30;
      objc_msgSend(v10, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "exit");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dateByAddingTimeInterval:", 1800.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[RTLocation initWithLatitude:longitude:horizontalUncertainty:date:](v39, "initWithLatitude:longitude:horizontalUncertainty:date:", v34, v28, v31, 10.0);
      v36 = v12->_endLocation;
      v12->_endLocation = (RTLocation *)v35;

    }
    objc_storeStrong((id *)&v12->_expectedVisits, a5);
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("startLocation, %@, endLocation, %@, expectedVisits, %@"), self->_startLocation, self->_endLocation, self->_expectedVisits);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSignalGeneratorOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  RTSignalGeneratorOptions *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("expectedVisits"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RTSignalGeneratorOptions initWithStartLocation:endLocation:expectedVisits:](self, "initWithStartLocation:endLocation:expectedVisits:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  RTLocation *startLocation;
  id v5;

  startLocation = self->_startLocation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startLocation, CFSTR("startLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endLocation, CFSTR("endLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedVisits, CFSTR("expectedVisits"));

}

- (RTLocation)startLocation
{
  return self->_startLocation;
}

- (RTLocation)endLocation
{
  return self->_endLocation;
}

- (NSArray)expectedVisits
{
  return self->_expectedVisits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedVisits, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
}

@end
