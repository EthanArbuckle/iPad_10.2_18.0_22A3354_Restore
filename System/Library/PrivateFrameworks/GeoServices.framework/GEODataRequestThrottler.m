@implementation GEODataRequestThrottler

- (void)_pruneThrottlers
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_throttlers, "allKeys");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_throttlers, "objectForKeyedSubscript:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeUntilReset");
        if (v10 <= 0.0 && objc_msgSend(v9, "isExpired"))
        {
          objc_msgSend(v3, "addObject:", v8);
          -[NSMutableDictionary removeObjectForKey:](self->_throttlers, "removeObjectForKey:", v8);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[GEODataRequestThrottler _updateSavedState:](self, "_updateSavedState:", v3);
}

- (void)_updateSavedState:(id)a3
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  NSMutableDictionary *throttlers;
  id v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  GEODataRequestThrottler *v25;
  id v26;
  void *v27;
  id v28;
  id obj;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v25 = self;
  v26 = a3;
  geo_assert_isolated();
  GEOGetMonotonicTime();
  v4 = v3;
  readSavedState();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v27, "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("savedAtTime"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v26;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(obj);
        v9 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "removeObjectForKey:", v10);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v6);
  }

  objc_msgSend(v5, "allKeys");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v28);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v14, v25);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_18;
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (v17 = objc_msgSend(v16, "intValue"), v17 != 16) && v17 != 32)
        {

LABEL_18:
          goto LABEL_21;
        }
        v18 = objc_msgSend((id)objc_opt_class(), "stateIsExpired:", v15);

        if (v18)
          objc_msgSend(v5, "removeObjectForKey:", v14);
LABEL_21:

      }
      v11 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v11);
  }

  throttlers = v25->_throttlers;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __45__GEODataRequestThrottler__updateSavedState___block_invoke;
  v30[3] = &unk_1E1C0C588;
  v20 = v5;
  v31 = v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](throttlers, "enumerateKeysAndObjectsUsingBlock:", v30);
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("savedAtTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("savedAtTime"));

    if (objc_msgSend(v20, "isEqual:", v27))
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("savedAtTime"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_msgSend(v22, "doubleValue"), v23 + 300.0 >= v4))
      {

        goto LABEL_32;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("savedAtTime"));

    _setValue(GeoServicesConfig_ThrottlerState, (uint64_t)off_1EDF4CCE8, v20, 1, 0);
  }
  else
  {
    _setValue(GeoServicesConfig_ThrottlerState, (uint64_t)off_1EDF4CCE8, 0, 0, 0);
  }
LABEL_32:

}

void __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  os_log_type_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  os_log_type_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  os_log_type_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  os_log_type_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  os_log_type_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  os_log_type_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  os_log_type_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  os_log_type_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  os_log_type_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  os_log_type_t v49;
  void *v50;
  int v51;
  uint64_t v52;
  os_log_type_t v53;
  void *v54;
  int v55;
  uint64_t v56;
  os_log_type_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  os_log_type_t v61;
  void *v62;
  int v63;
  uint64_t v64;
  os_log_type_t v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  _QWORD v79[4];
  __int128 v80;
  uint64_t v81;
  char v82;
  _QWORD v83[4];
  _QWORD v84[4];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 56;
  v3 = *(_OWORD *)(a1 + 56);
  v4 = *(unsigned int *)(a1 + 88);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(v2 - 16);
  v7 = MEMORY[0x1E0C809B0];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_2;
  v79[3] = &unk_1E1C0C4C0;
  v80 = v3;
  v82 = *(_BYTE *)(v2 + 44);
  v81 = *(_QWORD *)(v2 + 16);
  objc_msgSend(v5, "_withThrottlersForKey:auditToken:do:", v4, v6, v79);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 24))
  {
    LODWORD(v78) = *(_DWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "_withThrottlersForKey:auditToken:do:", v7, 3221225472, __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_118, &unk_1E1C0C4E8, *(_QWORD *)(a1 + 32), *(_QWORD *)v2, *(_QWORD *)(a1 + 92), v78);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("<unknown>")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v9))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_DWORD *)(a1 + 88);
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v10;
        v87 = 1024;
        v88 = v11;
        v89 = 2112;
        v90 = v12;
        _os_log_impl(&dword_1885A9000, v8, v9, "Throttled {unknown>?? request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.Maps")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v13 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v13))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_DWORD *)(a1 + 88);
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v14;
        v87 = 1024;
        v88 = v15;
        v89 = 2112;
        v90 = v16;
        _os_log_impl(&dword_1885A9000, v8, v13, "Throttled com.apple.Maps request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.navd")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v17 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v17))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_DWORD *)(a1 + 88);
        v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v18;
        v87 = 1024;
        v88 = v19;
        v89 = 2112;
        v90 = v20;
        _os_log_impl(&dword_1885A9000, v8, v17, "Throttled com.apple.navd request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.destinationd")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v21 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v21))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_DWORD *)(a1 + 88);
        v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v22;
        v87 = 1024;
        v88 = v23;
        v89 = 2112;
        v90 = v24;
        _os_log_impl(&dword_1885A9000, v8, v21, "Throttled com.apple.destinationd request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.photoanalysisd")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v25 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v25))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_DWORD *)(a1 + 88);
        v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v26;
        v87 = 1024;
        v88 = v27;
        v89 = 2112;
        v90 = v28;
        _os_log_impl(&dword_1885A9000, v8, v25, "Throttled com.apple.photoanalysisd request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.reminders")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v29 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v29))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(_DWORD *)(a1 + 88);
        v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v30;
        v87 = 1024;
        v88 = v31;
        v89 = 2112;
        v90 = v32;
        _os_log_impl(&dword_1885A9000, v8, v29, "Throttled com.apple.reminders request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.mobilecal")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v33 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v33))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_DWORD *)(a1 + 88);
        v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v34;
        v87 = 1024;
        v88 = v35;
        v89 = 2112;
        v90 = v36;
        _os_log_impl(&dword_1885A9000, v8, v33, "Throttled com.apple.mobilecal request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.findmy")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v37 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v37))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *(_DWORD *)(a1 + 88);
        v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v38;
        v87 = 1024;
        v88 = v39;
        v89 = 2112;
        v90 = v40;
        _os_log_impl(&dword_1885A9000, v8, v37, "Throttled com.apple.findmy request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.CoreRoutine.helperservice")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v41 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v41))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = *(_DWORD *)(a1 + 88);
        v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v42;
        v87 = 1024;
        v88 = v43;
        v89 = 2112;
        v90 = v44;
        _os_log_impl(&dword_1885A9000, v8, v41, "Throttled com.apple.CoreRoutine.helperservice request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.wifid")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v45 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v45))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *(_DWORD *)(a1 + 88);
        v48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v46;
        v87 = 1024;
        v88 = v47;
        v89 = 2112;
        v90 = v48;
        _os_log_impl(&dword_1885A9000, v8, v45, "Throttled com.apple.wifid request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.MobileSMS")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v49 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v49))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(_DWORD *)(a1 + 88);
        v52 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v50;
        v87 = 1024;
        v88 = v51;
        v89 = 2112;
        v90 = v52;
        _os_log_impl(&dword_1885A9000, v8, v49, "Throttled com.apple.MobileSMS request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.corecontextd")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v53 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v53))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = *(_DWORD *)(a1 + 88);
        v56 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v54;
        v87 = 1024;
        v88 = v55;
        v89 = 2112;
        v90 = v56;
        _os_log_impl(&dword_1885A9000, v8, v53, "Throttled com.apple.corecontextd request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.geotool")))
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v57 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v57))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = *(_DWORD *)(a1 + 88);
        v60 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v58;
        v87 = 1024;
        v88 = v59;
        v89 = 2112;
        v90 = v60;
        _os_log_impl(&dword_1885A9000, v8, v57, "Throttled com.apple.geotool request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else if ((objc_msgSend(*(id *)(a1 + 48), "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
           || (objc_msgSend(*(id *)(a1 + 48), "containsString:", CFSTR(".")) & 1) == 0)
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v65 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v65))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = *(_DWORD *)(a1 + 88);
        v68 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v66;
        v87 = 1024;
        v88 = v67;
        v89 = 2112;
        v90 = v68;
        _os_log_impl(&dword_1885A9000, v8, v65, "Throttled Internal request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }
    else
    {
      GEOGetGEODataRequestThrottlerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v61 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
      if (os_log_type_enabled(v8, v61))
      {
        GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = *(_DWORD *)(a1 + 88);
        v64 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v86 = v62;
        v87 = 1024;
        v88 = v63;
        v89 = 2112;
        v90 = v64;
        _os_log_impl(&dword_1885A9000, v8, v61, "Throttled External request %@ for key %#x: %@", buf, 0x1Cu);

      }
    }

    if (*(_BYTE *)(a1 + 100))
    {
      v69 = (void *)MEMORY[0x1E0CB35C8];
      v70 = *(_QWORD *)(a1 + 64);
      v84[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v83[0] = CFSTR("details");
      v83[1] = CFSTR("timeUntilReset");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(v70 + 8) + 24));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v71;
      v83[2] = CFSTR("requestKind");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_DWORD *)(a1 + 96) | *(_DWORD *)(a1 + 92)));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v84[2] = v72;
      v83[3] = CFSTR("requestKindString");
      GEODataRequestKindAsString(*(_QWORD *)(a1 + 92));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v84[3] = v73;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 4);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "GEOErrorWithCode:userInfo:", -3, v74);
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v77 = *(void **)(v76 + 40);
      *(_QWORD *)(v76 + 40) = v75;

    }
  }
}

- (void)_withThrottlersForKey:(GEOThrottleKey)a3 auditToken:(id)a4 do:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, void *, void *);
  unint64_t i;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = *(_QWORD *)&a3.var0;
  v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  geo_assert_isolated();
  for (i = 0; i != 4; ++i)
  {
    v18 = v8;
    v11 = CFSTR("all");
    if (i <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#x"), v6);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v12 = CFSTR("long");
    if ((i & 0x7FFFFFFFFFFFFFFDLL) == 0)
      v12 = CFSTR("short");
    v13 = v12;
    objc_msgSend(v18, "bundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v18, "bundleId");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("<unknown>");
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@/%@/%@"), CFSTR("app:"), v15, v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEODataRequestThrottler throttlerForKeyPath:](self, "throttlerForKeyPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v9[2](v9, v17, v16);

  }
}

- (id)throttlerForKeyPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSDictionary **p_defaultThrottlePolicy;
  NSDictionary *defaultThrottlePolicy;
  NSObject *v11;
  NSDictionary *globalThrottlePolicy;
  uint64_t v13;
  NSDictionary *v14;
  NSDictionary *v15;
  id v16;
  NSDictionary *v17;
  void *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSString *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  NSString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  NSString *v34;
  NSString *v35;
  id v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  GEODataRequestThrottler *v43;
  void *v44;
  void *v45;
  id obj;
  id v47;
  NSDictionary *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  double v62;
  unint64_t v63;
  _BYTE v64[5];
  uint8_t v65[128];
  uint8_t buf[4];
  NSObject *v67;
  _QWORD v68[2];
  _QWORD v69[5];

  v69[2] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_throttlers, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v43 = self;
    if (!self->_throttlePoliciesCached)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("ThrottlerDefaults"), CFSTR("plist"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v49 = 0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v6, &v49);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = v49;
        defaultThrottlePolicy = self->_defaultThrottlePolicy;
        p_defaultThrottlePolicy = &self->_defaultThrottlePolicy;
        *p_defaultThrottlePolicy = (NSDictionary *)v7;

        if (!*p_defaultThrottlePolicy)
        {
          GEOGetGEODataRequestThrottlerLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v8;
            _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_FAULT, "Unable to load throttler default values resource: %@", buf, 0xCu);
          }

        }
      }
      else
      {
        GEOGetGEODataRequestThrottlerLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_FAULT, "Unable to locate throttler default values resource", buf, 2u);
        }
      }

      if (GEOConfigGetBOOL(GeoServicesConfig_ThrottlePolicyIgnoreConfig, (uint64_t)off_1EDF4D3D8))
      {
        globalThrottlePolicy = v43->_globalThrottlePolicy;
        v43->_globalThrottlePolicy = 0;
      }
      else
      {
        _getValue(GeoServicesConfig_ThrottlePolicy, (uint64_t)off_1EDF4D3E8, 1, 0, 0, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        globalThrottlePolicy = v43->_globalThrottlePolicy;
        v43->_globalThrottlePolicy = (NSDictionary *)v13;
      }

      v43->_throttlePoliciesCached = 1;
      self = v43;
    }
    v14 = self->_defaultThrottlePolicy;
    v15 = self->_globalThrottlePolicy;
    v16 = v47;
    v48 = v14;
    v17 = v15;
    v45 = v16;
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("/"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v18;
    if (objc_msgSend(v18, "count") == 3)
    {
      v62 = 0.0;
      v63 = 0;
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "isEqualToString:", CFSTR("all")))
      {
        v69[0] = CFSTR("all");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
      }
      else
      {
        v69[0] = v42;
        v69[1] = CFSTR("any");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v44;
      v68[1] = CFSTR("global");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = v39;
      v41 = v20;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v59;
        v38 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v59 != v22)
              objc_enumerationMutation(obj);
            v24 = *(NSString **)(*((_QWORD *)&v58 + 1) + 8 * i);
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v25 = v20;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v55;
              while (2)
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v55 != v27)
                    objc_enumerationMutation(v25);
                  v29 = *(NSString **)(*((_QWORD *)&v54 + 1) + 8 * j);
                  if (v17
                    && parseThrottlePolicy(v17, *(NSString **)(*((_QWORD *)&v54 + 1) + 8 * j), v24, v19, &v63, &v62)|| parseThrottlePolicy(v48, v29, v24, v19, &v63, &v62))
                  {
                    objc_msgSend(v45, "stringByAppendingFormat:", CFSTR("(%@/%@)"), v29, v24);
                    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
                    createThrottler((NSString *)v45, v35, v63, v62);
                    v4 = (void *)objc_claimAutoreleasedReturnValue();

                    v30 = obj;
LABEL_46:

                    goto LABEL_47;
                  }
                }
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
                v22 = v38;
                if (v26)
                  continue;
                break;
              }
            }

            v20 = v41;
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
        }
        while (v21);
      }

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v30 = obj;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v51;
        while (2)
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v51 != v32)
              objc_enumerationMutation(v30);
            v34 = *(NSString **)(*((_QWORD *)&v50 + 1) + 8 * k);
            if (parseThrottlePolicy(v48, CFSTR("default"), v34, v19, &v63, &v62))
            {
              objc_msgSend(v45, "stringByAppendingFormat:", CFSTR("(%@/%@)"), CFSTR("default"), v34);
              v25 = (id)objc_claimAutoreleasedReturnValue();
              createThrottler((NSString *)v45, (NSString *)v25, v63, v62);
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_46;
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
          if (v31)
            continue;
          break;
        }
      }

      objc_msgSend(v45, "stringByAppendingString:", CFSTR("(fallback)"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      createThrottler((NSString *)v45, (NSString *)v30, 5, 60.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

    }
    else
    {
      v4 = 0;
    }

    if (v4)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v43->_throttlers, "setObject:forKeyedSubscript:", v4, v45);
  }
  v36 = v4;

  return v36;
}

void __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (!objc_msgSend(v12, "remainingEntries"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    objc_msgSend(v12, "timeUntilReset");
    v4 = v3;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(double *)(v5 + 24);
    if (v4 > v6)
    {
      objc_msgSend(v12, "timeUntilReset");
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    *(double *)(v5 + 24) = v6;
    if (*(_BYTE *)(a1 + 56))
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v12, "userInfoForError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

    }
  }

}

void __45__GEODataRequestThrottler__updateSavedState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "captureState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

- (BOOL)allowRequest:(id)a3 forClient:(id)a4 throttlerToken:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  __CFString *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v9 = a4;
  if (qword_1ECDBC018 != -1)
    dispatch_once(&qword_1ECDBC018, &__block_literal_global_91);
  v10 = (id)qword_1ECDBC010;
  objc_msgSend(v9, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (v12)
  {
    if (a5)
      *a5 = -[GEODataRequestThrottlerToken initWithRequest:forClient:]([GEODataRequestThrottlerToken alloc], "initWithRequest:forClient:", a3, v9);
    LOBYTE(a6) = 1;
    goto LABEL_31;
  }
  v13 = HIDWORD(*(unint64_t *)&a3);
  if ((checkEntitlements(a3.var0, v9) & 1) != 0)
  {
    objc_msgSend(v9, "bundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v9, "bundleId");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("<unknown>");
    }

    if (!a3.var0)
    {
      if (a6)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = (void *)MEMORY[0x1E0CB3940];
        GEODataRequestKindAsString(*(_QWORD *)&a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("Unknown request type: %#x \"%@\"), v13 | *(_QWORD *)&a3, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "GEOErrorWithCode:reason:", -10, v24);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a6) = 0;
      }
      goto LABEL_30;
    }
    if (a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*a5, "isValidForRequest:client:", a3, v9))
      {
        objc_msgSend(*a5, "refresh");
LABEL_29:
        LOBYTE(a6) = 1;
LABEL_30:

        goto LABEL_31;
      }
      if (!GEOThrottleKeyMakeFromRequestKind(*(_QWORD *)&a3))
      {
        *a5 = -[GEODataRequestThrottlerToken initWithRequest:forClient:]([GEODataRequestThrottlerToken alloc], "initWithRequest:forClient:", a3, v9);
        goto LABEL_29;
      }
    }
    else if (!GEOThrottleKeyMakeFromRequestKind(*(_QWORD *)&a3))
    {
      goto LABEL_29;
    }
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 1;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__44;
    v36 = __Block_byref_object_dispose__44;
    v37 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__44;
    v29[4] = __Block_byref_object_dispose__44;
    v30 = 0;
    v25 = v9;
    v28 = v15;
    geo_isolate_sync_data();
    if (a6)
      *a6 = objc_retainAutorelease((id)v33[5]);
    v26 = *((unsigned __int8 *)v39 + 24);
    if (a5 && *((_BYTE *)v39 + 24))
    {
      *a5 = -[GEODataRequestThrottlerToken initWithRequest:forClient:]([GEODataRequestThrottlerToken alloc], "initWithRequest:forClient:", a3, v25);
      v26 = *((unsigned __int8 *)v39 + 24);
    }
    LOBYTE(a6) = v26 != 0;

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    goto LABEL_30;
  }
  if (a6)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "bundleId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    GEODataRequestKindAsString(*(_QWORD *)&a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Client \"%@\" is not entitled to issue request type: %#x \"%@\"), v18, v13 | *(_QWORD *)&a3, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "GEOErrorWithCode:reason:", -5, v20);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
  }
LABEL_31:

  return (char)a6;
}

+ (GEODataRequestThrottler)sharedThrottler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GEODataRequestThrottler_sharedThrottler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_238 != -1)
    dispatch_once(&_MergedGlobals_238, block);
  return (GEODataRequestThrottler *)(id)qword_1ECDBC008;
}

uint64_t __42__GEODataRequestThrottler_pruneThrottlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pruneThrottlers");
}

void __32__GEODataRequestThrottler__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pruneThrottlers");

}

- (void)pruneThrottlers
{
  geo_isolate_sync_data();
}

void __42__GEODataRequestThrottler_sharedThrottler__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_1ECDBC008;
  qword_1ECDBC008 = v1;

}

- (GEODataRequestThrottler)init
{
  GEODataRequestThrottler *result;

  result = (GEODataRequestThrottler *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)_init
{
  id v2;
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *global_queue;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25[5];
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)GEODataRequestThrottler;
  v2 = -[GEODataRequestThrottler init](&v28, sel_init);
  if (v2)
  {
    if (GEOConfigGetBOOL(GeoServicesConfig_ThrottlerLogAsFault, (uint64_t)off_1EDF4D408))
      v3 = 17;
    else
      v3 = 16;
    *((_BYTE *)v2 + 72) = v3;
    v4 = geo_isolater_create();
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v6;

    *((_BYTE *)v2 + 32) = 0;
    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C809B0];
    v25[1] = (id)MEMORY[0x1E0C809B0];
    v25[2] = (id)3221225472;
    v25[3] = __32__GEODataRequestThrottler__init__block_invoke;
    v25[4] = &unk_1E1C00650;
    objc_copyWeak(&v26, &location);
    v9 = geo_dispatch_timer_create_on_qos();
    v10 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v9;

    *((_DWORD *)v2 + 14) = -1;
    v11 = GeoServicesConfig_ThrottlePolicy;
    v12 = off_1EDF4D3E8;
    global_queue = (void *)geo_get_global_queue();
    _GEOConfigAddDelegateListenerForKey(v11, (uint64_t)v12, global_queue, v2);

    v14 = GeoServicesConfig_ThrottlePolicyIgnoreConfig;
    v15 = off_1EDF4D3D8;
    v16 = (void *)geo_get_global_queue();
    _GEOConfigAddDelegateListenerForKey(v14, (uint64_t)v15, v16, v2);

    v17 = GeoServicesConfig_ThrottlerLogAsFault;
    v18 = off_1EDF4D408;
    v19 = (void *)geo_get_global_queue();
    _GEOConfigAddDelegateListenerForKey(v17, (uint64_t)v18, v19, v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __32__GEODataRequestThrottler__init__block_invoke_2;
    v24[3] = &unk_1E1C0C498;
    objc_copyWeak(v25, &location);
    objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", CFSTR("GEONetworkDefaultsDidChangeNotification"), 0, 0, v24);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v21;

    dispatch_activate(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__GEODataRequestThrottler__init__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  geo_dispatch_async_qos();
  objc_destroyWeak(&v1);
}

void __32__GEODataRequestThrottler__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reset");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  dispatch_source_cancel((dispatch_source_t)self->_updateStateTimer);
  notify_cancel(self->_defaultChangedNotification);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_networkChangedNotification);

  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  v4.receiver = self;
  v4.super_class = (Class)GEODataRequestThrottler;
  -[GEODataRequestThrottler dealloc](&v4, sel_dealloc);
}

void __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "addRequestTimestamp");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    GEOGetGEODataRequestThrottlerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
    if (os_log_type_enabled(v7, v8))
    {
      GEODataRequestKindAsString(*(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_DWORD *)(a1 + 56);
      v11 = 138412802;
      v12 = v9;
      v13 = 1024;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1885A9000, v7, v8, "!!Unexpected!! Throttled request %@ for key %#x / \"%@\", (uint8_t *)&v11, 0x1Cu);

    }
  }

}

- (void)getInfoForRequest:(id)a3 client:(id)a4 timeUntilNextReset:(double *)a5 availableRequestCount:(unsigned int *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a4;
  if (!a3.var0)
    goto LABEL_7;
  if (!GEOThrottleKeyMakeFromRequestKind(*(_QWORD *)&a3))
  {
    *a6 = -1;
    *a5 = 0.0;
    goto LABEL_8;
  }
  if ((checkEntitlements(a3.var0, v9) & 1) == 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    *(_QWORD *)a5 = v11;

    *a6 = 0;
    goto LABEL_8;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0xFFFFFFFFLL;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12 = v9;
  geo_isolate_sync_data();
  *a5 = v14[3];
  *a6 = v18[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
LABEL_8:

}

uint64_t __93__GEODataRequestThrottler_getInfoForRequest_client_timeUntilNextReset_availableRequestCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(unsigned int *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__GEODataRequestThrottler_getInfoForRequest_client_timeUntilNextReset_availableRequestCount___block_invoke_2;
  v5[3] = &unk_1E1C0C538;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(v3, "_withThrottlersForKey:auditToken:do:", v1, v2, v5);
}

void __93__GEODataRequestThrottler_getInfoForRequest_client_timeUntilNextReset_availableRequestCount___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "timeUntilReset");
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(double *)(v5 + 24);
  if (v4 > v6)
  {
    objc_msgSend(v10, "timeUntilReset");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(double *)(v5 + 24) = v6;
  v7 = objc_msgSend(v10, "remainingEntries");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(_QWORD *)(v8 + 24);
  if (v7 < v9)
  {
    v9 = objc_msgSend(v10, "remainingEntries");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_QWORD *)(v8 + 24) = v9;

}

- (void)reset
{
  geo_isolate_sync_data();
}

uint64_t __32__GEODataRequestThrottler_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

- (void)_reset
{
  unsigned __int8 v3;

  if (GEOConfigGetBOOL(GeoServicesConfig_ThrottlerLogAsFault, (uint64_t)off_1EDF4D408))
    v3 = 17;
  else
    v3 = 16;
  self->_throttleEventLogLevel = v3;
  self->_throttlePoliciesCached = 0;
  -[GEODataRequestThrottler _pruneThrottlers](self, "_pruneThrottlers");
  -[NSMutableDictionary removeAllObjects](self->_throttlers, "removeAllObjects");
}

- (NSString)description
{
  id v2;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> {\n"), objc_opt_class(), self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync_data();
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  v2 = v4;

  return (NSString *)v2;
}

void __38__GEODataRequestThrottler_description__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__GEODataRequestThrottler_description__block_invoke_2;
  v3[3] = &unk_1E1C0C588;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

uint64_t __38__GEODataRequestThrottler_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("key '%@': %@\n"), a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkChangedNotification, 0);
  objc_storeStrong((id *)&self->_updateStateTimer, 0);
  objc_storeStrong((id *)&self->_throttlers, 0);
  objc_storeStrong((id *)&self->_globalThrottlePolicy, 0);
  objc_storeStrong((id *)&self->_defaultThrottlePolicy, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
