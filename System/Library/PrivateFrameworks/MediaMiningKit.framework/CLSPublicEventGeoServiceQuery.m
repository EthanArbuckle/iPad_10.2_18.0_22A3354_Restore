@implementation CLSPublicEventGeoServiceQuery

- (CLSPublicEventGeoServiceQuery)initWithTimeLocationTuples:(id)a3 radius:(double)a4
{
  id v7;
  CLSPublicEventGeoServiceQuery *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *geoQueue;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  GEOMapServiceSpatialEventLookupTicket *ticket;
  void *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSPublicEventGeoServiceQuery;
  v8 = -[CLSPublicEventGeoServiceQuery init](&v20, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.photos.mediamining.georequest.publicevent", v9);
    geoQueue = v8->_geoQueue;
    v8->_geoQueue = (OS_dispatch_queue *)v10;

    v8->_isCancelled = 0;
    objc_storeStrong((id *)&v8->_timeLocationTuples, a3);
    v8->_radius = a4;
    -[CLSPublicEventGeoServiceQuery _parametersByTimeLocationTupleIdentifierForTimeLocationTuples:](v8, "_parametersByTimeLocationTupleIdentifierForTimeLocationTuples:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_parametersByTimeLocationTupleIdentifier, v12);
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ticketForSpatialEventLookupParameters:traits:", v13, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    ticket = v8->_ticket;
    v8->_ticket = (GEOMapServiceSpatialEventLookupTicket *)v15;

    if (!v8->_ticket)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v13;
        v23 = 2112;
        v24 = v7;
        _os_log_error_impl(&dword_1CAB79000, v18, OS_LOG_TYPE_ERROR, "[EventsFetch] Cannot create ticket for parameters %@, tuples %@", buf, 0x16u);
      }

      v8 = 0;
    }

  }
  return v8;
}

- (void)submitWithHandler:(id)a3
{
  id v4;
  GEOMapServiceSpatialEventLookupTicket *ticket;
  OS_dispatch_queue *geoQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  ticket = self->_ticket;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke;
  v8[3] = &unk_1E84F8528;
  v8[4] = self;
  v9 = v4;
  geoQueue = self->_geoQueue;
  v7 = v4;
  -[GEOMapServiceSpatialEventLookupTicket submitWithHandler:queue:](ticket, "submitWithHandler:queue:", v8, geoQueue);

}

- (void)cancel
{
  self->_isCancelled = 1;
  -[GEOMapServiceSpatialEventLookupTicket cancel](self->_ticket, "cancel");
}

- (void)prepareForRetry
{
  void *v3;
  GEOMapServiceSpatialEventLookupTicket *v4;
  GEOMapServiceSpatialEventLookupTicket *ticket;
  id v6;

  self->_isCancelled = 0;
  -[NSDictionary allValues](self->_parametersByTimeLocationTupleIdentifier, "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ticketForSpatialEventLookupParameters:traits:", v6, 0);
  v4 = (GEOMapServiceSpatialEventLookupTicket *)objc_claimAutoreleasedReturnValue();
  ticket = self->_ticket;
  self->_ticket = v4;

}

- (id)_publicEventsForGeoEvent:(id)a3 matchingParameters:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  void *v14;
  CLSPublicEventCategory *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  CLSPublicEventPerformer *v32;
  void *v33;
  void *v34;
  CLSPublicEventPerformer *v35;
  CLLocationDegrees v36;
  CLLocationDegrees v37;
  CLLocationCoordinate2D v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, double, double);
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id obj;
  uint64_t v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  CLLocationCoordinate2D v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  uint8_t v126[128];
  uint8_t buf[4];
  id v128;
  __int16 v129;
  uint64_t v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v88 = a4;
  objc_msgSend(v5, "categories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_msgSend(v5, "localizedName");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v5;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v8, "muid");

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
  v96 = v7;
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v99 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v122 != v99)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
        objc_msgSend(v13, "category");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[CLSPublicEventCategory initWithCategory:]([CLSPublicEventCategory alloc], "initWithCategory:", v14);
        objc_msgSend(v13, "localizedNames");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        objc_msgSend(v16, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSPublicEventCategory setLocalizedName:](v15, "setLocalizedName:", v18);

        v19 = v17 - 1;
        if (v17 <= 1)
        {
          -[CLSPublicEventCategory setLocalizedSubcategories:](v15, "setLocalizedSubcategories:", MEMORY[0x1E0C9AA60], v19);
        }
        else
        {
          objc_msgSend(v16, "subarrayWithRange:", 1, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLSPublicEventCategory setLocalizedSubcategories:](v15, "setLocalizedSubcategories:", v20);

        }
        objc_msgSend(v7, "addObject:", v15);
        +[CLSPublicEventCategory festivalsAndFairs](CLSPublicEventCategory, "festivalsAndFairs");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v21) & 1) != 0)
        {
          v22 = 1;
        }
        else
        {
          +[CLSPublicEventCategory appleEvents](CLSPublicEventCategory, "appleEvents");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v14, "isEqualToString:", v23);

          v7 = v96;
        }

        v11 |= v22;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v94, "performers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v26 = v24;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v118;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v118 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
        v32 = [CLSPublicEventPerformer alloc];
        objc_msgSend(v31, "localizedName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "iTunesIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[CLSPublicEventPerformer initWithLocalizedName:iTunesIdentifier:](v32, "initWithLocalizedName:iTunesIdentifier:", v33, v34);

        objc_msgSend(v25, "addObject:", v35);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
    }
    while (v28);
  }

  objc_msgSend(v94, "centerCoordinate");
  v38 = CLLocationCoordinate2DMake(v36, v37);
  objc_msgSend(v94, "hours");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "timeZone");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "loggingConnection");
    v41 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAB79000, v41, OS_LOG_TYPE_ERROR, "[EventsFetch] Time Zone is nil on GeoEvent. Using GMT as fallback", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __77__CLSPublicEventGeoServiceQuery__publicEventsForGeoEvent_matchingParameters___block_invoke;
  v109[3] = &unk_1E84F8550;
  v115 = v90;
  v89 = v92;
  v110 = v89;
  v42 = v39;
  v111 = v42;
  v86 = v96;
  v112 = v86;
  v85 = v25;
  v113 = v85;
  v116 = v38;
  v82 = v94;
  v114 = v82;
  v43 = (void (**)(_QWORD, _QWORD, double, double))MEMORY[0x1D1796244](v109);
  objc_msgSend(v88, "dateInterval");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "startDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar localDateFromUniversalDate:inTimeZone:](CLSCalendar, "localDateFromUniversalDate:inTimeZone:", v45, v42);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", v46);
  v47 = objc_claimAutoreleasedReturnValue();

  v84 = v44;
  objc_msgSend(v44, "endDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v42;
  +[CLSCalendar localDateFromUniversalDate:inTimeZone:](CLSCalendar, "localDateFromUniversalDate:inTimeZone:", v48, v42);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar endOfDayForDate:](CLSCalendar, "endOfDayForDate:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "laterDate:", v47);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v48) = objc_msgSend(v51, "isEqualToDate:", v47);

  v83 = (void *)v47;
  if ((_DWORD)v48)
  {
    v52 = v86;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v128 = v89;
      v129 = 2048;
      v130 = v90;
      v131 = 2112;
      v132 = v47;
      v133 = 2112;
      v134 = v50;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[EventsFetch] Cannot ingest event %{public}@ with muid %lu. Parameters start date %@ cannot be later in time than end date %@.", buf, 0x2Au);
    }
    v53 = (id)MEMORY[0x1E0C9AA60];
    v55 = v81;
    v54 = v82;
    v56 = v87;
    goto LABEL_60;
  }
  v80 = v26;
  v79 = v50;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v47, v50);
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v58 = v87;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
  if (!v59)
    goto LABEL_55;
  v60 = v59;
  v61 = *(_QWORD *)v106;
  v93 = v58;
  v95 = v57;
  v91 = *(_QWORD *)v106;
  do
  {
    v62 = 0;
    v97 = v60;
    do
    {
      if (*(_QWORD *)v106 != v61)
        objc_enumerationMutation(v58);
      v63 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v62);
      objc_msgSend(v63, "dateInterval");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v64, "intersectsDateInterval:", v57))
      {
        objc_msgSend(v63, "hours");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v65, "count"))
        {
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v100 = v65;
          v66 = v65;
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
          if (v67)
          {
            v68 = v67;
            v69 = *(_QWORD *)v102;
            do
            {
              for (k = 0; k != v68; ++k)
              {
                if (*(_QWORD *)v102 != v69)
                  objc_enumerationMutation(v66);
                v71 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
                objc_msgSend(v71, "startTime");
                v73 = v72;
                objc_msgSend(v71, "endTime");
                ((void (**)(_QWORD, void *, double, double))v43)[2](v43, v64, v73, v74);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "addObject:", v75);

              }
              v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
            }
            while (v68);
            v58 = v93;
            v57 = v95;
            v61 = v91;
          }
          v65 = v100;
          goto LABEL_51;
        }
        if ((v11 & 1) != 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v128 = v89;
            v129 = 2048;
            v130 = v90;
            _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[EventsFetch] Event %{public}@ with muid %lu contains no hours. Will use full day as hours.", buf, 0x16u);
          }
          ((void (**)(_QWORD, void *, double, double))v43)[2](v43, v64, 0.0, 86400.0);
          v66 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v66);
LABEL_51:

          v60 = v97;
        }

      }
      ++v62;
    }
    while (v62 != v60);
    v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
  }
  while (v60);
LABEL_55:

  v50 = v79;
  v26 = v80;
  v56 = v87;
  v52 = v86;
  if ((unint64_t)objc_msgSend(v53, "count") >= 2)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "loggingConnection");
    v77 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v128 = v53;
      _os_log_impl(&dword_1CAB79000, v77, OS_LOG_TYPE_INFO, "Created more than one public event for Geo event. %@", buf, 0xCu);
    }

  }
  v55 = v81;
  v54 = v82;
LABEL_60:

  return v53;
}

- (id)_parametersByTimeLocationTupleIdentifierForTimeLocationTuples:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  +[CLSPublicEvent supportedCategories](CLSPublicEvent, "supportedCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "coordinates");
        v14 = v13;
        v16 = v15;
        v17 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v12, "expandedStartDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "expandedEndDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27560]), "initWithCoordinate:radius:categories:dateInterval:", v7, v20, v14, v16, self->_radius);
        objc_msgSend(v12, "timeLocationIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, v22);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v5;
}

- (NSArray)timeLocationTuples
{
  return self->_timeLocationTuples;
}

- (double)radius
{
  return self->_radius;
}

- (NSDictionary)parametersByTimeLocationTupleIdentifier
{
  return self->_parametersByTimeLocationTupleIdentifier;
}

- (GEOMapServiceSpatialEventLookupTicket)ticket
{
  return self->_ticket;
}

- (NSDictionary)resolvedPublicEventsForTimeLocationTuples
{
  return self->_resolvedPublicEventsForTimeLocationTuples;
}

- (void)setResolvedPublicEventsForTimeLocationTuples:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPublicEventsForTimeLocationTuples, a3);
}

- (NSDictionary)invalidationTokens
{
  return self->_invalidationTokens;
}

- (void)setInvalidationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationTokens, a3);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (OS_dispatch_queue)geoQueue
{
  return self->_geoQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoQueue, 0);
  objc_storeStrong((id *)&self->_invalidationTokens, 0);
  objc_storeStrong((id *)&self->_resolvedPublicEventsForTimeLocationTuples, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_parametersByTimeLocationTupleIdentifier, 0);
  objc_storeStrong((id *)&self->_timeLocationTuples, 0);
}

CLSPublicEvent *__77__CLSPublicEventGeoServiceQuery__publicEventsForGeoEvent_matchingParameters___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  CLSPublicEvent *v8;
  void *v9;
  void *v10;

  v7 = a2;
  v8 = objc_alloc_init(CLSPublicEvent);
  -[CLSPublicEvent setMuid:](v8, "setMuid:", *(_QWORD *)(a1 + 72));
  -[CLSPublicEvent setName:](v8, "setName:", *(_QWORD *)(a1 + 32));
  -[CLSPublicEvent setLocalDateInterval:](v8, "setLocalDateInterval:", v7);

  -[CLSPublicEvent setLocalStartTime:](v8, "setLocalStartTime:", a3);
  -[CLSPublicEvent setLocalEndTime:](v8, "setLocalEndTime:", a4);
  -[CLSPublicEvent setTimeZone:](v8, "setTimeZone:", *(_QWORD *)(a1 + 40));
  -[CLSPublicEvent setCategories:](v8, "setCategories:", *(_QWORD *)(a1 + 48));
  -[CLSPublicEvent setPerformers:](v8, "setPerformers:", *(_QWORD *)(a1 + 56));
  -[CLSPublicEvent setBusinessItemCoordinates:](v8, "setBusinessItemCoordinates:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 64), "relatedPOIIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSPublicEvent setBusinessItemMuid:](v8, "setBusinessItemMuid:", objc_msgSend(v10, "muid"));

  -[CLSPublicEvent setExpectedAttendance:](v8, "setExpectedAttendance:", objc_msgSend(*(id *)(a1 + 64), "expectedAttendance"));
  return v8;
}

void __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "code") != -8)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "timeLocationTuples");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412547;
    v18 = v7;
    v19 = 2113;
    v20 = v10;
    _os_log_error_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_ERROR, "[EventsFetch] Error fetching public events: %@. timeLocationTuples %{private}@", buf, 0x16u);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "parametersByTimeLocationTupleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSObject count](v8, "count"));
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke_6;
    v13[3] = &unk_1E84F8500;
    v14 = v5;
    v15 = v9;
    v16 = *(_QWORD *)(a1 + 32);
    v11 = v9;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_msgSend(*(id *)(a1 + 32), "setResolvedPublicEventsForTimeLocationTuples:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setInvalidationTokens:", v10);

  }
LABEL_6:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "poiEventsForSpatialLookupParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(a1[6], "_publicEventsForGeoEvent:matchingParameters:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), v6, (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v9, v5, (_QWORD)v16);

}

+ (unint64_t)maximumBatchSize
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxParametersCountForSpatialEventLookup");

  return v3;
}

@end
