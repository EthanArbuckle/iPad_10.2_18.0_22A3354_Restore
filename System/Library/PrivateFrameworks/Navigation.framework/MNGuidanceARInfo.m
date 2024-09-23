@implementation MNGuidanceARInfo

- (MNGuidanceARInfo)init
{
  MNGuidanceARInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MNGuidanceARInfo;
  result = -[MNGuidanceARInfo init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_locationCoordinate.latitude = kGEOLocationCoordinate3DInvalid_0;
    result->_locationCoordinate.altitude = 1.79769313e308;
    result->_locationCoordinateRange = (GEOPolylineCoordinateRange)*MEMORY[0x1E0D26A88];
    result->_heading = -1.0;
  }
  return result;
}

- (MNGuidanceARInfo)initWithEventID:(id)a3 type:(int)a4 maneuverType:(int)a5 instruction:(id)a6 variableOverrides:(id)a7 arrowLabel:(id)a8 locationCoordinate:(id)a9 maneuverRoadName:(id)a10 heading:(double)a11 stepIndex:(unint64_t)a12
{
  double var2;
  double var1;
  double var0;
  id v23;
  id v24;
  id v25;
  MNGuidanceARInfo *v26;
  MNGuidanceARInfo *v27;
  uint64_t v28;
  NSDictionary *variableOverrides;
  id v31;
  id v32;

  var2 = a9.var2;
  var1 = a9.var1;
  var0 = a9.var0;
  v32 = a3;
  v31 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a10;
  v26 = -[MNGuidanceARInfo init](self, "init");
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_guidanceEventID, a3);
    v27->_eventType = a4;
    v27->_maneuverType = a5;
    objc_storeStrong((id *)&v27->_instruction, a6);
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("{Destination}"));
    v28 = objc_claimAutoreleasedReturnValue();
    variableOverrides = v27->_variableOverrides;
    v27->_variableOverrides = (NSDictionary *)v28;

    objc_storeStrong((id *)&v27->_arrowLabel, a8);
    v27->_locationCoordinate.latitude = var0;
    v27->_locationCoordinate.longitude = var1;
    v27->_locationCoordinate.altitude = var2;
    objc_storeStrong((id *)&v27->_maneuverRoadName, a10);
    v27->_heading = a11;
    v27->_stepIndex = a12;
  }

  return v27;
}

- (MNGuidanceARInfo)initWithEventID:(id)a3 type:(int)a4 maneuverType:(int)a5 instruction:(id)a6 variableOverrides:(id)a7 arrowLabel:(id)a8 locationCoordinateRange:(GEOPolylineCoordinateRange)a9 maneuverRoadName:(id)a10 stepIndex:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  MNGuidanceARInfo *v20;
  MNGuidanceARInfo *v21;
  id v25;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v25 = a8;
  v19 = a10;
  v20 = -[MNGuidanceARInfo init](self, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_guidanceEventID, a3);
    v21->_eventType = a4;
    v21->_maneuverType = a5;
    objc_storeStrong((id *)&v21->_instruction, a6);
    objc_storeStrong((id *)&v21->_variableOverrides, a7);
    objc_storeStrong((id *)&v21->_arrowLabel, a8);
    v21->_locationCoordinateRange = a9;
    objc_storeStrong((id *)&v21->_maneuverRoadName, a10);
    v21->_stepIndex = a11;
  }

  return v21;
}

- (id)description
{
  uint64_t eventType;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  double longitude;
  double latitude;
  void *v14;

  eventType = self->_eventType;
  if (eventType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), eventType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E61D7620[eventType];
  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("AR_GUIDANCE_TYPE_"), &stru_1E61D9090);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capitalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOComposedString optionsWithArgumentHandler:](self->_instructionString, "optionsWithArgumentHandler:", &__block_literal_global_36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCreateAttributedString:", 1);
  -[GEOComposedString stringWithOptions:](self->_instructionString, "stringWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%@] %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->_arrowLabel)
    objc_msgSend(v9, "appendFormat:", CFSTR(" | %@"), self->_arrowLabel);
  v11 = CFSTR("LEFT_TURN");
  switch(self->_maneuverType)
  {
    case 0:
      goto LABEL_70;
    case 1:
      goto LABEL_69;
    case 2:
      v11 = CFSTR("RIGHT_TURN");
      goto LABEL_69;
    case 3:
      v11 = CFSTR("STRAIGHT_AHEAD");
      goto LABEL_69;
    case 4:
      v11 = CFSTR("U_TURN");
      goto LABEL_69;
    case 5:
      v11 = CFSTR("FOLLOW_ROAD");
      goto LABEL_69;
    case 6:
      v11 = CFSTR("ENTER_ROUNDABOUT");
      goto LABEL_69;
    case 7:
      v11 = CFSTR("EXIT_ROUNDABOUT");
      goto LABEL_69;
    case 0xB:
      v11 = CFSTR("OFF_RAMP");
      goto LABEL_69;
    case 0xC:
      v11 = CFSTR("ON_RAMP");
      goto LABEL_69;
    case 0x10:
      v11 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      goto LABEL_69;
    case 0x11:
      v11 = CFSTR("START_ROUTE");
      goto LABEL_69;
    case 0x12:
      v11 = CFSTR("ARRIVE_AT_DESTINATION");
      goto LABEL_69;
    case 0x14:
      v11 = CFSTR("KEEP_LEFT");
      goto LABEL_69;
    case 0x15:
      v11 = CFSTR("KEEP_RIGHT");
      goto LABEL_69;
    case 0x16:
      v11 = CFSTR("ENTER_FERRY");
      goto LABEL_69;
    case 0x17:
      v11 = CFSTR("EXIT_FERRY");
      goto LABEL_69;
    case 0x18:
      v11 = CFSTR("CHANGE_FERRY");
      goto LABEL_69;
    case 0x19:
      v11 = CFSTR("START_ROUTE_WITH_U_TURN");
      goto LABEL_69;
    case 0x1A:
      v11 = CFSTR("U_TURN_AT_ROUNDABOUT");
      goto LABEL_69;
    case 0x1B:
      v11 = CFSTR("LEFT_TURN_AT_END");
      goto LABEL_69;
    case 0x1C:
      v11 = CFSTR("RIGHT_TURN_AT_END");
      goto LABEL_69;
    case 0x1D:
      v11 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      goto LABEL_69;
    case 0x1E:
      v11 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      goto LABEL_69;
    case 0x21:
      v11 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      goto LABEL_69;
    case 0x22:
      v11 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      goto LABEL_69;
    case 0x23:
      v11 = CFSTR("U_TURN_WHEN_POSSIBLE");
      goto LABEL_69;
    case 0x27:
      v11 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      goto LABEL_69;
    case 0x29:
      v11 = CFSTR("ROUNDABOUT_EXIT_1");
      goto LABEL_69;
    case 0x2A:
      v11 = CFSTR("ROUNDABOUT_EXIT_2");
      goto LABEL_69;
    case 0x2B:
      v11 = CFSTR("ROUNDABOUT_EXIT_3");
      goto LABEL_69;
    case 0x2C:
      v11 = CFSTR("ROUNDABOUT_EXIT_4");
      goto LABEL_69;
    case 0x2D:
      v11 = CFSTR("ROUNDABOUT_EXIT_5");
      goto LABEL_69;
    case 0x2E:
      v11 = CFSTR("ROUNDABOUT_EXIT_6");
      goto LABEL_69;
    case 0x2F:
      v11 = CFSTR("ROUNDABOUT_EXIT_7");
      goto LABEL_69;
    case 0x30:
      v11 = CFSTR("ROUNDABOUT_EXIT_8");
      goto LABEL_69;
    case 0x31:
      v11 = CFSTR("ROUNDABOUT_EXIT_9");
      goto LABEL_69;
    case 0x32:
      v11 = CFSTR("ROUNDABOUT_EXIT_10");
      goto LABEL_69;
    case 0x33:
      v11 = CFSTR("ROUNDABOUT_EXIT_11");
      goto LABEL_69;
    case 0x34:
      v11 = CFSTR("ROUNDABOUT_EXIT_12");
      goto LABEL_69;
    case 0x35:
      v11 = CFSTR("ROUNDABOUT_EXIT_13");
      goto LABEL_69;
    case 0x36:
      v11 = CFSTR("ROUNDABOUT_EXIT_14");
      goto LABEL_69;
    case 0x37:
      v11 = CFSTR("ROUNDABOUT_EXIT_15");
      goto LABEL_69;
    case 0x38:
      v11 = CFSTR("ROUNDABOUT_EXIT_16");
      goto LABEL_69;
    case 0x39:
      v11 = CFSTR("ROUNDABOUT_EXIT_17");
      goto LABEL_69;
    case 0x3A:
      v11 = CFSTR("ROUNDABOUT_EXIT_18");
      goto LABEL_69;
    case 0x3B:
      v11 = CFSTR("ROUNDABOUT_EXIT_19");
      goto LABEL_69;
    case 0x3C:
      v11 = CFSTR("SHARP_LEFT_TURN");
      goto LABEL_69;
    case 0x3D:
      v11 = CFSTR("SHARP_RIGHT_TURN");
      goto LABEL_69;
    case 0x3E:
      v11 = CFSTR("SLIGHT_LEFT_TURN");
      goto LABEL_69;
    case 0x3F:
      v11 = CFSTR("SLIGHT_RIGHT_TURN");
      goto LABEL_69;
    case 0x40:
      v11 = CFSTR("CHANGE_HIGHWAY");
      goto LABEL_69;
    case 0x41:
      v11 = CFSTR("CHANGE_HIGHWAY_LEFT");
      goto LABEL_69;
    case 0x42:
      v11 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      goto LABEL_69;
    case 0x50:
      v11 = CFSTR("TOLL_STATION");
      goto LABEL_69;
    case 0x51:
      v11 = CFSTR("ENTER_TUNNEL");
      goto LABEL_69;
    case 0x52:
      v11 = CFSTR("WAYPOINT_STOP");
      goto LABEL_69;
    case 0x53:
      v11 = CFSTR("WAYPOINT_STOP_LEFT");
      goto LABEL_69;
    case 0x54:
      v11 = CFSTR("WAYPOINT_STOP_RIGHT");
      goto LABEL_69;
    case 0x55:
      v11 = CFSTR("RESUME_ROUTE");
      goto LABEL_69;
    case 0x56:
      v11 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      goto LABEL_69;
    case 0x57:
      v11 = CFSTR("CUSTOM");
      goto LABEL_69;
    case 0x58:
      v11 = CFSTR("TURN_AROUND");
      goto LABEL_69;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maneuverType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_69:
      objc_msgSend(v10, "appendFormat:", CFSTR(" | %@"), v11);

LABEL_70:
      longitude = self->_locationCoordinate.longitude;
      if (longitude >= -180.0 && longitude <= 180.0)
      {
        latitude = self->_locationCoordinate.latitude;
        if (latitude >= -90.0 && latitude <= 90.0)
          objc_msgSend(v10, "appendFormat:", CFSTR(" | %f, %f, %f"), *(_QWORD *)&latitude, *(_QWORD *)&self->_locationCoordinate.longitude, *(_QWORD *)&self->_locationCoordinate.altitude);
      }
      if (self->_heading != -1.0)
        objc_msgSend(v10, "appendFormat:", CFSTR(" | %.2lf"), *(_QWORD *)&self->_heading);
      if (GEOPolylineCoordinateRangeIsValid())
      {
        GEOPolylineCoordinateRangeAsString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendFormat:", CFSTR(" | %@"), v14);

      }
      objc_msgSend(v10, "appendFormat:", CFSTR(" | %@"), self->_guidanceEventID);

      return v10;
  }
}

void __31__MNGuidanceARInfo_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "maneuverFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "maneuverFormat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAttributedStringHandler:", &__block_literal_global_9_0);

  }
}

id __31__MNGuidanceARInfo_description__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = CFSTR("NO_TURN");
  switch((int)a2)
  {
    case 0:
      break;
    case 1:
      v5 = CFSTR("LEFT_TURN");
      break;
    case 2:
      v5 = CFSTR("RIGHT_TURN");
      break;
    case 3:
      v5 = CFSTR("STRAIGHT_AHEAD");
      break;
    case 4:
      v5 = CFSTR("U_TURN");
      break;
    case 5:
      v5 = CFSTR("FOLLOW_ROAD");
      break;
    case 6:
      v5 = CFSTR("ENTER_ROUNDABOUT");
      break;
    case 7:
      v5 = CFSTR("EXIT_ROUNDABOUT");
      break;
    case 11:
      v5 = CFSTR("OFF_RAMP");
      break;
    case 12:
      v5 = CFSTR("ON_RAMP");
      break;
    case 16:
      v5 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      break;
    case 17:
      v5 = CFSTR("START_ROUTE");
      break;
    case 18:
      v5 = CFSTR("ARRIVE_AT_DESTINATION");
      break;
    case 20:
      v5 = CFSTR("KEEP_LEFT");
      break;
    case 21:
      v5 = CFSTR("KEEP_RIGHT");
      break;
    case 22:
      v5 = CFSTR("ENTER_FERRY");
      break;
    case 23:
      v5 = CFSTR("EXIT_FERRY");
      break;
    case 24:
      v5 = CFSTR("CHANGE_FERRY");
      break;
    case 25:
      v5 = CFSTR("START_ROUTE_WITH_U_TURN");
      break;
    case 26:
      v5 = CFSTR("U_TURN_AT_ROUNDABOUT");
      break;
    case 27:
      v5 = CFSTR("LEFT_TURN_AT_END");
      break;
    case 28:
      v5 = CFSTR("RIGHT_TURN_AT_END");
      break;
    case 29:
      v5 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      break;
    case 30:
      v5 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      break;
    case 33:
      v5 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      break;
    case 34:
      v5 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      break;
    case 35:
      v5 = CFSTR("U_TURN_WHEN_POSSIBLE");
      break;
    case 39:
      v5 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      break;
    case 41:
      v5 = CFSTR("ROUNDABOUT_EXIT_1");
      break;
    case 42:
      v5 = CFSTR("ROUNDABOUT_EXIT_2");
      break;
    case 43:
      v5 = CFSTR("ROUNDABOUT_EXIT_3");
      break;
    case 44:
      v5 = CFSTR("ROUNDABOUT_EXIT_4");
      break;
    case 45:
      v5 = CFSTR("ROUNDABOUT_EXIT_5");
      break;
    case 46:
      v5 = CFSTR("ROUNDABOUT_EXIT_6");
      break;
    case 47:
      v5 = CFSTR("ROUNDABOUT_EXIT_7");
      break;
    case 48:
      v5 = CFSTR("ROUNDABOUT_EXIT_8");
      break;
    case 49:
      v5 = CFSTR("ROUNDABOUT_EXIT_9");
      break;
    case 50:
      v5 = CFSTR("ROUNDABOUT_EXIT_10");
      break;
    case 51:
      v5 = CFSTR("ROUNDABOUT_EXIT_11");
      break;
    case 52:
      v5 = CFSTR("ROUNDABOUT_EXIT_12");
      break;
    case 53:
      v5 = CFSTR("ROUNDABOUT_EXIT_13");
      break;
    case 54:
      v5 = CFSTR("ROUNDABOUT_EXIT_14");
      break;
    case 55:
      v5 = CFSTR("ROUNDABOUT_EXIT_15");
      break;
    case 56:
      v5 = CFSTR("ROUNDABOUT_EXIT_16");
      break;
    case 57:
      v5 = CFSTR("ROUNDABOUT_EXIT_17");
      break;
    case 58:
      v5 = CFSTR("ROUNDABOUT_EXIT_18");
      break;
    case 59:
      v5 = CFSTR("ROUNDABOUT_EXIT_19");
      break;
    case 60:
      v5 = CFSTR("SHARP_LEFT_TURN");
      break;
    case 61:
      v5 = CFSTR("SHARP_RIGHT_TURN");
      break;
    case 62:
      v5 = CFSTR("SLIGHT_LEFT_TURN");
      break;
    case 63:
      v5 = CFSTR("SLIGHT_RIGHT_TURN");
      break;
    case 64:
      v5 = CFSTR("CHANGE_HIGHWAY");
      break;
    case 65:
      v5 = CFSTR("CHANGE_HIGHWAY_LEFT");
      break;
    case 66:
      v5 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      break;
    case 80:
      v5 = CFSTR("TOLL_STATION");
      break;
    case 81:
      v5 = CFSTR("ENTER_TUNNEL");
      break;
    case 82:
      v5 = CFSTR("WAYPOINT_STOP");
      break;
    case 83:
      v5 = CFSTR("WAYPOINT_STOP_LEFT");
      break;
    case 84:
      v5 = CFSTR("WAYPOINT_STOP_RIGHT");
      break;
    case 85:
      v5 = CFSTR("RESUME_ROUTE");
      break;
    case 86:
      v5 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      break;
    case 87:
      v5 = CFSTR("CUSTOM");
      break;
    case 88:
      v5 = CFSTR("TURN_AROUND");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  -[__CFString capitalizedString](v5, "capitalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_1E61D9090);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);

  return v10;
}

- (id)debugDescription
{
  void *v3;
  uint64_t eventType;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  double longitude;
  double latitude;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  eventType = self->_eventType;
  if (eventType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E61D7620[eventType];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ar event: %@\n\tinstruction: %@"), v5, self->_instructionString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_arrowLabel)
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\tarrowLabel: %@"), self->_arrowLabel);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = CFSTR("LEFT_TURN");
  switch(self->_maneuverType)
  {
    case 0:
      goto LABEL_70;
    case 1:
      goto LABEL_69;
    case 2:
      v8 = CFSTR("RIGHT_TURN");
      goto LABEL_69;
    case 3:
      v8 = CFSTR("STRAIGHT_AHEAD");
      goto LABEL_69;
    case 4:
      v8 = CFSTR("U_TURN");
      goto LABEL_69;
    case 5:
      v8 = CFSTR("FOLLOW_ROAD");
      goto LABEL_69;
    case 6:
      v8 = CFSTR("ENTER_ROUNDABOUT");
      goto LABEL_69;
    case 7:
      v8 = CFSTR("EXIT_ROUNDABOUT");
      goto LABEL_69;
    case 0xB:
      v8 = CFSTR("OFF_RAMP");
      goto LABEL_69;
    case 0xC:
      v8 = CFSTR("ON_RAMP");
      goto LABEL_69;
    case 0x10:
      v8 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      goto LABEL_69;
    case 0x11:
      v8 = CFSTR("START_ROUTE");
      goto LABEL_69;
    case 0x12:
      v8 = CFSTR("ARRIVE_AT_DESTINATION");
      goto LABEL_69;
    case 0x14:
      v8 = CFSTR("KEEP_LEFT");
      goto LABEL_69;
    case 0x15:
      v8 = CFSTR("KEEP_RIGHT");
      goto LABEL_69;
    case 0x16:
      v8 = CFSTR("ENTER_FERRY");
      goto LABEL_69;
    case 0x17:
      v8 = CFSTR("EXIT_FERRY");
      goto LABEL_69;
    case 0x18:
      v8 = CFSTR("CHANGE_FERRY");
      goto LABEL_69;
    case 0x19:
      v8 = CFSTR("START_ROUTE_WITH_U_TURN");
      goto LABEL_69;
    case 0x1A:
      v8 = CFSTR("U_TURN_AT_ROUNDABOUT");
      goto LABEL_69;
    case 0x1B:
      v8 = CFSTR("LEFT_TURN_AT_END");
      goto LABEL_69;
    case 0x1C:
      v8 = CFSTR("RIGHT_TURN_AT_END");
      goto LABEL_69;
    case 0x1D:
      v8 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      goto LABEL_69;
    case 0x1E:
      v8 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      goto LABEL_69;
    case 0x21:
      v8 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      goto LABEL_69;
    case 0x22:
      v8 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      goto LABEL_69;
    case 0x23:
      v8 = CFSTR("U_TURN_WHEN_POSSIBLE");
      goto LABEL_69;
    case 0x27:
      v8 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      goto LABEL_69;
    case 0x29:
      v8 = CFSTR("ROUNDABOUT_EXIT_1");
      goto LABEL_69;
    case 0x2A:
      v8 = CFSTR("ROUNDABOUT_EXIT_2");
      goto LABEL_69;
    case 0x2B:
      v8 = CFSTR("ROUNDABOUT_EXIT_3");
      goto LABEL_69;
    case 0x2C:
      v8 = CFSTR("ROUNDABOUT_EXIT_4");
      goto LABEL_69;
    case 0x2D:
      v8 = CFSTR("ROUNDABOUT_EXIT_5");
      goto LABEL_69;
    case 0x2E:
      v8 = CFSTR("ROUNDABOUT_EXIT_6");
      goto LABEL_69;
    case 0x2F:
      v8 = CFSTR("ROUNDABOUT_EXIT_7");
      goto LABEL_69;
    case 0x30:
      v8 = CFSTR("ROUNDABOUT_EXIT_8");
      goto LABEL_69;
    case 0x31:
      v8 = CFSTR("ROUNDABOUT_EXIT_9");
      goto LABEL_69;
    case 0x32:
      v8 = CFSTR("ROUNDABOUT_EXIT_10");
      goto LABEL_69;
    case 0x33:
      v8 = CFSTR("ROUNDABOUT_EXIT_11");
      goto LABEL_69;
    case 0x34:
      v8 = CFSTR("ROUNDABOUT_EXIT_12");
      goto LABEL_69;
    case 0x35:
      v8 = CFSTR("ROUNDABOUT_EXIT_13");
      goto LABEL_69;
    case 0x36:
      v8 = CFSTR("ROUNDABOUT_EXIT_14");
      goto LABEL_69;
    case 0x37:
      v8 = CFSTR("ROUNDABOUT_EXIT_15");
      goto LABEL_69;
    case 0x38:
      v8 = CFSTR("ROUNDABOUT_EXIT_16");
      goto LABEL_69;
    case 0x39:
      v8 = CFSTR("ROUNDABOUT_EXIT_17");
      goto LABEL_69;
    case 0x3A:
      v8 = CFSTR("ROUNDABOUT_EXIT_18");
      goto LABEL_69;
    case 0x3B:
      v8 = CFSTR("ROUNDABOUT_EXIT_19");
      goto LABEL_69;
    case 0x3C:
      v8 = CFSTR("SHARP_LEFT_TURN");
      goto LABEL_69;
    case 0x3D:
      v8 = CFSTR("SHARP_RIGHT_TURN");
      goto LABEL_69;
    case 0x3E:
      v8 = CFSTR("SLIGHT_LEFT_TURN");
      goto LABEL_69;
    case 0x3F:
      v8 = CFSTR("SLIGHT_RIGHT_TURN");
      goto LABEL_69;
    case 0x40:
      v8 = CFSTR("CHANGE_HIGHWAY");
      goto LABEL_69;
    case 0x41:
      v8 = CFSTR("CHANGE_HIGHWAY_LEFT");
      goto LABEL_69;
    case 0x42:
      v8 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      goto LABEL_69;
    case 0x50:
      v8 = CFSTR("TOLL_STATION");
      goto LABEL_69;
    case 0x51:
      v8 = CFSTR("ENTER_TUNNEL");
      goto LABEL_69;
    case 0x52:
      v8 = CFSTR("WAYPOINT_STOP");
      goto LABEL_69;
    case 0x53:
      v8 = CFSTR("WAYPOINT_STOP_LEFT");
      goto LABEL_69;
    case 0x54:
      v8 = CFSTR("WAYPOINT_STOP_RIGHT");
      goto LABEL_69;
    case 0x55:
      v8 = CFSTR("RESUME_ROUTE");
      goto LABEL_69;
    case 0x56:
      v8 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      goto LABEL_69;
    case 0x57:
      v8 = CFSTR("CUSTOM");
      goto LABEL_69;
    case 0x58:
      v8 = CFSTR("TURN_AROUND");
      goto LABEL_69;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maneuverType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_69:
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\tmaneuverType: %@"), v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
LABEL_70:
      longitude = self->_locationCoordinate.longitude;
      if (longitude >= -180.0 && longitude <= 180.0)
      {
        latitude = self->_locationCoordinate.latitude;
        if (latitude >= -90.0 && latitude <= 90.0)
        {
          objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\tlocationCoordinate: %f, %f, %f"), *(_QWORD *)&latitude, *(_QWORD *)&self->_locationCoordinate.longitude, *(_QWORD *)&self->_locationCoordinate.altitude);
          v12 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v12;
        }
      }
      if (self->_heading != -1.0)
      {
        objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\theading: %.2lf"), *(_QWORD *)&self->_heading);
        v13 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v13;
      }
      if (GEOPolylineCoordinateRangeIsValid())
      {
        GEOPolylineCoordinateRangeAsString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\tlocationCoordinateRange %@"), v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v15;
      }
      return v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  MNGuidanceARInfo *v5;
  uint64_t v6;
  BOOL v7;
  MNGuidanceARInfo *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v21;
  BOOL v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  char v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  BOOL v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  unint64_t v66;
  uint64_t v67;
  void *v68;
  char v69;
  void *v70;
  BOOL v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  id v85;
  void *v86;
  unint64_t v87;
  unint64_t v88;
  void *v89;
  id v90;
  id v91;
  char v92;
  id obj;
  id obja;
  id objb;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = (MNGuidanceARInfo *)a3;
  if (v5 == self)
  {
    v7 = 1;
    goto LABEL_15;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = v5;
    -[MNGuidanceARInfo guidanceEventID](self, "guidanceEventID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceARInfo guidanceEventID](v8, "guidanceEventID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10)
      || (v11 = -[MNGuidanceARInfo eventType](self, "eventType"), v11 != -[MNGuidanceARInfo eventType](v8, "eventType"))
      || (v12 = -[MNGuidanceARInfo maneuverType](self, "maneuverType"),
          v12 != -[MNGuidanceARInfo maneuverType](v8, "maneuverType")))
    {
      v7 = 0;
LABEL_14:

      goto LABEL_15;
    }
    -[MNGuidanceARInfo instruction](self, "instruction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceARInfo instruction](v8, "instruction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v14;
    v17 = (void *)v16;
    if (!(v15 | v16))
    {
LABEL_9:
      v96 = v17;
      -[MNGuidanceARInfo arrowLabel](self, "arrowLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18
        || (-[MNGuidanceARInfo arrowLabel](v8, "arrowLabel"), (v102 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[MNGuidanceARInfo arrowLabel](self, "arrowLabel");
        v3 = objc_claimAutoreleasedReturnValue();
        -[MNGuidanceARInfo arrowLabel](v8, "arrowLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend((id)v3, "isEqual:", v17))
        {
          v7 = 0;
          goto LABEL_61;
        }
        v19 = 1;
      }
      else
      {
        v19 = 0;
        v102 = 0;
      }
      -[MNGuidanceARInfo locationCoordinate](self, "locationCoordinate");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      -[MNGuidanceARInfo locationCoordinate](v8, "locationCoordinate");
      if (vabdd_f64(v51, v58) >= 0.000000999999997 || vabdd_f64(v53, v56) >= 0.000000999999997)
      {
        v7 = 0;
        if ((v19 & 1) == 0)
        {
LABEL_62:
          v17 = v96;
          if (!v18)

          goto LABEL_114;
        }
      }
      else if (vabdd_f64(v55, v57) < 0.000000999999997
             && (-[MNGuidanceARInfo locationCoordinateRange](self, "locationCoordinateRange"),
                 -[MNGuidanceARInfo locationCoordinateRange](v8, "locationCoordinateRange"),
                 GEOPolylineCoordinateRangeEqual()))
      {
        v7 = -[MNGuidanceARInfo _isInstructionStringOutputEqual:](self, "_isInstructionStringOutputEqual:", v8);
        if ((v19 & 1) == 0)
          goto LABEL_62;
      }
      else
      {
        v7 = 0;
        if (!v19)
          goto LABEL_62;
      }
LABEL_61:

      goto LABEL_62;
    }
    if (v16)
      v21 = 0;
    else
      v21 = v15 != 0;
    if (v16)
      v22 = v15 == 0;
    else
      v22 = 0;
    if (v22 || v21)
      goto LABEL_112;
    objc_msgSend((id)v15, "formatStrings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "formatStrings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = v24;
    v27 = (void *)v26;
    if (v25 | v26)
    {
      if (v26)
        v39 = 0;
      else
        v39 = v25 != 0;
      if (v26)
        v40 = v25 == 0;
      else
        v40 = 0;
      if (v40 || v39 || (v41 = objc_msgSend((id)v25, "count"), v41 != objc_msgSend(v27, "count")))
      {

LABEL_111:
LABEL_112:

        goto LABEL_113;
      }
      v102 = v27;
      v97 = v17;
      v82 = v15;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v87 = v25;
      obja = (id)v25;
      v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
      if (v42)
      {
        v43 = v42;
        v44 = 0;
        v101 = *(_QWORD *)v104;
        while (2)
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v104 != v101)
              objc_enumerationMutation(obja);
            v46 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
            objc_msgSend(v102, "objectAtIndexedSubscript:", v44 + i);
            v47 = objc_claimAutoreleasedReturnValue();
            if (v46 | v47)
            {
              v48 = (void *)v47;
              v49 = objc_msgSend((id)v46, "isEqual:", v47);

              if ((v49 & 1) == 0)
              {

                v27 = v102;
                v15 = v82;
                v17 = v97;
                v25 = v87;
                goto LABEL_111;
              }
            }
          }
          v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
          v44 += i;
          if (v43)
            continue;
          break;
        }
      }

      v15 = v82;
      v17 = v97;
      v25 = v87;
    }
    else
    {
      v102 = (void *)v26;
    }
    objc_msgSend((id)v15, "separators");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "separators");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v31 = v29;
    v32 = (void *)v31;
    if (v30 | v31)
    {
      if (v31)
        v59 = 0;
      else
        v59 = v30 != 0;
      if (v31)
        v60 = v30 == 0;
      else
        v60 = 0;
      if (v60
        || v59
        || (v89 = (void *)v30,
            v61 = objc_msgSend((id)v30, "count"),
            v22 = v61 == objc_msgSend(v32, "count"),
            v30 = (unint64_t)v89,
            !v22))
      {

        v70 = v32;
LABEL_88:
        v27 = v102;
LABEL_110:

        goto LABEL_111;
      }
      v98 = v17;
      v100 = v32;
      v88 = v25;
      v83 = v15;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v90 = v89;
      v62 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
      if (v62)
      {
        v63 = v62;
        v64 = 0;
        objb = *(id *)v104;
        while (2)
        {
          for (j = 0; j != v63; ++j)
          {
            if (*(id *)v104 != objb)
              objc_enumerationMutation(v90);
            v66 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j);
            objc_msgSend(v100, "objectAtIndexedSubscript:", v64 + j);
            v67 = objc_claimAutoreleasedReturnValue();
            if (v66 | v67)
            {
              v68 = (void *)v67;
              v69 = objc_msgSend((id)v66, "isEqual:", v67);

              if ((v69 & 1) == 0)
              {

                v70 = v100;
                v15 = v83;
                v17 = v98;
                v25 = v88;
                v30 = (unint64_t)v89;
                goto LABEL_88;
              }
            }
          }
          v63 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
          v64 += j;
          if (v63)
            continue;
          break;
        }
      }

      v15 = v83;
      v17 = v98;
      v25 = v88;
    }
    else
    {
      v100 = (void *)v31;
      v89 = (void *)v30;
    }
    objc_msgSend((id)v15, "formatTokens");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "formatTokens");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v33;
    v36 = v34;
    obj = (id)v36;
    if (!(v35 | v36))
    {
      v86 = (void *)v25;
LABEL_30:
      objc_msgSend((id)v15, "alternativeString");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alternativeString");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v17;
      if (!(v3 | v37))
      {

        goto LABEL_9;
      }
      v80 = (void *)v37;
      v92 = objc_msgSend((id)v3, "isEqual:", v37);

      v17 = v38;
      if ((v92 & 1) != 0)
        goto LABEL_9;
LABEL_113:
      v7 = 0;
LABEL_114:

      goto LABEL_14;
    }
    if (v36)
      v71 = 0;
    else
      v71 = v35 != 0;
    if (v36)
      v72 = v35 == 0;
    else
      v72 = 0;
    v27 = v102;
    if (!v72 && !v71)
    {
      v81 = (void *)v35;
      v73 = objc_msgSend((id)v35, "count");
      v22 = v73 == objc_msgSend(obj, "count");
      v35 = (unint64_t)v81;
      if (v22)
      {
        v86 = (void *)v25;
        v99 = v17;
        v84 = v15;
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v85 = v81;
        v74 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
        if (v74)
        {
          v75 = v74;
          v76 = 0;
          v91 = *(id *)v104;
          while (2)
          {
            for (k = 0; k != v75; ++k)
            {
              if (*(id *)v104 != v91)
                objc_enumerationMutation(v85);
              objc_msgSend(obj, "objectAtIndexedSubscript:", v76 + k);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = GEOServerFormatTokenEqual();

              if (!v79)
              {

                v15 = v84;
                v17 = v99;
                v25 = (unint64_t)v86;
                v27 = v102;
                goto LABEL_109;
              }
            }
            v75 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
            v76 += k;
            if (v75)
              continue;
            break;
          }
        }

        v35 = (unint64_t)v81;
        v15 = v84;
        v17 = v99;
        goto LABEL_30;
      }
    }

LABEL_109:
    v30 = (unint64_t)v89;
    v70 = v100;
    goto LABEL_110;
  }
  v7 = 0;
LABEL_15:

  return v7;
}

- (BOOL)_isInstructionStringOutputEqual:(id)a3
{
  id v4;
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
  char v15;

  v4 = a3;
  -[MNGuidanceARInfo instructionString](self, "instructionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "instructionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v15 = 1;
      goto LABEL_5;
    }
  }
  -[MNGuidanceARInfo instructionString](self, "instructionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setShouldUpdateFormatStrings:", 1);
  -[MNGuidanceARInfo instructionString](self, "instructionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "composedStringWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "instructionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setShouldUpdateFormatStrings:", 1);
  objc_msgSend(v4, "instructionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "composedStringWithOptions:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v10, "isEqual:", v14);
LABEL_5:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  unint64_t v21;
  float v22;

  -[MNGuidanceARInfo guidanceEventID](self, "guidanceEventID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = 31 * (31 * v4 + -[MNGuidanceARInfo eventType](self, "eventType"));
  v6 = v5 + -[MNGuidanceARInfo maneuverType](self, "maneuverType");
  -[MNGuidanceARInfo instructionString](self, "instructionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[MNGuidanceARInfo instruction](self, "instruction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[MNGuidanceARInfo arrowLabel](self, "arrowLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  -[MNGuidanceARInfo locationCoordinate](self, "locationCoordinate");
  v14 = (unint64_t)(v13 * 1000000.0) - v12 + 32 * v12;
  -[MNGuidanceARInfo locationCoordinate](self, "locationCoordinate");
  v16 = (unint64_t)(v15 * 1000000.0) - v14 + 32 * v14;
  -[MNGuidanceARInfo locationCoordinate](self, "locationCoordinate");
  v18 = 31 * ((unint64_t)(v17 * 1000000.0) - v16 + 32 * v16)
      + -[MNGuidanceARInfo locationCoordinateRange](self, "locationCoordinateRange");
  v19 = 31
      * ((unint64_t)(COERCE_FLOAT((unint64_t)-[MNGuidanceARInfo locationCoordinateRange](self, "locationCoordinateRange") >> 32)* 1000000.0)- v18+ 32 * v18);
  -[MNGuidanceARInfo locationCoordinateRange](self, "locationCoordinateRange");
  v21 = v19 + v20;
  -[MNGuidanceARInfo locationCoordinateRange](self, "locationCoordinateRange");
  return (unint64_t)(v22 * 1000000.0) - v21 + 32 * v21 + 0x52DC8CFCE1DDC99FLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceARInfo)initWithCoder:(id)a3
{
  id v4;
  MNGuidanceARInfo *v5;
  uint64_t v6;
  NSUUID *guidanceEventID;
  uint64_t v8;
  GEOComposedString *instructionString;
  uint64_t v10;
  GEOServerFormattedString *instruction;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *variableOverrides;
  uint64_t v18;
  NSString *arrowLabel;
  id v20;
  const void *v21;
  size_t v22;
  id v23;
  const void *v24;
  size_t v25;
  uint64_t v26;
  NSString *maneuverRoadName;
  double v28;
  unint64_t v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MNGuidanceARInfo;
  v5 = -[MNGuidanceARInfo init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_guidanceEventID"));
    v6 = objc_claimAutoreleasedReturnValue();
    guidanceEventID = v5->_guidanceEventID;
    v5->_guidanceEventID = (NSUUID *)v6;

    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_eventType"));
    v5->_maneuverType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maneuverType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_instructionString"));
    v8 = objc_claimAutoreleasedReturnValue();
    instructionString = v5->_instructionString;
    v5->_instructionString = (GEOComposedString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_instruction"));
    v10 = objc_claimAutoreleasedReturnValue();
    instruction = v5->_instruction;
    v5->_instruction = (GEOServerFormattedString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_variableOverrides"));
    v16 = objc_claimAutoreleasedReturnValue();
    variableOverrides = v5->_variableOverrides;
    v5->_variableOverrides = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_arrowLabel"));
    v18 = objc_claimAutoreleasedReturnValue();
    arrowLabel = v5->_arrowLabel;
    v5->_arrowLabel = (NSString *)v18;

    v30 = 0;
    v20 = objc_retainAutorelease(v4);
    v21 = (const void *)objc_msgSend(v20, "decodeBytesForKey:returnedLength:", CFSTR("_locationCoordinate"), &v30);
    if (v30 && v21)
    {
      if (v30 >= 0x18)
        v22 = 24;
      else
        v22 = v30;
      memcpy(&v5->_locationCoordinate, v21, v22);
    }
    v30 = 0;
    v23 = objc_retainAutorelease(v20);
    v24 = (const void *)objc_msgSend(v23, "decodeBytesForKey:returnedLength:", CFSTR("_locationCoordinateRange"), &v30);
    if (v30 && v24)
    {
      if (v30 >= 0x10)
        v25 = 16;
      else
        v25 = v30;
      memcpy(&v5->_locationCoordinateRange, v24, v25);
    }
    objc_msgSend(v23, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maneuverRoadName"));
    v26 = objc_claimAutoreleasedReturnValue();
    maneuverRoadName = v5->_maneuverRoadName;
    v5->_maneuverRoadName = (NSString *)v26;

    objc_msgSend(v23, "decodeDoubleForKey:", CFSTR("_heading"));
    v5->_heading = v28;
    v5->_stepIndex = objc_msgSend(v23, "decodeIntegerForKey:", CFSTR("_stepIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *guidanceEventID;
  id v5;

  guidanceEventID = self->_guidanceEventID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", guidanceEventID, CFSTR("_guidanceEventID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventType, CFSTR("_eventType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maneuverType, CFSTR("_maneuverType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instructionString, CFSTR("_instructionString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instruction, CFSTR("_instruction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_variableOverrides, CFSTR("_variableOverrides"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrowLabel, CFSTR("_arrowLabel"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_locationCoordinate, 24, CFSTR("_locationCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_locationCoordinateRange, 16, CFSTR("_locationCoordinateRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maneuverRoadName, CFSTR("_maneuverRoadName"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_heading"), self->_heading);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stepIndex, CFSTR("_stepIndex"));

}

- (NSUUID)guidanceEventID
{
  return self->_guidanceEventID;
}

- (int)eventType
{
  return self->_eventType;
}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (GEOComposedString)instructionString
{
  return self->_instructionString;
}

- (void)setInstructionString:(id)a3
{
  objc_storeStrong((id *)&self->_instructionString, a3);
}

- (GEOServerFormattedString)instruction
{
  return self->_instruction;
}

- (NSDictionary)variableOverrides
{
  return self->_variableOverrides;
}

- (NSString)arrowLabel
{
  return self->_arrowLabel;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_locationCoordinate.latitude;
  longitude = self->_locationCoordinate.longitude;
  altitude = self->_locationCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (GEOPolylineCoordinateRange)locationCoordinateRange
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_locationCoordinateRange.end;
  start = self->_locationCoordinateRange.start;
  result.end = end;
  result.start = start;
  return result;
}

- (NSString)maneuverRoadName
{
  return self->_maneuverRoadName;
}

- (double)heading
{
  return self->_heading;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverRoadName, 0);
  objc_storeStrong((id *)&self->_arrowLabel, 0);
  objc_storeStrong((id *)&self->_variableOverrides, 0);
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_instructionString, 0);
  objc_storeStrong((id *)&self->_guidanceEventID, 0);
}

@end
