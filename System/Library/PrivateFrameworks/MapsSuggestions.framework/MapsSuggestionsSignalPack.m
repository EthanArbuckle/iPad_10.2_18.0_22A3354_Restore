@implementation MapsSuggestionsSignalPack

+ (id)extractFromDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MapsSuggestionsMutableSignalPack *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  MapsSuggestionsMutableSignalPack *v18;
  double v19;
  NSObject *p_super;
  int v21;
  NSObject *v22;
  id v23;
  void *v24;
  double v25;
  MapsSuggestionsMutableSignalPack *v26;
  double v27;
  MapsSuggestionsMutableSignalPack *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  MapsSuggestionsMutableSignalPack *v35;
  double v36;
  MapsSuggestionsMutableSignalPack *v37;
  NSObject *v38;
  id v39;
  void *v40;
  double v41;
  MapsSuggestionsMutableSignalPack *v42;
  double v43;
  MapsSuggestionsMutableSignalPack *v44;
  NSObject *v45;
  NSObject *v46;
  int v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    GEOFindOrCreateLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v48 = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      v50 = 1024;
      v51 = 128;
      v52 = 2082;
      v53 = "+[MapsSuggestionsSignalPack(MapsSuggestionsEntry) extractFromDestinationEntry:originCoordinate:]";
      v54 = 2082;
      v55 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, p_super, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v48, 0x26u);
    }
    goto LABEL_36;
  }
  objc_msgSend(v7, "geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (objc_msgSend(v8, "geoMapItem"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "extractFromDestinationMapItem:originCoordinate:", v10, latitude, longitude),
        v11 = (MapsSuggestionsMutableSignalPack *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    v11 = objc_alloc_init(MapsSuggestionsMutableSignalPack);
  }
  *(float *)&v12 = (float)objc_msgSend(v8, "type");
  -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v11, "writeSignalValue:forType:", 1, v12);
  v13 = v8;
  if (objc_msgSend(v13, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")))
  {
    objc_msgSend(v13, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsNow();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v15);
    v17 = v16;

    v18 = v11;
    if (v18)
    {
      *(float *)&v19 = v17;
      -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v18, "writeSignalValue:forType:", 2, v19);
LABEL_11:
      v21 = 0;
      goto LABEL_15;
    }
  }
  else
  {

    if (v11)
      goto LABEL_11;
  }
  GEOFindOrCreateLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    v50 = 1024;
    v51 = 27;
    v52 = 2082;
    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
    v54 = 2082;
    v55 = "nil == (pack)";
    _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
  }

  v21 = 1;
LABEL_15:

  v23 = v13;
  if (objc_msgSend(v23, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")))
  {
    objc_msgSend(v23, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MapsSuggestionsTimeSinceMidnightOfDate(v24);

    v26 = v11;
    if ((v21 & 1) == 0)
    {
      *(float *)&v27 = v25;
      -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v26, "writeSignalValue:forType:", 4, v27);
      goto LABEL_22;
    }
  }
  else
  {

    v28 = v11;
    if (!v21)
      goto LABEL_22;
  }
  GEOFindOrCreateLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    v50 = 1024;
    v51 = 27;
    v52 = 2082;
    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
    v54 = 2082;
    v55 = "nil == (pack)";
    _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
  }

LABEL_22:
  v30 = v23;
  if (!objc_msgSend(v30, "containsKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey")))
  {

    v37 = v11;
    if (!v21)
      goto LABEL_29;
LABEL_26:
    GEOFindOrCreateLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v48 = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      v50 = 1024;
      v51 = 27;
      v52 = 2082;
      v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
      v54 = 2082;
      v55 = "nil == (pack)";
      _os_log_impl(&dword_1A427D000, v38, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
    }

    goto LABEL_29;
  }
  objc_msgSend(v30, "dateForKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNow();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceDate:", v32);
  v34 = v33;

  v35 = v11;
  if ((v21 & 1) != 0)
    goto LABEL_26;
  *(float *)&v36 = v34;
  -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v35, "writeSignalValue:forType:", 3, v36);
LABEL_29:

  v39 = v30;
  if (objc_msgSend(v39, "containsKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey")))
  {
    objc_msgSend(v39, "dateForKey:", CFSTR("MapsSuggestionsScheduledEndTimeKey"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = MapsSuggestionsTimeSinceMidnightOfDate(v40);

    v42 = v11;
    if ((v21 & 1) == 0)
    {
      p_super = &v42->super.super;
      *(float *)&v43 = v41;
      -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v42, "writeSignalValue:forType:", 5, v43);
LABEL_38:
      v46 = p_super;
      goto LABEL_39;
    }
  }
  else
  {

    v44 = v11;
    if (!v21)
    {
      p_super = &v44->super.super;
      goto LABEL_38;
    }
  }
  GEOFindOrCreateLog();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    v50 = 1024;
    v51 = 27;
    v52 = 2082;
    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
    v54 = 2082;
    v55 = "nil == (pack)";
    _os_log_impl(&dword_1A427D000, v45, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
  }

  p_super = 0;
LABEL_36:
  v46 = 0;
LABEL_39:

  return v46;
}

+ (id)extractFromDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v6;
  MapsSuggestionsMutableSignalPack *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  float v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  NSObject *v18;
  MapsSuggestionsMutableSignalPack *v19;
  MapsSuggestionsMutableSignalPack *v20;
  double v21;
  MapsSuggestionsMutableSignalPack *v22;
  NSObject *v23;
  void *v24;
  double v25;
  float v26;
  MapsSuggestionsMutableSignalPack *v27;
  double v28;
  NSObject *v29;
  MapsSuggestionsMutableSignalPack *v30;
  NSObject *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  double v40;
  float v41;
  NSObject *v42;
  const char *v43;
  MapsSuggestionsMutableSignalPack *v44;
  double v45;
  NSObject *v46;
  int v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;
  CLLocationCoordinate2D v57;
  CLLocationCoordinate2D v58;
  CLLocationCoordinate2D v59;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc_init(MapsSuggestionsMutableSignalPack);
    v8 = v6;
    MapsSuggestionsCurrentBestLocation();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "coordinate");
      v12 = NAN;
      if (v11 >= -180.0 && v11 <= 180.0 && v10 >= -90.0 && v10 <= 90.0)
      {
        v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v8, "coordinate");
        v15 = v14;
        objc_msgSend(v8, "coordinate");
        v16 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v15);
        objc_msgSend(v16, "distanceFromLocation:", v9);
        v12 = v17;

      }
    }
    else
    {
      v12 = NAN;
    }

    v20 = v7;
    v22 = v20;
    if (v20)
    {
      *(float *)&v21 = v12;
      -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v20, "writeSignalValue:forType:", 13, v21);
    }
    else
    {
      GEOFindOrCreateLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v48 = 136446978;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
        v50 = 1024;
        v51 = 27;
        v52 = 2082;
        v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
        v54 = 2082;
        v55 = "nil == (pack)";
        _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
      }

    }
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
    if (v18)
    {
      MapsSuggestionsCurrentBestLocation();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 && (-[NSObject coordinate](v18, "coordinate"), CLLocationCoordinate2DIsValid(v57)))
      {
        -[NSObject distanceFromLocation:](v18, "distanceFromLocation:", v24);
        v26 = v25;
      }
      else
      {
        v26 = NAN;
      }

      v27 = v22;
      if (v22)
      {
        *(float *)&v28 = v26;
        -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v27, "writeSignalValue:forType:", 14, v28);
        goto LABEL_30;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v48 = 136446978;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
        v50 = 1024;
        v51 = 90;
        v52 = 2082;
        v53 = "MapsSuggestionsSignalValue _distanceFromHereToLocation(CLLocation *__strong)";
        v54 = 2082;
        v55 = "nil == (there)";
        _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", (uint8_t *)&v48, 0x26u);
      }

      v30 = v22;
      if (v22)
      {
LABEL_30:

        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
        v33 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v8, "coordinate");
        v35 = v34;
        objc_msgSend(v8, "coordinate");
        v36 = (void *)objc_msgSend(v33, "initWithLatitude:longitude:", v35);
        v37 = v32;
        v38 = v36;
        v39 = v38;
        if (v37)
        {
          if (v38)
          {
            objc_msgSend(v37, "coordinate");
            if (CLLocationCoordinate2DIsValid(v58))
            {
              objc_msgSend(v39, "coordinate");
              if (CLLocationCoordinate2DIsValid(v59))
              {
                objc_msgSend(v37, "distanceFromLocation:", v39);
                v41 = v40;
LABEL_42:

                v44 = v22;
                v19 = v44;
                if (v22)
                {
                  *(float *)&v45 = v41;
                  -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](v44, "writeSignalValue:forType:", 15, v45);
                }
                else
                {
                  GEOFindOrCreateLog();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    v48 = 136446978;
                    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
                    v50 = 1024;
                    v51 = 27;
                    v52 = 2082;
                    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSu"
                          "ggestionsSignalValue)";
                    v54 = 2082;
                    v55 = "nil == (pack)";
                    _os_log_impl(&dword_1A427D000, v46, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
                  }

                }
                goto LABEL_48;
              }
            }
LABEL_41:
            v41 = NAN;
            goto LABEL_42;
          }
          GEOFindOrCreateLog();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v48 = 136446978;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
            v50 = 1024;
            v51 = 112;
            v52 = 2082;
            v53 = "MapsSuggestionsSignalValue _distanceFromOriginToDestination(CLLocation *__strong, CLLocation *__strong)";
            v54 = 2082;
            v55 = "nil == (destination)";
            v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination";
            goto LABEL_39;
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v48 = 136446978;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
            v50 = 1024;
            v51 = 111;
            v52 = 2082;
            v53 = "MapsSuggestionsSignalValue _distanceFromOriginToDestination(CLLocation *__strong, CLLocation *__strong)";
            v54 = 2082;
            v55 = "nil == (origin)";
            v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an origin";
LABEL_39:
            _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_ERROR, v43, (uint8_t *)&v48, 0x26u);
          }
        }

        goto LABEL_41;
      }
    }
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v48 = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      v50 = 1024;
      v51 = 27;
      v52 = 2082;
      v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
      v54 = 2082;
      v55 = "nil == (pack)";
      _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
    }

    goto LABEL_30;
  }
  GEOFindOrCreateLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    v50 = 1024;
    v51 = 166;
    v52 = 2082;
    v53 = "+[MapsSuggestionsSignalPack(MapsSuggestionsEntry) extractFromDestinationMapItem:originCoordinate:]";
    v54 = 2082;
    v55 = "nil == (mapItem)";
    _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a map item", (uint8_t *)&v48, 0x26u);
  }
  v19 = 0;
LABEL_48:

  return v19;
}

- (MapsSuggestionsSignalPack)initWithSignalPack:(id)a3
{
  MapsSuggestionsSignalPack *v4;
  MapsSuggestionsSignalPack *v5;
  MapsSuggestionsSignalPack *v6;
  BOOL v7;
  uint64_t *next;
  unint64_t value;
  uint64_t i;
  id *v11;
  BOOL v12;
  id *v13;
  unint64_t v14;
  _QWORD *inserted;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  objc_super v20;

  v4 = (MapsSuggestionsSignalPack *)a3;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsSignalPack;
  v5 = -[MapsSuggestionsSignalPack init](&v20, sel_init);
  v6 = v5;
  if (v5)
    v7 = v5 == v4;
  else
    v7 = 1;
  if (!v7)
  {
    v5->_innerSignalPack.dict_.__table_.__p3_.__value_ = v4->_innerSignalPack.dict_.__table_.__p3_.__value_;
    next = (uint64_t *)v4->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_;
    value = v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      v11 = (id *)v5->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_;
      v5->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_ = 0;
      v5->_innerSignalPack.dict_.__table_.__p2_.__value_ = 0;
      if (v11)
        v12 = next == 0;
      else
        v12 = 1;
      if (v12)
      {
        v13 = v11;
      }
      else
      {
        do
        {
          v11[2] = (id)next[2];
          *((_DWORD *)v11 + 6) = *((_DWORD *)next + 6);
          objc_storeStrong(v11 + 4, (id)next[4]);
          objc_storeStrong(v11 + 5, (id)next[5]);
          v13 = (id *)*v11;
          v14 = *((unsigned int *)v11 + 4);
          v11[1] = (id)v14;
          inserted = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_prepare((uint64_t)&v6->_innerSignalPack, v14, v11 + 2);
          std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_perform(&v6->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, v11, inserted);
          next = (uint64_t *)*next;
          if (!v13)
            break;
          v11 = v13;
        }
        while (next);
      }
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__deallocate_node(v13);
    }
    for (; next; next = (uint64_t *)*next)
    {
      v16 = operator new(0x30uLL);
      *v16 = 0;
      v17 = next[2];
      v16[2] = v17;
      *((_DWORD *)v16 + 6) = *((_DWORD *)next + 6);
      v16[4] = (id)next[4];
      v16[5] = (id)next[5];
      v16[1] = v17;
      v18 = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_prepare((uint64_t)&v6->_innerSignalPack, v17, v16 + 2);
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_perform(&v6->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, v16, v18);
    }
  }

  return v6;
}

+ (id)signalPackFromData:(id)a3
{
  MapsSuggestionsSignalPackFromData(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasType:(int64_t)a3
{
  return std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::find<MapsSuggestionsSignalType>(&self->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
}

- (float)valueForSignalType:(int64_t)a3
{
  float *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (float *)std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::find<MapsSuggestionsSignalType>(&self->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v3)
    return v3[6];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136446978;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack.hpp";
    v8 = 1024;
    v9 = 135;
    v10 = 2082;
    v11 = "SignalValue MSg::SignalPack::get(SignalType) const";
    v12 = 2082;
    v13 = "iter == dict_.cend()";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. The type key needs to exist, have you checked .has(type)?", (uint8_t *)&v6, 0x26u);
  }

  return NAN;
}

- (BOOL)isEmpty
{
  return self->_innerSignalPack.dict_.__table_.__p2_.__value_ == 0;
}

- (unint64_t)count
{
  return self->_innerSignalPack.dict_.__table_.__p2_.__value_;
}

- (BOOL)mergeIntoSignalPack:(id)a3
{
  unint64_t v3;
  char *v5;
  id v6;
  void *next;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t **v13;
  uint64_t *i;
  unint64_t v15;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  NSObject *v26;
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
  v5 = (char *)a3;
  v6 = v5;
  if (v5)
  {
    next = self->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_;
    if (next)
    {
      v8 = (uint64_t *)(v5 + 8);
      v9 = v5 + 24;
      do
      {
        v10 = *((_QWORD *)next + 2);
        v11 = *((_QWORD *)v6 + 2);
        if (v11)
        {
          v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
          v12.i16[0] = vaddlv_u8(v12);
          if (v12.u32[0] > 1uLL)
          {
            v3 = *((_QWORD *)next + 2);
            if (v10 >= v11)
              v3 = v10 % v11;
          }
          else
          {
            v3 = ((_DWORD)v11 - 1) & v10;
          }
          v13 = *(uint64_t ***)(*v8 + 8 * v3);
          if (v13)
          {
            for (i = *v13; i; i = (uint64_t *)*i)
            {
              v15 = i[1];
              if (v15 == v10)
              {
                if (i[2] == v10)
                {
                  *((_DWORD *)i + 6) = *((_DWORD *)next + 6);
                  objc_storeStrong((id *)i + 4, *((id *)next + 4));
                  objc_storeStrong((id *)i + 5, *((id *)next + 5));
                  goto LABEL_42;
                }
              }
              else
              {
                if (v12.u32[0] > 1uLL)
                {
                  if (v15 >= v11)
                    v15 %= v11;
                }
                else
                {
                  v15 &= v11 - 1;
                }
                if (v15 != v3)
                  break;
              }
            }
          }
        }
        v16 = operator new(0x30uLL);
        *v16 = 0;
        v16[1] = v10;
        v16[2] = v10;
        *((_DWORD *)v16 + 6) = *((_DWORD *)next + 6);
        v16[4] = *((id *)next + 4);
        v16[5] = *((id *)next + 5);
        v17 = (float)(unint64_t)(*((_QWORD *)v6 + 4) + 1);
        v18 = *((float *)v6 + 10);
        if (!v11 || (float)(v18 * (float)v11) < v17)
        {
          v19 = (v11 & (v11 - 1)) != 0;
          if (v11 < 3)
            v19 = 1;
          v20 = v19 | (2 * v11);
          v21 = vcvtps_u32_f32(v17 / v18);
          if (v20 <= v21)
            v22 = v21;
          else
            v22 = v20;
          std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)v6 + 8, v22);
          v11 = *((_QWORD *)v6 + 2);
          if ((v11 & (v11 - 1)) != 0)
          {
            if (v10 >= v11)
              v3 = v10 % v11;
            else
              v3 = v10;
          }
          else
          {
            v3 = ((_DWORD)v11 - 1) & v10;
          }
        }
        v23 = *v8;
        v24 = *(_QWORD **)(*v8 + 8 * v3);
        if (v24)
        {
          *v16 = *v24;
        }
        else
        {
          *v16 = *v9;
          *v9 = v16;
          *(_QWORD *)(v23 + 8 * v3) = v9;
          if (!*v16)
            goto LABEL_41;
          v25 = *(_QWORD *)(*v16 + 8);
          if ((v11 & (v11 - 1)) != 0)
          {
            if (v25 >= v11)
              v25 %= v11;
          }
          else
          {
            v25 &= v11 - 1;
          }
          v24 = (_QWORD *)(*v8 + 8 * v25);
        }
        *v24 = v16;
LABEL_41:
        ++*((_QWORD *)v6 + 4);
LABEL_42:
        next = *(void **)next;
      }
      while (next);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v28 = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack.mm";
      v30 = 1024;
      v31 = 72;
      v32 = 2082;
      v33 = "-[MapsSuggestionsSignalPack mergeIntoSignalPack:]";
      v34 = 2082;
      v35 = "nil == (signalPack)";
      _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires another signal pack", (uint8_t *)&v28, 0x26u);
    }

  }
  return v6 != 0;
}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsSignalPack;
  return -[MapsSuggestionsSignalPack copy](&v3, sel_copy);
}

- (id)mutableCopy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsSignalPack;
  return -[MapsSuggestionsSignalPack mutableCopy](&v3, sel_mutableCopy);
}

- (id)encodedFeatureDictionary
{
  unint64_t v2;
  float *v3;
  float v4;
  _DWORD *v5;
  int *v6;
  int v7;
  float v8;
  char *v9;
  NSObject *v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  uint8x8_t v18;
  _QWORD **v19;
  _QWORD *i;
  unint64_t v21;
  uint64_t v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  void *v31;
  float v32;
  float v33;
  id v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  double v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *context;
  void *__p[2];
  void *v53[2];
  float v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  uint64_t v63;

  v2 = (unint64_t)self;
  v63 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A859CDD8](self, a2);
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v53 = 0u;
  v54 = 1.0;
  std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)__p, (unint64_t)(float)*(unint64_t *)(v2 + 32));
  v3 = *(float **)(v2 + 24);
  if (!v3)
    goto LABEL_122;
  do
  {
    v4 = v3[6];
    switch(*((_QWORD *)v3 + 2))
    {
      case 1:
        v5 = operator new(0x44uLL);
        v9 = (char *)(v5 + 17);
        v5[16] = 0;
        *((_OWORD *)v5 + 2) = 0u;
        *((_OWORD *)v5 + 3) = 0u;
        *(_OWORD *)v5 = 0u;
        *((_OWORD *)v5 + 1) = 0u;
        if (fabsf(v4) >= 0.001)
        {
          v12 = 0;
          v13 = 0;
          do
          {
            if (v12)
            {
              if (vabds_f32(v4, (float)v12) < 0.001)
                goto LABEL_60;
              ++v13;
            }
            ++v12;
          }
          while (v12 != 18);
        }
        goto LABEL_76;
      case 2:
      case 3:
      case 0x17:
      case 0x20:
        v5 = operator new(4uLL);
        v8 = v4 / 86400.0;
        goto LABEL_9;
      case 4:
      case 5:
      case 0xALL:
        if (v4 >= 0.0)
        {
          if (v4 <= 86400.0)
          {
            v5 = operator new(4uLL);
            v8 = (float)(v4 / 86401.0) + 0.000011574;
            goto LABEL_9;
          }
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 41;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<0, 86400>::encode(SignalValue) const [Min = 0, Max = 86400]";
            v61 = 2082;
            v62 = "decodedValue > MAX";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 40;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<0, 86400>::encode(SignalValue) const [Min = 0, Max = 86400]";
            v61 = 2082;
            v62 = "decodedValue < MIN";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
        goto LABEL_73;
      case 6:
        if (v4 >= 174.0)
        {
          if (v4 <= 373.0)
          {
            v5 = operator new(4uLL);
            v32 = (float)(v4 + -174.0) / 200.0;
            v33 = 0.005;
            goto LABEL_121;
          }
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 41;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<174, 373>::encode(SignalValue) const [Min = 174, Max = 373]";
            v61 = 2082;
            v62 = "decodedValue > MAX";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 40;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<174, 373>::encode(SignalValue) const [Min = 174, Max = 373]";
            v61 = 2082;
            v62 = "decodedValue < MIN";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
        goto LABEL_73;
      case 7:
      case 8:
      case 9:
        v5 = operator new(4uLL);
        *(float *)v5 = v4;
        v9 = (char *)(v5 + 1);
        goto LABEL_76;
      case 0xBLL:
        if (v4 >= 1.0)
        {
          if (v4 <= 7.0)
          {
            v5 = operator new(4uLL);
            v32 = (float)(v4 + -1.0) / 7.0;
            v33 = 0.14286;
            goto LABEL_121;
          }
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 41;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<1, 7>::encode(SignalValue) const [Min = 1, Max = 7]";
            v61 = 2082;
            v62 = "decodedValue > MAX";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 40;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<1, 7>::encode(SignalValue) const [Min = 1, Max = 7]";
            v61 = 2082;
            v62 = "decodedValue < MIN";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
        goto LABEL_73;
      case 0xCLL:
      case 0x14:
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1ALL:
      case 0x1CLL:
      case 0x1DLL:
      case 0x1ELL:
      case 0x1FLL:
      case 0x21:
      case 0x22:
      case 0x23:
      case 0x24:
      case 0x25:
      case 0x27:
        if (fabs(v4) < 0.01)
        {
          v5 = operator new(4uLL);
          v6 = v5;
          v7 = -1082130432;
          goto LABEL_75;
        }
        if (fabs(v4 + -1.0) < 0.01)
        {
          v5 = operator new(4uLL);
          v6 = v5;
          v7 = 1065353216;
          goto LABEL_75;
        }
        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBooleanSignalEncoder.hpp";
          v57 = 1024;
          v58 = 32;
          v59 = 2082;
          v60 = "const SignalValues MSg::BooleanSignalEncoder::encode(SignalValue) const";
          v61 = 2082;
          v62 = "YES";
          _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Only 1.0 or 0.0 are allowed as input", buf, 0x26u);
        }
        goto LABEL_73;
      case 0xDLL:
      case 0xELL:
      case 0xFLL:
      case 0x10:
      case 0x11:
      case 0x12:
        v5 = operator new(4uLL);
        v8 = v4 / 1000.0;
        goto LABEL_9;
      case 0x13:
        v5 = operator new(0x10uLL);
        v13 = 0;
        v9 = (char *)(v5 + 4);
        *(_QWORD *)v5 = 0;
        *((_QWORD *)v5 + 1) = 0;
        while (vabds_f32(v4, (float)(int)v13) >= 0.001)
        {
          if (++v13 == 4)
            goto LABEL_76;
        }
        goto LABEL_60;
      case 0x15:
        v5 = operator new(0x10uLL);
        v9 = (char *)(v5 + 4);
        *(_QWORD *)v5 = 0;
        *((_QWORD *)v5 + 1) = 0;
        if (fabsf(v4) < 0.001)
          goto LABEL_76;
        v14 = 0;
        v13 = 0;
        do
        {
          if (v14)
          {
            if (vabds_f32(v4, (float)v14) < 0.001)
              goto LABEL_60;
            ++v13;
          }
          ++v14;
        }
        while (v14 != 5);
        goto LABEL_76;
      case 0x1BLL:
        v5 = operator new(0xB4uLL);
        v9 = (char *)(v5 + 45);
        v5[44] = 0;
        *((_OWORD *)v5 + 9) = 0u;
        *((_OWORD *)v5 + 10) = 0u;
        *((_OWORD *)v5 + 7) = 0u;
        *((_OWORD *)v5 + 8) = 0u;
        *((_OWORD *)v5 + 5) = 0u;
        *((_OWORD *)v5 + 6) = 0u;
        *((_OWORD *)v5 + 3) = 0u;
        *((_OWORD *)v5 + 4) = 0u;
        *((_OWORD *)v5 + 1) = 0u;
        *((_OWORD *)v5 + 2) = 0u;
        *(_OWORD *)v5 = 0u;
        if (fabsf(v4) < 0.001)
          goto LABEL_76;
        v15 = 0;
        v13 = 0;
        break;
      case 0x26:
        if (v4 >= 0.0)
        {
          if (v4 <= 500.0)
          {
            v5 = operator new(4uLL);
            v33 = 0.001996;
            v32 = v4 / 501.0;
LABEL_121:
            v8 = v32 + v33;
LABEL_9:
            *(float *)v5 = v8;
            v9 = (char *)(v5 + 1);
            goto LABEL_76;
          }
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 41;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<0, 500>::encode(SignalValue) const [Min = 0, Max = 500]";
            v61 = 2082;
            v62 = "decodedValue > MAX";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            v57 = 1024;
            v58 = 40;
            v59 = 2082;
            v60 = "const SignalValues MSg::RangeSignalEncoder<0, 500>::encode(SignalValue) const [Min = 0, Max = 500]";
            v61 = 2082;
            v62 = "decodedValue < MIN";
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
LABEL_73:

        v11 = operator new(4uLL);
LABEL_74:
        v5 = v11;
        v6 = v11;
        v7 = 2143289344;
LABEL_75:
        *v6 = v7;
        v9 = (char *)(v6 + 1);
        goto LABEL_76;
      default:
        v11 = operator new(4uLL);
        goto LABEL_74;
    }
    while (!v15)
    {
LABEL_58:
      if (++v15 == 46)
        goto LABEL_76;
    }
    if (vabds_f32(v4, (float)v15) >= 0.001)
    {
      ++v13;
      goto LABEL_58;
    }
LABEL_60:
    v5[v13] = 1065353216;
LABEL_76:
    v16 = *((_QWORD *)v3 + 2);
    v17 = (unint64_t)__p[1];
    if (__p[1])
    {
      v18 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v18.i16[0] = vaddlv_u8(v18);
      if (v18.u32[0] > 1uLL)
      {
        v2 = *((_QWORD *)v3 + 2);
        if ((void *)v16 >= __p[1])
          v2 = v16 % (unint64_t)__p[1];
      }
      else
      {
        v2 = (LODWORD(__p[1]) - 1) & v16;
      }
      v19 = (_QWORD **)*((_QWORD *)__p[0] + v2);
      if (v19)
      {
        for (i = *v19; i; i = (_QWORD *)*i)
        {
          v21 = i[1];
          if (v21 == v16)
          {
            if (i[2] == *((_QWORD *)v3 + 2))
              goto LABEL_114;
          }
          else
          {
            if (v18.u32[0] > 1uLL)
            {
              if ((void *)v21 >= __p[1])
                v21 %= (unint64_t)__p[1];
            }
            else
            {
              v21 &= (unint64_t)__p[1] - 1;
            }
            if (v21 != v2)
              break;
          }
        }
      }
    }
    i = operator new(0x30uLL);
    *i = 0;
    i[1] = v16;
    v22 = *((_QWORD *)v3 + 2);
    i[4] = 0;
    i[5] = 0;
    i[2] = v22;
    i[3] = 0;
    v23 = (float)((unint64_t)v53[1] + 1);
    if (!v17 || (float)(v54 * (float)v17) < v23)
    {
      v24 = (v17 & (v17 - 1)) != 0;
      if (v17 < 3)
        v24 = 1;
      v25 = v24 | (2 * v17);
      v26 = vcvtps_u32_f32(v23 / v54);
      if (v25 <= v26)
        v27 = v26;
      else
        v27 = v25;
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)__p, v27);
      v17 = (unint64_t)__p[1];
      if (((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0)
      {
        if ((void *)v16 >= __p[1])
          v2 = v16 % (unint64_t)__p[1];
        else
          v2 = v16;
      }
      else
      {
        v2 = (LODWORD(__p[1]) - 1) & v16;
      }
    }
    v28 = __p[0];
    v29 = (_QWORD *)*((_QWORD *)__p[0] + v2);
    if (v29)
    {
      *i = *v29;
      goto LABEL_112;
    }
    *i = v53[0];
    v53[0] = i;
    v28[v2] = v53;
    if (*i)
    {
      v30 = *(_QWORD *)(*i + 8);
      if ((v17 & (v17 - 1)) != 0)
      {
        if (v30 >= v17)
          v30 %= v17;
      }
      else
      {
        v30 &= v17 - 1;
      }
      v29 = (char *)__p[0] + 8 * v30;
LABEL_112:
      *v29 = i;
    }
    ++v53[1];
LABEL_114:
    v2 = (unint64_t)(i + 3);
    v31 = (void *)i[3];
    if (v31)
    {
      i[4] = v31;
      operator delete(v31);
      *(_QWORD *)v2 = 0;
      i[4] = 0;
      i[5] = 0;
    }
    i[3] = v5;
    i[4] = v9;
    i[5] = v9;
    v3 = *(float **)v3;
  }
  while (v3);
LABEL_122:
  v34 = objc_alloc(MEMORY[0x1E0C99E08]);
  v35 = (void *)objc_msgSend(v34, "initWithCapacity:", v53[1]);
  v36 = v53[0];
  if (v53[0])
  {
    do
    {
      NSStringFromMapsSuggestionsSignalType(v36[2]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (char *)v36[3];
      v40 = (char *)v36[4];
      v41 = v40 - v39;
      if (v40 - v39 == 4)
      {
        LODWORD(v38) = *(_DWORD *)v39;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, v37);

      }
      else if (v40 != v39)
      {
        v43 = 0;
        if ((unint64_t)(v41 >> 2) <= 1)
          v44 = 1;
        else
          v44 = v41 >> 2;
        do
        {
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%u"), v37, v43);
          LODWORD(v46) = *(_DWORD *)(v36[3] + 4 * v43);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v47, v45);

          ++v43;
        }
        while (v44 != v43);
      }

      v36 = (_QWORD *)*v36;
    }
    while (v36);
  }
  v48 = (void *)objc_msgSend(v35, "copy");

  std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>>>::__deallocate_node((_QWORD *)v53[0]);
  v49 = __p[0];
  __p[0] = 0;
  if (v49)
    operator delete(v49);
  objc_autoreleasePoolPop(context);
  return v48;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MapsSuggestionsSignalPack initWithSignalPack:](+[MapsSuggestionsMutableSignalPack allocWithZone:](MapsSuggestionsMutableSignalPack, "allocWithZone:", a3), "initWithSignalPack:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MapsSuggestionsSignalPack)initWithCoder:(id)a3
{
  void *v4;
  MapsSuggestionsSignalPack *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  MapsSuggestionsSignalPack *v22;
  NSObject *v23;
  void **v24;
  void **value;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  id v32;
  uint8_t buf[16];
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[12];
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend(v32, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsSignalPackInnerDataKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MapsSuggestionsSignalPack);

    v36 = 0;
    v6 = v4;
    if (MSg::fromData<unsigned char>(v6, &v36) == 1)
    {
      v7 = MSg::fromData<unsigned char>(v6, &v36);
      v8 = v7;
      *(_OWORD *)buf = 0u;
      v34 = 0u;
      LODWORD(v35) = 1065353216;
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)buf, v7);
      if (v7)
      {
        do
        {
          v9 = MSg::fromData<unsigned int>(v6, &v36);
          v10 = v9;
          *(_QWORD *)v37 = v9;
          v11 = v6;
          v12 = objc_msgSend(v11, "length");
          if (v12 >= v36 + 4)
            v13 = MSg::fromData<unsigned int>(v11, &v36);
          else
            v13 = 0;

          MSg::fromData<NSDate * {__strong}>(v11, &v36);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          MSg::fromData<NSDate * {__strong}>(v11, &v36);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__emplace_unique_key_args<MapsSuggestionsSignalType,std::piecewise_construct_t const&,std::tuple<MapsSuggestionsSignalType const&>,std::tuple<>>((uint64_t)buf, v10, v37);
          *((_DWORD *)v16 + 6) = v13;
          v17 = (void *)v16[4];
          v16[4] = v14;
          v18 = v14;

          v19 = (void *)v16[5];
          v16[5] = v15;
          v20 = v15;

          --v8;
        }
        while (v8);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v37 = 136446978;
        *(_QWORD *)&v37[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack.hpp";
        v38 = 1024;
        v39 = 181;
        v40 = 2082;
        v41 = "static SignalPack MSg::SignalPack::deserialize(NSData *__strong, std::ptrdiff_t &)";
        v42 = 2082;
        v43 = "version != VERSION";
        _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires the same version of SignalPack!", v37, 0x26u);
      }

      *(_OWORD *)buf = 0u;
      v34 = 0u;
      v35 = 1065353216;
    }

    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::clear((uint64_t)&v5->_innerSignalPack);
    v24 = *(void ***)buf;
    *(_QWORD *)buf = 0;
    value = v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_;
    v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_ = v24;
    if (value)
      operator delete(value);
    v27 = *(_QWORD *)&buf[8];
    v26 = v34;
    v5->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_ = (void *)v34;
    v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = v27;
    *(_QWORD *)&buf[8] = 0;
    v28 = *((_QWORD *)&v34 + 1);
    v5->_innerSignalPack.dict_.__table_.__p2_.__value_ = *((_QWORD *)&v34 + 1);
    LODWORD(v5->_innerSignalPack.dict_.__table_.__p3_.__value_) = v35;
    if (v28)
    {
      v29 = *(_QWORD *)(v26 + 8);
      if ((v27 & (v27 - 1)) != 0)
      {
        if (v29 >= v27)
          v29 %= v27;
      }
      else
      {
        v29 &= v27 - 1;
      }
      v26 = 0;
      v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_[v29] = &v5->_innerSignalPack.dict_.__table_.__p1_;
      v34 = 0uLL;
    }
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__deallocate_node((id *)v26);
    v30 = *(void **)buf;
    *(_QWORD *)buf = 0;
    if (v30)
      operator delete(v30);
    self = v5;
    v22 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_ERROR, "Decoded empty data for MapsSuggestionsSignalPack?", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *i;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  char value;
  char v17;
  unsigned int v18;

  v15 = a3;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 3800);
  v17 = 1;
  v5 = MSg::toData<unsigned char>(v4, (uint64_t)&v17);
  value = self->_innerSignalPack.dict_.__table_.__p2_.__value_;
  v6 = MSg::toData<unsigned char>(v4, (uint64_t)&value);
  for (i = self->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_; i; i = *(void **)i)
  {
    v8 = v4;
    v9 = *((_QWORD *)i + 2);
    v10 = v8;
    v18 = v9;
    MSg::toData<unsigned int>(v10, &v18);
    objc_claimAutoreleasedReturnValue();

    v11 = v10;
    MSg::toData<unsigned int>(v11, (unsigned int *)i + 6);
    objc_claimAutoreleasedReturnValue();

    v12 = MSg::toData<NSDate * {__strong}>(v11, (id *)i + 4);
    v13 = MSg::toData<NSDate * {__strong}>(v11, (id *)i + 5);

  }
  v14 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("MapsSuggestionsSignalPackInnerDataKey"));

}

- (id)description
{
  void *v3;
  float *i;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("MSg::SignalPack size=%u {"), self->_innerSignalPack.dict_.__table_.__p2_.__value_);
  for (i = (float *)self->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_; i; i = *(float **)i)
  {
    NSStringFromMapsSuggestionsSignalType(*((_QWORD *)i + 2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n . %@=%.2lf (%@ exp %@)"), v5, i[6], *((_QWORD *)i + 4), *((_QWORD *)i + 5));

  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::~__hash_table((uint64_t)&self->_innerSignalPack);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
