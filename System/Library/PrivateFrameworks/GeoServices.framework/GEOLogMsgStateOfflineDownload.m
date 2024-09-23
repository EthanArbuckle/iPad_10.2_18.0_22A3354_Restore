@implementation GEOLogMsgStateOfflineDownload

- (BOOL)hasDownloadCountry
{
  return self->_downloadCountry != 0;
}

- (NSString)downloadCountry
{
  return self->_downloadCountry;
}

- (void)setDownloadCountry:(id)a3
{
  objc_storeStrong((id *)&self->_downloadCountry, a3);
}

- (BOOL)isDownloadInHomeMetro
{
  return self->_isDownloadInHomeMetro;
}

- (void)setIsDownloadInHomeMetro:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_isDownloadInHomeMetro = a3;
}

- (void)setHasIsDownloadInHomeMetro:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsDownloadInHomeMetro
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)regionTilesWereResized
{
  return self->_regionTilesWereResized;
}

- (void)setRegionTilesWereResized:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x80u;
  self->_regionTilesWereResized = a3;
}

- (void)setHasRegionTilesWereResized:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
}

- (BOOL)hasRegionTilesWereResized
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)entryTarget
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_entryTarget;
  else
    return 0;
}

- (void)setEntryTarget:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_entryTarget = a3;
}

- (void)setHasEntryTarget:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEntryTarget
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)entryTargetAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 1000)
  {
    if (a3 > 1600)
    {
      switch(a3)
      {
        case 1801:
          result = CFSTR("MAPS_WEB_PLACE");
          break;
        case 1802:
          result = CFSTR("MAPS_WEB_SEARCH");
          break;
        case 1803:
          result = CFSTR("MAPS_WEB_SEARCH_RESULTS");
          break;
        case 1804:
          result = CFSTR("MAPS_WEB_PUBLISHER");
          break;
        case 1805:
          result = CFSTR("MAPS_WEB_GUIDE");
          break;
        case 1806:
          result = CFSTR("MAPS_WEB_GUIDES_HOME");
          break;
        case 1807:
          result = CFSTR("MAPS_WEB_RELATED_PLACES_LIST");
          break;
        case 1808:
          result = CFSTR("MAPS_WEB_COLLECTION_LIST");
          break;
        case 1809:
          result = CFSTR("MAPS_WEB_DIRECTIONS");
          break;
        case 1810:
          result = CFSTR("MAPS_WEB_SIDEBAR");
          break;
        default:
          switch(a3)
          {
            case 1700:
              result = CFSTR("LOOK_AROUND_PIP");
              break;
            case 1701:
              result = CFSTR("LOOK_AROUND_ACTION_SHEET");
              break;
            case 1702:
              result = CFSTR("LOOK_AROUND_VIEW");
              break;
            case 1703:
              result = CFSTR("LOOK_AROUND_PLATTER");
              break;
            case 1704:
              result = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM");
              break;
            case 1705:
              result = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION");
              break;
            case 1706:
              result = CFSTR("LOOK_AROUND_VIEW_PLACECARD");
              break;
            case 1707:
              result = CFSTR("LOOK_AROUND_PIP_PLACECARD");
              break;
            case 1708:
              result = CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY");
              break;
            default:
              if (a3 == 1601)
              {
                result = CFSTR("MENU_ITEM_DARK_MAP");
              }
              else
              {
LABEL_39:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
                v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
                result = v3;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 1001:
          result = CFSTR("CARPLAY_NAV");
          break;
        case 1002:
          result = CFSTR("CARPLAY_EXPLORE");
          break;
        case 1003:
          result = CFSTR("CARPLAY_DESTINATIONS");
          break;
        case 1004:
          result = CFSTR("CARPLAY_TRAFFIC_INCIDENT");
          break;
        case 1005:
          result = CFSTR("CARPLAY_CONTROL");
          break;
        case 1006:
          result = CFSTR("CARPLAY_PROACTIVE");
          break;
        case 1007:
          result = CFSTR("CARPLAY_ROUTING");
          break;
        case 1008:
          result = CFSTR("CARPLAY_MORE_ROUTES");
          break;
        case 1009:
          result = CFSTR("CARPLAY_SEARCH_ALONG_ROUTE");
          break;
        case 1010:
          result = CFSTR("CARPLAY_SEARCH");
          break;
        case 1011:
          result = CFSTR("CARPLAY_SEARCH_RESULTS");
          break;
        case 1012:
          result = CFSTR("CARPLAY_FAVORITES");
          break;
        case 1013:
          result = CFSTR("CARPLAY_NAV_CONFIRMATION");
          break;
        case 1014:
          result = CFSTR("CARPLAY_DESTINATION_SHARING");
          break;
        case 1015:
          result = CFSTR("CARPLAY_NOTIFICATION_BATTERY");
          break;
        case 1016:
          result = CFSTR("CARPLAY_NOTIFICATION_DOOM");
          break;
        case 1017:
          result = CFSTR("CARPLAY_NOTIFICATION_FUEL");
          break;
        case 1018:
          result = CFSTR("CARPLAY_NOTIFICATION_HYBRID");
          break;
        case 1019:
          result = CFSTR("CARPLAY_SHARE_ETA_TRAY");
          break;
        case 1020:
          result = CFSTR("CARPLAY_ETA_UPDATE_TRAY");
          break;
        case 1021:
          result = CFSTR("CARPLAY_ACTION_TRAY");
          break;
        case 1022:
          result = CFSTR("CARPLAY_PLACECARD");
          break;
        case 1023:
          result = CFSTR("CARPLAY_KEYBOARD");
          break;
        case 1024:
          result = CFSTR("CARPLAY_UI_TARGET_UNKNOWN");
          break;
        case 1025:
          result = CFSTR("CARPLAY_EDIT_STOPS");
          break;
        case 1026:
        case 1027:
        case 1028:
        case 1029:
        case 1030:
        case 1031:
        case 1032:
        case 1033:
        case 1034:
        case 1035:
        case 1036:
        case 1037:
        case 1038:
        case 1039:
        case 1040:
        case 1041:
        case 1042:
        case 1043:
        case 1044:
        case 1045:
        case 1046:
        case 1047:
        case 1048:
        case 1049:
        case 1050:
        case 1051:
        case 1052:
        case 1053:
        case 1054:
        case 1055:
        case 1056:
        case 1057:
        case 1058:
        case 1059:
        case 1060:
        case 1061:
        case 1062:
        case 1063:
        case 1064:
        case 1065:
        case 1066:
        case 1067:
        case 1068:
        case 1069:
        case 1070:
        case 1071:
        case 1072:
        case 1073:
        case 1074:
        case 1075:
        case 1076:
        case 1077:
        case 1078:
        case 1079:
        case 1080:
        case 1081:
        case 1082:
        case 1083:
        case 1084:
        case 1085:
        case 1086:
        case 1087:
        case 1088:
        case 1089:
        case 1090:
        case 1091:
        case 1092:
        case 1093:
        case 1094:
        case 1095:
        case 1096:
        case 1097:
        case 1098:
        case 1099:
        case 1162:
        case 1163:
        case 1164:
        case 1165:
        case 1166:
        case 1167:
        case 1168:
        case 1169:
        case 1170:
        case 1171:
        case 1172:
        case 1173:
        case 1174:
        case 1175:
        case 1176:
        case 1177:
        case 1178:
        case 1179:
        case 1180:
        case 1181:
        case 1182:
        case 1183:
        case 1184:
        case 1185:
        case 1186:
        case 1187:
        case 1188:
        case 1189:
        case 1190:
        case 1191:
        case 1192:
        case 1193:
        case 1194:
        case 1195:
        case 1196:
        case 1197:
        case 1198:
        case 1199:
        case 1200:
        case 1241:
        case 1242:
        case 1243:
        case 1244:
        case 1245:
        case 1246:
        case 1247:
        case 1248:
        case 1249:
        case 1250:
        case 1251:
        case 1252:
        case 1253:
        case 1254:
        case 1255:
        case 1256:
        case 1257:
        case 1258:
        case 1259:
        case 1260:
        case 1261:
        case 1262:
        case 1263:
        case 1264:
        case 1265:
        case 1266:
        case 1267:
        case 1268:
        case 1269:
        case 1270:
        case 1271:
        case 1272:
        case 1273:
        case 1274:
        case 1275:
        case 1276:
        case 1277:
        case 1278:
        case 1279:
        case 1280:
        case 1281:
        case 1282:
        case 1283:
        case 1284:
        case 1285:
        case 1286:
        case 1287:
        case 1288:
        case 1289:
        case 1290:
        case 1291:
        case 1292:
        case 1293:
        case 1294:
        case 1295:
        case 1296:
        case 1297:
        case 1298:
        case 1299:
        case 1300:
          goto LABEL_39;
        case 1100:
          result = CFSTR("RAP_DIRECTIONS_MENU");
          break;
        case 1101:
          result = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST");
          break;
        case 1102:
          result = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM");
          break;
        case 1103:
          result = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM");
          break;
        case 1104:
          result = CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM");
          break;
        case 1105:
          result = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM");
          break;
        case 1106:
          result = CFSTR("RAP_TRANSIT_MENU");
          break;
        case 1107:
          result = CFSTR("RAP_STATION_MAP");
          break;
        case 1108:
          result = CFSTR("RAP_STATION_MENU");
          break;
        case 1109:
          result = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP");
          break;
        case 1110:
          result = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM");
          break;
        case 1111:
          result = CFSTR("RAP_STATION_CLOSED_FORM");
          break;
        case 1112:
          result = CFSTR("RAP_LINE_MAP");
          break;
        case 1113:
          result = CFSTR("RAP_LINE_MENU");
          break;
        case 1114:
          result = CFSTR("RAP_LINE_NAME_FORM");
          break;
        case 1115:
          result = CFSTR("RAP_LINE_SHAPE_FORM");
          break;
        case 1116:
          result = CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM");
          break;
        case 1117:
          result = CFSTR("RAP_ADD_PLACE_MENU");
          break;
        case 1118:
          result = CFSTR("RAP_ADD_POI_MAP");
          break;
        case 1119:
          result = CFSTR("RAP_CATEGORY_LIST");
          break;
        case 1120:
          result = CFSTR("RAP_POI_DETAILS_FORM");
          break;
        case 1121:
          result = CFSTR("RAP_ADD_STREET_MAP");
          break;
        case 1122:
          result = CFSTR("RAP_STREET_DETAILS_FORM");
          break;
        case 1123:
          result = CFSTR("RAP_ADD_OTHER_MAP");
          break;
        case 1124:
          result = CFSTR("RAP_OTHER_DETAILS_FORM");
          break;
        case 1125:
          result = CFSTR("RAP_CAMERA");
          break;
        case 1126:
          result = CFSTR("RAP_LABEL_MAP");
          break;
        case 1127:
          result = CFSTR("RAP_LABEL_DETAILS_FORM");
          break;
        case 1128:
          result = CFSTR("RAP_SEARCH_MENU");
          break;
        case 1129:
          result = CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM");
          break;
        case 1130:
          result = CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM");
          break;
        case 1131:
          result = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP");
          break;
        case 1132:
          result = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM");
          break;
        case 1133:
          result = CFSTR("RAP_SATELLITE_IMAGE_MAP");
          break;
        case 1134:
          result = CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM");
          break;
        case 1135:
          result = CFSTR("RAP_OTHER_FORM");
          break;
        case 1136:
          result = CFSTR("RAP_PRIVACY");
          break;
        case 1137:
          result = CFSTR("RAP_CONFIRMATION");
          break;
        case 1138:
          result = CFSTR("RAP_POI_MENU");
          break;
        case 1139:
          result = CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU");
          break;
        case 1140:
          result = CFSTR("RAP_ADD_A_PLACE_MAP");
          break;
        case 1141:
          result = CFSTR("RAP_POI_LOCATION_MAP");
          break;
        case 1142:
          result = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP");
          break;
        case 1143:
          result = CFSTR("RAP_POI_CLOSED_FORM");
          break;
        case 1144:
          result = CFSTR("RAP_CLAIM_BUSINESS_DIALOG");
          break;
        case 1145:
          result = CFSTR("RAP_BRAND_MENU");
          break;
        case 1146:
          result = CFSTR("RAP_BRAND_DETAILS_FORM");
          break;
        case 1147:
          result = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM");
          break;
        case 1148:
          result = CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM");
          break;
        case 1149:
          result = CFSTR("RAP_LOOK_AROUND_BLURRING_FORM");
          break;
        case 1150:
          result = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM");
          break;
        case 1151:
          result = CFSTR("RAP_LOOK_AROUND_MENU");
          break;
        case 1152:
          result = CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM");
          break;
        case 1153:
          result = CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU");
          break;
        case 1154:
          result = CFSTR("RAP_LIGHTWEIGHT");
          break;
        case 1155:
          result = CFSTR("RAP_EDIT_PLACE_DETAILS");
          break;
        case 1156:
          result = CFSTR("RAP_ADD_CATEGORY");
          break;
        case 1157:
          result = CFSTR("RAP_ADD_HOURS");
          break;
        case 1158:
          result = CFSTR("RAP_EDIT_LOCATION");
          break;
        case 1159:
          result = CFSTR("RAP_EDIT_ENTRY_POINT");
          break;
        case 1160:
          result = CFSTR("RAP_LOOK_AROUND");
          break;
        case 1161:
          result = CFSTR("RAP_ADD_ENTRY_POINT");
          break;
        case 1201:
          result = CFSTR("WATCH_MAIN_MENU");
          break;
        case 1202:
          result = CFSTR("WATCH_MAIN_PRESS_MENU");
          break;
        case 1203:
          result = CFSTR("WATCH_SEARCH");
          break;
        case 1204:
          result = CFSTR("WATCH_DICTATION");
          break;
        case 1205:
          result = CFSTR("WATCH_FAVORITES");
          break;
        case 1206:
          result = CFSTR("WATCH_SUB_CATEGORY_LIST");
          break;
        case 1207:
          result = CFSTR("WATCH_SEARCH_RESULTS_LIST");
          break;
        case 1208:
          result = CFSTR("WATCH_MAP_VIEW");
          break;
        case 1209:
          result = CFSTR("WATCH_PLACECARD");
          break;
        case 1210:
          result = CFSTR("WATCH_ROUTE_PLANNING");
          break;
        case 1211:
          result = CFSTR("WATCH_ROUTE_DETAILS");
          break;
        case 1212:
          result = CFSTR("WATCH_NAV_TBT");
          break;
        case 1213:
          result = CFSTR("WATCH_NAV_MAP");
          break;
        case 1214:
          result = CFSTR("WATCH_NAV_PRESS_MENU");
          break;
        case 1215:
          result = CFSTR("WATCH_MAP_PRESS_MENU");
          break;
        case 1216:
          result = CFSTR("WATCH_ROUTING_PRESS_MENU");
          break;
        case 1217:
          result = CFSTR("WATCH_TRANSIT_MAP_VIEW");
          break;
        case 1218:
          result = CFSTR("WATCH_SCRIBBLE");
          break;
        case 1219:
          result = CFSTR("WATCH_COLLECTION_VIEW");
          break;
        case 1220:
          result = CFSTR("WATCH_ROUTE_PLANNING_WALKING");
          break;
        case 1221:
          result = CFSTR("WATCH_ROUTE_PLANNING_DRIVING");
          break;
        case 1222:
          result = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT");
          break;
        case 1223:
          result = CFSTR("WATCH_PAIRED_DEVICE");
          break;
        case 1224:
          result = CFSTR("WATCH_NAV_DRIVING_SPLIT");
          break;
        case 1225:
          result = CFSTR("WATCH_NAV_DRIVING_PLATTER");
          break;
        case 1226:
          result = CFSTR("WATCH_NAV_DRIVING_MAP");
          break;
        case 1227:
          result = CFSTR("WATCH_NAV_WALKING_SPLIT");
          break;
        case 1228:
          result = CFSTR("WATCH_NAV_WALKING_PLATTER");
          break;
        case 1229:
          result = CFSTR("WATCH_NAV_WALKING_MAP");
          break;
        case 1230:
          result = CFSTR("WATCH_NAV_TRANSIT_SPLIT");
          break;
        case 1231:
          result = CFSTR("WATCH_NAV_TRANSIT_PLATTER");
          break;
        case 1232:
          result = CFSTR("WATCH_NAV_TRANSIT_MAP");
          break;
        case 1233:
          result = CFSTR("WATCH_ROUTE_INFO");
          break;
        case 1234:
          result = CFSTR("WATCH_NAV_CYCLING_MAP");
          break;
        case 1235:
          result = CFSTR("WATCH_NAV_CYCLING_PLATTER");
          break;
        case 1236:
          result = CFSTR("WATCH_NAV_CYCLING_SPLIT");
          break;
        case 1237:
          result = CFSTR("WATCH_ROUTE_PLANNING_CYCLING");
          break;
        case 1238:
          result = CFSTR("WATCH_SEARCH_INPUT");
          break;
        case 1239:
          result = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
          break;
        case 1240:
          result = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE");
          break;
        case 1301:
          result = CFSTR("PERSONALIZED_ADDRESS_LIST");
          break;
        case 1302:
          result = CFSTR("PERSONALIZED_ADDRESS_FORM");
          break;
        case 1303:
          result = CFSTR("PERSONALIZED_LABEL_FORM");
          break;
        case 1304:
          result = CFSTR("PERSONALIZED_EDIT_MAP");
          break;
        case 1305:
          result = CFSTR("PERSONALIZED_CONFIRMATION");
          break;
        case 1306:
          result = CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG");
          break;
        case 1307:
          result = CFSTR("PERSONALIZED_ADDRESS_INFO");
          break;
        case 1308:
          result = CFSTR("PERSONALIZED_ADDRESS_SEARCH");
          break;
        case 1309:
          result = CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS");
          break;
        case 1310:
          result = CFSTR("FAVORITE_SEARCH");
          break;
        case 1311:
          result = CFSTR("FAVORITE_LIST");
          break;
        case 1312:
          result = CFSTR("FAVORITE_INFO");
          break;
        case 1313:
          result = CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY");
          break;
        default:
          switch(a3)
          {
            case 1401:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS");
              break;
            case 1402:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING");
              break;
            case 1403:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING");
              break;
            case 1404:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED");
              break;
            case 1405:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG");
              break;
            case 1406:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK");
              break;
            case 1407:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL");
              break;
            default:
              switch(a3)
              {
                case 1501:
                  result = CFSTR("PLACECARD_HEADER");
                  break;
                case 1502:
                  result = CFSTR("PLACECARD_ADDRESS");
                  break;
                case 1503:
                  result = CFSTR("PLACECARD_PHONE");
                  break;
                case 1504:
                  result = CFSTR("PLACECARD_URL");
                  break;
                default:
                  goto LABEL_39;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v3 = CFSTR("UI_TARGET_UNKNOWN");
    switch(a3)
    {
      case 0:
        goto LABEL_4;
      case 1:
        v3 = CFSTR("UI_TARGET_POI");
        goto LABEL_4;
      case 2:
        result = CFSTR("UI_TARGET_SEARCH_RESULT_LIST");
        break;
      case 3:
        result = CFSTR("UI_TARGET_POPULAR_NEARBY_LIST");
        break;
      case 4:
        result = CFSTR("UI_TARGET_CALLOUT");
        break;
      case 5:
        result = CFSTR("UI_TARGET_SEARCH_PIN");
        break;
      case 6:
        result = CFSTR("UI_TARGET_DROPPED_PIN");
        break;
      case 7:
        result = CFSTR("UI_TARGET_TRANSIT_LINE");
        break;
      case 8:
        result = CFSTR("SEARCH_TRAY");
        break;
      case 9:
        result = CFSTR("SEARCH_TRAY_BROWSE");
        break;
      case 10:
        result = CFSTR("SEARCH_TRAY_POPULAR_NEARBY");
        break;
      case 11:
        result = CFSTR("SEARCH_TRAY_AC");
        break;
      case 12:
        result = CFSTR("SEARCH_TRAY_AC_INTERMEDIATE");
        break;
      case 13:
        result = CFSTR("SEARCH_TRAY_NO_QUERY");
        break;
      case 14:
        result = CFSTR("AR_WALKING_LEGAL_TRAY");
        break;
      case 15:
        result = CFSTR("RAISE_TO_START_AR_TRAY");
        break;
      case 16:
        result = CFSTR("EVENTS_ADVISORY_DETAILS_PAGE");
        break;
      case 17:
        result = CFSTR("INCIDENT_REPORT_TRAY_CARPLAY");
        break;
      case 18:
        result = CFSTR("HIGHLIGHTED_AREA");
        break;
      case 19:
        result = CFSTR("CURATED_COLLECTIONS_HOME");
        break;
      case 20:
        result = CFSTR("TRAVEL_PREFERENCES_TRAY");
        break;
      case 21:
        result = CFSTR("RESULT_TRAY_SEARCH");
        break;
      case 22:
        result = CFSTR("SINGLE_CARD_FILTER");
        break;
      case 23:
        result = CFSTR("FULL_CARD_FILTER");
        break;
      case 24:
        result = CFSTR("ACCOUNT_PRIVACY_TRAY");
        break;
      case 25:
        result = CFSTR("APPLE_RATINGS_HISTORY_TRAY");
        break;
      case 26:
        result = CFSTR("CURATED_COLLECTIONS_HOME_FILTERED");
        break;
      case 27:
        result = CFSTR("CITY_MENU");
        break;
      case 28:
        result = CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED");
        break;
      case 29:
        result = CFSTR("ACCOUNT_TRAY");
        break;
      case 30:
        result = CFSTR("QUICK_ACTION_TRAY");
        break;
      case 31:
        result = CFSTR("SUBMIT_TRIP_FEEDBACK");
        break;
      case 32:
        result = CFSTR("RAP_PLACE_ISSUE_DETAILS");
        break;
      case 33:
        result = CFSTR("RAP_GUIDES_DETAILS");
        break;
      case 34:
        result = CFSTR("RAP_BAD_DIRECTIONS_DETAILS");
        break;
      case 35:
        result = CFSTR("RAP_ADD_MAP_DETAILS");
        break;
      case 36:
        result = CFSTR("WATCH_COMPLICATION");
        break;
      case 37:
        result = CFSTR("RAP_NAV_MENU");
        break;
      case 38:
        result = CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT");
        break;
      case 39:
        result = CFSTR("RAP_REPORT_MENU");
        break;
      case 40:
        result = CFSTR("RAP_CURATED_COLLECTION_MENU");
        break;
      case 41:
        result = CFSTR("RAP_REPORT_CARD_DETAILS");
        break;
      case 42:
        result = CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT");
        break;
      case 43:
        result = CFSTR("RAP_STREET_ISSUE_DETAILS");
        break;
      case 44:
        result = CFSTR("NEARBY_TRANSIT_CARD");
        break;
      case 45:
        result = CFSTR("WATCH_NAV_MENU");
        break;
      case 46:
        result = CFSTR("GENERIC_ADVISORY_PAGE");
        break;
      case 47:
        result = CFSTR("USER_PROFILE_TRAY");
        break;
      case 48:
        result = CFSTR("MEDIA_APP_MENU");
        break;
      case 49:
        result = CFSTR("TEMPLATE_PLACE_TRAY");
        break;
      case 50:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP");
        break;
      case 51:
        result = CFSTR("ALLOW_NOTIFICATION_DIALOG");
        break;
      case 52:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING");
        break;
      case 53:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP");
        break;
      case 54:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED");
        break;
      case 55:
        result = CFSTR("NOTIFICATION_CONSENT_PROMPT");
        break;
      case 56:
        result = CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU");
        break;
      case 57:
        result = CFSTR("PLACECARD_TRAY_VENDORS_MENU");
        break;
      case 58:
        result = CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING");
        break;
      case 59:
        result = CFSTR("SEARCH_ALONG_ROUTE_TRAY");
        break;
      case 60:
        result = CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING");
        break;
      case 61:
        result = CFSTR("PLACECARD_SHOWCASE_MENU");
        break;
      case 62:
        result = CFSTR("RAP_INLINE_ADD_DETAILS");
        break;
      case 63:
        result = CFSTR("RAP_EDIT_MENU_DETAILS");
        break;
      case 64:
        result = CFSTR("RAP_SUBMISSION_PROMPT");
        break;
      case 65:
        result = CFSTR("RAP_PLACECARD_EDIT_MENU");
        break;
      case 66:
        result = CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE");
        break;
      case 67:
        result = CFSTR("INCIDENT_REPORT_MENU");
        break;
      case 68:
        result = CFSTR("RAP_SELECT_BAD_ROUTES_STEPS");
        break;
      case 69:
        result = CFSTR("RAP_SELECT_BAD_ROUTES");
        break;
      case 70:
        result = CFSTR("SIRI_SUGGESTION_RESUME_ROUTE");
        break;
      case 71:
        result = CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
        break;
      case 72:
        result = CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST");
        break;
      case 73:
        result = CFSTR("SPOTLIGHT_BUSINESS_ENTITY");
        break;
      case 74:
        result = CFSTR("NOTIFICATION_ARP");
        break;
      case 75:
        result = CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT");
        break;
      case 76:
        result = CFSTR("YOUR_PHOTOS_ALBUM");
        break;
      case 77:
        result = CFSTR("ARP_PHOTO_CREDIT");
        break;
      case 78:
        result = CFSTR("RAP_OUTREACH_REVIEWED_REPORT");
        break;
      case 79:
        result = CFSTR("RAP_REPORT_MENU_MORE");
        break;
      case 80:
        result = CFSTR("WATCH_MAPS_SETTINGS");
        break;
      case 81:
        result = CFSTR("OFFLINE_FEATURE_PROMPT");
        break;
      case 82:
        result = CFSTR("EXPIRED_MAPS_DETAILS");
        break;
      case 83:
        result = CFSTR("MAPS_VIEW");
        break;
      case 84:
        result = CFSTR("NOTIFICATION_OFFLINE");
        break;
      case 85:
        result = CFSTR("EXPIRED_MAPS_MANAGEMENT");
        break;
      case 86:
        result = CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT");
        break;
      case 87:
        result = CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT");
        break;
      case 88:
        result = CFSTR("OFFLINE_MAPS_MANAGEMENT");
        break;
      case 89:
        result = CFSTR("REGION_SELECTOR");
        break;
      case 90:
        result = CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT");
        break;
      case 91:
        result = CFSTR("FIND_MY_ETA_SHARING_TRAY");
        break;
      case 92:
        result = CFSTR("WATCH_PLACE");
        break;
      case 93:
        result = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL");
        break;
      case 94:
        result = CFSTR("WATCH_ROUTE_PLANNING_MAP");
        break;
      case 95:
        result = CFSTR("WATCH_NAV_WALKING_CONTROLS");
        break;
      case 96:
        result = CFSTR("WATCH_NAV_CYCLING_CONTROLS");
        break;
      case 97:
        result = CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL");
        break;
      case 98:
        result = CFSTR("WATCH_NAV_TRANSIT_CONTROLS");
        break;
      case 99:
        result = CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL");
        break;
      case 100:
        result = CFSTR("WATCH_NAV_DRIVING_CONTROLS");
        break;
      case 101:
        result = CFSTR("RESULTS_TRAY_SEARCH");
        break;
      case 102:
        result = CFSTR("RESULTS_TRAY_BROWSE");
        break;
      case 103:
        result = CFSTR("RESULTS_TRAY_FAVORITES");
        break;
      case 104:
        result = CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE");
        break;
      case 105:
        result = CFSTR("RESULTS_TRAY_CLUSTER");
        break;
      case 106:
        result = CFSTR("RESULTS_TRAY_VENUE_BROWSE");
        break;
      case 107:
        result = CFSTR("WATCH_MAP_RESULTS");
        break;
      case 108:
        result = CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW");
        break;
      case 109:
        result = CFSTR("WATCH_PLACES");
        break;
      case 110:
        result = CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW");
        break;
      case 111:
        result = CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL");
        break;
      case 112:
        result = CFSTR("DOWNLOADED_MAPS_DETAILS");
        break;
      case 113:
        result = CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL");
        break;
      case 114:
        result = CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP");
        break;
      case 115:
        result = CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP");
        break;
      case 116:
        result = CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP");
        break;
      case 117:
        result = CFSTR("WATCH_ROUTE_OPTIONS");
        break;
      case 118:
        result = CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP");
        break;
      case 119:
        result = CFSTR("WATCH_MORE_GUIDES");
        break;
      case 120:
        result = CFSTR("WATCH_RECENTLY_VIEWED");
        break;
      case 121:
        result = CFSTR("EV_SUCCESS_TRAY");
        break;
      case 122:
        result = CFSTR("PREFERRED_NETWORK_SELECTION_TRAY");
        break;
      case 123:
        result = CFSTR("PREFERRED_NETWORK_TRAY");
        break;
      case 124:
        result = CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 125:
        result = CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY");
        break;
      case 126:
        result = CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY");
        break;
      case 127:
        result = CFSTR("AC_KEYBOARD_TRAY");
        break;
      case 128:
        result = CFSTR("MORE_RELATED_TRAILS");
        break;
      case 129:
        result = CFSTR("MORE_RELATED_TRAILHEADS");
        break;
      case 130:
        result = CFSTR("ROUTING_TRAY_CUSTOM_ROUTE");
        break;
      case 131:
        result = CFSTR("CUSTOM_ROUTE_CREATION_TRAY");
        break;
      case 132:
        result = CFSTR("ROUTING_TRAY_CURATED_HIKE");
        break;
      case 133:
        result = CFSTR("MORE_CURATED_HIKES");
        break;
      case 134:
        result = CFSTR("CUSTOM_ROUTE_ONBOARDING");
        break;
      case 135:
        result = CFSTR("LIBRARY_ROUTES");
        break;
      case 136:
        result = CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 137:
        result = CFSTR("MY_LIBRARY");
        break;
      case 138:
        result = CFSTR("EDIT_NOTE_TRAY");
        break;
      case 139:
        result = CFSTR("CREATE_NOTE_TRAY");
        break;
      case 140:
        result = CFSTR("LIBRARY_PLACES");
        break;
      case 141:
        result = CFSTR("WATCH_ACCOUNT");
        break;
      case 142:
        result = CFSTR("WATCH_DOWNLOADED_MAPS");
        break;
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 276:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
      case 380:
      case 381:
      case 382:
      case 383:
      case 384:
      case 385:
      case 386:
      case 387:
      case 388:
      case 389:
      case 390:
      case 391:
      case 392:
      case 393:
      case 394:
      case 395:
      case 396:
      case 397:
      case 398:
      case 399:
      case 400:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
      case 423:
      case 424:
      case 425:
      case 426:
      case 427:
      case 428:
      case 429:
      case 430:
      case 431:
      case 432:
      case 433:
      case 434:
      case 435:
      case 436:
      case 437:
      case 438:
      case 439:
      case 440:
      case 441:
      case 442:
      case 443:
      case 444:
      case 445:
      case 446:
      case 447:
      case 448:
      case 449:
      case 450:
      case 451:
      case 452:
      case 453:
      case 454:
      case 455:
      case 456:
      case 457:
      case 458:
      case 459:
      case 460:
      case 461:
      case 462:
      case 463:
      case 464:
      case 465:
      case 466:
      case 467:
      case 468:
      case 469:
      case 470:
      case 471:
      case 472:
      case 473:
      case 474:
      case 475:
      case 476:
      case 477:
      case 478:
      case 479:
      case 480:
      case 481:
      case 482:
      case 483:
      case 484:
      case 485:
      case 486:
      case 487:
      case 488:
      case 489:
      case 490:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 700:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
        goto LABEL_39;
      case 201:
        result = CFSTR("PLACECARD_TRAY");
        break;
      case 202:
        result = CFSTR("WEB_MODULE");
        break;
      case 250:
        result = CFSTR("ADD_FAVORITE_TRAY");
        break;
      case 251:
        result = CFSTR("COLLECTION_LIST");
        break;
      case 252:
        result = CFSTR("COLLECTION_VIEW");
        break;
      case 253:
        result = CFSTR("FAVORITE_DETAILS");
        break;
      case 254:
        result = CFSTR("FAVORITES_TRAY");
        break;
      case 255:
        result = CFSTR("SHARED_COLLECTION");
        break;
      case 256:
        result = CFSTR("SHARED_COLLECTION_VIEW");
        break;
      case 257:
        result = CFSTR("RECENTLY_VIEWED");
        break;
      case 258:
        result = CFSTR("SHARED_WEB_COLLECTION");
        break;
      case 259:
        result = CFSTR("CURATED_COLLECTION_VIEW");
        break;
      case 260:
        result = CFSTR("FEATURED_COLLECTIONS");
        break;
      case 261:
        result = CFSTR("PUBLISHER_TRAY");
        break;
      case 262:
        result = CFSTR("SHARED_CURATED_COLLECTION_VIEW");
        break;
      case 263:
        result = CFSTR("CURATED_COLLECTION_NOTIFICATION");
        break;
      case 264:
        result = CFSTR("CURATED_COLLECTION_LIST");
        break;
      case 265:
        result = CFSTR("PUBLISHER_LIST");
        break;
      case 266:
        result = CFSTR("WATCH_CURATED_COLLECTION_VIEW");
        break;
      case 267:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST");
        break;
      case 268:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST");
        break;
      case 301:
        result = CFSTR("ROUTING_TRAY_DRIVING");
        break;
      case 302:
        result = CFSTR("ROUTING_TRAY_WALKING");
        break;
      case 303:
        result = CFSTR("ROUTING_TRAY_TRANSIT");
        break;
      case 304:
        result = CFSTR("ROUTING_TRAY_RIDESHARE");
        break;
      case 305:
        result = CFSTR("ROUTING_TRAY_CYCLING");
        break;
      case 306:
        result = CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW");
        break;
      case 401:
        result = CFSTR("NAV_TRAY_DRIVING");
        break;
      case 402:
        result = CFSTR("NAV_TRAY_WALKING");
        break;
      case 403:
        result = CFSTR("NAV_TRAY_TRANSIT");
        break;
      case 404:
        result = CFSTR("NAV_TRAY_CYCLING");
        break;
      case 501:
        result = CFSTR("MAP_PLACECARD");
        break;
      case 502:
        result = CFSTR("MAP_SEARCH");
        break;
      case 503:
        result = CFSTR("MAP_RESULTS");
        break;
      case 504:
        result = CFSTR("MAP_ROUTING");
        break;
      case 505:
        result = CFSTR("MAP_NAV");
        break;
      case 506:
        result = CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE");
        break;
      case 507:
        result = CFSTR("MAP_TRAFFIC_INCIDENT");
        break;
      case 508:
        result = CFSTR("MAP_FULL_SCREEN");
        break;
      case 509:
        result = CFSTR("MAP_DRIVE");
        break;
      case 510:
        result = CFSTR("MAP_LAUNCH_AND_GO");
        break;
      case 511:
        result = CFSTR("MAP_VIEW");
        break;
      case 601:
        result = CFSTR("MAPS_SETTINGS");
        break;
      case 602:
        result = CFSTR("MAPS_PREFERENCES");
        break;
      case 603:
        result = CFSTR("RAP");
        break;
      case 604:
        result = CFSTR("ROUTING_DRIVING_DETAILS");
        break;
      case 605:
        result = CFSTR("ROUTING_WALKING_DETAILS");
        break;
      case 606:
        result = CFSTR("ROUTING_TRANSIT_DETAILS");
        break;
      case 607:
        result = CFSTR("ROUTING_EDITOR");
        break;
      case 608:
        result = CFSTR("NAV_DRIVING_DETAILS");
        break;
      case 609:
        result = CFSTR("NAV_WALKING_DETAILS");
        break;
      case 610:
        result = CFSTR("NAV_TRANSIT_DETAILS");
        break;
      case 611:
        result = CFSTR("NAV_AUDIO_SETTINGS");
        break;
      case 612:
        result = CFSTR("PHOTO_VIEWER_ALL");
        break;
      case 613:
        result = CFSTR("PHOTO_VIEWER_SINGLE");
        break;
      case 614:
        result = CFSTR("ROUTE_OPTIONS_TRANSIT");
        break;
      case 615:
        result = CFSTR("TRAFFIC_INCIDENT_TRAY");
        break;
      case 616:
        result = CFSTR("NAV_DIRECTIONS_BANNER_DRIVING");
        break;
      case 617:
        result = CFSTR("NAV_DIRECTIONS_BANNER_WALKING");
        break;
      case 618:
        result = CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT");
        break;
      case 619:
        result = CFSTR("REFINE_SEARCH_SUGGESTION_AREA");
        break;
      case 620:
        result = CFSTR("ADD_PHOTO_SHEET");
        break;
      case 621:
        result = CFSTR("ADD_PLACE_SHEET");
        break;
      case 622:
        result = CFSTR("SHARE_SHEET");
        break;
      case 623:
        result = CFSTR("EDIT_LOCATION_SHEET");
        break;
      case 624:
        result = CFSTR("ADD_CONTACT_SHEET");
        break;
      case 625:
        result = CFSTR("EDIT_NAME_SHEET");
        break;
      case 626:
        result = CFSTR("DRIVING_NAV_SETTINGS");
        break;
      case 627:
        result = CFSTR("TRANSIT_SETTINGS");
        break;
      case 628:
        result = CFSTR("TRANSIT_ADVISORY_SHEET");
        break;
      case 629:
        result = CFSTR("REMOVE_CAR_SHEET");
        break;
      case 630:
        result = CFSTR("ROUTE_OPTIONS_DRIVING");
        break;
      case 631:
        result = CFSTR("ROUTE_OPTIONS_DATETIME");
        break;
      case 632:
        result = CFSTR("TRANSIT_ADVISORY_BANNER");
        break;
      case 633:
        result = CFSTR("BOOK_TABLE_SELECT_TIME");
        break;
      case 634:
        result = CFSTR("BOOK_TABLE_MORE_OPTIONS");
        break;
      case 635:
        result = CFSTR("BOOK_TABLE_READY");
        break;
      case 636:
        result = CFSTR("BOOK_TABLE_BOOKED");
        break;
      case 637:
        result = CFSTR("TRANSIT_LINE_CLUSTER_SHEET");
        break;
      case 638:
        result = CFSTR("TRANSIT_LINE_LIST_SHEET");
        break;
      case 639:
        result = CFSTR("TRANSIT_BALANCE_BANNER");
        break;
      case 640:
        result = CFSTR("WEATHER_ICON");
        break;
      case 641:
        result = CFSTR("HELP_IMPROVE_MAPS_DIALOG");
        break;
      case 642:
        result = CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 643:
        result = CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 644:
        result = CFSTR("FLOOR_PICKER");
        break;
      case 645:
        result = CFSTR("VENUE_LIST");
        break;
      case 646:
        result = CFSTR("AR_MODE");
        break;
      case 647:
        result = CFSTR("ROUTING_TRANSIT_TICKETS_SHEET");
        break;
      case 648:
        result = CFSTR("LINKED_SERVICE_HOURS");
        break;
      case 649:
        result = CFSTR("SHARE_ETA_TRAY");
        break;
      case 650:
        result = CFSTR("ETA_UPDATE_TRAY");
        break;
      case 651:
        result = CFSTR("SCHEDULECARD_TRAY");
        break;
      case 652:
        result = CFSTR("AR_NAV");
        break;
      case 653:
        result = CFSTR("TAP_TRANSIT_ACCESS_POINT");
        break;
      case 654:
        result = CFSTR("LOCATIONS_INSIDE");
        break;
      case 655:
        result = CFSTR("SIMILAR_LOCATIONS");
        break;
      case 656:
        result = CFSTR("LOCATIONS_AT_ADDRESS");
        break;
      case 657:
        result = CFSTR("NAV_DIRECTIONS_BANNER_CYCLING");
        break;
      case 658:
        result = CFSTR("ROUTE_OPTIONS_CYCLING");
        break;
      case 659:
        result = CFSTR("EV_CONNECTION_TRAY");
        break;
      case 660:
        result = CFSTR("VIRTUAL_GARAGE");
        break;
      case 661:
        result = CFSTR("VIRTUAL_GARAGE_BANNER");
        break;
      case 662:
        result = CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW");
        break;
      case 663:
        result = CFSTR("ADVISORY_DETAILS_PAGE");
        break;
      case 664:
        result = CFSTR("APP_CLIP_NOTIFICATION");
        break;
      case 665:
        result = CFSTR("PHOTO_VIEWER_GALLERY");
        break;
      case 666:
        result = CFSTR("RECOMMENDATION_CARD");
        break;
      case 667:
        result = CFSTR("INCIDENT_REPORT_TRAY");
        break;
      case 668:
        result = CFSTR("MAPS_WIDGET_DISPLAY");
        break;
      case 669:
        result = CFSTR("VISUAL_LOCATION_FRAMEWORK");
        break;
      case 670:
        result = CFSTR("APP_CLIP_TRAY");
        break;
      case 671:
        result = CFSTR("LICENSE_PLATE_SUGGESTION_PAGE");
        break;
      case 672:
        result = CFSTR("NOTIFICATION_ADD_PLATE");
        break;
      case 673:
        result = CFSTR("MAPS_RESULTS");
        break;
      case 674:
        result = CFSTR("MAPS_WIDGET_APP_CONNECTION");
        break;
      case 675:
        result = CFSTR("MAPS_WIDGET_CURRENT_LOCATION");
        break;
      case 676:
        result = CFSTR("MAPS_WIDGET_CURRENT_NAV");
        break;
      case 677:
        result = CFSTR("MAPS_WIDGET_ETA");
        break;
      case 678:
        result = CFSTR("MAPS_WIDGET_TRANSIT");
        break;
      case 679:
        result = CFSTR("MAPS_WIDGET_UPC_DESTINATION");
        break;
      case 680:
        result = CFSTR("WIDGET_CREATION_TRAY");
        break;
      case 681:
        result = CFSTR("MAPS_WIDGET_HOME");
        break;
      case 682:
        result = CFSTR("MAPS_WIDGET_PARKED_CAR");
        break;
      case 683:
        result = CFSTR("MAPS_WIDGET_POI");
        break;
      case 684:
        result = CFSTR("MAPS_WIDGET_SCHOOL");
        break;
      case 685:
        result = CFSTR("MAPS_WIDGET_WORK");
        break;
      case 686:
        result = CFSTR("AIRPORT_NOTIFICATION");
        break;
      case 687:
        result = CFSTR("MAPS_WIDGET_EMPTY");
        break;
      case 688:
        result = CFSTR("COARSE_LOCATION_OPTIONS_PROMPT");
        break;
      case 689:
        result = CFSTR("ALLOW_PRECISE_LOCATION_PROMPT");
        break;
      case 690:
        result = CFSTR("SHARE_MY_LOCATION");
        break;
      case 691:
        result = CFSTR("MARK_MY_LOCATION");
        break;
      case 692:
        result = CFSTR("AIRPORT_NOTIFICATION_WATCH");
        break;
      case 693:
        result = CFSTR("EDIT_FAVORITE");
        break;
      case 694:
        result = CFSTR("ROUTING_CYCLING_DETAILS");
        break;
      case 695:
        result = CFSTR("NAV_CYCLING_DETAILS");
        break;
      case 696:
        result = CFSTR("MAPS_SUGGESTION_WIDGET");
        break;
      case 697:
        result = CFSTR("ARP_TIPKIT");
        break;
      case 698:
        result = CFSTR("ARP_PRIVACY");
        break;
      case 699:
        result = CFSTR("ROUTE_OPTIONS_WALKING");
        break;
      case 701:
        result = CFSTR("SAFARI_SEARCH");
        break;
      case 702:
        result = CFSTR("SPOTLIGHT_SEARCH");
        break;
      case 703:
        result = CFSTR("SAFARI_MAPS_SEARCH_RESULTS");
        break;
      case 704:
        result = CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS");
        break;
      case 705:
        result = CFSTR("WIDGET_MAPS_DESTINATIONS");
        break;
      case 706:
        result = CFSTR("WIDGET_MAPS_TRANSIT");
        break;
      case 707:
        result = CFSTR("WIDGET_MAPS_NEARBY");
        break;
      case 708:
        result = CFSTR("NOTIFICATION_FIND_MY_CAR");
        break;
      case 709:
        result = CFSTR("CONTROL_CENTER");
        break;
      case 710:
        result = CFSTR("NOTIFICATION_CENTER");
        break;
      case 711:
        result = CFSTR("NOTIFICATION_DOOM");
        break;
      case 712:
        result = CFSTR("NOTIFICATION_VENUES");
        break;
      case 713:
        result = CFSTR("NOTIFICATION_RAP_UPDATE");
        break;
      case 714:
        result = CFSTR("NOTIFICATION_TRIP_CANCELLED");
        break;
      case 715:
        result = CFSTR("NOTIFICATION_STOP_SKIPPED");
        break;
      case 716:
        result = CFSTR("NOTIFICATION_TRIP_DELAYED");
        break;
      case 717:
        result = CFSTR("NOTIFICATION_RAP");
        break;
      case 718:
        result = CFSTR("NOTIFICATION_PROXY_AUTH");
        break;
      case 719:
        result = CFSTR("NOTIFICATION_PUSH_TO_DEVICE");
        break;
      case 720:
        result = CFSTR("NOTIFICATION_LOW_FUEL");
        break;
      case 721:
        result = CFSTR("NOTIFICATION_FIND_MY_CAR_RESET");
        break;
      case 722:
        result = CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS");
        break;
      case 723:
        result = CFSTR("NOTIFICATION_SHARED_ETA");
        break;
      case 724:
        result = CFSTR("NOTIFICATION_SHARED_ETA_UPDATE");
        break;
      case 725:
        result = CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN");
        break;
      case 726:
        result = CFSTR("ANNOUNCEMENT_TYPE_GENERAL");
        break;
      case 727:
        result = CFSTR("ANNOUNCEMENT_TYPE_FLYOVER");
        break;
      case 728:
        result = CFSTR("ANNOUNCEMENT_TYPE_TRANSIT");
        break;
      case 729:
        result = CFSTR("ANNOUNCEMENT_TYPE_VENUES");
        break;
      case 730:
        result = CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL");
        break;
      case 731:
        result = CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE");
        break;
      case 732:
        result = CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND");
        break;
      case 733:
        result = CFSTR("APP_SHEET");
        break;
      case 734:
        result = CFSTR("CZ_ADVISORY_DETAILS_PAGE");
        break;
      case 735:
        result = CFSTR("SHARE_ETA_CONTACT_TRAY");
        break;
      case 736:
        result = CFSTR("SIRI_SHARE_ETA");
        break;
      case 737:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA");
        break;
      case 738:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY");
        break;
      case 739:
        result = CFSTR("INCIDENT_ALERT_TRAY");
        break;
      case 740:
        result = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY");
        break;
      case 741:
        result = CFSTR("RAP_INCIDENT_REPORT_VIEW");
        break;
      case 742:
        result = CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY");
        break;
      case 743:
        result = CFSTR("TRAFFIC_ADVISORY_SHEET");
        break;
      case 801:
        result = CFSTR("SIRI_PLUGIN_SNIPPET");
        break;
      case 802:
        result = CFSTR("SIRI_PLUGIN_COMMAND");
        break;
      case 803:
        result = CFSTR("SIRI_SEARCH_RESULT_LIST");
        break;
      case 804:
        result = CFSTR("SIRI_DISAMBIGUATION_LIST");
        break;
      case 805:
        result = CFSTR("SIRI_PLACE_SNIPPET");
        break;
      default:
        if (a3 != 901)
          goto LABEL_39;
        result = CFSTR("CHROME");
        break;
    }
  }
  return result;
}

- (int)StringAsEntryTarget:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_POI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_RESULT_LIST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_POPULAR_NEARBY_LIST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_CALLOUT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_PIN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_DROPPED_PIN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_TRANSIT_LINE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_BROWSE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_POPULAR_NEARBY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_AC")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_AC_INTERMEDIATE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_NO_QUERY")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_WALKING_LEGAL_TRAY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAISE_TO_START_AR_TRAY")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENTS_ADVISORY_DETAILS_PAGE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY_CARPLAY")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHLIGHTED_AREA")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAVEL_PREFERENCES_TRAY")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_TRAY_SEARCH")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SINGLE_CARD_FILTER")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FULL_CARD_FILTER")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_PRIVACY_TRAY")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_RATINGS_HISTORY_TRAY")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_FILTERED")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CITY_MENU")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_TRAY")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBMIT_TRIP_FEEDBACK")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_PLACE_ISSUE_DETAILS")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_GUIDES_DETAILS")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_BAD_DIRECTIONS_DETAILS")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_MAP_DETAILS")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_COMPLICATION")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_NAV_MENU")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_REPORT_MENU")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CURATED_COLLECTION_MENU")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_REPORT_CARD_DETAILS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STREET_ISSUE_DETAILS")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEARBY_TRANSIT_CARD")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_MENU")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC_ADVISORY_PAGE")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PROFILE_TRAY")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_APP_MENU")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPLATE_PLACE_TRAY")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOW_NOTIFICATION_DIALOG")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_PROMPT")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_TRAY_VENDORS_MENU")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_TRAY")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_SHOWCASE_MENU")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_INLINE_ADD_DETAILS")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_MENU_DETAILS")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SUBMISSION_PROMPT")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_PLACECARD_EDIT_MENU")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_MENU")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES_STEPS")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_ARP")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YOUR_PHOTOS_ALBUM")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_PHOTO_CREDIT")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_OUTREACH_REVIEWED_REPORT")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_REPORT_MENU_MORE")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAPS_SETTINGS")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_FEATURE_PROMPT")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED_MAPS_DETAILS")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_VIEW")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_OFFLINE")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION_SELECTOR")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PLACE")) & 1) != 0)
  {
    v4 = 92;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL")) & 1) != 0)
  {
    v4 = 93;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_MAP")) & 1) != 0)
  {
    v4 = 94;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_CONTROLS")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_CONTROLS")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_CONTROLS")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_CONTROLS")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_BROWSE")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_FAVORITES")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_CLUSTER")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_VENUE_BROWSE")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAP_RESULTS")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PLACES")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOWNLOADED_MAPS_DETAILS")) & 1) != 0)
  {
    v4 = 112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL")) & 1) != 0)
  {
    v4 = 113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_OPTIONS")) & 1) != 0)
  {
    v4 = 117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 118;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MORE_GUIDES")) & 1) != 0)
  {
    v4 = 119;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_RECENTLY_VIEWED")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_SUCCESS_TRAY")) & 1) != 0)
  {
    v4 = 121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_NETWORK_SELECTION_TRAY")) & 1) != 0)
  {
    v4 = 122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_NETWORK_TRAY")) & 1) != 0)
  {
    v4 = 123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
  {
    v4 = 124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
  {
    v4 = 125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
  {
    v4 = 126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_KEYBOARD_TRAY")) & 1) != 0)
  {
    v4 = 127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_RELATED_TRAILS")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_RELATED_TRAILHEADS")) & 1) != 0)
  {
    v4 = 129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CUSTOM_ROUTE")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM_ROUTE_CREATION_TRAY")) & 1) != 0)
  {
    v4 = 131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CURATED_HIKE")) & 1) != 0)
  {
    v4 = 132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_CURATED_HIKES")) & 1) != 0)
  {
    v4 = 133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM_ROUTE_ONBOARDING")) & 1) != 0)
  {
    v4 = 134;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIBRARY_ROUTES")) & 1) != 0)
  {
    v4 = 135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
  {
    v4 = 136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MY_LIBRARY")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_NOTE_TRAY")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREATE_NOTE_TRAY")) & 1) != 0)
  {
    v4 = 139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIBRARY_PLACES")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ACCOUNT")) & 1) != 0)
  {
    v4 = 141;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_DOWNLOADED_MAPS")) & 1) != 0)
  {
    v4 = 142;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_TRAY")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEB_MODULE")) & 1) != 0)
  {
    v4 = 202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_FAVORITE_TRAY")) & 1) != 0)
  {
    v4 = 250;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_LIST")) & 1) != 0)
  {
    v4 = 251;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 252;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_DETAILS")) & 1) != 0)
  {
    v4 = 253;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITES_TRAY")) & 1) != 0)
  {
    v4 = 254;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_COLLECTION")) & 1) != 0)
  {
    v4 = 255;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 256;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECENTLY_VIEWED")) & 1) != 0)
  {
    v4 = 257;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_WEB_COLLECTION")) & 1) != 0)
  {
    v4 = 258;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 259;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_COLLECTIONS")) & 1) != 0)
  {
    v4 = 260;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_TRAY")) & 1) != 0)
  {
    v4 = 261;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_CURATED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 262;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_NOTIFICATION")) & 1) != 0)
  {
    v4 = 263;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_LIST")) & 1) != 0)
  {
    v4 = 264;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_LIST")) & 1) != 0)
  {
    v4 = 265;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_CURATED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 266;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST")) & 1) != 0)
  {
    v4 = 267;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST")) & 1) != 0)
  {
    v4 = 268;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_DRIVING")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_WALKING")) & 1) != 0)
  {
    v4 = 302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_TRANSIT")) & 1) != 0)
  {
    v4 = 303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE")) & 1) != 0)
  {
    v4 = 304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CYCLING")) & 1) != 0)
  {
    v4 = 305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW")) & 1) != 0)
  {
    v4 = 306;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_DRIVING")) & 1) != 0)
  {
    v4 = 401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_WALKING")) & 1) != 0)
  {
    v4 = 402;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_TRANSIT")) & 1) != 0)
  {
    v4 = 403;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_CYCLING")) & 1) != 0)
  {
    v4 = 404;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_PLACECARD")) & 1) != 0)
  {
    v4 = 501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_SEARCH")) & 1) != 0)
  {
    v4 = 502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_RESULTS")) & 1) != 0)
  {
    v4 = 503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_ROUTING")) & 1) != 0)
  {
    v4 = 504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_NAV")) & 1) != 0)
  {
    v4 = 505;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 506;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TRAFFIC_INCIDENT")) & 1) != 0)
  {
    v4 = 507;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_FULL_SCREEN")) & 1) != 0)
  {
    v4 = 508;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_DRIVE")) & 1) != 0)
  {
    v4 = 509;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_LAUNCH_AND_GO")) & 1) != 0)
  {
    v4 = 510;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_VIEW")) & 1) != 0)
  {
    v4 = 511;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_SETTINGS")) & 1) != 0)
  {
    v4 = 601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_PREFERENCES")) & 1) != 0)
  {
    v4 = 602;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP")) & 1) != 0)
  {
    v4 = 603;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_DRIVING_DETAILS")) & 1) != 0)
  {
    v4 = 604;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_WALKING_DETAILS")) & 1) != 0)
  {
    v4 = 605;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRANSIT_DETAILS")) & 1) != 0)
  {
    v4 = 606;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_EDITOR")) & 1) != 0)
  {
    v4 = 607;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DRIVING_DETAILS")) & 1) != 0)
  {
    v4 = 608;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_WALKING_DETAILS")) & 1) != 0)
  {
    v4 = 609;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRANSIT_DETAILS")) & 1) != 0)
  {
    v4 = 610;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_AUDIO_SETTINGS")) & 1) != 0)
  {
    v4 = 611;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_VIEWER_ALL")) & 1) != 0)
  {
    v4 = 612;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_VIEWER_SINGLE")) & 1) != 0)
  {
    v4 = 613;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_TRANSIT")) & 1) != 0)
  {
    v4 = 614;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_TRAY")) & 1) != 0)
  {
    v4 = 615;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_DRIVING")) & 1) != 0)
  {
    v4 = 616;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_WALKING")) & 1) != 0)
  {
    v4 = 617;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT")) & 1) != 0)
  {
    v4 = 618;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFINE_SEARCH_SUGGESTION_AREA")) & 1) != 0)
  {
    v4 = 619;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_PHOTO_SHEET")) & 1) != 0)
  {
    v4 = 620;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_PLACE_SHEET")) & 1) != 0)
  {
    v4 = 621;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_SHEET")) & 1) != 0)
  {
    v4 = 622;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_LOCATION_SHEET")) & 1) != 0)
  {
    v4 = 623;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_CONTACT_SHEET")) & 1) != 0)
  {
    v4 = 624;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_NAME_SHEET")) & 1) != 0)
  {
    v4 = 625;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING_NAV_SETTINGS")) & 1) != 0)
  {
    v4 = 626;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_SETTINGS")) & 1) != 0)
  {
    v4 = 627;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_SHEET")) & 1) != 0)
  {
    v4 = 628;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REMOVE_CAR_SHEET")) & 1) != 0)
  {
    v4 = 629;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DRIVING")) & 1) != 0)
  {
    v4 = 630;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DATETIME")) & 1) != 0)
  {
    v4 = 631;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_BANNER")) & 1) != 0)
  {
    v4 = 632;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_SELECT_TIME")) & 1) != 0)
  {
    v4 = 633;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_MORE_OPTIONS")) & 1) != 0)
  {
    v4 = 634;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_READY")) & 1) != 0)
  {
    v4 = 635;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_BOOKED")) & 1) != 0)
  {
    v4 = 636;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_CLUSTER_SHEET")) & 1) != 0)
  {
    v4 = 637;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_LIST_SHEET")) & 1) != 0)
  {
    v4 = 638;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_BALANCE_BANNER")) & 1) != 0)
  {
    v4 = 639;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEATHER_ICON")) & 1) != 0)
  {
    v4 = 640;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HELP_IMPROVE_MAPS_DIALOG")) & 1) != 0)
  {
    v4 = 641;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
  {
    v4 = 642;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
  {
    v4 = 643;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLOOR_PICKER")) & 1) != 0)
  {
    v4 = 644;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VENUE_LIST")) & 1) != 0)
  {
    v4 = 645;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_MODE")) & 1) != 0)
  {
    v4 = 646;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRANSIT_TICKETS_SHEET")) & 1) != 0)
  {
    v4 = 647;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINKED_SERVICE_HOURS")) & 1) != 0)
  {
    v4 = 648;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_ETA_TRAY")) & 1) != 0)
  {
    v4 = 649;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_UPDATE_TRAY")) & 1) != 0)
  {
    v4 = 650;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCHEDULECARD_TRAY")) & 1) != 0)
  {
    v4 = 651;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_NAV")) & 1) != 0)
  {
    v4 = 652;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_TRANSIT_ACCESS_POINT")) & 1) != 0)
  {
    v4 = 653;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATIONS_INSIDE")) & 1) != 0)
  {
    v4 = 654;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIMILAR_LOCATIONS")) & 1) != 0)
  {
    v4 = 655;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATIONS_AT_ADDRESS")) & 1) != 0)
  {
    v4 = 656;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_CYCLING")) & 1) != 0)
  {
    v4 = 657;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_CYCLING")) & 1) != 0)
  {
    v4 = 658;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_CONNECTION_TRAY")) & 1) != 0)
  {
    v4 = 659;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL_GARAGE")) & 1) != 0)
  {
    v4 = 660;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_BANNER")) & 1) != 0)
  {
    v4 = 661;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW")) & 1) != 0)
  {
    v4 = 662;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADVISORY_DETAILS_PAGE")) & 1) != 0)
  {
    v4 = 663;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_CLIP_NOTIFICATION")) & 1) != 0)
  {
    v4 = 664;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_VIEWER_GALLERY")) & 1) != 0)
  {
    v4 = 665;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDATION_CARD")) & 1) != 0)
  {
    v4 = 666;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY")) & 1) != 0)
  {
    v4 = 667;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_DISPLAY")) & 1) != 0)
  {
    v4 = 668;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VISUAL_LOCATION_FRAMEWORK")) & 1) != 0)
  {
    v4 = 669;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_CLIP_TRAY")) & 1) != 0)
  {
    v4 = 670;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LICENSE_PLATE_SUGGESTION_PAGE")) & 1) != 0)
  {
    v4 = 671;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_ADD_PLATE")) & 1) != 0)
  {
    v4 = 672;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULTS")) & 1) != 0)
  {
    v4 = 673;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_APP_CONNECTION")) & 1) != 0)
  {
    v4 = 674;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 675;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_NAV")) & 1) != 0)
  {
    v4 = 676;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_ETA")) & 1) != 0)
  {
    v4 = 677;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_TRANSIT")) & 1) != 0)
  {
    v4 = 678;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_UPC_DESTINATION")) & 1) != 0)
  {
    v4 = 679;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_CREATION_TRAY")) & 1) != 0)
  {
    v4 = 680;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_HOME")) & 1) != 0)
  {
    v4 = 681;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_PARKED_CAR")) & 1) != 0)
  {
    v4 = 682;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_POI")) & 1) != 0)
  {
    v4 = 683;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_SCHOOL")) & 1) != 0)
  {
    v4 = 684;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_WORK")) & 1) != 0)
  {
    v4 = 685;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION")) & 1) != 0)
  {
    v4 = 686;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_EMPTY")) & 1) != 0)
  {
    v4 = 687;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COARSE_LOCATION_OPTIONS_PROMPT")) & 1) != 0)
  {
    v4 = 688;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOW_PRECISE_LOCATION_PROMPT")) & 1) != 0)
  {
    v4 = 689;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_MY_LOCATION")) & 1) != 0)
  {
    v4 = 690;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MARK_MY_LOCATION")) & 1) != 0)
  {
    v4 = 691;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION_WATCH")) & 1) != 0)
  {
    v4 = 692;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_FAVORITE")) & 1) != 0)
  {
    v4 = 693;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_CYCLING_DETAILS")) & 1) != 0)
  {
    v4 = 694;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_CYCLING_DETAILS")) & 1) != 0)
  {
    v4 = 695;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_SUGGESTION_WIDGET")) & 1) != 0)
  {
    v4 = 696;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_TIPKIT")) & 1) != 0)
  {
    v4 = 697;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_PRIVACY")) & 1) != 0)
  {
    v4 = 698;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_WALKING")) & 1) != 0)
  {
    v4 = 699;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI_SEARCH")) & 1) != 0)
  {
    v4 = 701;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_SEARCH")) & 1) != 0)
  {
    v4 = 702;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI_MAPS_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 703;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 704;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_MAPS_DESTINATIONS")) & 1) != 0)
  {
    v4 = 705;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_MAPS_TRANSIT")) & 1) != 0)
  {
    v4 = 706;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_MAPS_NEARBY")) & 1) != 0)
  {
    v4 = 707;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR")) & 1) != 0)
  {
    v4 = 708;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTROL_CENTER")) & 1) != 0)
  {
    v4 = 709;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CENTER")) & 1) != 0)
  {
    v4 = 710;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_DOOM")) & 1) != 0)
  {
    v4 = 711;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_VENUES")) & 1) != 0)
  {
    v4 = 712;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_RAP_UPDATE")) & 1) != 0)
  {
    v4 = 713;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_CANCELLED")) & 1) != 0)
  {
    v4 = 714;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_STOP_SKIPPED")) & 1) != 0)
  {
    v4 = 715;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_DELAYED")) & 1) != 0)
  {
    v4 = 716;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_RAP")) & 1) != 0)
  {
    v4 = 717;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_PROXY_AUTH")) & 1) != 0)
  {
    v4 = 718;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_PUSH_TO_DEVICE")) & 1) != 0)
  {
    v4 = 719;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_LOW_FUEL")) & 1) != 0)
  {
    v4 = 720;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR_RESET")) & 1) != 0)
  {
    v4 = 721;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS")) & 1) != 0)
  {
    v4 = 722;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA")) & 1) != 0)
  {
    v4 = 723;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA_UPDATE")) & 1) != 0)
  {
    v4 = 724;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 725;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_GENERAL")) & 1) != 0)
  {
    v4 = 726;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 727;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 728;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_VENUES")) & 1) != 0)
  {
    v4 = 729;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL")) & 1) != 0)
  {
    v4 = 730;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE")) & 1) != 0)
  {
    v4 = 731;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 732;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_SHEET")) & 1) != 0)
  {
    v4 = 733;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CZ_ADVISORY_DETAILS_PAGE")) & 1) != 0)
  {
    v4 = 734;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_ETA_CONTACT_TRAY")) & 1) != 0)
  {
    v4 = 735;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SHARE_ETA")) & 1) != 0)
  {
    v4 = 736;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA")) & 1) != 0)
  {
    v4 = 737;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY")) & 1) != 0)
  {
    v4 = 738;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_ALERT_TRAY")) & 1) != 0)
  {
    v4 = 739;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY")) & 1) != 0)
  {
    v4 = 740;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_INCIDENT_REPORT_VIEW")) & 1) != 0)
  {
    v4 = 741;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY")) & 1) != 0)
  {
    v4 = 742;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_ADVISORY_SHEET")) & 1) != 0)
  {
    v4 = 743;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_PLUGIN_SNIPPET")) & 1) != 0)
  {
    v4 = 801;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_PLUGIN_COMMAND")) & 1) != 0)
  {
    v4 = 802;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SEARCH_RESULT_LIST")) & 1) != 0)
  {
    v4 = 803;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_DISAMBIGUATION_LIST")) & 1) != 0)
  {
    v4 = 804;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_PLACE_SNIPPET")) & 1) != 0)
  {
    v4 = 805;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHROME")) & 1) != 0)
  {
    v4 = 901;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NAV")) & 1) != 0)
  {
    v4 = 1001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_EXPLORE")) & 1) != 0)
  {
    v4 = 1002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_DESTINATIONS")) & 1) != 0)
  {
    v4 = 1003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_TRAFFIC_INCIDENT")) & 1) != 0)
  {
    v4 = 1004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_CONTROL")) & 1) != 0)
  {
    v4 = 1005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_PROACTIVE")) & 1) != 0)
  {
    v4 = 1006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_ROUTING")) & 1) != 0)
  {
    v4 = 1007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_MORE_ROUTES")) & 1) != 0)
  {
    v4 = 1008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 1009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SEARCH")) & 1) != 0)
  {
    v4 = 1010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 1011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_FAVORITES")) & 1) != 0)
  {
    v4 = 1012;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NAV_CONFIRMATION")) & 1) != 0)
  {
    v4 = 1013;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_DESTINATION_SHARING")) & 1) != 0)
  {
    v4 = 1014;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_BATTERY")) & 1) != 0)
  {
    v4 = 1015;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_DOOM")) & 1) != 0)
  {
    v4 = 1016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_FUEL")) & 1) != 0)
  {
    v4 = 1017;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_HYBRID")) & 1) != 0)
  {
    v4 = 1018;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SHARE_ETA_TRAY")) & 1) != 0)
  {
    v4 = 1019;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_ETA_UPDATE_TRAY")) & 1) != 0)
  {
    v4 = 1020;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_ACTION_TRAY")) & 1) != 0)
  {
    v4 = 1021;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_PLACECARD")) & 1) != 0)
  {
    v4 = 1022;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_KEYBOARD")) & 1) != 0)
  {
    v4 = 1023;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_UI_TARGET_UNKNOWN")) & 1) != 0)
  {
    v4 = 1024;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_EDIT_STOPS")) & 1) != 0)
  {
    v4 = 1025;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_MENU")) & 1) != 0)
  {
    v4 = 1100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST")) & 1) != 0)
  {
    v4 = 1101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM")) & 1) != 0)
  {
    v4 = 1103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_TRANSIT_MENU")) & 1) != 0)
  {
    v4 = 1106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_MAP")) & 1) != 0)
  {
    v4 = 1107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_MENU")) & 1) != 0)
  {
    v4 = 1108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP")) & 1) != 0)
  {
    v4 = 1109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_CLOSED_FORM")) & 1) != 0)
  {
    v4 = 1111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_MAP")) & 1) != 0)
  {
    v4 = 1112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_MENU")) & 1) != 0)
  {
    v4 = 1113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_NAME_FORM")) & 1) != 0)
  {
    v4 = 1114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_SHAPE_FORM")) & 1) != 0)
  {
    v4 = 1115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_PLACE_MENU")) & 1) != 0)
  {
    v4 = 1117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_POI_MAP")) & 1) != 0)
  {
    v4 = 1118;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CATEGORY_LIST")) & 1) != 0)
  {
    v4 = 1119;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_STREET_MAP")) & 1) != 0)
  {
    v4 = 1121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STREET_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_OTHER_MAP")) & 1) != 0)
  {
    v4 = 1123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_OTHER_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CAMERA")) & 1) != 0)
  {
    v4 = 1125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LABEL_MAP")) & 1) != 0)
  {
    v4 = 1126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LABEL_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_MENU")) & 1) != 0)
  {
    v4 = 1128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM")) & 1) != 0)
  {
    v4 = 1129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP")) & 1) != 0)
  {
    v4 = 1131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_MAP")) & 1) != 0)
  {
    v4 = 1133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1134;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_OTHER_FORM")) & 1) != 0)
  {
    v4 = 1135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_PRIVACY")) & 1) != 0)
  {
    v4 = 1136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CONFIRMATION")) & 1) != 0)
  {
    v4 = 1137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_MENU")) & 1) != 0)
  {
    v4 = 1138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU")) & 1) != 0)
  {
    v4 = 1139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_A_PLACE_MAP")) & 1) != 0)
  {
    v4 = 1140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_LOCATION_MAP")) & 1) != 0)
  {
    v4 = 1141;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP")) & 1) != 0)
  {
    v4 = 1142;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_CLOSED_FORM")) & 1) != 0)
  {
    v4 = 1143;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CLAIM_BUSINESS_DIALOG")) & 1) != 0)
  {
    v4 = 1144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_BRAND_MENU")) & 1) != 0)
  {
    v4 = 1145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_BRAND_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1146;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM")) & 1) != 0)
  {
    v4 = 1147;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM")) & 1) != 0)
  {
    v4 = 1148;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_BLURRING_FORM")) & 1) != 0)
  {
    v4 = 1149;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM")) & 1) != 0)
  {
    v4 = 1150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_MENU")) & 1) != 0)
  {
    v4 = 1151;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM")) & 1) != 0)
  {
    v4 = 1152;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU")) & 1) != 0)
  {
    v4 = 1153;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LIGHTWEIGHT")) & 1) != 0)
  {
    v4 = 1154;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_PLACE_DETAILS")) & 1) != 0)
  {
    v4 = 1155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_CATEGORY")) & 1) != 0)
  {
    v4 = 1156;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_HOURS")) & 1) != 0)
  {
    v4 = 1157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_LOCATION")) & 1) != 0)
  {
    v4 = 1158;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 1159;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 1160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 1161;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAIN_MENU")) & 1) != 0)
  {
    v4 = 1201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAIN_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH")) & 1) != 0)
  {
    v4 = 1203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_DICTATION")) & 1) != 0)
  {
    v4 = 1204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_FAVORITES")) & 1) != 0)
  {
    v4 = 1205;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SUB_CATEGORY_LIST")) & 1) != 0)
  {
    v4 = 1206;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_LIST")) & 1) != 0)
  {
    v4 = 1207;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAP_VIEW")) & 1) != 0)
  {
    v4 = 1208;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PLACECARD")) & 1) != 0)
  {
    v4 = 1209;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 1210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_DETAILS")) & 1) != 0)
  {
    v4 = 1211;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TBT")) & 1) != 0)
  {
    v4 = 1212;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_MAP")) & 1) != 0)
  {
    v4 = 1213;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1214;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAP_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1215;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTING_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1216;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_TRANSIT_MAP_VIEW")) & 1) != 0)
  {
    v4 = 1217;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SCRIBBLE")) & 1) != 0)
  {
    v4 = 1218;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 1219;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING")) & 1) != 0)
  {
    v4 = 1220;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING")) & 1) != 0)
  {
    v4 = 1221;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT")) & 1) != 0)
  {
    v4 = 1222;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PAIRED_DEVICE")) & 1) != 0)
  {
    v4 = 1223;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_SPLIT")) & 1) != 0)
  {
    v4 = 1224;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_PLATTER")) & 1) != 0)
  {
    v4 = 1225;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_MAP")) & 1) != 0)
  {
    v4 = 1226;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_SPLIT")) & 1) != 0)
  {
    v4 = 1227;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_PLATTER")) & 1) != 0)
  {
    v4 = 1228;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_MAP")) & 1) != 0)
  {
    v4 = 1229;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_SPLIT")) & 1) != 0)
  {
    v4 = 1230;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_PLATTER")) & 1) != 0)
  {
    v4 = 1231;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_MAP")) & 1) != 0)
  {
    v4 = 1232;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_INFO")) & 1) != 0)
  {
    v4 = 1233;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_MAP")) & 1) != 0)
  {
    v4 = 1234;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_PLATTER")) & 1) != 0)
  {
    v4 = 1235;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_SPLIT")) & 1) != 0)
  {
    v4 = 1236;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING")) & 1) != 0)
  {
    v4 = 1237;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH_INPUT")) & 1) != 0)
  {
    v4 = 1238;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
  {
    v4 = 1239;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
  {
    v4 = 1240;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_LIST")) & 1) != 0)
  {
    v4 = 1301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_FORM")) & 1) != 0)
  {
    v4 = 1302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_LABEL_FORM")) & 1) != 0)
  {
    v4 = 1303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_EDIT_MAP")) & 1) != 0)
  {
    v4 = 1304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION")) & 1) != 0)
  {
    v4 = 1305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG")) & 1) != 0)
  {
    v4 = 1306;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_INFO")) & 1) != 0)
  {
    v4 = 1307;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH")) & 1) != 0)
  {
    v4 = 1308;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 1309;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_SEARCH")) & 1) != 0)
  {
    v4 = 1310;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_LIST")) & 1) != 0)
  {
    v4 = 1311;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_INFO")) & 1) != 0)
  {
    v4 = 1312;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY")) & 1) != 0)
  {
    v4 = 1313;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS")) & 1) != 0)
  {
    v4 = 1401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING")) & 1) != 0)
  {
    v4 = 1402;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING")) & 1) != 0)
  {
    v4 = 1403;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED")) & 1) != 0)
  {
    v4 = 1404;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG")) & 1) != 0)
  {
    v4 = 1405;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK")) & 1) != 0)
  {
    v4 = 1406;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL")) & 1) != 0)
  {
    v4 = 1407;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_HEADER")) & 1) != 0)
  {
    v4 = 1501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ADDRESS")) & 1) != 0)
  {
    v4 = 1502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_PHONE")) & 1) != 0)
  {
    v4 = 1503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_URL")) & 1) != 0)
  {
    v4 = 1504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MENU_ITEM_DARK_MAP")) & 1) != 0)
  {
    v4 = 1601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP")) & 1) != 0)
  {
    v4 = 1700;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_ACTION_SHEET")) & 1) != 0)
  {
    v4 = 1701;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW")) & 1) != 0)
  {
    v4 = 1702;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PLATTER")) & 1) != 0)
  {
    v4 = 1703;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM")) & 1) != 0)
  {
    v4 = 1704;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION")) & 1) != 0)
  {
    v4 = 1705;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW_PLACECARD")) & 1) != 0)
  {
    v4 = 1706;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_PLACECARD")) & 1) != 0)
  {
    v4 = 1707;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY")) & 1) != 0)
  {
    v4 = 1708;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_PLACE")) & 1) != 0)
  {
    v4 = 1801;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH")) & 1) != 0)
  {
    v4 = 1802;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 1803;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_PUBLISHER")) & 1) != 0)
  {
    v4 = 1804;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_GUIDE")) & 1) != 0)
  {
    v4 = 1805;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_GUIDES_HOME")) & 1) != 0)
  {
    v4 = 1806;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_RELATED_PLACES_LIST")) & 1) != 0)
  {
    v4 = 1807;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_COLLECTION_LIST")) & 1) != 0)
  {
    v4 = 1808;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_DIRECTIONS")) & 1) != 0)
  {
    v4 = 1809;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_SIDEBAR")))
  {
    v4 = 1810;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)downloadSize
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_downloadSize;
  else
    return 0;
}

- (void)setDownloadSize:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_downloadSize = a3;
}

- (void)setHasDownloadSize:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDownloadSize
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)downloadSizeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C22EA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDownloadSize:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OfflineDownloadSize_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_100MB")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_500MB")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_1GB")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_2GB")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OfflineDownloadSize_GREATER_THAN_2GB")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasZoomLevel
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)downloadOnWifiOnly
{
  return self->_downloadOnWifiOnly;
}

- (void)setDownloadOnWifiOnly:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_downloadOnWifiOnly = a3;
}

- (void)setHasDownloadOnWifiOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasDownloadOnWifiOnly
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)optimizeStorage
{
  return self->_optimizeStorage;
}

- (void)setOptimizeStorage:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_optimizeStorage = a3;
}

- (void)setHasOptimizeStorage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasOptimizeStorage
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)automaticUpdates
{
  return self->_automaticUpdates;
}

- (void)setAutomaticUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_automaticUpdates = a3;
}

- (void)setHasAutomaticUpdates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasAutomaticUpdates
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateOfflineDownload;
  -[GEOLogMsgStateOfflineDownload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateOfflineDownload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateOfflineDownload _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  int v12;
  __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "downloadCountry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("downloadCountry");
    else
      v6 = CFSTR("download_country");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 30));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isDownloadInHomeMetro");
    else
      v9 = CFSTR("is_download_in_home_metro");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 36);
    if ((v7 & 0x80) == 0)
    {
LABEL_9:
      if ((v7 & 2) == 0)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)(a1 + 36) & 0x80) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("regionTilesWereResized");
  else
    v11 = CFSTR("region_tiles_were_resized");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 2) == 0)
  {
LABEL_10:
    if ((v7 & 1) == 0)
      goto LABEL_11;
    goto LABEL_543;
  }
LABEL_24:
  v12 = *(_DWORD *)(a1 + 20);
  if (v12 > 1000)
  {
    if (v12 > 1600)
    {
      switch(v12)
      {
        case 1801:
          v13 = CFSTR("MAPS_WEB_PLACE");
          break;
        case 1802:
          v13 = CFSTR("MAPS_WEB_SEARCH");
          break;
        case 1803:
          v13 = CFSTR("MAPS_WEB_SEARCH_RESULTS");
          break;
        case 1804:
          v13 = CFSTR("MAPS_WEB_PUBLISHER");
          break;
        case 1805:
          v13 = CFSTR("MAPS_WEB_GUIDE");
          break;
        case 1806:
          v13 = CFSTR("MAPS_WEB_GUIDES_HOME");
          break;
        case 1807:
          v13 = CFSTR("MAPS_WEB_RELATED_PLACES_LIST");
          break;
        case 1808:
          v13 = CFSTR("MAPS_WEB_COLLECTION_LIST");
          break;
        case 1809:
          v13 = CFSTR("MAPS_WEB_DIRECTIONS");
          break;
        case 1810:
          v13 = CFSTR("MAPS_WEB_SIDEBAR");
          break;
        default:
          switch(v12)
          {
            case 1700:
              v13 = CFSTR("LOOK_AROUND_PIP");
              break;
            case 1701:
              v13 = CFSTR("LOOK_AROUND_ACTION_SHEET");
              break;
            case 1702:
              v13 = CFSTR("LOOK_AROUND_VIEW");
              break;
            case 1703:
              v13 = CFSTR("LOOK_AROUND_PLATTER");
              break;
            case 1704:
              v13 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM");
              break;
            case 1705:
              v13 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION");
              break;
            case 1706:
              v13 = CFSTR("LOOK_AROUND_VIEW_PLACECARD");
              break;
            case 1707:
              v13 = CFSTR("LOOK_AROUND_PIP_PLACECARD");
              break;
            case 1708:
              v13 = CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY");
              break;
            default:
              if (v12 == 1601)
              {
                v13 = CFSTR("MENU_ITEM_DARK_MAP");
              }
              else
              {
LABEL_60:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch(v12)
      {
        case 1001:
          v13 = CFSTR("CARPLAY_NAV");
          break;
        case 1002:
          v13 = CFSTR("CARPLAY_EXPLORE");
          break;
        case 1003:
          v13 = CFSTR("CARPLAY_DESTINATIONS");
          break;
        case 1004:
          v13 = CFSTR("CARPLAY_TRAFFIC_INCIDENT");
          break;
        case 1005:
          v13 = CFSTR("CARPLAY_CONTROL");
          break;
        case 1006:
          v13 = CFSTR("CARPLAY_PROACTIVE");
          break;
        case 1007:
          v13 = CFSTR("CARPLAY_ROUTING");
          break;
        case 1008:
          v13 = CFSTR("CARPLAY_MORE_ROUTES");
          break;
        case 1009:
          v13 = CFSTR("CARPLAY_SEARCH_ALONG_ROUTE");
          break;
        case 1010:
          v13 = CFSTR("CARPLAY_SEARCH");
          break;
        case 1011:
          v13 = CFSTR("CARPLAY_SEARCH_RESULTS");
          break;
        case 1012:
          v13 = CFSTR("CARPLAY_FAVORITES");
          break;
        case 1013:
          v13 = CFSTR("CARPLAY_NAV_CONFIRMATION");
          break;
        case 1014:
          v13 = CFSTR("CARPLAY_DESTINATION_SHARING");
          break;
        case 1015:
          v13 = CFSTR("CARPLAY_NOTIFICATION_BATTERY");
          break;
        case 1016:
          v13 = CFSTR("CARPLAY_NOTIFICATION_DOOM");
          break;
        case 1017:
          v13 = CFSTR("CARPLAY_NOTIFICATION_FUEL");
          break;
        case 1018:
          v13 = CFSTR("CARPLAY_NOTIFICATION_HYBRID");
          break;
        case 1019:
          v13 = CFSTR("CARPLAY_SHARE_ETA_TRAY");
          break;
        case 1020:
          v13 = CFSTR("CARPLAY_ETA_UPDATE_TRAY");
          break;
        case 1021:
          v13 = CFSTR("CARPLAY_ACTION_TRAY");
          break;
        case 1022:
          v13 = CFSTR("CARPLAY_PLACECARD");
          break;
        case 1023:
          v13 = CFSTR("CARPLAY_KEYBOARD");
          break;
        case 1024:
          v13 = CFSTR("CARPLAY_UI_TARGET_UNKNOWN");
          break;
        case 1025:
          v13 = CFSTR("CARPLAY_EDIT_STOPS");
          break;
        case 1026:
        case 1027:
        case 1028:
        case 1029:
        case 1030:
        case 1031:
        case 1032:
        case 1033:
        case 1034:
        case 1035:
        case 1036:
        case 1037:
        case 1038:
        case 1039:
        case 1040:
        case 1041:
        case 1042:
        case 1043:
        case 1044:
        case 1045:
        case 1046:
        case 1047:
        case 1048:
        case 1049:
        case 1050:
        case 1051:
        case 1052:
        case 1053:
        case 1054:
        case 1055:
        case 1056:
        case 1057:
        case 1058:
        case 1059:
        case 1060:
        case 1061:
        case 1062:
        case 1063:
        case 1064:
        case 1065:
        case 1066:
        case 1067:
        case 1068:
        case 1069:
        case 1070:
        case 1071:
        case 1072:
        case 1073:
        case 1074:
        case 1075:
        case 1076:
        case 1077:
        case 1078:
        case 1079:
        case 1080:
        case 1081:
        case 1082:
        case 1083:
        case 1084:
        case 1085:
        case 1086:
        case 1087:
        case 1088:
        case 1089:
        case 1090:
        case 1091:
        case 1092:
        case 1093:
        case 1094:
        case 1095:
        case 1096:
        case 1097:
        case 1098:
        case 1099:
        case 1162:
        case 1163:
        case 1164:
        case 1165:
        case 1166:
        case 1167:
        case 1168:
        case 1169:
        case 1170:
        case 1171:
        case 1172:
        case 1173:
        case 1174:
        case 1175:
        case 1176:
        case 1177:
        case 1178:
        case 1179:
        case 1180:
        case 1181:
        case 1182:
        case 1183:
        case 1184:
        case 1185:
        case 1186:
        case 1187:
        case 1188:
        case 1189:
        case 1190:
        case 1191:
        case 1192:
        case 1193:
        case 1194:
        case 1195:
        case 1196:
        case 1197:
        case 1198:
        case 1199:
        case 1200:
        case 1241:
        case 1242:
        case 1243:
        case 1244:
        case 1245:
        case 1246:
        case 1247:
        case 1248:
        case 1249:
        case 1250:
        case 1251:
        case 1252:
        case 1253:
        case 1254:
        case 1255:
        case 1256:
        case 1257:
        case 1258:
        case 1259:
        case 1260:
        case 1261:
        case 1262:
        case 1263:
        case 1264:
        case 1265:
        case 1266:
        case 1267:
        case 1268:
        case 1269:
        case 1270:
        case 1271:
        case 1272:
        case 1273:
        case 1274:
        case 1275:
        case 1276:
        case 1277:
        case 1278:
        case 1279:
        case 1280:
        case 1281:
        case 1282:
        case 1283:
        case 1284:
        case 1285:
        case 1286:
        case 1287:
        case 1288:
        case 1289:
        case 1290:
        case 1291:
        case 1292:
        case 1293:
        case 1294:
        case 1295:
        case 1296:
        case 1297:
        case 1298:
        case 1299:
        case 1300:
          goto LABEL_60;
        case 1100:
          v13 = CFSTR("RAP_DIRECTIONS_MENU");
          break;
        case 1101:
          v13 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST");
          break;
        case 1102:
          v13 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM");
          break;
        case 1103:
          v13 = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM");
          break;
        case 1104:
          v13 = CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM");
          break;
        case 1105:
          v13 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM");
          break;
        case 1106:
          v13 = CFSTR("RAP_TRANSIT_MENU");
          break;
        case 1107:
          v13 = CFSTR("RAP_STATION_MAP");
          break;
        case 1108:
          v13 = CFSTR("RAP_STATION_MENU");
          break;
        case 1109:
          v13 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP");
          break;
        case 1110:
          v13 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM");
          break;
        case 1111:
          v13 = CFSTR("RAP_STATION_CLOSED_FORM");
          break;
        case 1112:
          v13 = CFSTR("RAP_LINE_MAP");
          break;
        case 1113:
          v13 = CFSTR("RAP_LINE_MENU");
          break;
        case 1114:
          v13 = CFSTR("RAP_LINE_NAME_FORM");
          break;
        case 1115:
          v13 = CFSTR("RAP_LINE_SHAPE_FORM");
          break;
        case 1116:
          v13 = CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM");
          break;
        case 1117:
          v13 = CFSTR("RAP_ADD_PLACE_MENU");
          break;
        case 1118:
          v13 = CFSTR("RAP_ADD_POI_MAP");
          break;
        case 1119:
          v13 = CFSTR("RAP_CATEGORY_LIST");
          break;
        case 1120:
          v13 = CFSTR("RAP_POI_DETAILS_FORM");
          break;
        case 1121:
          v13 = CFSTR("RAP_ADD_STREET_MAP");
          break;
        case 1122:
          v13 = CFSTR("RAP_STREET_DETAILS_FORM");
          break;
        case 1123:
          v13 = CFSTR("RAP_ADD_OTHER_MAP");
          break;
        case 1124:
          v13 = CFSTR("RAP_OTHER_DETAILS_FORM");
          break;
        case 1125:
          v13 = CFSTR("RAP_CAMERA");
          break;
        case 1126:
          v13 = CFSTR("RAP_LABEL_MAP");
          break;
        case 1127:
          v13 = CFSTR("RAP_LABEL_DETAILS_FORM");
          break;
        case 1128:
          v13 = CFSTR("RAP_SEARCH_MENU");
          break;
        case 1129:
          v13 = CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM");
          break;
        case 1130:
          v13 = CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM");
          break;
        case 1131:
          v13 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP");
          break;
        case 1132:
          v13 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM");
          break;
        case 1133:
          v13 = CFSTR("RAP_SATELLITE_IMAGE_MAP");
          break;
        case 1134:
          v13 = CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM");
          break;
        case 1135:
          v13 = CFSTR("RAP_OTHER_FORM");
          break;
        case 1136:
          v13 = CFSTR("RAP_PRIVACY");
          break;
        case 1137:
          v13 = CFSTR("RAP_CONFIRMATION");
          break;
        case 1138:
          v13 = CFSTR("RAP_POI_MENU");
          break;
        case 1139:
          v13 = CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU");
          break;
        case 1140:
          v13 = CFSTR("RAP_ADD_A_PLACE_MAP");
          break;
        case 1141:
          v13 = CFSTR("RAP_POI_LOCATION_MAP");
          break;
        case 1142:
          v13 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP");
          break;
        case 1143:
          v13 = CFSTR("RAP_POI_CLOSED_FORM");
          break;
        case 1144:
          v13 = CFSTR("RAP_CLAIM_BUSINESS_DIALOG");
          break;
        case 1145:
          v13 = CFSTR("RAP_BRAND_MENU");
          break;
        case 1146:
          v13 = CFSTR("RAP_BRAND_DETAILS_FORM");
          break;
        case 1147:
          v13 = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM");
          break;
        case 1148:
          v13 = CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM");
          break;
        case 1149:
          v13 = CFSTR("RAP_LOOK_AROUND_BLURRING_FORM");
          break;
        case 1150:
          v13 = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM");
          break;
        case 1151:
          v13 = CFSTR("RAP_LOOK_AROUND_MENU");
          break;
        case 1152:
          v13 = CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM");
          break;
        case 1153:
          v13 = CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU");
          break;
        case 1154:
          v13 = CFSTR("RAP_LIGHTWEIGHT");
          break;
        case 1155:
          v13 = CFSTR("RAP_EDIT_PLACE_DETAILS");
          break;
        case 1156:
          v13 = CFSTR("RAP_ADD_CATEGORY");
          break;
        case 1157:
          v13 = CFSTR("RAP_ADD_HOURS");
          break;
        case 1158:
          v13 = CFSTR("RAP_EDIT_LOCATION");
          break;
        case 1159:
          v13 = CFSTR("RAP_EDIT_ENTRY_POINT");
          break;
        case 1160:
          v13 = CFSTR("RAP_LOOK_AROUND");
          break;
        case 1161:
          v13 = CFSTR("RAP_ADD_ENTRY_POINT");
          break;
        case 1201:
          v13 = CFSTR("WATCH_MAIN_MENU");
          break;
        case 1202:
          v13 = CFSTR("WATCH_MAIN_PRESS_MENU");
          break;
        case 1203:
          v13 = CFSTR("WATCH_SEARCH");
          break;
        case 1204:
          v13 = CFSTR("WATCH_DICTATION");
          break;
        case 1205:
          v13 = CFSTR("WATCH_FAVORITES");
          break;
        case 1206:
          v13 = CFSTR("WATCH_SUB_CATEGORY_LIST");
          break;
        case 1207:
          v13 = CFSTR("WATCH_SEARCH_RESULTS_LIST");
          break;
        case 1208:
          v13 = CFSTR("WATCH_MAP_VIEW");
          break;
        case 1209:
          v13 = CFSTR("WATCH_PLACECARD");
          break;
        case 1210:
          v13 = CFSTR("WATCH_ROUTE_PLANNING");
          break;
        case 1211:
          v13 = CFSTR("WATCH_ROUTE_DETAILS");
          break;
        case 1212:
          v13 = CFSTR("WATCH_NAV_TBT");
          break;
        case 1213:
          v13 = CFSTR("WATCH_NAV_MAP");
          break;
        case 1214:
          v13 = CFSTR("WATCH_NAV_PRESS_MENU");
          break;
        case 1215:
          v13 = CFSTR("WATCH_MAP_PRESS_MENU");
          break;
        case 1216:
          v13 = CFSTR("WATCH_ROUTING_PRESS_MENU");
          break;
        case 1217:
          v13 = CFSTR("WATCH_TRANSIT_MAP_VIEW");
          break;
        case 1218:
          v13 = CFSTR("WATCH_SCRIBBLE");
          break;
        case 1219:
          v13 = CFSTR("WATCH_COLLECTION_VIEW");
          break;
        case 1220:
          v13 = CFSTR("WATCH_ROUTE_PLANNING_WALKING");
          break;
        case 1221:
          v13 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING");
          break;
        case 1222:
          v13 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT");
          break;
        case 1223:
          v13 = CFSTR("WATCH_PAIRED_DEVICE");
          break;
        case 1224:
          v13 = CFSTR("WATCH_NAV_DRIVING_SPLIT");
          break;
        case 1225:
          v13 = CFSTR("WATCH_NAV_DRIVING_PLATTER");
          break;
        case 1226:
          v13 = CFSTR("WATCH_NAV_DRIVING_MAP");
          break;
        case 1227:
          v13 = CFSTR("WATCH_NAV_WALKING_SPLIT");
          break;
        case 1228:
          v13 = CFSTR("WATCH_NAV_WALKING_PLATTER");
          break;
        case 1229:
          v13 = CFSTR("WATCH_NAV_WALKING_MAP");
          break;
        case 1230:
          v13 = CFSTR("WATCH_NAV_TRANSIT_SPLIT");
          break;
        case 1231:
          v13 = CFSTR("WATCH_NAV_TRANSIT_PLATTER");
          break;
        case 1232:
          v13 = CFSTR("WATCH_NAV_TRANSIT_MAP");
          break;
        case 1233:
          v13 = CFSTR("WATCH_ROUTE_INFO");
          break;
        case 1234:
          v13 = CFSTR("WATCH_NAV_CYCLING_MAP");
          break;
        case 1235:
          v13 = CFSTR("WATCH_NAV_CYCLING_PLATTER");
          break;
        case 1236:
          v13 = CFSTR("WATCH_NAV_CYCLING_SPLIT");
          break;
        case 1237:
          v13 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING");
          break;
        case 1238:
          v13 = CFSTR("WATCH_SEARCH_INPUT");
          break;
        case 1239:
          v13 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
          break;
        case 1240:
          v13 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE");
          break;
        case 1301:
          v13 = CFSTR("PERSONALIZED_ADDRESS_LIST");
          break;
        case 1302:
          v13 = CFSTR("PERSONALIZED_ADDRESS_FORM");
          break;
        case 1303:
          v13 = CFSTR("PERSONALIZED_LABEL_FORM");
          break;
        case 1304:
          v13 = CFSTR("PERSONALIZED_EDIT_MAP");
          break;
        case 1305:
          v13 = CFSTR("PERSONALIZED_CONFIRMATION");
          break;
        case 1306:
          v13 = CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG");
          break;
        case 1307:
          v13 = CFSTR("PERSONALIZED_ADDRESS_INFO");
          break;
        case 1308:
          v13 = CFSTR("PERSONALIZED_ADDRESS_SEARCH");
          break;
        case 1309:
          v13 = CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS");
          break;
        case 1310:
          v13 = CFSTR("FAVORITE_SEARCH");
          break;
        case 1311:
          v13 = CFSTR("FAVORITE_LIST");
          break;
        case 1312:
          v13 = CFSTR("FAVORITE_INFO");
          break;
        case 1313:
          v13 = CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY");
          break;
        default:
          switch(v12)
          {
            case 1401:
              v13 = CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS");
              break;
            case 1402:
              v13 = CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING");
              break;
            case 1403:
              v13 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING");
              break;
            case 1404:
              v13 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED");
              break;
            case 1405:
              v13 = CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG");
              break;
            case 1406:
              v13 = CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK");
              break;
            case 1407:
              v13 = CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL");
              break;
            default:
              switch(v12)
              {
                case 1501:
                  v13 = CFSTR("PLACECARD_HEADER");
                  break;
                case 1502:
                  v13 = CFSTR("PLACECARD_ADDRESS");
                  break;
                case 1503:
                  v13 = CFSTR("PLACECARD_PHONE");
                  break;
                case 1504:
                  v13 = CFSTR("PLACECARD_URL");
                  break;
                default:
                  goto LABEL_60;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v13 = CFSTR("UI_TARGET_UNKNOWN");
    switch(v12)
    {
      case 0:
        break;
      case 1:
        v13 = CFSTR("UI_TARGET_POI");
        break;
      case 2:
        v13 = CFSTR("UI_TARGET_SEARCH_RESULT_LIST");
        break;
      case 3:
        v13 = CFSTR("UI_TARGET_POPULAR_NEARBY_LIST");
        break;
      case 4:
        v13 = CFSTR("UI_TARGET_CALLOUT");
        break;
      case 5:
        v13 = CFSTR("UI_TARGET_SEARCH_PIN");
        break;
      case 6:
        v13 = CFSTR("UI_TARGET_DROPPED_PIN");
        break;
      case 7:
        v13 = CFSTR("UI_TARGET_TRANSIT_LINE");
        break;
      case 8:
        v13 = CFSTR("SEARCH_TRAY");
        break;
      case 9:
        v13 = CFSTR("SEARCH_TRAY_BROWSE");
        break;
      case 10:
        v13 = CFSTR("SEARCH_TRAY_POPULAR_NEARBY");
        break;
      case 11:
        v13 = CFSTR("SEARCH_TRAY_AC");
        break;
      case 12:
        v13 = CFSTR("SEARCH_TRAY_AC_INTERMEDIATE");
        break;
      case 13:
        v13 = CFSTR("SEARCH_TRAY_NO_QUERY");
        break;
      case 14:
        v13 = CFSTR("AR_WALKING_LEGAL_TRAY");
        break;
      case 15:
        v13 = CFSTR("RAISE_TO_START_AR_TRAY");
        break;
      case 16:
        v13 = CFSTR("EVENTS_ADVISORY_DETAILS_PAGE");
        break;
      case 17:
        v13 = CFSTR("INCIDENT_REPORT_TRAY_CARPLAY");
        break;
      case 18:
        v13 = CFSTR("HIGHLIGHTED_AREA");
        break;
      case 19:
        v13 = CFSTR("CURATED_COLLECTIONS_HOME");
        break;
      case 20:
        v13 = CFSTR("TRAVEL_PREFERENCES_TRAY");
        break;
      case 21:
        v13 = CFSTR("RESULT_TRAY_SEARCH");
        break;
      case 22:
        v13 = CFSTR("SINGLE_CARD_FILTER");
        break;
      case 23:
        v13 = CFSTR("FULL_CARD_FILTER");
        break;
      case 24:
        v13 = CFSTR("ACCOUNT_PRIVACY_TRAY");
        break;
      case 25:
        v13 = CFSTR("APPLE_RATINGS_HISTORY_TRAY");
        break;
      case 26:
        v13 = CFSTR("CURATED_COLLECTIONS_HOME_FILTERED");
        break;
      case 27:
        v13 = CFSTR("CITY_MENU");
        break;
      case 28:
        v13 = CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED");
        break;
      case 29:
        v13 = CFSTR("ACCOUNT_TRAY");
        break;
      case 30:
        v13 = CFSTR("QUICK_ACTION_TRAY");
        break;
      case 31:
        v13 = CFSTR("SUBMIT_TRIP_FEEDBACK");
        break;
      case 32:
        v13 = CFSTR("RAP_PLACE_ISSUE_DETAILS");
        break;
      case 33:
        v13 = CFSTR("RAP_GUIDES_DETAILS");
        break;
      case 34:
        v13 = CFSTR("RAP_BAD_DIRECTIONS_DETAILS");
        break;
      case 35:
        v13 = CFSTR("RAP_ADD_MAP_DETAILS");
        break;
      case 36:
        v13 = CFSTR("WATCH_COMPLICATION");
        break;
      case 37:
        v13 = CFSTR("RAP_NAV_MENU");
        break;
      case 38:
        v13 = CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT");
        break;
      case 39:
        v13 = CFSTR("RAP_REPORT_MENU");
        break;
      case 40:
        v13 = CFSTR("RAP_CURATED_COLLECTION_MENU");
        break;
      case 41:
        v13 = CFSTR("RAP_REPORT_CARD_DETAILS");
        break;
      case 42:
        v13 = CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT");
        break;
      case 43:
        v13 = CFSTR("RAP_STREET_ISSUE_DETAILS");
        break;
      case 44:
        v13 = CFSTR("NEARBY_TRANSIT_CARD");
        break;
      case 45:
        v13 = CFSTR("WATCH_NAV_MENU");
        break;
      case 46:
        v13 = CFSTR("GENERIC_ADVISORY_PAGE");
        break;
      case 47:
        v13 = CFSTR("USER_PROFILE_TRAY");
        break;
      case 48:
        v13 = CFSTR("MEDIA_APP_MENU");
        break;
      case 49:
        v13 = CFSTR("TEMPLATE_PLACE_TRAY");
        break;
      case 50:
        v13 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP");
        break;
      case 51:
        v13 = CFSTR("ALLOW_NOTIFICATION_DIALOG");
        break;
      case 52:
        v13 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING");
        break;
      case 53:
        v13 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP");
        break;
      case 54:
        v13 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED");
        break;
      case 55:
        v13 = CFSTR("NOTIFICATION_CONSENT_PROMPT");
        break;
      case 56:
        v13 = CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU");
        break;
      case 57:
        v13 = CFSTR("PLACECARD_TRAY_VENDORS_MENU");
        break;
      case 58:
        v13 = CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING");
        break;
      case 59:
        v13 = CFSTR("SEARCH_ALONG_ROUTE_TRAY");
        break;
      case 60:
        v13 = CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING");
        break;
      case 61:
        v13 = CFSTR("PLACECARD_SHOWCASE_MENU");
        break;
      case 62:
        v13 = CFSTR("RAP_INLINE_ADD_DETAILS");
        break;
      case 63:
        v13 = CFSTR("RAP_EDIT_MENU_DETAILS");
        break;
      case 64:
        v13 = CFSTR("RAP_SUBMISSION_PROMPT");
        break;
      case 65:
        v13 = CFSTR("RAP_PLACECARD_EDIT_MENU");
        break;
      case 66:
        v13 = CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE");
        break;
      case 67:
        v13 = CFSTR("INCIDENT_REPORT_MENU");
        break;
      case 68:
        v13 = CFSTR("RAP_SELECT_BAD_ROUTES_STEPS");
        break;
      case 69:
        v13 = CFSTR("RAP_SELECT_BAD_ROUTES");
        break;
      case 70:
        v13 = CFSTR("SIRI_SUGGESTION_RESUME_ROUTE");
        break;
      case 71:
        v13 = CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
        break;
      case 72:
        v13 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST");
        break;
      case 73:
        v13 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY");
        break;
      case 74:
        v13 = CFSTR("NOTIFICATION_ARP");
        break;
      case 75:
        v13 = CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT");
        break;
      case 76:
        v13 = CFSTR("YOUR_PHOTOS_ALBUM");
        break;
      case 77:
        v13 = CFSTR("ARP_PHOTO_CREDIT");
        break;
      case 78:
        v13 = CFSTR("RAP_OUTREACH_REVIEWED_REPORT");
        break;
      case 79:
        v13 = CFSTR("RAP_REPORT_MENU_MORE");
        break;
      case 80:
        v13 = CFSTR("WATCH_MAPS_SETTINGS");
        break;
      case 81:
        v13 = CFSTR("OFFLINE_FEATURE_PROMPT");
        break;
      case 82:
        v13 = CFSTR("EXPIRED_MAPS_DETAILS");
        break;
      case 83:
        v13 = CFSTR("MAPS_VIEW");
        break;
      case 84:
        v13 = CFSTR("NOTIFICATION_OFFLINE");
        break;
      case 85:
        v13 = CFSTR("EXPIRED_MAPS_MANAGEMENT");
        break;
      case 86:
        v13 = CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT");
        break;
      case 87:
        v13 = CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT");
        break;
      case 88:
        v13 = CFSTR("OFFLINE_MAPS_MANAGEMENT");
        break;
      case 89:
        v13 = CFSTR("REGION_SELECTOR");
        break;
      case 90:
        v13 = CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT");
        break;
      case 91:
        v13 = CFSTR("FIND_MY_ETA_SHARING_TRAY");
        break;
      case 92:
        v13 = CFSTR("WATCH_PLACE");
        break;
      case 93:
        v13 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL");
        break;
      case 94:
        v13 = CFSTR("WATCH_ROUTE_PLANNING_MAP");
        break;
      case 95:
        v13 = CFSTR("WATCH_NAV_WALKING_CONTROLS");
        break;
      case 96:
        v13 = CFSTR("WATCH_NAV_CYCLING_CONTROLS");
        break;
      case 97:
        v13 = CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL");
        break;
      case 98:
        v13 = CFSTR("WATCH_NAV_TRANSIT_CONTROLS");
        break;
      case 99:
        v13 = CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL");
        break;
      case 100:
        v13 = CFSTR("WATCH_NAV_DRIVING_CONTROLS");
        break;
      case 101:
        v13 = CFSTR("RESULTS_TRAY_SEARCH");
        break;
      case 102:
        v13 = CFSTR("RESULTS_TRAY_BROWSE");
        break;
      case 103:
        v13 = CFSTR("RESULTS_TRAY_FAVORITES");
        break;
      case 104:
        v13 = CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE");
        break;
      case 105:
        v13 = CFSTR("RESULTS_TRAY_CLUSTER");
        break;
      case 106:
        v13 = CFSTR("RESULTS_TRAY_VENUE_BROWSE");
        break;
      case 107:
        v13 = CFSTR("WATCH_MAP_RESULTS");
        break;
      case 108:
        v13 = CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW");
        break;
      case 109:
        v13 = CFSTR("WATCH_PLACES");
        break;
      case 110:
        v13 = CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW");
        break;
      case 111:
        v13 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL");
        break;
      case 112:
        v13 = CFSTR("DOWNLOADED_MAPS_DETAILS");
        break;
      case 113:
        v13 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL");
        break;
      case 114:
        v13 = CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP");
        break;
      case 115:
        v13 = CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP");
        break;
      case 116:
        v13 = CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP");
        break;
      case 117:
        v13 = CFSTR("WATCH_ROUTE_OPTIONS");
        break;
      case 118:
        v13 = CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP");
        break;
      case 119:
        v13 = CFSTR("WATCH_MORE_GUIDES");
        break;
      case 120:
        v13 = CFSTR("WATCH_RECENTLY_VIEWED");
        break;
      case 121:
        v13 = CFSTR("EV_SUCCESS_TRAY");
        break;
      case 122:
        v13 = CFSTR("PREFERRED_NETWORK_SELECTION_TRAY");
        break;
      case 123:
        v13 = CFSTR("PREFERRED_NETWORK_TRAY");
        break;
      case 124:
        v13 = CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 125:
        v13 = CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY");
        break;
      case 126:
        v13 = CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY");
        break;
      case 127:
        v13 = CFSTR("AC_KEYBOARD_TRAY");
        break;
      case 128:
        v13 = CFSTR("MORE_RELATED_TRAILS");
        break;
      case 129:
        v13 = CFSTR("MORE_RELATED_TRAILHEADS");
        break;
      case 130:
        v13 = CFSTR("ROUTING_TRAY_CUSTOM_ROUTE");
        break;
      case 131:
        v13 = CFSTR("CUSTOM_ROUTE_CREATION_TRAY");
        break;
      case 132:
        v13 = CFSTR("ROUTING_TRAY_CURATED_HIKE");
        break;
      case 133:
        v13 = CFSTR("MORE_CURATED_HIKES");
        break;
      case 134:
        v13 = CFSTR("CUSTOM_ROUTE_ONBOARDING");
        break;
      case 135:
        v13 = CFSTR("LIBRARY_ROUTES");
        break;
      case 136:
        v13 = CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 137:
        v13 = CFSTR("MY_LIBRARY");
        break;
      case 138:
        v13 = CFSTR("EDIT_NOTE_TRAY");
        break;
      case 139:
        v13 = CFSTR("CREATE_NOTE_TRAY");
        break;
      case 140:
        v13 = CFSTR("LIBRARY_PLACES");
        break;
      case 141:
        v13 = CFSTR("WATCH_ACCOUNT");
        break;
      case 142:
        v13 = CFSTR("WATCH_DOWNLOADED_MAPS");
        break;
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 276:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
      case 380:
      case 381:
      case 382:
      case 383:
      case 384:
      case 385:
      case 386:
      case 387:
      case 388:
      case 389:
      case 390:
      case 391:
      case 392:
      case 393:
      case 394:
      case 395:
      case 396:
      case 397:
      case 398:
      case 399:
      case 400:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
      case 423:
      case 424:
      case 425:
      case 426:
      case 427:
      case 428:
      case 429:
      case 430:
      case 431:
      case 432:
      case 433:
      case 434:
      case 435:
      case 436:
      case 437:
      case 438:
      case 439:
      case 440:
      case 441:
      case 442:
      case 443:
      case 444:
      case 445:
      case 446:
      case 447:
      case 448:
      case 449:
      case 450:
      case 451:
      case 452:
      case 453:
      case 454:
      case 455:
      case 456:
      case 457:
      case 458:
      case 459:
      case 460:
      case 461:
      case 462:
      case 463:
      case 464:
      case 465:
      case 466:
      case 467:
      case 468:
      case 469:
      case 470:
      case 471:
      case 472:
      case 473:
      case 474:
      case 475:
      case 476:
      case 477:
      case 478:
      case 479:
      case 480:
      case 481:
      case 482:
      case 483:
      case 484:
      case 485:
      case 486:
      case 487:
      case 488:
      case 489:
      case 490:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 700:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
        goto LABEL_60;
      case 201:
        v13 = CFSTR("PLACECARD_TRAY");
        break;
      case 202:
        v13 = CFSTR("WEB_MODULE");
        break;
      case 250:
        v13 = CFSTR("ADD_FAVORITE_TRAY");
        break;
      case 251:
        v13 = CFSTR("COLLECTION_LIST");
        break;
      case 252:
        v13 = CFSTR("COLLECTION_VIEW");
        break;
      case 253:
        v13 = CFSTR("FAVORITE_DETAILS");
        break;
      case 254:
        v13 = CFSTR("FAVORITES_TRAY");
        break;
      case 255:
        v13 = CFSTR("SHARED_COLLECTION");
        break;
      case 256:
        v13 = CFSTR("SHARED_COLLECTION_VIEW");
        break;
      case 257:
        v13 = CFSTR("RECENTLY_VIEWED");
        break;
      case 258:
        v13 = CFSTR("SHARED_WEB_COLLECTION");
        break;
      case 259:
        v13 = CFSTR("CURATED_COLLECTION_VIEW");
        break;
      case 260:
        v13 = CFSTR("FEATURED_COLLECTIONS");
        break;
      case 261:
        v13 = CFSTR("PUBLISHER_TRAY");
        break;
      case 262:
        v13 = CFSTR("SHARED_CURATED_COLLECTION_VIEW");
        break;
      case 263:
        v13 = CFSTR("CURATED_COLLECTION_NOTIFICATION");
        break;
      case 264:
        v13 = CFSTR("CURATED_COLLECTION_LIST");
        break;
      case 265:
        v13 = CFSTR("PUBLISHER_LIST");
        break;
      case 266:
        v13 = CFSTR("WATCH_CURATED_COLLECTION_VIEW");
        break;
      case 267:
        v13 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST");
        break;
      case 268:
        v13 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST");
        break;
      case 301:
        v13 = CFSTR("ROUTING_TRAY_DRIVING");
        break;
      case 302:
        v13 = CFSTR("ROUTING_TRAY_WALKING");
        break;
      case 303:
        v13 = CFSTR("ROUTING_TRAY_TRANSIT");
        break;
      case 304:
        v13 = CFSTR("ROUTING_TRAY_RIDESHARE");
        break;
      case 305:
        v13 = CFSTR("ROUTING_TRAY_CYCLING");
        break;
      case 306:
        v13 = CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW");
        break;
      case 401:
        v13 = CFSTR("NAV_TRAY_DRIVING");
        break;
      case 402:
        v13 = CFSTR("NAV_TRAY_WALKING");
        break;
      case 403:
        v13 = CFSTR("NAV_TRAY_TRANSIT");
        break;
      case 404:
        v13 = CFSTR("NAV_TRAY_CYCLING");
        break;
      case 501:
        v13 = CFSTR("MAP_PLACECARD");
        break;
      case 502:
        v13 = CFSTR("MAP_SEARCH");
        break;
      case 503:
        v13 = CFSTR("MAP_RESULTS");
        break;
      case 504:
        v13 = CFSTR("MAP_ROUTING");
        break;
      case 505:
        v13 = CFSTR("MAP_NAV");
        break;
      case 506:
        v13 = CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE");
        break;
      case 507:
        v13 = CFSTR("MAP_TRAFFIC_INCIDENT");
        break;
      case 508:
        v13 = CFSTR("MAP_FULL_SCREEN");
        break;
      case 509:
        v13 = CFSTR("MAP_DRIVE");
        break;
      case 510:
        v13 = CFSTR("MAP_LAUNCH_AND_GO");
        break;
      case 511:
        v13 = CFSTR("MAP_VIEW");
        break;
      case 601:
        v13 = CFSTR("MAPS_SETTINGS");
        break;
      case 602:
        v13 = CFSTR("MAPS_PREFERENCES");
        break;
      case 603:
        v13 = CFSTR("RAP");
        break;
      case 604:
        v13 = CFSTR("ROUTING_DRIVING_DETAILS");
        break;
      case 605:
        v13 = CFSTR("ROUTING_WALKING_DETAILS");
        break;
      case 606:
        v13 = CFSTR("ROUTING_TRANSIT_DETAILS");
        break;
      case 607:
        v13 = CFSTR("ROUTING_EDITOR");
        break;
      case 608:
        v13 = CFSTR("NAV_DRIVING_DETAILS");
        break;
      case 609:
        v13 = CFSTR("NAV_WALKING_DETAILS");
        break;
      case 610:
        v13 = CFSTR("NAV_TRANSIT_DETAILS");
        break;
      case 611:
        v13 = CFSTR("NAV_AUDIO_SETTINGS");
        break;
      case 612:
        v13 = CFSTR("PHOTO_VIEWER_ALL");
        break;
      case 613:
        v13 = CFSTR("PHOTO_VIEWER_SINGLE");
        break;
      case 614:
        v13 = CFSTR("ROUTE_OPTIONS_TRANSIT");
        break;
      case 615:
        v13 = CFSTR("TRAFFIC_INCIDENT_TRAY");
        break;
      case 616:
        v13 = CFSTR("NAV_DIRECTIONS_BANNER_DRIVING");
        break;
      case 617:
        v13 = CFSTR("NAV_DIRECTIONS_BANNER_WALKING");
        break;
      case 618:
        v13 = CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT");
        break;
      case 619:
        v13 = CFSTR("REFINE_SEARCH_SUGGESTION_AREA");
        break;
      case 620:
        v13 = CFSTR("ADD_PHOTO_SHEET");
        break;
      case 621:
        v13 = CFSTR("ADD_PLACE_SHEET");
        break;
      case 622:
        v13 = CFSTR("SHARE_SHEET");
        break;
      case 623:
        v13 = CFSTR("EDIT_LOCATION_SHEET");
        break;
      case 624:
        v13 = CFSTR("ADD_CONTACT_SHEET");
        break;
      case 625:
        v13 = CFSTR("EDIT_NAME_SHEET");
        break;
      case 626:
        v13 = CFSTR("DRIVING_NAV_SETTINGS");
        break;
      case 627:
        v13 = CFSTR("TRANSIT_SETTINGS");
        break;
      case 628:
        v13 = CFSTR("TRANSIT_ADVISORY_SHEET");
        break;
      case 629:
        v13 = CFSTR("REMOVE_CAR_SHEET");
        break;
      case 630:
        v13 = CFSTR("ROUTE_OPTIONS_DRIVING");
        break;
      case 631:
        v13 = CFSTR("ROUTE_OPTIONS_DATETIME");
        break;
      case 632:
        v13 = CFSTR("TRANSIT_ADVISORY_BANNER");
        break;
      case 633:
        v13 = CFSTR("BOOK_TABLE_SELECT_TIME");
        break;
      case 634:
        v13 = CFSTR("BOOK_TABLE_MORE_OPTIONS");
        break;
      case 635:
        v13 = CFSTR("BOOK_TABLE_READY");
        break;
      case 636:
        v13 = CFSTR("BOOK_TABLE_BOOKED");
        break;
      case 637:
        v13 = CFSTR("TRANSIT_LINE_CLUSTER_SHEET");
        break;
      case 638:
        v13 = CFSTR("TRANSIT_LINE_LIST_SHEET");
        break;
      case 639:
        v13 = CFSTR("TRANSIT_BALANCE_BANNER");
        break;
      case 640:
        v13 = CFSTR("WEATHER_ICON");
        break;
      case 641:
        v13 = CFSTR("HELP_IMPROVE_MAPS_DIALOG");
        break;
      case 642:
        v13 = CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 643:
        v13 = CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 644:
        v13 = CFSTR("FLOOR_PICKER");
        break;
      case 645:
        v13 = CFSTR("VENUE_LIST");
        break;
      case 646:
        v13 = CFSTR("AR_MODE");
        break;
      case 647:
        v13 = CFSTR("ROUTING_TRANSIT_TICKETS_SHEET");
        break;
      case 648:
        v13 = CFSTR("LINKED_SERVICE_HOURS");
        break;
      case 649:
        v13 = CFSTR("SHARE_ETA_TRAY");
        break;
      case 650:
        v13 = CFSTR("ETA_UPDATE_TRAY");
        break;
      case 651:
        v13 = CFSTR("SCHEDULECARD_TRAY");
        break;
      case 652:
        v13 = CFSTR("AR_NAV");
        break;
      case 653:
        v13 = CFSTR("TAP_TRANSIT_ACCESS_POINT");
        break;
      case 654:
        v13 = CFSTR("LOCATIONS_INSIDE");
        break;
      case 655:
        v13 = CFSTR("SIMILAR_LOCATIONS");
        break;
      case 656:
        v13 = CFSTR("LOCATIONS_AT_ADDRESS");
        break;
      case 657:
        v13 = CFSTR("NAV_DIRECTIONS_BANNER_CYCLING");
        break;
      case 658:
        v13 = CFSTR("ROUTE_OPTIONS_CYCLING");
        break;
      case 659:
        v13 = CFSTR("EV_CONNECTION_TRAY");
        break;
      case 660:
        v13 = CFSTR("VIRTUAL_GARAGE");
        break;
      case 661:
        v13 = CFSTR("VIRTUAL_GARAGE_BANNER");
        break;
      case 662:
        v13 = CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW");
        break;
      case 663:
        v13 = CFSTR("ADVISORY_DETAILS_PAGE");
        break;
      case 664:
        v13 = CFSTR("APP_CLIP_NOTIFICATION");
        break;
      case 665:
        v13 = CFSTR("PHOTO_VIEWER_GALLERY");
        break;
      case 666:
        v13 = CFSTR("RECOMMENDATION_CARD");
        break;
      case 667:
        v13 = CFSTR("INCIDENT_REPORT_TRAY");
        break;
      case 668:
        v13 = CFSTR("MAPS_WIDGET_DISPLAY");
        break;
      case 669:
        v13 = CFSTR("VISUAL_LOCATION_FRAMEWORK");
        break;
      case 670:
        v13 = CFSTR("APP_CLIP_TRAY");
        break;
      case 671:
        v13 = CFSTR("LICENSE_PLATE_SUGGESTION_PAGE");
        break;
      case 672:
        v13 = CFSTR("NOTIFICATION_ADD_PLATE");
        break;
      case 673:
        v13 = CFSTR("MAPS_RESULTS");
        break;
      case 674:
        v13 = CFSTR("MAPS_WIDGET_APP_CONNECTION");
        break;
      case 675:
        v13 = CFSTR("MAPS_WIDGET_CURRENT_LOCATION");
        break;
      case 676:
        v13 = CFSTR("MAPS_WIDGET_CURRENT_NAV");
        break;
      case 677:
        v13 = CFSTR("MAPS_WIDGET_ETA");
        break;
      case 678:
        v13 = CFSTR("MAPS_WIDGET_TRANSIT");
        break;
      case 679:
        v13 = CFSTR("MAPS_WIDGET_UPC_DESTINATION");
        break;
      case 680:
        v13 = CFSTR("WIDGET_CREATION_TRAY");
        break;
      case 681:
        v13 = CFSTR("MAPS_WIDGET_HOME");
        break;
      case 682:
        v13 = CFSTR("MAPS_WIDGET_PARKED_CAR");
        break;
      case 683:
        v13 = CFSTR("MAPS_WIDGET_POI");
        break;
      case 684:
        v13 = CFSTR("MAPS_WIDGET_SCHOOL");
        break;
      case 685:
        v13 = CFSTR("MAPS_WIDGET_WORK");
        break;
      case 686:
        v13 = CFSTR("AIRPORT_NOTIFICATION");
        break;
      case 687:
        v13 = CFSTR("MAPS_WIDGET_EMPTY");
        break;
      case 688:
        v13 = CFSTR("COARSE_LOCATION_OPTIONS_PROMPT");
        break;
      case 689:
        v13 = CFSTR("ALLOW_PRECISE_LOCATION_PROMPT");
        break;
      case 690:
        v13 = CFSTR("SHARE_MY_LOCATION");
        break;
      case 691:
        v13 = CFSTR("MARK_MY_LOCATION");
        break;
      case 692:
        v13 = CFSTR("AIRPORT_NOTIFICATION_WATCH");
        break;
      case 693:
        v13 = CFSTR("EDIT_FAVORITE");
        break;
      case 694:
        v13 = CFSTR("ROUTING_CYCLING_DETAILS");
        break;
      case 695:
        v13 = CFSTR("NAV_CYCLING_DETAILS");
        break;
      case 696:
        v13 = CFSTR("MAPS_SUGGESTION_WIDGET");
        break;
      case 697:
        v13 = CFSTR("ARP_TIPKIT");
        break;
      case 698:
        v13 = CFSTR("ARP_PRIVACY");
        break;
      case 699:
        v13 = CFSTR("ROUTE_OPTIONS_WALKING");
        break;
      case 701:
        v13 = CFSTR("SAFARI_SEARCH");
        break;
      case 702:
        v13 = CFSTR("SPOTLIGHT_SEARCH");
        break;
      case 703:
        v13 = CFSTR("SAFARI_MAPS_SEARCH_RESULTS");
        break;
      case 704:
        v13 = CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS");
        break;
      case 705:
        v13 = CFSTR("WIDGET_MAPS_DESTINATIONS");
        break;
      case 706:
        v13 = CFSTR("WIDGET_MAPS_TRANSIT");
        break;
      case 707:
        v13 = CFSTR("WIDGET_MAPS_NEARBY");
        break;
      case 708:
        v13 = CFSTR("NOTIFICATION_FIND_MY_CAR");
        break;
      case 709:
        v13 = CFSTR("CONTROL_CENTER");
        break;
      case 710:
        v13 = CFSTR("NOTIFICATION_CENTER");
        break;
      case 711:
        v13 = CFSTR("NOTIFICATION_DOOM");
        break;
      case 712:
        v13 = CFSTR("NOTIFICATION_VENUES");
        break;
      case 713:
        v13 = CFSTR("NOTIFICATION_RAP_UPDATE");
        break;
      case 714:
        v13 = CFSTR("NOTIFICATION_TRIP_CANCELLED");
        break;
      case 715:
        v13 = CFSTR("NOTIFICATION_STOP_SKIPPED");
        break;
      case 716:
        v13 = CFSTR("NOTIFICATION_TRIP_DELAYED");
        break;
      case 717:
        v13 = CFSTR("NOTIFICATION_RAP");
        break;
      case 718:
        v13 = CFSTR("NOTIFICATION_PROXY_AUTH");
        break;
      case 719:
        v13 = CFSTR("NOTIFICATION_PUSH_TO_DEVICE");
        break;
      case 720:
        v13 = CFSTR("NOTIFICATION_LOW_FUEL");
        break;
      case 721:
        v13 = CFSTR("NOTIFICATION_FIND_MY_CAR_RESET");
        break;
      case 722:
        v13 = CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS");
        break;
      case 723:
        v13 = CFSTR("NOTIFICATION_SHARED_ETA");
        break;
      case 724:
        v13 = CFSTR("NOTIFICATION_SHARED_ETA_UPDATE");
        break;
      case 725:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN");
        break;
      case 726:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_GENERAL");
        break;
      case 727:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_FLYOVER");
        break;
      case 728:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_TRANSIT");
        break;
      case 729:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_VENUES");
        break;
      case 730:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL");
        break;
      case 731:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE");
        break;
      case 732:
        v13 = CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND");
        break;
      case 733:
        v13 = CFSTR("APP_SHEET");
        break;
      case 734:
        v13 = CFSTR("CZ_ADVISORY_DETAILS_PAGE");
        break;
      case 735:
        v13 = CFSTR("SHARE_ETA_CONTACT_TRAY");
        break;
      case 736:
        v13 = CFSTR("SIRI_SHARE_ETA");
        break;
      case 737:
        v13 = CFSTR("SIRI_SUGGESTION_SHARED_ETA");
        break;
      case 738:
        v13 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY");
        break;
      case 739:
        v13 = CFSTR("INCIDENT_ALERT_TRAY");
        break;
      case 740:
        v13 = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY");
        break;
      case 741:
        v13 = CFSTR("RAP_INCIDENT_REPORT_VIEW");
        break;
      case 742:
        v13 = CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY");
        break;
      case 743:
        v13 = CFSTR("TRAFFIC_ADVISORY_SHEET");
        break;
      case 801:
        v13 = CFSTR("SIRI_PLUGIN_SNIPPET");
        break;
      case 802:
        v13 = CFSTR("SIRI_PLUGIN_COMMAND");
        break;
      case 803:
        v13 = CFSTR("SIRI_SEARCH_RESULT_LIST");
        break;
      case 804:
        v13 = CFSTR("SIRI_DISAMBIGUATION_LIST");
        break;
      case 805:
        v13 = CFSTR("SIRI_PLACE_SNIPPET");
        break;
      default:
        if (v12 != 901)
          goto LABEL_60;
        v13 = CFSTR("CHROME");
        break;
    }
  }
  if (a2)
    v14 = CFSTR("entryTarget");
  else
    v14 = CFSTR("entry_target");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 1) == 0)
  {
LABEL_11:
    if ((v7 & 4) == 0)
      goto LABEL_12;
    goto LABEL_550;
  }
LABEL_543:
  v15 = *(int *)(a1 + 16);
  if (v15 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E1C22EA8[v15];
  }
  if (a2)
    v17 = CFSTR("downloadSize");
  else
    v17 = CFSTR("download_size");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 4) == 0)
  {
LABEL_12:
    if ((v7 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_554;
  }
LABEL_550:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("zoomLevel");
  else
    v19 = CFSTR("zoom_level");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 0x10) == 0)
  {
LABEL_13:
    if ((v7 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_558;
  }
LABEL_554:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 29));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("downloadOnWifiOnly");
  else
    v21 = CFSTR("download_on_wifi_only");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 0x40) == 0)
  {
LABEL_14:
    if ((v7 & 8) == 0)
      return v4;
    goto LABEL_562;
  }
LABEL_558:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 31));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("optimizeStorage");
  else
    v23 = CFSTR("optimize_storage");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  if ((*(_BYTE *)(a1 + 36) & 8) != 0)
  {
LABEL_562:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("automaticUpdates");
    else
      v25 = CFSTR("automatic_updates");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateOfflineDownload _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateOfflineDownload)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateOfflineDownload *)-[GEOLogMsgStateOfflineDownload _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;

  v5 = a2;
  if (!a1)
    goto LABEL_1077;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_1077;
  if (a3)
    v6 = CFSTR("downloadCountry");
  else
    v6 = CFSTR("download_country");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setDownloadCountry:", v8);

  }
  if (a3)
    v9 = CFSTR("isDownloadInHomeMetro");
  else
    v9 = CFSTR("is_download_in_home_metro");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsDownloadInHomeMetro:", objc_msgSend(v10, "BOOLValue"));

  if (a3)
    v11 = CFSTR("regionTilesWereResized");
  else
    v11 = CFSTR("region_tiles_were_resized");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRegionTilesWereResized:", objc_msgSend(v12, "BOOLValue"));

  if (a3)
    v13 = CFSTR("entryTarget");
  else
    v13 = CFSTR("entry_target");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_UNKNOWN")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_POI")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_RESULT_LIST")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_POPULAR_NEARBY_LIST")) & 1) != 0)
    {
      v16 = 3;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_CALLOUT")) & 1) != 0)
    {
      v16 = 4;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_PIN")) & 1) != 0)
    {
      v16 = 5;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_DROPPED_PIN")) & 1) != 0)
    {
      v16 = 6;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UI_TARGET_TRANSIT_LINE")) & 1) != 0)
    {
      v16 = 7;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_TRAY")) & 1) != 0)
    {
      v16 = 8;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_TRAY_BROWSE")) & 1) != 0)
    {
      v16 = 9;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_TRAY_POPULAR_NEARBY")) & 1) != 0)
    {
      v16 = 10;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_TRAY_AC")) & 1) != 0)
    {
      v16 = 11;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_TRAY_AC_INTERMEDIATE")) & 1) != 0)
    {
      v16 = 12;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_TRAY_NO_QUERY")) & 1) != 0)
    {
      v16 = 13;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AR_WALKING_LEGAL_TRAY")) & 1) != 0)
    {
      v16 = 14;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAISE_TO_START_AR_TRAY")) & 1) != 0)
    {
      v16 = 15;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EVENTS_ADVISORY_DETAILS_PAGE")) & 1) != 0)
    {
      v16 = 16;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY_CARPLAY")) & 1) != 0)
    {
      v16 = 17;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HIGHLIGHTED_AREA")) & 1) != 0)
    {
      v16 = 18;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME")) & 1) != 0)
    {
      v16 = 19;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRAVEL_PREFERENCES_TRAY")) & 1) != 0)
    {
      v16 = 20;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULT_TRAY_SEARCH")) & 1) != 0)
    {
      v16 = 21;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SINGLE_CARD_FILTER")) & 1) != 0)
    {
      v16 = 22;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FULL_CARD_FILTER")) & 1) != 0)
    {
      v16 = 23;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ACCOUNT_PRIVACY_TRAY")) & 1) != 0)
    {
      v16 = 24;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("APPLE_RATINGS_HISTORY_TRAY")) & 1) != 0)
    {
      v16 = 25;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_FILTERED")) & 1) != 0)
    {
      v16 = 26;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CITY_MENU")) & 1) != 0)
    {
      v16 = 27;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED")) & 1) != 0)
    {
      v16 = 28;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ACCOUNT_TRAY")) & 1) != 0)
    {
      v16 = 29;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY")) & 1) != 0)
    {
      v16 = 30;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SUBMIT_TRIP_FEEDBACK")) & 1) != 0)
    {
      v16 = 31;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_PLACE_ISSUE_DETAILS")) & 1) != 0)
    {
      v16 = 32;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_GUIDES_DETAILS")) & 1) != 0)
    {
      v16 = 33;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_BAD_DIRECTIONS_DETAILS")) & 1) != 0)
    {
      v16 = 34;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_MAP_DETAILS")) & 1) != 0)
    {
      v16 = 35;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_COMPLICATION")) & 1) != 0)
    {
      v16 = 36;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_NAV_MENU")) & 1) != 0)
    {
      v16 = 37;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT")) & 1) != 0)
    {
      v16 = 38;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_REPORT_MENU")) & 1) != 0)
    {
      v16 = 39;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_CURATED_COLLECTION_MENU")) & 1) != 0)
    {
      v16 = 40;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_REPORT_CARD_DETAILS")) & 1) != 0)
    {
      v16 = 41;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT")) & 1) != 0)
    {
      v16 = 42;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_STREET_ISSUE_DETAILS")) & 1) != 0)
    {
      v16 = 43;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NEARBY_TRANSIT_CARD")) & 1) != 0)
    {
      v16 = 44;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_MENU")) & 1) != 0)
    {
      v16 = 45;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("GENERIC_ADVISORY_PAGE")) & 1) != 0)
    {
      v16 = 46;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PROFILE_TRAY")) & 1) != 0)
    {
      v16 = 47;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MEDIA_APP_MENU")) & 1) != 0)
    {
      v16 = 48;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TEMPLATE_PLACE_TRAY")) & 1) != 0)
    {
      v16 = 49;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP")) & 1) != 0)
    {
      v16 = 50;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ALLOW_NOTIFICATION_DIALOG")) & 1) != 0)
    {
      v16 = 51;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING")) & 1) != 0)
    {
      v16 = 52;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP")) & 1) != 0)
    {
      v16 = 53;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED")) & 1) != 0)
    {
      v16 = 54;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_PROMPT")) & 1) != 0)
    {
      v16 = 55;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU")) & 1) != 0)
    {
      v16 = 56;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACECARD_TRAY_VENDORS_MENU")) & 1) != 0)
    {
      v16 = 57;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING")) & 1) != 0)
    {
      v16 = 58;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_TRAY")) & 1) != 0)
    {
      v16 = 59;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING")) & 1) != 0)
    {
      v16 = 60;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACECARD_SHOWCASE_MENU")) & 1) != 0)
    {
      v16 = 61;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_INLINE_ADD_DETAILS")) & 1) != 0)
    {
      v16 = 62;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_EDIT_MENU_DETAILS")) & 1) != 0)
    {
      v16 = 63;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SUBMISSION_PROMPT")) & 1) != 0)
    {
      v16 = 64;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_PLACECARD_EDIT_MENU")) & 1) != 0)
    {
      v16 = 65;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE")) & 1) != 0)
    {
      v16 = 66;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("INCIDENT_REPORT_MENU")) & 1) != 0)
    {
      v16 = 67;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES_STEPS")) & 1) != 0)
    {
      v16 = 68;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES")) & 1) != 0)
    {
      v16 = 69;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
    {
      v16 = 70;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
    {
      v16 = 71;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST")) & 1) != 0)
    {
      v16 = 72;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY")) & 1) != 0)
    {
      v16 = 73;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_ARP")) & 1) != 0)
    {
      v16 = 74;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT")) & 1) != 0)
    {
      v16 = 75;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("YOUR_PHOTOS_ALBUM")) & 1) != 0)
    {
      v16 = 76;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ARP_PHOTO_CREDIT")) & 1) != 0)
    {
      v16 = 77;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_OUTREACH_REVIEWED_REPORT")) & 1) != 0)
    {
      v16 = 78;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_REPORT_MENU_MORE")) & 1) != 0)
    {
      v16 = 79;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_MAPS_SETTINGS")) & 1) != 0)
    {
      v16 = 80;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OFFLINE_FEATURE_PROMPT")) & 1) != 0)
    {
      v16 = 81;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EXPIRED_MAPS_DETAILS")) & 1) != 0)
    {
      v16 = 82;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_VIEW")) & 1) != 0)
    {
      v16 = 83;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_OFFLINE")) & 1) != 0)
    {
      v16 = 84;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
    {
      v16 = 85;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT")) & 1) != 0)
    {
      v16 = 86;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
    {
      v16 = 87;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OFFLINE_MAPS_MANAGEMENT")) & 1) != 0)
    {
      v16 = 88;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("REGION_SELECTOR")) & 1) != 0)
    {
      v16 = 89;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT")) & 1) != 0)
    {
      v16 = 90;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
    {
      v16 = 91;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_PLACE")) & 1) != 0)
    {
      v16 = 92;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL")) & 1) != 0)
    {
      v16 = 93;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_MAP")) & 1) != 0)
    {
      v16 = 94;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_CONTROLS")) & 1) != 0)
    {
      v16 = 95;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_CONTROLS")) & 1) != 0)
    {
      v16 = 96;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL")) & 1) != 0)
    {
      v16 = 97;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_CONTROLS")) & 1) != 0)
    {
      v16 = 98;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL")) & 1) != 0)
    {
      v16 = 99;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_CONTROLS")) & 1) != 0)
    {
      v16 = 100;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH")) & 1) != 0)
    {
      v16 = 101;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULTS_TRAY_BROWSE")) & 1) != 0)
    {
      v16 = 102;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULTS_TRAY_FAVORITES")) & 1) != 0)
    {
      v16 = 103;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
    {
      v16 = 104;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULTS_TRAY_CLUSTER")) & 1) != 0)
    {
      v16 = 105;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RESULTS_TRAY_VENUE_BROWSE")) & 1) != 0)
    {
      v16 = 106;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_MAP_RESULTS")) & 1) != 0)
    {
      v16 = 107;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW")) & 1) != 0)
    {
      v16 = 108;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_PLACES")) & 1) != 0)
    {
      v16 = 109;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW")) & 1) != 0)
    {
      v16 = 110;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL")) & 1) != 0)
    {
      v16 = 111;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DOWNLOADED_MAPS_DETAILS")) & 1) != 0)
    {
      v16 = 112;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL")) & 1) != 0)
    {
      v16 = 113;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP")) & 1) != 0)
    {
      v16 = 114;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP")) & 1) != 0)
    {
      v16 = 115;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP")) & 1) != 0)
    {
      v16 = 116;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_OPTIONS")) & 1) != 0)
    {
      v16 = 117;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP")) & 1) != 0)
    {
      v16 = 118;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_MORE_GUIDES")) & 1) != 0)
    {
      v16 = 119;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_RECENTLY_VIEWED")) & 1) != 0)
    {
      v16 = 120;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EV_SUCCESS_TRAY")) & 1) != 0)
    {
      v16 = 121;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PREFERRED_NETWORK_SELECTION_TRAY")) & 1) != 0)
    {
      v16 = 122;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PREFERRED_NETWORK_TRAY")) & 1) != 0)
    {
      v16 = 123;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
    {
      v16 = 124;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
    {
      v16 = 125;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
    {
      v16 = 126;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AC_KEYBOARD_TRAY")) & 1) != 0)
    {
      v16 = 127;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MORE_RELATED_TRAILS")) & 1) != 0)
    {
      v16 = 128;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MORE_RELATED_TRAILHEADS")) & 1) != 0)
    {
      v16 = 129;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_CUSTOM_ROUTE")) & 1) != 0)
    {
      v16 = 130;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CUSTOM_ROUTE_CREATION_TRAY")) & 1) != 0)
    {
      v16 = 131;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_CURATED_HIKE")) & 1) != 0)
    {
      v16 = 132;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MORE_CURATED_HIKES")) & 1) != 0)
    {
      v16 = 133;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CUSTOM_ROUTE_ONBOARDING")) & 1) != 0)
    {
      v16 = 134;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LIBRARY_ROUTES")) & 1) != 0)
    {
      v16 = 135;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
    {
      v16 = 136;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MY_LIBRARY")) & 1) != 0)
    {
      v16 = 137;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EDIT_NOTE_TRAY")) & 1) != 0)
    {
      v16 = 138;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CREATE_NOTE_TRAY")) & 1) != 0)
    {
      v16 = 139;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LIBRARY_PLACES")) & 1) != 0)
    {
      v16 = 140;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ACCOUNT")) & 1) != 0)
    {
      v16 = 141;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_DOWNLOADED_MAPS")) & 1) != 0)
    {
      v16 = 142;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACECARD_TRAY")) & 1) != 0)
    {
      v16 = 201;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WEB_MODULE")) & 1) != 0)
    {
      v16 = 202;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADD_FAVORITE_TRAY")) & 1) != 0)
    {
      v16 = 250;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("COLLECTION_LIST")) & 1) != 0)
    {
      v16 = 251;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("COLLECTION_VIEW")) & 1) != 0)
    {
      v16 = 252;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FAVORITE_DETAILS")) & 1) != 0)
    {
      v16 = 253;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FAVORITES_TRAY")) & 1) != 0)
    {
      v16 = 254;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARED_COLLECTION")) & 1) != 0)
    {
      v16 = 255;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARED_COLLECTION_VIEW")) & 1) != 0)
    {
      v16 = 256;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RECENTLY_VIEWED")) & 1) != 0)
    {
      v16 = 257;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARED_WEB_COLLECTION")) & 1) != 0)
    {
      v16 = 258;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CURATED_COLLECTION_VIEW")) & 1) != 0)
    {
      v16 = 259;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEATURED_COLLECTIONS")) & 1) != 0)
    {
      v16 = 260;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PUBLISHER_TRAY")) & 1) != 0)
    {
      v16 = 261;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARED_CURATED_COLLECTION_VIEW")) & 1) != 0)
    {
      v16 = 262;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CURATED_COLLECTION_NOTIFICATION")) & 1) != 0)
    {
      v16 = 263;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CURATED_COLLECTION_LIST")) & 1) != 0)
    {
      v16 = 264;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PUBLISHER_LIST")) & 1) != 0)
    {
      v16 = 265;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_CURATED_COLLECTION_VIEW")) & 1) != 0)
    {
      v16 = 266;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST")) & 1) != 0)
    {
      v16 = 267;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST")) & 1) != 0)
    {
      v16 = 268;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_DRIVING")) & 1) != 0)
    {
      v16 = 301;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_WALKING")) & 1) != 0)
    {
      v16 = 302;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_TRANSIT")) & 1) != 0)
    {
      v16 = 303;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE")) & 1) != 0)
    {
      v16 = 304;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_CYCLING")) & 1) != 0)
    {
      v16 = 305;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW")) & 1) != 0)
    {
      v16 = 306;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_TRAY_DRIVING")) & 1) != 0)
    {
      v16 = 401;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_TRAY_WALKING")) & 1) != 0)
    {
      v16 = 402;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_TRAY_TRANSIT")) & 1) != 0)
    {
      v16 = 403;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_TRAY_CYCLING")) & 1) != 0)
    {
      v16 = 404;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_PLACECARD")) & 1) != 0)
    {
      v16 = 501;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_SEARCH")) & 1) != 0)
    {
      v16 = 502;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_RESULTS")) & 1) != 0)
    {
      v16 = 503;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_ROUTING")) & 1) != 0)
    {
      v16 = 504;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_NAV")) & 1) != 0)
    {
      v16 = 505;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE")) & 1) != 0)
    {
      v16 = 506;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_TRAFFIC_INCIDENT")) & 1) != 0)
    {
      v16 = 507;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_FULL_SCREEN")) & 1) != 0)
    {
      v16 = 508;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_DRIVE")) & 1) != 0)
    {
      v16 = 509;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_LAUNCH_AND_GO")) & 1) != 0)
    {
      v16 = 510;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_VIEW")) & 1) != 0)
    {
      v16 = 511;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_SETTINGS")) & 1) != 0)
    {
      v16 = 601;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_PREFERENCES")) & 1) != 0)
    {
      v16 = 602;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP")) & 1) != 0)
    {
      v16 = 603;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_DRIVING_DETAILS")) & 1) != 0)
    {
      v16 = 604;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_WALKING_DETAILS")) & 1) != 0)
    {
      v16 = 605;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRANSIT_DETAILS")) & 1) != 0)
    {
      v16 = 606;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_EDITOR")) & 1) != 0)
    {
      v16 = 607;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_DRIVING_DETAILS")) & 1) != 0)
    {
      v16 = 608;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_WALKING_DETAILS")) & 1) != 0)
    {
      v16 = 609;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_TRANSIT_DETAILS")) & 1) != 0)
    {
      v16 = 610;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_AUDIO_SETTINGS")) & 1) != 0)
    {
      v16 = 611;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PHOTO_VIEWER_ALL")) & 1) != 0)
    {
      v16 = 612;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PHOTO_VIEWER_SINGLE")) & 1) != 0)
    {
      v16 = 613;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTE_OPTIONS_TRANSIT")) & 1) != 0)
    {
      v16 = 614;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_TRAY")) & 1) != 0)
    {
      v16 = 615;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_DRIVING")) & 1) != 0)
    {
      v16 = 616;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_WALKING")) & 1) != 0)
    {
      v16 = 617;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT")) & 1) != 0)
    {
      v16 = 618;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("REFINE_SEARCH_SUGGESTION_AREA")) & 1) != 0)
    {
      v16 = 619;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADD_PHOTO_SHEET")) & 1) != 0)
    {
      v16 = 620;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADD_PLACE_SHEET")) & 1) != 0)
    {
      v16 = 621;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARE_SHEET")) & 1) != 0)
    {
      v16 = 622;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EDIT_LOCATION_SHEET")) & 1) != 0)
    {
      v16 = 623;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADD_CONTACT_SHEET")) & 1) != 0)
    {
      v16 = 624;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EDIT_NAME_SHEET")) & 1) != 0)
    {
      v16 = 625;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DRIVING_NAV_SETTINGS")) & 1) != 0)
    {
      v16 = 626;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRANSIT_SETTINGS")) & 1) != 0)
    {
      v16 = 627;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_SHEET")) & 1) != 0)
    {
      v16 = 628;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("REMOVE_CAR_SHEET")) & 1) != 0)
    {
      v16 = 629;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DRIVING")) & 1) != 0)
    {
      v16 = 630;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DATETIME")) & 1) != 0)
    {
      v16 = 631;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_BANNER")) & 1) != 0)
    {
      v16 = 632;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BOOK_TABLE_SELECT_TIME")) & 1) != 0)
    {
      v16 = 633;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BOOK_TABLE_MORE_OPTIONS")) & 1) != 0)
    {
      v16 = 634;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BOOK_TABLE_READY")) & 1) != 0)
    {
      v16 = 635;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BOOK_TABLE_BOOKED")) & 1) != 0)
    {
      v16 = 636;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRANSIT_LINE_CLUSTER_SHEET")) & 1) != 0)
    {
      v16 = 637;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRANSIT_LINE_LIST_SHEET")) & 1) != 0)
    {
      v16 = 638;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRANSIT_BALANCE_BANNER")) & 1) != 0)
    {
      v16 = 639;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WEATHER_ICON")) & 1) != 0)
    {
      v16 = 640;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HELP_IMPROVE_MAPS_DIALOG")) & 1) != 0)
    {
      v16 = 641;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
    {
      v16 = 642;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
    {
      v16 = 643;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FLOOR_PICKER")) & 1) != 0)
    {
      v16 = 644;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VENUE_LIST")) & 1) != 0)
    {
      v16 = 645;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AR_MODE")) & 1) != 0)
    {
      v16 = 646;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRANSIT_TICKETS_SHEET")) & 1) != 0)
    {
      v16 = 647;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LINKED_SERVICE_HOURS")) & 1) != 0)
    {
      v16 = 648;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARE_ETA_TRAY")) & 1) != 0)
    {
      v16 = 649;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ETA_UPDATE_TRAY")) & 1) != 0)
    {
      v16 = 650;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SCHEDULECARD_TRAY")) & 1) != 0)
    {
      v16 = 651;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AR_NAV")) & 1) != 0)
    {
      v16 = 652;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TAP_TRANSIT_ACCESS_POINT")) & 1) != 0)
    {
      v16 = 653;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATIONS_INSIDE")) & 1) != 0)
    {
      v16 = 654;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIMILAR_LOCATIONS")) & 1) != 0)
    {
      v16 = 655;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATIONS_AT_ADDRESS")) & 1) != 0)
    {
      v16 = 656;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_CYCLING")) & 1) != 0)
    {
      v16 = 657;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTE_OPTIONS_CYCLING")) & 1) != 0)
    {
      v16 = 658;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EV_CONNECTION_TRAY")) & 1) != 0)
    {
      v16 = 659;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VIRTUAL_GARAGE")) & 1) != 0)
    {
      v16 = 660;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_BANNER")) & 1) != 0)
    {
      v16 = 661;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW")) & 1) != 0)
    {
      v16 = 662;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADVISORY_DETAILS_PAGE")) & 1) != 0)
    {
      v16 = 663;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("APP_CLIP_NOTIFICATION")) & 1) != 0)
    {
      v16 = 664;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PHOTO_VIEWER_GALLERY")) & 1) != 0)
    {
      v16 = 665;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RECOMMENDATION_CARD")) & 1) != 0)
    {
      v16 = 666;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY")) & 1) != 0)
    {
      v16 = 667;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_DISPLAY")) & 1) != 0)
    {
      v16 = 668;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VISUAL_LOCATION_FRAMEWORK")) & 1) != 0)
    {
      v16 = 669;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("APP_CLIP_TRAY")) & 1) != 0)
    {
      v16 = 670;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LICENSE_PLATE_SUGGESTION_PAGE")) & 1) != 0)
    {
      v16 = 671;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_ADD_PLATE")) & 1) != 0)
    {
      v16 = 672;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_RESULTS")) & 1) != 0)
    {
      v16 = 673;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_APP_CONNECTION")) & 1) != 0)
    {
      v16 = 674;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_LOCATION")) & 1) != 0)
    {
      v16 = 675;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_NAV")) & 1) != 0)
    {
      v16 = 676;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_ETA")) & 1) != 0)
    {
      v16 = 677;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_TRANSIT")) & 1) != 0)
    {
      v16 = 678;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_UPC_DESTINATION")) & 1) != 0)
    {
      v16 = 679;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WIDGET_CREATION_TRAY")) & 1) != 0)
    {
      v16 = 680;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_HOME")) & 1) != 0)
    {
      v16 = 681;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_PARKED_CAR")) & 1) != 0)
    {
      v16 = 682;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_POI")) & 1) != 0)
    {
      v16 = 683;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_SCHOOL")) & 1) != 0)
    {
      v16 = 684;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_WORK")) & 1) != 0)
    {
      v16 = 685;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION")) & 1) != 0)
    {
      v16 = 686;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WIDGET_EMPTY")) & 1) != 0)
    {
      v16 = 687;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("COARSE_LOCATION_OPTIONS_PROMPT")) & 1) != 0)
    {
      v16 = 688;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ALLOW_PRECISE_LOCATION_PROMPT")) & 1) != 0)
    {
      v16 = 689;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARE_MY_LOCATION")) & 1) != 0)
    {
      v16 = 690;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MARK_MY_LOCATION")) & 1) != 0)
    {
      v16 = 691;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION_WATCH")) & 1) != 0)
    {
      v16 = 692;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EDIT_FAVORITE")) & 1) != 0)
    {
      v16 = 693;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_CYCLING_DETAILS")) & 1) != 0)
    {
      v16 = 694;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NAV_CYCLING_DETAILS")) & 1) != 0)
    {
      v16 = 695;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_SUGGESTION_WIDGET")) & 1) != 0)
    {
      v16 = 696;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ARP_TIPKIT")) & 1) != 0)
    {
      v16 = 697;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ARP_PRIVACY")) & 1) != 0)
    {
      v16 = 698;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTE_OPTIONS_WALKING")) & 1) != 0)
    {
      v16 = 699;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SAFARI_SEARCH")) & 1) != 0)
    {
      v16 = 701;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPOTLIGHT_SEARCH")) & 1) != 0)
    {
      v16 = 702;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SAFARI_MAPS_SEARCH_RESULTS")) & 1) != 0)
    {
      v16 = 703;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS")) & 1) != 0)
    {
      v16 = 704;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WIDGET_MAPS_DESTINATIONS")) & 1) != 0)
    {
      v16 = 705;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WIDGET_MAPS_TRANSIT")) & 1) != 0)
    {
      v16 = 706;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WIDGET_MAPS_NEARBY")) & 1) != 0)
    {
      v16 = 707;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR")) & 1) != 0)
    {
      v16 = 708;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CONTROL_CENTER")) & 1) != 0)
    {
      v16 = 709;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_CENTER")) & 1) != 0)
    {
      v16 = 710;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_DOOM")) & 1) != 0)
    {
      v16 = 711;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_VENUES")) & 1) != 0)
    {
      v16 = 712;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_RAP_UPDATE")) & 1) != 0)
    {
      v16 = 713;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_CANCELLED")) & 1) != 0)
    {
      v16 = 714;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_STOP_SKIPPED")) & 1) != 0)
    {
      v16 = 715;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_DELAYED")) & 1) != 0)
    {
      v16 = 716;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_RAP")) & 1) != 0)
    {
      v16 = 717;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_PROXY_AUTH")) & 1) != 0)
    {
      v16 = 718;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_PUSH_TO_DEVICE")) & 1) != 0)
    {
      v16 = 719;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_LOW_FUEL")) & 1) != 0)
    {
      v16 = 720;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR_RESET")) & 1) != 0)
    {
      v16 = 721;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS")) & 1) != 0)
    {
      v16 = 722;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA")) & 1) != 0)
    {
      v16 = 723;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA_UPDATE")) & 1) != 0)
    {
      v16 = 724;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v16 = 725;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_GENERAL")) & 1) != 0)
    {
      v16 = 726;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_FLYOVER")) & 1) != 0)
    {
      v16 = 727;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_TRANSIT")) & 1) != 0)
    {
      v16 = 728;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_VENUES")) & 1) != 0)
    {
      v16 = 729;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL")) & 1) != 0)
    {
      v16 = 730;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE")) & 1) != 0)
    {
      v16 = 731;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND")) & 1) != 0)
    {
      v16 = 732;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("APP_SHEET")) & 1) != 0)
    {
      v16 = 733;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CZ_ADVISORY_DETAILS_PAGE")) & 1) != 0)
    {
      v16 = 734;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SHARE_ETA_CONTACT_TRAY")) & 1) != 0)
    {
      v16 = 735;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SHARE_ETA")) & 1) != 0)
    {
      v16 = 736;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA")) & 1) != 0)
    {
      v16 = 737;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY")) & 1) != 0)
    {
      v16 = 738;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("INCIDENT_ALERT_TRAY")) & 1) != 0)
    {
      v16 = 739;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY")) & 1) != 0)
    {
      v16 = 740;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_INCIDENT_REPORT_VIEW")) & 1) != 0)
    {
      v16 = 741;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY")) & 1) != 0)
    {
      v16 = 742;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRAFFIC_ADVISORY_SHEET")) & 1) != 0)
    {
      v16 = 743;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_PLUGIN_SNIPPET")) & 1) != 0)
    {
      v16 = 801;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_PLUGIN_COMMAND")) & 1) != 0)
    {
      v16 = 802;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_SEARCH_RESULT_LIST")) & 1) != 0)
    {
      v16 = 803;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_DISAMBIGUATION_LIST")) & 1) != 0)
    {
      v16 = 804;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIRI_PLACE_SNIPPET")) & 1) != 0)
    {
      v16 = 805;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CHROME")) & 1) != 0)
    {
      v16 = 901;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_NAV")) & 1) != 0)
    {
      v16 = 1001;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_EXPLORE")) & 1) != 0)
    {
      v16 = 1002;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_DESTINATIONS")) & 1) != 0)
    {
      v16 = 1003;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_TRAFFIC_INCIDENT")) & 1) != 0)
    {
      v16 = 1004;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_CONTROL")) & 1) != 0)
    {
      v16 = 1005;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_PROACTIVE")) & 1) != 0)
    {
      v16 = 1006;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_ROUTING")) & 1) != 0)
    {
      v16 = 1007;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_MORE_ROUTES")) & 1) != 0)
    {
      v16 = 1008;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
    {
      v16 = 1009;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_SEARCH")) & 1) != 0)
    {
      v16 = 1010;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_SEARCH_RESULTS")) & 1) != 0)
    {
      v16 = 1011;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_FAVORITES")) & 1) != 0)
    {
      v16 = 1012;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_NAV_CONFIRMATION")) & 1) != 0)
    {
      v16 = 1013;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_DESTINATION_SHARING")) & 1) != 0)
    {
      v16 = 1014;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_BATTERY")) & 1) != 0)
    {
      v16 = 1015;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_DOOM")) & 1) != 0)
    {
      v16 = 1016;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_FUEL")) & 1) != 0)
    {
      v16 = 1017;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_HYBRID")) & 1) != 0)
    {
      v16 = 1018;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_SHARE_ETA_TRAY")) & 1) != 0)
    {
      v16 = 1019;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_ETA_UPDATE_TRAY")) & 1) != 0)
    {
      v16 = 1020;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_ACTION_TRAY")) & 1) != 0)
    {
      v16 = 1021;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_PLACECARD")) & 1) != 0)
    {
      v16 = 1022;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_KEYBOARD")) & 1) != 0)
    {
      v16 = 1023;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_UI_TARGET_UNKNOWN")) & 1) != 0)
    {
      v16 = 1024;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CARPLAY_EDIT_STOPS")) & 1) != 0)
    {
      v16 = 1025;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_DIRECTIONS_MENU")) & 1) != 0)
    {
      v16 = 1100;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST")) & 1) != 0)
    {
      v16 = 1101;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1102;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM")) & 1) != 0)
    {
      v16 = 1103;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM")) & 1) != 0)
    {
      v16 = 1104;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM")) & 1) != 0)
    {
      v16 = 1105;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_TRANSIT_MENU")) & 1) != 0)
    {
      v16 = 1106;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_STATION_MAP")) & 1) != 0)
    {
      v16 = 1107;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_STATION_MENU")) & 1) != 0)
    {
      v16 = 1108;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP")) & 1) != 0)
    {
      v16 = 1109;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM")) & 1) != 0)
    {
      v16 = 1110;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_STATION_CLOSED_FORM")) & 1) != 0)
    {
      v16 = 1111;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LINE_MAP")) & 1) != 0)
    {
      v16 = 1112;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LINE_MENU")) & 1) != 0)
    {
      v16 = 1113;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LINE_NAME_FORM")) & 1) != 0)
    {
      v16 = 1114;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LINE_SHAPE_FORM")) & 1) != 0)
    {
      v16 = 1115;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM")) & 1) != 0)
    {
      v16 = 1116;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_PLACE_MENU")) & 1) != 0)
    {
      v16 = 1117;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_POI_MAP")) & 1) != 0)
    {
      v16 = 1118;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_CATEGORY_LIST")) & 1) != 0)
    {
      v16 = 1119;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_POI_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1120;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_STREET_MAP")) & 1) != 0)
    {
      v16 = 1121;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_STREET_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1122;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_OTHER_MAP")) & 1) != 0)
    {
      v16 = 1123;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_OTHER_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1124;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_CAMERA")) & 1) != 0)
    {
      v16 = 1125;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LABEL_MAP")) & 1) != 0)
    {
      v16 = 1126;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LABEL_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1127;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SEARCH_MENU")) & 1) != 0)
    {
      v16 = 1128;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM")) & 1) != 0)
    {
      v16 = 1129;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM")) & 1) != 0)
    {
      v16 = 1130;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP")) & 1) != 0)
    {
      v16 = 1131;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1132;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_MAP")) & 1) != 0)
    {
      v16 = 1133;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1134;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_OTHER_FORM")) & 1) != 0)
    {
      v16 = 1135;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_PRIVACY")) & 1) != 0)
    {
      v16 = 1136;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_CONFIRMATION")) & 1) != 0)
    {
      v16 = 1137;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_POI_MENU")) & 1) != 0)
    {
      v16 = 1138;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU")) & 1) != 0)
    {
      v16 = 1139;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_A_PLACE_MAP")) & 1) != 0)
    {
      v16 = 1140;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_POI_LOCATION_MAP")) & 1) != 0)
    {
      v16 = 1141;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP")) & 1) != 0)
    {
      v16 = 1142;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_POI_CLOSED_FORM")) & 1) != 0)
    {
      v16 = 1143;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_CLAIM_BUSINESS_DIALOG")) & 1) != 0)
    {
      v16 = 1144;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_BRAND_MENU")) & 1) != 0)
    {
      v16 = 1145;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_BRAND_DETAILS_FORM")) & 1) != 0)
    {
      v16 = 1146;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM")) & 1) != 0)
    {
      v16 = 1147;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM")) & 1) != 0)
    {
      v16 = 1148;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_BLURRING_FORM")) & 1) != 0)
    {
      v16 = 1149;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM")) & 1) != 0)
    {
      v16 = 1150;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_MENU")) & 1) != 0)
    {
      v16 = 1151;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM")) & 1) != 0)
    {
      v16 = 1152;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU")) & 1) != 0)
    {
      v16 = 1153;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LIGHTWEIGHT")) & 1) != 0)
    {
      v16 = 1154;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_EDIT_PLACE_DETAILS")) & 1) != 0)
    {
      v16 = 1155;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_CATEGORY")) & 1) != 0)
    {
      v16 = 1156;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_HOURS")) & 1) != 0)
    {
      v16 = 1157;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_EDIT_LOCATION")) & 1) != 0)
    {
      v16 = 1158;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_EDIT_ENTRY_POINT")) & 1) != 0)
    {
      v16 = 1159;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_LOOK_AROUND")) & 1) != 0)
    {
      v16 = 1160;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAP_ADD_ENTRY_POINT")) & 1) != 0)
    {
      v16 = 1161;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_MAIN_MENU")) & 1) != 0)
    {
      v16 = 1201;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_MAIN_PRESS_MENU")) & 1) != 0)
    {
      v16 = 1202;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SEARCH")) & 1) != 0)
    {
      v16 = 1203;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_DICTATION")) & 1) != 0)
    {
      v16 = 1204;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_FAVORITES")) & 1) != 0)
    {
      v16 = 1205;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SUB_CATEGORY_LIST")) & 1) != 0)
    {
      v16 = 1206;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_LIST")) & 1) != 0)
    {
      v16 = 1207;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_MAP_VIEW")) & 1) != 0)
    {
      v16 = 1208;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_PLACECARD")) & 1) != 0)
    {
      v16 = 1209;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING")) & 1) != 0)
    {
      v16 = 1210;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_DETAILS")) & 1) != 0)
    {
      v16 = 1211;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_TBT")) & 1) != 0)
    {
      v16 = 1212;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_MAP")) & 1) != 0)
    {
      v16 = 1213;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_PRESS_MENU")) & 1) != 0)
    {
      v16 = 1214;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_MAP_PRESS_MENU")) & 1) != 0)
    {
      v16 = 1215;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTING_PRESS_MENU")) & 1) != 0)
    {
      v16 = 1216;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_TRANSIT_MAP_VIEW")) & 1) != 0)
    {
      v16 = 1217;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SCRIBBLE")) & 1) != 0)
    {
      v16 = 1218;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_COLLECTION_VIEW")) & 1) != 0)
    {
      v16 = 1219;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING")) & 1) != 0)
    {
      v16 = 1220;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING")) & 1) != 0)
    {
      v16 = 1221;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT")) & 1) != 0)
    {
      v16 = 1222;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_PAIRED_DEVICE")) & 1) != 0)
    {
      v16 = 1223;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_SPLIT")) & 1) != 0)
    {
      v16 = 1224;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_PLATTER")) & 1) != 0)
    {
      v16 = 1225;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_MAP")) & 1) != 0)
    {
      v16 = 1226;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_SPLIT")) & 1) != 0)
    {
      v16 = 1227;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_PLATTER")) & 1) != 0)
    {
      v16 = 1228;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_MAP")) & 1) != 0)
    {
      v16 = 1229;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_SPLIT")) & 1) != 0)
    {
      v16 = 1230;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_PLATTER")) & 1) != 0)
    {
      v16 = 1231;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_MAP")) & 1) != 0)
    {
      v16 = 1232;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_INFO")) & 1) != 0)
    {
      v16 = 1233;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_MAP")) & 1) != 0)
    {
      v16 = 1234;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_PLATTER")) & 1) != 0)
    {
      v16 = 1235;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_SPLIT")) & 1) != 0)
    {
      v16 = 1236;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING")) & 1) != 0)
    {
      v16 = 1237;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SEARCH_INPUT")) & 1) != 0)
    {
      v16 = 1238;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
    {
      v16 = 1239;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
    {
      v16 = 1240;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_LIST")) & 1) != 0)
    {
      v16 = 1301;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_FORM")) & 1) != 0)
    {
      v16 = 1302;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_LABEL_FORM")) & 1) != 0)
    {
      v16 = 1303;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_EDIT_MAP")) & 1) != 0)
    {
      v16 = 1304;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION")) & 1) != 0)
    {
      v16 = 1305;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG")) & 1) != 0)
    {
      v16 = 1306;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_INFO")) & 1) != 0)
    {
      v16 = 1307;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH")) & 1) != 0)
    {
      v16 = 1308;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS")) & 1) != 0)
    {
      v16 = 1309;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FAVORITE_SEARCH")) & 1) != 0)
    {
      v16 = 1310;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FAVORITE_LIST")) & 1) != 0)
    {
      v16 = 1311;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FAVORITE_INFO")) & 1) != 0)
    {
      v16 = 1312;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY")) & 1) != 0)
    {
      v16 = 1313;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS")) & 1) != 0)
    {
      v16 = 1401;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING")) & 1) != 0)
    {
      v16 = 1402;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING")) & 1) != 0)
    {
      v16 = 1403;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED")) & 1) != 0)
    {
      v16 = 1404;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG")) & 1) != 0)
    {
      v16 = 1405;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK")) & 1) != 0)
    {
      v16 = 1406;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL")) & 1) != 0)
    {
      v16 = 1407;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACECARD_HEADER")) & 1) != 0)
    {
      v16 = 1501;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACECARD_ADDRESS")) & 1) != 0)
    {
      v16 = 1502;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACECARD_PHONE")) & 1) != 0)
    {
      v16 = 1503;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACECARD_URL")) & 1) != 0)
    {
      v16 = 1504;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MENU_ITEM_DARK_MAP")) & 1) != 0)
    {
      v16 = 1601;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_PIP")) & 1) != 0)
    {
      v16 = 1700;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_ACTION_SHEET")) & 1) != 0)
    {
      v16 = 1701;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW")) & 1) != 0)
    {
      v16 = 1702;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_PLATTER")) & 1) != 0)
    {
      v16 = 1703;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM")) & 1) != 0)
    {
      v16 = 1704;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION")) & 1) != 0)
    {
      v16 = 1705;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW_PLACECARD")) & 1) != 0)
    {
      v16 = 1706;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_PLACECARD")) & 1) != 0)
    {
      v16 = 1707;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY")) & 1) != 0)
    {
      v16 = 1708;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_PLACE")) & 1) != 0)
    {
      v16 = 1801;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH")) & 1) != 0)
    {
      v16 = 1802;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH_RESULTS")) & 1) != 0)
    {
      v16 = 1803;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_PUBLISHER")) & 1) != 0)
    {
      v16 = 1804;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_GUIDE")) & 1) != 0)
    {
      v16 = 1805;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_GUIDES_HOME")) & 1) != 0)
    {
      v16 = 1806;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_RELATED_PLACES_LIST")) & 1) != 0)
    {
      v16 = 1807;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_COLLECTION_LIST")) & 1) != 0)
    {
      v16 = 1808;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_DIRECTIONS")) & 1) != 0)
    {
      v16 = 1809;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("MAPS_WEB_SIDEBAR")))
    {
      v16 = 1810;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_1035;
    v16 = objc_msgSend(v14, "intValue");
  }
  objc_msgSend(a1, "setEntryTarget:", v16);
LABEL_1035:

  if (a3)
    v17 = CFSTR("downloadSize");
  else
    v17 = CFSTR("download_size");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OfflineDownloadSize_UNKNOWN")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_100MB")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_500MB")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_1GB")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OfflineDownloadSize_LESS_THAN_2GB")) & 1) != 0)
    {
      v20 = 4;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("OfflineDownloadSize_GREATER_THAN_2GB")))
    {
      v20 = 5;
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_1055;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v18, "intValue");
LABEL_1055:
    objc_msgSend(a1, "setDownloadSize:", v20);
  }

  if (a3)
    v21 = CFSTR("zoomLevel");
  else
    v21 = CFSTR("zoom_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setZoomLevel:", objc_msgSend(v22, "unsignedIntValue"));

  if (a3)
    v23 = CFSTR("downloadOnWifiOnly");
  else
    v23 = CFSTR("download_on_wifi_only");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDownloadOnWifiOnly:", objc_msgSend(v24, "BOOLValue"));

  if (a3)
    v25 = CFSTR("optimizeStorage");
  else
    v25 = CFSTR("optimize_storage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOptimizeStorage:", objc_msgSend(v26, "BOOLValue"));

  if (a3)
    v27 = CFSTR("automaticUpdates");
  else
    v27 = CFSTR("automatic_updates");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAutomaticUpdates:", objc_msgSend(v28, "BOOLValue"));

LABEL_1077:
  return a1;
}

- (GEOLogMsgStateOfflineDownload)initWithJSON:(id)a3
{
  return (GEOLogMsgStateOfflineDownload *)-[GEOLogMsgStateOfflineDownload _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateOfflineDownloadIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateOfflineDownloadReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_downloadCountry)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x80) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_8:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_9:
    if ((flags & 0x40) == 0)
      goto LABEL_10;
LABEL_19:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_19;
LABEL_10:
  if ((flags & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_12:

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOLogMsgStateOfflineDownload readAll:](self, "readAll:", 0);
  if (self->_downloadCountry)
    objc_msgSend(v5, "setDownloadCountry:");
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *((_BYTE *)v5 + 30) = self->_isDownloadInHomeMetro;
    *((_BYTE *)v5 + 36) |= 0x20u;
    flags = (char)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v5 + 32) = self->_regionTilesWereResized;
  *((_BYTE *)v5 + 36) |= 0x80u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 5) = self->_entryTarget;
  *((_BYTE *)v5 + 36) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 4) = self->_downloadSize;
  *((_BYTE *)v5 + 36) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_8:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 6) = self->_zoomLevel;
  *((_BYTE *)v5 + 36) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_9:
    if ((flags & 0x40) == 0)
      goto LABEL_10;
LABEL_19:
    *((_BYTE *)v5 + 31) = self->_optimizeStorage;
    *((_BYTE *)v5 + 36) |= 0x40u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_18:
  *((_BYTE *)v5 + 29) = self->_downloadOnWifiOnly;
  *((_BYTE *)v5 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_19;
LABEL_10:
  if ((flags & 8) != 0)
  {
LABEL_11:
    *((_BYTE *)v5 + 28) = self->_automaticUpdates;
    *((_BYTE *)v5 + 36) |= 8u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_downloadCountry, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 30) = self->_isDownloadInHomeMetro;
    *(_BYTE *)(v5 + 36) |= 0x20u;
    flags = (char)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 32) = self->_regionTilesWereResized;
  *(_BYTE *)(v5 + 36) |= 0x80u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 20) = self->_entryTarget;
  *(_BYTE *)(v5 + 36) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 16) = self->_downloadSize;
  *(_BYTE *)(v5 + 36) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 24) = self->_zoomLevel;
  *(_BYTE *)(v5 + 36) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    *(_BYTE *)(v5 + 31) = self->_optimizeStorage;
    *(_BYTE *)(v5 + 36) |= 0x40u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      return (id)v5;
    goto LABEL_9;
  }
LABEL_16:
  *(_BYTE *)(v5 + 29) = self->_downloadOnWifiOnly;
  *(_BYTE *)(v5 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 8) != 0)
  {
LABEL_9:
    *(_BYTE *)(v5 + 28) = self->_automaticUpdates;
    *(_BYTE *)(v5 + 36) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *downloadCountry;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  -[GEOLogMsgStateOfflineDownload readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  downloadCountry = self->_downloadCountry;
  if ((unint64_t)downloadCountry | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](downloadCountry, "isEqual:"))
      goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
      goto LABEL_53;
    if (self->_isDownloadInHomeMetro)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x80) == 0)
      goto LABEL_53;
    if (self->_regionTilesWereResized)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x80) != 0)
  {
    goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_entryTarget != *((_DWORD *)v4 + 5))
      goto LABEL_53;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_downloadSize != *((_DWORD *)v4 + 4))
      goto LABEL_53;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_zoomLevel != *((_DWORD *)v4 + 6))
      goto LABEL_53;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0)
      goto LABEL_53;
    if (self->_downloadOnWifiOnly)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x40) == 0)
      goto LABEL_53;
    if (self->_optimizeStorage)
    {
      if (!*((_BYTE *)v4 + 31))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 31))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_53;
  }
  v6 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) != 0)
    {
      if (self->_automaticUpdates)
      {
        if (!*((_BYTE *)v4 + 28))
          goto LABEL_53;
      }
      else if (*((_BYTE *)v4 + 28))
      {
        goto LABEL_53;
      }
      v6 = 1;
      goto LABEL_54;
    }
LABEL_53:
    v6 = 0;
  }
LABEL_54:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[GEOLogMsgStateOfflineDownload readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_downloadCountry, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    v4 = 2654435761 * self->_isDownloadInHomeMetro;
    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_regionTilesWereResized;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_entryTarget;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_downloadSize;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_zoomLevel;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_downloadOnWifiOnly;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_9;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  v9 = 0;
  if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v10 = 2654435761 * self->_optimizeStorage;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_17;
LABEL_9:
  v11 = 2654435761 * self->_automaticUpdates;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 1))
    -[GEOLogMsgStateOfflineDownload setDownloadCountry:](self, "setDownloadCountry:");
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 0x20) != 0)
  {
    self->_isDownloadInHomeMetro = *((_BYTE *)v5 + 30);
    *(_BYTE *)&self->_flags |= 0x20u;
    v4 = *((_BYTE *)v5 + 36);
    if ((v4 & 0x80) == 0)
    {
LABEL_5:
      if ((v4 & 2) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v5 + 36) & 0x80) == 0)
  {
    goto LABEL_5;
  }
  self->_regionTilesWereResized = *((_BYTE *)v5 + 32);
  *(_BYTE *)&self->_flags |= 0x80u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_entryTarget = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 1) == 0)
  {
LABEL_7:
    if ((v4 & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  self->_downloadSize = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 4) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_zoomLevel = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 0x40) == 0)
      goto LABEL_10;
LABEL_19:
    self->_optimizeStorage = *((_BYTE *)v5 + 31);
    *(_BYTE *)&self->_flags |= 0x40u;
    if ((*((_BYTE *)v5 + 36) & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_18:
  self->_downloadOnWifiOnly = *((_BYTE *)v5 + 29);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 0x40) != 0)
    goto LABEL_19;
LABEL_10:
  if ((v4 & 8) != 0)
  {
LABEL_11:
    self->_automaticUpdates = *((_BYTE *)v5 + 28);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadCountry, 0);
}

@end
