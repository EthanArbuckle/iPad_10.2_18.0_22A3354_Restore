@implementation GEOTFIncident

- (GEOTFIncident)init
{
  GEOTFIncident *v2;
  GEOTFIncident *v3;
  GEOTFIncident *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTFIncident;
  v2 = -[GEOTFIncident init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTFIncident)initWithData:(id)a3
{
  GEOTFIncident *v3;
  GEOTFIncident *v4;
  GEOTFIncident *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTFIncident;
  v3 = -[GEOTFIncident initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTFIncident;
  -[GEOTFIncident dealloc](&v3, sel_dealloc);
}

- (void)addInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 211) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOTFIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInfos_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    -[GEOTFIncident _addNoFlagsInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 208) |= 0x4000000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    *(_DWORD *)(a1 + 208) |= 0x40000000u;
  }
}

- (void)_addNoFlagsInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOTFIncident;
  -[GEOTFIncident description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTFIncident dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  const __CFString *v33;
  double v34;
  int v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  unsigned int v40;
  __CFString *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  uint64_t v50;
  __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOTFIncident readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 210) & 2) != 0)
  {
    v5 = *(_DWORD *)(a1 + 196) - 3;
    if (v5 < 0xE && ((0x3FF3u >> v5) & 1) != 0)
    {
      v6 = off_1E1C022B0[v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 196));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedInt64NSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("geoid"));

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v9 = *(id *)(a1 + 72);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v83 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v14);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("info"));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 211) & 2) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOTFIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentId_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v17 = *(id *)(a1 + 64);
  if (v17)
  {
    if (a2)
      v18 = CFSTR("incidentId");
    else
      v18 = CFSTR("incident_id");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  v19 = *(_DWORD *)(a1 + 208);
  if ((v19 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("latitude"));

    v19 = *(_DWORD *)(a1 + 208);
  }
  if ((v19 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("longitude"));

    v19 = *(_DWORD *)(a1 + 208);
  }
  if ((v19 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 112));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("startTime");
    else
      v23 = CFSTR("start_time");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

    v19 = *(_DWORD *)(a1 + 208);
  }
  if ((v19 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 128));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("updateTime");
    else
      v25 = CFSTR("update_time");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    v19 = *(_DWORD *)(a1 + 208);
  }
  if ((v19 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 200));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("blocked"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 211) & 0x10) == 0)
  {
    v27 = *(void **)(a1 + 8);
    if (v27)
    {
      v28 = v27;
      objc_sync_enter(v28);
      GEOTFIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStreet_tags);
      objc_sync_exit(v28);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v29 = *(id *)(a1 + 120);
  if (v29)
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("street"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 211) & 1) == 0)
  {
    v30 = *(void **)(a1 + 8);
    if (v30)
    {
      v31 = v30;
      objc_sync_enter(v31);
      GEOTFIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCrossStreet_tags);
      objc_sync_exit(v31);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v32 = *(id *)(a1 + 40);
  if (v32)
  {
    if (a2)
      v33 = CFSTR("crossStreet");
    else
      v33 = CFSTR("cross_street");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);
  }

  v35 = *(_DWORD *)(a1 + 208);
  if ((v35 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 168));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("laneClosureCount");
    else
      v37 = CFSTR("lane_closure_count");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 201));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("endTimeReliable");
    else
      v39 = CFSTR("end_time_reliable");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x800) != 0)
  {
    v40 = *(_DWORD *)(a1 + 172) - 1;
    if (v40 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 172));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E1C02320[v40];
    }
    if (a2)
      v42 = CFSTR("laneClosureType");
    else
      v42 = CFSTR("lane_closure_type");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 202));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("hardBlocked");
    else
      v44 = CFSTR("hard_blocked");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v46 = CFSTR("startOffset");
    else
      v46 = CFSTR("start_offset");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v48 = CFSTR("endOffset");
    else
      v48 = CFSTR("end_offset");
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x200) != 0)
  {
    LODWORD(v34) = *(_DWORD *)(a1 + 164);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("delay"));

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x4000) != 0)
  {
    v50 = *(int *)(a1 + 184);
    if (v50 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 184));
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = off_1E1C02368[v50];
    }
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("significance"));

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 180));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v53 = CFSTR("minZoomLevel");
    else
      v53 = CFSTR("min_zoom_level");
    objc_msgSend(v4, "setObject:forKey:", v52, v53);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 176));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v55 = CFSTR("maxZoomLevel");
    else
      v55 = CFSTR("max_zoom_level");
    objc_msgSend(v4, "setObject:forKey:", v54, v55);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x8000) != 0)
  {
    LODWORD(v34) = *(_DWORD *)(a1 + 188);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("speed"));

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 203));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("hidden"));

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x10000) != 0)
  {
    v58 = *(int *)(a1 + 192);
    if (v58 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 192));
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E1C02398[v58];
    }
    if (a2)
      v60 = CFSTR("trafficTrend");
    else
      v60 = CFSTR("traffic_trend");
    objc_msgSend(v4, "setObject:forKey:", v59, v60);

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 0x100) != 0)
  {
    v61 = *(int *)(a1 + 160);
    if (v61 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 160));
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = off_1E1C023B8[v61];
    }
    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("color"));

    v35 = *(_DWORD *)(a1 + 208);
  }
  if ((v35 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v64 = CFSTR("durationMin");
    else
      v64 = CFSTR("duration_min");
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 211) & 0x20) == 0)
  {
    v65 = *(void **)(a1 + 8);
    if (v65)
    {
      v66 = v65;
      objc_sync_enter(v66);
      GEOTFIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilch_tags);
      objc_sync_exit(v66);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v67 = *(id *)(a1 + 136);
  v68 = v67;
  if (v67)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v67, "base64EncodedStringWithOptions:", 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("zilch"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("zilch"));
    }
  }

  v70 = *(_DWORD *)(a1 + 208);
  if ((v70 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 156));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v72 = CFSTR("alertCCode");
    else
      v72 = CFSTR("alert_c_code");
    objc_msgSend(v4, "setObject:forKey:", v71, v72);

    v70 = *(_DWORD *)(a1 + 208);
  }
  if ((v70 & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 204));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v74 = CFSTR("navigationAlert");
    else
      v74 = CFSTR("navigation_alert");
    objc_msgSend(v4, "setObject:forKey:", v73, v74);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 211) & 8) == 0)
  {
    v75 = *(void **)(a1 + 8);
    if (v75)
    {
      v76 = v75;
      objc_sync_enter(v76);
      GEOTFIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOpenlr_tags_102);
      objc_sync_exit(v76);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v77 = *(id *)(a1 + 96);
  v78 = v77;
  if (v77)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v77, "base64EncodedStringWithOptions:", 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("openlr"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("openlr"));
    }
  }

  v80 = v4;
  return v80;
}

- (id)jsonRepresentation
{
  return -[GEOTFIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_181;
      else
        v6 = (int *)&readAll__nonRecursiveTag_182;
      GEOTFIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOTFIncidentCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $8FFB56B7DD62BB34225F045795A24924 flags;
  $8FFB56B7DD62BB34225F045795A24924 v12;
  $8FFB56B7DD62BB34225F045795A24924 v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*((_WORD *)&self->_flags + 1) & 0x7F80) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTFIncident readAll:]((uint64_t)self, 0);
    if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_geoids.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v6;
      }
      while (v6 < self->_geoids.count);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_infos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    if (self->_incidentId)
      PBDataWriterWriteStringField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
      PBDataWriterWriteInt64Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteInt64Field();
      flags = self->_flags;
    }
    if ((*(_DWORD *)&flags & 0x40000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_street)
      PBDataWriterWriteStringField();
    if (self->_crossStreet)
      PBDataWriterWriteStringField();
    v12 = self->_flags;
    if ((*(_WORD *)&v12 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x80000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x800) != 0)
    {
      PBDataWriterWriteInt32Field();
      v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v12 = self->_flags;
    }
    if ((*(_BYTE *)&v12 & 0x10) != 0)
    {
      PBDataWriterWriteDoubleField();
      v12 = self->_flags;
    }
    if ((*(_BYTE *)&v12 & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x200) != 0)
    {
      PBDataWriterWriteFloatField();
      v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x4000) != 0)
    {
      PBDataWriterWriteInt32Field();
      v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x2000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x1000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x8000) != 0)
    {
      PBDataWriterWriteFloatField();
      v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x200000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x10000) != 0)
    {
      PBDataWriterWriteInt32Field();
      v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      v12 = self->_flags;
    }
    if ((*(_BYTE *)&v12 & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_zilch)
      PBDataWriterWriteDataField();
    v13 = self->_flags;
    if ((*(_BYTE *)&v13 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      v13 = self->_flags;
    }
    if ((*(_DWORD *)&v13 & 0x400000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_openlr)
      PBDataWriterWriteDataField();
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  $8FFB56B7DD62BB34225F045795A24924 flags;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  $8FFB56B7DD62BB34225F045795A24924 v21;
  uint64_t v22;
  void *v23;
  $8FFB56B7DD62BB34225F045795A24924 v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTFIncidentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_41;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTFIncident readAll:]((uint64_t)self, 0);
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 196) = self->_type;
    *(_DWORD *)(v5 + 208) |= 0x20000u;
  }
  PBRepeatedInt64Copy();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = self->_infos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        -[GEOTFIncident addInfo:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_incidentId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(double *)(v5 + 80) = self->_latitude;
    *(_DWORD *)(v5 + 208) |= 4u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_17;
      goto LABEL_44;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_16;
  }
  *(double *)(v5 + 88) = self->_longitude;
  *(_DWORD *)(v5 + 208) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  *(_QWORD *)(v5 + 112) = self->_startTime;
  *(_DWORD *)(v5 + 208) |= 0x20u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_45:
  *(_QWORD *)(v5 + 128) = self->_updateTime;
  *(_DWORD *)(v5 + 208) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x40000) != 0)
  {
LABEL_19:
    *(_BYTE *)(v5 + 200) = self->_blocked;
    *(_DWORD *)(v5 + 208) |= 0x40000u;
  }
LABEL_20:
  v17 = -[NSString copyWithZone:](self->_street, "copyWithZone:", a3, (_QWORD)v27);
  v18 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v17;

  v19 = -[NSString copyWithZone:](self->_crossStreet, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_laneClosureCount;
    *(_DWORD *)(v5 + 208) |= 0x400u;
    v21 = self->_flags;
    if ((*(_DWORD *)&v21 & 0x80000) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v21 & 0x800) == 0)
        goto LABEL_23;
      goto LABEL_49;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
    goto LABEL_22;
  }
  *(_BYTE *)(v5 + 201) = self->_endTimeReliable;
  *(_DWORD *)(v5 + 208) |= 0x80000u;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v21 & 0x100000) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 172) = self->_laneClosureType;
  *(_DWORD *)(v5 + 208) |= 0x800u;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v21 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  *(_BYTE *)(v5 + 202) = self->_hardBlocked;
  *(_DWORD *)(v5 + 208) |= 0x100000u;
  v21 = self->_flags;
  if ((*(_BYTE *)&v21 & 0x10) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v21 & 2) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 104) = self->_startOffset;
  *(_DWORD *)(v5 + 208) |= 0x10u;
  v21 = self->_flags;
  if ((*(_BYTE *)&v21 & 2) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v21 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 56) = self->_endOffset;
  *(_DWORD *)(v5 + 208) |= 2u;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x200) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v21 & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_54;
  }
LABEL_53:
  *(float *)(v5 + 164) = self->_delay;
  *(_DWORD *)(v5 + 208) |= 0x200u;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v21 & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 184) = self->_significance;
  *(_DWORD *)(v5 + 208) |= 0x4000u;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v21 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 180) = self->_minZoomLevel;
  *(_DWORD *)(v5 + 208) |= 0x2000u;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v21 & 0x8000) == 0)
      goto LABEL_31;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v5 + 176) = self->_maxZoomLevel;
  *(_DWORD *)(v5 + 208) |= 0x1000u;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v21 & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_58;
  }
LABEL_57:
  *(float *)(v5 + 188) = self->_speed;
  *(_DWORD *)(v5 + 208) |= 0x8000u;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v21 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_59;
  }
LABEL_58:
  *(_BYTE *)(v5 + 203) = self->_hidden;
  *(_DWORD *)(v5 + 208) |= 0x200000u;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v21 & 0x100) == 0)
      goto LABEL_34;
LABEL_60:
    *(_DWORD *)(v5 + 160) = self->_color;
    *(_DWORD *)(v5 + 208) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 1) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_59:
  *(_DWORD *)(v5 + 192) = self->_trafficTrend;
  *(_DWORD *)(v5 + 208) |= 0x10000u;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x100) != 0)
    goto LABEL_60;
LABEL_34:
  if ((*(_BYTE *)&v21 & 1) != 0)
  {
LABEL_35:
    *(_QWORD *)(v5 + 48) = self->_durationMin;
    *(_DWORD *)(v5 + 208) |= 1u;
  }
LABEL_36:
  v22 = -[NSData copyWithZone:](self->_zilch, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v22;

  v24 = self->_flags;
  if ((*(_BYTE *)&v24 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 156) = self->_alertCCode;
    *(_DWORD *)(v5 + 208) |= 0x80u;
    v24 = self->_flags;
  }
  if ((*(_DWORD *)&v24 & 0x400000) != 0)
  {
    *(_BYTE *)(v5 + 204) = self->_navigationAlert;
    *(_DWORD *)(v5 + 208) |= 0x400000u;
  }
  v25 = -[NSData copyWithZone:](self->_openlr, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;
LABEL_41:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSMutableArray *infos;
  NSString *incidentId;
  $8FFB56B7DD62BB34225F045795A24924 flags;
  int v9;
  NSString *street;
  NSString *crossStreet;
  $8FFB56B7DD62BB34225F045795A24924 v12;
  int v13;
  NSData *zilch;
  char v15;
  NSData *openlr;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_140;
  -[GEOTFIncident readAll:]((uint64_t)self, 1);
  -[GEOTFIncident readAll:]((uint64_t)v4, 1);
  v5 = *((_DWORD *)v4 + 52);
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    if ((v5 & 0x20000) == 0 || self->_type != *((_DWORD *)v4 + 49))
      goto LABEL_140;
  }
  else if ((v5 & 0x20000) != 0)
  {
    goto LABEL_140;
  }
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_140;
  infos = self->_infos;
  if ((unint64_t)infos | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](infos, "isEqual:"))
      goto LABEL_140;
  }
  incidentId = self->_incidentId;
  if ((unint64_t)incidentId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](incidentId, "isEqual:"))
      goto LABEL_140;
  }
  flags = self->_flags;
  v9 = *((_DWORD *)v4 + 52);
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_latitude != *((double *)v4 + 10))
      goto LABEL_140;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_longitude != *((double *)v4 + 11))
      goto LABEL_140;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_startTime != *((_QWORD *)v4 + 14))
      goto LABEL_140;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_updateTime != *((_QWORD *)v4 + 16))
      goto LABEL_140;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0)
      goto LABEL_140;
    if (self->_blocked)
    {
      if (!*((_BYTE *)v4 + 200))
        goto LABEL_140;
    }
    else if (*((_BYTE *)v4 + 200))
    {
      goto LABEL_140;
    }
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_140;
  }
  street = self->_street;
  if ((unint64_t)street | *((_QWORD *)v4 + 15) && !-[NSString isEqual:](street, "isEqual:"))
    goto LABEL_140;
  crossStreet = self->_crossStreet;
  if ((unint64_t)crossStreet | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](crossStreet, "isEqual:"))
      goto LABEL_140;
  }
  v12 = self->_flags;
  v13 = *((_DWORD *)v4 + 52);
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_laneClosureCount != *((_DWORD *)v4 + 42))
      goto LABEL_140;
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
    if ((v13 & 0x80000) == 0)
      goto LABEL_140;
    if (self->_endTimeReliable)
    {
      if (!*((_BYTE *)v4 + 201))
        goto LABEL_140;
    }
    else if (*((_BYTE *)v4 + 201))
    {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x80000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
    if ((v13 & 0x800) == 0 || self->_laneClosureType != *((_DWORD *)v4 + 43))
      goto LABEL_140;
  }
  else if ((v13 & 0x800) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    if ((v13 & 0x100000) == 0)
      goto LABEL_140;
    if (self->_hardBlocked)
    {
      if (!*((_BYTE *)v4 + 202))
        goto LABEL_140;
    }
    else if (*((_BYTE *)v4 + 202))
    {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x100000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_startOffset != *((double *)v4 + 13))
      goto LABEL_140;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_endOffset != *((double *)v4 + 7))
      goto LABEL_140;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_delay != *((float *)v4 + 41))
      goto LABEL_140;
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0 || self->_significance != *((_DWORD *)v4 + 46))
      goto LABEL_140;
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    if ((v13 & 0x2000) == 0 || self->_minZoomLevel != *((_DWORD *)v4 + 45))
      goto LABEL_140;
  }
  else if ((v13 & 0x2000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0 || self->_maxZoomLevel != *((_DWORD *)v4 + 44))
      goto LABEL_140;
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    if ((v13 & 0x8000) == 0 || self->_speed != *((float *)v4 + 47))
      goto LABEL_140;
  }
  else if ((v13 & 0x8000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x200000) != 0)
  {
    if ((v13 & 0x200000) == 0)
      goto LABEL_140;
    if (self->_hidden)
    {
      if (!*((_BYTE *)v4 + 203))
        goto LABEL_140;
    }
    else if (*((_BYTE *)v4 + 203))
    {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x200000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    if ((v13 & 0x10000) == 0 || self->_trafficTrend != *((_DWORD *)v4 + 48))
      goto LABEL_140;
  }
  else if ((v13 & 0x10000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_color != *((_DWORD *)v4 + 40))
      goto LABEL_140;
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_durationMin != *((_QWORD *)v4 + 6))
      goto LABEL_140;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_140;
  }
  zilch = self->_zilch;
  if ((unint64_t)zilch | *((_QWORD *)v4 + 17))
  {
    if (!-[NSData isEqual:](zilch, "isEqual:"))
      goto LABEL_140;
    v12 = self->_flags;
    v13 = *((_DWORD *)v4 + 52);
  }
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_alertCCode != *((_DWORD *)v4 + 39))
      goto LABEL_140;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
    if ((v13 & 0x400000) == 0)
      goto LABEL_146;
LABEL_140:
    v15 = 0;
    goto LABEL_141;
  }
  if ((v13 & 0x400000) == 0)
    goto LABEL_140;
  if (!self->_navigationAlert)
  {
    if (!*((_BYTE *)v4 + 204))
      goto LABEL_146;
    goto LABEL_140;
  }
  if (!*((_BYTE *)v4 + 204))
    goto LABEL_140;
LABEL_146:
  openlr = self->_openlr;
  if ((unint64_t)openlr | *((_QWORD *)v4 + 12))
    v15 = -[NSData isEqual:](openlr, "isEqual:");
  else
    v15 = 1;
LABEL_141:

  return v15;
}

- (unint64_t)hash
{
  $8FFB56B7DD62BB34225F045795A24924 flags;
  unint64_t v4;
  double latitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double longitude;
  double v11;
  long double v12;
  double v13;
  $8FFB56B7DD62BB34225F045795A24924 v14;
  double startOffset;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  double endOffset;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  float delay;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  float speed;
  double v32;
  long double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  $8FFB56B7DD62BB34225F045795A24924 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSUInteger v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  NSUInteger v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  -[GEOTFIncident readAll:]((uint64_t)self, 1);
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
    v62 = 2654435761 * self->_type;
  else
    v62 = 0;
  v61 = PBRepeatedInt64Hash();
  v60 = -[NSMutableArray hash](self->_infos, "hash");
  v59 = -[NSString hash](self->_incidentId, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    latitude = self->_latitude;
    v6 = -latitude;
    if (latitude >= 0.0)
      v6 = self->_latitude;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    longitude = self->_longitude;
    v11 = -longitude;
    if (longitude >= 0.0)
      v11 = self->_longitude;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    v57 = 2654435761 * self->_startTime;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_22;
  }
  else
  {
    v57 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
LABEL_22:
      v56 = 2654435761 * self->_updateTime;
      goto LABEL_25;
    }
  }
  v56 = 0;
LABEL_25:
  v58 = v9;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
    v55 = 2654435761 * self->_blocked;
  else
    v55 = 0;
  v54 = -[NSString hash](self->_street, "hash");
  v53 = -[NSString hash](self->_crossStreet, "hash");
  v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    v52 = 2654435761 * self->_laneClosureCount;
    if ((*(_DWORD *)&v14 & 0x80000) != 0)
    {
LABEL_30:
      v51 = 2654435761 * self->_endTimeReliable;
      if ((*(_WORD *)&v14 & 0x800) != 0)
        goto LABEL_31;
      goto LABEL_39;
    }
  }
  else
  {
    v52 = 0;
    if ((*(_DWORD *)&v14 & 0x80000) != 0)
      goto LABEL_30;
  }
  v51 = 0;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_31:
    v50 = 2654435761 * self->_laneClosureType;
    if ((*(_DWORD *)&v14 & 0x100000) != 0)
      goto LABEL_32;
LABEL_40:
    v49 = 0;
    if ((*(_BYTE *)&v14 & 0x10) != 0)
      goto LABEL_33;
LABEL_41:
    v19 = 0;
    goto LABEL_44;
  }
LABEL_39:
  v50 = 0;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
    goto LABEL_40;
LABEL_32:
  v49 = 2654435761 * self->_hardBlocked;
  if ((*(_BYTE *)&v14 & 0x10) == 0)
    goto LABEL_41;
LABEL_33:
  startOffset = self->_startOffset;
  v16 = -startOffset;
  if (startOffset >= 0.0)
    v16 = self->_startOffset;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_44:
  if ((*(_BYTE *)&v14 & 2) != 0)
  {
    endOffset = self->_endOffset;
    v22 = -endOffset;
    if (endOffset >= 0.0)
      v22 = self->_endOffset;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    delay = self->_delay;
    v27 = delay;
    if (delay < 0.0)
      v27 = -delay;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
    v47 = 0;
    if ((*(_WORD *)&v14 & 0x2000) != 0)
      goto LABEL_62;
LABEL_65:
    v46 = 0;
    if ((*(_WORD *)&v14 & 0x1000) != 0)
      goto LABEL_63;
    goto LABEL_66;
  }
  v47 = 2654435761 * self->_significance;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
    goto LABEL_65;
LABEL_62:
  v46 = 2654435761 * self->_minZoomLevel;
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
LABEL_63:
    v45 = 2654435761 * self->_maxZoomLevel;
    goto LABEL_67;
  }
LABEL_66:
  v45 = 0;
LABEL_67:
  v48 = v19;
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    speed = self->_speed;
    v32 = speed;
    if (speed < 0.0)
      v32 = -speed;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    v43 = 2654435761 * self->_hidden;
    if ((*(_DWORD *)&v14 & 0x10000) != 0)
    {
LABEL_77:
      v35 = 2654435761 * self->_trafficTrend;
      if ((*(_WORD *)&v14 & 0x100) != 0)
        goto LABEL_78;
LABEL_82:
      v36 = 0;
      if ((*(_BYTE *)&v14 & 1) != 0)
        goto LABEL_79;
      goto LABEL_83;
    }
  }
  else
  {
    v43 = 0;
    if ((*(_DWORD *)&v14 & 0x10000) != 0)
      goto LABEL_77;
  }
  v35 = 0;
  if ((*(_WORD *)&v14 & 0x100) == 0)
    goto LABEL_82;
LABEL_78:
  v36 = 2654435761 * self->_color;
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
LABEL_79:
    v37 = 2654435761u * self->_durationMin;
    goto LABEL_84;
  }
LABEL_83:
  v37 = 0;
LABEL_84:
  v38 = -[NSData hash](self->_zilch, "hash", v43);
  v39 = self->_flags;
  if ((*(_BYTE *)&v39 & 0x80) != 0)
  {
    v40 = 2654435761 * self->_alertCCode;
    if ((*(_DWORD *)&v39 & 0x400000) != 0)
      goto LABEL_86;
LABEL_88:
    v41 = 0;
    return v61 ^ v62 ^ v60 ^ v59 ^ v4 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v20 ^ v25 ^ v47 ^ v46 ^ v45 ^ v30 ^ v44 ^ v35 ^ v36 ^ v37 ^ v38 ^ v40 ^ v41 ^ -[NSData hash](self->_openlr, "hash");
  }
  v40 = 0;
  if ((*(_DWORD *)&v39 & 0x400000) == 0)
    goto LABEL_88;
LABEL_86:
  v41 = 2654435761 * self->_navigationAlert;
  return v61 ^ v62 ^ v60 ^ v59 ^ v4 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v20 ^ v25 ^ v47 ^ v46 ^ v45 ^ v30 ^ v44 ^ v35 ^ v36 ^ v37 ^ v38 ^ v40 ^ v41 ^ -[NSData hash](self->_openlr, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilch, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_openlr, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_crossStreet, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
