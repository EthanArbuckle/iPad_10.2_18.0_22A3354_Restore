@implementation MKServerFormattedString

- (MKServerFormattedString)initWithGeoServerString:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  MKServerFormattedString *v9;
  MKServerFormattedString *v10;
  uint64_t v11;
  MKServerFormattedStringParameters *parameters;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKServerFormattedString;
  v9 = -[MKServerFormattedString init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_geoServerString, a3);
    -[MKServerFormattedString _parametersByScrubbingUnusedOverrideVariablesFromParameters:geoServerString:](v10, "_parametersByScrubbingUnusedOverrideVariablesFromParameters:geoServerString:", v8, v10->_geoServerString);
    v11 = objc_claimAutoreleasedReturnValue();
    parameters = v10->_parameters;
    v10->_parameters = (MKServerFormattedStringParameters *)v11;

  }
  return v10;
}

- (MKServerFormattedString)initWithComposedString:(id)a3
{
  id v5;
  MKServerFormattedString *v6;
  MKServerFormattedString *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKServerFormattedString;
  v6 = -[MKServerFormattedString init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_composedString, a3);

  return v7;
}

- (MKServerFormattedString)initWithCoder:(id)a3
{
  id v4;
  MKServerFormattedString *v5;
  uint64_t v6;
  GEOServerFormattedString *geoServerString;
  uint64_t v8;
  MKServerFormattedStringParameters *parameters;
  uint64_t v10;
  GEOComposedString *composedString;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKServerFormattedString;
  v5 = -[MKServerFormattedString init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoServerString"));
    v6 = objc_claimAutoreleasedReturnValue();
    geoServerString = v5->_geoServerString;
    v5->_geoServerString = (GEOServerFormattedString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (MKServerFormattedStringParameters *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("composedString"));
    v10 = objc_claimAutoreleasedReturnValue();
    composedString = v5->_composedString;
    v5->_composedString = (GEOComposedString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOServerFormattedString *geoServerString;
  id v5;

  geoServerString = self->_geoServerString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", geoServerString, CFSTR("geoServerString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_composedString, CFSTR("composedString"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_parametersByScrubbingUnusedOverrideVariablesFromParameters:(id)a3 geoServerString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MKServerFormattedStringParameters *v18;
  MKServerFormattedStringParameters *v19;
  void *v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = v6;
  objc_msgSend(v6, "formatTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v5, "variableOverrides");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "token");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v13, "token");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v18 = [MKServerFormattedStringParameters alloc];
  if (v5)
    objc_msgSend(v5, "options");
  else
    memset(v22, 0, sizeof(v22));
  v19 = -[MKServerFormattedStringParameters initWithOptions:variableOverrides:](v18, "initWithOptions:variableOverrides:", v22, v7);

  return v19;
}

- (id)_textAttachmentForGeoArtwork:(id)a3 attributes:(id)a4 accessibilityText:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  int v36;
  void *v37;
  unsigned __int8 v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkSizeAttribute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "unsignedIntegerValue");
  else
    v12 = 4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkFeatureTypeAttributeKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "unsignedIntegerValue");
  else
    v15 = 2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;

  +[MKTransitArtworkManager sharedInstance](MKTransitArtworkManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:", v7, v12, v15, 0, v18);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkAlphaAttribute"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  if (v23 > 0.0 && v23 < 1.0)
  {
    -[NSObject _mapkit_imageWithAlpha:](v20, "_mapkit_imageWithAlpha:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v20 = v24;
  }
  if (v20)
  {
    v49 = v7;
    if (MKTransitArtworkDataSourceAllowMasking(v7))
    {
      -[NSObject imageWithRenderingMode:](v20, "imageWithRenderingMode:", 2);
      v25 = objc_claimAutoreleasedReturnValue();

      v20 = v25;
    }
    v26 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    objc_msgSend(v26, "setImage:", v20);
    v27 = v9;
    objc_msgSend(v26, "setAccessibilityLabel:", v9);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject size](v20, "size");
    v30 = v29;
    v32 = v31;
    objc_msgSend(v28, "ascender");
    v34 = v33;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkMatchLineHeightAttributeKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");

    if (v28)
    {
      v39 = v30 / v32;
      if (v36)
      {
        objc_msgSend(v28, "_mapkit_lineHeight");
        v32 = v40;
        v30 = v39 * v40;
      }
      else if ((v38 & (v32 > v34)) != 0)
      {
        v32 = v34;
        v30 = v34 * v39;
      }
    }
    v9 = v27;
    objc_msgSend(v8, "objectForKey:", CFSTR("MKServerFormattedStringArtworkScaleAttributeKey"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    v7 = v49;
    if (v41)
    {
      objc_msgSend(v41, "cgFloatValue");
      v30 = v30 * v43;
      objc_msgSend(v42, "cgFloatValue");
      v32 = v32 * v44;
    }
    objc_msgSend(v28, "capHeight");
    v46 = (v45 - v32) * 0.5;
    v47 = 0.0;
    if (v28)
      v47 = v46;
    objc_msgSend(v26, "setBounds:", 0.0, v47, v30, v32);

  }
  else
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v7;
      _os_log_impl(&dword_18B0B0000, v20, OS_LOG_TYPE_ERROR, "Could not find requested shield: %@", buf, 0xCu);
    }
    v26 = 0;
  }

  return v26;
}

- (id)_textAttachmentForManeuver:(int)a3 junctionInfo:(id)a4 defaultAttributes:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  CGFloat v33;
  NSObject *v34;
  __CFString *v35;
  int v36;
  void *v37;
  double v38;
  CGFloat v39;
  NSObject *v40;
  __CFString *v41;
  int v42;
  void *v43;
  double v44;
  CGFloat v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v56;
  double v57[62];
  double v58[62];
  double v59[62];
  uint8_t buf[4];
  __CFString *v61;
  uint64_t v62;

  v6 = *(_QWORD *)&a3;
  v62 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v6 <= 0x27 && ((1 << v6) & 0x8600050000) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("MKServerFormattedStringArtworkArrivalIconImageKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_221;
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v6 - 16;
      if ((v6 - 16) < 0x18 && ((0x8E7FF7u >> v12) & 1) != 0)
      {
        v13 = off_1E20DA0C0[v12];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v61 = v13;
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_ERROR, "No arrival icon image for maneuver token: %@", buf, 0xCu);

    }
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("MKServerFormattedStringArtworkArrowFillColorAttributeKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(v9, "objectForKey:", CFSTR("MKServerFormattedStringArtworkJunctionFillColorAttributeKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v56 = v20;
  v21 = v17;

  objc_msgSend(v9, "objectForKey:", CFSTR("MKServerFormattedStringArtworkSideLengthAttributeKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    GEOFindOrCreateLog();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = CFSTR("NO_TURN");
      switch((int)v6)
      {
        case 0:
          break;
        case 1:
          v24 = CFSTR("LEFT_TURN");
          break;
        case 2:
          v24 = CFSTR("RIGHT_TURN");
          break;
        case 3:
          v24 = CFSTR("STRAIGHT_AHEAD");
          break;
        case 4:
          v24 = CFSTR("U_TURN");
          break;
        case 5:
          v24 = CFSTR("FOLLOW_ROAD");
          break;
        case 6:
          v24 = CFSTR("ENTER_ROUNDABOUT");
          break;
        case 7:
          v24 = CFSTR("EXIT_ROUNDABOUT");
          break;
        case 11:
          v24 = CFSTR("OFF_RAMP");
          break;
        case 12:
          v24 = CFSTR("ON_RAMP");
          break;
        case 16:
          v24 = CFSTR("ARRIVE_END_OF_NAVIGATION");
          break;
        case 17:
          v24 = CFSTR("START_ROUTE");
          break;
        case 18:
          v24 = CFSTR("ARRIVE_AT_DESTINATION");
          break;
        case 20:
          v24 = CFSTR("KEEP_LEFT");
          break;
        case 21:
          v24 = CFSTR("KEEP_RIGHT");
          break;
        case 22:
          v24 = CFSTR("ENTER_FERRY");
          break;
        case 23:
          v24 = CFSTR("EXIT_FERRY");
          break;
        case 24:
          v24 = CFSTR("CHANGE_FERRY");
          break;
        case 25:
          v24 = CFSTR("START_ROUTE_WITH_U_TURN");
          break;
        case 26:
          v24 = CFSTR("U_TURN_AT_ROUNDABOUT");
          break;
        case 27:
          v24 = CFSTR("LEFT_TURN_AT_END");
          break;
        case 28:
          v24 = CFSTR("RIGHT_TURN_AT_END");
          break;
        case 29:
          v24 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
          break;
        case 30:
          v24 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
          break;
        case 33:
          v24 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
          break;
        case 34:
          v24 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
          break;
        case 35:
          v24 = CFSTR("U_TURN_WHEN_POSSIBLE");
          break;
        case 39:
          v24 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
          break;
        case 41:
          v24 = CFSTR("ROUNDABOUT_EXIT_1");
          break;
        case 42:
          v24 = CFSTR("ROUNDABOUT_EXIT_2");
          break;
        case 43:
          v24 = CFSTR("ROUNDABOUT_EXIT_3");
          break;
        case 44:
          v24 = CFSTR("ROUNDABOUT_EXIT_4");
          break;
        case 45:
          v24 = CFSTR("ROUNDABOUT_EXIT_5");
          break;
        case 46:
          v24 = CFSTR("ROUNDABOUT_EXIT_6");
          break;
        case 47:
          v24 = CFSTR("ROUNDABOUT_EXIT_7");
          break;
        case 48:
          v24 = CFSTR("ROUNDABOUT_EXIT_8");
          break;
        case 49:
          v24 = CFSTR("ROUNDABOUT_EXIT_9");
          break;
        case 50:
          v24 = CFSTR("ROUNDABOUT_EXIT_10");
          break;
        case 51:
          v24 = CFSTR("ROUNDABOUT_EXIT_11");
          break;
        case 52:
          v24 = CFSTR("ROUNDABOUT_EXIT_12");
          break;
        case 53:
          v24 = CFSTR("ROUNDABOUT_EXIT_13");
          break;
        case 54:
          v24 = CFSTR("ROUNDABOUT_EXIT_14");
          break;
        case 55:
          v24 = CFSTR("ROUNDABOUT_EXIT_15");
          break;
        case 56:
          v24 = CFSTR("ROUNDABOUT_EXIT_16");
          break;
        case 57:
          v24 = CFSTR("ROUNDABOUT_EXIT_17");
          break;
        case 58:
          v24 = CFSTR("ROUNDABOUT_EXIT_18");
          break;
        case 59:
          v24 = CFSTR("ROUNDABOUT_EXIT_19");
          break;
        case 60:
          v24 = CFSTR("SHARP_LEFT_TURN");
          break;
        case 61:
          v24 = CFSTR("SHARP_RIGHT_TURN");
          break;
        case 62:
          v24 = CFSTR("SLIGHT_LEFT_TURN");
          break;
        case 63:
          v24 = CFSTR("SLIGHT_RIGHT_TURN");
          break;
        case 64:
          v24 = CFSTR("CHANGE_HIGHWAY");
          break;
        case 65:
          v24 = CFSTR("CHANGE_HIGHWAY_LEFT");
          break;
        case 66:
          v24 = CFSTR("CHANGE_HIGHWAY_RIGHT");
          break;
        case 80:
          v24 = CFSTR("TOLL_STATION");
          break;
        case 81:
          v24 = CFSTR("ENTER_TUNNEL");
          break;
        case 82:
          v24 = CFSTR("WAYPOINT_STOP");
          break;
        case 83:
          v24 = CFSTR("WAYPOINT_STOP_LEFT");
          break;
        case 84:
          v24 = CFSTR("WAYPOINT_STOP_RIGHT");
          break;
        case 85:
          v24 = CFSTR("RESUME_ROUTE");
          break;
        case 86:
          v24 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
          break;
        case 87:
          v24 = CFSTR("CUSTOM");
          break;
        case 88:
          v24 = CFSTR("TURN_AROUND");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      *(_DWORD *)buf = 138412290;
      v61 = v24;
      _os_log_impl(&dword_18B0B0000, v23, OS_LOG_TYPE_ERROR, "No side length attribute for maneuver token: %@", buf, 0xCu);

    }
  }
  objc_msgSend(v22, "cgFloatValue");
  v26 = v25;
  v27 = objc_msgSend(v7, "junctionType");
  v28 = objc_msgSend(v7, "drivingSide");
  v29 = objc_msgSend(v7, "junctionElements");
  v30 = objc_msgSend(v7, "junctionElementsCount");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", MKDefaultJunctionManeuverMetrics((uint64_t)v59));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "scale");
  v33 = v32;

  MKJunctionArrowImage(v27, v6, v28, v29, v30, v59, v21, v56, v26, v26, v33, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    GEOFindOrCreateLog();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = CFSTR("NO_TURN");
      switch((int)v6)
      {
        case 0:
          break;
        case 1:
          v35 = CFSTR("LEFT_TURN");
          break;
        case 2:
          v35 = CFSTR("RIGHT_TURN");
          break;
        case 3:
          v35 = CFSTR("STRAIGHT_AHEAD");
          break;
        case 4:
          v35 = CFSTR("U_TURN");
          break;
        case 5:
          v35 = CFSTR("FOLLOW_ROAD");
          break;
        case 6:
          v35 = CFSTR("ENTER_ROUNDABOUT");
          break;
        case 7:
          v35 = CFSTR("EXIT_ROUNDABOUT");
          break;
        case 11:
          v35 = CFSTR("OFF_RAMP");
          break;
        case 12:
          v35 = CFSTR("ON_RAMP");
          break;
        case 16:
          v35 = CFSTR("ARRIVE_END_OF_NAVIGATION");
          break;
        case 17:
          v35 = CFSTR("START_ROUTE");
          break;
        case 18:
          v35 = CFSTR("ARRIVE_AT_DESTINATION");
          break;
        case 20:
          v35 = CFSTR("KEEP_LEFT");
          break;
        case 21:
          v35 = CFSTR("KEEP_RIGHT");
          break;
        case 22:
          v35 = CFSTR("ENTER_FERRY");
          break;
        case 23:
          v35 = CFSTR("EXIT_FERRY");
          break;
        case 24:
          v35 = CFSTR("CHANGE_FERRY");
          break;
        case 25:
          v35 = CFSTR("START_ROUTE_WITH_U_TURN");
          break;
        case 26:
          v35 = CFSTR("U_TURN_AT_ROUNDABOUT");
          break;
        case 27:
          v35 = CFSTR("LEFT_TURN_AT_END");
          break;
        case 28:
          v35 = CFSTR("RIGHT_TURN_AT_END");
          break;
        case 29:
          v35 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
          break;
        case 30:
          v35 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
          break;
        case 33:
          v35 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
          break;
        case 34:
          v35 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
          break;
        case 35:
          v35 = CFSTR("U_TURN_WHEN_POSSIBLE");
          break;
        case 39:
          v35 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
          break;
        case 41:
          v35 = CFSTR("ROUNDABOUT_EXIT_1");
          break;
        case 42:
          v35 = CFSTR("ROUNDABOUT_EXIT_2");
          break;
        case 43:
          v35 = CFSTR("ROUNDABOUT_EXIT_3");
          break;
        case 44:
          v35 = CFSTR("ROUNDABOUT_EXIT_4");
          break;
        case 45:
          v35 = CFSTR("ROUNDABOUT_EXIT_5");
          break;
        case 46:
          v35 = CFSTR("ROUNDABOUT_EXIT_6");
          break;
        case 47:
          v35 = CFSTR("ROUNDABOUT_EXIT_7");
          break;
        case 48:
          v35 = CFSTR("ROUNDABOUT_EXIT_8");
          break;
        case 49:
          v35 = CFSTR("ROUNDABOUT_EXIT_9");
          break;
        case 50:
          v35 = CFSTR("ROUNDABOUT_EXIT_10");
          break;
        case 51:
          v35 = CFSTR("ROUNDABOUT_EXIT_11");
          break;
        case 52:
          v35 = CFSTR("ROUNDABOUT_EXIT_12");
          break;
        case 53:
          v35 = CFSTR("ROUNDABOUT_EXIT_13");
          break;
        case 54:
          v35 = CFSTR("ROUNDABOUT_EXIT_14");
          break;
        case 55:
          v35 = CFSTR("ROUNDABOUT_EXIT_15");
          break;
        case 56:
          v35 = CFSTR("ROUNDABOUT_EXIT_16");
          break;
        case 57:
          v35 = CFSTR("ROUNDABOUT_EXIT_17");
          break;
        case 58:
          v35 = CFSTR("ROUNDABOUT_EXIT_18");
          break;
        case 59:
          v35 = CFSTR("ROUNDABOUT_EXIT_19");
          break;
        case 60:
          v35 = CFSTR("SHARP_LEFT_TURN");
          break;
        case 61:
          v35 = CFSTR("SHARP_RIGHT_TURN");
          break;
        case 62:
          v35 = CFSTR("SLIGHT_LEFT_TURN");
          break;
        case 63:
          v35 = CFSTR("SLIGHT_RIGHT_TURN");
          break;
        case 64:
          v35 = CFSTR("CHANGE_HIGHWAY");
          break;
        case 65:
          v35 = CFSTR("CHANGE_HIGHWAY_LEFT");
          break;
        case 66:
          v35 = CFSTR("CHANGE_HIGHWAY_RIGHT");
          break;
        case 80:
          v35 = CFSTR("TOLL_STATION");
          break;
        case 81:
          v35 = CFSTR("ENTER_TUNNEL");
          break;
        case 82:
          v35 = CFSTR("WAYPOINT_STOP");
          break;
        case 83:
          v35 = CFSTR("WAYPOINT_STOP_LEFT");
          break;
        case 84:
          v35 = CFSTR("WAYPOINT_STOP_RIGHT");
          break;
        case 85:
          v35 = CFSTR("RESUME_ROUTE");
          break;
        case 86:
          v35 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
          break;
        case 87:
          v35 = CFSTR("CUSTOM");
          break;
        case 88:
          v35 = CFSTR("TURN_AROUND");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      *(_DWORD *)buf = 138412290;
      v61 = v35;
      _os_log_impl(&dword_18B0B0000, v34, OS_LOG_TYPE_INFO, "Junction for maneuver type %@ could not be drawn; trying regular maneuver arrow",
        buf,
        0xCu);

    }
    v36 = objc_msgSend(v7, "drivingSide");
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v58));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scale");
    v39 = v38;

    MKManeuverArrowImage(v6, v36, v58, v21, v56, 0, v26, v26, v39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      GEOFindOrCreateLog();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = CFSTR("NO_TURN");
        switch((int)v6)
        {
          case 0:
            break;
          case 1:
            v41 = CFSTR("LEFT_TURN");
            break;
          case 2:
            v41 = CFSTR("RIGHT_TURN");
            break;
          case 3:
            v41 = CFSTR("STRAIGHT_AHEAD");
            break;
          case 4:
            v41 = CFSTR("U_TURN");
            break;
          case 5:
            v41 = CFSTR("FOLLOW_ROAD");
            break;
          case 6:
            v41 = CFSTR("ENTER_ROUNDABOUT");
            break;
          case 7:
            v41 = CFSTR("EXIT_ROUNDABOUT");
            break;
          case 11:
            v41 = CFSTR("OFF_RAMP");
            break;
          case 12:
            v41 = CFSTR("ON_RAMP");
            break;
          case 16:
            v41 = CFSTR("ARRIVE_END_OF_NAVIGATION");
            break;
          case 17:
            v41 = CFSTR("START_ROUTE");
            break;
          case 18:
            v41 = CFSTR("ARRIVE_AT_DESTINATION");
            break;
          case 20:
            v41 = CFSTR("KEEP_LEFT");
            break;
          case 21:
            v41 = CFSTR("KEEP_RIGHT");
            break;
          case 22:
            v41 = CFSTR("ENTER_FERRY");
            break;
          case 23:
            v41 = CFSTR("EXIT_FERRY");
            break;
          case 24:
            v41 = CFSTR("CHANGE_FERRY");
            break;
          case 25:
            v41 = CFSTR("START_ROUTE_WITH_U_TURN");
            break;
          case 26:
            v41 = CFSTR("U_TURN_AT_ROUNDABOUT");
            break;
          case 27:
            v41 = CFSTR("LEFT_TURN_AT_END");
            break;
          case 28:
            v41 = CFSTR("RIGHT_TURN_AT_END");
            break;
          case 29:
            v41 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
            break;
          case 30:
            v41 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
            break;
          case 33:
            v41 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
            break;
          case 34:
            v41 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
            break;
          case 35:
            v41 = CFSTR("U_TURN_WHEN_POSSIBLE");
            break;
          case 39:
            v41 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
            break;
          case 41:
            v41 = CFSTR("ROUNDABOUT_EXIT_1");
            break;
          case 42:
            v41 = CFSTR("ROUNDABOUT_EXIT_2");
            break;
          case 43:
            v41 = CFSTR("ROUNDABOUT_EXIT_3");
            break;
          case 44:
            v41 = CFSTR("ROUNDABOUT_EXIT_4");
            break;
          case 45:
            v41 = CFSTR("ROUNDABOUT_EXIT_5");
            break;
          case 46:
            v41 = CFSTR("ROUNDABOUT_EXIT_6");
            break;
          case 47:
            v41 = CFSTR("ROUNDABOUT_EXIT_7");
            break;
          case 48:
            v41 = CFSTR("ROUNDABOUT_EXIT_8");
            break;
          case 49:
            v41 = CFSTR("ROUNDABOUT_EXIT_9");
            break;
          case 50:
            v41 = CFSTR("ROUNDABOUT_EXIT_10");
            break;
          case 51:
            v41 = CFSTR("ROUNDABOUT_EXIT_11");
            break;
          case 52:
            v41 = CFSTR("ROUNDABOUT_EXIT_12");
            break;
          case 53:
            v41 = CFSTR("ROUNDABOUT_EXIT_13");
            break;
          case 54:
            v41 = CFSTR("ROUNDABOUT_EXIT_14");
            break;
          case 55:
            v41 = CFSTR("ROUNDABOUT_EXIT_15");
            break;
          case 56:
            v41 = CFSTR("ROUNDABOUT_EXIT_16");
            break;
          case 57:
            v41 = CFSTR("ROUNDABOUT_EXIT_17");
            break;
          case 58:
            v41 = CFSTR("ROUNDABOUT_EXIT_18");
            break;
          case 59:
            v41 = CFSTR("ROUNDABOUT_EXIT_19");
            break;
          case 60:
            v41 = CFSTR("SHARP_LEFT_TURN");
            break;
          case 61:
            v41 = CFSTR("SHARP_RIGHT_TURN");
            break;
          case 62:
            v41 = CFSTR("SLIGHT_LEFT_TURN");
            break;
          case 63:
            v41 = CFSTR("SLIGHT_RIGHT_TURN");
            break;
          case 64:
            v41 = CFSTR("CHANGE_HIGHWAY");
            break;
          case 65:
            v41 = CFSTR("CHANGE_HIGHWAY_LEFT");
            break;
          case 66:
            v41 = CFSTR("CHANGE_HIGHWAY_RIGHT");
            break;
          case 80:
            v41 = CFSTR("TOLL_STATION");
            break;
          case 81:
            v41 = CFSTR("ENTER_TUNNEL");
            break;
          case 82:
            v41 = CFSTR("WAYPOINT_STOP");
            break;
          case 83:
            v41 = CFSTR("WAYPOINT_STOP_LEFT");
            break;
          case 84:
            v41 = CFSTR("WAYPOINT_STOP_RIGHT");
            break;
          case 85:
            v41 = CFSTR("RESUME_ROUTE");
            break;
          case 86:
            v41 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
            break;
          case 87:
            v41 = CFSTR("CUSTOM");
            break;
          case 88:
            v41 = CFSTR("TURN_AROUND");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        *(_DWORD *)buf = 138412290;
        v61 = v41;
        _os_log_impl(&dword_18B0B0000, v40, OS_LOG_TYPE_INFO, "Maneuver type %@ could not be drawn; defaulting to .STRAIGHT_AHEAD",
          buf,
          0xCu);

      }
      v42 = objc_msgSend(v7, "drivingSide");
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v57));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "scale");
      v45 = v44;

      MKManeuverArrowImage(3, v42, v57, v21, v56, 0, v26, v26, v45);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_221:
  v46 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  objc_msgSend(v46, "setImage:", v10);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "capHeight");
  v49 = v48;
  objc_msgSend(v10, "size");
  v51 = round(v49 - v50) * 0.5;
  objc_msgSend(v10, "size");
  v53 = v52;
  objc_msgSend(v10, "size");
  objc_msgSend(v46, "setBounds:", 0.0, v51, v53, v54);

  return v46;
}

- (id)_multiPartAttributedStringForComposedStringWithAttributes:(id)a3
{
  id v4;
  GEOComposedString *composedString;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MKMultiPartAttributedString *v11;
  void *v12;
  void *v13;
  MKMultiPartAttributedString *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  MKServerFormattedString *v20;
  id v21;

  v4 = a3;
  composedString = self->_composedString;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke;
  v19 = &unk_1E20DA058;
  v20 = self;
  v6 = v4;
  v21 = v6;
  -[GEOComposedString optionsWithArgumentHandler:](composedString, "optionsWithArgumentHandler:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCreateAttributedString:", 1, v16, v17, v18, v19, v20);
  objc_msgSend(v7, "setStringAttributes:", v6);
  objc_msgSend(v7, "setPreserveIndividualComponents:", 1);
  objc_msgSend(v7, "setFormatStyleHandler:", &__block_literal_global_33);
  -[GEOComposedString stringResultWithOptions:](self->_composedString, "stringResultWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedComponentStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = [MKMultiPartAttributedString alloc];
    objc_msgSend(v8, "attributedComponentStrings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedSeparatorStrings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MKMultiPartAttributedString initWithComponents:separators:](v11, "initWithComponents:separators:", v12, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t IsRightToLeft;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  switch(objc_msgSend(v3, "type"))
  {
    case 2u:
    case 9u:
      v4 = *MEMORY[0x1E0CEA098];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "_mapkit_fontByAddingFeaturesForTimeDisplay");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v4;
        v21[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setStringAttributes:", v8);

      }
      goto LABEL_5;
    case 0xBu:
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_2;
      v19[3] = &unk_1E20DA008;
      v19[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "artworkFormat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAttributedStringHandler:", v19);
LABEL_5:

      break;
    case 0xCu:
      +[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "countdownFormat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOverrideReferenceDate:", v9);

      IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
      objc_msgSend(v3, "countdownFormat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRightToLeft:", IsRightToLeft);
      goto LABEL_8;
    case 0xEu:
      v13 = *MEMORY[0x1E0CEA0C0];
      objc_msgSend(v3, "urlFormat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLinkAttributeName:", v13);
LABEL_8:

      break;
    case 0xFu:
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_3;
      v16[3] = &unk_1E20DA030;
      v14 = *(void **)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 32);
      v18 = v14;
      objc_msgSend(v3, "maneuverFormat", v16[0], 3221225472, __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_3, &unk_1E20DA030, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAttributedStringHandler:", v16);

      break;
    default:
      break;
  }

}

id __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_textAttachmentForGeoArtwork:attributes:accessibilityText:", a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_textAttachmentForManeuver:junctionInfo:defaultAttributes:", a2, a3, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_4(uint64_t a1, int a2)
{
  return +[MKServerFormattedString attributesForServerFormatStyle:](MKServerFormattedString, "attributesForServerFormatStyle:", a2);
}

- (id)multiPartAttributedStringWithAttributes:(id)a3
{
  id v4;
  MKMultiPartAttributedString *v5;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  int v40;
  void *v41;
  unsigned int ShouldBeFlipped;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  const __CFString *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  double v55;
  double v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  int v68;
  void *v69;
  unsigned __int8 v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  double v97;
  CGFloat v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  double v107;
  CGFloat v108;
  NSObject *v109;
  void *v110;
  uint64_t v111;
  __CFString *v112;
  void *v113;
  int v114;
  void *v115;
  void *v116;
  int v117;
  void *v118;
  double v119;
  CGFloat v120;
  NSObject *v121;
  void *v122;
  uint64_t v123;
  __CFString *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  double v129;
  CGFloat v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  uint64_t v138;
  void *v139;
  unint64_t j;
  __CFString *v141;
  void *v142;
  void *v143;
  void *v144;
  id obj;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t i;
  void *v153;
  uint64_t v154;
  id v155;
  unsigned int v156;
  unsigned int v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  uint64_t v167;
  void *context;
  uint64_t v169;
  id v170;
  id v171;
  void *v172;
  MKServerFormattedString *v173;
  uint64_t v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  uint64_t v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _QWORD v191[6];
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t (*v195)(uint64_t, uint64_t);
  void (*v196)(uint64_t);
  id v197;
  uint64_t v198;
  uint64_t *v199;
  uint64_t v200;
  uint64_t (*v201)(uint64_t, uint64_t);
  void (*v202)(uint64_t);
  id v203;
  _OWORD v204[2];
  _BYTE v205[5];
  uint8_t v206[128];
  uint8_t v207[4];
  __CFString *v208;
  uint8_t v209[4];
  __CFString *v210;
  uint8_t buf[4];
  void *v212;
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v151 = v4;
  if (self->_composedString)
  {
    -[MKServerFormattedString _multiPartAttributedStringForComposedStringWithAttributes:](self, "_multiPartAttributedStringForComposedStringWithAttributes:", v4);
    v5 = (MKMultiPartAttributedString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v7 = (void *)MEMORY[0x1E0D27508];
  v173 = self;
  -[MKServerFormattedString geoServerString](self, "geoServerString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverFormattedStringByEvaluatingConditionsInString:", v8);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  v198 = 0;
  v199 = &v198;
  v200 = 0x3032000000;
  v201 = __Block_byref_object_copy__11;
  v202 = __Block_byref_object_dispose__11;
  objc_msgSend(v149, "formatStrings");
  v203 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "formatStyles");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = 0;
  v193 = &v192;
  v194 = 0x3032000000;
  v195 = __Block_byref_object_copy__11;
  v196 = __Block_byref_object_dispose__11;
  objc_msgSend(v149, "separators");
  v197 = (id)objc_claimAutoreleasedReturnValue();
  if (GEOConfigGetBOOL())
  {
    v191[0] = MEMORY[0x1E0C809B0];
    v191[1] = 3221225472;
    v191[2] = __67__MKServerFormattedString_multiPartAttributedStringWithAttributes___block_invoke;
    v191[3] = &unk_1E20DA0A0;
    v191[4] = &v198;
    v191[5] = &v192;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](v191);
    if (!objc_msgSend((id)v193[5], "count") && objc_msgSend((id)v199[5], "count") == 1)
      ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR(" · "));
    if (!objc_msgSend((id)v193[5], "count") && objc_msgSend((id)v199[5], "count") == 1)
      ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR(" · "));

  }
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v153 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend((id)v199[5], "count"));
  -[MKServerFormattedString _attributesByTokenForFormatStyles:](v173, "_attributesByTokenForFormatStyles:", v144);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  obj = (id)v199[5];
  v146 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v206, 16);
  if (v146)
  {
    v147 = *(_QWORD *)v188;
    v174 = *MEMORY[0x1E0CEA098];
    v167 = *MEMORY[0x1E0CEA0C0];
    v154 = *MEMORY[0x1E0CEA0A0];
    do
    {
      for (i = 0; i != v146; ++i)
      {
        if (*(_QWORD *)v188 != v147)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
        if (objc_msgSend(v11, "length"))
        {
          v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27510]), "initWithString:", v11);
          objc_msgSend(v148, "attributedStringWithStyleAttributes:defaultAttributes:", v150, v151);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v179 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v179, "mutableString");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          v185 = 0u;
          v186 = 0u;
          v183 = 0u;
          v184 = 0u;
          objc_msgSend(v149, "formatTokens");
          v155 = (id)objc_claimAutoreleasedReturnValue();
          v159 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v183, v205, 16);
          if (v159)
          {
            v158 = *(_QWORD *)v184;
            do
            {
              v169 = 0;
              do
              {
                if (*(_QWORD *)v184 != v158)
                  objc_enumerationMutation(v155);
                v175 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v169);
                context = (void *)MEMORY[0x18D778BE4]();
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "token");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v178, "rangeOfString:");
                v182 = v13;
                if (v14 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0)
                {
                  while (1)
                  {
                    objc_msgSend(v179, "attributesAtIndex:effectiveRange:", v14, 0);
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v177, "objectForKey:", v16);
                    v17 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v17)
                      break;
LABEL_99:
                    if (objc_msgSend(v17, "length"))
                      objc_msgSend(v179, "replaceCharactersInRange:withAttributedString:", v14, v182, v17);
                    else
                      objc_msgSend(v179, "deleteCharactersInRange:", v14, v182);
                    v89 = objc_msgSend(v17, "length") + v14;
                    if (objc_msgSend(v178, "length") <= v89 || (v90 = objc_msgSend(v178, "length"), v90 == v89))
                    {
                      v182 = 0;
                      v14 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else
                    {
                      v91 = objc_msgSend(v178, "rangeOfString:options:range:", v172, 0, v89, v90 - v89);
                      v182 = v92;
                      v14 = v91;
                    }

                    if (v14 == 0x7FFFFFFFFFFFFFFFLL || !v182)
                      goto LABEL_28;
                  }
                  -[MKServerFormattedString parameters](v173, "parameters");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = v175;
                  v176 = v18;
                  v180 = v19;
                  v181 = v16;
                  if (objc_msgSend(v19, "type") == 11)
                  {
                    objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkSizeAttribute"));
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = v20;
                    if (v20)
                      v22 = objc_msgSend(v20, "unsignedIntegerValue");
                    else
                      v22 = 4;
                    objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkFeatureTypeAttributeKey"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v33;
                    if (v33)
                      v34 = objc_msgSend(v33, "unsignedIntegerValue");
                    else
                      v34 = 2;
                    objc_msgSend(v180, "artworkValue");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "scale");
                    v38 = v37;

                    objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkDebugDescriptionOnlyAttributeKey"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v39, "BOOLValue");

                    if (v40)
                    {
                      objc_msgSend(v35, "shieldDataSource");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      ShouldBeFlipped = ImageForShieldDataSourceTypeShouldBeFlipped(objc_msgSend(v41, "shieldType"));

                      v43 = MKTransitArtworkDataSourceAllowMasking(v35);
                      MKKeyForTransitArtwork(v35, v22, v34, ShouldBeFlipped, 0, 1.0, v38);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v45 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(v180, "token");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v180, "stringValue");
                      v47 = objc_claimAutoreleasedReturnValue();
                      v48 = (void *)v47;
                      v49 = &stru_1E20DFC00;
                      if (v47)
                        v50 = (const __CFString *)v47;
                      else
                        v50 = &stru_1E20DFC00;
                      if (v43)
                        v49 = CFSTR("can mask");
                      objc_msgSend(v45, "stringWithFormat:", CFSTR("{Artwork %@ '%@' %@ (%@)}"), v46, v50, v44, v49);
                      v51 = objc_claimAutoreleasedReturnValue();

                      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v51, v181);
                    }
                    else
                    {
                      +[MKTransitArtworkManager sharedInstance](MKTransitArtworkManager, "sharedInstance");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:", v35, v22, v34, 0, v38);
                      v53 = objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkAlphaAttribute"));
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "doubleValue");
                      v56 = v55;

                      if (v56 > 0.0 && v56 < 1.0)
                      {
                        -[NSObject _mapkit_imageWithAlpha:](v53, "_mapkit_imageWithAlpha:", v56);
                        v57 = objc_claimAutoreleasedReturnValue();

                        v53 = v57;
                      }
                      if (v53)
                      {
                        if (MKTransitArtworkDataSourceAllowMasking(v35))
                        {
                          objc_msgSend(v181, "objectForKeyedSubscript:", v154);
                          v58 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v58)
                            -[NSObject imageWithTintColor:renderingMode:](v53, "imageWithTintColor:renderingMode:", v58, 2);
                          else
                            -[NSObject imageWithRenderingMode:](v53, "imageWithRenderingMode:", 2);
                          v51 = objc_claimAutoreleasedReturnValue();

                        }
                        else
                        {
                          v51 = v53;
                        }
                        v171 = objc_alloc_init(MEMORY[0x1E0CEA258]);
                        objc_msgSend(v171, "setImage:", v51);
                        objc_msgSend(v180, "accessibilityLabel");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v171, "setAccessibilityLabel:", v59);

                        objc_msgSend(v181, "objectForKeyedSubscript:", v174);
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject size](v51, "size");
                        v62 = v61;
                        v64 = v63;
                        objc_msgSend(v60, "ascender");
                        v66 = v65;
                        objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkMatchLineHeightAttributeKey"));
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        v68 = objc_msgSend(v67, "BOOLValue");

                        objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey"));
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        v70 = objc_msgSend(v69, "BOOLValue");

                        if (v60)
                        {
                          v71 = v62 / v64;
                          if (v68)
                          {
                            objc_msgSend(v60, "_mapkit_lineHeight");
                            v64 = v72;
                            v62 = v71 * v72;
                          }
                          else if ((v70 & (v64 > v66)) != 0)
                          {
                            v64 = v66;
                            v62 = v71 * v66;
                          }
                        }
                        objc_msgSend(v181, "objectForKey:", CFSTR("MKServerFormattedStringArtworkScaleAttributeKey"));
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        v74 = v73;
                        if (v73)
                        {
                          objc_msgSend(v73, "cgFloatValue");
                          v76 = v75;
                          objc_msgSend(v74, "cgFloatValue");
                          v62 = v62 * v76;
                          v64 = v64 * v77;
                        }
                        objc_msgSend(v60, "capHeight");
                        v79 = (v78 - v64) * 0.5;
                        if (v60)
                          v80 = v79;
                        else
                          v80 = 0.0;
                        objc_msgSend(v171, "setBounds:", 0.0, v80, v62, v64);
                        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v171);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        GEOFindOrCreateLog();
                        v51 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v212 = v175;
                          _os_log_impl(&dword_18B0B0000, v51, OS_LOG_TYPE_ERROR, "Could not find requested shield: %@", buf, 0xCu);
                        }
                        v27 = 0;
                      }
                    }

LABEL_81:
LABEL_82:

                    if (!v27)
                      goto LABEL_83;
LABEL_90:
                    v84 = objc_msgSend(v180, "type");
                    if (v84 == 9 || v84 == 3)
                    {
                      objc_msgSend(v181, "objectForKeyedSubscript:", v174);
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v85)
                      {
                        v86 = (void *)objc_msgSend(v27, "mutableCopy");
                        objc_msgSend(v85, "_mapkit_fontByAddingFeaturesForTimeDisplay");
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v86, "addAttribute:value:range:", v174, v87, 0, objc_msgSend(v86, "length"));

                        v88 = objc_msgSend(v86, "copy");
                        v27 = (void *)v88;
                      }

                    }
                    if (v27)
                    {
                      v17 = v27;
                    }
                    else
                    {
                      v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E20DFC00);

                    }
                    objc_msgSend(v177, "setObject:forKey:", v17, v181);
                    goto LABEL_99;
                  }
                  if (objc_msgSend(v19, "type") == 14)
                  {
                    objc_msgSend(v19, "urlValue");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_alloc(MEMORY[0x1E0CB3778]);
                    objc_msgSend(v21, "displayTitle");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = (id)objc_msgSend(v23, "initWithString:", v24);

                    objc_msgSend(v21, "url");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "addAttribute:value:range:", v167, v26, 0, objc_msgSend(v25, "length"));

                    v27 = (void *)objc_msgSend(v25, "copy");
                    goto LABEL_82;
                  }
                  if (objc_msgSend(v19, "type") != 15)
                  {
LABEL_83:
                    v81 = (void *)MEMORY[0x1E0CB3940];
                    if (v176)
                      objc_msgSend(v176, "options");
                    else
                      memset(v204, 0, sizeof(v204));
                    objc_msgSend(v176, "variableOverrides");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "_navigation_replacementForFormatToken:options:overrideVariables:", v180, v204, v82);
                    v83 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v83)
                      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v83, v181);
                    else
                      v27 = 0;

                    goto LABEL_90;
                  }
                  objc_msgSend(v19, "maneuverValue");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v28, "maneuverType");

                  if (v29 <= 0x27 && ((1 << v29) & 0x8600050000) != 0)
                  {
                    objc_msgSend(v181, "objectForKey:", CFSTR("MKServerFormattedStringArtworkArrivalIconImageKey"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v21)
                    {
                      GEOFindOrCreateLog();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v212 = v175;
                        _os_log_impl(&dword_18B0B0000, v30, OS_LOG_TYPE_ERROR, "No arrival icon image for token: %@", buf, 0xCu);
                      }

                      goto LABEL_43;
                    }
                  }
                  else
                  {
LABEL_43:
                    objc_msgSend(v181, "objectForKey:", CFSTR("MKServerFormattedStringArtworkArrowFillColorAttributeKey"));
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = v31;
                    if (v31)
                    {
                      v170 = v31;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
                      v170 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v181, "objectForKey:", CFSTR("MKServerFormattedStringArtworkJunctionFillColorAttributeKey"));
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v94 = v93;
                    if (v93)
                    {
                      v166 = v93;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
                      v166 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v181, "objectForKey:", CFSTR("MKServerFormattedStringArtworkSideLengthAttributeKey"));
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    v165 = v95;
                    if (!v95)
                    {
                      GEOFindOrCreateLog();
                      v96 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v212 = v175;
                        _os_log_impl(&dword_18B0B0000, v96, OS_LOG_TYPE_ERROR, "No side length attribute for token: %@", buf, 0xCu);
                      }

                      v95 = 0;
                    }
                    objc_msgSend(v95, "cgFloatValue");
                    v98 = v97;
                    objc_msgSend(v180, "maneuverValue");
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v164, "junctionInfo");
                    v163 = (void *)objc_claimAutoreleasedReturnValue();
                    v157 = objc_msgSend(v163, "junctionType");
                    objc_msgSend(v180, "maneuverValue");
                    v162 = (void *)objc_claimAutoreleasedReturnValue();
                    v156 = objc_msgSend(v162, "maneuverType");
                    objc_msgSend(v180, "maneuverValue");
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v161, "junctionInfo");
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = objc_msgSend(v160, "drivingSide");
                    objc_msgSend(v180, "maneuverValue");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v100, "junctionInfo");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    v102 = objc_msgSend(v101, "junctionElements");
                    objc_msgSend(v180, "maneuverValue");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "junctionInfo");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    v105 = objc_msgSend(v104, "junctionElementsCount");
                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", MKDefaultJunctionManeuverMetrics((uint64_t)buf));
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v106, "scale");
                    v108 = v107;

                    MKJunctionArrowImage(v157, v156, v99, v102, v105, (double *)buf, v170, v166, v98, v98, v108, 0);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v21)
                    {
                      GEOFindOrCreateLog();
                      v109 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v180, "maneuverValue");
                        v110 = (void *)objc_claimAutoreleasedReturnValue();
                        v111 = objc_msgSend(v110, "maneuverType");
                        v112 = CFSTR("NO_TURN");
                        switch((int)v111)
                        {
                          case 0:
                            break;
                          case 1:
                            v112 = CFSTR("LEFT_TURN");
                            break;
                          case 2:
                            v112 = CFSTR("RIGHT_TURN");
                            break;
                          case 3:
                            v112 = CFSTR("STRAIGHT_AHEAD");
                            break;
                          case 4:
                            v112 = CFSTR("U_TURN");
                            break;
                          case 5:
                            v112 = CFSTR("FOLLOW_ROAD");
                            break;
                          case 6:
                            v112 = CFSTR("ENTER_ROUNDABOUT");
                            break;
                          case 7:
                            v112 = CFSTR("EXIT_ROUNDABOUT");
                            break;
                          case 11:
                            v112 = CFSTR("OFF_RAMP");
                            break;
                          case 12:
                            v112 = CFSTR("ON_RAMP");
                            break;
                          case 16:
                            v112 = CFSTR("ARRIVE_END_OF_NAVIGATION");
                            break;
                          case 17:
                            v112 = CFSTR("START_ROUTE");
                            break;
                          case 18:
                            v112 = CFSTR("ARRIVE_AT_DESTINATION");
                            break;
                          case 20:
                            v112 = CFSTR("KEEP_LEFT");
                            break;
                          case 21:
                            v112 = CFSTR("KEEP_RIGHT");
                            break;
                          case 22:
                            v112 = CFSTR("ENTER_FERRY");
                            break;
                          case 23:
                            v112 = CFSTR("EXIT_FERRY");
                            break;
                          case 24:
                            v112 = CFSTR("CHANGE_FERRY");
                            break;
                          case 25:
                            v112 = CFSTR("START_ROUTE_WITH_U_TURN");
                            break;
                          case 26:
                            v112 = CFSTR("U_TURN_AT_ROUNDABOUT");
                            break;
                          case 27:
                            v112 = CFSTR("LEFT_TURN_AT_END");
                            break;
                          case 28:
                            v112 = CFSTR("RIGHT_TURN_AT_END");
                            break;
                          case 29:
                            v112 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
                            break;
                          case 30:
                            v112 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
                            break;
                          case 33:
                            v112 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
                            break;
                          case 34:
                            v112 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
                            break;
                          case 35:
                            v112 = CFSTR("U_TURN_WHEN_POSSIBLE");
                            break;
                          case 39:
                            v112 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
                            break;
                          case 41:
                            v112 = CFSTR("ROUNDABOUT_EXIT_1");
                            break;
                          case 42:
                            v112 = CFSTR("ROUNDABOUT_EXIT_2");
                            break;
                          case 43:
                            v112 = CFSTR("ROUNDABOUT_EXIT_3");
                            break;
                          case 44:
                            v112 = CFSTR("ROUNDABOUT_EXIT_4");
                            break;
                          case 45:
                            v112 = CFSTR("ROUNDABOUT_EXIT_5");
                            break;
                          case 46:
                            v112 = CFSTR("ROUNDABOUT_EXIT_6");
                            break;
                          case 47:
                            v112 = CFSTR("ROUNDABOUT_EXIT_7");
                            break;
                          case 48:
                            v112 = CFSTR("ROUNDABOUT_EXIT_8");
                            break;
                          case 49:
                            v112 = CFSTR("ROUNDABOUT_EXIT_9");
                            break;
                          case 50:
                            v112 = CFSTR("ROUNDABOUT_EXIT_10");
                            break;
                          case 51:
                            v112 = CFSTR("ROUNDABOUT_EXIT_11");
                            break;
                          case 52:
                            v112 = CFSTR("ROUNDABOUT_EXIT_12");
                            break;
                          case 53:
                            v112 = CFSTR("ROUNDABOUT_EXIT_13");
                            break;
                          case 54:
                            v112 = CFSTR("ROUNDABOUT_EXIT_14");
                            break;
                          case 55:
                            v112 = CFSTR("ROUNDABOUT_EXIT_15");
                            break;
                          case 56:
                            v112 = CFSTR("ROUNDABOUT_EXIT_16");
                            break;
                          case 57:
                            v112 = CFSTR("ROUNDABOUT_EXIT_17");
                            break;
                          case 58:
                            v112 = CFSTR("ROUNDABOUT_EXIT_18");
                            break;
                          case 59:
                            v112 = CFSTR("ROUNDABOUT_EXIT_19");
                            break;
                          case 60:
                            v112 = CFSTR("SHARP_LEFT_TURN");
                            break;
                          case 61:
                            v112 = CFSTR("SHARP_RIGHT_TURN");
                            break;
                          case 62:
                            v112 = CFSTR("SLIGHT_LEFT_TURN");
                            break;
                          case 63:
                            v112 = CFSTR("SLIGHT_RIGHT_TURN");
                            break;
                          case 64:
                            v112 = CFSTR("CHANGE_HIGHWAY");
                            break;
                          case 65:
                            v112 = CFSTR("CHANGE_HIGHWAY_LEFT");
                            break;
                          case 66:
                            v112 = CFSTR("CHANGE_HIGHWAY_RIGHT");
                            break;
                          case 80:
                            v112 = CFSTR("TOLL_STATION");
                            break;
                          case 81:
                            v112 = CFSTR("ENTER_TUNNEL");
                            break;
                          case 82:
                            v112 = CFSTR("WAYPOINT_STOP");
                            break;
                          case 83:
                            v112 = CFSTR("WAYPOINT_STOP_LEFT");
                            break;
                          case 84:
                            v112 = CFSTR("WAYPOINT_STOP_RIGHT");
                            break;
                          case 85:
                            v112 = CFSTR("RESUME_ROUTE");
                            break;
                          case 86:
                            v112 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
                            break;
                          case 87:
                            v112 = CFSTR("CUSTOM");
                            break;
                          case 88:
                            v112 = CFSTR("TURN_AROUND");
                            break;
                          default:
                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v111);
                            v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            break;
                        }
                        *(_DWORD *)v209 = 138412290;
                        v210 = v112;
                        _os_log_impl(&dword_18B0B0000, v109, OS_LOG_TYPE_INFO, "Junction for maneuver type %@ could not be drawn; trying regular maneuver arrow",
                          v209,
                          0xCu);

                      }
                      objc_msgSend(v180, "maneuverValue");
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      v114 = objc_msgSend(v113, "maneuverType");
                      objc_msgSend(v180, "maneuverValue");
                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v115, "junctionInfo");
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      v117 = objc_msgSend(v116, "drivingSide");
                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v209));
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v118, "scale");
                      v120 = v119;

                      MKManeuverArrowImage(v114, v117, (double *)v209, v170, v166, 0, v98, v98, v120);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v21)
                      {
                        GEOFindOrCreateLog();
                        v121 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(v180, "maneuverValue");
                          v122 = (void *)objc_claimAutoreleasedReturnValue();
                          v123 = objc_msgSend(v122, "maneuverType");
                          v124 = CFSTR("NO_TURN");
                          switch((int)v123)
                          {
                            case 0:
                              break;
                            case 1:
                              v124 = CFSTR("LEFT_TURN");
                              break;
                            case 2:
                              v124 = CFSTR("RIGHT_TURN");
                              break;
                            case 3:
                              v124 = CFSTR("STRAIGHT_AHEAD");
                              break;
                            case 4:
                              v124 = CFSTR("U_TURN");
                              break;
                            case 5:
                              v124 = CFSTR("FOLLOW_ROAD");
                              break;
                            case 6:
                              v124 = CFSTR("ENTER_ROUNDABOUT");
                              break;
                            case 7:
                              v124 = CFSTR("EXIT_ROUNDABOUT");
                              break;
                            case 11:
                              v124 = CFSTR("OFF_RAMP");
                              break;
                            case 12:
                              v124 = CFSTR("ON_RAMP");
                              break;
                            case 16:
                              v124 = CFSTR("ARRIVE_END_OF_NAVIGATION");
                              break;
                            case 17:
                              v124 = CFSTR("START_ROUTE");
                              break;
                            case 18:
                              v124 = CFSTR("ARRIVE_AT_DESTINATION");
                              break;
                            case 20:
                              v124 = CFSTR("KEEP_LEFT");
                              break;
                            case 21:
                              v124 = CFSTR("KEEP_RIGHT");
                              break;
                            case 22:
                              v124 = CFSTR("ENTER_FERRY");
                              break;
                            case 23:
                              v124 = CFSTR("EXIT_FERRY");
                              break;
                            case 24:
                              v124 = CFSTR("CHANGE_FERRY");
                              break;
                            case 25:
                              v124 = CFSTR("START_ROUTE_WITH_U_TURN");
                              break;
                            case 26:
                              v124 = CFSTR("U_TURN_AT_ROUNDABOUT");
                              break;
                            case 27:
                              v124 = CFSTR("LEFT_TURN_AT_END");
                              break;
                            case 28:
                              v124 = CFSTR("RIGHT_TURN_AT_END");
                              break;
                            case 29:
                              v124 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
                              break;
                            case 30:
                              v124 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
                              break;
                            case 33:
                              v124 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
                              break;
                            case 34:
                              v124 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
                              break;
                            case 35:
                              v124 = CFSTR("U_TURN_WHEN_POSSIBLE");
                              break;
                            case 39:
                              v124 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
                              break;
                            case 41:
                              v124 = CFSTR("ROUNDABOUT_EXIT_1");
                              break;
                            case 42:
                              v124 = CFSTR("ROUNDABOUT_EXIT_2");
                              break;
                            case 43:
                              v124 = CFSTR("ROUNDABOUT_EXIT_3");
                              break;
                            case 44:
                              v124 = CFSTR("ROUNDABOUT_EXIT_4");
                              break;
                            case 45:
                              v124 = CFSTR("ROUNDABOUT_EXIT_5");
                              break;
                            case 46:
                              v124 = CFSTR("ROUNDABOUT_EXIT_6");
                              break;
                            case 47:
                              v124 = CFSTR("ROUNDABOUT_EXIT_7");
                              break;
                            case 48:
                              v124 = CFSTR("ROUNDABOUT_EXIT_8");
                              break;
                            case 49:
                              v124 = CFSTR("ROUNDABOUT_EXIT_9");
                              break;
                            case 50:
                              v124 = CFSTR("ROUNDABOUT_EXIT_10");
                              break;
                            case 51:
                              v124 = CFSTR("ROUNDABOUT_EXIT_11");
                              break;
                            case 52:
                              v124 = CFSTR("ROUNDABOUT_EXIT_12");
                              break;
                            case 53:
                              v124 = CFSTR("ROUNDABOUT_EXIT_13");
                              break;
                            case 54:
                              v124 = CFSTR("ROUNDABOUT_EXIT_14");
                              break;
                            case 55:
                              v124 = CFSTR("ROUNDABOUT_EXIT_15");
                              break;
                            case 56:
                              v124 = CFSTR("ROUNDABOUT_EXIT_16");
                              break;
                            case 57:
                              v124 = CFSTR("ROUNDABOUT_EXIT_17");
                              break;
                            case 58:
                              v124 = CFSTR("ROUNDABOUT_EXIT_18");
                              break;
                            case 59:
                              v124 = CFSTR("ROUNDABOUT_EXIT_19");
                              break;
                            case 60:
                              v124 = CFSTR("SHARP_LEFT_TURN");
                              break;
                            case 61:
                              v124 = CFSTR("SHARP_RIGHT_TURN");
                              break;
                            case 62:
                              v124 = CFSTR("SLIGHT_LEFT_TURN");
                              break;
                            case 63:
                              v124 = CFSTR("SLIGHT_RIGHT_TURN");
                              break;
                            case 64:
                              v124 = CFSTR("CHANGE_HIGHWAY");
                              break;
                            case 65:
                              v124 = CFSTR("CHANGE_HIGHWAY_LEFT");
                              break;
                            case 66:
                              v124 = CFSTR("CHANGE_HIGHWAY_RIGHT");
                              break;
                            case 80:
                              v124 = CFSTR("TOLL_STATION");
                              break;
                            case 81:
                              v124 = CFSTR("ENTER_TUNNEL");
                              break;
                            case 82:
                              v124 = CFSTR("WAYPOINT_STOP");
                              break;
                            case 83:
                              v124 = CFSTR("WAYPOINT_STOP_LEFT");
                              break;
                            case 84:
                              v124 = CFSTR("WAYPOINT_STOP_RIGHT");
                              break;
                            case 85:
                              v124 = CFSTR("RESUME_ROUTE");
                              break;
                            case 86:
                              v124 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
                              break;
                            case 87:
                              v124 = CFSTR("CUSTOM");
                              break;
                            case 88:
                              v124 = CFSTR("TURN_AROUND");
                              break;
                            default:
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v123);
                              v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
                              break;
                          }
                          *(_DWORD *)v207 = 138412290;
                          v208 = v124;
                          _os_log_impl(&dword_18B0B0000, v121, OS_LOG_TYPE_INFO, "Maneuver type %@ could not be drawn; defaulting to .STRAIGHT_AHEAD",
                            v207,
                            0xCu);

                        }
                        objc_msgSend(v180, "maneuverValue");
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v125, "junctionInfo");
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        v127 = objc_msgSend(v126, "drivingSide");
                        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v207));
                        v128 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v128, "scale");
                        v130 = v129;

                        MKManeuverArrowImage(3, v127, (double *)v207, v170, v166, 0, v98, v98, v130);
                        v21 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                    }

                  }
                  v25 = objc_alloc_init(MEMORY[0x1E0CEA258]);
                  objc_msgSend(v25, "setImage:", v21);
                  objc_msgSend(v181, "objectForKeyedSubscript:", v174);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "capHeight");
                  v132 = v131;
                  objc_msgSend(v21, "size");
                  v134 = v133;
                  objc_msgSend(v21, "size");
                  v136 = v135;
                  objc_msgSend(v21, "size");
                  objc_msgSend(v25, "setBounds:", 0.0, round(v132 - v134) * 0.5, v136, v137);
                  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v25);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_81;
                }
LABEL_28:

                objc_autoreleasePoolPop(context);
                ++v169;
              }
              while (v169 != v159);
              v138 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v183, v205, 16);
              v159 = v138;
            }
            while (v138);
          }

          if (objc_msgSend(v179, "length"))
            objc_msgSend(v153, "addObject:", v179);

        }
      }
      v146 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v206, 16);
    }
    while (v146);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v193[5], "count"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j < objc_msgSend(v153, "count"); ++j)
  {
    if (j < objc_msgSend(v153, "count") - 1)
    {
      v141 = &stru_1E20DFC00;
      if (j < objc_msgSend((id)v193[5], "count"))
      {
        objc_msgSend((id)v193[5], "objectAtIndexedSubscript:", j);
        v141 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

      }
      v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27510]), "initWithString:", v141);
      objc_msgSend(v142, "attributedStringWithStyleAttributes:defaultAttributes:", v150, v151);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "addObject:", v143);

    }
  }
  v5 = -[MKMultiPartAttributedString initWithComponents:separators:]([MKMultiPartAttributedString alloc], "initWithComponents:separators:", v153, v139);

  _Block_object_dispose(&v192, 8);
  _Block_object_dispose(&v198, 8);

LABEL_3:
  return v5;
}

void __67__MKServerFormattedString_multiPartAttributedStringWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", v12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") != 1)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "addObject:", v12);
      ++v8;
    }
    while (v8 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") - 1);
  }
  v9 = objc_msgSend(v7, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)_attributesByTokenForFormatStyles:(id)a3
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend((id)objc_opt_class(), "attributesForServerFormatStyle:", objc_msgSend(v10, "styleType", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "token");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MKServerFormattedString *v4;
  MKServerFormattedString *v5;
  BOOL v6;

  v4 = (MKServerFormattedString *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MKServerFormattedString isEqualToServerFormattedString:](self, "isEqualToServerFormattedString:", v5);

  return v6;
}

- (BOOL)isEqualToServerFormattedString:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  GEOComposedString *composedString;
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  _BOOL4 v20;
  BOOL v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  char v52;
  BOOL v53;
  BOOL v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  char v66;
  BOOL v67;
  BOOL v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  int v77;
  void *v78;
  void *v80;
  void *v81;
  MKServerFormattedString *v82;
  MKServerFormattedString *v83;
  MKServerFormattedString *v84;
  void *v85;
  void *v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  char v90;
  void *v91;
  void *v92;
  unint64_t v93;
  unint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKServerFormattedString geoServerString](self, "geoServerString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geoServerString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8))
    goto LABEL_2;
  if (v8)
    v20 = 0;
  else
    v20 = v7 != 0;
  if (v8)
    v21 = v7 == 0;
  else
    v21 = 0;
  if (v21 || v20)
    goto LABEL_94;
  objc_msgSend((id)v7, "formatStrings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formatStrings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22;
  v25 = v23;
  v26 = (void *)v25;
  if (v24 | v25)
  {
    if (v25)
      v39 = 0;
    else
      v39 = v24 != 0;
    if (v25)
      v40 = v24 == 0;
    else
      v40 = 0;
    if (v40 || v39 || (v41 = objc_msgSend((id)v24, "count"), v41 != objc_msgSend(v26, "count")))
    {

LABEL_93:
LABEL_94:

      goto LABEL_95;
    }
    v82 = self;
    v85 = v9;
    v42 = v26;
    v87 = v4;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = v24;
    v43 = (id)v24;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    if (v44)
    {
      v45 = v44;
      v46 = 0;
      v47 = *(_QWORD *)v96;
      while (2)
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v96 != v47)
            objc_enumerationMutation(v43);
          v49 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend(v42, "objectAtIndexedSubscript:", v46 + i);
          v50 = objc_claimAutoreleasedReturnValue();
          if (v49 | v50)
          {
            v51 = (void *)v50;
            v52 = objc_msgSend((id)v49, "isEqual:", v50);

            if ((v52 & 1) == 0)
            {

              v26 = v42;
              v9 = v85;
              v4 = v87;
              v24 = v93;
              goto LABEL_93;
            }
          }
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
        v46 += i;
        if (v45)
          continue;
        break;
      }
    }

    v26 = v42;
    v9 = v85;
    v4 = v87;
    self = v82;
    v24 = v93;
  }
  objc_msgSend((id)v7, "separators");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "separators");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27;
  v30 = v28;
  v31 = (void *)v30;
  if (v29 | v30)
  {
    if (v30)
      v53 = 0;
    else
      v53 = v29 != 0;
    if (v30)
      v54 = v29 == 0;
    else
      v54 = 0;
    if (v54 || v53 || (v55 = objc_msgSend((id)v29, "count"), v55 != objc_msgSend(v31, "count")))
    {

LABEL_92:
      goto LABEL_93;
    }
    v83 = self;
    v86 = v9;
    v56 = v26;
    v91 = (void *)v29;
    v94 = v24;
    v88 = v4;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v57 = (id)v29;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    if (v58)
    {
      v59 = v58;
      v60 = 0;
      v61 = *(_QWORD *)v96;
      while (2)
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v96 != v61)
            objc_enumerationMutation(v57);
          v63 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j);
          objc_msgSend(v31, "objectAtIndexedSubscript:", v60 + j);
          v64 = objc_claimAutoreleasedReturnValue();
          if (v63 | v64)
          {
            v65 = (void *)v64;
            v66 = objc_msgSend((id)v63, "isEqual:", v64);

            if ((v66 & 1) == 0)
            {

              v4 = v88;
              v24 = v94;
              v26 = v56;
LABEL_90:
              v9 = v86;
              goto LABEL_91;
            }
          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
        v60 += j;
        if (v59)
          continue;
        break;
      }
    }

    self = v83;
    v24 = v94;
    v26 = v56;
    v9 = v86;
    v4 = v88;
  }
  else
  {
    v91 = (void *)v29;
  }
  objc_msgSend((id)v7, "formatTokens");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formatTokens");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v32;
  v35 = v33;
  v36 = (void *)v35;
  if (!(v34 | v35))
  {
    v92 = (void *)v24;
    goto LABEL_19;
  }
  if (v35)
    v67 = 0;
  else
    v67 = v34 != 0;
  if (v35)
    v68 = v34 == 0;
  else
    v68 = 0;
  if (v68
    || v67
    || (v81 = (void *)v34,
        v69 = objc_msgSend((id)v34, "count"),
        v21 = v69 == objc_msgSend(v36, "count"),
        v34 = (unint64_t)v81,
        !v21))
  {

LABEL_91:
    v29 = (unint64_t)v91;
    goto LABEL_92;
  }
  v84 = self;
  v86 = v9;
  v80 = v26;
  v92 = (void *)v24;
  v89 = v4;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v70 = v81;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
  if (v71)
  {
    v72 = v71;
    v73 = 0;
    v74 = *(_QWORD *)v96;
    while (2)
    {
      for (k = 0; k != v72; ++k)
      {
        if (*(_QWORD *)v96 != v74)
          objc_enumerationMutation(v70);
        objc_msgSend(v36, "objectAtIndexedSubscript:", v73 + k);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = GEOServerFormatTokenEqual();

        if (!v77)
        {

          v4 = v89;
          v24 = (unint64_t)v92;
          v26 = v80;
          goto LABEL_90;
        }
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      v73 += k;
      if (v72)
        continue;
      break;
    }
  }

  v9 = v86;
  v4 = v89;
  v34 = (unint64_t)v81;
  self = v84;
  v26 = v80;
LABEL_19:
  objc_msgSend((id)v7, "alternativeString");
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alternativeString");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!(v37 | v38))
  {

    goto LABEL_2;
  }
  v78 = (void *)v38;
  v90 = objc_msgSend((id)v37, "isEqual:", v38);

  if ((v90 & 1) == 0)
  {
LABEL_95:
    v19 = 0;
    goto LABEL_96;
  }
LABEL_2:
  -[MKServerFormattedString parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  if (v12 | v13 && (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, !v14))
  {
    v19 = 0;
  }
  else
  {
    composedString = self->_composedString;
    v16 = v4[3];
    v17 = composedString;
    v18 = v17;
    if ((unint64_t)v17 | v16)
      v19 = objc_msgSend(v17, "isEqual:", v16);
    else
      v19 = 1;

  }
LABEL_96:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MKServerFormattedString geoServerString](self, "geoServerString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MKServerFormattedString parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)debugDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CEA098];
  v11[0] = CFSTR("MKServerFormattedStringArtworkDebugDescriptionOnlyAttributeKey");
  v11[1] = v3;
  v12[0] = MEMORY[0x1E0C9AAB0];
  v4 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
  objc_msgSend(v4, "systemFontOfSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKServerFormattedString multiPartAttributedStringWithAttributes:](self, "multiPartAttributedStringWithAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (GEOServerFormattedString)geoServerString
{
  return self->_geoServerString;
}

- (MKServerFormattedStringParameters)parameters
{
  return self->_parameters;
}

- (GEOComposedString)composedString
{
  return self->_composedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_geoServerString, 0);
}

+ (id)attributesForServerFormatStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    +[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transitDelayedTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v11 = *MEMORY[0x1E0CEA0A0];
      v12 = v4;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v12;
      v7 = &v11;
      goto LABEL_7;
    }
LABEL_9:
    v9 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_10;
  }
  if (a3 != 1)
    return MEMORY[0x1E0C9AA70];
  +[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitOntimeTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_9;
  v13 = *MEMORY[0x1E0CEA0A0];
  v14[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = (void **)v14;
  v7 = &v13;
LABEL_7:
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v9;
}

@end
