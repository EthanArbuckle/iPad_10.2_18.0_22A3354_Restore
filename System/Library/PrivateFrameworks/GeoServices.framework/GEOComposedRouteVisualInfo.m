@implementation GEOComposedRouteVisualInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteVisualInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteVisualInfo *v5;
  uint64_t v6;
  GEOFormattedString *title;
  uint64_t v8;
  GEOFormattedString *detail;
  uint64_t v10;
  GEOComposedString *titleString;
  uint64_t v12;
  GEOComposedString *detailString;
  uint64_t v14;
  GEOStyleAttributes *styleAttributes;
  uint64_t v16;
  GEOPBTransitArtwork *icon;
  uint64_t v18;
  NSArray *laneChangeInfos;
  id v20;
  const void *v21;
  size_t v22;
  id v23;
  const void *v24;
  size_t v25;
  const void *v26;
  size_t v27;
  GEOComposedRouteVisualInfo *v28;
  unint64_t v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GEOComposedRouteVisualInfo;
  v5 = -[GEOComposedRouteVisualInfo init](&v31, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (GEOFormattedString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_detail"));
    v8 = objc_claimAutoreleasedReturnValue();
    detail = v5->_detail;
    v5->_detail = (GEOFormattedString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleString"));
    v10 = objc_claimAutoreleasedReturnValue();
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_detailString"));
    v12 = objc_claimAutoreleasedReturnValue();
    detailString = v5->_detailString;
    v5->_detailString = (GEOComposedString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_styleAttributes"));
    v14 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_icon"));
    v16 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (GEOPBTransitArtwork *)v16;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_laneChangeInfos"));
    v18 = objc_claimAutoreleasedReturnValue();
    laneChangeInfos = v5->_laneChangeInfos;
    v5->_laneChangeInfos = (NSArray *)v18;

    v30 = 0;
    v20 = objc_retainAutorelease(v4);
    v21 = (const void *)objc_msgSend(v20, "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinateRange"), &v30);
    if (v30 && v21)
    {
      if (v30 >= 0x10)
        v22 = 16;
      else
        v22 = v30;
      memcpy(&v5->_routeCoordinateRange, v21, v22);
    }
    v30 = 0;
    v23 = objc_retainAutorelease(v20);
    v24 = (const void *)objc_msgSend(v23, "decodeBytesForKey:returnedLength:", CFSTR("_startCoordinate"), &v30);
    if (v30 && v24)
    {
      if (v30 >= 0x18)
        v25 = 24;
      else
        v25 = v30;
      memcpy(&v5->_startCoordinate, v24, v25);
    }
    v30 = 0;
    v26 = (const void *)objc_msgSend(objc_retainAutorelease(v23), "decodeBytesForKey:returnedLength:", CFSTR("_endCoordinate"), &v30);
    if (v30 && v26)
    {
      if (v30 >= 0x18)
        v27 = 24;
      else
        v27 = v30;
      memcpy(&v5->_endCoordinate, v26, v27);
    }
    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detail, CFSTR("_detail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleString, CFSTR("_titleString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailString, CFSTR("_detailString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_styleAttributes, CFSTR("_styleAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("_icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_laneChangeInfos, CFSTR("_laneChangeInfos"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_routeCoordinateRange, 16, CFSTR("_routeCoordinateRange"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_startCoordinate, 24, CFSTR("_startCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_endCoordinate, 24, CFSTR("_endCoordinate"));

}

- (id)description
{
  void *v3;
  uint64_t start;
  uint64_t end;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t type;
  const __CFString *v11;
  void *v12;
  GEOComposedString *titleString;
  GEOComposedString *detailString;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  GEOStyleAttributes *styleAttributes;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  GEOComposedRouteVisualInfo *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  start = (uint64_t)self->_routeCoordinateRange.start;
  end = (uint64_t)self->_routeCoordinateRange.end;
  v6 = vabds_f32((float)start + *((float *)&start + 1), (float)end + *((float *)&end + 1));
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v6 >= 0.001)
  {
    GEOPolylineCoordinateRangeAsString(start, end, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@] (%f, %f) to (%f, %f)"), v8, *(_QWORD *)&self->_startCoordinate.latitude, *(_QWORD *)&self->_startCoordinate.longitude, *(_QWORD *)&self->_endCoordinate.latitude, *(_QWORD *)&self->_endCoordinate.longitude);
  }
  else
  {
    GEOPolylineCoordinateAsString(start, 1, 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@] (%f, %f)"), v8, *(_QWORD *)&self->_startCoordinate.latitude, *(_QWORD *)&self->_startCoordinate.longitude, v33, v34);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v9);
  type = self->_type;
  v11 = CFSTR("None");
  if (type > 0x20000)
  {
    if (type == 131073)
    {
      v11 = CFSTR("Exit Number");
    }
    else if (type == 131074)
    {
      v11 = CFSTR("Significant Road Name");
    }
  }
  else
  {
    switch(type)
    {
      case 65630:
        v11 = CFSTR("Traffic State");
        break;
      case 65631:
      case 65632:
      case 65633:
      case 65634:
      case 65635:
      case 65637:
      case 65643:
      case 65644:
      case 65645:
      case 65646:
        break;
      case 65636:
        v11 = CFSTR("Windshield Mode");
        break;
      case 65638:
        v11 = CFSTR("Bridge");
        break;
      case 65639:
        v11 = CFSTR("Tunnel");
        break;
      case 65640:
        v11 = CFSTR("Urban Canyon");
        break;
      case 65641:
        v11 = CFSTR("Complex Overpass");
        break;
      case 65642:
        v11 = CFSTR("Complex Intersection");
        break;
      case 65647:
        v11 = CFSTR("Covered");
        break;
      default:
        if (type == 191)
          v11 = CFSTR("Travel Direction Arrow");
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  titleString = self->_titleString;
  if (titleString)
  {
    detailString = self->_detailString;
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[GEOComposedString stringWithDefaultOptions](titleString, "stringWithDefaultOptions");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (detailString)
    {
      -[GEOComposedString stringWithDefaultOptions](self->_detailString, "stringWithDefaultOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ | %@"), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    styleAttributes = self->_styleAttributes;
    if (styleAttributes)
    {
      v35 = v9;
      v37 = v3;
      v21 = (void *)MEMORY[0x1E0C99DE8];
      -[GEOStyleAttributes attributes](styleAttributes, "attributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = self;
      -[GEOStyleAttributes attributes](self->_styleAttributes, "attributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v39 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %u: %u }"), objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "key"), objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "value"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v26);
      }

      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" | "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      self = v36;
      v3 = v37;
      v9 = v35;
    }
    else
    {
      v19 = 0;
    }
  }
  objc_msgSend(v3, "addObject:", v19);
  if (-[NSArray count](self->_laneChangeInfos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d lane change infos"), -[NSArray count](self->_laneChangeInfos, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (unint64_t)type
{
  return self->_type;
}

- (GEOServerFormattedString)title
{
  return (GEOServerFormattedString *)self->_title;
}

- (GEOServerFormattedString)detail
{
  return (GEOServerFormattedString *)self->_detail;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (GEOComposedString)detailString
{
  return self->_detailString;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (GEOTransitArtworkDataSource)icon
{
  return (GEOTransitArtworkDataSource *)self->_icon;
}

- (NSArray)laneChangeInfos
{
  return self->_laneChangeInfos;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_routeCoordinateRange.end;
  start = self->_routeCoordinateRange.start;
  result.end = end;
  result.start = start;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)startCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_startCoordinate.latitude;
  longitude = self->_startCoordinate.longitude;
  altitude = self->_startCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_endCoordinate.latitude;
  longitude = self->_endCoordinate.longitude;
  altitude = self->_endCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laneChangeInfos, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (GEOComposedRouteVisualInfo)initWithType:(unint64_t)a3 title:(id)a4 detail:(id)a5 routeCoordinate:(id)a6 locationCoordinate:(id)a7
{
  double var2;
  double var1;
  double var0;
  id v14;
  id v15;
  unint64_t v16;
  GEOComposedRouteVisualInfo *v17;

  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  v14 = a5;
  v15 = a4;
  if (a6.var1 >= 0.0)
    v16 = (vcvtms_u32_f32(a6.var1) + a6.var0) | ((unint64_t)COERCE_UNSIGNED_INT(a6.var1 - floorf(a6.var1)) << 32);
  else
    v16 = 0xBF80000000000000;
  v17 = -[GEOComposedRouteVisualInfo initWithType:title:detail:routeCoordinateRange:startLocationCoordinate:endLocationCoordinate:](self, "initWithType:title:detail:routeCoordinateRange:startLocationCoordinate:endLocationCoordinate:", a3, v15, v14, v16, v16, var0, var1, var2, var0, var1, var2);

  return v17;
}

- (GEOComposedRouteVisualInfo)initWithType:(unint64_t)a3 title:(id)a4 detail:(id)a5 routeCoordinateRange:(GEOPolylineCoordinateRange)a6 startLocationCoordinate:(id)a7 endLocationCoordinate:(id)a8
{
  double var2;
  double var1;
  double var0;
  double v11;
  double v12;
  double v13;
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v19;
  id v20;
  GEOComposedRouteVisualInfo *v21;
  GEOComposedRouteVisualInfo *v22;
  uint64_t v23;
  GEOFormattedString *title;
  uint64_t v25;
  GEOFormattedString *detail;
  GEOComposedString *v27;
  GEOComposedString *titleString;
  GEOComposedString *v29;
  GEOComposedString *detailString;
  GEOComposedRouteVisualInfo *v31;
  objc_super v33;

  var2 = a8.var2;
  var1 = a8.var1;
  var0 = a8.var0;
  v11 = a7.var2;
  v12 = a7.var1;
  v13 = a7.var0;
  end = a6.end;
  start = a6.start;
  v19 = a4;
  v20 = a5;
  v33.receiver = self;
  v33.super_class = (Class)GEOComposedRouteVisualInfo;
  v21 = -[GEOComposedRouteVisualInfo init](&v33, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_type = a3;
    objc_msgSend(v19, "_geo_formattedString");
    v23 = objc_claimAutoreleasedReturnValue();
    title = v22->_title;
    v22->_title = (GEOFormattedString *)v23;

    objc_msgSend(v20, "_geo_formattedString");
    v25 = objc_claimAutoreleasedReturnValue();
    detail = v22->_detail;
    v22->_detail = (GEOFormattedString *)v25;

    v27 = -[GEOComposedString initWithString:]([GEOComposedString alloc], "initWithString:", v19);
    titleString = v22->_titleString;
    v22->_titleString = v27;

    v29 = -[GEOComposedString initWithString:]([GEOComposedString alloc], "initWithString:", v20);
    detailString = v22->_detailString;
    v22->_detailString = v29;

    v22->_routeCoordinateRange.start = start;
    v22->_routeCoordinateRange.end = end;
    v22->_startCoordinate.latitude = v13;
    v22->_startCoordinate.longitude = v12;
    v22->_startCoordinate.altitude = v11;
    v22->_endCoordinate.latitude = var0;
    v22->_endCoordinate.longitude = var1;
    v22->_endCoordinate.altitude = var2;
    v31 = v22;
  }

  return v22;
}

- (GEOComposedRouteVisualInfo)initWithGeoRouteLineStyleInfo:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 distanceOffset:(double)a6
{
  id v10;
  id v11;
  void *v12;
  GEOComposedRouteVisualInfo *v13;
  GEOComposedRouteVisualInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  GEOFormattedString *title;
  void *v20;
  uint64_t v21;
  GEOFormattedString *detail;
  GEOComposedString *v23;
  void *v24;
  uint64_t v25;
  GEOComposedString *titleString;
  GEOComposedString *v27;
  void *v28;
  uint64_t v29;
  GEOComposedString *detailString;
  uint64_t v31;
  GEOStyleAttributes *styleAttributes;
  uint64_t v33;
  void *icon;
  GEOComposedRouteVisualInfo *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  GEOComposedRouteLaneChangeInfo *v49;
  uint64_t v50;
  NSArray *laneChangeInfos;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  BOOL v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  NSObject *v78;
  const char *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  uint8_t buf[16];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_63:
      v35 = 0;
      goto LABEL_58;
    }
    *(_WORD *)buf = 0;
    v78 = MEMORY[0x1E0C81028];
    v79 = "Assertion failed: geoRouteLineStyleInfo != ((void *)0)";
LABEL_65:
    _os_log_fault_impl(&dword_1885A9000, v78, OS_LOG_TYPE_FAULT, v79, buf, 2u);
    goto LABEL_63;
  }
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_63;
    *(_WORD *)buf = 0;
    v78 = MEMORY[0x1E0C81028];
    v79 = "Assertion failed: coordinates != ((void *)0)";
    goto LABEL_65;
  }
  v85.receiver = self;
  v85.super_class = (Class)GEOComposedRouteVisualInfo;
  v13 = -[GEOComposedRouteVisualInfo init](&v85, sel_init);
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v10, "labelInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      title = v14->_title;
      v14->_title = (GEOFormattedString *)v18;

      objc_msgSend(v16, "detail");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      detail = v14->_detail;
      v14->_detail = (GEOFormattedString *)v21;

      v23 = [GEOComposedString alloc];
      objc_msgSend(v16, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[GEOComposedString initWithGeoFormattedString:](v23, "initWithGeoFormattedString:", v24);
      titleString = v14->_titleString;
      v14->_titleString = (GEOComposedString *)v25;

      v27 = [GEOComposedString alloc];
      objc_msgSend(v16, "detail");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[GEOComposedString initWithGeoFormattedString:](v27, "initWithGeoFormattedString:", v28);
      detailString = v14->_detailString;
      v14->_detailString = (GEOComposedString *)v29;

      objc_msgSend(v16, "labelStyleAttributes");
      v31 = objc_claimAutoreleasedReturnValue();
      styleAttributes = v14->_styleAttributes;
      v14->_styleAttributes = (GEOStyleAttributes *)v31;

      objc_msgSend(v16, "iconArtwork");
      v33 = objc_claimAutoreleasedReturnValue();
      icon = v14->_icon;
      v14->_icon = (GEOPBTransitArtwork *)v33;
    }
    else
    {
      objc_msgSend(v10, "styleAttributes");
      v36 = objc_claimAutoreleasedReturnValue();
      icon = v14->_styleAttributes;
      v14->_styleAttributes = (GEOStyleAttributes *)v36;
    }

    -[GEOStyleAttributes attributes](v14->_styleAttributes, "attributes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_type = -[GEOComposedRouteVisualInfo _typeForStyleAttribute:](v14, "_typeForStyleAttribute:", v38);

    objc_msgSend(v10, "laneChangeInfos");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      v41 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v10, "laneChangeInfos");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "arrayWithCapacity:", objc_msgSend(v42, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v80 = v10;
      objc_msgSend(v10, "laneChangeInfos");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v82 != v47)
              objc_enumerationMutation(v44);
            v49 = -[GEOComposedRouteLaneChangeInfo initWithGeoLaneChangeInfo:pathIndex:coordinates:distanceOffset:]([GEOComposedRouteLaneChangeInfo alloc], "initWithGeoLaneChangeInfo:pathIndex:coordinates:distanceOffset:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i), a4, v12, a6);
            if (v49)
              objc_msgSend(v43, "addObject:", v49);

          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
        }
        while (v46);
      }

      v50 = objc_msgSend(v43, "copy");
      laneChangeInfos = v14->_laneChangeInfos;
      v14->_laneChangeInfos = (NSArray *)v50;

      v10 = v80;
    }
    objc_msgSend(v12, "distanceFromStartToStartOfPathIndex:", a4);
    v53 = v52;
    v54 = objc_msgSend(v12, "routeCoordinateRangeForPathIndex:", a4);
    v56 = v55;
    v57 = v53 + a6;
    v58 = v53 + a6 + (float)objc_msgSend(v10, "startOffsetCm") * 0.01;
    v59 = (float)objc_msgSend(v10, "endOffsetCm");
    v60 = objc_msgSend(v12, "routeCoordinateForDistanceAfterStart:", v58);
    if ((_DWORD)v56 == (_DWORD)v54)
    {
      v61 = v54;
      v62 = v56;
      if (*((float *)&v56 + 1) == *((float *)&v54 + 1)
        || (v61 = v54, v62 = v56, *((float *)&v56 + 1) >= *((float *)&v54 + 1)))
      {
LABEL_25:
        v63 = *((float *)&v61 + 1);
        if ((_DWORD)v61 == (_DWORD)v60)
        {
          v64 = *((float *)&v61 + 1) != *((float *)&v60 + 1) && *((float *)&v61 + 1) < *((float *)&v60 + 1);
          v65 = v61;
          if (!v64)
          {
LABEL_30:
            if ((_DWORD)v61 == (_DWORD)v62)
            {
              if (v63 == *((float *)&v62 + 1) || v63 >= *((float *)&v62 + 1))
              {
LABEL_38:
                v14->_routeCoordinateRange.start = (PolylineCoordinate)v62;
                v66 = objc_msgSend(v12, "routeCoordinateForDistanceAfterStart:", v57 + v59 * 0.01);
                if ((_DWORD)v56 == (_DWORD)v54)
                {
                  if (*((float *)&v56 + 1) == *((float *)&v54 + 1) || *((float *)&v56 + 1) >= *((float *)&v54 + 1))
                    goto LABEL_41;
                }
                else if (v56 >= v54)
                {
LABEL_41:
                  v67 = v54;
                  v54 = v56;
                  goto LABEL_44;
                }
                v67 = v56;
LABEL_44:
                v68 = *((float *)&v67 + 1);
                if ((_DWORD)v67 == (_DWORD)v66)
                {
                  v69 = *((float *)&v67 + 1) != *((float *)&v66 + 1) && *((float *)&v67 + 1) < *((float *)&v66 + 1);
                  v70 = v67;
                  if (!v69)
                  {
LABEL_49:
                    if ((_DWORD)v67 == (_DWORD)v54)
                    {
                      if (v68 == *((float *)&v54 + 1) || v68 >= *((float *)&v54 + 1))
                        goto LABEL_57;
                    }
                    else if (v67 >= v54)
                    {
LABEL_57:
                      v14->_routeCoordinateRange.end = (PolylineCoordinate)v54;
                      objc_msgSend(v12, "coordinateForRouteCoordinate:", *(_QWORD *)&v14->_routeCoordinateRange.start);
                      v14->_startCoordinate.latitude = v71;
                      v14->_startCoordinate.longitude = v72;
                      v14->_startCoordinate.altitude = v73;
                      objc_msgSend(v12, "coordinateForRouteCoordinate:", *(_QWORD *)&v14->_routeCoordinateRange.end);
                      v14->_endCoordinate.latitude = v74;
                      v14->_endCoordinate.longitude = v75;
                      v14->_endCoordinate.altitude = v76;
                      self = v14;

                      v35 = self;
LABEL_58:

                      goto LABEL_59;
                    }
                    v54 = v70;
                    goto LABEL_57;
                  }
                }
                else
                {
                  v70 = v67;
                  if (v67 >= v66)
                    goto LABEL_49;
                }
                v68 = *((float *)&v66 + 1);
                LODWORD(v67) = v66;
                v70 = v66;
                goto LABEL_49;
              }
            }
            else if (v61 >= v62)
            {
              goto LABEL_38;
            }
            v62 = v65;
            goto LABEL_38;
          }
        }
        else
        {
          v65 = v61;
          if (v61 >= v60)
            goto LABEL_30;
        }
        v63 = *((float *)&v60 + 1);
        LODWORD(v61) = v60;
        v65 = v60;
        goto LABEL_30;
      }
    }
    else
    {
      v61 = v54;
      v62 = v56;
      if (v56 >= v54)
        goto LABEL_25;
    }
    v61 = v56;
    v62 = v54;
    goto LABEL_25;
  }
  v35 = 0;
LABEL_59:

  return v35;
}

- (unint64_t)_typeForStyleAttribute:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "key");
  else
    return 0;
}

+ (id)visualInfosForGeoWaypointRoute:(id)a3 coordinates:(id)a4 updateable:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "routeLegsCount"))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(v8, "routeLegs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "routeLineStyleInfos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_infosForRouteLineStyleInfos:pathIndex:coordinates:updateable:", v14, v10, v9, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
      {
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "addObjectsFromArray:", v15);
      }

      ++v10;
    }
    while (v10 < objc_msgSend(v8, "routeLegsCount"));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)visualInfosForRouteLabelsForGeoWaypointRoute:(id)a3 coordinates:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64x2_t v33;
  int8x8_t v34;
  int8x16_t v35;
  int8x16_t v36;
  float32x2_t v37;
  int32x2_t v38;
  int8x16_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  GEOComposedRouteVisualInfo *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint8_t buf[16];

  v5 = a3;
  v63 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeLegs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    __asm { FMOV            V15.2S, #-1.0 }
    v59 = v5;
    do
    {
      objc_msgSend(v5, "routeLegs", v59);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v8;
      objc_msgSend(v14, "objectAtIndexedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "routeNames");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v18 = 0;
        v61 = v15;
        do
        {
          objc_msgSend(v15, "routeNames");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v18;
          objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "nameRanges");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (v22)
          {
            v23 = 0;
            do
            {
              objc_msgSend(v20, "nameRanges");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v25, "hasStartValidDistanceOffsetCm")
                && objc_msgSend(v25, "hasEndValidDistanceOffsetCm")
                && objc_msgSend(v20, "hasNameInfo")
                && (objc_msgSend(v20, "nameInfo"),
                    v26 = (void *)objc_claimAutoreleasedReturnValue(),
                    v27 = objc_msgSend(v26, "hasName"),
                    v26,
                    (v27 & 1) != 0))
              {
                objc_msgSend(v20, "nameInfo");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "name");
                v29 = objc_claimAutoreleasedReturnValue();

                v30 = objc_msgSend(v63, "routeCoordinateForDistanceAfterStart:", (float)objc_msgSend(v25, "startValidDistanceOffsetCm") * 0.01);
                v31 = objc_msgSend(v63, "routeCoordinateForDistanceAfterStart:", (float)objc_msgSend(v25, "endValidDistanceOffsetCm") * 0.01);
                v32 = v31;
                v33.i64[0] = v30;
                v33.i64[1] = v31;
                *(int32x2_t *)v33.i8 = vshrn_n_s64(v33, 0x20uLL);
                v34 = (int8x8_t)vcltz_f32(*(float32x2_t *)v33.i8);
                v35.i64[0] = v34.i32[0];
                v35.i64[1] = v34.i32[1];
                v36 = v35;
                v37 = vrndm_f32(*(float32x2_t *)v33.i8);
                v38 = vadd_s32((int32x2_t)vcvt_u32_f32(v37), (int32x2_t)__PAIR64__(v31, v30));
                v35.i64[0] = v38.u32[0];
                v35.i64[1] = v38.u32[1];
                v39 = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)vbsl_s8(v34, _D15, (int8x8_t)vsub_f32(*(float32x2_t *)v33.i8, v37)), 0x20uLL), vbicq_s8(v35, v36));
                v40 = v39.i64[1];
                v41 = v39.i64[0];
                objc_msgSend(v63, "coordinateForRouteCoordinate:", v30);
                v43 = v42;
                v45 = v44;
                v47 = v46;
                objc_msgSend(v63, "coordinateForRouteCoordinate:", v32);
                v51 = -[GEOComposedRouteVisualInfo initWithType:title:detail:routeCoordinateRange:startLocationCoordinate:endLocationCoordinate:]([GEOComposedRouteVisualInfo alloc], "initWithType:title:detail:routeCoordinateRange:startLocationCoordinate:endLocationCoordinate:", 131074, v29, 0, v41, v40, v43, v45, v47, v48, v49, v50);
                objc_msgSend(v62, "addObject:", v51);

              }
              else
              {
                GEOGetGEOComposedRouteLog_0();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_FAULT, "Routing error. All the fields must be set by Routing", buf, 2u);
                }
              }

              ++v23;
              objc_msgSend(v20, "nameRanges");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "count");

            }
            while (v23 < v53);
          }

          v18 = v64 + 1;
          v15 = v61;
          objc_msgSend(v61, "routeNames");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "count");

        }
        while (v64 + 1 < v55);
      }

      v5 = v59;
      v8 = v60 + 1;
      objc_msgSend(v59, "routeLegs");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "count");

    }
    while (v60 + 1 < v57);
  }

  return v62;
}

+ (id)cameraInfosForGeoWaypointRoute:(id)a3 coordinates:(id)a4 updateable:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "routeLegsCount"))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(v8, "routeLegs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "routeCameraInputInfos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_infosForRouteLineStyleInfos:pathIndex:coordinates:updateable:", v14, v10, v9, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
      {
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "addObjectsFromArray:", v15);
      }

      ++v10;
    }
    while (v10 < objc_msgSend(v8, "routeLegsCount"));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)visualInfosForRoute:(id)a3 etaRoute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  GEOComposedRouteVisualInfo *v34;
  uint64_t v35;
  void *v36;
  GEOComposedRouteVisualInfo *v37;
  NSObject *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  unint64_t v44;
  __int128 v46;
  void *v47;
  NSObject *v48;
  unint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  int v57;
  __int16 v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v50 = v5;
  if (!v5 || !v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: route != ((void *)0) && etaRoute != ((void *)0)", buf, 2u);
    }
    goto LABEL_26;
  }
  objc_msgSend(v6, "geoETAWaypointRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeLegs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
LABEL_26:
    v12 = 0;
    goto LABEL_27;
  }
  v12 = 0;
  v13 = 0;
  *(_QWORD *)&v11 = 67109376;
  v46 = v11;
  v47 = v7;
  do
  {
    objc_msgSend(v7, "legs", v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "originalLegIndex");
    objc_msgSend(v50, "legs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v16 >= v18)
    {
      GEOGetGEOComposedRouteLog_0();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        v39 = objc_msgSend(v15, "originalLegIndex");
        objc_msgSend(v50, "legs");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");
        *(_DWORD *)buf = v46;
        v57 = v39;
        v58 = 1024;
        v59 = v41;
        _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_FAULT, "ETA route leg's original leg index (%d) is beyond bounds of route's leg count (%d). This likely means an error creating the ETA route.", buf, 0xEu);

      }
    }
    else
    {
      v19 = 0.0;
      if (!v13)
      {
        objc_msgSend(v50, "legs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v15, "originalLegIndex"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "distance");
        v23 = v22;
        objc_msgSend(v15, "length");
        v19 = v23 - v24;

      }
      objc_msgSend(v7, "geoETAWaypointRoute");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "routeLegs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v13;
      objc_msgSend(v26, "objectAtIndexedSubscript:", v13);
      v27 = objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v48 = v27;
      -[NSObject routeLineStyleInfos](v27, "routeLineStyleInfos");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v52;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v52 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v32);
            v34 = [GEOComposedRouteVisualInfo alloc];
            v35 = objc_msgSend(v15, "originalLegIndex");
            objc_msgSend(v50, "coordinates");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[GEOComposedRouteVisualInfo initWithGeoRouteLineStyleInfo:pathIndex:coordinates:distanceOffset:](v34, "initWithGeoRouteLineStyleInfo:pathIndex:coordinates:distanceOffset:", v33, v35, v36, v19);

            if (v37)
            {
              if (!v12)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v12, "addObject:", v37);
            }

            ++v32;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v30);
      }

      v7 = v47;
      v38 = v48;
      v13 = v49;
    }

    ++v13;
    objc_msgSend(v7, "geoETAWaypointRoute");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "routeLegs");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");

  }
  while (v13 < v44);
LABEL_27:

  return v12;
}

+ (id)cameraInfosForRoute:(id)a3 etaRoute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  GEOComposedRouteVisualInfo *v37;
  uint64_t v38;
  void *v39;
  GEOComposedRouteVisualInfo *v40;
  NSObject *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  unint64_t v47;
  __int128 v49;
  void *v50;
  NSObject *v51;
  unint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v53 = v5;
  if (!v5
    || !v6
    || (objc_msgSend(v5, "uniqueRouteID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "uniqueRouteID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        !v10))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: route != ((void *)0) && etaRoute != ((void *)0) && [route.uniqueRouteID isEqual:etaRoute.uniqueRouteID]", buf, 2u);
    }
    goto LABEL_27;
  }
  objc_msgSend(v7, "geoETAWaypointRoute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "routeLegs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
LABEL_27:
    v16 = 0;
    goto LABEL_28;
  }
  v15 = 0;
  v16 = 0;
  *(_QWORD *)&v14 = 67109376;
  v49 = v14;
  v50 = v7;
  do
  {
    objc_msgSend(v7, "legs", v49);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "originalLegIndex");
    objc_msgSend(v53, "legs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v19 >= v21)
    {
      GEOGetGEOComposedRouteLog_0();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        v42 = objc_msgSend(v18, "originalLegIndex");
        objc_msgSend(v53, "legs");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");
        *(_DWORD *)buf = v49;
        v60 = v42;
        v61 = 1024;
        v62 = v44;
        _os_log_impl(&dword_1885A9000, v41, OS_LOG_TYPE_FAULT, "ETA route leg's original leg index (%d) is beyond bounds of route's leg count (%d). This likely means an error creating the ETA route.", buf, 0xEu);

      }
    }
    else
    {
      v22 = 0.0;
      if (!v15)
      {
        objc_msgSend(v53, "legs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v18, "originalLegIndex"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "distance");
        v26 = v25;
        objc_msgSend(v18, "length");
        v22 = v26 - v27;

      }
      objc_msgSend(v7, "geoETAWaypointRoute");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "routeLegs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v15;
      objc_msgSend(v29, "objectAtIndexedSubscript:", v15);
      v30 = objc_claimAutoreleasedReturnValue();

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v51 = v30;
      -[NSObject routeCameraInputInfos](v30, "routeCameraInputInfos");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v55 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            v37 = [GEOComposedRouteVisualInfo alloc];
            v38 = objc_msgSend(v18, "originalLegIndex");
            objc_msgSend(v53, "coordinates");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[GEOComposedRouteVisualInfo initWithGeoRouteLineStyleInfo:pathIndex:coordinates:distanceOffset:](v37, "initWithGeoRouteLineStyleInfo:pathIndex:coordinates:distanceOffset:", v36, v38, v39, v22);

            if (v40)
            {
              if (!v16)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v16, "addObject:", v40);
            }

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v33);
      }

      v7 = v50;
      v41 = v51;
      v15 = v52;
    }

    ++v15;
    objc_msgSend(v7, "geoETAWaypointRoute");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "routeLegs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

  }
  while (v15 < v47);
LABEL_28:

  return v16;
}

+ (id)_infosForRouteLineStyleInfos:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 updateable:(BOOL)a6
{
  int v6;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  GEOComposedRouteVisualInfo *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v16, "preserveStyleInUpdates") != v6)
        {
          v17 = -[GEOComposedRouteVisualInfo initWithGeoRouteLineStyleInfo:pathIndex:coordinates:distanceOffset:]([GEOComposedRouteVisualInfo alloc], "initWithGeoRouteLineStyleInfo:pathIndex:coordinates:distanceOffset:", v16, a4, v10, 0.0);
          if (v17)
          {
            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v13, "addObject:", v17);
          }

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
