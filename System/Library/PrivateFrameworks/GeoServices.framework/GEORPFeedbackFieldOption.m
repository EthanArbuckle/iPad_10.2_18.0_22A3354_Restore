@implementation GEORPFeedbackFieldOption

- (GEORPFeedbackFieldOption)init
{
  GEORPFeedbackFieldOption *v2;
  GEORPFeedbackFieldOption *v3;
  GEORPFeedbackFieldOption *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackFieldOption;
  v2 = -[GEORPFeedbackFieldOption init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackFieldOption)initWithData:(id)a3
{
  GEORPFeedbackFieldOption *v3;
  GEORPFeedbackFieldOption *v4;
  GEORPFeedbackFieldOption *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackFieldOption;
  v3 = -[GEORPFeedbackFieldOption initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)key
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_key;
  else
    return 0;
}

- (void)setKey:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasKey
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)keyAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 1300)
  {
    if (a3 > 1100)
    {
      switch(a3)
      {
        case 1251:
          result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_ONE_WAY");
          break;
        case 1252:
          result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_NOT_ONE_WAY");
          break;
        case 1253:
          result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_BLOCKED");
          break;
        case 1254:
          result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_CONSTRUCTION");
          break;
        case 1255:
          result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_TURN_NOT_ALLOWED");
          break;
        case 1256:
          result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_RESTRICTION");
          break;
        case 1257:
          result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET");
          break;
        case 1258:
          result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET_SURFACE");
          break;
        case 1259:
          result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_LANE");
          break;
        case 1260:
          result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_CROSSWALK");
          break;
        case 1261:
          result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_MEDIAN");
          break;
        case 1262:
          result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_WALK_PATH");
          break;
        case 1263:
          result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_TUNNEL");
          break;
        default:
          switch(a3)
          {
            case 1101:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME");
              break;
            case 1102:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION");
              break;
            case 1103:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE");
              break;
            case 1104:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT");
              break;
            case 1105:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME");
              break;
            case 1106:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE");
              break;
            case 1107:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE");
              break;
            case 1108:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY");
              break;
            case 1109:
              goto LABEL_156;
            case 1110:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY");
              break;
            case 1111:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY");
              break;
            case 1112:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG");
              break;
            case 1113:
              result = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE");
              break;
            default:
              switch(a3)
              {
                case 1201:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG");
                  break;
                case 1202:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_MISSING");
                  break;
                case 1206:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY");
                  break;
                case 1207:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY");
                  break;
                case 1208:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE");
                  break;
                case 1209:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_PRIVATE");
                  break;
                case 1210:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG");
                  break;
                case 1211:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_WRONG");
                  break;
                default:
                  goto LABEL_156;
              }
              break;
          }
          break;
      }
    }
    else
    {
      v3 = CFSTR("FEEDBACK_FIELD_OPTION_UNKNOWN");
      switch(a3)
      {
        case 0:
          return v3;
        case 1:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_NAME");
          break;
        case 2:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS");
          break;
        case 3:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_LOCATION");
          break;
        case 4:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE");
          break;
        case 5:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS");
          break;
        case 6:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE");
          break;
        case 7:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY");
          break;
        case 8:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT");
          break;
        case 9:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_MULTIPLE");
          break;
        case 10:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE");
          break;
        case 11:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_CATEGORY");
          break;
        case 12:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE");
          break;
        case 13:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED");
          break;
        case 14:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE");
          break;
        case 15:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_REOPENING");
          break;
        case 16:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG");
          break;
        case 17:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG");
          break;
        case 18:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG");
          break;
        case 19:
          result = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG");
          break;
        default:
          switch(a3)
          {
            case 501:
              result = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_NAME");
              break;
            case 502:
              result = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_PIN");
              break;
            case 503:
              result = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE");
              break;
            case 504:
              result = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY");
              break;
            case 505:
              result = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE");
              break;
            case 506:
              result = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL");
              break;
            case 507:
              result = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE");
              break;
            default:
              switch(a3)
              {
                case 1001:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION");
                  break;
                case 1002:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_WRONG");
                  break;
                case 1003:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE");
                  break;
                case 1004:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT");
                  break;
                case 1005:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING");
                  break;
                case 1006:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING");
                  break;
                case 1007:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH");
                  break;
                default:
                  goto LABEL_156;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    if (a3 <= 2100)
    {
      if (a3 <= 2000)
      {
        switch(a3)
        {
          case 1701:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET");
            break;
          case 1702:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_ADDRESS");
            break;
          case 1703:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN");
            break;
          case 1704:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN");
            break;
          case 1705:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT");
            break;
          case 1706:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA");
            break;
          case 1707:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER");
            break;
          case 1708:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_PLACE");
            break;
          case 1709:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD");
            break;
          case 1710:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP");
            break;
          case 1711:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH");
            break;
          case 1712:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE");
            break;
          case 1713:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE");
            break;
          case 1714:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT");
            break;
          case 1715:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES");
            break;
          case 1716:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE");
            break;
          case 1717:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_LANE");
            break;
          case 1718:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK");
            break;
          case 1719:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN");
            break;
          case 1720:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL");
            break;
          default:
            switch(a3)
            {
              case 1301:
                result = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG");
                break;
              case 1302:
                result = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED");
                break;
              case 1303:
                result = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE");
                break;
              case 1304:
                result = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY");
                break;
              case 1305:
                result = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT");
                break;
              case 1306:
                result = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE");
                break;
              default:
                goto LABEL_156;
            }
            break;
        }
        return result;
      }
      if (a3 > 2050)
      {
        switch(a3)
        {
          case 2051:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE");
            break;
          case 2052:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE");
            break;
          case 2053:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED");
            break;
          case 2054:
            result = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE");
            break;
          default:
            goto LABEL_156;
        }
        return result;
      }
      switch(a3)
      {
        case 2001:
          return CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED");
        case 2002:
          return CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG");
        case 2003:
          return CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE");
      }
    }
    else
    {
      if (a3 > 2500)
      {
        if (a3 <= 2600)
        {
          switch(a3)
          {
            case 2501:
              result = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT");
              break;
            case 2502:
              result = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE");
              break;
            case 2503:
              result = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY");
              break;
            case 2504:
              result = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON");
              break;
            case 2505:
              result = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN");
              break;
            case 2506:
              result = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE");
              break;
            case 2507:
              result = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE");
              break;
            default:
              goto LABEL_156;
          }
        }
        else
        {
          switch(a3)
          {
            case 2601:
              result = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_MISSING");
              break;
            case 2602:
              result = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_REMOVAL");
              break;
            case 2603:
              result = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_NAME_WRONG");
              break;
            case 2604:
              result = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_LANE_COUNT_WRONG");
              break;
            case 2605:
              result = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_SHAPE_WRONG");
              break;
            default:
              switch(a3)
              {
                case 5000:
                  v3 = CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR");
                  return v3;
                case 5001:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR");
                  break;
                case 5002:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG");
                  break;
                case 5003:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING");
                  break;
                case 5004:
                  result = CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING");
                  break;
                default:
                  if (a3 != 10000)
                    goto LABEL_156;
                  result = CFSTR("FEEDBACK_FIELD_OPTION_CHOICE");
                  break;
              }
              break;
          }
        }
        return result;
      }
      if (a3 <= 2300)
      {
        switch(a3)
        {
          case 2201:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED");
            break;
          case 2202:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE");
            break;
          case 2203:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING");
            break;
          case 2204:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD");
            break;
          case 2205:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE");
            break;
          case 2206:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT");
            break;
          case 2207:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD");
            break;
          case 2208:
            result = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE");
            break;
          default:
            switch(a3)
            {
              case 2101:
                result = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG");
                break;
              case 2102:
                result = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE");
                break;
              case 2103:
                result = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING");
                break;
              case 2104:
                result = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING");
                break;
              case 2105:
                result = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH");
                break;
              case 2106:
                result = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG");
                break;
              default:
                goto LABEL_156;
            }
            break;
        }
        return result;
      }
      switch(a3)
      {
        case 2301:
          return CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED");
        case 2302:
          return CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE");
        case 2401:
          return CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE");
      }
    }
LABEL_156:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  return result;
}

- (int)StringAsKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_NAME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_LOCATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_MULTIPLE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CATEGORY")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_REOPENING")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_NAME")) & 1) != 0)
  {
    v4 = 501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_PIN")) & 1) != 0)
  {
    v4 = 502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE")) & 1) != 0)
  {
    v4 = 503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY")) & 1) != 0)
  {
    v4 = 504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE")) & 1) != 0)
  {
    v4 = 505;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL")) & 1) != 0)
  {
    v4 = 506;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 507;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION")) & 1) != 0)
  {
    v4 = 1001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_WRONG")) & 1) != 0)
  {
    v4 = 1002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 1003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 1004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING")) & 1) != 0)
  {
    v4 = 1005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING")) & 1) != 0)
  {
    v4 = 1006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH")) & 1) != 0)
  {
    v4 = 1007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME")) & 1) != 0)
  {
    v4 = 1101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION")) & 1) != 0)
  {
    v4 = 1102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE")) & 1) != 0)
  {
    v4 = 1103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT")) & 1) != 0)
  {
    v4 = 1104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME")) & 1) != 0)
  {
    v4 = 1105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE")) & 1) != 0)
  {
    v4 = 1106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE")) & 1) != 0)
  {
    v4 = 1107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY")) & 1) != 0)
  {
    v4 = 1108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY")) & 1) != 0)
  {
    v4 = 1110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY")) & 1) != 0)
  {
    v4 = 1111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG")) & 1) != 0)
  {
    v4 = 1112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 1113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG")) & 1) != 0)
  {
    v4 = 1201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_MISSING")) & 1) != 0)
  {
    v4 = 1202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY")) & 1) != 0)
  {
    v4 = 1206;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY")) & 1) != 0)
  {
    v4 = 1207;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 1208;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_PRIVATE")) & 1) != 0)
  {
    v4 = 1209;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG")) & 1) != 0)
  {
    v4 = 1210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_WRONG")) & 1) != 0)
  {
    v4 = 1211;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_ONE_WAY")) & 1) != 0)
  {
    v4 = 1251;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_NOT_ONE_WAY")) & 1) != 0)
  {
    v4 = 1252;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_BLOCKED")) & 1) != 0)
  {
    v4 = 1253;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_CONSTRUCTION")) & 1) != 0)
  {
    v4 = 1254;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_TURN_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 1255;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_RESTRICTION")) & 1) != 0)
  {
    v4 = 1256;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET")) & 1) != 0)
  {
    v4 = 1257;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET_SURFACE")) & 1) != 0)
  {
    v4 = 1258;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_LANE")) & 1) != 0)
  {
    v4 = 1259;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_CROSSWALK")) & 1) != 0)
  {
    v4 = 1260;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_MEDIAN")) & 1) != 0)
  {
    v4 = 1261;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_WALK_PATH")) & 1) != 0)
  {
    v4 = 1262;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_TUNNEL")) & 1) != 0)
  {
    v4 = 1263;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG")) & 1) != 0)
  {
    v4 = 1301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED")) & 1) != 0)
  {
    v4 = 1302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 1303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY")) & 1) != 0)
  {
    v4 = 1304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT")) & 1) != 0)
  {
    v4 = 1305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE")) & 1) != 0)
  {
    v4 = 1306;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET")) & 1) != 0)
  {
    v4 = 1701;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_ADDRESS")) & 1) != 0)
  {
    v4 = 1702;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN")) & 1) != 0)
  {
    v4 = 1703;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN")) & 1) != 0)
  {
    v4 = 1704;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT")) & 1) != 0)
  {
    v4 = 1705;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA")) & 1) != 0)
  {
    v4 = 1706;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER")) & 1) != 0)
  {
    v4 = 1707;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_PLACE")) & 1) != 0)
  {
    v4 = 1708;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD")) & 1) != 0)
  {
    v4 = 1709;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP")) & 1) != 0)
  {
    v4 = 1710;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH")) & 1) != 0)
  {
    v4 = 1711;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 1712;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE")) & 1) != 0)
  {
    v4 = 1713;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT")) & 1) != 0)
  {
    v4 = 1714;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES")) & 1) != 0)
  {
    v4 = 1715;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE")) & 1) != 0)
  {
    v4 = 1716;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_LANE")) & 1) != 0)
  {
    v4 = 1717;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK")) & 1) != 0)
  {
    v4 = 1718;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN")) & 1) != 0)
  {
    v4 = 1719;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL")) & 1) != 0)
  {
    v4 = 1720;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 2001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG")) & 1) != 0)
  {
    v4 = 2002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 2003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE")) & 1) != 0)
  {
    v4 = 2051;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE")) & 1) != 0)
  {
    v4 = 2052;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 2053;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE")) & 1) != 0)
  {
    v4 = 2054;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG")) & 1) != 0)
  {
    v4 = 2101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE")) & 1) != 0)
  {
    v4 = 2102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING")) & 1) != 0)
  {
    v4 = 2103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING")) & 1) != 0)
  {
    v4 = 2104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH")) & 1) != 0)
  {
    v4 = 2105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG")) & 1) != 0)
  {
    v4 = 2106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 2201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE")) & 1) != 0)
  {
    v4 = 2202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING")) & 1) != 0)
  {
    v4 = 2203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD")) & 1) != 0)
  {
    v4 = 2204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE")) & 1) != 0)
  {
    v4 = 2205;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT")) & 1) != 0)
  {
    v4 = 2206;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD")) & 1) != 0)
  {
    v4 = 2207;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE")) & 1) != 0)
  {
    v4 = 2208;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 2301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE")) & 1) != 0)
  {
    v4 = 2302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE")) & 1) != 0)
  {
    v4 = 2401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT")) & 1) != 0)
  {
    v4 = 2501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE")) & 1) != 0)
  {
    v4 = 2502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY")) & 1) != 0)
  {
    v4 = 2503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON")) & 1) != 0)
  {
    v4 = 2504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN")) & 1) != 0)
  {
    v4 = 2505;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE")) & 1) != 0)
  {
    v4 = 2506;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE")) & 1) != 0)
  {
    v4 = 2507;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_MISSING")) & 1) != 0)
  {
    v4 = 2601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_REMOVAL")) & 1) != 0)
  {
    v4 = 2602;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_NAME_WRONG")) & 1) != 0)
  {
    v4 = 2603;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_LANE_COUNT_WRONG")) & 1) != 0)
  {
    v4 = 2604;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_SHAPE_WRONG")) & 1) != 0)
  {
    v4 = 2605;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR")) & 1) != 0)
  {
    v4 = 5000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR")) & 1) != 0)
  {
    v4 = 5001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG")) & 1) != 0)
  {
    v4 = 5002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING")) & 1) != 0)
  {
    v4 = 5003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING")) & 1) != 0)
  {
    v4 = 5004;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CHOICE")))
  {
    v4 = 10000;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLocalizedText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocalizedText
{
  -[GEORPFeedbackFieldOption _readLocalizedText]((uint64_t)self);
  return self->_localizedText != 0;
}

- (NSString)localizedText
{
  -[GEORPFeedbackFieldOption _readLocalizedText]((uint64_t)self);
  return self->_localizedText;
}

- (void)setLocalizedText:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_localizedText, a3);
}

- (void)_readDefaultText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDefaultText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDefaultText
{
  -[GEORPFeedbackFieldOption _readDefaultText]((uint64_t)self);
  return self->_defaultText != 0;
}

- (NSString)defaultText
{
  -[GEORPFeedbackFieldOption _readDefaultText]((uint64_t)self);
  return self->_defaultText;
}

- (void)setDefaultText:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_defaultText, a3);
}

- (void)_readTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTags_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)tags
{
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  return self->_tags;
}

- (void)setTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  tags = self->_tags;
  self->_tags = v4;

}

- (void)clearTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_tags, "removeAllObjects");
}

- (void)addTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  -[GEORPFeedbackFieldOption _addNoFlagsTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsTag:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)tagsCount
{
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  return -[NSMutableArray count](self->_tags, "count");
}

- (id)tagAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tags, "objectAtIndex:", a3);
}

+ (Class)tagType
{
  return (Class)objc_opt_class();
}

- (void)_readAnnotations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnotations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAnnotations
{
  -[GEORPFeedbackFieldOption _readAnnotations]((uint64_t)self);
  return self->_annotations != 0;
}

- (GEORPFeedbackFieldOptionAnnotations)annotations
{
  -[GEORPFeedbackFieldOption _readAnnotations]((uint64_t)self);
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_annotations, a3);
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
  v8.super_class = (Class)GEORPFeedbackFieldOption;
  -[GEORPFeedbackFieldOption description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackFieldOption dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldOption _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 60);
    if (v5 <= 1300)
    {
      if (v5 > 1100)
      {
        switch(v5)
        {
          case 1251:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_ONE_WAY");
            break;
          case 1252:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_NOT_ONE_WAY");
            break;
          case 1253:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_BLOCKED");
            break;
          case 1254:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_CONSTRUCTION");
            break;
          case 1255:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_TURN_NOT_ALLOWED");
            break;
          case 1256:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_RESTRICTION");
            break;
          case 1257:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET");
            break;
          case 1258:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET_SURFACE");
            break;
          case 1259:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_LANE");
            break;
          case 1260:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_CROSSWALK");
            break;
          case 1261:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_MEDIAN");
            break;
          case 1262:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_WALK_PATH");
            break;
          case 1263:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_TUNNEL");
            break;
          default:
            switch(v5)
            {
              case 1101:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME");
                break;
              case 1102:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION");
                break;
              case 1103:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE");
                break;
              case 1104:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT");
                break;
              case 1105:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME");
                break;
              case 1106:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE");
                break;
              case 1107:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE");
                break;
              case 1108:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY");
                break;
              case 1109:
                goto LABEL_53;
              case 1110:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY");
                break;
              case 1111:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY");
                break;
              case 1112:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG");
                break;
              case 1113:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE");
                break;
              default:
                switch(v5)
                {
                  case 1201:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG");
                    break;
                  case 1202:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_MISSING");
                    break;
                  case 1206:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY");
                    break;
                  case 1207:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY");
                    break;
                  case 1208:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE");
                    break;
                  case 1209:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_PRIVATE");
                    break;
                  case 1210:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG");
                    break;
                  case 1211:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_WRONG");
                    break;
                  default:
                    goto LABEL_53;
                }
                break;
            }
            break;
        }
      }
      else
      {
        v6 = CFSTR("FEEDBACK_FIELD_OPTION_UNKNOWN");
        switch(v5)
        {
          case 0:
            goto LABEL_169;
          case 1:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_NAME");
            break;
          case 2:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS");
            break;
          case 3:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_LOCATION");
            break;
          case 4:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE");
            break;
          case 5:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS");
            break;
          case 6:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE");
            break;
          case 7:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY");
            break;
          case 8:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT");
            break;
          case 9:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_MULTIPLE");
            break;
          case 10:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE");
            break;
          case 11:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CATEGORY");
            break;
          case 12:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE");
            break;
          case 13:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED");
            break;
          case 14:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE");
            break;
          case 15:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_REOPENING");
            break;
          case 16:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG");
            break;
          case 17:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG");
            break;
          case 18:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG");
            break;
          case 19:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG");
            break;
          default:
            switch(v5)
            {
              case 501:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_NAME");
                break;
              case 502:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_PIN");
                break;
              case 503:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE");
                break;
              case 504:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY");
                break;
              case 505:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE");
                break;
              case 506:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL");
                break;
              case 507:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE");
                break;
              default:
                switch(v5)
                {
                  case 1001:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION");
                    break;
                  case 1002:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_WRONG");
                    break;
                  case 1003:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE");
                    break;
                  case 1004:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT");
                    break;
                  case 1005:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING");
                    break;
                  case 1006:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING");
                    break;
                  case 1007:
                    v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH");
                    break;
                  default:
                    goto LABEL_53;
                }
                break;
            }
            break;
        }
      }
      goto LABEL_169;
    }
    if (v5 <= 2100)
    {
      if (v5 <= 2000)
      {
        switch(v5)
        {
          case 1701:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET");
            break;
          case 1702:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_ADDRESS");
            break;
          case 1703:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN");
            break;
          case 1704:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN");
            break;
          case 1705:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT");
            break;
          case 1706:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA");
            break;
          case 1707:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER");
            break;
          case 1708:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_PLACE");
            break;
          case 1709:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD");
            break;
          case 1710:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP");
            break;
          case 1711:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH");
            break;
          case 1712:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE");
            break;
          case 1713:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE");
            break;
          case 1714:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT");
            break;
          case 1715:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES");
            break;
          case 1716:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE");
            break;
          case 1717:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_LANE");
            break;
          case 1718:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK");
            break;
          case 1719:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN");
            break;
          case 1720:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL");
            break;
          default:
            switch(v5)
            {
              case 1301:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG");
                break;
              case 1302:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED");
                break;
              case 1303:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE");
                break;
              case 1304:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY");
                break;
              case 1305:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT");
                break;
              case 1306:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE");
                break;
              default:
                goto LABEL_53;
            }
            break;
        }
        goto LABEL_169;
      }
      if (v5 > 2050)
      {
        switch(v5)
        {
          case 2051:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE");
            break;
          case 2052:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE");
            break;
          case 2053:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED");
            break;
          case 2054:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE");
            break;
          default:
            goto LABEL_53;
        }
        goto LABEL_169;
      }
      switch(v5)
      {
        case 2001:
          v6 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED");
          goto LABEL_169;
        case 2002:
          v6 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG");
          goto LABEL_169;
        case 2003:
          v6 = CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE");
          goto LABEL_169;
      }
    }
    else
    {
      if (v5 > 2500)
      {
        if (v5 <= 2600)
        {
          switch(v5)
          {
            case 2501:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT");
              break;
            case 2502:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE");
              break;
            case 2503:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY");
              break;
            case 2504:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON");
              break;
            case 2505:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN");
              break;
            case 2506:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE");
              break;
            case 2507:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE");
              break;
            default:
              goto LABEL_53;
          }
        }
        else
        {
          switch(v5)
          {
            case 2601:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_MISSING");
              break;
            case 2602:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_REMOVAL");
              break;
            case 2603:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_NAME_WRONG");
              break;
            case 2604:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_LANE_COUNT_WRONG");
              break;
            case 2605:
              v6 = CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_SHAPE_WRONG");
              break;
            default:
              switch(v5)
              {
                case 5000:
                  v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR");
                  break;
                case 5001:
                  v6 = CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR");
                  break;
                case 5002:
                  v6 = CFSTR("FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG");
                  break;
                case 5003:
                  v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING");
                  break;
                case 5004:
                  v6 = CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING");
                  break;
                default:
                  if (v5 != 10000)
                    goto LABEL_53;
                  v6 = CFSTR("FEEDBACK_FIELD_OPTION_CHOICE");
                  break;
              }
              break;
          }
        }
        goto LABEL_169;
      }
      if (v5 <= 2300)
      {
        switch(v5)
        {
          case 2201:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED");
            break;
          case 2202:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE");
            break;
          case 2203:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING");
            break;
          case 2204:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD");
            break;
          case 2205:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE");
            break;
          case 2206:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT");
            break;
          case 2207:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD");
            break;
          case 2208:
            v6 = CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE");
            break;
          default:
            switch(v5)
            {
              case 2101:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG");
                break;
              case 2102:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE");
                break;
              case 2103:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING");
                break;
              case 2104:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING");
                break;
              case 2105:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH");
                break;
              case 2106:
                v6 = CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG");
                break;
              default:
                goto LABEL_53;
            }
            break;
        }
        goto LABEL_169;
      }
      switch(v5)
      {
        case 2301:
          v6 = CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED");
          goto LABEL_169;
        case 2302:
          v6 = CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE");
          goto LABEL_169;
        case 2401:
          v6 = CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE");
LABEL_169:
          objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("key"));

          goto LABEL_170;
      }
    }
LABEL_53:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_169;
  }
LABEL_170:
  objc_msgSend((id)a1, "localizedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("localizedText");
    else
      v8 = CFSTR("localized_text");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "defaultText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("defaultText");
    else
      v10 = CFSTR("default_text");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)a1, "tags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("tag"));

  }
  objc_msgSend((id)a1, "annotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v12, "jsonRepresentation");
    else
      objc_msgSend(v12, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("annotations"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFieldOption _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackFieldOption)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFieldOption *)-[GEORPFeedbackFieldOption _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  GEORPFeedbackFieldOptionAnnotations *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_306;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_306;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_NAME")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_LOCATION")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_MULTIPLE")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CATEGORY")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE")) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED")) & 1) != 0)
    {
      v8 = 13;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE")) & 1) != 0)
    {
      v8 = 14;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_REOPENING")) & 1) != 0)
    {
      v8 = 15;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG")) & 1) != 0)
    {
      v8 = 16;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG")) & 1) != 0)
    {
      v8 = 17;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG")) & 1) != 0)
    {
      v8 = 18;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG")) & 1) != 0)
    {
      v8 = 19;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_NAME")) & 1) != 0)
    {
      v8 = 501;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_PIN")) & 1) != 0)
    {
      v8 = 502;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE")) & 1) != 0)
    {
      v8 = 503;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY")) & 1) != 0)
    {
      v8 = 504;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE")) & 1) != 0)
    {
      v8 = 505;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL")) & 1) != 0)
    {
      v8 = 506;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 507;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION")) & 1) != 0)
    {
      v8 = 1001;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_WRONG")) & 1) != 0)
    {
      v8 = 1002;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 1003;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT")) & 1) != 0)
    {
      v8 = 1004;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING")) & 1) != 0)
    {
      v8 = 1005;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING")) & 1) != 0)
    {
      v8 = 1006;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH")) & 1) != 0)
    {
      v8 = 1007;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME")) & 1) != 0)
    {
      v8 = 1101;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION")) & 1) != 0)
    {
      v8 = 1102;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE")) & 1) != 0)
    {
      v8 = 1103;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT")) & 1) != 0)
    {
      v8 = 1104;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME")) & 1) != 0)
    {
      v8 = 1105;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE")) & 1) != 0)
    {
      v8 = 1106;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE")) & 1) != 0)
    {
      v8 = 1107;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY")) & 1) != 0)
    {
      v8 = 1108;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY")) & 1) != 0)
    {
      v8 = 1110;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY")) & 1) != 0)
    {
      v8 = 1111;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG")) & 1) != 0)
    {
      v8 = 1112;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 1113;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG")) & 1) != 0)
    {
      v8 = 1201;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_MISSING")) & 1) != 0)
    {
      v8 = 1202;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY")) & 1) != 0)
    {
      v8 = 1206;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY")) & 1) != 0)
    {
      v8 = 1207;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 1208;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_PRIVATE")) & 1) != 0)
    {
      v8 = 1209;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG")) & 1) != 0)
    {
      v8 = 1210;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_WRONG")) & 1) != 0)
    {
      v8 = 1211;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_ONE_WAY")) & 1) != 0)
    {
      v8 = 1251;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_NOT_ONE_WAY")) & 1) != 0)
    {
      v8 = 1252;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_BLOCKED")) & 1) != 0)
    {
      v8 = 1253;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_CONSTRUCTION")) & 1) != 0)
    {
      v8 = 1254;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_TURN_NOT_ALLOWED")) & 1) != 0)
    {
      v8 = 1255;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_RESTRICTION")) & 1) != 0)
    {
      v8 = 1256;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET")) & 1) != 0)
    {
      v8 = 1257;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET_SURFACE")) & 1) != 0)
    {
      v8 = 1258;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_LANE")) & 1) != 0)
    {
      v8 = 1259;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_CROSSWALK")) & 1) != 0)
    {
      v8 = 1260;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_MEDIAN")) & 1) != 0)
    {
      v8 = 1261;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_WALK_PATH")) & 1) != 0)
    {
      v8 = 1262;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_TUNNEL")) & 1) != 0)
    {
      v8 = 1263;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG")) & 1) != 0)
    {
      v8 = 1301;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED")) & 1) != 0)
    {
      v8 = 1302;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 1303;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY")) & 1) != 0)
    {
      v8 = 1304;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT")) & 1) != 0)
    {
      v8 = 1305;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE")) & 1) != 0)
    {
      v8 = 1306;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET")) & 1) != 0)
    {
      v8 = 1701;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_ADDRESS")) & 1) != 0)
    {
      v8 = 1702;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN")) & 1) != 0)
    {
      v8 = 1703;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN")) & 1) != 0)
    {
      v8 = 1704;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT")) & 1) != 0)
    {
      v8 = 1705;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA")) & 1) != 0)
    {
      v8 = 1706;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER")) & 1) != 0)
    {
      v8 = 1707;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_PLACE")) & 1) != 0)
    {
      v8 = 1708;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD")) & 1) != 0)
    {
      v8 = 1709;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP")) & 1) != 0)
    {
      v8 = 1710;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH")) & 1) != 0)
    {
      v8 = 1711;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 1712;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE")) & 1) != 0)
    {
      v8 = 1713;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT")) & 1) != 0)
    {
      v8 = 1714;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES")) & 1) != 0)
    {
      v8 = 1715;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE")) & 1) != 0)
    {
      v8 = 1716;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_LANE")) & 1) != 0)
    {
      v8 = 1717;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK")) & 1) != 0)
    {
      v8 = 1718;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN")) & 1) != 0)
    {
      v8 = 1719;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL")) & 1) != 0)
    {
      v8 = 1720;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED")) & 1) != 0)
    {
      v8 = 2001;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG")) & 1) != 0)
    {
      v8 = 2002;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 2003;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE")) & 1) != 0)
    {
      v8 = 2051;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE")) & 1) != 0)
    {
      v8 = 2052;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED")) & 1) != 0)
    {
      v8 = 2053;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE")) & 1) != 0)
    {
      v8 = 2054;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG")) & 1) != 0)
    {
      v8 = 2101;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE")) & 1) != 0)
    {
      v8 = 2102;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING")) & 1) != 0)
    {
      v8 = 2103;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING")) & 1) != 0)
    {
      v8 = 2104;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH")) & 1) != 0)
    {
      v8 = 2105;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG")) & 1) != 0)
    {
      v8 = 2106;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED")) & 1) != 0)
    {
      v8 = 2201;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE")) & 1) != 0)
    {
      v8 = 2202;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING")) & 1) != 0)
    {
      v8 = 2203;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD")) & 1) != 0)
    {
      v8 = 2204;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE")) & 1) != 0)
    {
      v8 = 2205;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT")) & 1) != 0)
    {
      v8 = 2206;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD")) & 1) != 0)
    {
      v8 = 2207;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE")) & 1) != 0)
    {
      v8 = 2208;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED")) & 1) != 0)
    {
      v8 = 2301;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE")) & 1) != 0)
    {
      v8 = 2302;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE")) & 1) != 0)
    {
      v8 = 2401;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT")) & 1) != 0)
    {
      v8 = 2501;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE")) & 1) != 0)
    {
      v8 = 2502;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY")) & 1) != 0)
    {
      v8 = 2503;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON")) & 1) != 0)
    {
      v8 = 2504;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN")) & 1) != 0)
    {
      v8 = 2505;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE")) & 1) != 0)
    {
      v8 = 2506;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE")) & 1) != 0)
    {
      v8 = 2507;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_MISSING")) & 1) != 0)
    {
      v8 = 2601;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_REMOVAL")) & 1) != 0)
    {
      v8 = 2602;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_NAME_WRONG")) & 1) != 0)
    {
      v8 = 2603;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_LANE_COUNT_WRONG")) & 1) != 0)
    {
      v8 = 2604;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_RUNNING_TRACK_SHAPE_WRONG")) & 1) != 0)
    {
      v8 = 2605;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR")) & 1) != 0)
    {
      v8 = 5000;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR")) & 1) != 0)
    {
      v8 = 5001;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG")) & 1) != 0)
    {
      v8 = 5002;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING")) & 1) != 0)
    {
      v8 = 5003;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING")) & 1) != 0)
    {
      v8 = 5004;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_OPTION_CHOICE")))
    {
      v8 = 10000;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_278;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_278:
    objc_msgSend(a1, "setKey:", v8);
  }

  if (a3)
    v9 = CFSTR("localizedText");
  else
    v9 = CFSTR("localized_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setLocalizedText:", v11);

  }
  if (a3)
    v12 = CFSTR("defaultText");
  else
    v12 = CFSTR("default_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(a1, "setDefaultText:", v14);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tag"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = (void *)objc_msgSend(v21, "copy", (_QWORD)v28);
            objc_msgSend(a1, "addTag:", v22);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("annotations"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEORPFeedbackFieldOptionAnnotations alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEORPFeedbackFieldOptionAnnotations initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEORPFeedbackFieldOptionAnnotations initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setAnnotations:", v25, (_QWORD)v28);

  }
LABEL_306:

  return a1;
}

- (GEORPFeedbackFieldOption)initWithJSON:(id)a3
{
  return (GEORPFeedbackFieldOption *)-[GEORPFeedbackFieldOption _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_222_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_223_0;
    GEORPFeedbackFieldOptionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORPFeedbackFieldOptionAnnotations readAll:](self->_annotations, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFieldOptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFieldOptionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackFieldOption readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_localizedText)
      PBDataWriterWriteStringField();
    if (self->_defaultText)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_tags;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_annotations)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEORPFeedbackFieldOption readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 15) = self->_key;
    *((_BYTE *)v8 + 64) |= 1u;
  }
  if (self->_localizedText)
    objc_msgSend(v8, "setLocalizedText:");
  if (self->_defaultText)
    objc_msgSend(v8, "setDefaultText:");
  if (-[GEORPFeedbackFieldOption tagsCount](self, "tagsCount"))
  {
    objc_msgSend(v8, "clearTags");
    v4 = -[GEORPFeedbackFieldOption tagsCount](self, "tagsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackFieldOption tagAtIndex:](self, "tagAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTag:", v7);

      }
    }
  }
  if (self->_annotations)
    objc_msgSend(v8, "setAnnotations:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPFeedbackFieldOptionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackFieldOption readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_key;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_localizedText, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_defaultText, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_tags;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addTag:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v18 = -[GEORPFeedbackFieldOptionAnnotations copyWithZone:](self->_annotations, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *localizedText;
  NSString *defaultText;
  NSMutableArray *tags;
  GEORPFeedbackFieldOptionAnnotations *annotations;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEORPFeedbackFieldOption readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_key != *((_DWORD *)v4 + 15))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  localizedText = self->_localizedText;
  if ((unint64_t)localizedText | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](localizedText, "isEqual:"))
  {
    goto LABEL_15;
  }
  defaultText = self->_defaultText;
  if ((unint64_t)defaultText | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](defaultText, "isEqual:"))
      goto LABEL_15;
  }
  tags = self->_tags;
  if ((unint64_t)tags | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](tags, "isEqual:"))
      goto LABEL_15;
  }
  annotations = self->_annotations;
  if ((unint64_t)annotations | *((_QWORD *)v4 + 2))
    v9 = -[GEORPFeedbackFieldOptionAnnotations isEqual:](annotations, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEORPFeedbackFieldOption readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_key;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_localizedText, "hash") ^ v3;
  v5 = -[NSString hash](self->_defaultText, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_tags, "hash");
  return v6 ^ -[GEORPFeedbackFieldOptionAnnotations hash](self->_annotations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEORPFeedbackFieldOptionAnnotations *annotations;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_key = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[GEORPFeedbackFieldOption setLocalizedText:](self, "setLocalizedText:");
  if (*((_QWORD *)v4 + 3))
    -[GEORPFeedbackFieldOption setDefaultText:](self, "setDefaultText:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[GEORPFeedbackFieldOption addTag:](self, "addTag:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  annotations = self->_annotations;
  v11 = *((_QWORD *)v4 + 2);
  if (annotations)
  {
    if (v11)
      -[GEORPFeedbackFieldOptionAnnotations mergeFrom:](annotations, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackFieldOption setAnnotations:](self, "setAnnotations:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_localizedText, 0);
  objc_storeStrong((id *)&self->_defaultText, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
