@implementation MNDisplayETAInfo

+ (id)displayETAInfoForRouteInfo:(id)a3 routeCoordinate:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  char v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  MNDisplayETALegInfo *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void (**v45)(_QWORD, _QWORD, double);
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t i;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  NSObject *v63;
  MNDisplayETAInfo *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v80;
  MNDisplayETALegInfo *v81;
  char v82;
  NSObject *v83;
  void *v84;
  id v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "legIndexForRouteCoordinate:", a4);

  v91 = -1;
  objc_msgSend(v5, "etaRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverDisplayETA");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  v10 = (void *)v9;
  objc_msgSend(v8, "legs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "originalLegIndex");

  if (v13 != v7)
    goto LABEL_6;
  GEOConfigGetDouble();
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;

  objc_msgSend(v8, "responseDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v21 = v15 + v20;

  if (v18 < v21)
  {
    objc_msgSend(v8, "serverDisplayETA");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceNow");
    v24 = v23;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v26 = floor(v25 / 60.0);
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v28 = (unint64_t)(floor(v27 / 60.0) - v26);
    v91 = v28;
    v29 = 1;
    if (!v22)
      goto LABEL_12;
  }
  else
  {
LABEL_6:
    objc_msgSend(v5, "route");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "etaRoute");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "remainingTimeToEndOfCurrentLegFrom:etaRoute:", a4, v31);
    v24 = v32;

    v90 = 0;
    MNDisplayETAAndRemainingMinutes(&v90, &v91, v24);
    v22 = v90;
    v29 = 0;
    v28 = v91;
    if (!v22)
      goto LABEL_12;
  }
  if (v28 != -1)
  {
    v82 = v29;
    objc_msgSend(v5, "route");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "legs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "destination");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timezone");
    v37 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MNDisplayETALegInfo);
    v84 = v35;
    objc_msgSend(v35, "destination");
    v40 = v8;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "uniqueID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNDisplayETALegInfo setWaypointID:](v39, "setWaypointID:", v42);

    -[MNDisplayETALegInfo setLegIndex:](v39, "setLegIndex:", v7);
    -[MNDisplayETALegInfo setRemainingMinutes:](v39, "setRemainingMinutes:", v91);
    v85 = v22;
    -[MNDisplayETALegInfo setEta:](v39, "setEta:", v22);
    v83 = v37;
    -[MNDisplayETALegInfo setTimeZone:](v39, "setTimeZone:", v37);
    objc_msgSend(v38, "addObject:", v39);
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __63__MNDisplayETAInfo_displayETAInfoForRouteInfo_routeCoordinate___block_invoke;
    v87[3] = &unk_1E61D7DE0;
    v43 = v5;
    v88 = v43;
    v44 = v38;
    v89 = v44;
    v45 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x1B5E0E364](v87);
    v86 = v40;
    if (v40)
    {
      objc_msgSend(v43, "route");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "legs");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v47, "count");
      objc_msgSend(v43, "etaRoute");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "legs");
      v49 = v44;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v39;
      v51 = v5;
      v52 = objc_msgSend(v50, "count");

      v44 = v49;
      v53 = v7 - v80 + v52;
      v5 = v51;
      v39 = v81;
      for (i = v53 + 1; ; ++i)
      {
        objc_msgSend(v43, "etaRoute");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "legs");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count");

        if (i >= v57)
          break;
        objc_msgSend(v43, "etaRoute");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "legs");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", i);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "travelDuration");
        v24 = v24 + v61;
        v45[2](v45, objc_msgSend(v60, "originalLegIndex"), v24);

      }
    }
    else
    {
      v65 = v7 + 1;
      objc_msgSend(v43, "route");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "legs");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "count");

      while (v65 < v68)
      {
        objc_msgSend(v43, "route");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "legs");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectAtIndexedSubscript:", v65);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v71, "travelDuration");
        v24 = v24 + v72;
        v45[2](v45, v65, v24);

        ++v65;
        objc_msgSend(v43, "route");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "legs");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v74, "count");

      }
    }
    v64 = objc_alloc_init(MNDisplayETAInfo);
    objc_msgSend(v43, "routeID");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNDisplayETAInfo setRouteID:](v64, "setRouteID:", v75);

    -[MNDisplayETAInfo setLegInfos:](v64, "setLegInfos:", v44);
    objc_msgSend(v44, "lastObject");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNDisplayETAInfo setRemainingMinutesToEndOfRoute:](v64, "setRemainingMinutesToEndOfRoute:", objc_msgSend(v76, "remainingMinutes"));

    objc_msgSend(v44, "lastObject");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "eta");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNDisplayETAInfo setEtaToEndOfRoute:](v64, "setEtaToEndOfRoute:", v78);

    v64->_isUsingServerDisplayETA = v82;
    v22 = v85;
    v8 = v86;
    v63 = v83;
    v62 = v84;
    goto LABEL_19;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got an invalid display ETA to end of leg : %@ %llu"), v22, v28);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v93 = "+[MNDisplayETAInfo displayETAInfoForRouteInfo:routeCoordinate:]";
    v94 = 2080;
    v95 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNDisplayETAInfo.m";
    v96 = 1024;
    v97 = 129;
    v98 = 2080;
    v99 = "NO";
    v100 = 2112;
    v101 = v62;
    _os_log_impl(&dword_1B0AD7000, v63, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }
  v64 = 0;
LABEL_19:

  return v64;
}

void __63__MNDisplayETAInfo_displayETAInfoForRouteInfo_routeCoordinate___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MNDisplayETALegInfo *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v14 = 0;
  v15 = -1;
  MNDisplayETAAndRemainingMinutes(&v14, &v15, a3);
  v5 = v14;
  objc_msgSend(*(id *)(a1 + 32), "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timezone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MNDisplayETALegInfo);
  objc_msgSend(v8, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNDisplayETALegInfo setWaypointID:](v11, "setWaypointID:", v13);

  -[MNDisplayETALegInfo setLegIndex:](v11, "setLegIndex:", a2);
  -[MNDisplayETALegInfo setRemainingMinutes:](v11, "setRemainingMinutes:", v15);
  -[MNDisplayETALegInfo setEta:](v11, "setEta:", v5);
  -[MNDisplayETALegInfo setTimeZone:](v11, "setTimeZone:", v10);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDisplayETAInfo)initWithCoder:(id)a3
{
  id v4;
  MNDisplayETAInfo *v5;
  uint64_t v6;
  NSUUID *routeID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *legInfos;
  uint64_t v13;
  NSDate *etaToEndOfRoute;
  MNDisplayETAInfo *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MNDisplayETAInfo;
  v5 = -[MNDisplayETAInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeID"));
    v6 = objc_claimAutoreleasedReturnValue();
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_legInfos"));
    v11 = objc_claimAutoreleasedReturnValue();
    legInfos = v5->_legInfos;
    v5->_legInfos = (NSArray *)v11;

    v5->_remainingMinutesToEndOfRoute = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_remainingMinutesToEndOfRoute"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etaToEndOfRoute"));
    v13 = objc_claimAutoreleasedReturnValue();
    etaToEndOfRoute = v5->_etaToEndOfRoute;
    v5->_etaToEndOfRoute = (NSDate *)v13;

    v5->_isUsingServerDisplayETA = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isUsingServerDisplayETA"));
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *routeID;
  id v5;

  routeID = self->_routeID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", routeID, CFSTR("_routeID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_legInfos, CFSTR("_legInfos"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remainingMinutesToEndOfRoute, CFSTR("_remainingMinutesToEndOfRoute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_etaToEndOfRoute, CFSTR("_etaToEndOfRoute"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUsingServerDisplayETA, CFSTR("_isUsingServerDisplayETA"));

}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[MNDisplayETAInfo dateFormatter](MNDisplayETAInfo, "dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_legInfos, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_legInfos;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_etaToEndOfRoute);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ | endOfRoute: %@ / %d min"), v12, v13, self->_remainingMinutesToEndOfRoute);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSArray *legInfos;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)v5[2];
    v7 = self->_routeID;
    v8 = v6;
    if ((!(v7 | v8)
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10))
      && self->_remainingMinutesToEndOfRoute == v5[3]
      && +[MNDisplayETAInfo isDisplayDate:equalTo:](MNDisplayETAInfo, "isDisplayDate:equalTo:", self->_etaToEndOfRoute, v5[4]))
    {
      legInfos = self->_legInfos;
      v12 = v5[1];
      v13 = legInfos;
      v14 = v13;
      if ((unint64_t)v13 | v12)
        v15 = objc_msgSend(v13, "isEqual:", v12);
      else
        v15 = 1;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)isDisplayDate:(id)a3 equalTo:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compareDate:toDate:toUnitGranularity:", v5, v7, 64);

      v8 = v10 == 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)dateFormatter
{
  if (qword_1ED0C40F0 != -1)
    dispatch_once(&qword_1ED0C40F0, &__block_literal_global_45);
  return (id)_MergedGlobals_45;
}

uint64_t __33__MNDisplayETAInfo_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_45;
  _MergedGlobals_45 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_45, "setDateStyle:", 0);
  return objc_msgSend((id)_MergedGlobals_45, "setTimeStyle:", 1);
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (NSArray)legInfos
{
  return self->_legInfos;
}

- (void)setLegInfos:(id)a3
{
  objc_storeStrong((id *)&self->_legInfos, a3);
}

- (unint64_t)remainingMinutesToEndOfRoute
{
  return self->_remainingMinutesToEndOfRoute;
}

- (void)setRemainingMinutesToEndOfRoute:(unint64_t)a3
{
  self->_remainingMinutesToEndOfRoute = a3;
}

- (NSDate)etaToEndOfRoute
{
  return self->_etaToEndOfRoute;
}

- (void)setEtaToEndOfRoute:(id)a3
{
  objc_storeStrong((id *)&self->_etaToEndOfRoute, a3);
}

- (BOOL)isUsingServerDisplayETA
{
  return self->_isUsingServerDisplayETA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaToEndOfRoute, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_legInfos, 0);
}

- (unint64_t)displayRemainingMinutesToEndOfLeg
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MNDisplayETAInfo legInfos](self, "legInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "remainingMinutes");

  return v4;
}

- (NSDate)displayETAToEndOfLeg
{
  void *v2;
  void *v3;
  void *v4;

  -[MNDisplayETAInfo legInfos](self, "legInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (unint64_t)legIndex
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MNDisplayETAInfo legInfos](self, "legInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[MNDisplayETAInfo legInfos](self, "legInfos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "legIndex");

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (MNDisplayETAInfo)initWithDisplayETAToEndOfLeg:(id)a3 displayRemainingMinutesToEndOfLeg:(unint64_t)a4 displayETAToEndOfRoute:(id)a5 displayRemainingMinutesToEndOfRoute:(unint64_t)a6
{
  id v9;
  MNDisplayETAInfo *v10;
  MNDisplayETAInfo *v11;
  MNDisplayETAInfo *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MNDisplayETAInfo;
  v10 = -[MNDisplayETAInfo init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_remainingMinutesToEndOfRoute = a6;
    objc_storeStrong((id *)&v10->_etaToEndOfRoute, a5);
    v12 = v11;
  }

  return v11;
}

@end
