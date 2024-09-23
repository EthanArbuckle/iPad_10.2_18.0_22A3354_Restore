@implementation GEOTelemetricEntity

- (int)eventKey
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_eventKey;
  else
    return 0;
}

- (void)setEventKey:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_eventKey = a3;
}

- (void)setHasEventKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEventKey
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)eventKeyAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 60099)
  {
    if (a3 <= 3000)
    {
      if (a3 <= 1199)
      {
        if (a3 > 1099)
        {
          switch(a3)
          {
            case 1100:
              return CFSTR("MM_AOF_FROMCONTACT_FAILED");
            case 1101:
              return CFSTR("MM_AOF_FROMLEGACY_FAILED");
            case 1102:
              return CFSTR("MM_AOF_FROMBYTES_FAILED");
            default:
LABEL_228:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
              v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
              return v3;
          }
        }
        else
        {
          switch(a3)
          {
            case 1000:
              result = CFSTR("MM_GS_STRUCTURED_ADDRESS_MISSING");
              break;
            case 1001:
              result = CFSTR("MM_GS_GEO_ADDRESS_DICTIONARY_MISSING");
              break;
            case 1002:
              result = CFSTR("MM_GS_GEOPDADDRESS_MISSING");
              break;
            case 1003:
              result = CFSTR("MM_GS_LANGUAGE_MISSING");
              break;
            case 1004:
              result = CFSTR("MM_GS_COUNTRY_MISSING");
              break;
            case 1005:
              result = CFSTR("MM_GS_PHONETIC_LOCALE_MISSING");
              break;
            case 1006:
              result = CFSTR("MM_GS_GEOPDADDRESSOBJECT_MISSING");
              break;
            case 1007:
              result = CFSTR("MM_GS_KNOWNACCURACY_MISSING");
              break;
            case 1008:
              result = CFSTR("MM_GS_ADDROBJPTR_MISSING");
              break;
            case 1009:
              result = CFSTR("MM_GS_CN_POSTAL_ADDRESS_MISSING");
              break;
            case 1010:
              result = CFSTR("MM_GS_CN_POSTAL_ADDRESS_FAILED");
              break;
            default:
              if (a3)
                goto LABEL_228;
              result = CFSTR("TELEMETRIC_EVENT_KEY_UNKNOWN");
              break;
          }
        }
      }
      else if (a3 > 2001)
      {
        switch(a3)
        {
          case 2200:
            result = CFSTR("REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT");
            break;
          case 2201:
            result = CFSTR("REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT");
            break;
          case 2202:
            result = CFSTR("BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT");
            break;
          case 2203:
            result = CFSTR("BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT");
            break;
          default:
            if (a3 == 2002)
            {
              result = CFSTR("MapsAC_ContactRankDuration");
            }
            else
            {
              if (a3 != 2003)
                goto LABEL_228;
              result = CFSTR("MapsAC_ContactRankCount");
            }
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 1200:
            result = CFSTR("MM_AO_GETNAME_FAILED");
            break;
          case 1201:
            result = CFSTR("MM_AO_GETADDRESS_FAILED");
            break;
          case 1202:
            result = CFSTR("MM_AO_GETSPOKENNAME_FAILED");
            break;
          case 1203:
            result = CFSTR("MM_AO_GETSPOKENADDRESS_FAILED");
            break;
          case 1204:
            result = CFSTR("MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED");
            break;
          case 1205:
            result = CFSTR("MM_AO_GETPHONETICNAME_FAILED");
            break;
          case 1206:
            result = CFSTR("MM_AO_GETPHONETICADDRES_FAILED");
            break;
          case 1207:
            result = CFSTR("MM_AO_GETFULLADDRES_FAILED");
            break;
          case 1208:
            result = CFSTR("MM_AO_GETSHORTADDRES_FAILED");
            break;
          case 1209:
            result = CFSTR("MM_AO_GETDISPLAYLOCALITY_FAILED");
            break;
          case 1210:
            result = CFSTR("MM_AO_GETWEATHERNAME_FAILED");
            break;
          case 1211:
            result = CFSTR("MM_AO_GETPARKINGNAME_FAILED");
            break;
          case 1212:
            result = CFSTR("MM_AO_HASH_FAILED");
            break;
          case 1213:
            result = CFSTR("MM_AO_TOBYTES_FAILED");
            break;
          case 1214:
            result = CFSTR("MM_GS_CONTACT_KEYSET_INIT_FAILED");
            break;
          case 1215:
            result = CFSTR("MM_AO_GETVENUELABEL_FAILED");
            break;
          case 1216:
            result = CFSTR("MM_AO_GETVENUELEVEL_FAILED");
            break;
          case 1217:
            result = CFSTR("MM_AO_GETVENUESHORTADDRESS_FAILED");
            break;
          case 1218:
            result = CFSTR("MM_AO_GETLOCATIONADDRESS_FAILED");
            break;
          default:
            if (a3 != 2001)
              goto LABEL_228;
            result = CFSTR("MapsAC_ContactMatchDuration");
            break;
        }
      }
    }
    else if (a3 <= 51000)
    {
      if (a3 > 4000)
      {
        switch(a3)
        {
          case 4001:
            return CFSTR("Flyover_TrackingStateChange");
          case 4002:
            return CFSTR("Flyover_TrackingStateReasonChange");
          case 4003:
          case 4004:
          case 4005:
          case 4006:
          case 4007:
          case 4008:
          case 4009:
          case 4010:
          case 4014:
          case 4015:
          case 4016:
          case 4017:
          case 4018:
          case 4019:
          case 4020:
            goto LABEL_228;
          case 4011:
            return CFSTR("Flyover_TrackingStateNotAvailableDuration");
          case 4012:
            return CFSTR("Flyover_TrackingStateLimitedDuration");
          case 4013:
            return CFSTR("Flyover_TrackingStateNormalDuration");
          case 4021:
            return CFSTR("Flyover_TrackingStateReasonNoneDuration");
          case 4022:
            return CFSTR("Flyover_TrackingStateReasonInitializingDuration");
          case 4023:
            return CFSTR("Flyover_TrackingStateReasonExcessiveMotionDuration");
          case 4024:
            return CFSTR("Flyover_TrackingStateReasonInsufficientFeaturesDuration");
          case 4025:
            return CFSTR("Flyover_TrackingStateReasonSessionInterruptedDuration");
          default:
            if (a3 == 50001)
            {
              result = CFSTR("MSL_VECTOR_REQUEST_EXCEPTIONS");
            }
            else
            {
              if (a3 != 50002)
                goto LABEL_228;
              result = CFSTR("MSL_VECTOR_REQUEST_TIME_TO_PERFORM");
            }
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 3001:
            result = CFSTR("MSPSync_ClientCount");
            break;
          case 3002:
            result = CFSTR("MSPSync_HistoryAdd");
            break;
          case 3003:
            result = CFSTR("MSPSync_HistoryRemove");
            break;
          case 3004:
            result = CFSTR("MSPSync_HistoryCount");
            break;
          case 3005:
            result = CFSTR("MSPSync_FavoriteAdd");
            break;
          case 3006:
            result = CFSTR("MSPSync_FavoriteEdit");
            break;
          case 3007:
            result = CFSTR("MSPSync_FavoriteRemove");
            break;
          case 3008:
            result = CFSTR("MSPSync_FavoriteCount");
            break;
          case 3009:
            result = CFSTR("MSPSync_Merged");
            break;
          case 3010:
            result = CFSTR("MSPSync_MergeDuration");
            break;
          case 3011:
            result = CFSTR("MSPSync_NotificationDelay");
            break;
          case 3012:
            result = CFSTR("MSPSync_CKOperationFinished");
            break;
          default:
            goto LABEL_228;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 51001:
          result = CFSTR("MSL_ETA_REQUEST_UNPARSEABLE_COUNT");
          break;
        case 51002:
          result = CFSTR("MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT");
          break;
        case 51003:
          result = CFSTR("MSL_DIRECTIONS_INVALID_REQUEST_COUNT");
          break;
        case 51004:
          result = CFSTR("MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT");
          break;
        case 51005:
          result = CFSTR("MSL_DIRECTIONS_WALKING_REQUEST_COUNT");
          break;
        case 51006:
          result = CFSTR("MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT");
          break;
        case 51007:
          result = CFSTR("MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT");
          break;
        case 51008:
          result = CFSTR("MSL_ETA_REQUEST_COUNT");
          break;
        case 51009:
          result = CFSTR("MSL_ETA_TOTAL_RUNTIME_MS");
          break;
        case 51010:
          result = CFSTR("MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS");
          break;
        case 51011:
          result = CFSTR("MSL_ETA_SNAPPING_RUNTIME_MS");
          break;
        case 51012:
          result = CFSTR("MSL_ETA_COMPUTATION_RUNTIME_MS");
          break;
        case 51013:
          result = CFSTR("MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS");
          break;
        case 51014:
          result = CFSTR("MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS");
          break;
        case 51015:
          result = CFSTR("MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS");
          break;
        case 51016:
          result = CFSTR("MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS");
          break;
        case 51017:
          result = CFSTR("MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS");
          break;
        case 51018:
          result = CFSTR("MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS");
          break;
        case 51019:
          result = CFSTR("MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS");
          break;
        case 51020:
          result = CFSTR("MSL_ETA_INVALID_REQUEST_COUNT");
          break;
        default:
          switch(a3)
          {
            case 52020:
              result = CFSTR("MSL_ROUTING_TRAFFIC_SNAPSHOT_PROCESSING_RUNTIME_MS");
              break;
            case 52021:
              result = CFSTR("MSL_ROUTING_TRAFFIC_ROAD_SPEED_UPDATE_RUNTIME_MS");
              break;
            case 52022:
              result = CFSTR("MSL_ROUTING_TRAFFIC_CELL_MARKING_RUNTIME_MS");
              break;
            case 52023:
              result = CFSTR("MSL_ROUTING_TRAFFIC_CELL_COMPUTATION_RUNTIME_MS");
              break;
            default:
              switch(a3)
              {
                case 60000:
                  result = CFSTR("MSL_SEARCH_CANCELLATION_COUNT");
                  break;
                case 60001:
                  result = CFSTR("MSL_AC_RANKING_LATENCY_MS");
                  break;
                case 60002:
                  result = CFSTR("MSL_GEOCODING_RANKING_LATENCY_MS");
                  break;
                case 60003:
                  result = CFSTR("MSL_SEARCH_RANKING_LATENCY_MS");
                  break;
                default:
                  goto LABEL_228;
              }
              break;
          }
          break;
      }
    }
  }
  else if (a3 <= 60599)
  {
    if (a3 <= 60299)
    {
      switch(a3)
      {
        case 60100:
          result = CFSTR("MSL_ADDRESS_SEARCH_REQUEST_COUNT");
          break;
        case 60101:
          result = CFSTR("MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT");
          break;
        case 60102:
          result = CFSTR("MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT");
          break;
        case 60103:
          result = CFSTR("MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS");
          break;
        case 60104:
          result = CFSTR("MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS");
          break;
        case 60105:
          result = CFSTR("MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS");
          break;
        case 60106:
          result = CFSTR("MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS");
          break;
        case 60107:
          result = CFSTR("MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS");
          break;
        case 60108:
          result = CFSTR("MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS");
          break;
        default:
          switch(a3)
          {
            case 60200:
              result = CFSTR("MSL_BUSINESS_SEARCH_REQUEST_COUNT");
              break;
            case 60201:
              result = CFSTR("MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT");
              break;
            case 60202:
              result = CFSTR("MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT");
              break;
            case 60203:
              result = CFSTR("MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS");
              break;
            case 60204:
              result = CFSTR("MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS");
              break;
            case 60205:
              result = CFSTR("MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS");
              break;
            default:
              goto LABEL_228;
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 60500:
          result = CFSTR("MSL_EX_CATEGORY_SEARCH_REQUEST_COUNT");
          break;
        case 60501:
          result = CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_REQUEST_COUNT");
          break;
        case 60502:
          result = CFSTR("MSL_EX_CATEGORY_SEARCH_RESPONSE_SIZE_COUNT");
          break;
        case 60503:
          result = CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_RESPONSE_SIZE_COUNT");
          break;
        case 60504:
          result = CFSTR("MSL_EX_CATEGORY_SEARCH_TOTAL_LATENCY_MS");
          break;
        case 60505:
          result = CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_TOTAL_LATENCY_MS");
          break;
        case 60506:
          result = CFSTR("MSL_EX_CATEGORY_SEARCH_FEATURIZING_LATENCY_MS");
          break;
        default:
          switch(a3)
          {
            case 60300:
              result = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT");
              break;
            case 60301:
              result = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT");
              break;
            case 60302:
              result = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT");
              break;
            case 60303:
              result = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS");
              break;
            case 60304:
              result = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS");
              break;
            case 60305:
              result = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS");
              break;
            default:
              switch(a3)
              {
                case 60400:
                  result = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT");
                  break;
                case 60401:
                  result = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT");
                  break;
                case 60402:
                  result = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT");
                  break;
                case 60403:
                  result = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS");
                  break;
                default:
                  goto LABEL_228;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 60600:
        v3 = CFSTR("MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS");
        return v3;
      case 60601:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT");
        break;
      case 60602:
      case 60603:
      case 60604:
      case 60605:
      case 60606:
      case 60607:
      case 60608:
      case 60609:
      case 60617:
      case 60618:
      case 60619:
      case 60627:
      case 60628:
      case 60629:
      case 60637:
      case 60638:
      case 60639:
      case 60647:
      case 60648:
      case 60649:
      case 60656:
      case 60657:
      case 60658:
      case 60659:
      case 60667:
      case 60668:
      case 60669:
      case 60676:
      case 60677:
      case 60678:
      case 60679:
        goto LABEL_228;
      case 60610:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60611:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS");
        break;
      case 60612:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60613:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60614:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT");
        break;
      case 60615:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60616:
        result = CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      case 60620:
        result = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60621:
        result = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS");
        break;
      case 60622:
        result = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60623:
        result = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60624:
        result = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT");
        break;
      case 60625:
        result = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60626:
        result = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      case 60630:
        result = CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60631:
        result = CFSTR("MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS");
        break;
      case 60632:
        result = CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60633:
        result = CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60634:
        result = CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT");
        break;
      case 60635:
        result = CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60636:
        result = CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      case 60640:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60641:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS");
        break;
      case 60642:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60643:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60644:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT");
        break;
      case 60645:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60646:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      case 60650:
        result = CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60651:
        result = CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60652:
        result = CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60653:
        result = CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT");
        break;
      case 60654:
        result = CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60655:
        result = CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      case 60660:
        result = CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60661:
        result = CFSTR("MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS");
        break;
      case 60662:
        result = CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60663:
        result = CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60664:
        result = CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT");
        break;
      case 60665:
        result = CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60666:
        result = CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      case 60670:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60671:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60672:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60673:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT");
        break;
      case 60674:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60675:
        result = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      case 60680:
        result = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS");
        break;
      case 60681:
        result = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS");
        break;
      case 60682:
        result = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS");
        break;
      case 60683:
        result = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT");
        break;
      case 60684:
        result = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT");
        break;
      case 60685:
        result = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT");
        break;
      case 60686:
        result = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
        break;
      default:
        switch(a3)
        {
          case 70001:
            result = CFSTR("MSL_PLACES_SERVER_ERROR_COUNT");
            break;
          case 70002:
            result = CFSTR("MSL_PLACES_INVALID_REQUEST_COUNT");
            break;
          case 70003:
            result = CFSTR("MSL_PLACES_CANCELLED_REQUEST_COUNT");
            break;
          case 70004:
            result = CFSTR("MSL_PLACES_REQUEST_COMPLETE_TIME_MS");
            break;
          case 70005:
            result = CFSTR("MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS");
            break;
          case 70006:
            result = CFSTR("MSL_PLACES_POI_COMPONENTS_TIME_MS");
            break;
          case 70007:
            result = CFSTR("MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS");
            break;
          case 70008:
            result = CFSTR("MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS");
            break;
          case 70009:
            result = CFSTR("MSL_PLACES_POI_DATA_ACCESS_TIME_MS");
            break;
          case 70010:
            result = CFSTR("MSL_PLACES_POI_LOCALIZATION_TIME_MS");
            break;
          default:
            goto LABEL_228;
        }
        break;
    }
  }
  return result;
}

- (int)StringAsEventKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEMETRIC_EVENT_KEY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_STRUCTURED_ADDRESS_MISSING")) & 1) != 0)
  {
    v4 = 1000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_GEO_ADDRESS_DICTIONARY_MISSING")) & 1) != 0)
  {
    v4 = 1001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_GEOPDADDRESS_MISSING")) & 1) != 0)
  {
    v4 = 1002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_LANGUAGE_MISSING")) & 1) != 0)
  {
    v4 = 1003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_COUNTRY_MISSING")) & 1) != 0)
  {
    v4 = 1004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_PHONETIC_LOCALE_MISSING")) & 1) != 0)
  {
    v4 = 1005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_GEOPDADDRESSOBJECT_MISSING")) & 1) != 0)
  {
    v4 = 1006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_KNOWNACCURACY_MISSING")) & 1) != 0)
  {
    v4 = 1007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_ADDROBJPTR_MISSING")) & 1) != 0)
  {
    v4 = 1008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_CN_POSTAL_ADDRESS_MISSING")) & 1) != 0)
  {
    v4 = 1009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_CN_POSTAL_ADDRESS_FAILED")) & 1) != 0)
  {
    v4 = 1010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AOF_FROMCONTACT_FAILED")) & 1) != 0)
  {
    v4 = 1100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AOF_FROMLEGACY_FAILED")) & 1) != 0)
  {
    v4 = 1101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AOF_FROMBYTES_FAILED")) & 1) != 0)
  {
    v4 = 1102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETNAME_FAILED")) & 1) != 0)
  {
    v4 = 1200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETADDRESS_FAILED")) & 1) != 0)
  {
    v4 = 1201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETSPOKENNAME_FAILED")) & 1) != 0)
  {
    v4 = 1202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETSPOKENADDRESS_FAILED")) & 1) != 0)
  {
    v4 = 1203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED")) & 1) != 0)
  {
    v4 = 1204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETPHONETICNAME_FAILED")) & 1) != 0)
  {
    v4 = 1205;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETPHONETICADDRES_FAILED")) & 1) != 0)
  {
    v4 = 1206;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETFULLADDRES_FAILED")) & 1) != 0)
  {
    v4 = 1207;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETSHORTADDRES_FAILED")) & 1) != 0)
  {
    v4 = 1208;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETDISPLAYLOCALITY_FAILED")) & 1) != 0)
  {
    v4 = 1209;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETWEATHERNAME_FAILED")) & 1) != 0)
  {
    v4 = 1210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETPARKINGNAME_FAILED")) & 1) != 0)
  {
    v4 = 1211;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_HASH_FAILED")) & 1) != 0)
  {
    v4 = 1212;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_TOBYTES_FAILED")) & 1) != 0)
  {
    v4 = 1213;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_GS_CONTACT_KEYSET_INIT_FAILED")) & 1) != 0)
  {
    v4 = 1214;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETVENUELABEL_FAILED")) & 1) != 0)
  {
    v4 = 1215;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETVENUELEVEL_FAILED")) & 1) != 0)
  {
    v4 = 1216;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETVENUESHORTADDRESS_FAILED")) & 1) != 0)
  {
    v4 = 1217;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_AO_GETLOCATIONADDRESS_FAILED")) & 1) != 0)
  {
    v4 = 1218;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapsAC_ContactMatchDuration")) & 1) != 0)
  {
    v4 = 2001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapsAC_ContactRankDuration")) & 1) != 0)
  {
    v4 = 2002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapsAC_ContactRankCount")) & 1) != 0)
  {
    v4 = 2003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT")) & 1) != 0)
  {
    v4 = 2200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT")) & 1) != 0)
  {
    v4 = 2201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT")) & 1) != 0)
  {
    v4 = 2202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT")) & 1) != 0)
  {
    v4 = 2203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_ClientCount")) & 1) != 0)
  {
    v4 = 3001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_HistoryAdd")) & 1) != 0)
  {
    v4 = 3002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_HistoryRemove")) & 1) != 0)
  {
    v4 = 3003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_HistoryCount")) & 1) != 0)
  {
    v4 = 3004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_FavoriteAdd")) & 1) != 0)
  {
    v4 = 3005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_FavoriteEdit")) & 1) != 0)
  {
    v4 = 3006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_FavoriteRemove")) & 1) != 0)
  {
    v4 = 3007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_FavoriteCount")) & 1) != 0)
  {
    v4 = 3008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_Merged")) & 1) != 0)
  {
    v4 = 3009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_MergeDuration")) & 1) != 0)
  {
    v4 = 3010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_NotificationDelay")) & 1) != 0)
  {
    v4 = 3011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSPSync_CKOperationFinished")) & 1) != 0)
  {
    v4 = 3012;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateChange")) & 1) != 0)
  {
    v4 = 4001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonChange")) & 1) != 0)
  {
    v4 = 4002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateNotAvailableDuration")) & 1) != 0)
  {
    v4 = 4011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateLimitedDuration")) & 1) != 0)
  {
    v4 = 4012;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateNormalDuration")) & 1) != 0)
  {
    v4 = 4013;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonNoneDuration")) & 1) != 0)
  {
    v4 = 4021;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonInitializingDuration")) & 1) != 0)
  {
    v4 = 4022;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonExcessiveMotionDuration")) & 1) != 0)
  {
    v4 = 4023;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonInsufficientFeaturesDuration")) & 1) != 0)
  {
    v4 = 4024;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonSessionInterruptedDuration")) & 1) != 0)
  {
    v4 = 4025;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_VECTOR_REQUEST_EXCEPTIONS")) & 1) != 0)
  {
    v4 = 50001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_VECTOR_REQUEST_TIME_TO_PERFORM")) & 1) != 0)
  {
    v4 = 50002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ETA_REQUEST_UNPARSEABLE_COUNT")) & 1) != 0)
  {
    v4 = 51001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT")) & 1) != 0)
  {
    v4 = 51002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_INVALID_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 51003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 51004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 51005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 51006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 51007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ETA_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 51008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ETA_TOTAL_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ETA_SNAPPING_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ETA_COMPUTATION_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51012;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51013;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51014;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51015;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51017;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51018;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 51019;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ETA_INVALID_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 51020;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_SNAPSHOT_PROCESSING_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 52020;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_ROAD_SPEED_UPDATE_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 52021;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_CELL_MARKING_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 52022;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_CELL_COMPUTATION_RUNTIME_MS")) & 1) != 0)
  {
    v4 = 52023;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_SEARCH_CANCELLATION_COUNT")) & 1) != 0)
  {
    v4 = 60000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_AC_RANKING_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_GEOCODING_RANKING_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_SEARCH_RANKING_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 60100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT")) & 1) != 0)
  {
    v4 = 60101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 60200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT")) & 1) != 0)
  {
    v4 = 60201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60205;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 60300;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT")) & 1) != 0)
  {
    v4 = 60301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 60400;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT")) & 1) != 0)
  {
    v4 = 60401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60402;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60403;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 60500;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_REQUEST_COUNT")) & 1) != 0)
  {
    v4 = 60501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60505;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_FEATURIZING_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60506;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60600;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60610;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60611;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60612;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60613;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60614;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60615;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60616;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60620;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60621;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60622;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60623;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60624;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60625;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60626;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60630;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60631;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60632;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60633;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60634;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60635;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60636;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60640;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60641;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60642;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60643;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60644;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60645;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60646;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60650;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60651;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60652;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60653;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60654;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60655;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60660;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60661;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60662;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60663;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60664;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60665;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60666;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60670;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60671;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60672;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60673;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60674;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60675;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60680;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60681;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
  {
    v4 = 60682;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60683;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT")) & 1) != 0)
  {
    v4 = 60684;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
  {
    v4 = 60685;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
  {
    v4 = 60686;
  }
  else
  {
    v4 = 70001;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_SERVER_ERROR_COUNT")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_INVALID_REQUEST_COUNT")) & 1) != 0)
      {
        v4 = 70002;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_CANCELLED_REQUEST_COUNT")) & 1) != 0)
      {
        v4 = 70003;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_REQUEST_COMPLETE_TIME_MS")) & 1) != 0)
      {
        v4 = 70004;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS")) & 1) != 0)
      {
        v4 = 70005;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_POI_COMPONENTS_TIME_MS")) & 1) != 0)
      {
        v4 = 70006;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS")) & 1) != 0)
      {
        v4 = 70007;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS")) & 1) != 0)
      {
        v4 = 70008;
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_POI_DATA_ACCESS_TIME_MS")) & 1) != 0)
      {
        v4 = 70009;
      }
      else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MSL_PLACES_POI_LOCALIZATION_TIME_MS")))
      {
        v4 = 70010;
      }
      else
      {
        v4 = 0;
      }
    }
  }

  return v4;
}

- (unint64_t)eventValue
{
  return self->_eventValue;
}

- (void)setEventValue:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_eventValue = a3;
}

- (void)setHasEventValue:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEventValue
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasEventDetail
{
  return self->_eventDetail != 0;
}

- (NSString)eventDetail
{
  return self->_eventDetail;
}

- (void)setEventDetail:(id)a3
{
  objc_storeStrong((id *)&self->_eventDetail, a3);
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
  v8.super_class = (Class)GEOTelemetricEntity;
  -[GEOTelemetricEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTelemetricEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTelemetricEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 2) != 0)
    {
      v6 = *(_DWORD *)(a1 + 24);
      if (v6 <= 60099)
      {
        if (v6 <= 3000)
        {
          if (v6 <= 1199)
          {
            if (v6 > 1099)
            {
              switch(v6)
              {
                case 1100:
                  v7 = CFSTR("MM_AOF_FROMCONTACT_FAILED");
                  break;
                case 1101:
                  v7 = CFSTR("MM_AOF_FROMLEGACY_FAILED");
                  break;
                case 1102:
                  v7 = CFSTR("MM_AOF_FROMBYTES_FAILED");
                  break;
                default:
LABEL_61:
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
                  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  break;
              }
            }
            else
            {
              switch(v6)
              {
                case 1000:
                  v7 = CFSTR("MM_GS_STRUCTURED_ADDRESS_MISSING");
                  break;
                case 1001:
                  v7 = CFSTR("MM_GS_GEO_ADDRESS_DICTIONARY_MISSING");
                  break;
                case 1002:
                  v7 = CFSTR("MM_GS_GEOPDADDRESS_MISSING");
                  break;
                case 1003:
                  v7 = CFSTR("MM_GS_LANGUAGE_MISSING");
                  break;
                case 1004:
                  v7 = CFSTR("MM_GS_COUNTRY_MISSING");
                  break;
                case 1005:
                  v7 = CFSTR("MM_GS_PHONETIC_LOCALE_MISSING");
                  break;
                case 1006:
                  v7 = CFSTR("MM_GS_GEOPDADDRESSOBJECT_MISSING");
                  break;
                case 1007:
                  v7 = CFSTR("MM_GS_KNOWNACCURACY_MISSING");
                  break;
                case 1008:
                  v7 = CFSTR("MM_GS_ADDROBJPTR_MISSING");
                  break;
                case 1009:
                  v7 = CFSTR("MM_GS_CN_POSTAL_ADDRESS_MISSING");
                  break;
                case 1010:
                  v7 = CFSTR("MM_GS_CN_POSTAL_ADDRESS_FAILED");
                  break;
                default:
                  if (v6)
                    goto LABEL_61;
                  v7 = CFSTR("TELEMETRIC_EVENT_KEY_UNKNOWN");
                  break;
              }
            }
          }
          else if (v6 > 2001)
          {
            switch(v6)
            {
              case 2200:
                v7 = CFSTR("REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT");
                break;
              case 2201:
                v7 = CFSTR("REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT");
                break;
              case 2202:
                v7 = CFSTR("BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT");
                break;
              case 2203:
                v7 = CFSTR("BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT");
                break;
              default:
                if (v6 == 2002)
                {
                  v7 = CFSTR("MapsAC_ContactRankDuration");
                }
                else
                {
                  if (v6 != 2003)
                    goto LABEL_61;
                  v7 = CFSTR("MapsAC_ContactRankCount");
                }
                break;
            }
          }
          else
          {
            switch(v6)
            {
              case 1200:
                v7 = CFSTR("MM_AO_GETNAME_FAILED");
                break;
              case 1201:
                v7 = CFSTR("MM_AO_GETADDRESS_FAILED");
                break;
              case 1202:
                v7 = CFSTR("MM_AO_GETSPOKENNAME_FAILED");
                break;
              case 1203:
                v7 = CFSTR("MM_AO_GETSPOKENADDRESS_FAILED");
                break;
              case 1204:
                v7 = CFSTR("MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED");
                break;
              case 1205:
                v7 = CFSTR("MM_AO_GETPHONETICNAME_FAILED");
                break;
              case 1206:
                v7 = CFSTR("MM_AO_GETPHONETICADDRES_FAILED");
                break;
              case 1207:
                v7 = CFSTR("MM_AO_GETFULLADDRES_FAILED");
                break;
              case 1208:
                v7 = CFSTR("MM_AO_GETSHORTADDRES_FAILED");
                break;
              case 1209:
                v7 = CFSTR("MM_AO_GETDISPLAYLOCALITY_FAILED");
                break;
              case 1210:
                v7 = CFSTR("MM_AO_GETWEATHERNAME_FAILED");
                break;
              case 1211:
                v7 = CFSTR("MM_AO_GETPARKINGNAME_FAILED");
                break;
              case 1212:
                v7 = CFSTR("MM_AO_HASH_FAILED");
                break;
              case 1213:
                v7 = CFSTR("MM_AO_TOBYTES_FAILED");
                break;
              case 1214:
                v7 = CFSTR("MM_GS_CONTACT_KEYSET_INIT_FAILED");
                break;
              case 1215:
                v7 = CFSTR("MM_AO_GETVENUELABEL_FAILED");
                break;
              case 1216:
                v7 = CFSTR("MM_AO_GETVENUELEVEL_FAILED");
                break;
              case 1217:
                v7 = CFSTR("MM_AO_GETVENUESHORTADDRESS_FAILED");
                break;
              case 1218:
                v7 = CFSTR("MM_AO_GETLOCATIONADDRESS_FAILED");
                break;
              default:
                if (v6 != 2001)
                  goto LABEL_61;
                v7 = CFSTR("MapsAC_ContactMatchDuration");
                break;
            }
          }
        }
        else if (v6 <= 51000)
        {
          if (v6 > 4000)
          {
            switch(v6)
            {
              case 4001:
                v7 = CFSTR("Flyover_TrackingStateChange");
                break;
              case 4002:
                v7 = CFSTR("Flyover_TrackingStateReasonChange");
                break;
              case 4003:
              case 4004:
              case 4005:
              case 4006:
              case 4007:
              case 4008:
              case 4009:
              case 4010:
              case 4014:
              case 4015:
              case 4016:
              case 4017:
              case 4018:
              case 4019:
              case 4020:
                goto LABEL_61;
              case 4011:
                v7 = CFSTR("Flyover_TrackingStateNotAvailableDuration");
                break;
              case 4012:
                v7 = CFSTR("Flyover_TrackingStateLimitedDuration");
                break;
              case 4013:
                v7 = CFSTR("Flyover_TrackingStateNormalDuration");
                break;
              case 4021:
                v7 = CFSTR("Flyover_TrackingStateReasonNoneDuration");
                break;
              case 4022:
                v7 = CFSTR("Flyover_TrackingStateReasonInitializingDuration");
                break;
              case 4023:
                v7 = CFSTR("Flyover_TrackingStateReasonExcessiveMotionDuration");
                break;
              case 4024:
                v7 = CFSTR("Flyover_TrackingStateReasonInsufficientFeaturesDuration");
                break;
              case 4025:
                v7 = CFSTR("Flyover_TrackingStateReasonSessionInterruptedDuration");
                break;
              default:
                if (v6 == 50001)
                {
                  v7 = CFSTR("MSL_VECTOR_REQUEST_EXCEPTIONS");
                }
                else
                {
                  if (v6 != 50002)
                    goto LABEL_61;
                  v7 = CFSTR("MSL_VECTOR_REQUEST_TIME_TO_PERFORM");
                }
                break;
            }
          }
          else
          {
            switch(v6)
            {
              case 3001:
                v7 = CFSTR("MSPSync_ClientCount");
                break;
              case 3002:
                v7 = CFSTR("MSPSync_HistoryAdd");
                break;
              case 3003:
                v7 = CFSTR("MSPSync_HistoryRemove");
                break;
              case 3004:
                v7 = CFSTR("MSPSync_HistoryCount");
                break;
              case 3005:
                v7 = CFSTR("MSPSync_FavoriteAdd");
                break;
              case 3006:
                v7 = CFSTR("MSPSync_FavoriteEdit");
                break;
              case 3007:
                v7 = CFSTR("MSPSync_FavoriteRemove");
                break;
              case 3008:
                v7 = CFSTR("MSPSync_FavoriteCount");
                break;
              case 3009:
                v7 = CFSTR("MSPSync_Merged");
                break;
              case 3010:
                v7 = CFSTR("MSPSync_MergeDuration");
                break;
              case 3011:
                v7 = CFSTR("MSPSync_NotificationDelay");
                break;
              case 3012:
                v7 = CFSTR("MSPSync_CKOperationFinished");
                break;
              default:
                goto LABEL_61;
            }
          }
        }
        else
        {
          switch(v6)
          {
            case 51001:
              v7 = CFSTR("MSL_ETA_REQUEST_UNPARSEABLE_COUNT");
              break;
            case 51002:
              v7 = CFSTR("MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT");
              break;
            case 51003:
              v7 = CFSTR("MSL_DIRECTIONS_INVALID_REQUEST_COUNT");
              break;
            case 51004:
              v7 = CFSTR("MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT");
              break;
            case 51005:
              v7 = CFSTR("MSL_DIRECTIONS_WALKING_REQUEST_COUNT");
              break;
            case 51006:
              v7 = CFSTR("MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT");
              break;
            case 51007:
              v7 = CFSTR("MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT");
              break;
            case 51008:
              v7 = CFSTR("MSL_ETA_REQUEST_COUNT");
              break;
            case 51009:
              v7 = CFSTR("MSL_ETA_TOTAL_RUNTIME_MS");
              break;
            case 51010:
              v7 = CFSTR("MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS");
              break;
            case 51011:
              v7 = CFSTR("MSL_ETA_SNAPPING_RUNTIME_MS");
              break;
            case 51012:
              v7 = CFSTR("MSL_ETA_COMPUTATION_RUNTIME_MS");
              break;
            case 51013:
              v7 = CFSTR("MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS");
              break;
            case 51014:
              v7 = CFSTR("MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS");
              break;
            case 51015:
              v7 = CFSTR("MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS");
              break;
            case 51016:
              v7 = CFSTR("MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS");
              break;
            case 51017:
              v7 = CFSTR("MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS");
              break;
            case 51018:
              v7 = CFSTR("MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS");
              break;
            case 51019:
              v7 = CFSTR("MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS");
              break;
            case 51020:
              v7 = CFSTR("MSL_ETA_INVALID_REQUEST_COUNT");
              break;
            default:
              switch(v6)
              {
                case 52020:
                  v7 = CFSTR("MSL_ROUTING_TRAFFIC_SNAPSHOT_PROCESSING_RUNTIME_MS");
                  break;
                case 52021:
                  v7 = CFSTR("MSL_ROUTING_TRAFFIC_ROAD_SPEED_UPDATE_RUNTIME_MS");
                  break;
                case 52022:
                  v7 = CFSTR("MSL_ROUTING_TRAFFIC_CELL_MARKING_RUNTIME_MS");
                  break;
                case 52023:
                  v7 = CFSTR("MSL_ROUTING_TRAFFIC_CELL_COMPUTATION_RUNTIME_MS");
                  break;
                default:
                  switch(v6)
                  {
                    case 60000:
                      v7 = CFSTR("MSL_SEARCH_CANCELLATION_COUNT");
                      break;
                    case 60001:
                      v7 = CFSTR("MSL_AC_RANKING_LATENCY_MS");
                      break;
                    case 60002:
                      v7 = CFSTR("MSL_GEOCODING_RANKING_LATENCY_MS");
                      break;
                    case 60003:
                      v7 = CFSTR("MSL_SEARCH_RANKING_LATENCY_MS");
                      break;
                    default:
                      goto LABEL_61;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if (v6 <= 60599)
      {
        if (v6 <= 60299)
        {
          switch(v6)
          {
            case 60100:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_REQUEST_COUNT");
              break;
            case 60101:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT");
              break;
            case 60102:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT");
              break;
            case 60103:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS");
              break;
            case 60104:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS");
              break;
            case 60105:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS");
              break;
            case 60106:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS");
              break;
            case 60107:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS");
              break;
            case 60108:
              v7 = CFSTR("MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS");
              break;
            default:
              switch(v6)
              {
                case 60200:
                  v7 = CFSTR("MSL_BUSINESS_SEARCH_REQUEST_COUNT");
                  break;
                case 60201:
                  v7 = CFSTR("MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT");
                  break;
                case 60202:
                  v7 = CFSTR("MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT");
                  break;
                case 60203:
                  v7 = CFSTR("MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS");
                  break;
                case 60204:
                  v7 = CFSTR("MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS");
                  break;
                case 60205:
                  v7 = CFSTR("MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS");
                  break;
                default:
                  goto LABEL_61;
              }
              break;
          }
        }
        else
        {
          switch(v6)
          {
            case 60500:
              v7 = CFSTR("MSL_EX_CATEGORY_SEARCH_REQUEST_COUNT");
              break;
            case 60501:
              v7 = CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_REQUEST_COUNT");
              break;
            case 60502:
              v7 = CFSTR("MSL_EX_CATEGORY_SEARCH_RESPONSE_SIZE_COUNT");
              break;
            case 60503:
              v7 = CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_RESPONSE_SIZE_COUNT");
              break;
            case 60504:
              v7 = CFSTR("MSL_EX_CATEGORY_SEARCH_TOTAL_LATENCY_MS");
              break;
            case 60505:
              v7 = CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_TOTAL_LATENCY_MS");
              break;
            case 60506:
              v7 = CFSTR("MSL_EX_CATEGORY_SEARCH_FEATURIZING_LATENCY_MS");
              break;
            default:
              switch(v6)
              {
                case 60300:
                  v7 = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT");
                  break;
                case 60301:
                  v7 = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT");
                  break;
                case 60302:
                  v7 = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT");
                  break;
                case 60303:
                  v7 = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS");
                  break;
                case 60304:
                  v7 = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS");
                  break;
                case 60305:
                  v7 = CFSTR("MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS");
                  break;
                default:
                  switch(v6)
                  {
                    case 60400:
                      v7 = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT");
                      break;
                    case 60401:
                      v7 = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT");
                      break;
                    case 60402:
                      v7 = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT");
                      break;
                    case 60403:
                      v7 = CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS");
                      break;
                    default:
                      goto LABEL_61;
                  }
                  break;
              }
              break;
          }
        }
      }
      else
      {
        switch(v6)
        {
          case 60600:
            v7 = CFSTR("MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60601:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT");
            break;
          case 60602:
          case 60603:
          case 60604:
          case 60605:
          case 60606:
          case 60607:
          case 60608:
          case 60609:
          case 60617:
          case 60618:
          case 60619:
          case 60627:
          case 60628:
          case 60629:
          case 60637:
          case 60638:
          case 60639:
          case 60647:
          case 60648:
          case 60649:
          case 60656:
          case 60657:
          case 60658:
          case 60659:
          case 60667:
          case 60668:
          case 60669:
          case 60676:
          case 60677:
          case 60678:
          case 60679:
            goto LABEL_61;
          case 60610:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60611:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS");
            break;
          case 60612:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60613:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60614:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT");
            break;
          case 60615:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60616:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          case 60620:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60621:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS");
            break;
          case 60622:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60623:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60624:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT");
            break;
          case 60625:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60626:
            v7 = CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          case 60630:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60631:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS");
            break;
          case 60632:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60633:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60634:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT");
            break;
          case 60635:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60636:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          case 60640:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60641:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS");
            break;
          case 60642:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60643:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60644:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT");
            break;
          case 60645:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60646:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          case 60650:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60651:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60652:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60653:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT");
            break;
          case 60654:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60655:
            v7 = CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          case 60660:
            v7 = CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60661:
            v7 = CFSTR("MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS");
            break;
          case 60662:
            v7 = CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60663:
            v7 = CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60664:
            v7 = CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT");
            break;
          case 60665:
            v7 = CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60666:
            v7 = CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          case 60670:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60671:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60672:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60673:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT");
            break;
          case 60674:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60675:
            v7 = CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          case 60680:
            v7 = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS");
            break;
          case 60681:
            v7 = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS");
            break;
          case 60682:
            v7 = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS");
            break;
          case 60683:
            v7 = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT");
            break;
          case 60684:
            v7 = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT");
            break;
          case 60685:
            v7 = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT");
            break;
          case 60686:
            v7 = CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT");
            break;
          default:
            switch(v6)
            {
              case 70001:
                v7 = CFSTR("MSL_PLACES_SERVER_ERROR_COUNT");
                break;
              case 70002:
                v7 = CFSTR("MSL_PLACES_INVALID_REQUEST_COUNT");
                break;
              case 70003:
                v7 = CFSTR("MSL_PLACES_CANCELLED_REQUEST_COUNT");
                break;
              case 70004:
                v7 = CFSTR("MSL_PLACES_REQUEST_COMPLETE_TIME_MS");
                break;
              case 70005:
                v7 = CFSTR("MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS");
                break;
              case 70006:
                v7 = CFSTR("MSL_PLACES_POI_COMPONENTS_TIME_MS");
                break;
              case 70007:
                v7 = CFSTR("MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS");
                break;
              case 70008:
                v7 = CFSTR("MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS");
                break;
              case 70009:
                v7 = CFSTR("MSL_PLACES_POI_DATA_ACCESS_TIME_MS");
                break;
              case 70010:
                v7 = CFSTR("MSL_PLACES_POI_LOCALIZATION_TIME_MS");
                break;
              default:
                goto LABEL_61;
            }
            break;
        }
      }
      if (a2)
        v8 = CFSTR("eventKey");
      else
        v8 = CFSTR("event_key");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 28);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("eventValue");
      else
        v10 = CFSTR("event_value");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "eventDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a2)
        v12 = CFSTR("eventDetail");
      else
        v12 = CFSTR("event_detail");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTelemetricEntity _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTelemetricEntity)initWithDictionary:(id)a3
{
  return (GEOTelemetricEntity *)-[GEOTelemetricEntity _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_404;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_404;
  if (a3)
    v6 = CFSTR("eventKey");
  else
    v6 = CFSTR("event_key");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TELEMETRIC_EVENT_KEY_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_STRUCTURED_ADDRESS_MISSING")) & 1) != 0)
    {
      v9 = 1000;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_GEO_ADDRESS_DICTIONARY_MISSING")) & 1) != 0)
    {
      v9 = 1001;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_GEOPDADDRESS_MISSING")) & 1) != 0)
    {
      v9 = 1002;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_LANGUAGE_MISSING")) & 1) != 0)
    {
      v9 = 1003;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_COUNTRY_MISSING")) & 1) != 0)
    {
      v9 = 1004;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_PHONETIC_LOCALE_MISSING")) & 1) != 0)
    {
      v9 = 1005;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_GEOPDADDRESSOBJECT_MISSING")) & 1) != 0)
    {
      v9 = 1006;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_KNOWNACCURACY_MISSING")) & 1) != 0)
    {
      v9 = 1007;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_ADDROBJPTR_MISSING")) & 1) != 0)
    {
      v9 = 1008;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_CN_POSTAL_ADDRESS_MISSING")) & 1) != 0)
    {
      v9 = 1009;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_CN_POSTAL_ADDRESS_FAILED")) & 1) != 0)
    {
      v9 = 1010;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AOF_FROMCONTACT_FAILED")) & 1) != 0)
    {
      v9 = 1100;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AOF_FROMLEGACY_FAILED")) & 1) != 0)
    {
      v9 = 1101;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AOF_FROMBYTES_FAILED")) & 1) != 0)
    {
      v9 = 1102;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETNAME_FAILED")) & 1) != 0)
    {
      v9 = 1200;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETADDRESS_FAILED")) & 1) != 0)
    {
      v9 = 1201;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETSPOKENNAME_FAILED")) & 1) != 0)
    {
      v9 = 1202;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETSPOKENADDRESS_FAILED")) & 1) != 0)
    {
      v9 = 1203;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED")) & 1) != 0)
    {
      v9 = 1204;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETPHONETICNAME_FAILED")) & 1) != 0)
    {
      v9 = 1205;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETPHONETICADDRES_FAILED")) & 1) != 0)
    {
      v9 = 1206;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETFULLADDRES_FAILED")) & 1) != 0)
    {
      v9 = 1207;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETSHORTADDRES_FAILED")) & 1) != 0)
    {
      v9 = 1208;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETDISPLAYLOCALITY_FAILED")) & 1) != 0)
    {
      v9 = 1209;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETWEATHERNAME_FAILED")) & 1) != 0)
    {
      v9 = 1210;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETPARKINGNAME_FAILED")) & 1) != 0)
    {
      v9 = 1211;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_HASH_FAILED")) & 1) != 0)
    {
      v9 = 1212;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_TOBYTES_FAILED")) & 1) != 0)
    {
      v9 = 1213;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_GS_CONTACT_KEYSET_INIT_FAILED")) & 1) != 0)
    {
      v9 = 1214;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETVENUELABEL_FAILED")) & 1) != 0)
    {
      v9 = 1215;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETVENUELEVEL_FAILED")) & 1) != 0)
    {
      v9 = 1216;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETVENUESHORTADDRESS_FAILED")) & 1) != 0)
    {
      v9 = 1217;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MM_AO_GETLOCATIONADDRESS_FAILED")) & 1) != 0)
    {
      v9 = 1218;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MapsAC_ContactMatchDuration")) & 1) != 0)
    {
      v9 = 2001;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MapsAC_ContactRankDuration")) & 1) != 0)
    {
      v9 = 2002;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MapsAC_ContactRankCount")) & 1) != 0)
    {
      v9 = 2003;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT")) & 1) != 0)
    {
      v9 = 2200;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT")) & 1) != 0)
    {
      v9 = 2201;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT")) & 1) != 0)
    {
      v9 = 2202;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT")) & 1) != 0)
    {
      v9 = 2203;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_ClientCount")) & 1) != 0)
    {
      v9 = 3001;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_HistoryAdd")) & 1) != 0)
    {
      v9 = 3002;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_HistoryRemove")) & 1) != 0)
    {
      v9 = 3003;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_HistoryCount")) & 1) != 0)
    {
      v9 = 3004;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_FavoriteAdd")) & 1) != 0)
    {
      v9 = 3005;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_FavoriteEdit")) & 1) != 0)
    {
      v9 = 3006;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_FavoriteRemove")) & 1) != 0)
    {
      v9 = 3007;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_FavoriteCount")) & 1) != 0)
    {
      v9 = 3008;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_Merged")) & 1) != 0)
    {
      v9 = 3009;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_MergeDuration")) & 1) != 0)
    {
      v9 = 3010;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_NotificationDelay")) & 1) != 0)
    {
      v9 = 3011;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSPSync_CKOperationFinished")) & 1) != 0)
    {
      v9 = 3012;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateChange")) & 1) != 0)
    {
      v9 = 4001;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonChange")) & 1) != 0)
    {
      v9 = 4002;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateNotAvailableDuration")) & 1) != 0)
    {
      v9 = 4011;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateLimitedDuration")) & 1) != 0)
    {
      v9 = 4012;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateNormalDuration")) & 1) != 0)
    {
      v9 = 4013;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonNoneDuration")) & 1) != 0)
    {
      v9 = 4021;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonInitializingDuration")) & 1) != 0)
    {
      v9 = 4022;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonExcessiveMotionDuration")) & 1) != 0)
    {
      v9 = 4023;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonInsufficientFeaturesDuration")) & 1) != 0)
    {
      v9 = 4024;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Flyover_TrackingStateReasonSessionInterruptedDuration")) & 1) != 0)
    {
      v9 = 4025;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_VECTOR_REQUEST_EXCEPTIONS")) & 1) != 0)
    {
      v9 = 50001;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_VECTOR_REQUEST_TIME_TO_PERFORM")) & 1) != 0)
    {
      v9 = 50002;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ETA_REQUEST_UNPARSEABLE_COUNT")) & 1) != 0)
    {
      v9 = 51001;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT")) & 1) != 0)
    {
      v9 = 51002;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_INVALID_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 51003;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 51004;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 51005;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 51006;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 51007;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ETA_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 51008;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ETA_TOTAL_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51009;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51010;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ETA_SNAPPING_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51011;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ETA_COMPUTATION_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51012;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51013;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51014;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51015;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51016;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51017;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51018;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 51019;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ETA_INVALID_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 51020;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_SNAPSHOT_PROCESSING_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 52020;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_ROAD_SPEED_UPDATE_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 52021;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_CELL_MARKING_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 52022;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ROUTING_TRAFFIC_CELL_COMPUTATION_RUNTIME_MS")) & 1) != 0)
    {
      v9 = 52023;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_SEARCH_CANCELLATION_COUNT")) & 1) != 0)
    {
      v9 = 60000;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_AC_RANKING_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60001;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_GEOCODING_RANKING_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60002;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_SEARCH_RANKING_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60003;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 60100;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT")) & 1) != 0)
    {
      v9 = 60101;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60102;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60103;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60104;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60105;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60106;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60107;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60108;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 60200;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT")) & 1) != 0)
    {
      v9 = 60201;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60202;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60203;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60204;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60205;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 60300;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT")) & 1) != 0)
    {
      v9 = 60301;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60302;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60303;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60304;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60305;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 60400;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT")) & 1) != 0)
    {
      v9 = 60401;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60402;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60403;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 60500;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_REQUEST_COUNT")) & 1) != 0)
    {
      v9 = 60501;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60502;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60503;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60504;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_TRIGGER_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60505;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_EX_CATEGORY_SEARCH_FEATURIZING_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60506;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60600;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60601;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60610;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60611;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60612;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60613;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60614;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60615;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60616;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60620;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60621;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60622;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60623;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60624;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60625;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60626;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60630;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60631;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60632;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60633;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60634;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60635;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60636;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60640;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60641;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60642;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60643;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60644;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60645;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60646;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60650;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60651;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60652;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60653;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60654;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60655;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60660;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60661;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60662;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60663;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60664;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60665;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60666;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60670;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60671;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60672;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60673;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60674;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60675;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60680;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60681;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS")) & 1) != 0)
    {
      v9 = 60682;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60683;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT")) & 1) != 0)
    {
      v9 = 60684;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT")) & 1) != 0)
    {
      v9 = 60685;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT")) & 1) != 0)
    {
      v9 = 60686;
    }
    else
    {
      v9 = 70001;
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_SERVER_ERROR_COUNT")) & 1) == 0)
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_INVALID_REQUEST_COUNT")) & 1) != 0)
        {
          v9 = 70002;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_CANCELLED_REQUEST_COUNT")) & 1) != 0)
        {
          v9 = 70003;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_REQUEST_COMPLETE_TIME_MS")) & 1) != 0)
        {
          v9 = 70004;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS")) & 1) != 0)
        {
          v9 = 70005;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_POI_COMPONENTS_TIME_MS")) & 1) != 0)
        {
          v9 = 70006;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS")) & 1) != 0)
        {
          v9 = 70007;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS")) & 1) != 0)
        {
          v9 = 70008;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_POI_DATA_ACCESS_TIME_MS")) & 1) != 0)
        {
          v9 = 70009;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MSL_PLACES_POI_LOCALIZATION_TIME_MS")))
        {
          v9 = 70010;
        }
        else
        {
          v9 = 0;
        }
      }
    }

    goto LABEL_392;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_392:
    objc_msgSend(a1, "setEventKey:", v9);
  }

  if (a3)
    v10 = CFSTR("eventValue");
  else
    v10 = CFSTR("event_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEventValue:", objc_msgSend(v11, "unsignedLongLongValue"));

  if (a3)
    v12 = CFSTR("eventDetail");
  else
    v12 = CFSTR("event_detail");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(a1, "setEventDetail:", v14);

  }
LABEL_404:

  return a1;
}

- (GEOTelemetricEntity)initWithJSON:(id)a3
{
  return (GEOTelemetricEntity *)-[GEOTelemetricEntity _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTelemetricEntityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTelemetricEntityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_eventDetail)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOTelemetricEntity readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_eventKey;
    *((_BYTE *)v6 + 28) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v6 + 2) = self->_eventValue;
    *((_BYTE *)v6 + 28) |= 1u;
  }
  if (self->_eventDetail)
  {
    objc_msgSend(v6, "setEventDetail:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventKey;
    *(_BYTE *)(v5 + 28) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_eventValue;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_eventDetail, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *eventDetail;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOTelemetricEntity readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_eventKey != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_eventValue != *((_QWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_14;
  }
  eventDetail = self->_eventDetail;
  if ((unint64_t)eventDetail | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](eventDetail, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  -[GEOTelemetricEntity readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_eventKey;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[NSString hash](self->_eventDetail, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761u * self->_eventValue;
  return v4 ^ v3 ^ -[NSString hash](self->_eventDetail, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 28);
  if ((v5 & 2) != 0)
  {
    self->_eventKey = *((_DWORD *)v6 + 6);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v6 + 28);
  }
  if ((v5 & 1) != 0)
  {
    self->_eventValue = *((_QWORD *)v6 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v6 + 1))
  {
    -[GEOTelemetricEntity setEventDetail:](self, "setEventDetail:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDetail, 0);
}

@end
