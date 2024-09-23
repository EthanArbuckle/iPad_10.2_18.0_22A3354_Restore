@implementation MapsSuggestionsETA

- (MapsSuggestionsETA)initWithSeconds:(double)a3 shortTrafficString:(id)a4 longTrafficString:(id)a5 writtenRouteName:(id)a6 spokenRouteName:(id)a7 transportType:(int)a8 location:(id)a9 time:(id)a10 originator:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MapsSuggestionsETA *v25;
  MapsSuggestionsETA *v26;
  uint64_t v27;
  NSString *shortTrafficString;
  uint64_t v29;
  NSString *longTrafficString;
  uint64_t v31;
  NSString *writtenRouteName;
  uint64_t v33;
  NSString *spokenRouteName;
  uint64_t v35;
  CLLocation *location;
  uint64_t v37;
  NSDate *time;
  uint64_t v39;
  NSString *originator;
  MapsSuggestionsETA *v41;
  NSObject *v42;
  objc_super v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  if (!v22)
  {
    GEOFindOrCreateLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      v47 = 1024;
      v48 = 70;
      v49 = 2082;
      v50 = "-[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:t"
            "ransportType:location:time:originator:]";
      v51 = 2082;
      v52 = "nil == (location)";
      _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires location", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v23)
  {
    GEOFindOrCreateLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      v47 = 1024;
      v48 = 71;
      v49 = 2082;
      v50 = "-[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:t"
            "ransportType:location:time:originator:]";
      v51 = 2082;
      v52 = "nil == (time)";
      _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires time", buf, 0x26u);
    }
LABEL_11:

    v41 = 0;
    goto LABEL_12;
  }
  v44.receiver = self;
  v44.super_class = (Class)MapsSuggestionsETA;
  v25 = -[MapsSuggestionsETA init](&v44, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_seconds = a3;
    v27 = objc_msgSend(v18, "copy");
    shortTrafficString = v26->_shortTrafficString;
    v26->_shortTrafficString = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    longTrafficString = v26->_longTrafficString;
    v26->_longTrafficString = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    writtenRouteName = v26->_writtenRouteName;
    v26->_writtenRouteName = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    spokenRouteName = v26->_spokenRouteName;
    v26->_spokenRouteName = (NSString *)v33;

    v26->_transportType = a8;
    v35 = objc_msgSend(v22, "copy");
    location = v26->_location;
    v26->_location = (CLLocation *)v35;

    v37 = objc_msgSend(v23, "copy");
    time = v26->_time;
    v26->_time = (NSDate *)v37;

    v39 = objc_msgSend(v24, "copy");
    originator = v26->_originator;
    v26->_originator = (NSString *)v39;

  }
  self = v26;
  v41 = self;
LABEL_12:

  return v41;
}

- (MapsSuggestionsETA)initWithSeconds:(double)a3 shortTrafficString:(id)a4 longTrafficString:(id)a5 writtenRouteName:(id)a6 spokenRouteName:(id)a7 transportType:(int)a8 location:(id)a9 time:(id)a10
{
  uint64_t v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  MapsSuggestionsETA *v25;

  v11 = *(_QWORD *)&a8;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "processName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:originator:](self, "initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:originator:", v17, v18, v19, v20, v11, v21, a3, v22, v24);

  return v25;
}

- (MapsSuggestionsETA)initWithSeconds:(double)a3 trafficString:(id)a4 transportType:(int)a5 location:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  MapsSuggestionsETA *v13;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a6;
  MapsSuggestionsNow();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:](self, "initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:", v10, v10, 0, 0, v7, v11, a3, v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:originator:](+[MapsSuggestionsETA allocWithZone:](MapsSuggestionsETA, "allocWithZone:", a3), "initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:originator:", self->_shortTrafficString, self->_longTrafficString, self->_writtenRouteName, self->_spokenRouteName, self->_transportType, self->_location, self->_seconds, self->_time, self->_originator);
}

- (BOOL)isEqual:(id)a3
{
  MapsSuggestionsETA *v4;
  BOOL v5;

  v4 = (MapsSuggestionsETA *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MapsSuggestionsETA isEqualToETA:](self, "isEqualToETA:", v4);
  }

  return v5;
}

- (BOOL)isEqualToETA:(id)a3
{
  MapsSuggestionsETA *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (MapsSuggestionsETA *)a3;
  if (self == v4)
    goto LABEL_7;
  -[MapsSuggestionsETA seconds](self, "seconds");
  v6 = v5;
  -[MapsSuggestionsETA seconds](v4, "seconds");
  if (vabdd_f64(v6, v7) > 2.22044605e-16)
    goto LABEL_8;
  -[MapsSuggestionsETA shortTrafficString](self, "shortTrafficString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsETA shortTrafficString](v4, "shortTrafficString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    -[MapsSuggestionsETA shortTrafficString](self, "shortTrafficString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsETA shortTrafficString](v4, "shortTrafficString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
      goto LABEL_8;
  }
  -[MapsSuggestionsETA longTrafficString](self, "longTrafficString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsETA longTrafficString](v4, "longTrafficString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v14
    || (-[MapsSuggestionsETA longTrafficString](self, "longTrafficString"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MapsSuggestionsETA longTrafficString](v4, "longTrafficString"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "isEqualToString:", v16),
        v16,
        v15,
        (v17 & 1) != 0))
  {
LABEL_7:
    v18 = 1;
  }
  else
  {
LABEL_8:
    v18 = 0;
  }

  return v18;
}

- (double)age
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  MapsSuggestionsNow();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsETA time](self, "time");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (BOOL)isValidForLocation:(id)a3 requirements:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MapsSuggestionsETA age](self, "age");
    v9 = v8;
    objc_msgSend(v7, "maxAge");
    if (v9 <= v10)
    {
      -[MapsSuggestionsETA location](self, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "horizontalAccuracy");
      v18 = v17;

      objc_msgSend(v7, "minAccuracy");
      if (v18 <= v19)
      {
        if (!v6)
          goto LABEL_21;
        -[MapsSuggestionsETA location](self, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsBestLocation(v6, v22);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23 != v6)
        {
          GEOFindOrCreateLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v28) = 0;
            _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "The provided currentLocation was not better than the used one", (uint8_t *)&v28, 2u);
          }
          v20 = 1;
          goto LABEL_13;
        }
        -[MapsSuggestionsETA location](self, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "distanceFromLocation:", v6);
        v26 = v25;

        objc_msgSend(v7, "maxDistance");
        if (v26 <= v27)
        {
LABEL_21:
          v20 = 1;
          goto LABEL_14;
        }
        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v28 = 134217984;
          v29 = *(const char **)&v26;
          v12 = "ETA invalid: moved too much (distance = %.2fm).";
          goto LABEL_10;
        }
      }
      else
      {
        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v28 = 134217984;
          v29 = *(const char **)&v18;
          v12 = "ETA invalid: not accurate enough (accuracy = %.2fm).";
          goto LABEL_10;
        }
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v28 = 134217984;
        v29 = *(const char **)&v9;
        v12 = "ETA invalid: too old (age = %.2fs).";
LABEL_10:
        v13 = v11;
        v14 = OS_LOG_TYPE_DEBUG;
        v15 = 12;
        goto LABEL_11;
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v28 = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      v30 = 1024;
      v31 = 180;
      v32 = 2082;
      v33 = "-[MapsSuggestionsETA isValidForLocation:requirements:]";
      v34 = 2082;
      v35 = "nil == (requirements)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires requirements";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 38;
LABEL_11:
      _os_log_impl(&dword_1A427D000, v13, v14, v12, (uint8_t *)&v28, v15);
    }
  }
  v20 = 0;
LABEL_13:

LABEL_14:
  return v20;
}

- (BOOL)isBetterThanETA:(id)a3 requirements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  BOOL v23;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[18];
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 228;
      v31 = 2082;
      v32 = "-[MapsSuggestionsETA isBetterThanETA:requirements:]";
      v33 = 2082;
      v34 = "nil == (requirements)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires ETA requirements", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (v6)
  {
    -[MapsSuggestionsETA location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsBestLocation(v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isValidForLocation:requirements:", v10, v7) & 1) == 0)
    {
      v23 = 1;
      goto LABEL_12;
    }
    if (-[MapsSuggestionsETA isValidForLocation:requirements:](self, "isValidForLocation:requirements:", v10, v7))
    {
      v11 = v6;
      v12 = v7;
      -[MapsSuggestionsETA location](self, "location");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "coordinate");
      *(_QWORD *)buf = v14;
      *(_QWORD *)&buf[8] = v15;

      objc_msgSend(v11, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "coordinate");
      v28 = v17;
      v29 = v18;

      CLLocationCoordinate2DGetDistanceFrom();
      v20 = v19;
      objc_msgSend(v12, "maxDistance", v28, v29, *(_QWORD *)buf, *(_QWORD *)&buf[8]);
      LODWORD(v16) = v20 > v21;

      if ((_DWORD)v16)
      {
        -[MapsSuggestionsETA location](self, "location");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v10 == v22;

      }
      else
      {
        -[MapsSuggestionsETA age](self, "age");
        v26 = v25;
        objc_msgSend(v11, "age");
        v23 = v26 < v27;
      }
      goto LABEL_12;
    }
LABEL_9:
    v23 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v23 = 1;
LABEL_13:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MapsSuggestionsETASecondsKey"), self->_seconds);
  objc_msgSend(v4, "encodeObject:forKey:", self->_shortTrafficString, CFSTR("MapsSuggestionsETAShortTrafficStringKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_longTrafficString, CFSTR("MapsSuggestionsETALongTrafficStringKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_writtenRouteName, CFSTR("MapsSuggestionsETAWrittenRouteNameKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_spokenRouteName, CFSTR("MapsSuggestionsETASpokenRouteNameKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transportType, CFSTR("MapsSuggestionsETATransportTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_time, CFSTR("MapsSuggestionsETATimeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("MapsSuggestionsETALocationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originator, CFSTR("MapsSuggestionsETAOriginatorKey"));

}

- (MapsSuggestionsETA)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MapsSuggestionsETA *v15;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MapsSuggestionsETASecondsKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsETAShortTrafficStringKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsETALongTrafficStringKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsETAWrittenRouteNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsETASpokenRouteNameKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MapsSuggestionsETATransportTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsETATimeKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsETALocationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsETAOriginatorKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[MapsSuggestionsETA initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:originator:](self, "initWithSeconds:shortTrafficString:longTrafficString:writtenRouteName:spokenRouteName:transportType:location:time:originator:", v17, v7, v8, v9, v10, v12, v6, v11, v13);

  return v15;
}

- (id)data
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  MapsSuggestionsETA *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v3, "finishEncoding");
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "encodedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "Could not serialize ETA: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)ETAWithData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v12 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v12);
    v5 = (uint64_t)v12;
    objc_msgSend(v4, "setRequiresSecureCoding:", 1);
    objc_msgSend(v4, "setDecodingFailurePolicy:", 1);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishDecoding");
    objc_msgSend(v4, "error");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7 | v5)
    {

    }
    else if (v6)
    {
      v8 = v6;
LABEL_15:

      goto LABEL_16;
    }
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (char *)v5;
      if (!v5)
      {
        objc_msgSend(v4, "error");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "Could not deserialize MapsSuggestionsETA, error: %@", buf, 0xCu);
      if (!v5)

    }
    v8 = 0;
    goto LABEL_15;
  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
    v15 = 1024;
    v16 = 331;
    v17 = 2082;
    v18 = "+[MapsSuggestionsETA ETAWithData:]";
    v19 = 2082;
    v20 = "data == nil";
    _os_log_impl(&dword_1A427D000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires serialized data", buf, 0x26u);
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (id)nameForJSON
{
  return CFSTR("eta");
}

- (id)objectForJSON
{
  MSg *v3;
  double v4;
  void *v5;
  MSg *v6;
  double v7;
  void *v8;
  MSg *v9;
  CLLocation *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("value");
  v3 = (MSg *)-[MapsSuggestionsETA seconds](self, "seconds");
  MSg::jsonFor(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("age");
  v6 = (MSg *)-[MapsSuggestionsETA age](self, "age");
  MSg::jsonFor(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("from");
  -[MapsSuggestionsETA location](self, "location");
  v9 = (MSg *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v24.receiver = self;
  v24.super_class = (Class)MapsSuggestionsETA;
  -[MapsSuggestionsETA description](&v24, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsETA seconds](self, "seconds");
  v6 = v5;
  -[MapsSuggestionsETA writtenRouteName](self, "writtenRouteName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsETA trafficString](self, "trafficString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MapsSuggestionsETA transportType](self, "transportType");
  if (v9 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E4BCE980[(int)v9];
  }
  -[MapsSuggestionsETA location](self, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinate");
  v13 = v12;
  -[MapsSuggestionsETA location](self, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinate");
  v16 = v15;
  -[MapsSuggestionsETA location](self, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "horizontalAccuracy");
  v19 = v18;
  -[MapsSuggestionsETA time](self, "time");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsETA originator](self, "originator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %.0fs over @\"%@\", \"%@\" (%@ / <%.8f,%.8f> ±%.2fm / %@ / %@)"), v4, v6, v7, v8, v10, v13, v16, v19, v20, v21);

  return (NSString *)v22;
}

- (double)seconds
{
  return self->_seconds;
}

- (NSString)shortTrafficString
{
  return self->_shortTrafficString;
}

- (NSString)longTrafficString
{
  return self->_longTrafficString;
}

- (NSString)writtenRouteName
{
  return self->_writtenRouteName;
}

- (NSString)spokenRouteName
{
  return self->_spokenRouteName;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSDate)time
{
  return self->_time;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)originator
{
  return self->_originator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_spokenRouteName, 0);
  objc_storeStrong((id *)&self->_writtenRouteName, 0);
  objc_storeStrong((id *)&self->_longTrafficString, 0);
  objc_storeStrong((id *)&self->_shortTrafficString, 0);
}

@end
