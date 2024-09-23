@implementation GEOLogMsgEventUserAction

- (GEOLogMsgEventUserAction)init
{
  GEOLogMsgEventUserAction *v2;
  GEOLogMsgEventUserAction *v3;
  GEOLogMsgEventUserAction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventUserAction;
  v2 = -[GEOLogMsgEventUserAction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventUserAction)initWithData:(id)a3
{
  GEOLogMsgEventUserAction *v3;
  GEOLogMsgEventUserAction *v4;
  GEOLogMsgEventUserAction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventUserAction;
  v3 = -[GEOLogMsgEventUserAction initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserActionEventKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserActionEventKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserActionEventKey
{
  -[GEOLogMsgEventUserAction _readUserActionEventKey]((uint64_t)self);
  return self->_userActionEventKey != 0;
}

- (NSString)userActionEventKey
{
  -[GEOLogMsgEventUserAction _readUserActionEventKey]((uint64_t)self);
  return self->_userActionEventKey;
}

- (void)setUserActionEventKey:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_userActionEventKey, a3);
}

- (void)_readUserActionEventValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserActionEventValue_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserActionEventValue
{
  -[GEOLogMsgEventUserAction _readUserActionEventValue]((uint64_t)self);
  return self->_userActionEventValue != 0;
}

- (NSString)userActionEventValue
{
  -[GEOLogMsgEventUserAction _readUserActionEventValue]((uint64_t)self);
  return self->_userActionEventValue;
}

- (void)setUserActionEventValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_userActionEventValue, a3);
}

- (int)userActionEventTarget
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_userActionEventTarget;
  else
    return 0;
}

- (void)setUserActionEventTarget:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_userActionEventTarget = a3;
}

- (void)setHasUserActionEventTarget:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasUserActionEventTarget
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)userActionEventTargetAsString:(int)a3
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

- (int)StringAsUserActionEventTarget:(id)a3
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

- (int)userActionEventAction
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_userActionEventAction;
  else
    return 0;
}

- (void)setUserActionEventAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_userActionEventAction = a3;
}

- (void)setHasUserActionEventAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasUserActionEventAction
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)userActionEventActionAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 4000)
  {
    if (a3 <= 10100)
    {
      if (a3 > 7000)
      {
        switch(a3)
        {
          case 9001:
            result = CFSTR("TAP_WIDGET_ITEM");
            break;
          case 9002:
            result = CFSTR("DISPLAY_NOTIFICATION");
            break;
          case 9003:
            result = CFSTR("TAP_NOTIFICATION");
            break;
          case 9004:
            result = CFSTR("EXPAND_NOTIFICATION");
            break;
          case 9005:
            result = CFSTR("DISMISS_NOTIFICATION");
            break;
          case 9006:
            result = CFSTR("OPEN_SEARCH");
            break;
          case 9007:
            result = CFSTR("OPEN_PAN_VIEW");
            break;
          case 9008:
            result = CFSTR("PAN_LEFT");
            break;
          case 9009:
            result = CFSTR("PAN_UP");
            break;
          case 9010:
          case 9041:
          case 9042:
          case 9043:
          case 9044:
          case 9045:
          case 9046:
          case 9047:
          case 9048:
          case 9049:
          case 9050:
          case 9051:
          case 9052:
          case 9053:
          case 9054:
          case 9055:
          case 9056:
          case 9057:
          case 9058:
          case 9059:
          case 9060:
          case 9061:
          case 9062:
          case 9063:
          case 9064:
          case 9065:
          case 9066:
          case 9067:
          case 9068:
          case 9069:
          case 9070:
          case 9071:
          case 9072:
          case 9073:
          case 9074:
          case 9075:
          case 9076:
          case 9077:
          case 9078:
          case 9079:
          case 9080:
          case 9081:
          case 9082:
          case 9083:
          case 9084:
          case 9085:
          case 9086:
          case 9087:
          case 9088:
          case 9089:
          case 9090:
          case 9091:
          case 9092:
          case 9093:
          case 9094:
          case 9095:
          case 9096:
          case 9097:
          case 9098:
          case 9099:
          case 9100:
            goto LABEL_48;
          case 9011:
            result = CFSTR("PAN_DOWN");
            break;
          case 9012:
            result = CFSTR("TAP_RECENT_DESTINATIONS");
            break;
          case 9013:
            result = CFSTR("OPEN_DESTINATIONS");
            break;
          case 9014:
            result = CFSTR("OPEN_FAVORITES");
            break;
          case 9015:
            result = CFSTR("VIEW_NAV_OPTIONS");
            break;
          case 9016:
            result = CFSTR("START_NAV_NO_GUIDANCE");
            break;
          case 9017:
            result = CFSTR("TURN_OFF_GUIDANCE");
            break;
          case 9018:
            result = CFSTR("TURN_ON_GUIDANCE");
            break;
          case 9019:
            result = CFSTR("OPEN_KEYBOARD");
            break;
          case 9020:
            result = CFSTR("SHARE_DESTINATION");
            break;
          case 9021:
            result = CFSTR("START_NAV_AUTOMATED");
            break;
          case 9022:
            result = CFSTR("SHARE_ETA");
            break;
          case 9023:
            result = CFSTR("SELECT_GROUP");
            break;
          case 9024:
            result = CFSTR("DESELECT_GROUP");
            break;
          case 9025:
            result = CFSTR("SELECT_CONTACT");
            break;
          case 9026:
            result = CFSTR("DESELECT_CONTACT");
            break;
          case 9027:
            result = CFSTR("TAP_VIEW_CONTACTS");
            break;
          case 9028:
            result = CFSTR("STOP_RECEIVING_ETA");
            break;
          case 9029:
            result = CFSTR("DISPLAY_ANNOUNCEMENT");
            break;
          case 9030:
            result = CFSTR("TAP_ANNOUNCEMENT");
            break;
          case 9031:
            result = CFSTR("DISPLAY_CYCLING_NOTIFICATION");
            break;
          case 9032:
            result = CFSTR("TAP_CYCLING_NOTIFICATION");
            break;
          case 9033:
            result = CFSTR("SHARE_CYCLING_ETA");
            break;
          case 9034:
            result = CFSTR("MANAGE_NOTIFICATIONS");
            break;
          case 9035:
            result = CFSTR("PUNCH_OUT_PUBLISHER_REVIEW");
            break;
          case 9036:
            result = CFSTR("SCROLL_FORWARD");
            break;
          case 9037:
            result = CFSTR("SCROLL_BACKWARD");
            break;
          case 9038:
            result = CFSTR("SHOW_ALL_CURATED_COLLECTIONS");
            break;
          case 9039:
            result = CFSTR("TAP_LESS");
            break;
          case 9040:
            result = CFSTR("TAP_MORE");
            break;
          case 9101:
            result = CFSTR("DISPLAY_ADD_HOME_AND_WORK");
            break;
          case 9102:
            result = CFSTR("TAP_ADD_HOME_AND_WORK");
            break;
          case 9103:
            result = CFSTR("DISPLAY_ALLOW_FREQUENTS");
            break;
          case 9104:
            result = CFSTR("TAP_ALLOW_FREQUENTS");
            break;
          case 9105:
            result = CFSTR("DISPLAY_ALLOW_LOCATION");
            break;
          case 9106:
            result = CFSTR("TAP_ALLOW_LOCATION");
            break;
          default:
            switch(a3)
            {
              case 7001:
                result = CFSTR("EXPAND_TRANSIT_SYSTEM");
                break;
              case 7002:
                result = CFSTR("COLLAPSE_TRANSIT_SYSTEM");
                break;
              case 7003:
                result = CFSTR("SHOW_MORE_DEPARTURES");
                break;
              case 7004:
                result = CFSTR("VIEW_TRANSIT_LINE");
                break;
              case 7005:
                result = CFSTR("CANCEL_VIEW_TRANSIT_LINE");
                break;
              case 7006:
                result = CFSTR("TAP_TRANSIT_ATTRIBUTION");
                break;
              case 7007:
                result = CFSTR("TAP_TRANSIT_ADVISORY");
                break;
              case 7008:
                result = CFSTR("MORE_DETAILS_TRANSIT_ADVISORY");
                break;
              case 7009:
                result = CFSTR("SUBSCRIBE_LINE_INCIDENT");
                break;
              case 7010:
                result = CFSTR("UNSUBSCRIBE_LINE_INCIDENT");
                break;
              case 7011:
                result = CFSTR("TAP_NEAREST_STATION");
                break;
              case 7012:
                result = CFSTR("TAP_NEAREST_STOP");
                break;
              case 7013:
                result = CFSTR("TAP_CONNECTION");
                break;
              case 7014:
                result = CFSTR("GET_TICKETS");
                break;
              case 7015:
                result = CFSTR("OPEN_SCHEDULECARD_DATETIME");
                break;
              case 7016:
                result = CFSTR("EXPAND_PRIOR_STEP_DETAILS_TRANSIT");
                break;
              case 7017:
                result = CFSTR("EXPAND_ALIGHT_STEP_DETAILS_TRANSIT");
                break;
              case 7018:
                result = CFSTR("VIEW_ON_MAP");
                break;
              case 7019:
                result = CFSTR("FORCE_UPDATE_DEPARTURE_INFO");
                break;
              case 7020:
                result = CFSTR("TAP_TRANSIT_LINE_INFO");
                break;
              case 7021:
                result = CFSTR("TAP_ATTRIBUTION_CELL");
                break;
              case 7022:
                result = CFSTR("TAP_NEXT_DEPARTURES");
                break;
              case 7023:
                result = CFSTR("VIEW_BANNER");
                break;
              case 7024:
                result = CFSTR("GET_SHOWTIMES");
                break;
              case 7025:
                result = CFSTR("MAKE_APPOINTMENT");
                break;
              case 7026:
                result = CFSTR("RESERVE_PARKING");
                break;
              case 7027:
                result = CFSTR("RESERVE_ROOM");
                break;
              case 7028:
                result = CFSTR("WAITLIST");
                break;
              case 7029:
                result = CFSTR("ORDER_TAKEOUT");
                break;
              case 7030:
                result = CFSTR("RESERVE");
                break;
              default:
                switch(a3)
                {
                  case 8001:
                    result = CFSTR("INVOKE_SIRI_SNIPPET");
                    break;
                  case 8002:
                    result = CFSTR("INVOKE_SIRI_DISAMBIGUATION");
                    break;
                  case 8003:
                    result = CFSTR("SHOW_PLACE_DETAILS");
                    break;
                  case 8004:
                    result = CFSTR("ANSWER_REROUTE_SUGGESTION");
                    break;
                  case 8005:
                    result = CFSTR("SUGGEST_NAV_REROUTE");
                    break;
                  case 8006:
                    result = CFSTR("GET_NAV_STATUS");
                    break;
                  case 8007:
                    result = CFSTR("REPEAT_NAV_STATUS");
                    break;
                  case 8008:
                    result = CFSTR("SELECT_AUDIO_VOLUME_UNMUTE");
                    break;
                  case 8009:
                    result = CFSTR("INVOKE_SIRI");
                    break;
                  case 8010:
                    result = CFSTR("DISPLAY_SIRI_ERROR_MESSAGE");
                    break;
                  case 8011:
                    result = CFSTR("DISPLAY_NO_RESULTS_MESSAGE");
                    break;
                  default:
                    goto LABEL_48;
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
          case 6003:
            result = CFSTR("GET_DIRECTIONS");
            break;
          case 6004:
            result = CFSTR("TAP_FLYOVER_TOUR");
            break;
          case 6005:
            result = CFSTR("REMOVE_PIN");
            break;
          case 6006:
            result = CFSTR("TAP_PHOTO");
            break;
          case 6007:
            result = CFSTR("TAP_MAPS_VIEW");
            break;
          case 6008:
            result = CFSTR("TAP_ADDRESS");
            break;
          case 6009:
            result = CFSTR("CALL");
            break;
          case 6010:
            result = CFSTR("TAP_URL");
            break;
          case 6011:
            result = CFSTR("SHOW_TODAY_HOURS");
            break;
          case 6012:
            result = CFSTR("SHOW_ALL_HOURS");
            break;
          case 6013:
            result = CFSTR("SHARE");
            break;
          case 6014:
          case 6017:
          case 6028:
          case 6030:
          case 6035:
            goto LABEL_48;
          case 6015:
            result = CFSTR("ADD_TO_FAVORITES");
            break;
          case 6016:
            result = CFSTR("ADD_CONTACT");
            break;
          case 6018:
            result = CFSTR("PUNCH_OUT_PHOTO");
            break;
          case 6019:
            result = CFSTR("PUNCH_OUT_USEFUL_TO_KNOW");
            break;
          case 6020:
            result = CFSTR("PUNCH_OUT_OPEN_APP");
            break;
          case 6021:
            result = CFSTR("PUNCH_OUT_SINGLE_REVIEW");
            break;
          case 6022:
            result = CFSTR("PUNCH_OUT_CHECK_IN");
            break;
          case 6023:
            result = CFSTR("PUNCH_OUT_MORE_INFO");
            break;
          case 6024:
            result = CFSTR("PUNCH_OUT_WRITE_REVIEW");
            break;
          case 6025:
            result = CFSTR("PUNCH_OUT_ADD_PHOTO");
            break;
          case 6026:
            result = CFSTR("TAP_GRID_VIEW");
            break;
          case 6027:
            result = CFSTR("EDIT_LOCATION");
            break;
          case 6029:
            result = CFSTR("ADD_PHOTO");
            break;
          case 6031:
            result = CFSTR("RETAKE");
            break;
          case 6032:
            result = CFSTR("ADD_NOTE");
            break;
          case 6033:
            result = CFSTR("REMOVE_CAR");
            break;
          case 6034:
            result = CFSTR("EDIT_NAME");
            break;
          case 6036:
            result = CFSTR("RESERVE_TABLE");
            break;
          case 6037:
            result = CFSTR("ADD_TO_QUEUE");
            break;
          case 6038:
            result = CFSTR("VIEW_BOOKED_TABLE");
            break;
          case 6039:
            result = CFSTR("VIEW_QUEUED_TABLE");
            break;
          case 6040:
            result = CFSTR("PUNCH_OUT_THIRD_PARTY_APP");
            break;
          case 6041:
            result = CFSTR("PUNCH_OUT_LEGAL_LINK");
            break;
          case 6042:
            result = CFSTR("TAP_PLACECARD_HEADER");
            break;
          case 6043:
            result = CFSTR("REMOVE_FROM_FAVORITES");
            break;
          case 6044:
            result = CFSTR("VIEW_CONTACT");
            break;
          case 6045:
            result = CFSTR("CHAT");
            break;
          case 6046:
            result = CFSTR("FIND_STORES");
            break;
          case 6047:
            result = CFSTR("TAP_PARENT");
            break;
          case 6048:
            result = CFSTR("SCROLL_LEFT_PHOTOS");
            break;
          case 6049:
            result = CFSTR("SCROLL_RIGHT_PHOTOS");
            break;
          case 6050:
            result = CFSTR("PUNCH_OUT");
            break;
          case 6051:
            result = CFSTR("TAP_ENTER_MUNIN");
            break;
          case 6052:
            result = CFSTR("TAP_RECOMMENDED_DISHES_PHOTO");
            break;
          case 6053:
            result = CFSTR("PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP");
            break;
          case 6054:
            result = CFSTR("PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO");
            break;
          case 6055:
            result = CFSTR("SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS");
            break;
          case 6056:
            result = CFSTR("SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS");
            break;
          case 6057:
            result = CFSTR("SHOW_LINKED_SERVICE_HOURS");
            break;
          case 6058:
            result = CFSTR("ENTER_LOOK_AROUND");
            break;
          case 6059:
            result = CFSTR("EXIT_LOOK_AROUND");
            break;
          case 6060:
            result = CFSTR("TAP_ENTER_LOOK_AROUND_VIEW");
            break;
          case 6061:
            result = CFSTR("TAP_ENTER_LOOK_AROUND_PIP");
            break;
          case 6062:
            result = CFSTR("EXPAND_LOOK_AROUND_VIEW");
            break;
          case 6063:
            result = CFSTR("CLOSE_LOOK_AROUND");
            break;
          case 6064:
            result = CFSTR("COLLAPSE_LOOK_AROUND_VIEW");
            break;
          case 6065:
            result = CFSTR("TAP_SHOW_ACTIONS");
            break;
          case 6066:
            result = CFSTR("TAP_HIDE_LABELS");
            break;
          case 6067:
            result = CFSTR("TAP_SHOW_LABELS");
            break;
          case 6068:
            result = CFSTR("TAP_SHOW_DETAILS");
            break;
          case 6069:
            result = CFSTR("PAN_LOOK_AROUND");
            break;
          case 6070:
            result = CFSTR("TAP_LOOK_AROUND_THUMBNAIL");
            break;
          case 6071:
            result = CFSTR("TAP_LANDMARK");
            break;
          case 6072:
            result = CFSTR("TAP_SCENE");
            break;
          case 6073:
            result = CFSTR("SHOW_LINKED_BUSINESS_HOURS");
            break;
          case 6074:
            result = CFSTR("TAP_PLACECARD_SHORTCUT");
            break;
          case 6075:
            result = CFSTR("SHOW_ALL_LOCATIONS_INSIDE");
            break;
          case 6076:
            result = CFSTR("SHOW_ALL_SIMILAR_LOCATIONS");
            break;
          case 6077:
            result = CFSTR("SHOW_ALL_LOCATIONS_AT_ADDRESS");
            break;
          case 6078:
            result = CFSTR("TAP_PARENT_LOCATION");
            break;
          case 6079:
            result = CFSTR("TAP_SIMILAR_LOCATION");
            break;
          case 6080:
            result = CFSTR("TAP_LOCATION_INSIDE");
            break;
          case 6081:
            result = CFSTR("TAP_LOCATION_AT_ADDRESS");
            break;
          case 6082:
            result = CFSTR("CLOSE_ROUTE_GENIUS");
            break;
          case 6083:
            result = CFSTR("LOAD_WEB_CONTENT");
            break;
          case 6084:
            result = CFSTR("SCROLL_FORWARD_WEB_CONTENT");
            break;
          case 6085:
            result = CFSTR("SCROLL_BACKWARD_WEB_CONTENT");
            break;
          case 6086:
            result = CFSTR("TAP_WEB_CONTENT");
            break;
          case 6087:
            result = CFSTR("SHOW_PHOTO_VIEWER");
            break;
          case 6088:
            result = CFSTR("SHOW_LAST_PAGE");
            break;
          case 6089:
            result = CFSTR("TAP_VIEW_APP");
            break;
          case 6090:
            result = CFSTR("TAP_APP_CLIP");
            break;
          case 6091:
            result = CFSTR("DEAD_BATTERY");
            break;
          case 6092:
            result = CFSTR("DISMISS_LOW_BATTERY_ALERT");
            break;
          case 6093:
            result = CFSTR("DISMISS_OUT_OF_RANGE_ALERT");
            break;
          case 6094:
            result = CFSTR("FAILED_TO_LOAD_EV_STATUS");
            break;
          case 6095:
            result = CFSTR("LOW_BATTERY_ALERT");
            break;
          case 6096:
            result = CFSTR("PAUSE_ROUTE");
            break;
          case 6097:
            result = CFSTR("TAP_ADD_STOP");
            break;
          case 6098:
            result = CFSTR("TAP_CHARGE_POINT");
            break;
          case 6099:
            result = CFSTR("TAP_OUT_OF_RANGE_ALERT");
            break;
          case 6100:
            result = CFSTR("SCROLL_DOWN_PHOTOS");
            break;
          case 6101:
            result = CFSTR("SCROLL_UP_PHOTOS");
            break;
          case 6102:
            result = CFSTR("TAP_MORE_PHOTOS");
            break;
          case 6103:
            result = CFSTR("TAP_TO_CONFIRM_INCIDENT");
            break;
          case 6104:
            result = CFSTR("SHOW_INCIDENT");
            break;
          case 6105:
            result = CFSTR("REVEAL_APP_CLIP");
            break;
          case 6106:
            result = CFSTR("ORDER_DELIVERY");
            break;
          case 6107:
            result = CFSTR("VIEW_MENU");
            break;
          case 6108:
            result = CFSTR("TAP_EDIT_STOPS");
            break;
          case 6109:
            result = CFSTR("LEARN_MORE_WEB_CONTENT");
            break;
          case 6110:
            result = CFSTR("MAKE_APPOINTMENT_WEB_CONTENT");
            break;
          case 6111:
            result = CFSTR("REVEAL_SHOWCASE");
            break;
          default:
            switch(a3)
            {
              case 5001:
                result = CFSTR("SHOW_MAPS_SETTINGS");
                break;
              case 5002:
                result = CFSTR("TAP_STANDARD_MODE");
                break;
              case 5003:
                result = CFSTR("TAP_TRANSIT_MODE");
                break;
              case 5004:
                result = CFSTR("TAP_SATELLITE_MODE");
                break;
              case 5005:
                result = CFSTR("SWITCH_ON_TRAFFIC");
                break;
              case 5006:
                result = CFSTR("SWITCH_OFF_TRAFFIC");
                break;
              case 5007:
                result = CFSTR("SWITCH_ON_LABELS");
                break;
              case 5008:
                result = CFSTR("SWITCH_OFF_LABELS");
                break;
              case 5009:
                result = CFSTR("SWITCH_ON_3D_MAP");
                break;
              case 5010:
                result = CFSTR("SWITCH_OFF_3D_MAP");
                break;
              case 5011:
                result = CFSTR("SWITCH_ON_WEATHER");
                break;
              case 5012:
                result = CFSTR("SWITCH_OFF_WEATHER");
                break;
              case 5013:
                result = CFSTR("REPORT_A_PROBLEM");
                break;
              case 5014:
                result = CFSTR("ADD_PLACE");
                break;
              case 5015:
                goto LABEL_48;
              case 5016:
                result = CFSTR("TAP_PREFERENCES");
                break;
              case 5017:
                result = CFSTR("SWITCH_ON_TOLLS");
                break;
              case 5018:
                result = CFSTR("SWITCH_OFF_TOLLS");
                break;
              case 5019:
                result = CFSTR("SWITCH_ON_HIGHWAYS");
                break;
              case 5020:
                result = CFSTR("SWITCH_OFF_HIGHWAYS");
                break;
              case 5021:
                result = CFSTR("SWITCH_ON_HEADING");
                break;
              case 5022:
                result = CFSTR("SWITCH_OFF_HEADING");
                break;
              case 5023:
                result = CFSTR("SWITCH_ON_SPEED_LIMIT");
                break;
              case 5024:
                result = CFSTR("SWITCH_OFF_SPEED_LIMIT");
                break;
              case 5025:
                result = CFSTR("ELECT_DRIVING_MODE");
                break;
              case 5026:
                result = CFSTR("ELECT_WALKING_MODE");
                break;
              case 5027:
                result = CFSTR("ELECT_TRANSIT_MODE");
                break;
              case 5028:
                result = CFSTR("ELECT_RIDESHARE_MODE");
                break;
              case 5029:
                result = CFSTR("SWITCH_ON_FIND_MY_CAR");
                break;
              case 5030:
                result = CFSTR("SWITCH_OFF_FIND_MY_CAR");
                break;
              case 5031:
                result = CFSTR("MARK_MY_LOCATION");
                break;
              case 5032:
                result = CFSTR("TAP_HYBRID_MODE");
                break;
              case 5033:
                result = CFSTR("CHECK_AVOID_BUSY_ROADS");
                break;
              case 5034:
                result = CFSTR("UNCHECK_AVOID_BUSY_ROADS");
                break;
              case 5035:
                result = CFSTR("CHECK_AVOID_HILLS");
                break;
              case 5036:
                result = CFSTR("UNCHECK_AVOID_HILLS");
                break;
              case 5037:
                result = CFSTR("CHECK_AVOID_STAIRS");
                break;
              case 5038:
                result = CFSTR("UNCHECK_AVOID_STAIRS");
                break;
              case 5039:
                result = CFSTR("ELECT_CYCLING_MODE");
                break;
              default:
                switch(a3)
                {
                  case 4001:
                    result = CFSTR("RECENTER_CURRENT_LOCATION");
                    break;
                  case 4002:
                    result = CFSTR("TAP_HEADING_ON");
                    break;
                  case 4003:
                    result = CFSTR("TAP_HEADING_OFF");
                    break;
                  case 4004:
                    result = CFSTR("PUCK_DRIFT");
                    break;
                  case 4005:
                    result = CFSTR("PUCK_SNAP");
                    break;
                  case 4006:
                    result = CFSTR("SELECT_FLOOR");
                    break;
                  default:
                    goto LABEL_48;
                }
                break;
            }
            break;
        }
      }
    }
    else if (a3 > 13000)
    {
      if (a3 <= 16000)
      {
        if (a3 <= 15000)
        {
          switch(a3)
          {
            case 14001:
              result = CFSTR("VIEW_APP");
              break;
            case 14002:
              result = CFSTR("ENABLE");
              break;
            case 14003:
              result = CFSTR("BOOK_RIDE");
              break;
            case 14004:
              result = CFSTR("REQUEST_RIDE");
              break;
            case 14005:
              result = CFSTR("CONTACT_DRIVER");
              break;
            case 14006:
              result = CFSTR("CHANGE_PAYMENT");
              break;
            case 14007:
              result = CFSTR("ENABLE_ALL_RIDESHARE_APPS");
              break;
            case 14008:
              result = CFSTR("TAP_FOR_MORE_RIDES");
              break;
            case 14009:
              result = CFSTR("SUBMIT_TRIP_FEEDBACK");
              break;
            default:
              switch(a3)
              {
                case 13001:
                  result = CFSTR("SELECT_ADDRESS");
                  break;
                case 13002:
                  result = CFSTR("ADD_ADDRESS");
                  break;
                case 13003:
                  result = CFSTR("SELECT_LABEL");
                  break;
                case 13004:
                  result = CFSTR("DELETE_ADDRESS");
                  break;
                case 13005:
                  result = CFSTR("EDIT_ITEMS");
                  break;
                case 13006:
                  result = CFSTR("RAP_FAVORITES");
                  break;
                case 13007:
                  result = CFSTR("SORT_LIST_ITEM");
                  break;
                default:
                  goto LABEL_48;
              }
              break;
          }
        }
        else
        {
          switch(a3)
          {
            case 15001:
              return CFSTR("ORB_PEEK");
            case 15002:
              return CFSTR("ORB_POP");
            case 15003:
              return CFSTR("ORB_DISMISS");
            default:
LABEL_48:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
              v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
              return v3;
          }
        }
      }
      else
      {
        switch(a3)
        {
          case 17001:
            result = CFSTR("START_DRAG");
            break;
          case 17002:
            result = CFSTR("CANCEL_DRAG");
            break;
          case 17003:
            result = CFSTR("COMPLETE_DRAG");
            break;
          case 17004:
            result = CFSTR("START_DROP");
            break;
          case 17005:
            result = CFSTR("CANCEL_DROP");
            break;
          case 17006:
            result = CFSTR("COMPLETE_DROP");
            break;
          case 17007:
            result = CFSTR("ANNOTATION_SELECT");
            break;
          case 17008:
            result = CFSTR("ANNOTATION_SELECT_AUTO");
            break;
          case 17009:
            result = CFSTR("ANNOTATION_SELECT_LIST");
            break;
          case 17010:
            result = CFSTR("BROWSE_TOP_CATEGORY_DISPLAYED");
            break;
          case 17011:
            result = CFSTR("CALLOUT_FLYOVER_TOUR");
            break;
          case 17012:
            result = CFSTR("CALLOUT_INFO");
            break;
          case 17013:
            result = CFSTR("CALLOUT_NAV_TRANSIT");
            break;
          case 17014:
            result = CFSTR("CALLOUT_TRAFFIC_INCIDENT_INFO");
            break;
          case 17015:
            result = CFSTR("CALLOUT_VIEW_TRANSIT_LINE");
            break;
          case 17016:
            result = CFSTR("DIRECTIONS_SELECT");
            break;
          case 17017:
            result = CFSTR("DIRECTIONS_TRANSIT_CUSTOM");
            break;
          case 17018:
            result = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_ARRIVES");
            break;
          case 17019:
            result = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_DEPARTS");
            break;
          case 17020:
            result = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_DONE");
            break;
          case 17021:
            result = CFSTR("DIRECTIONS_TRANSIT_LATER");
            break;
          case 17022:
            result = CFSTR("DIRECTIONS_TRANSIT_NOW");
            break;
          case 17023:
            result = CFSTR("FLYOVER_NOTIFICATION_DISMISS");
            break;
          case 17024:
            result = CFSTR("FLYOVER_NOTIFICATION_START");
            break;
          case 17025:
            result = CFSTR("FLYOVER_TOUR_COMPLETED");
            break;
          case 17026:
            result = CFSTR("FLYOVER_TOUR_END");
            break;
          case 17027:
            result = CFSTR("FLYOVER_TOUR_NOTIFICATION");
            break;
          case 17028:
            result = CFSTR("FLYOVER_TOUR_START");
            break;
          case 17029:
            result = CFSTR("INFO_BOOKMARKS");
            break;
          case 17030:
            result = CFSTR("INFO_CARD_DETACHED");
            break;
          case 17031:
            result = CFSTR("INFO_CONTACTS");
            break;
          case 17032:
            result = CFSTR("INFO_DIRECTIONS");
            break;
          case 17033:
            result = CFSTR("INFO_DIRECTIONS_FROM");
            break;
          case 17034:
            result = CFSTR("INFO_DIRECTIONS_TO");
            break;
          case 17035:
            result = CFSTR("INFO_DISMISS");
            break;
          case 17036:
            result = CFSTR("INFO_INFO");
            break;
          case 17037:
            result = CFSTR("INFO_PHOTOS");
            break;
          case 17038:
            result = CFSTR("INFO_REVIEWS");
            break;
          case 17039:
            result = CFSTR("INFO_SHARE");
            break;
          case 17040:
            result = CFSTR("INFO_SHARE_AIRDROP");
            break;
          case 17041:
            result = CFSTR("INFO_SHARE_FACEBOOK");
            break;
          case 17042:
            result = CFSTR("INFO_SHARE_MAIL");
            break;
          case 17043:
            result = CFSTR("INFO_SHARE_MESSAGE");
            break;
          case 17044:
            result = CFSTR("INFO_SHARE_TENCENTWEIBO");
            break;
          case 17045:
            result = CFSTR("INFO_SHARE_WEIBO");
            break;
          case 17046:
            result = CFSTR("INFO_YELP");
            break;
          case 17047:
            result = CFSTR("MAPS_APP_LAUNCH");
            break;
          case 17048:
            result = CFSTR("MAP_3D_OFF");
            break;
          case 17049:
            result = CFSTR("MAP_3D_ON");
            break;
          case 17050:
            result = CFSTR("MAP_OPTIONS_DROP_PIN");
            break;
          case 17051:
            result = CFSTR("MAP_OPTIONS_HYBRID");
            break;
          case 17052:
            result = CFSTR("MAP_OPTIONS_PRINT");
            break;
          case 17053:
            result = CFSTR("MAP_OPTIONS_REMOVE_PIN");
            break;
          case 17054:
            result = CFSTR("MAP_OPTIONS_SATELLITE");
            break;
          case 17055:
            result = CFSTR("MAP_OPTIONS_STANDARD");
            break;
          case 17056:
            result = CFSTR("MAP_OPTIONS_TRAFFIC_HIDE");
            break;
          case 17057:
            result = CFSTR("MAP_OPTIONS_TRAFFIC_SHOW");
            break;
          case 17058:
            result = CFSTR("MAP_OPTIONS_TRANSIT");
            break;
          case 17059:
            result = CFSTR("MAP_TAP_FLYOVER_CITY");
            break;
          case 17060:
            result = CFSTR("MAP_TAP_LINE");
            break;
          case 17061:
            result = CFSTR("MAP_TAP_POI_TRANSIT");
            break;
          case 17062:
            result = CFSTR("MAP_TAP_TRAFFIC_INCIDENT");
            break;
          case 17063:
            result = CFSTR("MAP_TRANSIT_NOT_AVAIL_SHOWING");
            break;
          case 17064:
            result = CFSTR("MAP_USER_TRACKING_OFF");
            break;
          case 17065:
            result = CFSTR("MAP_USER_TRACKING_ON");
            break;
          case 17066:
            result = CFSTR("MAP_USER_TRACKING_WITH_HEADING_ON");
            break;
          case 17067:
            result = CFSTR("NAV_CLEAR");
            break;
          case 17068:
            result = CFSTR("NAV_LIST");
            break;
          case 17069:
            result = CFSTR("NAV_ROUTE_STEP_NEXT");
            break;
          case 17070:
            result = CFSTR("NAV_ROUTE_STEP_PREV");
            break;
          case 17071:
            result = CFSTR("NO_NETWORK_ROUTING_ALERT_DISPLAYED");
            break;
          case 17072:
            result = CFSTR("ORB_DISPLAY_MENU");
            break;
          case 17073:
            result = CFSTR("ORB_MENU_CALL");
            break;
          case 17074:
            result = CFSTR("ORB_MENU_DIRECTIONS");
            break;
          case 17075:
            result = CFSTR("ORB_MENU_DISMISS");
            break;
          case 17076:
            result = CFSTR("ORB_MENU_SHARE");
            break;
          case 17077:
            result = CFSTR("ORB_MENU_SHOW_PLACECARD");
            break;
          case 17078:
            result = CFSTR("ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP");
            break;
          case 17079:
            result = CFSTR("ORB_MENU_URL");
            break;
          case 17080:
            result = CFSTR("ORB_PRESS");
            break;
          case 17081:
            result = CFSTR("ORB_SPRINGBOARD_MARK_LOCATION");
            break;
          case 17082:
            result = CFSTR("ORB_SPRINGBOARD_SEARCH");
            break;
          case 17083:
            result = CFSTR("ORB_SPRINGBOARD_SHARE_LOCATION");
            break;
          case 17084:
            result = CFSTR("RAP_ENTRY_SEARCH_AUTOCOMPLETE");
            break;
          case 17085:
            result = CFSTR("RAP_PERMISSION_CANCEL");
            break;
          case 17086:
            result = CFSTR("RAP_PERMISSION_EMAIL_NA");
            break;
          case 17087:
            result = CFSTR("RAP_PERMISSION_EMAIL_OK");
            break;
          case 17088:
            result = CFSTR("RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED");
            break;
          case 17089:
            result = CFSTR("RAP_PERMISSION_EMAIL_SETTINGS_DENIED");
            break;
          case 17090:
            result = CFSTR("RAP_PERMISSION_OK");
            break;
          case 17091:
            result = CFSTR("SEARCH_BEGIN");
            break;
          case 17092:
            result = CFSTR("SEARCH_CANCEL");
            break;
          case 17093:
            result = CFSTR("SEARCH_SELECT");
            break;
          case 17094:
            result = CFSTR("TRANSIT_LINE_SELECTION_DISMISS");
            break;
          case 17095:
            result = CFSTR("TRANSIT_LINE_SELECTION_VIEW");
            break;
          case 17096:
            result = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS");
            break;
          case 17097:
            result = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE");
            break;
          case 17098:
            result = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS");
            break;
          case 17099:
            result = CFSTR("UNKNOWN_ACTION");
            break;
          case 17100:
            result = CFSTR("INFO_SHARE_TWITTER");
            break;
          case 17101:
            result = CFSTR("INFO_TAP_POPULAR_APP_NEARBY");
            break;
          case 17102:
            result = CFSTR("INFO_DIRECTIONS_WALK");
            break;
          case 17103:
            result = CFSTR("INFO_DIRECTIONS_TRANSIT");
            break;
          case 17104:
            result = CFSTR("INFO_DIRECTIONS_DRIVE");
            break;
          case 17105:
            result = CFSTR("INFO_REPORT_A_PROBLEM");
            break;
          case 17106:
            result = CFSTR("CALLOUT_NAV");
            break;
          case 17107:
            result = CFSTR("RAP_PERMISSION_EMAIL_CANCEL");
            break;
          case 17108:
            result = CFSTR("MAP_TAP_POI");
            break;
          default:
            if (a3 == 16001)
            {
              result = CFSTR("SEARCH_IN_MAPS");
            }
            else
            {
              if (a3 != 90010)
                goto LABEL_48;
              result = CFSTR("PAN_RIGHT");
            }
            break;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 10101:
          result = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT");
          break;
        case 10102:
          result = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE");
          break;
        case 10103:
          result = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT");
          break;
        case 10104:
          result = CFSTR("RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT");
          break;
        case 10105:
          result = CFSTR("RAP_DIRECTIONS_ADD_INSTRUCTION_INFO");
          break;
        case 10106:
          result = CFSTR("RAP_DIRECTIONS_COLLAPSE_INSTRUCTION");
          break;
        case 10107:
          result = CFSTR("RAP_DIRECTIONS_EXPAND_INSTRUCTION");
          break;
        case 10108:
          result = CFSTR("RAP_DIRECTIONS_SELECT_INSTRUCTION");
          break;
        case 10109:
          result = CFSTR("RAP_CANCEL");
          break;
        case 10110:
          result = CFSTR("RAP_NEXT");
          break;
        case 10111:
          result = CFSTR("RAP_BACK");
          break;
        case 10112:
          result = CFSTR("RAP_SEND");
          break;
        case 10113:
          result = CFSTR("RAP_SKIP");
          break;
        case 10114:
          result = CFSTR("RAP_SHOW_MORE");
          break;
        case 10115:
          result = CFSTR("RAP_ADD_PHOTO");
          break;
        case 10116:
          result = CFSTR("RAP_MAP_INCORRECT");
          break;
        case 10117:
          result = CFSTR("RAP_BAD_DIRECTIONS");
          break;
        case 10118:
          result = CFSTR("RAP_TRANSIT_INFO_INCORRECT");
          break;
        case 10119:
          result = CFSTR("RAP_SATELLITE_IMAGE_PROBLEM");
          break;
        case 10120:
          result = CFSTR("RAP_SEARCH_RESULTS_INCORRECT");
          break;
        case 10121:
          result = CFSTR("RAP_ADD_A_PLACE");
          break;
        case 10122:
          result = CFSTR("RAP_HOME");
          break;
        case 10123:
          result = CFSTR("RAP_WORK");
          break;
        case 10124:
          result = CFSTR("RAP_OTHER");
          break;
        case 10125:
          result = CFSTR("RAP_LOCATION");
          break;
        case 10126:
          result = CFSTR("RAP_TRANSIT_STATION_INFO_INCORRECT");
          break;
        case 10127:
          result = CFSTR("RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT");
          break;
        case 10128:
          result = CFSTR("RAP_TRANSIT_LINE_INFO_INCORRECT");
          break;
        case 10129:
          result = CFSTR("RAP_TRANSIT_LINE_NAME_INCORRECT");
          break;
        case 10130:
          result = CFSTR("RAP_TRANSIT_LINE_SHAPE_INCORRECT");
          break;
        case 10131:
          result = CFSTR("RAP_TRANSIT_LINE_SCHEDULE_INCORRECT");
          break;
        case 10132:
          result = CFSTR("RAP_TRANSIT_DELAY");
          break;
        case 10133:
          result = CFSTR("RAP_LOCATION_CLOSED");
          break;
        case 10134:
          result = CFSTR("RAP_CLOSED_PERMANENTLY");
          break;
        case 10135:
          result = CFSTR("RAP_CLOSED_TEMPORARILY");
          break;
        case 10136:
          result = CFSTR("RAP_HOURS_HAVE_CHANGED");
          break;
        case 10137:
          result = CFSTR("RAP_SELECT_STATION");
          break;
        case 10138:
          result = CFSTR("RAP_SELECT_LINE");
          break;
        case 10139:
          result = CFSTR("RAP_SELECT_ACCESS_POINT");
          break;
        case 10140:
          result = CFSTR("RAP_SELECT_SEARCH");
          break;
        case 10141:
          result = CFSTR("RAP_PAN_MAP");
          break;
        case 10142:
          result = CFSTR("RAP_CENTER_MAP_ON_USER");
          break;
        case 10143:
          result = CFSTR("RAP_SEARCH_UNEXPECTED");
          break;
        case 10144:
          result = CFSTR("RAP_ADD_POI");
          break;
        case 10145:
          result = CFSTR("RAP_ADD_STREET_ADDRESS");
          break;
        case 10146:
          result = CFSTR("RAP_ADD_OTHER");
          break;
        case 10147:
          result = CFSTR("RAP_SELECT_CATEGORY");
          break;
        case 10148:
          result = CFSTR("RAP_TAKE_PHOTO");
          break;
        case 10149:
          result = CFSTR("RAP_RETAKE_PHOTO");
          break;
        case 10150:
          result = CFSTR("RAP_PLACE_DETAILS");
          break;
        case 10151:
          result = CFSTR("RAP_SATELLITE_IMAGE_OUTDATED");
          break;
        case 10152:
          result = CFSTR("RAP_SATELLITE_IMAGE_QUALITY");
          break;
        case 10153:
          result = CFSTR("RAP_SELECT_LABEL");
          break;
        case 10154:
          result = CFSTR("RAP_SELECT_ROUTE");
          break;
        case 10155:
          result = CFSTR("RAP_CLAIM_BUSINESS");
          break;
        case 10156:
          result = CFSTR("RAP_BRAND_DETAILS");
          break;
        case 10157:
          result = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY");
          break;
        case 10158:
          result = CFSTR("RAP_LOOK_AROUND_LABELS_STREET");
          break;
        case 10159:
          result = CFSTR("RAP_LOOK_AROUND_BLURRING");
          break;
        case 10160:
          result = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME");
          break;
        case 10161:
          result = CFSTR("RAP_LOOK_AROUND_LABELS_STORE");
          break;
        case 10162:
          result = CFSTR("RAP_LOOK_AROUND_PRIVACY");
          break;
        case 10163:
          result = CFSTR("RAP_INCORRECT_HOURS");
          break;
        case 10164:
          result = CFSTR("RAP_INCORRECT_ADDRESS");
          break;
        case 10165:
          result = CFSTR("RAP_EDIT_PLACE_DETAILS");
          break;
        case 10166:
          result = CFSTR("RAP_EDIT_PLACE_NAME");
          break;
        case 10167:
          result = CFSTR("RAP_EDIT_ADDRESS");
          break;
        case 10168:
          result = CFSTR("RAP_ADD_CATEGORY");
          break;
        case 10169:
          result = CFSTR("RAP_REMOVE_CATEGORY");
          break;
        case 10170:
          result = CFSTR("RAP_DESELECT_CATEGORY");
          break;
        case 10171:
          result = CFSTR("RAP_ADD_HOURS");
          break;
        case 10172:
          result = CFSTR("RAP_REMOVE_HOURS");
          break;
        case 10173:
          result = CFSTR("RAP_TAP_DAY_OF_WEEK");
          break;
        case 10174:
          result = CFSTR("RAP_TAP_24_HOURS_BUTTON");
          break;
        case 10175:
          result = CFSTR("RAP_TAP_OPEN_TIME");
          break;
        case 10176:
          result = CFSTR("RAP_TAP_CLOSED_TIME");
          break;
        case 10177:
          result = CFSTR("RAP_TAP_TEMPORARY_CLOSURE");
          break;
        case 10178:
          result = CFSTR("RAP_TAP_PERMANENTLY_CLOSED");
          break;
        case 10179:
          result = CFSTR("RAP_EDIT_WEBSITE");
          break;
        case 10180:
          result = CFSTR("RAP_EDIT_PHONE_NUMBER");
          break;
        case 10181:
          result = CFSTR("RAP_TAP_ACCEPTS_APPLE_PAY");
          break;
        case 10182:
          result = CFSTR("RAP_ADD_COMMENTS");
          break;
        case 10183:
          result = CFSTR("RAP_EDIT_LOCATION");
          break;
        case 10184:
          result = CFSTR("RAP_VIEW_LOCATION");
          break;
        case 10185:
          result = CFSTR("RAP_ZOOM_IN");
          break;
        case 10186:
          result = CFSTR("RAP_ZOOM_OUT");
          break;
        case 10187:
          result = CFSTR("RAP_VIEW_ENTRY_POINTS");
          break;
        case 10188:
          result = CFSTR("RAP_EDIT_EXISTING_ENTRY_POINT");
          break;
        case 10189:
          result = CFSTR("RAP_ADD_NEW_ENTRY_POINT");
          break;
        case 10190:
          result = CFSTR("RAP_REMOVE_ENTRY_POINT");
          break;
        case 10191:
          result = CFSTR("RAP_SELECT_ENTRY_POINT_TYPE");
          break;
        default:
          switch(a3)
          {
            case 11001:
              result = CFSTR("EXIT_MAPS_LOWER_WRIST");
              break;
            case 11002:
              result = CFSTR("TASK_READY");
              break;
            case 11003:
              result = CFSTR("TAP_SEARCH");
              break;
            case 11004:
              result = CFSTR("TAP_MY_LOCATION");
              break;
            case 11005:
              result = CFSTR("SHOW_NEARBY");
              break;
            case 11006:
              result = CFSTR("TAP_NEARBY");
              break;
            case 11007:
              result = CFSTR("TAP_PROACTIVE");
              break;
            case 11008:
              result = CFSTR("FORCE_PRESS");
              break;
            case 11009:
              result = CFSTR("TAP_CONTACTS");
              break;
            case 11010:
              result = CFSTR("TAP_TRANSIT");
              break;
            case 11011:
              result = CFSTR("TAP_DICTATION");
              break;
            case 11012:
              result = CFSTR("GET_DIRECTIONS_DRIVING");
              break;
            case 11013:
              result = CFSTR("GET_DIRECTIONS_WALKING");
              break;
            case 11014:
              result = CFSTR("GET_DIRECTIONS_TRANSIT");
              break;
            case 11015:
              result = CFSTR("OPEN_STANDARD_MAP");
              break;
            case 11016:
              result = CFSTR("OPEN_TRANSIT_MAP");
              break;
            case 11017:
              result = CFSTR("START_NAV_AUTO");
              break;
            case 11018:
              result = CFSTR("TAP_RECENT");
              break;
            case 11019:
              result = CFSTR("TAP_FAVORITE");
              break;
            case 11020:
              result = CFSTR("TAP_SCRIBBLE");
              break;
            case 11021:
              result = CFSTR("TAP_VIEW_MAP");
              break;
            case 11022:
              result = CFSTR("TAP_VIEW_TBT");
              break;
            case 11023:
              result = CFSTR("VIEW_ROUTE_INFO");
              break;
            case 11024:
              result = CFSTR("NAV_UNMUTE");
              break;
            case 11025:
              result = CFSTR("NAV_MUTE");
              break;
            case 11026:
              result = CFSTR("GET_DIRECTIONS_CYCLING");
              break;
            case 11027:
              result = CFSTR("TAP_SEARCH_HOME");
              break;
            case 11028:
              result = CFSTR("ROUTE_PAUSED_ON_WATCH");
              break;
            case 11029:
              result = CFSTR("NEXT_STOP_TAPPED_ON_WATCH");
              break;
            default:
              switch(a3)
              {
                case 12001:
                  result = CFSTR("VIEW_MORE_OPTIONS");
                  break;
                case 12002:
                  result = CFSTR("SELECT_TIME");
                  break;
                case 12003:
                  result = CFSTR("SHOW_NEXT_AVAILABLE");
                  break;
                case 12004:
                  result = CFSTR("DECREASE_TABLE_SIZE");
                  break;
                case 12005:
                  result = CFSTR("INCREASE_TABLE_SIZE");
                  break;
                case 12006:
                  result = CFSTR("EDIT_BOOKING");
                  break;
                case 12007:
                  result = CFSTR("EDIT_PHONE");
                  break;
                case 12008:
                  result = CFSTR("ADD_SPECIAL_REQUEST");
                  break;
                case 12009:
                  result = CFSTR("CHANGE_RESERVATION");
                  break;
                case 12010:
                  result = CFSTR("LEARN_MORE");
                  break;
                default:
                  goto LABEL_48;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v3 = CFSTR("UI_ACTION_UNKNOWN");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("PULL_UP");
        return v3;
      case 2:
        result = CFSTR("PULL_DOWN");
        break;
      case 3:
        result = CFSTR("TAP");
        break;
      case 4:
        result = CFSTR("CLOSE");
        break;
      case 5:
        result = CFSTR("SWIPE_PREV");
        break;
      case 6:
        result = CFSTR("SWIPE_NEXT");
        break;
      case 7:
        result = CFSTR("SCROLL_UP");
        break;
      case 8:
        result = CFSTR("SCROLL_DOWN");
        break;
      case 9:
      case 23:
      case 24:
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
      case 501:
      case 502:
      case 503:
      case 504:
      case 505:
      case 506:
      case 507:
      case 508:
      case 509:
      case 510:
      case 511:
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
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 612:
      case 613:
      case 614:
      case 615:
      case 616:
      case 617:
      case 618:
      case 619:
      case 620:
      case 621:
      case 622:
      case 623:
      case 624:
      case 625:
      case 626:
      case 627:
      case 628:
      case 629:
      case 630:
      case 631:
      case 632:
      case 633:
      case 634:
      case 635:
      case 636:
      case 637:
      case 638:
      case 639:
      case 640:
      case 641:
      case 642:
      case 643:
      case 644:
      case 645:
      case 646:
      case 647:
      case 648:
      case 649:
      case 650:
      case 651:
      case 652:
      case 653:
      case 654:
      case 655:
      case 656:
      case 657:
      case 658:
      case 659:
      case 660:
      case 661:
      case 662:
      case 663:
      case 664:
      case 665:
      case 666:
      case 667:
      case 668:
      case 669:
      case 670:
      case 671:
      case 672:
      case 673:
      case 674:
      case 675:
      case 676:
      case 677:
      case 678:
      case 679:
      case 680:
      case 681:
      case 682:
      case 683:
      case 684:
      case 685:
      case 686:
      case 687:
      case 688:
      case 689:
      case 690:
      case 691:
      case 692:
      case 693:
      case 694:
      case 695:
      case 696:
      case 697:
      case 698:
      case 699:
      case 700:
      case 701:
      case 702:
      case 703:
      case 704:
      case 705:
      case 706:
      case 707:
      case 708:
      case 709:
      case 710:
      case 711:
      case 712:
      case 713:
      case 714:
      case 715:
      case 716:
      case 717:
      case 718:
      case 719:
      case 720:
      case 721:
      case 722:
      case 723:
      case 724:
      case 725:
      case 726:
      case 727:
      case 728:
      case 729:
      case 730:
      case 731:
      case 732:
      case 733:
      case 734:
      case 735:
      case 736:
      case 737:
      case 738:
      case 739:
      case 740:
      case 741:
      case 742:
      case 743:
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
      case 801:
      case 802:
      case 803:
      case 804:
      case 805:
      case 806:
      case 807:
      case 808:
      case 809:
      case 810:
      case 811:
      case 812:
      case 813:
      case 814:
      case 815:
      case 816:
      case 817:
      case 818:
      case 819:
      case 820:
      case 821:
      case 822:
      case 823:
      case 824:
      case 825:
      case 826:
      case 827:
      case 828:
      case 829:
      case 830:
      case 831:
      case 832:
      case 833:
      case 834:
      case 835:
      case 836:
      case 837:
      case 838:
      case 839:
      case 840:
      case 841:
      case 842:
      case 843:
      case 844:
      case 845:
      case 846:
      case 847:
      case 848:
      case 849:
      case 850:
      case 851:
      case 852:
      case 853:
      case 854:
      case 855:
      case 856:
      case 857:
      case 858:
      case 859:
      case 860:
      case 861:
      case 862:
      case 863:
      case 864:
      case 865:
      case 866:
      case 867:
      case 868:
      case 869:
      case 870:
      case 871:
      case 872:
      case 873:
      case 874:
      case 875:
      case 876:
      case 877:
      case 878:
      case 879:
      case 880:
      case 881:
      case 882:
      case 883:
      case 884:
      case 885:
      case 886:
      case 887:
      case 888:
      case 889:
      case 890:
      case 891:
      case 892:
      case 893:
      case 894:
      case 895:
      case 896:
      case 897:
      case 898:
      case 899:
      case 900:
      case 901:
      case 902:
      case 903:
      case 904:
      case 905:
      case 906:
      case 907:
      case 908:
      case 909:
      case 910:
      case 911:
      case 912:
      case 913:
      case 914:
      case 915:
      case 916:
      case 917:
      case 918:
      case 919:
      case 920:
      case 921:
      case 922:
      case 923:
      case 924:
      case 925:
      case 926:
      case 927:
      case 928:
      case 929:
      case 930:
      case 931:
      case 932:
      case 933:
      case 934:
      case 935:
      case 936:
      case 937:
      case 938:
      case 939:
      case 940:
      case 941:
      case 942:
      case 943:
      case 944:
      case 945:
      case 946:
      case 947:
      case 948:
      case 949:
      case 950:
      case 951:
      case 952:
      case 953:
      case 954:
      case 955:
      case 956:
      case 957:
      case 958:
      case 959:
      case 960:
      case 961:
      case 962:
      case 963:
      case 964:
      case 965:
      case 966:
      case 967:
      case 968:
      case 969:
      case 970:
      case 971:
      case 972:
      case 973:
      case 974:
      case 975:
      case 976:
      case 977:
      case 978:
      case 979:
      case 980:
      case 981:
      case 982:
      case 983:
      case 984:
      case 985:
      case 986:
      case 987:
      case 988:
      case 989:
      case 990:
      case 991:
      case 992:
      case 993:
      case 994:
      case 995:
      case 996:
      case 997:
      case 998:
      case 999:
      case 1000:
      case 1005:
      case 1006:
      case 1007:
      case 1008:
      case 1009:
      case 1012:
      case 1013:
      case 1014:
      case 1015:
      case 1016:
      case 1019:
      case 1021:
      case 1022:
      case 1023:
      case 1024:
      case 1025:
      case 1026:
      case 1027:
      case 1028:
      case 1029:
        goto LABEL_48;
      case 10:
        result = CFSTR("SHOW_MORE");
        break;
      case 11:
        result = CFSTR("SHOW_LESS");
        break;
      case 12:
        result = CFSTR("SWIPE_LEFT");
        break;
      case 13:
        result = CFSTR("SWIPE_RIGHT");
        break;
      case 14:
        result = CFSTR("MINIMIZE");
        break;
      case 15:
        result = CFSTR("TAP_PREV");
        break;
      case 16:
        result = CFSTR("TAP_NEXT");
        break;
      case 17:
        result = CFSTR("SUBMIT");
        break;
      case 18:
        result = CFSTR("CANCEL");
        break;
      case 19:
        result = CFSTR("ENTER_MAPS");
        break;
      case 20:
        result = CFSTR("EXIT_MAPS");
        break;
      case 21:
        result = CFSTR("REVEAL");
        break;
      case 22:
        result = CFSTR("OPEN_NEW_TAB");
        break;
      case 25:
        result = CFSTR("BACK");
        break;
      case 26:
        result = CFSTR("ACTIVATE");
        break;
      case 27:
        result = CFSTR("DEACTIVATE");
        break;
      case 28:
        result = CFSTR("AGREE");
        break;
      case 29:
        result = CFSTR("DISAGREE");
        break;
      case 30:
        result = CFSTR("SKIP_ANSWER");
        break;
      case 31:
        result = CFSTR("EXPAND");
        break;
      case 32:
        result = CFSTR("COLLAPSE");
        break;
      case 33:
        result = CFSTR("ENTER");
        break;
      case 34:
        result = CFSTR("EXIT");
        break;
      case 35:
        result = CFSTR("SCROLL_UP_INDEX_BAR");
        break;
      case 36:
        result = CFSTR("SCROLL_DOWN_INDEX_BAR");
        break;
      case 37:
        result = CFSTR("TOGGLE_ON");
        break;
      case 38:
        result = CFSTR("TOGGLE_OFF");
        break;
      case 39:
        result = CFSTR("LONG_PRESS");
        break;
      case 40:
        result = CFSTR("CLICK");
        break;
      case 41:
        result = CFSTR("TAP_DONE");
        break;
      case 42:
        result = CFSTR("TAP_CLOSE");
        break;
      case 43:
        result = CFSTR("SCROLL_LEFT");
        break;
      case 44:
        result = CFSTR("SCROLL_RIGHT");
        break;
      case 45:
        result = CFSTR("DISPLAY");
        break;
      case 46:
        result = CFSTR("OPEN_IN_APP");
        break;
      case 47:
        result = CFSTR("CONCEAL");
        break;
      case 48:
        result = CFSTR("TAP_DELETE");
        break;
      case 49:
        result = CFSTR("TAP_FILTER");
        break;
      case 50:
        result = CFSTR("TAP_SECONDARY_BUTTON");
        break;
      case 51:
        result = CFSTR("TAP_WIDGET_FOOD");
        break;
      case 52:
        result = CFSTR("TAP_WIDGET_GAS");
        break;
      case 53:
        result = CFSTR("TAP_WIDGET_LOADING");
        break;
      case 54:
        result = CFSTR("TAP_WIDGET_SEARCH");
        break;
      case 55:
        result = CFSTR("TAP_WIDGET_STORES");
        break;
      case 56:
        result = CFSTR("DISPLAY_ALLOW_ONCE_PROMPT");
        break;
      case 57:
        result = CFSTR("SHARE_CURRENT_LOCATION");
        break;
      case 58:
        result = CFSTR("SHARE_PHOTO");
        break;
      case 59:
        result = CFSTR("TAP_KEEP_OFF");
        break;
      case 60:
        result = CFSTR("TAP_PHOTO_CATEGORY");
        break;
      case 61:
        result = CFSTR("TAP_PRECISE_LOCATION_OFF_BANNER");
        break;
      case 62:
        result = CFSTR("TAP_TURN_ON");
        break;
      case 63:
        result = CFSTR("DISPLAY_CYCLING_ANNOTATION");
        break;
      case 64:
        result = CFSTR("DISPLAY_DRIVING_DEFAULT_OPTION");
        break;
      case 65:
        result = CFSTR("DISPLAY_TRANSIT_DEFAULT_OPTION");
        break;
      case 66:
        result = CFSTR("DISPLAY_WALKING_DEFAULT_OPTION");
        break;
      case 67:
        result = CFSTR("TAP_CYCLING_ANNOTATION");
        break;
      case 68:
        result = CFSTR("TAP_DRIVING_DEFAULT_OPTION");
        break;
      case 69:
        result = CFSTR("TAP_TRANSIT_DEFAULT_OPTION");
        break;
      case 70:
        result = CFSTR("TAP_WALKING_DEFAULT_OPTION");
        break;
      case 71:
        result = CFSTR("DISPLAY_RIDESHARE_DEFAULT_OPTION");
        break;
      case 72:
        result = CFSTR("TAP_RIDESHARE_DEFAULT_OPTION");
        break;
      case 73:
        result = CFSTR("TAP_PERSONAL_COLLECTION");
        break;
      case 74:
        result = CFSTR("RESUME_ROUTE");
        break;
      case 75:
        result = CFSTR("DISPLAY_OUT_OF_RANGE_ALERT");
        break;
      case 76:
        result = CFSTR("TAP_ALLOW_ONCE");
        break;
      case 77:
        result = CFSTR("TAP_DO_NOT_ALLOW");
        break;
      case 78:
        result = CFSTR("ADD_RECCOMENDED_FAVORITE");
        break;
      case 79:
        result = CFSTR("ADD_RECOMMENDED_HOME_FAVORITE");
        break;
      case 80:
        result = CFSTR("ADD_RECOMMENDED_SCHOOL_FAVORITE");
        break;
      case 81:
        result = CFSTR("ADD_RECOMMENDED_WORK_FAVORITE");
        break;
      case 82:
        result = CFSTR("CREATE_RECCOMENDED_SCHOOL_FAVORITE");
        break;
      case 83:
        result = CFSTR("CREATE_SCHOOL_FAVORITE");
        break;
      case 84:
        result = CFSTR("TAP_SCHOOL_FAVORITE");
        break;
      case 85:
        result = CFSTR("SELECT_ROUTING_TYPE_CYCLING");
        break;
      case 86:
        result = CFSTR("REPORT_PHOTO");
        break;
      case 87:
        result = CFSTR("TAP_LARGE_WIDGET_BROWSE_CATEGORY");
        break;
      case 88:
        result = CFSTR("TAP_MEDIUM_WIDGET_BROWSE_CATEGORY");
        break;
      case 89:
        result = CFSTR("TAP_SMALL_WIDGET_BROWSE_CATEGORY");
        break;
      case 90:
        result = CFSTR("CREATE_RECOMMENDED_FAVORITE");
        break;
      case 91:
        result = CFSTR("CREATE_RECOMMENDED_HOME_FAVORITE");
        break;
      case 92:
        result = CFSTR("CREATE_RECOMMENDED_SCHOOL_FAVORITE");
        break;
      case 93:
        result = CFSTR("CREATE_RECOMMENDED_WORK_FAVORITE");
        break;
      case 94:
        result = CFSTR("TAP_SMALL_WIDGET_ITEM");
        break;
      case 95:
        result = CFSTR("TAP_MEDIUM_WIDGET_ITEM");
        break;
      case 96:
        result = CFSTR("TAP_LARGE_WIDGET_ITEM");
        break;
      case 97:
        result = CFSTR("DISPLAY_ARP_TIPKIT");
        break;
      case 98:
        result = CFSTR("NEXT");
        break;
      case 99:
        result = CFSTR("TAP_RATE_AND_ADD_PHOTOS");
        break;
      case 100:
        result = CFSTR("TAP_TO_ADD_POSITIVE_RATING");
        break;
      case 101:
        result = CFSTR("TAP_TO_ADD_NEGATIVE_RATING");
        break;
      case 102:
        result = CFSTR("TAP_ACTIVE_SHARING_NOTIFICATION");
        break;
      case 103:
        result = CFSTR("INVOKE_SIRI_PROMPT");
        break;
      case 104:
        result = CFSTR("ETA_SHARED_SUCCESSFULLY");
        break;
      case 105:
        result = CFSTR("ENDED_ETA_SHARE_SUCCESSFULLY");
        break;
      case 106:
        result = CFSTR("CLEAR_INCIDENT");
        break;
      case 107:
        result = CFSTR("CONFIRM_INCIDENT");
        break;
      case 108:
        result = CFSTR("DISMISS_INCIDENT");
        break;
      case 109:
        result = CFSTR("INCIDENT_ALERT_TIMEOUT");
        break;
      case 110:
        result = CFSTR("INCIDENT_ALERT_TRAY_SHOWN");
        break;
      case 111:
        result = CFSTR("INCIDENT_CARD_SHOWN");
        break;
      case 112:
        result = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN");
        break;
      case 113:
        result = CFSTR("INCIDENT_REPORT_TRAY_SHOWN");
        break;
      case 114:
        result = CFSTR("NAV_TRAY_DISCOVERY_SHOWN");
        break;
      case 115:
        result = CFSTR("TAP_TO_REPORT_INCIDENT");
        break;
      case 116:
        result = CFSTR("TAP_SHORTCUT");
        break;
      case 117:
        result = CFSTR("BLOCK_CONTACT");
        break;
      case 118:
        result = CFSTR("TAP_TO_ADD_RATING");
        break;
      case 119:
        result = CFSTR("AR_WALKING_LOCALIZATION_FAILED");
        break;
      case 120:
        result = CFSTR("AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE");
        break;
      case 121:
        result = CFSTR("AR_WALKING_LOCALIZATION_SUCCESSFUL");
        break;
      case 122:
        result = CFSTR("AR_WALKING_LOCALIZATION_USER_ABANDON");
        break;
      case 123:
        result = CFSTR("ATTEMPT_AR_WALKING_LOCALIZATION");
        break;
      case 124:
        result = CFSTR("RAISE_TO_ENTER_AR_WALKING");
        break;
      case 125:
        result = CFSTR("TAP_DISMISS");
        break;
      case 126:
        result = CFSTR("TAP_ENTER_AR_WALKING");
        break;
      case 127:
        result = CFSTR("TAP_OK");
        break;
      case 128:
        result = CFSTR("TAP_TRY_AGAIN");
        break;
      case 129:
        result = CFSTR("TAP_TURN_ON_IN_SETTINGS");
        break;
      case 130:
        result = CFSTR("VLF_CORRECTION_FAILED_TO_INITIALIZE");
        break;
      case 131:
        result = CFSTR("VLF_CORRECTION_USER_ABANDON");
        break;
      case 132:
        result = CFSTR("AREA_EVENTS_ALERT");
        break;
      case 133:
        result = CFSTR("TAP_SHOW_EVENTS_ADVISORY_DETAILS");
        break;
      case 134:
        result = CFSTR("ACCEPT_EVENT_REROUTE");
        break;
      case 135:
        result = CFSTR("DISPLAY_AREA_EVENTS_ADVISORY");
        break;
      case 136:
        result = CFSTR("DISMISS_EVENT_REROUTE");
        break;
      case 137:
        result = CFSTR("PUNCH_OUT_EVENTS_LINK");
        break;
      case 138:
        result = CFSTR("SELECT_VOICE_GUIDANCE_ALERTS_ONLY");
        break;
      case 139:
        result = CFSTR("ADJUST_GUIDANCE_SETTINGS");
        break;
      case 140:
        result = CFSTR("HIDE_DETAILS");
        break;
      case 141:
        result = CFSTR("SELECT_VOICE_GUIDANCE_ON");
        break;
      case 142:
        result = CFSTR("SELECT_VOICE_GUIDANCE_OFF");
        break;
      case 143:
        result = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE");
        break;
      case 144:
        result = CFSTR("TAP_TEXT_LABEL");
        break;
      case 145:
        result = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_WALKING");
        break;
      case 146:
        result = CFSTR("TAP_EXIT");
        break;
      case 147:
        result = CFSTR("TAP_CITY_MENU");
        break;
      case 148:
        result = CFSTR("CHECK_AVOID_TOLLS");
        break;
      case 149:
        result = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT");
        break;
      case 150:
        result = CFSTR("TAP_ICLOUD");
        break;
      case 151:
        result = CFSTR("CHECK_AVOID_HIGHWAYS");
        break;
      case 152:
        result = CFSTR("TAP_FAVORITES");
        break;
      case 153:
        result = CFSTR("SELECT_DISTANCE_IN_KM");
        break;
      case 154:
        result = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE");
        break;
      case 155:
        result = CFSTR("OPEN_FULL_CARD_FILTER");
        break;
      case 156:
        result = CFSTR("SCROLL_TEMPORAL_COLLECTION_BACKWARD");
        break;
      case 157:
        result = CFSTR("OPEN_SINGLE_CARD_FILTER");
        break;
      case 158:
        result = CFSTR("SELECT_RESULT_REFINEMENT_MULTI_SELECT");
        break;
      case 159:
        result = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE");
        break;
      case 160:
        result = CFSTR("SESSIONLESS_REVEAL");
        break;
      case 161:
        result = CFSTR("SCROLL_CITY_CURATED_COLLECTION_BACKWARD");
        break;
      case 162:
        result = CFSTR("SCROLL_TEMPORAL_COLLECTION_FORWARD");
        break;
      case 163:
        result = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_CYCLING");
        break;
      case 164:
        result = CFSTR("ENTER_RAP_REPORT_MENU");
        break;
      case 165:
        result = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_DRIVING");
        break;
      case 166:
        result = CFSTR("TAP_MY_VEHICLES");
        break;
      case 167:
        result = CFSTR("SUBMIT_SINGLE_CARD_FILTER");
        break;
      case 168:
        result = CFSTR("SUBMIT_FULL_CARD_FILTER");
        break;
      case 169:
        result = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE");
        break;
      case 170:
        result = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE");
        break;
      case 171:
        result = CFSTR("TAP_EXPLORE_CURATED_COLELCTIONS");
        break;
      case 172:
        result = CFSTR("TAP_ACCOUNT");
        break;
      case 173:
        result = CFSTR("TAP_WORLDWIDE_CURATED_COLLECTIONS");
        break;
      case 174:
        result = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE");
        break;
      case 175:
        result = CFSTR("TAP_RECENTLY_VIEWED_CURATED_COLLECTION");
        break;
      case 176:
        result = CFSTR("RESULT_REFINEMENT_TOGGLE_OFF");
        break;
      case 177:
        result = CFSTR("TAP_CITY_CURATED_COLLECTIONS");
        break;
      case 178:
        result = CFSTR("TAP_REPORTS");
        break;
      case 179:
        result = CFSTR("TAP_RATINGS");
        break;
      case 180:
        result = CFSTR("TAP_EXPLORE_CURATED_COLLECTIONS");
        break;
      case 181:
        result = CFSTR("TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION");
        break;
      case 182:
        result = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE");
        break;
      case 183:
        result = CFSTR("SELECT_DISTANCE_IN_MILES");
        break;
      case 184:
        result = CFSTR("TAP_PRIVACY_STATEMENT");
        break;
      case 185:
        result = CFSTR("TAP_MAPS_SETTINGS");
        break;
      case 186:
        result = CFSTR("CANCEL_FULL_CARD_FILTER");
        break;
      case 187:
        result = CFSTR("TAP_LATEST_CURATED_COLLECTION");
        break;
      case 188:
        result = CFSTR("TAP_TEMPORAL_CURATED_COLLECTION");
        break;
      case 189:
        result = CFSTR("UNCHECK_AVOID_TOLLS");
        break;
      case 190:
        result = CFSTR("UNSELECT_SEARCH_REFINEMENT");
        break;
      case 191:
        result = CFSTR("TAP_RATING");
        break;
      case 192:
        result = CFSTR("TAP_ICLOUD_SIGN_IN");
        break;
      case 193:
        result = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE");
        break;
      case 194:
        result = CFSTR("TAP_POI_HIGHLIGHTED_AUXILIARY");
        break;
      case 195:
        result = CFSTR("UNCHECK_AVOID_HIGHWAYS");
        break;
      case 196:
        result = CFSTR("SCROLL_CITY_CURATED_COLLECTION_FORWARD");
        break;
      case 197:
        result = CFSTR("RESULT_REFINEMENT_TOGGLE_ON");
        break;
      case 198:
        result = CFSTR("TAP_CONTEXT_LINE_HYPERLINK");
        break;
      case 199:
        result = CFSTR("TAP_MY_GUIDES");
        break;
      case 200:
        result = CFSTR("SELECT_SEARCH_REFINEMENT");
        break;
      case 201:
        result = CFSTR("SESSIONLESS_TAP_ACCOUNT");
        break;
      case 202:
        result = CFSTR("UNSELECT_RESULT_REFINEMENT_MULTI_SELECT");
        break;
      case 203:
        result = CFSTR("TAP_TRAVEL_PREFERENCES");
        break;
      case 204:
        result = CFSTR("SHOW_CURATED_COLLECTION_LIST");
        break;
      case 205:
        result = CFSTR("CANCEL_SINGLE_CARD_FILTER");
        break;
      case 206:
        result = CFSTR("DISPLAY_HFP_OPTION");
        break;
      case 207:
        result = CFSTR("SWITCH_OFF_HFP");
        break;
      case 208:
        result = CFSTR("SWITCH_ON_HFP");
        break;
      case 209:
        result = CFSTR("TAP_QUICK_ACTION_TRAY");
        break;
      case 210:
        result = CFSTR("SHOW_ALL_CITIES");
        break;
      case 211:
        result = CFSTR("TAP_ADD_NEARBY_TRANSIT");
        break;
      case 212:
        result = CFSTR("RESUME");
        break;
      case 213:
        result = CFSTR("DISPLAY_TIPKIT_PROMPT");
        break;
      case 214:
        result = CFSTR("TAP_NEARBY_TRANSIT_FAVORITE");
        break;
      case 215:
        result = CFSTR("TAP_DRIVING_MODE");
        break;
      case 216:
        result = CFSTR("SWITCH_ON_VOICE_GUIDANCE");
        break;
      case 217:
        result = CFSTR("DISMISS_TIPKIT_PROMPT");
        break;
      case 218:
        result = CFSTR("TAP_EXPAND_EXIT_DETAILS");
        break;
      case 219:
        result = CFSTR("TAP_NEARBY_TRANSIT_FILTER");
        break;
      case 220:
        result = CFSTR("TAP_MORE_DEPARTURES");
        break;
      case 221:
        result = CFSTR("RAP_INDIVIDUAL_PLACE");
        break;
      case 222:
        result = CFSTR("RAP_ADD_MAP");
        break;
      case 223:
        result = CFSTR("TAP_SUGGESTED_RAP");
        break;
      case 224:
        result = CFSTR("RAP_STREET_ISSUE");
        break;
      case 225:
        result = CFSTR("SWIPE_PIN_REVEAL");
        break;
      case 226:
        result = CFSTR("TAP_ADD_TIPKIT_FAVORITE");
        break;
      case 227:
        result = CFSTR("SCROLL_VEHICLE_INFORMATION_BACKWARD");
        break;
      case 228:
        result = CFSTR("RAP_BAD_TRIP");
        break;
      case 229:
        result = CFSTR("RAP_PLACE_ISSUE");
        break;
      case 230:
        result = CFSTR("TAP_OPEN_MAPS");
        break;
      case 231:
        result = CFSTR("TAP_NEARBY_TRANSIT_RESULT");
        break;
      case 232:
        result = CFSTR("RAP_GUIDE");
        break;
      case 233:
        result = CFSTR("SWITCH_OFF_VOICE_GUIDANCE");
        break;
      case 234:
        result = CFSTR("DISPLAY_TRIP_FEEDBACK_MESSAGE");
        break;
      case 235:
        result = CFSTR("SELECT_TRANSIT_STEP");
        break;
      case 236:
        result = CFSTR("SCROLL_VEHICLE_INFORMATION_FORWARD");
        break;
      case 237:
        result = CFSTR("TAP_SEE_MORE");
        break;
      case 238:
        result = CFSTR("RAP_IN_REVIEW");
        break;
      case 239:
        result = CFSTR("TAP_OPEN_MENU");
        break;
      case 240:
        result = CFSTR("TAP_NEARBY_TRANSIT");
        break;
      case 241:
        result = CFSTR("TAP_PIN_LINE");
        break;
      case 242:
        result = CFSTR("SWITCH_OFF_TRIP_FEEDBACK");
        break;
      case 243:
        result = CFSTR("RAP_GOOD_TRIP");
        break;
      case 244:
        result = CFSTR("TAP_FILTERED_CURATED_COLLECTION");
        break;
      case 245:
        result = CFSTR("SHARE_MY_LOCATION");
        break;
      case 246:
        result = CFSTR("ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION");
        break;
      case 247:
        result = CFSTR("DISPLAY_GENERIC_ADVISORY");
        break;
      case 248:
        result = CFSTR("ADVISORY_ALERT");
        break;
      case 249:
        result = CFSTR("PUNCH_OUT_LINK");
        break;
      case 250:
        result = CFSTR("TAP_GENERIC_ADVISORY");
        break;
      case 251:
        result = CFSTR("TAP_EXPLORE_MODE");
        break;
      case 252:
        result = CFSTR("TAP_UNPIN_LINE");
        break;
      case 253:
        result = CFSTR("MENU_UNPIN");
        break;
      case 254:
        result = CFSTR("MENU_PIN");
        break;
      case 255:
        result = CFSTR("SWIPE_PIN");
        break;
      case 256:
        result = CFSTR("SWIPE_UNPIN");
        break;
      case 257:
        result = CFSTR("TAP_MEDIA_APP");
        break;
      case 258:
        result = CFSTR("TAP_GUIDES_SUBACTION");
        break;
      case 259:
        result = CFSTR("TAP_MEDIA");
        break;
      case 260:
        result = CFSTR("PUNCH_OUT_MEDIA");
        break;
      case 261:
        result = CFSTR("SHOW_MEDIA_APP_MENU");
        break;
      case 262:
        result = CFSTR("SCROLL_RIGHT_RIBBON");
        break;
      case 263:
        result = CFSTR("SCROLL_LEFT_RIBBON");
        break;
      case 264:
        result = CFSTR("TAP_GOOD_TO_KNOW_MORE_BUTTON");
        break;
      case 265:
        result = CFSTR("TAP_SHOW_MORE_TEXT");
        break;
      case 266:
        result = CFSTR("SCROLL_LEFT_RATINGS");
        break;
      case 267:
        result = CFSTR("SCROLL_LEFT_TEMPLATE_PLACE");
        break;
      case 268:
        result = CFSTR("SCROLL_RIGHT_TEMPLATE_PLACE");
        break;
      case 269:
        result = CFSTR("SCROLL_RIGHT_RATINGS");
        break;
      case 270:
        result = CFSTR("TAP_ALLOW");
        break;
      case 271:
        result = CFSTR("TAP_GO_TO_SETTING");
        break;
      case 272:
        result = CFSTR("START_SUBMIT_REPORT");
        break;
      case 273:
        result = CFSTR("AUTHENTICATION_INFO_FAILURE");
        break;
      case 274:
        result = CFSTR("SUCCESSFULLY_SUBMIT_REPORT");
        break;
      case 275:
        result = CFSTR("FAILED_SUBMIT_REPORT");
        break;
      case 276:
        result = CFSTR("AUTHENTICATION_INFO_SUCCESS");
        break;
      case 277:
        result = CFSTR("EDIT_WAYPOINT");
        break;
      case 278:
        result = CFSTR("CLEAR_TEXT");
        break;
      case 279:
        result = CFSTR("REORDER_WAYPOINT");
        break;
      case 280:
        result = CFSTR("REMOVE_WAYPOINT");
        break;
      case 281:
        result = CFSTR("TAP_SECONDARY_MULTI_VENDORS_SELECTION");
        break;
      case 282:
        result = CFSTR("TAP_SHOWCASE_MENU");
        break;
      case 283:
        result = CFSTR("TAP_SHORTCUT_MULTI_VENDORS_SELECTION");
        break;
      case 284:
        result = CFSTR("TAP_PHOTO_ALBUM");
        break;
      case 285:
        result = CFSTR("RESEARVE_TABLE_MULTI_VENDORS_SELECTION");
        break;
      case 286:
        result = CFSTR("RAP_INLINE_ADD");
        break;
      case 287:
        result = CFSTR("RAP_TAP_EDIT");
        break;
      case 288:
        result = CFSTR("CLAIM_BUSINESS");
        break;
      case 289:
        result = CFSTR("RAP_EDIT_OPTIONS");
        break;
      case 290:
        result = CFSTR("TAP_IN_REVIEW_RAP");
        break;
      case 291:
        result = CFSTR("ORB_MENU_ADD_STOP");
        break;
      case 292:
        result = CFSTR("NEXT_STOP");
        break;
      case 293:
        result = CFSTR("ARRIVE_AT_WAYPOINT");
        break;
      case 294:
        result = CFSTR("REMOVE_STOP");
        break;
      case 295:
        result = CFSTR("DISPLAY_PAUSE_BUTTON");
        break;
      case 296:
        result = CFSTR("DISPLAY_PAUSE_NEXT_BUTTONS");
        break;
      case 297:
        result = CFSTR("AUTO_ADVANCE_NEXT_STOP");
        break;
      case 298:
        result = CFSTR("ADD_INLINE_NEGATIVE_RATING");
        break;
      case 299:
        result = CFSTR("ADD_INLINE_POSITIVE_RATING");
        break;
      case 300:
        result = CFSTR("TAP_TO_ADD_RATING_AND_PHOTO");
        break;
      case 301:
        result = CFSTR("SUBMIT_RATINGS_AND_PHOTOS");
        break;
      case 302:
        result = CFSTR("TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE");
        break;
      case 303:
        result = CFSTR("TAP_RECENTLY_VIEWED_ROUTE");
        break;
      case 304:
        result = CFSTR("SHOW_ALL_RECENTS");
        break;
      case 305:
        result = CFSTR("RESUME_MULTIPOINT_ROUTE");
        break;
      case 306:
        result = CFSTR("DISMISS_TRANSIT_TIPKIT");
        break;
      case 307:
        result = CFSTR("DISPLAY_TRANSIT_TIPKIT");
        break;
      case 308:
        result = CFSTR("TAP_TRANSIT_TIPKIT");
        break;
      case 309:
        result = CFSTR("FILTER_EV");
        break;
      case 310:
        result = CFSTR("FILTER_SURCHARGE");
        break;
      case 311:
        result = CFSTR("FILTER_PREFER");
        break;
      case 312:
        result = CFSTR("TAP_WALKING_ANNOTATION");
        break;
      case 313:
        result = CFSTR("FILTER_AVOID");
        break;
      case 314:
        result = CFSTR("FILTER_TRANSPORTATION_MODE");
        break;
      case 315:
        result = CFSTR("FILTER_RECOMMENDED_ROUTES");
        break;
      case 316:
        result = CFSTR("FILTER_IC_FARES");
        break;
      case 317:
        result = CFSTR("FILTER_TRANSIT_CARD_FARES");
        break;
      case 318:
        result = CFSTR("RESERVE_TABLE_MULTI_VENDORS_SELECTION");
        break;
      case 319:
        result = CFSTR("TAP_NOTIFICATION_SETTINGS");
        break;
      case 320:
        result = CFSTR("TAP_ENABLE_NOTIFICATION");
        break;
      case 321:
        result = CFSTR("ARP_SUGGESTIONS_TURN_OFF");
        break;
      case 322:
        result = CFSTR("ARP_SUGGESTIONS_TURN_ON");
        break;
      case 323:
        result = CFSTR("DISMISS_ARP_SUGGESTION");
        break;
      case 324:
        result = CFSTR("RATINGS_AND_PHOTOS_TURN_ON");
        break;
      case 325:
        result = CFSTR("SCROLL_RIGHT_SUGGESTED_PHOTOS");
        break;
      case 326:
        result = CFSTR("UNSELECT_SUGGESTED_PHOTOS");
        break;
      case 327:
        result = CFSTR("SUGGESTED_PHOTOS_SHOWN");
        break;
      case 328:
        result = CFSTR("DISMISS_PHOTOS_LIVE_NOTIFICATION");
        break;
      case 329:
        result = CFSTR("TAP_YOUR_PHOTOS_ALBUM");
        break;
      case 330:
        result = CFSTR("RATINGS_AND_PHOTOS_TURN_OFF");
        break;
      case 331:
        result = CFSTR("DELETE_PHOTO");
        break;
      case 332:
        result = CFSTR("DISPLAY_PHOTOS_LIVE_NOTIFICATION");
        break;
      case 333:
        result = CFSTR("SCROLL_LEFT_SUGGESTED_PHOTOS");
        break;
      case 334:
        result = CFSTR("TAP_PHOTOS_LIVE_NOTIFICATION");
        break;
      case 335:
        result = CFSTR("DISPLAY_YOUR_PHOTOS_ALBUM");
        break;
      case 336:
        result = CFSTR("SELECT_SUGGESTED_PHOTOS");
        break;
      case 337:
        result = CFSTR("ADD_STOP");
        break;
      case 338:
        result = CFSTR("SHOW_CREDIT_TURN_ON");
        break;
      case 339:
        result = CFSTR("DISPLAY_ARP_SUGGESTION");
        break;
      case 340:
        result = CFSTR("TAP_TO_ADD_PHOTO_CREDIT");
        break;
      case 341:
        result = CFSTR("SHOW_CREDIT_TURN_OFF");
        break;
      case 342:
        result = CFSTR("TAP_TO_EDIT_NICKNAME");
        break;
      case 343:
        result = CFSTR("SUBMIT_RATINGS");
        break;
      case 344:
        result = CFSTR("END_NAV_ON_WATCH");
        break;
      case 345:
        result = CFSTR("FILTER_EBIKE");
        break;
      case 356:
        result = CFSTR("ADD_STOP_SIRI");
        break;
      case 357:
        result = CFSTR("TAP_REVIEWED_RAP");
        break;
      case 358:
        result = CFSTR("TAP_OUTREACH_RAP");
        break;
      case 359:
        result = CFSTR("DISPLAY_SUGGESTED_ITEM");
        break;
      case 360:
        result = CFSTR("DISPLAY_HIKING_TIPKIT");
        break;
      case 361:
        result = CFSTR("DISMISS_HIKING_TIPKIT");
        break;
      case 362:
        result = CFSTR("TAP_HIKING_TIPKIT");
        break;
      case 363:
        result = CFSTR("SCROLL_LEFT_TRAILS");
        break;
      case 364:
        result = CFSTR("TAP_MORE_TRAILS");
        break;
      case 365:
        result = CFSTR("TAP_RELATED_TRAIL");
        break;
      case 366:
        result = CFSTR("DISPLAY_EXPIRED_SHOWCASE_ERROR");
        break;
      case 367:
        result = CFSTR("SCROLL_RIGHT_TRAILS");
        break;
      case 368:
        result = CFSTR("SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS");
        break;
      case 369:
        result = CFSTR("DISPLAY_DOWNLOAD_MAPS_ALERTS");
        break;
      case 370:
        result = CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS");
        break;
      case 371:
        result = CFSTR("TAP_DOWNLOAD_MAPS_TIPKIT");
        break;
      case 372:
        result = CFSTR("SELECT_DOWNLOAD_OFFLINE_MAPS");
        break;
      case 373:
        result = CFSTR("EXPIRED_MAPS_REMOVED");
        break;
      case 374:
        result = CFSTR("UPDATE_ALL_DOWNLOAD_MAPS");
        break;
      case 375:
        result = CFSTR("TAP_EXPIRED_MAPS");
        break;
      case 376:
        result = CFSTR("DISPLAY_COMPLETE_DOWNLOAD_MAPS");
        break;
      case 377:
        result = CFSTR("MOVE_DOWNLOAD_MAPS");
        break;
      case 378:
        result = CFSTR("SAVE_RENAME_DOWNLOAD_MAPS");
        break;
      case 379:
        result = CFSTR("TAP_COMPLETE_DOWNLOAD_MAPS");
        break;
      case 380:
        result = CFSTR("TAP_ENTER_OFFLINE_MAPS");
        break;
      case 381:
        result = CFSTR("TAP_DOWNLOAD_MAPS");
        break;
      case 382:
        result = CFSTR("TAP_DOWNLOAD_MAPS_CONTINUE");
        break;
      case 383:
        result = CFSTR("DELETE_DOWNLOAD_MAPS");
        break;
      case 384:
        result = CFSTR("SLIDE_CLEAR_EXPIRED_MAPS");
        break;
      case 385:
        result = CFSTR("RENAME_DOWNLOAD_MAPS");
        break;
      case 386:
        result = CFSTR("RESIZE_DOWNLOAD_MAPS");
        break;
      case 387:
        result = CFSTR("DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS");
        break;
      case 388:
        result = CFSTR("RESTORE_EXPIRED_MAPS");
        break;
      case 389:
        result = CFSTR("CLEAR_EXPIRED_MAPS");
        break;
      case 390:
        result = CFSTR("TAP_USING_OFFLINE_BAR");
        break;
      case 391:
        result = CFSTR("UPDATE_DOWNLOAD_MAPS");
        break;
      case 392:
        result = CFSTR("DISPLAY_DOWNLOAD_MAPS_TIPKIT");
        break;
      case 393:
        result = CFSTR("DISPLAY_DOWNLOAD_MAPS");
        break;
      case 394:
        result = CFSTR("TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION");
        break;
      case 395:
        result = CFSTR("DISPLAY_EXPIRED_MAPS");
        break;
      case 396:
        result = CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS");
        break;
      case 397:
        result = CFSTR("DISPLAY_SUGGESTED_DOWNLOAD_MAPS");
        break;
      case 398:
        result = CFSTR("SLIDE_RESTORE_EXPIRED_MAPS");
        break;
      case 399:
        result = CFSTR("ETA_SHARE_TRAY_TIMEOUT");
        break;
      case 400:
        result = CFSTR("START_ETA_SHARING");
        break;
      case 401:
        result = CFSTR("PERSON_LOCATION_UPDATE");
        break;
      case 402:
        result = CFSTR("STOP_ETA_SHARING");
        break;
      case 403:
        result = CFSTR("PUNCH_OUT_TO_FINDMY");
        break;
      case 404:
        result = CFSTR("TAP_PEOPLE_LOCATION");
        break;
      case 405:
        result = CFSTR("TAP_TO_REQUEST_LOCATION");
        break;
      case 406:
        result = CFSTR("ZOOM_OUT_CROWN");
        break;
      case 407:
        result = CFSTR("TAP_RESIZE_DOWNLOAD_MAPS");
        break;
      case 408:
        result = CFSTR("TAP_DELETE_DOWNLOAD_MAPS");
        break;
      case 409:
        result = CFSTR("SELECT_LIST_VIEW");
        break;
      case 410:
        result = CFSTR("SCROLL_RIGHT_TRAILHEADS");
        break;
      case 411:
        result = CFSTR("SWITCH_TO_ONLINE_MODE");
        break;
      case 412:
        result = CFSTR("TAP_RELATED_TRAILHEAD");
        break;
      case 413:
        result = CFSTR("SELECT_ELEVATION_VIEW");
        break;
      case 414:
        result = CFSTR("TOGGLE_PROXIMITY_RADIUS_ON");
        break;
      case 415:
        result = CFSTR("SEE_MORE_RECENTS");
        break;
      case 416:
        result = CFSTR("SEE_MORE_GUIDES");
        break;
      case 417:
        result = CFSTR("SELECT_CONTROLS");
        break;
      case 418:
        result = CFSTR("NO_SEARCH_RESULTS");
        break;
      case 419:
        result = CFSTR("TAP_VIEW_RESULTS_CAROUSEL");
        break;
      case 420:
        result = CFSTR("TAP_VIEW_RESULTS_LIST");
        break;
      case 421:
        result = CFSTR("SELECT_MAP_VIEW");
        break;
      case 422:
        result = CFSTR("SCROLL_LEFT_TRAILHEADS");
        break;
      case 423:
        result = CFSTR("SWITCH_TO_OFFLINE_MODE");
        break;
      case 424:
        result = CFSTR("ZOOM_IN_CROWN");
        break;
      case 425:
        result = CFSTR("TOGGLE_PROXIMITY_RADIUS_OFF");
        break;
      case 426:
        result = CFSTR("TAP_MAP");
        break;
      case 427:
        result = CFSTR("SWIPE_DOWN");
        break;
      case 428:
        result = CFSTR("TAP_MORE_TRAILHEADS");
        break;
      case 429:
        result = CFSTR("TAP_ROUTE_OPTIONS");
        break;
      case 430:
        result = CFSTR("TAP_ROUTE_NAV_MAP");
        break;
      case 431:
        result = CFSTR("TAP_ROUTE_OVERVIEW_MAP");
        break;
      case 432:
        result = CFSTR("TAP_AUDIO");
        break;
      case 433:
        result = CFSTR("TAP_OPEN_PLACECARD");
        break;
      case 434:
        result = CFSTR("TAP_VIEW_STOPS");
        break;
      case 435:
        result = CFSTR("TAP_ROUTE_DETAILS");
        break;
      case 436:
        result = CFSTR("ADD_LPR_VEHICLE");
        break;
      case 437:
        result = CFSTR("TAP_ADD_VEHICLE");
        break;
      case 438:
        result = CFSTR("TAP_PLUG_TYPE");
        break;
      case 439:
        result = CFSTR("UNSELECT_SUGGESTED_NETWORK");
        break;
      case 440:
        result = CFSTR("TAP_SET_UP_LATER");
        break;
      case 441:
        result = CFSTR("ADD_EV_VEHICLE");
        break;
      case 442:
        result = CFSTR("UPDATE_COLOR");
        break;
      case 443:
        result = CFSTR("SELECT_OTHER_NETWORK");
        break;
      case 444:
        result = CFSTR("UNSELECT_NETWORK");
        break;
      case 445:
        result = CFSTR("TAP_BACK");
        break;
      case 446:
        result = CFSTR("TAP_CANCEL");
        break;
      case 447:
        result = CFSTR("UNSELECT_VEHICLE");
        break;
      case 448:
        result = CFSTR("UNSELECT_OTHER_NETWORK");
        break;
      case 449:
        result = CFSTR("DISPLAY_EV_TIPKIT");
        break;
      case 450:
        result = CFSTR("SELECT_NETWORK");
        break;
      case 451:
        result = CFSTR("TAP_EV_TIPKIT");
        break;
      case 452:
        result = CFSTR("TAP_CHOOSE_NETWORKS");
        break;
      case 453:
        result = CFSTR("TAP_ADD_NETWORK");
        break;
      case 454:
        result = CFSTR("FILTER_NETWORK");
        break;
      case 455:
        result = CFSTR("SELECT_SUGGESTED_NETWORK");
        break;
      case 456:
        result = CFSTR("TRANSIT_TO_WALKING");
        break;
      case 457:
        result = CFSTR("TRANSIT_TO_FINDMY");
        break;
      case 458:
        result = CFSTR("TAP_AC_KEYBOARD");
        break;
      case 459:
        result = CFSTR("REACH_PHOTO_STRIP_END");
        break;
      case 460:
        result = CFSTR("SEARCH_HERE_REVEAL");
        break;
      case 461:
        result = CFSTR("TAP_SEARCH_HERE");
        break;
      case 462:
        result = CFSTR("TAP_RECENTLY_VIEWED_CURATED_HIKE");
        break;
      case 463:
        result = CFSTR("SAVE");
        break;
      case 464:
        result = CFSTR("TAP_MORE_CURATED_HIKES");
        break;
      case 465:
        result = CFSTR("CREATE_CUSTOM_ROUTE");
        break;
      case 466:
        result = CFSTR("TAP_TRY_NOW");
        break;
      case 467:
        result = CFSTR("TAP_CURATED_HIKE");
        break;
      case 468:
        result = CFSTR("TAP_RECENTLY_VIEWED_CUSTOM_ROUTE");
        break;
      case 469:
        result = CFSTR("ADD_TO_LIBRARY");
        break;
      case 470:
        result = CFSTR("START_HIKING");
        break;
      case 471:
        result = CFSTR("EDIT_NOTE");
        break;
      case 472:
        result = CFSTR("CREATE_NOTE");
        break;
      case 473:
        result = CFSTR("DELETE_PIN");
        break;
      case 474:
        result = CFSTR("ADD_ROUTE");
        break;
      case 475:
        result = CFSTR("ADD_PIN");
        break;
      case 476:
        result = CFSTR("REMOVE_FROM_COLLECTION");
        break;
      case 477:
        result = CFSTR("REMOVE_FROM_LIBRARY");
        break;
      case 478:
        result = CFSTR("TAP_ITEM");
        break;
      case 479:
        result = CFSTR("DELETE_ROUTE");
        break;
      case 480:
        result = CFSTR("TAP_ROUTE");
        break;
      case 481:
        result = CFSTR("TAP_DOWNLOAD_WATCH_MAPS");
        break;
      case 482:
        result = CFSTR("DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT");
        break;
      case 483:
        result = CFSTR("STOP_DOWNLOAD_ONTO_WATCH");
        break;
      case 484:
        result = CFSTR("TAP_DOWNLOAD_ONTO_WATCH");
        break;
      case 485:
        result = CFSTR("TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT");
        break;
      case 486:
        result = CFSTR("TAP_DOWNLOAD_NOW_WATCH");
        break;
      case 1001:
        result = CFSTR("PAN");
        break;
      case 1002:
        result = CFSTR("ZOOM_IN");
        break;
      case 1003:
        result = CFSTR("ZOOM_OUT");
        break;
      case 1004:
        result = CFSTR("ROTATE");
        break;
      case 1010:
        result = CFSTR("TAP_POI");
        break;
      case 1011:
        result = CFSTR("TAP_POI_TRANSIT");
        break;
      case 1017:
        result = CFSTR("TAP_POI_HIGHLIGHTED");
        break;
      case 1018:
        result = CFSTR("TAP_POI_CLUSTERED");
        break;
      case 1020:
        result = CFSTR("TAP_POI_DROPPED_PIN");
        break;
      case 1030:
        result = CFSTR("DROP_PIN");
        break;
      case 1031:
        result = CFSTR("TAP_INCIDENT");
        break;
      case 1032:
        result = CFSTR("TAP_TRANSIT_LINE");
        break;
      case 1033:
        result = CFSTR("TAP_POI_CALENDAR");
        break;
      case 1034:
        result = CFSTR("TAP_POI_CURRENT_LOCATION");
        break;
      case 1035:
        result = CFSTR("TAP_POI_TRANSIT_LINE");
        break;
      case 1036:
        result = CFSTR("TAP_POI_LANDMARK");
        break;
      case 1037:
        result = CFSTR("TAP_POI_FLYOVER");
        break;
      case 1038:
        result = CFSTR("TAP_TO_HIDE_TRAY");
        break;
      case 1039:
        result = CFSTR("TAP_TO_REVEAL_TRAY");
        break;
      case 1040:
        result = CFSTR("TAP_COMPASS");
        break;
      case 1041:
        result = CFSTR("PITCH_AWAY_FROM_GROUND");
        break;
      case 1042:
        result = CFSTR("PITCH_CLOSER_TO_GROUND");
        break;
      case 1043:
        result = CFSTR("ZOOM_IN_PINCH");
        break;
      case 1044:
        result = CFSTR("ZOOM_OUT_PINCH");
        break;
      case 1045:
        result = CFSTR("ZOOM_IN_DOUBLE_TAP");
        break;
      case 1046:
        result = CFSTR("ZOOM_OUT_TWO_FINGER_TAP");
        break;
      case 1047:
        result = CFSTR("ZOOM_IN_ONE_FINGER");
        break;
      case 1048:
        result = CFSTR("ZOOM_OUT_ONE_FINGER");
        break;
      case 1049:
        result = CFSTR("ZOOM_IN_BUTTON");
        break;
      case 1050:
        result = CFSTR("ZOOM_OUT_BUTTON");
        break;
      case 1051:
        result = CFSTR("TAP_TRAFFIC_CAMERA");
        break;
      case 1052:
        result = CFSTR("DISPLAY_INDOOR_MAP_BUTTON");
        break;
      case 1053:
        result = CFSTR("OPEN_INDOOR_MAP");
        break;
      case 1054:
        result = CFSTR("DISPLAY_VENUE_BROWSE_BUTTON");
        break;
      case 1055:
        result = CFSTR("TAP_VENUE_BROWSE_BUTTON");
        break;
      case 1056:
        result = CFSTR("ENTER_VENUE_EXPERIENCE");
        break;
      case 1057:
        result = CFSTR("EXIT_VENUE_EXPERIENCE");
        break;
      case 1058:
        result = CFSTR("ZOOM_IN_SCENE_PINCH");
        break;
      case 1059:
        result = CFSTR("ZOOM_OUT_SCENE_PINCH");
        break;
      case 1060:
        result = CFSTR("ZOOM_RESET");
        break;
      case 1061:
        result = CFSTR("TAP_SCENE_UNAVAILABLE_AREA");
        break;
      case 1062:
        result = CFSTR("TAP_TRANSIT_ACCESS_POINT");
        break;
      case 1063:
        result = CFSTR("TAP_SPEED_CAMERA");
        break;
      case 1064:
        result = CFSTR("TAP_RED_LIGHT_CAMERA");
        break;
      case 1065:
        result = CFSTR("TAP_GEO");
        break;
      default:
        switch(a3)
        {
          case 2001:
            result = CFSTR("TAP_SEARCH_FIELD");
            break;
          case 2002:
            result = CFSTR("CLEAR_SEARCH");
            break;
          case 2003:
            result = CFSTR("CANCEL_SEARCH");
            break;
          case 2004:
            result = CFSTR("TAP_BROWSE_TOP_CATEGORY");
            break;
          case 2005:
            result = CFSTR("TAP_BROWSE_SUB_CATEGORY");
            break;
          case 2006:
            result = CFSTR("TAP_BACK_TO_BROWSE_TOP_CATEGORY");
            break;
          case 2007:
            result = CFSTR("TAP_LIST_ITEM");
            break;
          case 2008:
            result = CFSTR("SHARE_LIST_ITEM");
            break;
          case 2009:
            result = CFSTR("DELETE_LIST_ITEM");
            break;
          case 2010:
            result = CFSTR("EDIT_LIST_ITEM");
            break;
          case 2011:
            result = CFSTR("REFRESH_SEARCH");
            break;
          case 2012:
            result = CFSTR("REVEAL_LIST_ITEM_ACTIONS");
            break;
          case 2013:
            result = CFSTR("HIDE_LIST_ITEM_ACTIONS");
            break;
          case 2014:
            result = CFSTR("TAP_SEARCH_BUTTON");
            break;
          case 2015:
            result = CFSTR("SHOW_SEARCH_RESULTS");
            break;
          case 2016:
            result = CFSTR("SHOW_REFRESH_SEARCH");
            break;
          case 2017:
            result = CFSTR("PASTE_TEXT");
            break;
          case 2018:
            result = CFSTR("TAP_LIST_SUB_ITEM");
            break;
          case 2019:
            result = CFSTR("DISPLAY_DID_YOU_MEAN_MESSAGE");
            break;
          case 2020:
            result = CFSTR("TAP_DID_YOU_MEAN_MESSAGE");
            break;
          case 2021:
            result = CFSTR("CLOSE_DID_YOU_MEAN_MESSAGE");
            break;
          case 2022:
            result = CFSTR("SCROLL_LEFT_DID_YOU_MEAN_MESSAGE");
            break;
          case 2023:
            result = CFSTR("SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE");
            break;
          case 2024:
            result = CFSTR("RETAINED_QUERY");
            break;
          case 2025:
            result = CFSTR("TAP_RECENT_AC_SUGGESTION");
            break;
          case 2026:
            result = CFSTR("CLEAR_RECENT_AC_SUGGESTION");
            break;
          case 2027:
            result = CFSTR("DELETE_RECENT_AC_SUGGESTION");
            break;
          case 2028:
          case 2029:
            goto LABEL_48;
          case 2030:
            result = CFSTR("TAP_BROWSE_NEARBY_CATEGORY");
            break;
          case 2031:
            result = CFSTR("TAP_SUBACTION");
            break;
          case 2032:
            result = CFSTR("TAP_QUERY_BUILDING_ARROW");
            break;
          case 2033:
            result = CFSTR("CLICK_ON_EDIT_SEARCH");
            break;
          case 2034:
            result = CFSTR("REMOVE_CLIENT_AC_SUGGESTION");
            break;
          case 2035:
            result = CFSTR("SHARE_CLIENT_AC_SUGGESTION");
            break;
          case 2036:
            result = CFSTR("TAP_ON_MORE_RESULTS");
            break;
          case 2037:
            result = CFSTR("SHARE_ITEM");
            break;
          case 2038:
            result = CFSTR("HIDE_ITEM");
            break;
          case 2039:
            result = CFSTR("TAP_SUGGESTED_ITEM");
            break;
          case 2040:
            result = CFSTR("SHARE_SUGGESTED_ITEM");
            break;
          case 2041:
            result = CFSTR("HIDE_SUGGESTED_ITEM");
            break;
          case 2042:
            result = CFSTR("ADD_HOME_FAVORITE");
            break;
          case 2043:
            result = CFSTR("ADD_WORK_FAVORITE");
            break;
          case 2044:
            result = CFSTR("ADD_FAVORITE");
            break;
          case 2045:
            result = CFSTR("VIEW_FAVORITES_LIST");
            break;
          case 2046:
            result = CFSTR("TAP_HOME_FAVORITE");
            break;
          case 2047:
            result = CFSTR("TAP_WORK_FAVORITE");
            break;
          case 2048:
            result = CFSTR("TAP_CAR_FAVORITE");
            break;
          case 2049:
            result = CFSTR("TAP_FAVORITE_ITEM");
            break;
          case 2050:
            result = CFSTR("CREATE_HOME_FAVORITE");
            break;
          case 2051:
            result = CFSTR("CREATE_WORK_FAVORITE");
            break;
          case 2052:
            result = CFSTR("CREATE_FAVORITE");
            break;
          case 2053:
            result = CFSTR("SUBMIT_FAVORITE_EDIT");
            break;
          case 2054:
            result = CFSTR("ADD_RECOMMENDED_FAVORITE");
            break;
          case 2055:
            result = CFSTR("EDIT_FAVORITE");
            break;
          case 2056:
            result = CFSTR("REMOVE_FAVORITE");
            break;
          case 2057:
            result = CFSTR("SHARE_FAVORITE");
            break;
          case 2058:
            result = CFSTR("EDIT_FAVORITES");
            break;
          case 2059:
            result = CFSTR("ADD_FAVORITE_PLACE");
            break;
          case 2060:
            result = CFSTR("REMOVE_FAVORITE_PLACE");
            break;
          case 2061:
            result = CFSTR("CHANGE_HOME_ADDRESS");
            break;
          case 2062:
            result = CFSTR("CHANGE_WORK_ADDRESS");
            break;
          case 2063:
            result = CFSTR("REFINE_LOCATION");
            break;
          case 2064:
            result = CFSTR("TAP_RECENTLY_VIEWED_ITEM");
            break;
          case 2065:
            result = CFSTR("SHOW_COLLECTION_LIST");
            break;
          case 2066:
            result = CFSTR("SHOW_FAVORITES_COLLECTION");
            break;
          case 2067:
            result = CFSTR("SHOW_COLLECTION");
            break;
          case 2068:
            result = CFSTR("TAP_COLLECTION_ITEM");
            break;
          case 2069:
            result = CFSTR("SHARE_COLLECTION_ITEM");
            break;
          case 2070:
            result = CFSTR("REMOVE_COLLECTION_ITEM");
            break;
          case 2071:
            result = CFSTR("SAVE_SHARED_COLLECTION");
            break;
          case 2072:
            result = CFSTR("CREATE_NEW_COLLECTION");
            break;
          case 2073:
            result = CFSTR("SAVE_TO_COLLECTION");
            break;
          case 2074:
            result = CFSTR("EDIT_PHOTO");
            break;
          case 2075:
            result = CFSTR("SORT_BY_NAME");
            break;
          case 2076:
            result = CFSTR("SORT_BY_DISTANCE");
            break;
          case 2077:
            result = CFSTR("SORT_BY_RECENT");
            break;
          case 2078:
            result = CFSTR("AUTO_SHARE_ETA");
            break;
          case 2079:
            result = CFSTR("CANCEL_AUTO_SHARE_ETA");
            break;
          case 2080:
            result = CFSTR("MAP_SEARCH");
            break;
          case 2081:
            result = CFSTR("DELETE_COLLECTION");
            break;
          case 2082:
            result = CFSTR("SHARE_COLLECTION");
            break;
          case 2083:
            result = CFSTR("SHOW_TRANSIT_LINES_COLLECTION");
            break;
          case 2084:
            result = CFSTR("SHOW_MY_PLACES");
            break;
          case 2085:
            result = CFSTR("SHOW_ALL_PLACES");
            break;
          case 2086:
            result = CFSTR("TAP_RECENT_QUERY");
            break;
          case 2087:
            result = CFSTR("TAP_QUERY_SUGGESTION");
            break;
          case 2088:
            result = CFSTR("DELETE_CURATED_COLLECTION");
            break;
          case 2089:
            result = CFSTR("FOLLOW");
            break;
          case 2090:
            result = CFSTR("PUNCH_IN");
            break;
          case 2091:
            result = CFSTR("SAVE_CURATED_COLLECTION");
            break;
          case 2092:
            result = CFSTR("SCROLL_LEFT_COLLECTIONS");
            break;
          case 2093:
            result = CFSTR("SCROLL_RIGHT_COLLECTIONS");
            break;
          case 2094:
            result = CFSTR("SEE_ALL_CURATED_COLLECTION");
            break;
          case 2095:
            result = CFSTR("SEE_ALL_PUBLISHERS");
            break;
          case 2096:
            result = CFSTR("SHARE_CURATED_COLLECTION");
            break;
          case 2097:
            result = CFSTR("SHARE_PUBLISHER");
            break;
          case 2098:
            result = CFSTR("SHOW_MORE_COLLECTION");
            break;
          case 2099:
            result = CFSTR("TAP_CURATED_COLLECTION");
            break;
          case 2100:
            result = CFSTR("TAP_FEATURED_COLLECTIONS");
            break;
          case 2101:
            result = CFSTR("TAP_LOCATION");
            break;
          case 2102:
            result = CFSTR("TAP_PUBLISHER");
            break;
          case 2103:
            result = CFSTR("TAP_PUBLISHER_APP");
            break;
          case 2104:
            result = CFSTR("TAP_PUBLISHER_COLLECTIONS");
            break;
          case 2105:
            result = CFSTR("UNFOLLOW");
            break;
          case 2106:
            result = CFSTR("CHANGE_SCHOOL_ADDRESS");
            break;
          case 2107:
            result = CFSTR("ADD_VEHICLE");
            break;
          case 2108:
            result = CFSTR("DISPLAY_VIRTUAL_GARAGE");
            break;
          case 2109:
            result = CFSTR("ENTER_VIRTUAL_GARAGE");
            break;
          case 2110:
            result = CFSTR("PUNCH_OUT_MANUFACTURER_APP");
            break;
          case 2111:
            result = CFSTR("REMOVE_LICENSE_PLATE");
            break;
          case 2112:
            result = CFSTR("REMOVE_VEHICLE");
            break;
          case 2113:
            result = CFSTR("SELECT_VEHICLE");
            break;
          case 2114:
            result = CFSTR("SUBMIT_LICENSE_PLATE");
            break;
          case 2115:
            result = CFSTR("TAP_ADD_LICENSE_PLATE");
            break;
          case 2116:
            result = CFSTR("TAP_ADD_NEW_CAR");
            break;
          case 2117:
            result = CFSTR("TAP_BANNER");
            break;
          case 2118:
            result = CFSTR("TAP_CONNECT");
            break;
          case 2119:
            result = CFSTR("TAP_CONTINUE");
            break;
          case 2120:
            result = CFSTR("TAP_EDIT");
            break;
          case 2121:
            result = CFSTR("TAP_NAME");
            break;
          case 2122:
            result = CFSTR("TAP_NOT_NOW");
            break;
          case 2123:
            result = CFSTR("TAP_OTHER_VEHICLE");
            break;
          case 2124:
            result = CFSTR("TAP_REMOVE_LICENSE_PLATE");
            break;
          case 2125:
            result = CFSTR("TAP_UPDATE_PLATE_NUMBER");
            break;
          case 2126:
            result = CFSTR("TAP_VEHICLE");
            break;
          case 2127:
            result = CFSTR("TAP_VEHICLE_NAME");
            break;
          case 2128:
            result = CFSTR("UPDATE_NAME");
            break;
          case 2129:
            result = CFSTR("DONE_TAKING_PHOTO");
            break;
          case 2130:
            result = CFSTR("ENABLE_SHOW_PHOTO_NAME");
            break;
          case 2131:
            result = CFSTR("SUBMIT_PHOTO");
            break;
          case 2132:
            result = CFSTR("USE_PHOTO");
            break;
          case 2133:
            result = CFSTR("ADD_RECOMMENDATION_TO_MAPS");
            break;
          case 2134:
            result = CFSTR("CANCEL_PHOTO_SUBMISSION");
            break;
          case 2135:
            result = CFSTR("CLOSE_RECOMMENDATION_CARD");
            break;
          case 2136:
            result = CFSTR("EDIT_RATING");
            break;
          case 2137:
            result = CFSTR("PROMPTED_TO_ADD_PHOTO");
            break;
          case 2138:
            result = CFSTR("PROMPTED_TO_ADD_RATING");
            break;
          case 2139:
            result = CFSTR("PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION");
            break;
          case 2140:
            result = CFSTR("PROMPTED_TO_ADD_RECOMMENDATION_SIRI");
            break;
          case 2141:
            result = CFSTR("RETAKE_PHOTO");
            break;
          case 2142:
            result = CFSTR("REVEAL_RECOMMENDATION_CARD");
            break;
          case 2143:
            result = CFSTR("SUBMIT_NEGATIVE_RATING");
            break;
          case 2144:
            result = CFSTR("SUBMIT_POSITIVE_RATING");
            break;
          case 2145:
            result = CFSTR("TAP_CHOOSING_PHOTO");
            break;
          case 2146:
            result = CFSTR("TAP_TAKE_NEW_PHOTO");
            break;
          case 2147:
            result = CFSTR("TAP_TO_ADD_PHOTO");
            break;
          case 2148:
            result = CFSTR("CANCEL_INCIDENT_REPORT");
            break;
          case 2149:
            result = CFSTR("INCIDENT_REPORT_SUBMITTED");
            break;
          case 2150:
            result = CFSTR("REPORTED_INCIDENT_NOT_RECEIVED");
            break;
          case 2151:
            result = CFSTR("REPORTED_INCIDENT_RECEIVED");
            break;
          case 2152:
            result = CFSTR("REPORT_INCIDENT");
            break;
          case 2153:
            result = CFSTR("SELECT_INCIDENT_TYPE");
            break;
          case 2154:
            result = CFSTR("SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT");
            break;
          case 2155:
            result = CFSTR("TAP_TO_START_REPORT_INCIDENT");
            break;
          case 2156:
            result = CFSTR("ACTIVELY_DISPLAY_VLF_ENTRY_POINT");
            break;
          case 2157:
            result = CFSTR("ATTEMPT_VLF_CORRECTION");
            break;
          case 2158:
            result = CFSTR("DISMISS_VLF_PROMPT");
            break;
          case 2159:
            result = CFSTR("PASSIVELY_DISPLAY_VLF_ENTRY_POINT");
            break;
          case 2160:
            result = CFSTR("VLF_CORRECTION_FAILED");
            break;
          case 2161:
            result = CFSTR("VLF_CORRECTION_SUCCESSFUL");
            break;
          case 2162:
            result = CFSTR("ENABLE_WIDGET_SUGGESTIONS");
            break;
          case 2163:
            result = CFSTR("DISPLAY_CZ_ADVISORY");
            break;
          case 2164:
            result = CFSTR("PUNCH_OUT_URL_PAY");
            break;
          case 2165:
            result = CFSTR("TAP_SHOW_CZ_ADVISORY_DETAILS");
            break;
          case 2166:
            result = CFSTR("DELETE_ITEM");
            break;
          case 2167:
            result = CFSTR("CANCEL_REMOVE");
            break;
          case 2168:
            result = CFSTR("DELETE_SUGGESTION");
            break;
          case 2169:
            result = CFSTR("ADD_SCHOOL_FAVORITE");
            break;
          case 2170:
            result = CFSTR("GO_TO_WEBSITE");
            break;
          case 2171:
            result = CFSTR("TRY_AGAIN");
            break;
          case 2172:
            result = CFSTR("CHECK_AUTO_RECORD_WORKOUT");
            break;
          case 2173:
            result = CFSTR("CHECK_EBIKE");
            break;
          case 2174:
            result = CFSTR("DISPLAY_AUTOMATIC_WORKOUT_OPTION");
            break;
          case 2175:
            result = CFSTR("DISPLAY_CYCLING_DEFAULT_OPTION");
            break;
          case 2176:
            result = CFSTR("DISPLAY_CYCLING_NO_BIKE_ADVISORY");
            break;
          case 2177:
            result = CFSTR("DISPLAY_CYCLING_STAIRS_ADVISORY");
            break;
          case 2178:
            result = CFSTR("DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY");
            break;
          case 2179:
            result = CFSTR("TAP_AUTOMATIC_WORKOUT_OPTION");
            break;
          case 2180:
            result = CFSTR("TAP_CYCLING_DEFAULT_OPTION");
            break;
          case 2181:
            result = CFSTR("TAP_CYCLING_NO_BIKE_ADVISORY");
            break;
          case 2182:
            result = CFSTR("TAP_CYCLING_STAIRS_ADVISORY");
            break;
          case 2183:
            result = CFSTR("TAP_CYCLING_STEEP_CLIMB_ADVISORY");
            break;
          case 2184:
            result = CFSTR("UNCHECK_AUTO_RECORD_WORKOUT");
            break;
          case 2185:
            result = CFSTR("UNCHECK_EBIKE");
            break;
          case 2186:
            result = CFSTR("DISPLAY_LICENSE_PLATE_SUGGESTION");
            break;
          case 2187:
            result = CFSTR("DISPLAY_LPR_ADVISORY");
            break;
          case 2188:
            result = CFSTR("TAP_SHOW_LPR_ADVISORY_DETAILS");
            break;
          case 2189:
            result = CFSTR("CREATE_WIDGET");
            break;
          case 2190:
            result = CFSTR("REVEAL_WIDGET_TRAY");
            break;
          case 2191:
            result = CFSTR("LPR_ERROR_CODE");
            break;
          case 2192:
            result = CFSTR("TAP_SEE_ALL_RECENTLY_VIEWED");
            break;
          case 2193:
            result = CFSTR("TAP_CLEAR_RECENTLY_VIEWED");
            break;
          case 2194:
            result = CFSTR("LPR_HARD_STOP");
            break;
          case 2195:
            result = CFSTR("TAP_PUBLISHER_SUBACTION");
            break;
          case 2196:
            result = CFSTR("CARPLAY_DISPLAY_ACTIVATED");
            break;
          case 2197:
            result = CFSTR("CARPLAY_DISPLAY_DEACTIVATED");
            break;
          case 2198:
            result = CFSTR("TAP_FEATURED_COLLECTION");
            break;
          case 2199:
            result = CFSTR("SCROLL_FEATURED_COLLECTION_FORWARD");
            break;
          case 2200:
            result = CFSTR("SCROLL_FEATURED_COLLECTION_BACKWARD");
            break;
          default:
            switch(a3)
            {
              case 3001:
                result = CFSTR("START_NAV");
                break;
              case 3002:
                result = CFSTR("END_NAV");
                break;
              case 3003:
                result = CFSTR("OPEN_NAV_AUDIO_SETTINGS");
                break;
              case 3004:
                result = CFSTR("VIEW_DETAILS");
                break;
              case 3005:
                result = CFSTR("TAP_SEARCH_ALONG_ROUTE_CATEGORY");
                break;
              case 3006:
                result = CFSTR("OPEN_ROUTING_EDITOR");
                break;
              case 3007:
                result = CFSTR("EDIT_ORIGIN");
                break;
              case 3008:
                result = CFSTR("EDIT_DESTINATION");
                break;
              case 3009:
                result = CFSTR("SWAP_ORIGIN_DESTINATION");
                break;
              case 3010:
                result = CFSTR("OPEN_MORE_ROUTES");
                break;
              case 3011:
                result = CFSTR("SELECT_ROUTING_TYPE_DRIVING");
                break;
              case 3012:
                result = CFSTR("SELECT_ROUTING_TYPE_WALKING");
                break;
              case 3013:
                result = CFSTR("SELECT_ROUTING_TYPE_TRANSIT");
                break;
              case 3014:
                result = CFSTR("SELECT_ROUTING_TYPE_RIDESHARE");
                break;
              case 3015:
                result = CFSTR("SELECT_ROUTE");
                break;
              case 3016:
                result = CFSTR("COLLAPSE_STEP_DETAILS_WALK");
                break;
              case 3017:
                result = CFSTR("EXPAND_STEP_DETAILS_WALK");
                break;
              case 3018:
                result = CFSTR("COLLAPSE_STEP_DETAILS_TRANSIT");
                break;
              case 3019:
                result = CFSTR("EXPAND_STEP_DETAILS_TRANSIT");
                break;
              case 3020:
                result = CFSTR("UNCHECK_BUS");
                break;
              case 3021:
                result = CFSTR("UNCHECK_SUBWAY_AND_LIGHT_RAIL");
                break;
              case 3022:
                result = CFSTR("UNCHECK_COMMUTER_RAIL");
                break;
              case 3023:
                result = CFSTR("UNCHECK_FERRY");
                break;
              case 3024:
                result = CFSTR("CHECK_BUS");
                break;
              case 3025:
                result = CFSTR("CHECK_SUBWAY_AND_LIGHT_RAIL");
                break;
              case 3026:
                result = CFSTR("CHECK_COMMUTER_RAIL");
                break;
              case 3027:
                result = CFSTR("CHECK_FERRY");
                break;
              case 3028:
                result = CFSTR("SELECT_LEAVE_AT");
                break;
              case 3029:
                result = CFSTR("SELECT_ARRIVE_BY");
                break;
              case 3030:
                result = CFSTR("SELECT_LEAVE_NOW");
                break;
              case 3031:
                result = CFSTR("SELECT_DATE_TIME");
                break;
              case 3032:
                result = CFSTR("SWITCH_ON_IC_FARES");
                break;
              case 3033:
                result = CFSTR("SWITCH_OFF_IC_FARES");
                break;
              case 3034:
                result = CFSTR("OPEN_ROUTE_OPTIONS_DATETIME");
                break;
              case 3035:
                result = CFSTR("OPEN_ROUTE_OPTIONS_TRANSIT");
                break;
              case 3036:
                result = CFSTR("OPEN_ROUTE_OPTIONS_DRIVING");
                break;
              case 3037:
                result = CFSTR("OPEN_TRANSIT_ROUTE_CLUSTER_SHEET");
                break;
              case 3038:
                result = CFSTR("REVEAL_FROM_ROUTING");
                break;
              case 3039:
                result = CFSTR("DISPLAY_ROUTES");
                break;
              case 3040:
                result = CFSTR("CHECK_RECOMMENDED_ROUTES");
                break;
              case 3041:
                result = CFSTR("UNCHECK_RECOMMENDED_ROUTES");
                break;
              case 3042:
                result = CFSTR("CHECK_FASTER_TRIPS");
                break;
              case 3043:
                result = CFSTR("UNCHECK_FASTER_TRIPS");
                break;
              case 3044:
                result = CFSTR("CHECK_FEWER_TRANSFERS");
                break;
              case 3045:
                result = CFSTR("UNCHECK_FEWER_TRANSFERS");
                break;
              case 3046:
                result = CFSTR("CHECK_LESS_WALKING");
                break;
              case 3047:
                result = CFSTR("UNCHECK_LESS_WALKING");
                break;
              case 3048:
                result = CFSTR("OPEN_ROUTE_OPTIONS_CYCLING");
                break;
              case 3049:
                result = CFSTR("TAP_MORE_ROUTES");
                break;
              case 3050:
                result = CFSTR("OPEN_NAV_OVERVIEW");
                break;
              case 3051:
                result = CFSTR("RESUME_NAV_MANEUVER_VIEW");
                break;
              case 3052:
                result = CFSTR("SELECT_AUDIO_VOLUME_SILENT");
                break;
              case 3053:
                result = CFSTR("SELECT_AUDIO_VOLUME_LOW");
                break;
              case 3054:
                result = CFSTR("SELECT_AUDIO_VOLUME_NORMAL");
                break;
              case 3055:
                result = CFSTR("SELECT_AUDIO_VOLUME_LOUD");
                break;
              case 3056:
                result = CFSTR("SWITCH_ON_PAUSE_SPOKEN_AUDIO");
                break;
              case 3057:
                result = CFSTR("SWITCH_OFF_PAUSE_SPOKEN_AUDIO");
                break;
              case 3058:
                result = CFSTR("RESUME_PREV_NAV");
                break;
              case 3059:
                result = CFSTR("ACKNOWLEDGE_TRAFFIC_INCIDENT");
                break;
              case 3060:
                result = CFSTR("ACCEPT_REROUTE");
                break;
              case 3061:
                result = CFSTR("DISMISS_REROUTE");
                break;
              case 3062:
                result = CFSTR("ATTEMPT_END_NAV");
                break;
              case 3063:
                result = CFSTR("DISPLAY_BANNER");
                break;
              case 3064:
                result = CFSTR("VIEW_BANNER_DETAILS");
                break;
              case 3065:
                result = CFSTR("ENTER_GUIDANCE");
                break;
              case 3066:
                result = CFSTR("AUTO_ADVANCE_GUIDANCE");
                break;
              case 3067:
                result = CFSTR("TAP_OPEN_WALLET");
                break;
              case 3068:
                result = CFSTR("SELECT_VOICE_GUIDANCE_ALL");
                break;
              case 3069:
                result = CFSTR("SELECT_VOICE_GUIDANCE_INCIDENTS");
                break;
              case 3070:
                result = CFSTR("SELECT_VOICE_GUIDANCE_NONE");
                break;
              case 3071:
                result = CFSTR("DISPLAY_CARD");
                break;
              case 3072:
                result = CFSTR("RENDER_ROUTE");
                break;
              case 3073:
                result = CFSTR("DISPLAY_JUNCTION_VIEW");
                break;
              case 3074:
                result = CFSTR("SELECT_DEPARTURE");
                break;
              case 3075:
                result = CFSTR("DISPLAY_AR_VIEW_RAISE_BANNER");
                break;
              case 3076:
                result = CFSTR("DEVICE_RAISE");
                break;
              case 3077:
                result = CFSTR("ENTER_AR_NAV_VIEW");
                break;
              case 3078:
                result = CFSTR("EXIT_AR_NAV_VIEW");
                break;
              case 3079:
                result = CFSTR("AR_CALIBRATION_START");
                break;
              case 3080:
                result = CFSTR("AR_CALIBRATION_FAILURE");
                break;
              case 3081:
                result = CFSTR("AR_CALIBRATION_SUCCESS");
                break;
              case 3082:
                result = CFSTR("DISPLAY_AR_NAV_ARROW");
                break;
              case 3083:
                result = CFSTR("DISPLAY_AR_NAV_TURN_AROUND");
                break;
              case 3084:
                result = CFSTR("DISPLAY_GO_OUTSIDE_BANNER");
                break;
              case 3085:
                result = CFSTR("DISPLAY_AR_DARKNESS_MESSAGE");
                break;
              case 3086:
                result = CFSTR("DISPLAY_AR_NAV_ENDPOINT");
                break;
              case 3087:
                result = CFSTR("DISPLAY_ADVISORY_BANNER");
                break;
              case 3088:
                result = CFSTR("TAP_SHOW_ADVISORY_DETAILS");
                break;
              default:
                goto LABEL_48;
            }
            break;
        }
        break;
    }
  }
  return result;
}

- (void)_readModuleInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModuleInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasModuleInfo
{
  -[GEOLogMsgEventUserAction _readModuleInfo]((uint64_t)self);
  return self->_moduleInfo != 0;
}

- (GEOLogMsgEventUserActionModuleInfo)moduleInfo
{
  -[GEOLogMsgEventUserAction _readModuleInfo]((uint64_t)self);
  return self->_moduleInfo;
}

- (void)setModuleInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_moduleInfo, a3);
}

- (int)buttonType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_buttonType;
  else
    return 0;
}

- (void)setButtonType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_buttonType = a3;
}

- (void)setHasButtonType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasButtonType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)buttonTypeAsString:(int)a3
{
  if (a3 < 0x10)
    return off_1E1C235D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsButtonType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_TO_GUIDES")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_REPORT_AN_ISSUE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_SHARE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_CALL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_MESSAGE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_WEBSITE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_QUICK_LINK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_GROUP")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_DIRECTIONS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_DOWNLOAD")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_PHOTOS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_TO_FAVORITES")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_SAVE_TO_LIBRARY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_A_NOTE")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readActionRichProviderId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionRichProviderId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasActionRichProviderId
{
  -[GEOLogMsgEventUserAction _readActionRichProviderId]((uint64_t)self);
  return self->_actionRichProviderId != 0;
}

- (NSString)actionRichProviderId
{
  -[GEOLogMsgEventUserAction _readActionRichProviderId]((uint64_t)self);
  return self->_actionRichProviderId;
}

- (void)setActionRichProviderId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_actionRichProviderId, a3);
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
  v8.super_class = (Class)GEOLogMsgEventUserAction;
  -[GEOLogMsgEventUserAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventUserAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventUserAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  int v10;
  __CFString *v11;
  const __CFString *v12;
  int v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "userActionEventKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("userActionEventKey");
      else
        v6 = CFSTR("user_action_event_key");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "userActionEventValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("userActionEventValue");
      else
        v8 = CFSTR("user_action_event_value");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    v9 = *(_BYTE *)(a1 + 72);
    if ((v9 & 4) != 0)
    {
      v10 = *(_DWORD *)(a1 + 68);
      if (v10 > 1000)
      {
        if (v10 > 1600)
        {
          switch(v10)
          {
            case 1801:
              v11 = CFSTR("MAPS_WEB_PLACE");
              break;
            case 1802:
              v11 = CFSTR("MAPS_WEB_SEARCH");
              break;
            case 1803:
              v11 = CFSTR("MAPS_WEB_SEARCH_RESULTS");
              break;
            case 1804:
              v11 = CFSTR("MAPS_WEB_PUBLISHER");
              break;
            case 1805:
              v11 = CFSTR("MAPS_WEB_GUIDE");
              break;
            case 1806:
              v11 = CFSTR("MAPS_WEB_GUIDES_HOME");
              break;
            case 1807:
              v11 = CFSTR("MAPS_WEB_RELATED_PLACES_LIST");
              break;
            case 1808:
              v11 = CFSTR("MAPS_WEB_COLLECTION_LIST");
              break;
            case 1809:
              v11 = CFSTR("MAPS_WEB_DIRECTIONS");
              break;
            case 1810:
              v11 = CFSTR("MAPS_WEB_SIDEBAR");
              break;
            default:
              switch(v10)
              {
                case 1700:
                  v11 = CFSTR("LOOK_AROUND_PIP");
                  break;
                case 1701:
                  v11 = CFSTR("LOOK_AROUND_ACTION_SHEET");
                  break;
                case 1702:
                  v11 = CFSTR("LOOK_AROUND_VIEW");
                  break;
                case 1703:
                  v11 = CFSTR("LOOK_AROUND_PLATTER");
                  break;
                case 1704:
                  v11 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM");
                  break;
                case 1705:
                  v11 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION");
                  break;
                case 1706:
                  v11 = CFSTR("LOOK_AROUND_VIEW_PLACECARD");
                  break;
                case 1707:
                  v11 = CFSTR("LOOK_AROUND_PIP_PLACECARD");
                  break;
                case 1708:
                  v11 = CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY");
                  break;
                default:
                  if (v10 == 1601)
                  {
                    v11 = CFSTR("MENU_ITEM_DARK_MAP");
                  }
                  else
                  {
LABEL_49:
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
                    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch(v10)
          {
            case 1001:
              v11 = CFSTR("CARPLAY_NAV");
              break;
            case 1002:
              v11 = CFSTR("CARPLAY_EXPLORE");
              break;
            case 1003:
              v11 = CFSTR("CARPLAY_DESTINATIONS");
              break;
            case 1004:
              v11 = CFSTR("CARPLAY_TRAFFIC_INCIDENT");
              break;
            case 1005:
              v11 = CFSTR("CARPLAY_CONTROL");
              break;
            case 1006:
              v11 = CFSTR("CARPLAY_PROACTIVE");
              break;
            case 1007:
              v11 = CFSTR("CARPLAY_ROUTING");
              break;
            case 1008:
              v11 = CFSTR("CARPLAY_MORE_ROUTES");
              break;
            case 1009:
              v11 = CFSTR("CARPLAY_SEARCH_ALONG_ROUTE");
              break;
            case 1010:
              v11 = CFSTR("CARPLAY_SEARCH");
              break;
            case 1011:
              v11 = CFSTR("CARPLAY_SEARCH_RESULTS");
              break;
            case 1012:
              v11 = CFSTR("CARPLAY_FAVORITES");
              break;
            case 1013:
              v11 = CFSTR("CARPLAY_NAV_CONFIRMATION");
              break;
            case 1014:
              v11 = CFSTR("CARPLAY_DESTINATION_SHARING");
              break;
            case 1015:
              v11 = CFSTR("CARPLAY_NOTIFICATION_BATTERY");
              break;
            case 1016:
              v11 = CFSTR("CARPLAY_NOTIFICATION_DOOM");
              break;
            case 1017:
              v11 = CFSTR("CARPLAY_NOTIFICATION_FUEL");
              break;
            case 1018:
              v11 = CFSTR("CARPLAY_NOTIFICATION_HYBRID");
              break;
            case 1019:
              v11 = CFSTR("CARPLAY_SHARE_ETA_TRAY");
              break;
            case 1020:
              v11 = CFSTR("CARPLAY_ETA_UPDATE_TRAY");
              break;
            case 1021:
              v11 = CFSTR("CARPLAY_ACTION_TRAY");
              break;
            case 1022:
              v11 = CFSTR("CARPLAY_PLACECARD");
              break;
            case 1023:
              v11 = CFSTR("CARPLAY_KEYBOARD");
              break;
            case 1024:
              v11 = CFSTR("CARPLAY_UI_TARGET_UNKNOWN");
              break;
            case 1025:
              v11 = CFSTR("CARPLAY_EDIT_STOPS");
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
              goto LABEL_49;
            case 1100:
              v11 = CFSTR("RAP_DIRECTIONS_MENU");
              break;
            case 1101:
              v11 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST");
              break;
            case 1102:
              v11 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM");
              break;
            case 1103:
              v11 = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM");
              break;
            case 1104:
              v11 = CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM");
              break;
            case 1105:
              v11 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM");
              break;
            case 1106:
              v11 = CFSTR("RAP_TRANSIT_MENU");
              break;
            case 1107:
              v11 = CFSTR("RAP_STATION_MAP");
              break;
            case 1108:
              v11 = CFSTR("RAP_STATION_MENU");
              break;
            case 1109:
              v11 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP");
              break;
            case 1110:
              v11 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM");
              break;
            case 1111:
              v11 = CFSTR("RAP_STATION_CLOSED_FORM");
              break;
            case 1112:
              v11 = CFSTR("RAP_LINE_MAP");
              break;
            case 1113:
              v11 = CFSTR("RAP_LINE_MENU");
              break;
            case 1114:
              v11 = CFSTR("RAP_LINE_NAME_FORM");
              break;
            case 1115:
              v11 = CFSTR("RAP_LINE_SHAPE_FORM");
              break;
            case 1116:
              v11 = CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM");
              break;
            case 1117:
              v11 = CFSTR("RAP_ADD_PLACE_MENU");
              break;
            case 1118:
              v11 = CFSTR("RAP_ADD_POI_MAP");
              break;
            case 1119:
              v11 = CFSTR("RAP_CATEGORY_LIST");
              break;
            case 1120:
              v11 = CFSTR("RAP_POI_DETAILS_FORM");
              break;
            case 1121:
              v11 = CFSTR("RAP_ADD_STREET_MAP");
              break;
            case 1122:
              v11 = CFSTR("RAP_STREET_DETAILS_FORM");
              break;
            case 1123:
              v11 = CFSTR("RAP_ADD_OTHER_MAP");
              break;
            case 1124:
              v11 = CFSTR("RAP_OTHER_DETAILS_FORM");
              break;
            case 1125:
              v11 = CFSTR("RAP_CAMERA");
              break;
            case 1126:
              v11 = CFSTR("RAP_LABEL_MAP");
              break;
            case 1127:
              v11 = CFSTR("RAP_LABEL_DETAILS_FORM");
              break;
            case 1128:
              v11 = CFSTR("RAP_SEARCH_MENU");
              break;
            case 1129:
              v11 = CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM");
              break;
            case 1130:
              v11 = CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM");
              break;
            case 1131:
              v11 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP");
              break;
            case 1132:
              v11 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM");
              break;
            case 1133:
              v11 = CFSTR("RAP_SATELLITE_IMAGE_MAP");
              break;
            case 1134:
              v11 = CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM");
              break;
            case 1135:
              v11 = CFSTR("RAP_OTHER_FORM");
              break;
            case 1136:
              v11 = CFSTR("RAP_PRIVACY");
              break;
            case 1137:
              v11 = CFSTR("RAP_CONFIRMATION");
              break;
            case 1138:
              v11 = CFSTR("RAP_POI_MENU");
              break;
            case 1139:
              v11 = CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU");
              break;
            case 1140:
              v11 = CFSTR("RAP_ADD_A_PLACE_MAP");
              break;
            case 1141:
              v11 = CFSTR("RAP_POI_LOCATION_MAP");
              break;
            case 1142:
              v11 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP");
              break;
            case 1143:
              v11 = CFSTR("RAP_POI_CLOSED_FORM");
              break;
            case 1144:
              v11 = CFSTR("RAP_CLAIM_BUSINESS_DIALOG");
              break;
            case 1145:
              v11 = CFSTR("RAP_BRAND_MENU");
              break;
            case 1146:
              v11 = CFSTR("RAP_BRAND_DETAILS_FORM");
              break;
            case 1147:
              v11 = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM");
              break;
            case 1148:
              v11 = CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM");
              break;
            case 1149:
              v11 = CFSTR("RAP_LOOK_AROUND_BLURRING_FORM");
              break;
            case 1150:
              v11 = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM");
              break;
            case 1151:
              v11 = CFSTR("RAP_LOOK_AROUND_MENU");
              break;
            case 1152:
              v11 = CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM");
              break;
            case 1153:
              v11 = CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU");
              break;
            case 1154:
              v11 = CFSTR("RAP_LIGHTWEIGHT");
              break;
            case 1155:
              v11 = CFSTR("RAP_EDIT_PLACE_DETAILS");
              break;
            case 1156:
              v11 = CFSTR("RAP_ADD_CATEGORY");
              break;
            case 1157:
              v11 = CFSTR("RAP_ADD_HOURS");
              break;
            case 1158:
              v11 = CFSTR("RAP_EDIT_LOCATION");
              break;
            case 1159:
              v11 = CFSTR("RAP_EDIT_ENTRY_POINT");
              break;
            case 1160:
              v11 = CFSTR("RAP_LOOK_AROUND");
              break;
            case 1161:
              v11 = CFSTR("RAP_ADD_ENTRY_POINT");
              break;
            case 1201:
              v11 = CFSTR("WATCH_MAIN_MENU");
              break;
            case 1202:
              v11 = CFSTR("WATCH_MAIN_PRESS_MENU");
              break;
            case 1203:
              v11 = CFSTR("WATCH_SEARCH");
              break;
            case 1204:
              v11 = CFSTR("WATCH_DICTATION");
              break;
            case 1205:
              v11 = CFSTR("WATCH_FAVORITES");
              break;
            case 1206:
              v11 = CFSTR("WATCH_SUB_CATEGORY_LIST");
              break;
            case 1207:
              v11 = CFSTR("WATCH_SEARCH_RESULTS_LIST");
              break;
            case 1208:
              v11 = CFSTR("WATCH_MAP_VIEW");
              break;
            case 1209:
              v11 = CFSTR("WATCH_PLACECARD");
              break;
            case 1210:
              v11 = CFSTR("WATCH_ROUTE_PLANNING");
              break;
            case 1211:
              v11 = CFSTR("WATCH_ROUTE_DETAILS");
              break;
            case 1212:
              v11 = CFSTR("WATCH_NAV_TBT");
              break;
            case 1213:
              v11 = CFSTR("WATCH_NAV_MAP");
              break;
            case 1214:
              v11 = CFSTR("WATCH_NAV_PRESS_MENU");
              break;
            case 1215:
              v11 = CFSTR("WATCH_MAP_PRESS_MENU");
              break;
            case 1216:
              v11 = CFSTR("WATCH_ROUTING_PRESS_MENU");
              break;
            case 1217:
              v11 = CFSTR("WATCH_TRANSIT_MAP_VIEW");
              break;
            case 1218:
              v11 = CFSTR("WATCH_SCRIBBLE");
              break;
            case 1219:
              v11 = CFSTR("WATCH_COLLECTION_VIEW");
              break;
            case 1220:
              v11 = CFSTR("WATCH_ROUTE_PLANNING_WALKING");
              break;
            case 1221:
              v11 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING");
              break;
            case 1222:
              v11 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT");
              break;
            case 1223:
              v11 = CFSTR("WATCH_PAIRED_DEVICE");
              break;
            case 1224:
              v11 = CFSTR("WATCH_NAV_DRIVING_SPLIT");
              break;
            case 1225:
              v11 = CFSTR("WATCH_NAV_DRIVING_PLATTER");
              break;
            case 1226:
              v11 = CFSTR("WATCH_NAV_DRIVING_MAP");
              break;
            case 1227:
              v11 = CFSTR("WATCH_NAV_WALKING_SPLIT");
              break;
            case 1228:
              v11 = CFSTR("WATCH_NAV_WALKING_PLATTER");
              break;
            case 1229:
              v11 = CFSTR("WATCH_NAV_WALKING_MAP");
              break;
            case 1230:
              v11 = CFSTR("WATCH_NAV_TRANSIT_SPLIT");
              break;
            case 1231:
              v11 = CFSTR("WATCH_NAV_TRANSIT_PLATTER");
              break;
            case 1232:
              v11 = CFSTR("WATCH_NAV_TRANSIT_MAP");
              break;
            case 1233:
              v11 = CFSTR("WATCH_ROUTE_INFO");
              break;
            case 1234:
              v11 = CFSTR("WATCH_NAV_CYCLING_MAP");
              break;
            case 1235:
              v11 = CFSTR("WATCH_NAV_CYCLING_PLATTER");
              break;
            case 1236:
              v11 = CFSTR("WATCH_NAV_CYCLING_SPLIT");
              break;
            case 1237:
              v11 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING");
              break;
            case 1238:
              v11 = CFSTR("WATCH_SEARCH_INPUT");
              break;
            case 1239:
              v11 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
              break;
            case 1240:
              v11 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE");
              break;
            case 1301:
              v11 = CFSTR("PERSONALIZED_ADDRESS_LIST");
              break;
            case 1302:
              v11 = CFSTR("PERSONALIZED_ADDRESS_FORM");
              break;
            case 1303:
              v11 = CFSTR("PERSONALIZED_LABEL_FORM");
              break;
            case 1304:
              v11 = CFSTR("PERSONALIZED_EDIT_MAP");
              break;
            case 1305:
              v11 = CFSTR("PERSONALIZED_CONFIRMATION");
              break;
            case 1306:
              v11 = CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG");
              break;
            case 1307:
              v11 = CFSTR("PERSONALIZED_ADDRESS_INFO");
              break;
            case 1308:
              v11 = CFSTR("PERSONALIZED_ADDRESS_SEARCH");
              break;
            case 1309:
              v11 = CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS");
              break;
            case 1310:
              v11 = CFSTR("FAVORITE_SEARCH");
              break;
            case 1311:
              v11 = CFSTR("FAVORITE_LIST");
              break;
            case 1312:
              v11 = CFSTR("FAVORITE_INFO");
              break;
            case 1313:
              v11 = CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY");
              break;
            default:
              switch(v10)
              {
                case 1401:
                  v11 = CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS");
                  break;
                case 1402:
                  v11 = CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING");
                  break;
                case 1403:
                  v11 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING");
                  break;
                case 1404:
                  v11 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED");
                  break;
                case 1405:
                  v11 = CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG");
                  break;
                case 1406:
                  v11 = CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK");
                  break;
                case 1407:
                  v11 = CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL");
                  break;
                default:
                  switch(v10)
                  {
                    case 1501:
                      v11 = CFSTR("PLACECARD_HEADER");
                      break;
                    case 1502:
                      v11 = CFSTR("PLACECARD_ADDRESS");
                      break;
                    case 1503:
                      v11 = CFSTR("PLACECARD_PHONE");
                      break;
                    case 1504:
                      v11 = CFSTR("PLACECARD_URL");
                      break;
                    default:
                      goto LABEL_49;
                  }
                  break;
              }
              break;
          }
        }
      }
      else
      {
        v11 = CFSTR("UI_TARGET_UNKNOWN");
        switch(v10)
        {
          case 0:
            break;
          case 1:
            v11 = CFSTR("UI_TARGET_POI");
            break;
          case 2:
            v11 = CFSTR("UI_TARGET_SEARCH_RESULT_LIST");
            break;
          case 3:
            v11 = CFSTR("UI_TARGET_POPULAR_NEARBY_LIST");
            break;
          case 4:
            v11 = CFSTR("UI_TARGET_CALLOUT");
            break;
          case 5:
            v11 = CFSTR("UI_TARGET_SEARCH_PIN");
            break;
          case 6:
            v11 = CFSTR("UI_TARGET_DROPPED_PIN");
            break;
          case 7:
            v11 = CFSTR("UI_TARGET_TRANSIT_LINE");
            break;
          case 8:
            v11 = CFSTR("SEARCH_TRAY");
            break;
          case 9:
            v11 = CFSTR("SEARCH_TRAY_BROWSE");
            break;
          case 10:
            v11 = CFSTR("SEARCH_TRAY_POPULAR_NEARBY");
            break;
          case 11:
            v11 = CFSTR("SEARCH_TRAY_AC");
            break;
          case 12:
            v11 = CFSTR("SEARCH_TRAY_AC_INTERMEDIATE");
            break;
          case 13:
            v11 = CFSTR("SEARCH_TRAY_NO_QUERY");
            break;
          case 14:
            v11 = CFSTR("AR_WALKING_LEGAL_TRAY");
            break;
          case 15:
            v11 = CFSTR("RAISE_TO_START_AR_TRAY");
            break;
          case 16:
            v11 = CFSTR("EVENTS_ADVISORY_DETAILS_PAGE");
            break;
          case 17:
            v11 = CFSTR("INCIDENT_REPORT_TRAY_CARPLAY");
            break;
          case 18:
            v11 = CFSTR("HIGHLIGHTED_AREA");
            break;
          case 19:
            v11 = CFSTR("CURATED_COLLECTIONS_HOME");
            break;
          case 20:
            v11 = CFSTR("TRAVEL_PREFERENCES_TRAY");
            break;
          case 21:
            v11 = CFSTR("RESULT_TRAY_SEARCH");
            break;
          case 22:
            v11 = CFSTR("SINGLE_CARD_FILTER");
            break;
          case 23:
            v11 = CFSTR("FULL_CARD_FILTER");
            break;
          case 24:
            v11 = CFSTR("ACCOUNT_PRIVACY_TRAY");
            break;
          case 25:
            v11 = CFSTR("APPLE_RATINGS_HISTORY_TRAY");
            break;
          case 26:
            v11 = CFSTR("CURATED_COLLECTIONS_HOME_FILTERED");
            break;
          case 27:
            v11 = CFSTR("CITY_MENU");
            break;
          case 28:
            v11 = CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED");
            break;
          case 29:
            v11 = CFSTR("ACCOUNT_TRAY");
            break;
          case 30:
            v11 = CFSTR("QUICK_ACTION_TRAY");
            break;
          case 31:
            v11 = CFSTR("SUBMIT_TRIP_FEEDBACK");
            break;
          case 32:
            v11 = CFSTR("RAP_PLACE_ISSUE_DETAILS");
            break;
          case 33:
            v11 = CFSTR("RAP_GUIDES_DETAILS");
            break;
          case 34:
            v11 = CFSTR("RAP_BAD_DIRECTIONS_DETAILS");
            break;
          case 35:
            v11 = CFSTR("RAP_ADD_MAP_DETAILS");
            break;
          case 36:
            v11 = CFSTR("WATCH_COMPLICATION");
            break;
          case 37:
            v11 = CFSTR("RAP_NAV_MENU");
            break;
          case 38:
            v11 = CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT");
            break;
          case 39:
            v11 = CFSTR("RAP_REPORT_MENU");
            break;
          case 40:
            v11 = CFSTR("RAP_CURATED_COLLECTION_MENU");
            break;
          case 41:
            v11 = CFSTR("RAP_REPORT_CARD_DETAILS");
            break;
          case 42:
            v11 = CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT");
            break;
          case 43:
            v11 = CFSTR("RAP_STREET_ISSUE_DETAILS");
            break;
          case 44:
            v11 = CFSTR("NEARBY_TRANSIT_CARD");
            break;
          case 45:
            v11 = CFSTR("WATCH_NAV_MENU");
            break;
          case 46:
            v11 = CFSTR("GENERIC_ADVISORY_PAGE");
            break;
          case 47:
            v11 = CFSTR("USER_PROFILE_TRAY");
            break;
          case 48:
            v11 = CFSTR("MEDIA_APP_MENU");
            break;
          case 49:
            v11 = CFSTR("TEMPLATE_PLACE_TRAY");
            break;
          case 50:
            v11 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP");
            break;
          case 51:
            v11 = CFSTR("ALLOW_NOTIFICATION_DIALOG");
            break;
          case 52:
            v11 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING");
            break;
          case 53:
            v11 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP");
            break;
          case 54:
            v11 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED");
            break;
          case 55:
            v11 = CFSTR("NOTIFICATION_CONSENT_PROMPT");
            break;
          case 56:
            v11 = CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU");
            break;
          case 57:
            v11 = CFSTR("PLACECARD_TRAY_VENDORS_MENU");
            break;
          case 58:
            v11 = CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING");
            break;
          case 59:
            v11 = CFSTR("SEARCH_ALONG_ROUTE_TRAY");
            break;
          case 60:
            v11 = CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING");
            break;
          case 61:
            v11 = CFSTR("PLACECARD_SHOWCASE_MENU");
            break;
          case 62:
            v11 = CFSTR("RAP_INLINE_ADD_DETAILS");
            break;
          case 63:
            v11 = CFSTR("RAP_EDIT_MENU_DETAILS");
            break;
          case 64:
            v11 = CFSTR("RAP_SUBMISSION_PROMPT");
            break;
          case 65:
            v11 = CFSTR("RAP_PLACECARD_EDIT_MENU");
            break;
          case 66:
            v11 = CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE");
            break;
          case 67:
            v11 = CFSTR("INCIDENT_REPORT_MENU");
            break;
          case 68:
            v11 = CFSTR("RAP_SELECT_BAD_ROUTES_STEPS");
            break;
          case 69:
            v11 = CFSTR("RAP_SELECT_BAD_ROUTES");
            break;
          case 70:
            v11 = CFSTR("SIRI_SUGGESTION_RESUME_ROUTE");
            break;
          case 71:
            v11 = CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
            break;
          case 72:
            v11 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST");
            break;
          case 73:
            v11 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY");
            break;
          case 74:
            v11 = CFSTR("NOTIFICATION_ARP");
            break;
          case 75:
            v11 = CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT");
            break;
          case 76:
            v11 = CFSTR("YOUR_PHOTOS_ALBUM");
            break;
          case 77:
            v11 = CFSTR("ARP_PHOTO_CREDIT");
            break;
          case 78:
            v11 = CFSTR("RAP_OUTREACH_REVIEWED_REPORT");
            break;
          case 79:
            v11 = CFSTR("RAP_REPORT_MENU_MORE");
            break;
          case 80:
            v11 = CFSTR("WATCH_MAPS_SETTINGS");
            break;
          case 81:
            v11 = CFSTR("OFFLINE_FEATURE_PROMPT");
            break;
          case 82:
            v11 = CFSTR("EXPIRED_MAPS_DETAILS");
            break;
          case 83:
            v11 = CFSTR("MAPS_VIEW");
            break;
          case 84:
            v11 = CFSTR("NOTIFICATION_OFFLINE");
            break;
          case 85:
            v11 = CFSTR("EXPIRED_MAPS_MANAGEMENT");
            break;
          case 86:
            v11 = CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT");
            break;
          case 87:
            v11 = CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT");
            break;
          case 88:
            v11 = CFSTR("OFFLINE_MAPS_MANAGEMENT");
            break;
          case 89:
            v11 = CFSTR("REGION_SELECTOR");
            break;
          case 90:
            v11 = CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT");
            break;
          case 91:
            v11 = CFSTR("FIND_MY_ETA_SHARING_TRAY");
            break;
          case 92:
            v11 = CFSTR("WATCH_PLACE");
            break;
          case 93:
            v11 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL");
            break;
          case 94:
            v11 = CFSTR("WATCH_ROUTE_PLANNING_MAP");
            break;
          case 95:
            v11 = CFSTR("WATCH_NAV_WALKING_CONTROLS");
            break;
          case 96:
            v11 = CFSTR("WATCH_NAV_CYCLING_CONTROLS");
            break;
          case 97:
            v11 = CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL");
            break;
          case 98:
            v11 = CFSTR("WATCH_NAV_TRANSIT_CONTROLS");
            break;
          case 99:
            v11 = CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL");
            break;
          case 100:
            v11 = CFSTR("WATCH_NAV_DRIVING_CONTROLS");
            break;
          case 101:
            v11 = CFSTR("RESULTS_TRAY_SEARCH");
            break;
          case 102:
            v11 = CFSTR("RESULTS_TRAY_BROWSE");
            break;
          case 103:
            v11 = CFSTR("RESULTS_TRAY_FAVORITES");
            break;
          case 104:
            v11 = CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE");
            break;
          case 105:
            v11 = CFSTR("RESULTS_TRAY_CLUSTER");
            break;
          case 106:
            v11 = CFSTR("RESULTS_TRAY_VENUE_BROWSE");
            break;
          case 107:
            v11 = CFSTR("WATCH_MAP_RESULTS");
            break;
          case 108:
            v11 = CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW");
            break;
          case 109:
            v11 = CFSTR("WATCH_PLACES");
            break;
          case 110:
            v11 = CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW");
            break;
          case 111:
            v11 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL");
            break;
          case 112:
            v11 = CFSTR("DOWNLOADED_MAPS_DETAILS");
            break;
          case 113:
            v11 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL");
            break;
          case 114:
            v11 = CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP");
            break;
          case 115:
            v11 = CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP");
            break;
          case 116:
            v11 = CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP");
            break;
          case 117:
            v11 = CFSTR("WATCH_ROUTE_OPTIONS");
            break;
          case 118:
            v11 = CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP");
            break;
          case 119:
            v11 = CFSTR("WATCH_MORE_GUIDES");
            break;
          case 120:
            v11 = CFSTR("WATCH_RECENTLY_VIEWED");
            break;
          case 121:
            v11 = CFSTR("EV_SUCCESS_TRAY");
            break;
          case 122:
            v11 = CFSTR("PREFERRED_NETWORK_SELECTION_TRAY");
            break;
          case 123:
            v11 = CFSTR("PREFERRED_NETWORK_TRAY");
            break;
          case 124:
            v11 = CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY");
            break;
          case 125:
            v11 = CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY");
            break;
          case 126:
            v11 = CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY");
            break;
          case 127:
            v11 = CFSTR("AC_KEYBOARD_TRAY");
            break;
          case 128:
            v11 = CFSTR("MORE_RELATED_TRAILS");
            break;
          case 129:
            v11 = CFSTR("MORE_RELATED_TRAILHEADS");
            break;
          case 130:
            v11 = CFSTR("ROUTING_TRAY_CUSTOM_ROUTE");
            break;
          case 131:
            v11 = CFSTR("CUSTOM_ROUTE_CREATION_TRAY");
            break;
          case 132:
            v11 = CFSTR("ROUTING_TRAY_CURATED_HIKE");
            break;
          case 133:
            v11 = CFSTR("MORE_CURATED_HIKES");
            break;
          case 134:
            v11 = CFSTR("CUSTOM_ROUTE_ONBOARDING");
            break;
          case 135:
            v11 = CFSTR("LIBRARY_ROUTES");
            break;
          case 136:
            v11 = CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY");
            break;
          case 137:
            v11 = CFSTR("MY_LIBRARY");
            break;
          case 138:
            v11 = CFSTR("EDIT_NOTE_TRAY");
            break;
          case 139:
            v11 = CFSTR("CREATE_NOTE_TRAY");
            break;
          case 140:
            v11 = CFSTR("LIBRARY_PLACES");
            break;
          case 141:
            v11 = CFSTR("WATCH_ACCOUNT");
            break;
          case 142:
            v11 = CFSTR("WATCH_DOWNLOADED_MAPS");
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
            goto LABEL_49;
          case 201:
            v11 = CFSTR("PLACECARD_TRAY");
            break;
          case 202:
            v11 = CFSTR("WEB_MODULE");
            break;
          case 250:
            v11 = CFSTR("ADD_FAVORITE_TRAY");
            break;
          case 251:
            v11 = CFSTR("COLLECTION_LIST");
            break;
          case 252:
            v11 = CFSTR("COLLECTION_VIEW");
            break;
          case 253:
            v11 = CFSTR("FAVORITE_DETAILS");
            break;
          case 254:
            v11 = CFSTR("FAVORITES_TRAY");
            break;
          case 255:
            v11 = CFSTR("SHARED_COLLECTION");
            break;
          case 256:
            v11 = CFSTR("SHARED_COLLECTION_VIEW");
            break;
          case 257:
            v11 = CFSTR("RECENTLY_VIEWED");
            break;
          case 258:
            v11 = CFSTR("SHARED_WEB_COLLECTION");
            break;
          case 259:
            v11 = CFSTR("CURATED_COLLECTION_VIEW");
            break;
          case 260:
            v11 = CFSTR("FEATURED_COLLECTIONS");
            break;
          case 261:
            v11 = CFSTR("PUBLISHER_TRAY");
            break;
          case 262:
            v11 = CFSTR("SHARED_CURATED_COLLECTION_VIEW");
            break;
          case 263:
            v11 = CFSTR("CURATED_COLLECTION_NOTIFICATION");
            break;
          case 264:
            v11 = CFSTR("CURATED_COLLECTION_LIST");
            break;
          case 265:
            v11 = CFSTR("PUBLISHER_LIST");
            break;
          case 266:
            v11 = CFSTR("WATCH_CURATED_COLLECTION_VIEW");
            break;
          case 267:
            v11 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST");
            break;
          case 268:
            v11 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST");
            break;
          case 301:
            v11 = CFSTR("ROUTING_TRAY_DRIVING");
            break;
          case 302:
            v11 = CFSTR("ROUTING_TRAY_WALKING");
            break;
          case 303:
            v11 = CFSTR("ROUTING_TRAY_TRANSIT");
            break;
          case 304:
            v11 = CFSTR("ROUTING_TRAY_RIDESHARE");
            break;
          case 305:
            v11 = CFSTR("ROUTING_TRAY_CYCLING");
            break;
          case 306:
            v11 = CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW");
            break;
          case 401:
            v11 = CFSTR("NAV_TRAY_DRIVING");
            break;
          case 402:
            v11 = CFSTR("NAV_TRAY_WALKING");
            break;
          case 403:
            v11 = CFSTR("NAV_TRAY_TRANSIT");
            break;
          case 404:
            v11 = CFSTR("NAV_TRAY_CYCLING");
            break;
          case 501:
            v11 = CFSTR("MAP_PLACECARD");
            break;
          case 502:
            v11 = CFSTR("MAP_SEARCH");
            break;
          case 503:
            v11 = CFSTR("MAP_RESULTS");
            break;
          case 504:
            v11 = CFSTR("MAP_ROUTING");
            break;
          case 505:
            v11 = CFSTR("MAP_NAV");
            break;
          case 506:
            v11 = CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE");
            break;
          case 507:
            v11 = CFSTR("MAP_TRAFFIC_INCIDENT");
            break;
          case 508:
            v11 = CFSTR("MAP_FULL_SCREEN");
            break;
          case 509:
            v11 = CFSTR("MAP_DRIVE");
            break;
          case 510:
            v11 = CFSTR("MAP_LAUNCH_AND_GO");
            break;
          case 511:
            v11 = CFSTR("MAP_VIEW");
            break;
          case 601:
            v11 = CFSTR("MAPS_SETTINGS");
            break;
          case 602:
            v11 = CFSTR("MAPS_PREFERENCES");
            break;
          case 603:
            v11 = CFSTR("RAP");
            break;
          case 604:
            v11 = CFSTR("ROUTING_DRIVING_DETAILS");
            break;
          case 605:
            v11 = CFSTR("ROUTING_WALKING_DETAILS");
            break;
          case 606:
            v11 = CFSTR("ROUTING_TRANSIT_DETAILS");
            break;
          case 607:
            v11 = CFSTR("ROUTING_EDITOR");
            break;
          case 608:
            v11 = CFSTR("NAV_DRIVING_DETAILS");
            break;
          case 609:
            v11 = CFSTR("NAV_WALKING_DETAILS");
            break;
          case 610:
            v11 = CFSTR("NAV_TRANSIT_DETAILS");
            break;
          case 611:
            v11 = CFSTR("NAV_AUDIO_SETTINGS");
            break;
          case 612:
            v11 = CFSTR("PHOTO_VIEWER_ALL");
            break;
          case 613:
            v11 = CFSTR("PHOTO_VIEWER_SINGLE");
            break;
          case 614:
            v11 = CFSTR("ROUTE_OPTIONS_TRANSIT");
            break;
          case 615:
            v11 = CFSTR("TRAFFIC_INCIDENT_TRAY");
            break;
          case 616:
            v11 = CFSTR("NAV_DIRECTIONS_BANNER_DRIVING");
            break;
          case 617:
            v11 = CFSTR("NAV_DIRECTIONS_BANNER_WALKING");
            break;
          case 618:
            v11 = CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT");
            break;
          case 619:
            v11 = CFSTR("REFINE_SEARCH_SUGGESTION_AREA");
            break;
          case 620:
            v11 = CFSTR("ADD_PHOTO_SHEET");
            break;
          case 621:
            v11 = CFSTR("ADD_PLACE_SHEET");
            break;
          case 622:
            v11 = CFSTR("SHARE_SHEET");
            break;
          case 623:
            v11 = CFSTR("EDIT_LOCATION_SHEET");
            break;
          case 624:
            v11 = CFSTR("ADD_CONTACT_SHEET");
            break;
          case 625:
            v11 = CFSTR("EDIT_NAME_SHEET");
            break;
          case 626:
            v11 = CFSTR("DRIVING_NAV_SETTINGS");
            break;
          case 627:
            v11 = CFSTR("TRANSIT_SETTINGS");
            break;
          case 628:
            v11 = CFSTR("TRANSIT_ADVISORY_SHEET");
            break;
          case 629:
            v11 = CFSTR("REMOVE_CAR_SHEET");
            break;
          case 630:
            v11 = CFSTR("ROUTE_OPTIONS_DRIVING");
            break;
          case 631:
            v11 = CFSTR("ROUTE_OPTIONS_DATETIME");
            break;
          case 632:
            v11 = CFSTR("TRANSIT_ADVISORY_BANNER");
            break;
          case 633:
            v11 = CFSTR("BOOK_TABLE_SELECT_TIME");
            break;
          case 634:
            v11 = CFSTR("BOOK_TABLE_MORE_OPTIONS");
            break;
          case 635:
            v11 = CFSTR("BOOK_TABLE_READY");
            break;
          case 636:
            v11 = CFSTR("BOOK_TABLE_BOOKED");
            break;
          case 637:
            v11 = CFSTR("TRANSIT_LINE_CLUSTER_SHEET");
            break;
          case 638:
            v11 = CFSTR("TRANSIT_LINE_LIST_SHEET");
            break;
          case 639:
            v11 = CFSTR("TRANSIT_BALANCE_BANNER");
            break;
          case 640:
            v11 = CFSTR("WEATHER_ICON");
            break;
          case 641:
            v11 = CFSTR("HELP_IMPROVE_MAPS_DIALOG");
            break;
          case 642:
            v11 = CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG");
            break;
          case 643:
            v11 = CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG");
            break;
          case 644:
            v11 = CFSTR("FLOOR_PICKER");
            break;
          case 645:
            v11 = CFSTR("VENUE_LIST");
            break;
          case 646:
            v11 = CFSTR("AR_MODE");
            break;
          case 647:
            v11 = CFSTR("ROUTING_TRANSIT_TICKETS_SHEET");
            break;
          case 648:
            v11 = CFSTR("LINKED_SERVICE_HOURS");
            break;
          case 649:
            v11 = CFSTR("SHARE_ETA_TRAY");
            break;
          case 650:
            v11 = CFSTR("ETA_UPDATE_TRAY");
            break;
          case 651:
            v11 = CFSTR("SCHEDULECARD_TRAY");
            break;
          case 652:
            v11 = CFSTR("AR_NAV");
            break;
          case 653:
            v11 = CFSTR("TAP_TRANSIT_ACCESS_POINT");
            break;
          case 654:
            v11 = CFSTR("LOCATIONS_INSIDE");
            break;
          case 655:
            v11 = CFSTR("SIMILAR_LOCATIONS");
            break;
          case 656:
            v11 = CFSTR("LOCATIONS_AT_ADDRESS");
            break;
          case 657:
            v11 = CFSTR("NAV_DIRECTIONS_BANNER_CYCLING");
            break;
          case 658:
            v11 = CFSTR("ROUTE_OPTIONS_CYCLING");
            break;
          case 659:
            v11 = CFSTR("EV_CONNECTION_TRAY");
            break;
          case 660:
            v11 = CFSTR("VIRTUAL_GARAGE");
            break;
          case 661:
            v11 = CFSTR("VIRTUAL_GARAGE_BANNER");
            break;
          case 662:
            v11 = CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW");
            break;
          case 663:
            v11 = CFSTR("ADVISORY_DETAILS_PAGE");
            break;
          case 664:
            v11 = CFSTR("APP_CLIP_NOTIFICATION");
            break;
          case 665:
            v11 = CFSTR("PHOTO_VIEWER_GALLERY");
            break;
          case 666:
            v11 = CFSTR("RECOMMENDATION_CARD");
            break;
          case 667:
            v11 = CFSTR("INCIDENT_REPORT_TRAY");
            break;
          case 668:
            v11 = CFSTR("MAPS_WIDGET_DISPLAY");
            break;
          case 669:
            v11 = CFSTR("VISUAL_LOCATION_FRAMEWORK");
            break;
          case 670:
            v11 = CFSTR("APP_CLIP_TRAY");
            break;
          case 671:
            v11 = CFSTR("LICENSE_PLATE_SUGGESTION_PAGE");
            break;
          case 672:
            v11 = CFSTR("NOTIFICATION_ADD_PLATE");
            break;
          case 673:
            v11 = CFSTR("MAPS_RESULTS");
            break;
          case 674:
            v11 = CFSTR("MAPS_WIDGET_APP_CONNECTION");
            break;
          case 675:
            v11 = CFSTR("MAPS_WIDGET_CURRENT_LOCATION");
            break;
          case 676:
            v11 = CFSTR("MAPS_WIDGET_CURRENT_NAV");
            break;
          case 677:
            v11 = CFSTR("MAPS_WIDGET_ETA");
            break;
          case 678:
            v11 = CFSTR("MAPS_WIDGET_TRANSIT");
            break;
          case 679:
            v11 = CFSTR("MAPS_WIDGET_UPC_DESTINATION");
            break;
          case 680:
            v11 = CFSTR("WIDGET_CREATION_TRAY");
            break;
          case 681:
            v11 = CFSTR("MAPS_WIDGET_HOME");
            break;
          case 682:
            v11 = CFSTR("MAPS_WIDGET_PARKED_CAR");
            break;
          case 683:
            v11 = CFSTR("MAPS_WIDGET_POI");
            break;
          case 684:
            v11 = CFSTR("MAPS_WIDGET_SCHOOL");
            break;
          case 685:
            v11 = CFSTR("MAPS_WIDGET_WORK");
            break;
          case 686:
            v11 = CFSTR("AIRPORT_NOTIFICATION");
            break;
          case 687:
            v11 = CFSTR("MAPS_WIDGET_EMPTY");
            break;
          case 688:
            v11 = CFSTR("COARSE_LOCATION_OPTIONS_PROMPT");
            break;
          case 689:
            v11 = CFSTR("ALLOW_PRECISE_LOCATION_PROMPT");
            break;
          case 690:
            v11 = CFSTR("SHARE_MY_LOCATION");
            break;
          case 691:
            v11 = CFSTR("MARK_MY_LOCATION");
            break;
          case 692:
            v11 = CFSTR("AIRPORT_NOTIFICATION_WATCH");
            break;
          case 693:
            v11 = CFSTR("EDIT_FAVORITE");
            break;
          case 694:
            v11 = CFSTR("ROUTING_CYCLING_DETAILS");
            break;
          case 695:
            v11 = CFSTR("NAV_CYCLING_DETAILS");
            break;
          case 696:
            v11 = CFSTR("MAPS_SUGGESTION_WIDGET");
            break;
          case 697:
            v11 = CFSTR("ARP_TIPKIT");
            break;
          case 698:
            v11 = CFSTR("ARP_PRIVACY");
            break;
          case 699:
            v11 = CFSTR("ROUTE_OPTIONS_WALKING");
            break;
          case 701:
            v11 = CFSTR("SAFARI_SEARCH");
            break;
          case 702:
            v11 = CFSTR("SPOTLIGHT_SEARCH");
            break;
          case 703:
            v11 = CFSTR("SAFARI_MAPS_SEARCH_RESULTS");
            break;
          case 704:
            v11 = CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS");
            break;
          case 705:
            v11 = CFSTR("WIDGET_MAPS_DESTINATIONS");
            break;
          case 706:
            v11 = CFSTR("WIDGET_MAPS_TRANSIT");
            break;
          case 707:
            v11 = CFSTR("WIDGET_MAPS_NEARBY");
            break;
          case 708:
            v11 = CFSTR("NOTIFICATION_FIND_MY_CAR");
            break;
          case 709:
            v11 = CFSTR("CONTROL_CENTER");
            break;
          case 710:
            v11 = CFSTR("NOTIFICATION_CENTER");
            break;
          case 711:
            v11 = CFSTR("NOTIFICATION_DOOM");
            break;
          case 712:
            v11 = CFSTR("NOTIFICATION_VENUES");
            break;
          case 713:
            v11 = CFSTR("NOTIFICATION_RAP_UPDATE");
            break;
          case 714:
            v11 = CFSTR("NOTIFICATION_TRIP_CANCELLED");
            break;
          case 715:
            v11 = CFSTR("NOTIFICATION_STOP_SKIPPED");
            break;
          case 716:
            v11 = CFSTR("NOTIFICATION_TRIP_DELAYED");
            break;
          case 717:
            v11 = CFSTR("NOTIFICATION_RAP");
            break;
          case 718:
            v11 = CFSTR("NOTIFICATION_PROXY_AUTH");
            break;
          case 719:
            v11 = CFSTR("NOTIFICATION_PUSH_TO_DEVICE");
            break;
          case 720:
            v11 = CFSTR("NOTIFICATION_LOW_FUEL");
            break;
          case 721:
            v11 = CFSTR("NOTIFICATION_FIND_MY_CAR_RESET");
            break;
          case 722:
            v11 = CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS");
            break;
          case 723:
            v11 = CFSTR("NOTIFICATION_SHARED_ETA");
            break;
          case 724:
            v11 = CFSTR("NOTIFICATION_SHARED_ETA_UPDATE");
            break;
          case 725:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN");
            break;
          case 726:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_GENERAL");
            break;
          case 727:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_FLYOVER");
            break;
          case 728:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_TRANSIT");
            break;
          case 729:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_VENUES");
            break;
          case 730:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL");
            break;
          case 731:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE");
            break;
          case 732:
            v11 = CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND");
            break;
          case 733:
            v11 = CFSTR("APP_SHEET");
            break;
          case 734:
            v11 = CFSTR("CZ_ADVISORY_DETAILS_PAGE");
            break;
          case 735:
            v11 = CFSTR("SHARE_ETA_CONTACT_TRAY");
            break;
          case 736:
            v11 = CFSTR("SIRI_SHARE_ETA");
            break;
          case 737:
            v11 = CFSTR("SIRI_SUGGESTION_SHARED_ETA");
            break;
          case 738:
            v11 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY");
            break;
          case 739:
            v11 = CFSTR("INCIDENT_ALERT_TRAY");
            break;
          case 740:
            v11 = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY");
            break;
          case 741:
            v11 = CFSTR("RAP_INCIDENT_REPORT_VIEW");
            break;
          case 742:
            v11 = CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY");
            break;
          case 743:
            v11 = CFSTR("TRAFFIC_ADVISORY_SHEET");
            break;
          case 801:
            v11 = CFSTR("SIRI_PLUGIN_SNIPPET");
            break;
          case 802:
            v11 = CFSTR("SIRI_PLUGIN_COMMAND");
            break;
          case 803:
            v11 = CFSTR("SIRI_SEARCH_RESULT_LIST");
            break;
          case 804:
            v11 = CFSTR("SIRI_DISAMBIGUATION_LIST");
            break;
          case 805:
            v11 = CFSTR("SIRI_PLACE_SNIPPET");
            break;
          default:
            if (v10 != 901)
              goto LABEL_49;
            v11 = CFSTR("CHROME");
            break;
        }
      }
      if (a2)
        v12 = CFSTR("userActionEventTarget");
      else
        v12 = CFSTR("user_action_event_target");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

      v9 = *(_BYTE *)(a1 + 72);
    }
    if ((v9 & 2) != 0)
    {
      v13 = *(_DWORD *)(a1 + 64);
      if (v13 > 4000)
      {
        if (v13 <= 10100)
        {
          if (v13 > 7000)
          {
            switch(v13)
            {
              case 9001:
                v14 = CFSTR("TAP_WIDGET_ITEM");
                break;
              case 9002:
                v14 = CFSTR("DISPLAY_NOTIFICATION");
                break;
              case 9003:
                v14 = CFSTR("TAP_NOTIFICATION");
                break;
              case 9004:
                v14 = CFSTR("EXPAND_NOTIFICATION");
                break;
              case 9005:
                v14 = CFSTR("DISMISS_NOTIFICATION");
                break;
              case 9006:
                v14 = CFSTR("OPEN_SEARCH");
                break;
              case 9007:
                v14 = CFSTR("OPEN_PAN_VIEW");
                break;
              case 9008:
                v14 = CFSTR("PAN_LEFT");
                break;
              case 9009:
                v14 = CFSTR("PAN_UP");
                break;
              case 9010:
              case 9041:
              case 9042:
              case 9043:
              case 9044:
              case 9045:
              case 9046:
              case 9047:
              case 9048:
              case 9049:
              case 9050:
              case 9051:
              case 9052:
              case 9053:
              case 9054:
              case 9055:
              case 9056:
              case 9057:
              case 9058:
              case 9059:
              case 9060:
              case 9061:
              case 9062:
              case 9063:
              case 9064:
              case 9065:
              case 9066:
              case 9067:
              case 9068:
              case 9069:
              case 9070:
              case 9071:
              case 9072:
              case 9073:
              case 9074:
              case 9075:
              case 9076:
              case 9077:
              case 9078:
              case 9079:
              case 9080:
              case 9081:
              case 9082:
              case 9083:
              case 9084:
              case 9085:
              case 9086:
              case 9087:
              case 9088:
              case 9089:
              case 9090:
              case 9091:
              case 9092:
              case 9093:
              case 9094:
              case 9095:
              case 9096:
              case 9097:
              case 9098:
              case 9099:
              case 9100:
                goto LABEL_578;
              case 9011:
                v14 = CFSTR("PAN_DOWN");
                break;
              case 9012:
                v14 = CFSTR("TAP_RECENT_DESTINATIONS");
                break;
              case 9013:
                v14 = CFSTR("OPEN_DESTINATIONS");
                break;
              case 9014:
                v14 = CFSTR("OPEN_FAVORITES");
                break;
              case 9015:
                v14 = CFSTR("VIEW_NAV_OPTIONS");
                break;
              case 9016:
                v14 = CFSTR("START_NAV_NO_GUIDANCE");
                break;
              case 9017:
                v14 = CFSTR("TURN_OFF_GUIDANCE");
                break;
              case 9018:
                v14 = CFSTR("TURN_ON_GUIDANCE");
                break;
              case 9019:
                v14 = CFSTR("OPEN_KEYBOARD");
                break;
              case 9020:
                v14 = CFSTR("SHARE_DESTINATION");
                break;
              case 9021:
                v14 = CFSTR("START_NAV_AUTOMATED");
                break;
              case 9022:
                v14 = CFSTR("SHARE_ETA");
                break;
              case 9023:
                v14 = CFSTR("SELECT_GROUP");
                break;
              case 9024:
                v14 = CFSTR("DESELECT_GROUP");
                break;
              case 9025:
                v14 = CFSTR("SELECT_CONTACT");
                break;
              case 9026:
                v14 = CFSTR("DESELECT_CONTACT");
                break;
              case 9027:
                v14 = CFSTR("TAP_VIEW_CONTACTS");
                break;
              case 9028:
                v14 = CFSTR("STOP_RECEIVING_ETA");
                break;
              case 9029:
                v14 = CFSTR("DISPLAY_ANNOUNCEMENT");
                break;
              case 9030:
                v14 = CFSTR("TAP_ANNOUNCEMENT");
                break;
              case 9031:
                v14 = CFSTR("DISPLAY_CYCLING_NOTIFICATION");
                break;
              case 9032:
                v14 = CFSTR("TAP_CYCLING_NOTIFICATION");
                break;
              case 9033:
                v14 = CFSTR("SHARE_CYCLING_ETA");
                break;
              case 9034:
                v14 = CFSTR("MANAGE_NOTIFICATIONS");
                break;
              case 9035:
                v14 = CFSTR("PUNCH_OUT_PUBLISHER_REVIEW");
                break;
              case 9036:
                v14 = CFSTR("SCROLL_FORWARD");
                break;
              case 9037:
                v14 = CFSTR("SCROLL_BACKWARD");
                break;
              case 9038:
                v14 = CFSTR("SHOW_ALL_CURATED_COLLECTIONS");
                break;
              case 9039:
                v14 = CFSTR("TAP_LESS");
                break;
              case 9040:
                v14 = CFSTR("TAP_MORE");
                break;
              case 9101:
                v14 = CFSTR("DISPLAY_ADD_HOME_AND_WORK");
                break;
              case 9102:
                v14 = CFSTR("TAP_ADD_HOME_AND_WORK");
                break;
              case 9103:
                v14 = CFSTR("DISPLAY_ALLOW_FREQUENTS");
                break;
              case 9104:
                v14 = CFSTR("TAP_ALLOW_FREQUENTS");
                break;
              case 9105:
                v14 = CFSTR("DISPLAY_ALLOW_LOCATION");
                break;
              case 9106:
                v14 = CFSTR("TAP_ALLOW_LOCATION");
                break;
              default:
                switch(v13)
                {
                  case 7001:
                    v14 = CFSTR("EXPAND_TRANSIT_SYSTEM");
                    break;
                  case 7002:
                    v14 = CFSTR("COLLAPSE_TRANSIT_SYSTEM");
                    break;
                  case 7003:
                    v14 = CFSTR("SHOW_MORE_DEPARTURES");
                    break;
                  case 7004:
                    v14 = CFSTR("VIEW_TRANSIT_LINE");
                    break;
                  case 7005:
                    v14 = CFSTR("CANCEL_VIEW_TRANSIT_LINE");
                    break;
                  case 7006:
                    v14 = CFSTR("TAP_TRANSIT_ATTRIBUTION");
                    break;
                  case 7007:
                    v14 = CFSTR("TAP_TRANSIT_ADVISORY");
                    break;
                  case 7008:
                    v14 = CFSTR("MORE_DETAILS_TRANSIT_ADVISORY");
                    break;
                  case 7009:
                    v14 = CFSTR("SUBSCRIBE_LINE_INCIDENT");
                    break;
                  case 7010:
                    v14 = CFSTR("UNSUBSCRIBE_LINE_INCIDENT");
                    break;
                  case 7011:
                    v14 = CFSTR("TAP_NEAREST_STATION");
                    break;
                  case 7012:
                    v14 = CFSTR("TAP_NEAREST_STOP");
                    break;
                  case 7013:
                    v14 = CFSTR("TAP_CONNECTION");
                    break;
                  case 7014:
                    v14 = CFSTR("GET_TICKETS");
                    break;
                  case 7015:
                    v14 = CFSTR("OPEN_SCHEDULECARD_DATETIME");
                    break;
                  case 7016:
                    v14 = CFSTR("EXPAND_PRIOR_STEP_DETAILS_TRANSIT");
                    break;
                  case 7017:
                    v14 = CFSTR("EXPAND_ALIGHT_STEP_DETAILS_TRANSIT");
                    break;
                  case 7018:
                    v14 = CFSTR("VIEW_ON_MAP");
                    break;
                  case 7019:
                    v14 = CFSTR("FORCE_UPDATE_DEPARTURE_INFO");
                    break;
                  case 7020:
                    v14 = CFSTR("TAP_TRANSIT_LINE_INFO");
                    break;
                  case 7021:
                    v14 = CFSTR("TAP_ATTRIBUTION_CELL");
                    break;
                  case 7022:
                    v14 = CFSTR("TAP_NEXT_DEPARTURES");
                    break;
                  case 7023:
                    v14 = CFSTR("VIEW_BANNER");
                    break;
                  case 7024:
                    v14 = CFSTR("GET_SHOWTIMES");
                    break;
                  case 7025:
                    v14 = CFSTR("MAKE_APPOINTMENT");
                    break;
                  case 7026:
                    v14 = CFSTR("RESERVE_PARKING");
                    break;
                  case 7027:
                    v14 = CFSTR("RESERVE_ROOM");
                    break;
                  case 7028:
                    v14 = CFSTR("WAITLIST");
                    break;
                  case 7029:
                    v14 = CFSTR("ORDER_TAKEOUT");
                    break;
                  case 7030:
                    v14 = CFSTR("RESERVE");
                    break;
                  default:
                    switch(v13)
                    {
                      case 8001:
                        v14 = CFSTR("INVOKE_SIRI_SNIPPET");
                        break;
                      case 8002:
                        v14 = CFSTR("INVOKE_SIRI_DISAMBIGUATION");
                        break;
                      case 8003:
                        v14 = CFSTR("SHOW_PLACE_DETAILS");
                        break;
                      case 8004:
                        v14 = CFSTR("ANSWER_REROUTE_SUGGESTION");
                        break;
                      case 8005:
                        v14 = CFSTR("SUGGEST_NAV_REROUTE");
                        break;
                      case 8006:
                        v14 = CFSTR("GET_NAV_STATUS");
                        break;
                      case 8007:
                        v14 = CFSTR("REPEAT_NAV_STATUS");
                        break;
                      case 8008:
                        v14 = CFSTR("SELECT_AUDIO_VOLUME_UNMUTE");
                        break;
                      case 8009:
                        v14 = CFSTR("INVOKE_SIRI");
                        break;
                      case 8010:
                        v14 = CFSTR("DISPLAY_SIRI_ERROR_MESSAGE");
                        break;
                      case 8011:
                        v14 = CFSTR("DISPLAY_NO_RESULTS_MESSAGE");
                        break;
                      default:
                        goto LABEL_578;
                    }
                    break;
                }
                break;
            }
          }
          else
          {
            switch(v13)
            {
              case 6003:
                v14 = CFSTR("GET_DIRECTIONS");
                break;
              case 6004:
                v14 = CFSTR("TAP_FLYOVER_TOUR");
                break;
              case 6005:
                v14 = CFSTR("REMOVE_PIN");
                break;
              case 6006:
                v14 = CFSTR("TAP_PHOTO");
                break;
              case 6007:
                v14 = CFSTR("TAP_MAPS_VIEW");
                break;
              case 6008:
                v14 = CFSTR("TAP_ADDRESS");
                break;
              case 6009:
                v14 = CFSTR("CALL");
                break;
              case 6010:
                v14 = CFSTR("TAP_URL");
                break;
              case 6011:
                v14 = CFSTR("SHOW_TODAY_HOURS");
                break;
              case 6012:
                v14 = CFSTR("SHOW_ALL_HOURS");
                break;
              case 6013:
                v14 = CFSTR("SHARE");
                break;
              case 6014:
              case 6017:
              case 6028:
              case 6030:
              case 6035:
                goto LABEL_578;
              case 6015:
                v14 = CFSTR("ADD_TO_FAVORITES");
                break;
              case 6016:
                v14 = CFSTR("ADD_CONTACT");
                break;
              case 6018:
                v14 = CFSTR("PUNCH_OUT_PHOTO");
                break;
              case 6019:
                v14 = CFSTR("PUNCH_OUT_USEFUL_TO_KNOW");
                break;
              case 6020:
                v14 = CFSTR("PUNCH_OUT_OPEN_APP");
                break;
              case 6021:
                v14 = CFSTR("PUNCH_OUT_SINGLE_REVIEW");
                break;
              case 6022:
                v14 = CFSTR("PUNCH_OUT_CHECK_IN");
                break;
              case 6023:
                v14 = CFSTR("PUNCH_OUT_MORE_INFO");
                break;
              case 6024:
                v14 = CFSTR("PUNCH_OUT_WRITE_REVIEW");
                break;
              case 6025:
                v14 = CFSTR("PUNCH_OUT_ADD_PHOTO");
                break;
              case 6026:
                v14 = CFSTR("TAP_GRID_VIEW");
                break;
              case 6027:
                v14 = CFSTR("EDIT_LOCATION");
                break;
              case 6029:
                v14 = CFSTR("ADD_PHOTO");
                break;
              case 6031:
                v14 = CFSTR("RETAKE");
                break;
              case 6032:
                v14 = CFSTR("ADD_NOTE");
                break;
              case 6033:
                v14 = CFSTR("REMOVE_CAR");
                break;
              case 6034:
                v14 = CFSTR("EDIT_NAME");
                break;
              case 6036:
                v14 = CFSTR("RESERVE_TABLE");
                break;
              case 6037:
                v14 = CFSTR("ADD_TO_QUEUE");
                break;
              case 6038:
                v14 = CFSTR("VIEW_BOOKED_TABLE");
                break;
              case 6039:
                v14 = CFSTR("VIEW_QUEUED_TABLE");
                break;
              case 6040:
                v14 = CFSTR("PUNCH_OUT_THIRD_PARTY_APP");
                break;
              case 6041:
                v14 = CFSTR("PUNCH_OUT_LEGAL_LINK");
                break;
              case 6042:
                v14 = CFSTR("TAP_PLACECARD_HEADER");
                break;
              case 6043:
                v14 = CFSTR("REMOVE_FROM_FAVORITES");
                break;
              case 6044:
                v14 = CFSTR("VIEW_CONTACT");
                break;
              case 6045:
                v14 = CFSTR("CHAT");
                break;
              case 6046:
                v14 = CFSTR("FIND_STORES");
                break;
              case 6047:
                v14 = CFSTR("TAP_PARENT");
                break;
              case 6048:
                v14 = CFSTR("SCROLL_LEFT_PHOTOS");
                break;
              case 6049:
                v14 = CFSTR("SCROLL_RIGHT_PHOTOS");
                break;
              case 6050:
                v14 = CFSTR("PUNCH_OUT");
                break;
              case 6051:
                v14 = CFSTR("TAP_ENTER_MUNIN");
                break;
              case 6052:
                v14 = CFSTR("TAP_RECOMMENDED_DISHES_PHOTO");
                break;
              case 6053:
                v14 = CFSTR("PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP");
                break;
              case 6054:
                v14 = CFSTR("PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO");
                break;
              case 6055:
                v14 = CFSTR("SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS");
                break;
              case 6056:
                v14 = CFSTR("SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS");
                break;
              case 6057:
                v14 = CFSTR("SHOW_LINKED_SERVICE_HOURS");
                break;
              case 6058:
                v14 = CFSTR("ENTER_LOOK_AROUND");
                break;
              case 6059:
                v14 = CFSTR("EXIT_LOOK_AROUND");
                break;
              case 6060:
                v14 = CFSTR("TAP_ENTER_LOOK_AROUND_VIEW");
                break;
              case 6061:
                v14 = CFSTR("TAP_ENTER_LOOK_AROUND_PIP");
                break;
              case 6062:
                v14 = CFSTR("EXPAND_LOOK_AROUND_VIEW");
                break;
              case 6063:
                v14 = CFSTR("CLOSE_LOOK_AROUND");
                break;
              case 6064:
                v14 = CFSTR("COLLAPSE_LOOK_AROUND_VIEW");
                break;
              case 6065:
                v14 = CFSTR("TAP_SHOW_ACTIONS");
                break;
              case 6066:
                v14 = CFSTR("TAP_HIDE_LABELS");
                break;
              case 6067:
                v14 = CFSTR("TAP_SHOW_LABELS");
                break;
              case 6068:
                v14 = CFSTR("TAP_SHOW_DETAILS");
                break;
              case 6069:
                v14 = CFSTR("PAN_LOOK_AROUND");
                break;
              case 6070:
                v14 = CFSTR("TAP_LOOK_AROUND_THUMBNAIL");
                break;
              case 6071:
                v14 = CFSTR("TAP_LANDMARK");
                break;
              case 6072:
                v14 = CFSTR("TAP_SCENE");
                break;
              case 6073:
                v14 = CFSTR("SHOW_LINKED_BUSINESS_HOURS");
                break;
              case 6074:
                v14 = CFSTR("TAP_PLACECARD_SHORTCUT");
                break;
              case 6075:
                v14 = CFSTR("SHOW_ALL_LOCATIONS_INSIDE");
                break;
              case 6076:
                v14 = CFSTR("SHOW_ALL_SIMILAR_LOCATIONS");
                break;
              case 6077:
                v14 = CFSTR("SHOW_ALL_LOCATIONS_AT_ADDRESS");
                break;
              case 6078:
                v14 = CFSTR("TAP_PARENT_LOCATION");
                break;
              case 6079:
                v14 = CFSTR("TAP_SIMILAR_LOCATION");
                break;
              case 6080:
                v14 = CFSTR("TAP_LOCATION_INSIDE");
                break;
              case 6081:
                v14 = CFSTR("TAP_LOCATION_AT_ADDRESS");
                break;
              case 6082:
                v14 = CFSTR("CLOSE_ROUTE_GENIUS");
                break;
              case 6083:
                v14 = CFSTR("LOAD_WEB_CONTENT");
                break;
              case 6084:
                v14 = CFSTR("SCROLL_FORWARD_WEB_CONTENT");
                break;
              case 6085:
                v14 = CFSTR("SCROLL_BACKWARD_WEB_CONTENT");
                break;
              case 6086:
                v14 = CFSTR("TAP_WEB_CONTENT");
                break;
              case 6087:
                v14 = CFSTR("SHOW_PHOTO_VIEWER");
                break;
              case 6088:
                v14 = CFSTR("SHOW_LAST_PAGE");
                break;
              case 6089:
                v14 = CFSTR("TAP_VIEW_APP");
                break;
              case 6090:
                v14 = CFSTR("TAP_APP_CLIP");
                break;
              case 6091:
                v14 = CFSTR("DEAD_BATTERY");
                break;
              case 6092:
                v14 = CFSTR("DISMISS_LOW_BATTERY_ALERT");
                break;
              case 6093:
                v14 = CFSTR("DISMISS_OUT_OF_RANGE_ALERT");
                break;
              case 6094:
                v14 = CFSTR("FAILED_TO_LOAD_EV_STATUS");
                break;
              case 6095:
                v14 = CFSTR("LOW_BATTERY_ALERT");
                break;
              case 6096:
                v14 = CFSTR("PAUSE_ROUTE");
                break;
              case 6097:
                v14 = CFSTR("TAP_ADD_STOP");
                break;
              case 6098:
                v14 = CFSTR("TAP_CHARGE_POINT");
                break;
              case 6099:
                v14 = CFSTR("TAP_OUT_OF_RANGE_ALERT");
                break;
              case 6100:
                v14 = CFSTR("SCROLL_DOWN_PHOTOS");
                break;
              case 6101:
                v14 = CFSTR("SCROLL_UP_PHOTOS");
                break;
              case 6102:
                v14 = CFSTR("TAP_MORE_PHOTOS");
                break;
              case 6103:
                v14 = CFSTR("TAP_TO_CONFIRM_INCIDENT");
                break;
              case 6104:
                v14 = CFSTR("SHOW_INCIDENT");
                break;
              case 6105:
                v14 = CFSTR("REVEAL_APP_CLIP");
                break;
              case 6106:
                v14 = CFSTR("ORDER_DELIVERY");
                break;
              case 6107:
                v14 = CFSTR("VIEW_MENU");
                break;
              case 6108:
                v14 = CFSTR("TAP_EDIT_STOPS");
                break;
              case 6109:
                v14 = CFSTR("LEARN_MORE_WEB_CONTENT");
                break;
              case 6110:
                v14 = CFSTR("MAKE_APPOINTMENT_WEB_CONTENT");
                break;
              case 6111:
                v14 = CFSTR("REVEAL_SHOWCASE");
                break;
              default:
                switch(v13)
                {
                  case 5001:
                    v14 = CFSTR("SHOW_MAPS_SETTINGS");
                    break;
                  case 5002:
                    v14 = CFSTR("TAP_STANDARD_MODE");
                    break;
                  case 5003:
                    v14 = CFSTR("TAP_TRANSIT_MODE");
                    break;
                  case 5004:
                    v14 = CFSTR("TAP_SATELLITE_MODE");
                    break;
                  case 5005:
                    v14 = CFSTR("SWITCH_ON_TRAFFIC");
                    break;
                  case 5006:
                    v14 = CFSTR("SWITCH_OFF_TRAFFIC");
                    break;
                  case 5007:
                    v14 = CFSTR("SWITCH_ON_LABELS");
                    break;
                  case 5008:
                    v14 = CFSTR("SWITCH_OFF_LABELS");
                    break;
                  case 5009:
                    v14 = CFSTR("SWITCH_ON_3D_MAP");
                    break;
                  case 5010:
                    v14 = CFSTR("SWITCH_OFF_3D_MAP");
                    break;
                  case 5011:
                    v14 = CFSTR("SWITCH_ON_WEATHER");
                    break;
                  case 5012:
                    v14 = CFSTR("SWITCH_OFF_WEATHER");
                    break;
                  case 5013:
                    v14 = CFSTR("REPORT_A_PROBLEM");
                    break;
                  case 5014:
                    v14 = CFSTR("ADD_PLACE");
                    break;
                  case 5015:
                    goto LABEL_578;
                  case 5016:
                    v14 = CFSTR("TAP_PREFERENCES");
                    break;
                  case 5017:
                    v14 = CFSTR("SWITCH_ON_TOLLS");
                    break;
                  case 5018:
                    v14 = CFSTR("SWITCH_OFF_TOLLS");
                    break;
                  case 5019:
                    v14 = CFSTR("SWITCH_ON_HIGHWAYS");
                    break;
                  case 5020:
                    v14 = CFSTR("SWITCH_OFF_HIGHWAYS");
                    break;
                  case 5021:
                    v14 = CFSTR("SWITCH_ON_HEADING");
                    break;
                  case 5022:
                    v14 = CFSTR("SWITCH_OFF_HEADING");
                    break;
                  case 5023:
                    v14 = CFSTR("SWITCH_ON_SPEED_LIMIT");
                    break;
                  case 5024:
                    v14 = CFSTR("SWITCH_OFF_SPEED_LIMIT");
                    break;
                  case 5025:
                    v14 = CFSTR("ELECT_DRIVING_MODE");
                    break;
                  case 5026:
                    v14 = CFSTR("ELECT_WALKING_MODE");
                    break;
                  case 5027:
                    v14 = CFSTR("ELECT_TRANSIT_MODE");
                    break;
                  case 5028:
                    v14 = CFSTR("ELECT_RIDESHARE_MODE");
                    break;
                  case 5029:
                    v14 = CFSTR("SWITCH_ON_FIND_MY_CAR");
                    break;
                  case 5030:
                    v14 = CFSTR("SWITCH_OFF_FIND_MY_CAR");
                    break;
                  case 5031:
                    v14 = CFSTR("MARK_MY_LOCATION");
                    break;
                  case 5032:
                    v14 = CFSTR("TAP_HYBRID_MODE");
                    break;
                  case 5033:
                    v14 = CFSTR("CHECK_AVOID_BUSY_ROADS");
                    break;
                  case 5034:
                    v14 = CFSTR("UNCHECK_AVOID_BUSY_ROADS");
                    break;
                  case 5035:
                    v14 = CFSTR("CHECK_AVOID_HILLS");
                    break;
                  case 5036:
                    v14 = CFSTR("UNCHECK_AVOID_HILLS");
                    break;
                  case 5037:
                    v14 = CFSTR("CHECK_AVOID_STAIRS");
                    break;
                  case 5038:
                    v14 = CFSTR("UNCHECK_AVOID_STAIRS");
                    break;
                  case 5039:
                    v14 = CFSTR("ELECT_CYCLING_MODE");
                    break;
                  default:
                    switch(v13)
                    {
                      case 4001:
                        v14 = CFSTR("RECENTER_CURRENT_LOCATION");
                        break;
                      case 4002:
                        v14 = CFSTR("TAP_HEADING_ON");
                        break;
                      case 4003:
                        v14 = CFSTR("TAP_HEADING_OFF");
                        break;
                      case 4004:
                        v14 = CFSTR("PUCK_DRIFT");
                        break;
                      case 4005:
                        v14 = CFSTR("PUCK_SNAP");
                        break;
                      case 4006:
                        v14 = CFSTR("SELECT_FLOOR");
                        break;
                      default:
                        goto LABEL_578;
                    }
                    break;
                }
                break;
            }
          }
        }
        else if (v13 > 13000)
        {
          if (v13 <= 16000)
          {
            if (v13 <= 15000)
            {
              switch(v13)
              {
                case 14001:
                  v14 = CFSTR("VIEW_APP");
                  break;
                case 14002:
                  v14 = CFSTR("ENABLE");
                  break;
                case 14003:
                  v14 = CFSTR("BOOK_RIDE");
                  break;
                case 14004:
                  v14 = CFSTR("REQUEST_RIDE");
                  break;
                case 14005:
                  v14 = CFSTR("CONTACT_DRIVER");
                  break;
                case 14006:
                  v14 = CFSTR("CHANGE_PAYMENT");
                  break;
                case 14007:
                  v14 = CFSTR("ENABLE_ALL_RIDESHARE_APPS");
                  break;
                case 14008:
                  v14 = CFSTR("TAP_FOR_MORE_RIDES");
                  break;
                case 14009:
                  v14 = CFSTR("SUBMIT_TRIP_FEEDBACK");
                  break;
                default:
                  switch(v13)
                  {
                    case 13001:
                      v14 = CFSTR("SELECT_ADDRESS");
                      break;
                    case 13002:
                      v14 = CFSTR("ADD_ADDRESS");
                      break;
                    case 13003:
                      v14 = CFSTR("SELECT_LABEL");
                      break;
                    case 13004:
                      v14 = CFSTR("DELETE_ADDRESS");
                      break;
                    case 13005:
                      v14 = CFSTR("EDIT_ITEMS");
                      break;
                    case 13006:
                      v14 = CFSTR("RAP_FAVORITES");
                      break;
                    case 13007:
                      v14 = CFSTR("SORT_LIST_ITEM");
                      break;
                    default:
                      goto LABEL_578;
                  }
                  break;
              }
            }
            else
            {
              switch(v13)
              {
                case 15001:
                  v14 = CFSTR("ORB_PEEK");
                  break;
                case 15002:
                  v14 = CFSTR("ORB_POP");
                  break;
                case 15003:
                  v14 = CFSTR("ORB_DISMISS");
                  break;
                default:
LABEL_578:
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 64));
                  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  break;
              }
            }
          }
          else
          {
            switch(v13)
            {
              case 17001:
                v14 = CFSTR("START_DRAG");
                break;
              case 17002:
                v14 = CFSTR("CANCEL_DRAG");
                break;
              case 17003:
                v14 = CFSTR("COMPLETE_DRAG");
                break;
              case 17004:
                v14 = CFSTR("START_DROP");
                break;
              case 17005:
                v14 = CFSTR("CANCEL_DROP");
                break;
              case 17006:
                v14 = CFSTR("COMPLETE_DROP");
                break;
              case 17007:
                v14 = CFSTR("ANNOTATION_SELECT");
                break;
              case 17008:
                v14 = CFSTR("ANNOTATION_SELECT_AUTO");
                break;
              case 17009:
                v14 = CFSTR("ANNOTATION_SELECT_LIST");
                break;
              case 17010:
                v14 = CFSTR("BROWSE_TOP_CATEGORY_DISPLAYED");
                break;
              case 17011:
                v14 = CFSTR("CALLOUT_FLYOVER_TOUR");
                break;
              case 17012:
                v14 = CFSTR("CALLOUT_INFO");
                break;
              case 17013:
                v14 = CFSTR("CALLOUT_NAV_TRANSIT");
                break;
              case 17014:
                v14 = CFSTR("CALLOUT_TRAFFIC_INCIDENT_INFO");
                break;
              case 17015:
                v14 = CFSTR("CALLOUT_VIEW_TRANSIT_LINE");
                break;
              case 17016:
                v14 = CFSTR("DIRECTIONS_SELECT");
                break;
              case 17017:
                v14 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM");
                break;
              case 17018:
                v14 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_ARRIVES");
                break;
              case 17019:
                v14 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_DEPARTS");
                break;
              case 17020:
                v14 = CFSTR("DIRECTIONS_TRANSIT_CUSTOM_DONE");
                break;
              case 17021:
                v14 = CFSTR("DIRECTIONS_TRANSIT_LATER");
                break;
              case 17022:
                v14 = CFSTR("DIRECTIONS_TRANSIT_NOW");
                break;
              case 17023:
                v14 = CFSTR("FLYOVER_NOTIFICATION_DISMISS");
                break;
              case 17024:
                v14 = CFSTR("FLYOVER_NOTIFICATION_START");
                break;
              case 17025:
                v14 = CFSTR("FLYOVER_TOUR_COMPLETED");
                break;
              case 17026:
                v14 = CFSTR("FLYOVER_TOUR_END");
                break;
              case 17027:
                v14 = CFSTR("FLYOVER_TOUR_NOTIFICATION");
                break;
              case 17028:
                v14 = CFSTR("FLYOVER_TOUR_START");
                break;
              case 17029:
                v14 = CFSTR("INFO_BOOKMARKS");
                break;
              case 17030:
                v14 = CFSTR("INFO_CARD_DETACHED");
                break;
              case 17031:
                v14 = CFSTR("INFO_CONTACTS");
                break;
              case 17032:
                v14 = CFSTR("INFO_DIRECTIONS");
                break;
              case 17033:
                v14 = CFSTR("INFO_DIRECTIONS_FROM");
                break;
              case 17034:
                v14 = CFSTR("INFO_DIRECTIONS_TO");
                break;
              case 17035:
                v14 = CFSTR("INFO_DISMISS");
                break;
              case 17036:
                v14 = CFSTR("INFO_INFO");
                break;
              case 17037:
                v14 = CFSTR("INFO_PHOTOS");
                break;
              case 17038:
                v14 = CFSTR("INFO_REVIEWS");
                break;
              case 17039:
                v14 = CFSTR("INFO_SHARE");
                break;
              case 17040:
                v14 = CFSTR("INFO_SHARE_AIRDROP");
                break;
              case 17041:
                v14 = CFSTR("INFO_SHARE_FACEBOOK");
                break;
              case 17042:
                v14 = CFSTR("INFO_SHARE_MAIL");
                break;
              case 17043:
                v14 = CFSTR("INFO_SHARE_MESSAGE");
                break;
              case 17044:
                v14 = CFSTR("INFO_SHARE_TENCENTWEIBO");
                break;
              case 17045:
                v14 = CFSTR("INFO_SHARE_WEIBO");
                break;
              case 17046:
                v14 = CFSTR("INFO_YELP");
                break;
              case 17047:
                v14 = CFSTR("MAPS_APP_LAUNCH");
                break;
              case 17048:
                v14 = CFSTR("MAP_3D_OFF");
                break;
              case 17049:
                v14 = CFSTR("MAP_3D_ON");
                break;
              case 17050:
                v14 = CFSTR("MAP_OPTIONS_DROP_PIN");
                break;
              case 17051:
                v14 = CFSTR("MAP_OPTIONS_HYBRID");
                break;
              case 17052:
                v14 = CFSTR("MAP_OPTIONS_PRINT");
                break;
              case 17053:
                v14 = CFSTR("MAP_OPTIONS_REMOVE_PIN");
                break;
              case 17054:
                v14 = CFSTR("MAP_OPTIONS_SATELLITE");
                break;
              case 17055:
                v14 = CFSTR("MAP_OPTIONS_STANDARD");
                break;
              case 17056:
                v14 = CFSTR("MAP_OPTIONS_TRAFFIC_HIDE");
                break;
              case 17057:
                v14 = CFSTR("MAP_OPTIONS_TRAFFIC_SHOW");
                break;
              case 17058:
                v14 = CFSTR("MAP_OPTIONS_TRANSIT");
                break;
              case 17059:
                v14 = CFSTR("MAP_TAP_FLYOVER_CITY");
                break;
              case 17060:
                v14 = CFSTR("MAP_TAP_LINE");
                break;
              case 17061:
                v14 = CFSTR("MAP_TAP_POI_TRANSIT");
                break;
              case 17062:
                v14 = CFSTR("MAP_TAP_TRAFFIC_INCIDENT");
                break;
              case 17063:
                v14 = CFSTR("MAP_TRANSIT_NOT_AVAIL_SHOWING");
                break;
              case 17064:
                v14 = CFSTR("MAP_USER_TRACKING_OFF");
                break;
              case 17065:
                v14 = CFSTR("MAP_USER_TRACKING_ON");
                break;
              case 17066:
                v14 = CFSTR("MAP_USER_TRACKING_WITH_HEADING_ON");
                break;
              case 17067:
                v14 = CFSTR("NAV_CLEAR");
                break;
              case 17068:
                v14 = CFSTR("NAV_LIST");
                break;
              case 17069:
                v14 = CFSTR("NAV_ROUTE_STEP_NEXT");
                break;
              case 17070:
                v14 = CFSTR("NAV_ROUTE_STEP_PREV");
                break;
              case 17071:
                v14 = CFSTR("NO_NETWORK_ROUTING_ALERT_DISPLAYED");
                break;
              case 17072:
                v14 = CFSTR("ORB_DISPLAY_MENU");
                break;
              case 17073:
                v14 = CFSTR("ORB_MENU_CALL");
                break;
              case 17074:
                v14 = CFSTR("ORB_MENU_DIRECTIONS");
                break;
              case 17075:
                v14 = CFSTR("ORB_MENU_DISMISS");
                break;
              case 17076:
                v14 = CFSTR("ORB_MENU_SHARE");
                break;
              case 17077:
                v14 = CFSTR("ORB_MENU_SHOW_PLACECARD");
                break;
              case 17078:
                v14 = CFSTR("ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP");
                break;
              case 17079:
                v14 = CFSTR("ORB_MENU_URL");
                break;
              case 17080:
                v14 = CFSTR("ORB_PRESS");
                break;
              case 17081:
                v14 = CFSTR("ORB_SPRINGBOARD_MARK_LOCATION");
                break;
              case 17082:
                v14 = CFSTR("ORB_SPRINGBOARD_SEARCH");
                break;
              case 17083:
                v14 = CFSTR("ORB_SPRINGBOARD_SHARE_LOCATION");
                break;
              case 17084:
                v14 = CFSTR("RAP_ENTRY_SEARCH_AUTOCOMPLETE");
                break;
              case 17085:
                v14 = CFSTR("RAP_PERMISSION_CANCEL");
                break;
              case 17086:
                v14 = CFSTR("RAP_PERMISSION_EMAIL_NA");
                break;
              case 17087:
                v14 = CFSTR("RAP_PERMISSION_EMAIL_OK");
                break;
              case 17088:
                v14 = CFSTR("RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED");
                break;
              case 17089:
                v14 = CFSTR("RAP_PERMISSION_EMAIL_SETTINGS_DENIED");
                break;
              case 17090:
                v14 = CFSTR("RAP_PERMISSION_OK");
                break;
              case 17091:
                v14 = CFSTR("SEARCH_BEGIN");
                break;
              case 17092:
                v14 = CFSTR("SEARCH_CANCEL");
                break;
              case 17093:
                v14 = CFSTR("SEARCH_SELECT");
                break;
              case 17094:
                v14 = CFSTR("TRANSIT_LINE_SELECTION_DISMISS");
                break;
              case 17095:
                v14 = CFSTR("TRANSIT_LINE_SELECTION_VIEW");
                break;
              case 17096:
                v14 = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS");
                break;
              case 17097:
                v14 = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE");
                break;
              case 17098:
                v14 = CFSTR("TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS");
                break;
              case 17099:
                v14 = CFSTR("UNKNOWN_ACTION");
                break;
              case 17100:
                v14 = CFSTR("INFO_SHARE_TWITTER");
                break;
              case 17101:
                v14 = CFSTR("INFO_TAP_POPULAR_APP_NEARBY");
                break;
              case 17102:
                v14 = CFSTR("INFO_DIRECTIONS_WALK");
                break;
              case 17103:
                v14 = CFSTR("INFO_DIRECTIONS_TRANSIT");
                break;
              case 17104:
                v14 = CFSTR("INFO_DIRECTIONS_DRIVE");
                break;
              case 17105:
                v14 = CFSTR("INFO_REPORT_A_PROBLEM");
                break;
              case 17106:
                v14 = CFSTR("CALLOUT_NAV");
                break;
              case 17107:
                v14 = CFSTR("RAP_PERMISSION_EMAIL_CANCEL");
                break;
              case 17108:
                v14 = CFSTR("MAP_TAP_POI");
                break;
              default:
                if (v13 == 16001)
                {
                  v14 = CFSTR("SEARCH_IN_MAPS");
                }
                else
                {
                  if (v13 != 90010)
                    goto LABEL_578;
                  v14 = CFSTR("PAN_RIGHT");
                }
                break;
            }
          }
        }
        else
        {
          switch(v13)
          {
            case 10101:
              v14 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT");
              break;
            case 10102:
              v14 = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE");
              break;
            case 10103:
              v14 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT");
              break;
            case 10104:
              v14 = CFSTR("RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT");
              break;
            case 10105:
              v14 = CFSTR("RAP_DIRECTIONS_ADD_INSTRUCTION_INFO");
              break;
            case 10106:
              v14 = CFSTR("RAP_DIRECTIONS_COLLAPSE_INSTRUCTION");
              break;
            case 10107:
              v14 = CFSTR("RAP_DIRECTIONS_EXPAND_INSTRUCTION");
              break;
            case 10108:
              v14 = CFSTR("RAP_DIRECTIONS_SELECT_INSTRUCTION");
              break;
            case 10109:
              v14 = CFSTR("RAP_CANCEL");
              break;
            case 10110:
              v14 = CFSTR("RAP_NEXT");
              break;
            case 10111:
              v14 = CFSTR("RAP_BACK");
              break;
            case 10112:
              v14 = CFSTR("RAP_SEND");
              break;
            case 10113:
              v14 = CFSTR("RAP_SKIP");
              break;
            case 10114:
              v14 = CFSTR("RAP_SHOW_MORE");
              break;
            case 10115:
              v14 = CFSTR("RAP_ADD_PHOTO");
              break;
            case 10116:
              v14 = CFSTR("RAP_MAP_INCORRECT");
              break;
            case 10117:
              v14 = CFSTR("RAP_BAD_DIRECTIONS");
              break;
            case 10118:
              v14 = CFSTR("RAP_TRANSIT_INFO_INCORRECT");
              break;
            case 10119:
              v14 = CFSTR("RAP_SATELLITE_IMAGE_PROBLEM");
              break;
            case 10120:
              v14 = CFSTR("RAP_SEARCH_RESULTS_INCORRECT");
              break;
            case 10121:
              v14 = CFSTR("RAP_ADD_A_PLACE");
              break;
            case 10122:
              v14 = CFSTR("RAP_HOME");
              break;
            case 10123:
              v14 = CFSTR("RAP_WORK");
              break;
            case 10124:
              v14 = CFSTR("RAP_OTHER");
              break;
            case 10125:
              v14 = CFSTR("RAP_LOCATION");
              break;
            case 10126:
              v14 = CFSTR("RAP_TRANSIT_STATION_INFO_INCORRECT");
              break;
            case 10127:
              v14 = CFSTR("RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT");
              break;
            case 10128:
              v14 = CFSTR("RAP_TRANSIT_LINE_INFO_INCORRECT");
              break;
            case 10129:
              v14 = CFSTR("RAP_TRANSIT_LINE_NAME_INCORRECT");
              break;
            case 10130:
              v14 = CFSTR("RAP_TRANSIT_LINE_SHAPE_INCORRECT");
              break;
            case 10131:
              v14 = CFSTR("RAP_TRANSIT_LINE_SCHEDULE_INCORRECT");
              break;
            case 10132:
              v14 = CFSTR("RAP_TRANSIT_DELAY");
              break;
            case 10133:
              v14 = CFSTR("RAP_LOCATION_CLOSED");
              break;
            case 10134:
              v14 = CFSTR("RAP_CLOSED_PERMANENTLY");
              break;
            case 10135:
              v14 = CFSTR("RAP_CLOSED_TEMPORARILY");
              break;
            case 10136:
              v14 = CFSTR("RAP_HOURS_HAVE_CHANGED");
              break;
            case 10137:
              v14 = CFSTR("RAP_SELECT_STATION");
              break;
            case 10138:
              v14 = CFSTR("RAP_SELECT_LINE");
              break;
            case 10139:
              v14 = CFSTR("RAP_SELECT_ACCESS_POINT");
              break;
            case 10140:
              v14 = CFSTR("RAP_SELECT_SEARCH");
              break;
            case 10141:
              v14 = CFSTR("RAP_PAN_MAP");
              break;
            case 10142:
              v14 = CFSTR("RAP_CENTER_MAP_ON_USER");
              break;
            case 10143:
              v14 = CFSTR("RAP_SEARCH_UNEXPECTED");
              break;
            case 10144:
              v14 = CFSTR("RAP_ADD_POI");
              break;
            case 10145:
              v14 = CFSTR("RAP_ADD_STREET_ADDRESS");
              break;
            case 10146:
              v14 = CFSTR("RAP_ADD_OTHER");
              break;
            case 10147:
              v14 = CFSTR("RAP_SELECT_CATEGORY");
              break;
            case 10148:
              v14 = CFSTR("RAP_TAKE_PHOTO");
              break;
            case 10149:
              v14 = CFSTR("RAP_RETAKE_PHOTO");
              break;
            case 10150:
              v14 = CFSTR("RAP_PLACE_DETAILS");
              break;
            case 10151:
              v14 = CFSTR("RAP_SATELLITE_IMAGE_OUTDATED");
              break;
            case 10152:
              v14 = CFSTR("RAP_SATELLITE_IMAGE_QUALITY");
              break;
            case 10153:
              v14 = CFSTR("RAP_SELECT_LABEL");
              break;
            case 10154:
              v14 = CFSTR("RAP_SELECT_ROUTE");
              break;
            case 10155:
              v14 = CFSTR("RAP_CLAIM_BUSINESS");
              break;
            case 10156:
              v14 = CFSTR("RAP_BRAND_DETAILS");
              break;
            case 10157:
              v14 = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY");
              break;
            case 10158:
              v14 = CFSTR("RAP_LOOK_AROUND_LABELS_STREET");
              break;
            case 10159:
              v14 = CFSTR("RAP_LOOK_AROUND_BLURRING");
              break;
            case 10160:
              v14 = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME");
              break;
            case 10161:
              v14 = CFSTR("RAP_LOOK_AROUND_LABELS_STORE");
              break;
            case 10162:
              v14 = CFSTR("RAP_LOOK_AROUND_PRIVACY");
              break;
            case 10163:
              v14 = CFSTR("RAP_INCORRECT_HOURS");
              break;
            case 10164:
              v14 = CFSTR("RAP_INCORRECT_ADDRESS");
              break;
            case 10165:
              v14 = CFSTR("RAP_EDIT_PLACE_DETAILS");
              break;
            case 10166:
              v14 = CFSTR("RAP_EDIT_PLACE_NAME");
              break;
            case 10167:
              v14 = CFSTR("RAP_EDIT_ADDRESS");
              break;
            case 10168:
              v14 = CFSTR("RAP_ADD_CATEGORY");
              break;
            case 10169:
              v14 = CFSTR("RAP_REMOVE_CATEGORY");
              break;
            case 10170:
              v14 = CFSTR("RAP_DESELECT_CATEGORY");
              break;
            case 10171:
              v14 = CFSTR("RAP_ADD_HOURS");
              break;
            case 10172:
              v14 = CFSTR("RAP_REMOVE_HOURS");
              break;
            case 10173:
              v14 = CFSTR("RAP_TAP_DAY_OF_WEEK");
              break;
            case 10174:
              v14 = CFSTR("RAP_TAP_24_HOURS_BUTTON");
              break;
            case 10175:
              v14 = CFSTR("RAP_TAP_OPEN_TIME");
              break;
            case 10176:
              v14 = CFSTR("RAP_TAP_CLOSED_TIME");
              break;
            case 10177:
              v14 = CFSTR("RAP_TAP_TEMPORARY_CLOSURE");
              break;
            case 10178:
              v14 = CFSTR("RAP_TAP_PERMANENTLY_CLOSED");
              break;
            case 10179:
              v14 = CFSTR("RAP_EDIT_WEBSITE");
              break;
            case 10180:
              v14 = CFSTR("RAP_EDIT_PHONE_NUMBER");
              break;
            case 10181:
              v14 = CFSTR("RAP_TAP_ACCEPTS_APPLE_PAY");
              break;
            case 10182:
              v14 = CFSTR("RAP_ADD_COMMENTS");
              break;
            case 10183:
              v14 = CFSTR("RAP_EDIT_LOCATION");
              break;
            case 10184:
              v14 = CFSTR("RAP_VIEW_LOCATION");
              break;
            case 10185:
              v14 = CFSTR("RAP_ZOOM_IN");
              break;
            case 10186:
              v14 = CFSTR("RAP_ZOOM_OUT");
              break;
            case 10187:
              v14 = CFSTR("RAP_VIEW_ENTRY_POINTS");
              break;
            case 10188:
              v14 = CFSTR("RAP_EDIT_EXISTING_ENTRY_POINT");
              break;
            case 10189:
              v14 = CFSTR("RAP_ADD_NEW_ENTRY_POINT");
              break;
            case 10190:
              v14 = CFSTR("RAP_REMOVE_ENTRY_POINT");
              break;
            case 10191:
              v14 = CFSTR("RAP_SELECT_ENTRY_POINT_TYPE");
              break;
            default:
              switch(v13)
              {
                case 11001:
                  v14 = CFSTR("EXIT_MAPS_LOWER_WRIST");
                  break;
                case 11002:
                  v14 = CFSTR("TASK_READY");
                  break;
                case 11003:
                  v14 = CFSTR("TAP_SEARCH");
                  break;
                case 11004:
                  v14 = CFSTR("TAP_MY_LOCATION");
                  break;
                case 11005:
                  v14 = CFSTR("SHOW_NEARBY");
                  break;
                case 11006:
                  v14 = CFSTR("TAP_NEARBY");
                  break;
                case 11007:
                  v14 = CFSTR("TAP_PROACTIVE");
                  break;
                case 11008:
                  v14 = CFSTR("FORCE_PRESS");
                  break;
                case 11009:
                  v14 = CFSTR("TAP_CONTACTS");
                  break;
                case 11010:
                  v14 = CFSTR("TAP_TRANSIT");
                  break;
                case 11011:
                  v14 = CFSTR("TAP_DICTATION");
                  break;
                case 11012:
                  v14 = CFSTR("GET_DIRECTIONS_DRIVING");
                  break;
                case 11013:
                  v14 = CFSTR("GET_DIRECTIONS_WALKING");
                  break;
                case 11014:
                  v14 = CFSTR("GET_DIRECTIONS_TRANSIT");
                  break;
                case 11015:
                  v14 = CFSTR("OPEN_STANDARD_MAP");
                  break;
                case 11016:
                  v14 = CFSTR("OPEN_TRANSIT_MAP");
                  break;
                case 11017:
                  v14 = CFSTR("START_NAV_AUTO");
                  break;
                case 11018:
                  v14 = CFSTR("TAP_RECENT");
                  break;
                case 11019:
                  v14 = CFSTR("TAP_FAVORITE");
                  break;
                case 11020:
                  v14 = CFSTR("TAP_SCRIBBLE");
                  break;
                case 11021:
                  v14 = CFSTR("TAP_VIEW_MAP");
                  break;
                case 11022:
                  v14 = CFSTR("TAP_VIEW_TBT");
                  break;
                case 11023:
                  v14 = CFSTR("VIEW_ROUTE_INFO");
                  break;
                case 11024:
                  v14 = CFSTR("NAV_UNMUTE");
                  break;
                case 11025:
                  v14 = CFSTR("NAV_MUTE");
                  break;
                case 11026:
                  v14 = CFSTR("GET_DIRECTIONS_CYCLING");
                  break;
                case 11027:
                  v14 = CFSTR("TAP_SEARCH_HOME");
                  break;
                case 11028:
                  v14 = CFSTR("ROUTE_PAUSED_ON_WATCH");
                  break;
                case 11029:
                  v14 = CFSTR("NEXT_STOP_TAPPED_ON_WATCH");
                  break;
                default:
                  switch(v13)
                  {
                    case 12001:
                      v14 = CFSTR("VIEW_MORE_OPTIONS");
                      break;
                    case 12002:
                      v14 = CFSTR("SELECT_TIME");
                      break;
                    case 12003:
                      v14 = CFSTR("SHOW_NEXT_AVAILABLE");
                      break;
                    case 12004:
                      v14 = CFSTR("DECREASE_TABLE_SIZE");
                      break;
                    case 12005:
                      v14 = CFSTR("INCREASE_TABLE_SIZE");
                      break;
                    case 12006:
                      v14 = CFSTR("EDIT_BOOKING");
                      break;
                    case 12007:
                      v14 = CFSTR("EDIT_PHONE");
                      break;
                    case 12008:
                      v14 = CFSTR("ADD_SPECIAL_REQUEST");
                      break;
                    case 12009:
                      v14 = CFSTR("CHANGE_RESERVATION");
                      break;
                    case 12010:
                      v14 = CFSTR("LEARN_MORE");
                      break;
                    default:
                      goto LABEL_578;
                  }
                  break;
              }
              break;
          }
        }
      }
      else
      {
        v14 = CFSTR("UI_ACTION_UNKNOWN");
        switch(v13)
        {
          case 0:
            break;
          case 1:
            v14 = CFSTR("PULL_UP");
            break;
          case 2:
            v14 = CFSTR("PULL_DOWN");
            break;
          case 3:
            v14 = CFSTR("TAP");
            break;
          case 4:
            v14 = CFSTR("CLOSE");
            break;
          case 5:
            v14 = CFSTR("SWIPE_PREV");
            break;
          case 6:
            v14 = CFSTR("SWIPE_NEXT");
            break;
          case 7:
            v14 = CFSTR("SCROLL_UP");
            break;
          case 8:
            v14 = CFSTR("SCROLL_DOWN");
            break;
          case 9:
          case 23:
          case 24:
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
          case 501:
          case 502:
          case 503:
          case 504:
          case 505:
          case 506:
          case 507:
          case 508:
          case 509:
          case 510:
          case 511:
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
          case 601:
          case 602:
          case 603:
          case 604:
          case 605:
          case 606:
          case 607:
          case 608:
          case 609:
          case 610:
          case 611:
          case 612:
          case 613:
          case 614:
          case 615:
          case 616:
          case 617:
          case 618:
          case 619:
          case 620:
          case 621:
          case 622:
          case 623:
          case 624:
          case 625:
          case 626:
          case 627:
          case 628:
          case 629:
          case 630:
          case 631:
          case 632:
          case 633:
          case 634:
          case 635:
          case 636:
          case 637:
          case 638:
          case 639:
          case 640:
          case 641:
          case 642:
          case 643:
          case 644:
          case 645:
          case 646:
          case 647:
          case 648:
          case 649:
          case 650:
          case 651:
          case 652:
          case 653:
          case 654:
          case 655:
          case 656:
          case 657:
          case 658:
          case 659:
          case 660:
          case 661:
          case 662:
          case 663:
          case 664:
          case 665:
          case 666:
          case 667:
          case 668:
          case 669:
          case 670:
          case 671:
          case 672:
          case 673:
          case 674:
          case 675:
          case 676:
          case 677:
          case 678:
          case 679:
          case 680:
          case 681:
          case 682:
          case 683:
          case 684:
          case 685:
          case 686:
          case 687:
          case 688:
          case 689:
          case 690:
          case 691:
          case 692:
          case 693:
          case 694:
          case 695:
          case 696:
          case 697:
          case 698:
          case 699:
          case 700:
          case 701:
          case 702:
          case 703:
          case 704:
          case 705:
          case 706:
          case 707:
          case 708:
          case 709:
          case 710:
          case 711:
          case 712:
          case 713:
          case 714:
          case 715:
          case 716:
          case 717:
          case 718:
          case 719:
          case 720:
          case 721:
          case 722:
          case 723:
          case 724:
          case 725:
          case 726:
          case 727:
          case 728:
          case 729:
          case 730:
          case 731:
          case 732:
          case 733:
          case 734:
          case 735:
          case 736:
          case 737:
          case 738:
          case 739:
          case 740:
          case 741:
          case 742:
          case 743:
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
          case 801:
          case 802:
          case 803:
          case 804:
          case 805:
          case 806:
          case 807:
          case 808:
          case 809:
          case 810:
          case 811:
          case 812:
          case 813:
          case 814:
          case 815:
          case 816:
          case 817:
          case 818:
          case 819:
          case 820:
          case 821:
          case 822:
          case 823:
          case 824:
          case 825:
          case 826:
          case 827:
          case 828:
          case 829:
          case 830:
          case 831:
          case 832:
          case 833:
          case 834:
          case 835:
          case 836:
          case 837:
          case 838:
          case 839:
          case 840:
          case 841:
          case 842:
          case 843:
          case 844:
          case 845:
          case 846:
          case 847:
          case 848:
          case 849:
          case 850:
          case 851:
          case 852:
          case 853:
          case 854:
          case 855:
          case 856:
          case 857:
          case 858:
          case 859:
          case 860:
          case 861:
          case 862:
          case 863:
          case 864:
          case 865:
          case 866:
          case 867:
          case 868:
          case 869:
          case 870:
          case 871:
          case 872:
          case 873:
          case 874:
          case 875:
          case 876:
          case 877:
          case 878:
          case 879:
          case 880:
          case 881:
          case 882:
          case 883:
          case 884:
          case 885:
          case 886:
          case 887:
          case 888:
          case 889:
          case 890:
          case 891:
          case 892:
          case 893:
          case 894:
          case 895:
          case 896:
          case 897:
          case 898:
          case 899:
          case 900:
          case 901:
          case 902:
          case 903:
          case 904:
          case 905:
          case 906:
          case 907:
          case 908:
          case 909:
          case 910:
          case 911:
          case 912:
          case 913:
          case 914:
          case 915:
          case 916:
          case 917:
          case 918:
          case 919:
          case 920:
          case 921:
          case 922:
          case 923:
          case 924:
          case 925:
          case 926:
          case 927:
          case 928:
          case 929:
          case 930:
          case 931:
          case 932:
          case 933:
          case 934:
          case 935:
          case 936:
          case 937:
          case 938:
          case 939:
          case 940:
          case 941:
          case 942:
          case 943:
          case 944:
          case 945:
          case 946:
          case 947:
          case 948:
          case 949:
          case 950:
          case 951:
          case 952:
          case 953:
          case 954:
          case 955:
          case 956:
          case 957:
          case 958:
          case 959:
          case 960:
          case 961:
          case 962:
          case 963:
          case 964:
          case 965:
          case 966:
          case 967:
          case 968:
          case 969:
          case 970:
          case 971:
          case 972:
          case 973:
          case 974:
          case 975:
          case 976:
          case 977:
          case 978:
          case 979:
          case 980:
          case 981:
          case 982:
          case 983:
          case 984:
          case 985:
          case 986:
          case 987:
          case 988:
          case 989:
          case 990:
          case 991:
          case 992:
          case 993:
          case 994:
          case 995:
          case 996:
          case 997:
          case 998:
          case 999:
          case 1000:
          case 1005:
          case 1006:
          case 1007:
          case 1008:
          case 1009:
          case 1012:
          case 1013:
          case 1014:
          case 1015:
          case 1016:
          case 1019:
          case 1021:
          case 1022:
          case 1023:
          case 1024:
          case 1025:
          case 1026:
          case 1027:
          case 1028:
          case 1029:
            goto LABEL_578;
          case 10:
            v14 = CFSTR("SHOW_MORE");
            break;
          case 11:
            v14 = CFSTR("SHOW_LESS");
            break;
          case 12:
            v14 = CFSTR("SWIPE_LEFT");
            break;
          case 13:
            v14 = CFSTR("SWIPE_RIGHT");
            break;
          case 14:
            v14 = CFSTR("MINIMIZE");
            break;
          case 15:
            v14 = CFSTR("TAP_PREV");
            break;
          case 16:
            v14 = CFSTR("TAP_NEXT");
            break;
          case 17:
            v14 = CFSTR("SUBMIT");
            break;
          case 18:
            v14 = CFSTR("CANCEL");
            break;
          case 19:
            v14 = CFSTR("ENTER_MAPS");
            break;
          case 20:
            v14 = CFSTR("EXIT_MAPS");
            break;
          case 21:
            v14 = CFSTR("REVEAL");
            break;
          case 22:
            v14 = CFSTR("OPEN_NEW_TAB");
            break;
          case 25:
            v14 = CFSTR("BACK");
            break;
          case 26:
            v14 = CFSTR("ACTIVATE");
            break;
          case 27:
            v14 = CFSTR("DEACTIVATE");
            break;
          case 28:
            v14 = CFSTR("AGREE");
            break;
          case 29:
            v14 = CFSTR("DISAGREE");
            break;
          case 30:
            v14 = CFSTR("SKIP_ANSWER");
            break;
          case 31:
            v14 = CFSTR("EXPAND");
            break;
          case 32:
            v14 = CFSTR("COLLAPSE");
            break;
          case 33:
            v14 = CFSTR("ENTER");
            break;
          case 34:
            v14 = CFSTR("EXIT");
            break;
          case 35:
            v14 = CFSTR("SCROLL_UP_INDEX_BAR");
            break;
          case 36:
            v14 = CFSTR("SCROLL_DOWN_INDEX_BAR");
            break;
          case 37:
            v14 = CFSTR("TOGGLE_ON");
            break;
          case 38:
            v14 = CFSTR("TOGGLE_OFF");
            break;
          case 39:
            v14 = CFSTR("LONG_PRESS");
            break;
          case 40:
            v14 = CFSTR("CLICK");
            break;
          case 41:
            v14 = CFSTR("TAP_DONE");
            break;
          case 42:
            v14 = CFSTR("TAP_CLOSE");
            break;
          case 43:
            v14 = CFSTR("SCROLL_LEFT");
            break;
          case 44:
            v14 = CFSTR("SCROLL_RIGHT");
            break;
          case 45:
            v14 = CFSTR("DISPLAY");
            break;
          case 46:
            v14 = CFSTR("OPEN_IN_APP");
            break;
          case 47:
            v14 = CFSTR("CONCEAL");
            break;
          case 48:
            v14 = CFSTR("TAP_DELETE");
            break;
          case 49:
            v14 = CFSTR("TAP_FILTER");
            break;
          case 50:
            v14 = CFSTR("TAP_SECONDARY_BUTTON");
            break;
          case 51:
            v14 = CFSTR("TAP_WIDGET_FOOD");
            break;
          case 52:
            v14 = CFSTR("TAP_WIDGET_GAS");
            break;
          case 53:
            v14 = CFSTR("TAP_WIDGET_LOADING");
            break;
          case 54:
            v14 = CFSTR("TAP_WIDGET_SEARCH");
            break;
          case 55:
            v14 = CFSTR("TAP_WIDGET_STORES");
            break;
          case 56:
            v14 = CFSTR("DISPLAY_ALLOW_ONCE_PROMPT");
            break;
          case 57:
            v14 = CFSTR("SHARE_CURRENT_LOCATION");
            break;
          case 58:
            v14 = CFSTR("SHARE_PHOTO");
            break;
          case 59:
            v14 = CFSTR("TAP_KEEP_OFF");
            break;
          case 60:
            v14 = CFSTR("TAP_PHOTO_CATEGORY");
            break;
          case 61:
            v14 = CFSTR("TAP_PRECISE_LOCATION_OFF_BANNER");
            break;
          case 62:
            v14 = CFSTR("TAP_TURN_ON");
            break;
          case 63:
            v14 = CFSTR("DISPLAY_CYCLING_ANNOTATION");
            break;
          case 64:
            v14 = CFSTR("DISPLAY_DRIVING_DEFAULT_OPTION");
            break;
          case 65:
            v14 = CFSTR("DISPLAY_TRANSIT_DEFAULT_OPTION");
            break;
          case 66:
            v14 = CFSTR("DISPLAY_WALKING_DEFAULT_OPTION");
            break;
          case 67:
            v14 = CFSTR("TAP_CYCLING_ANNOTATION");
            break;
          case 68:
            v14 = CFSTR("TAP_DRIVING_DEFAULT_OPTION");
            break;
          case 69:
            v14 = CFSTR("TAP_TRANSIT_DEFAULT_OPTION");
            break;
          case 70:
            v14 = CFSTR("TAP_WALKING_DEFAULT_OPTION");
            break;
          case 71:
            v14 = CFSTR("DISPLAY_RIDESHARE_DEFAULT_OPTION");
            break;
          case 72:
            v14 = CFSTR("TAP_RIDESHARE_DEFAULT_OPTION");
            break;
          case 73:
            v14 = CFSTR("TAP_PERSONAL_COLLECTION");
            break;
          case 74:
            v14 = CFSTR("RESUME_ROUTE");
            break;
          case 75:
            v14 = CFSTR("DISPLAY_OUT_OF_RANGE_ALERT");
            break;
          case 76:
            v14 = CFSTR("TAP_ALLOW_ONCE");
            break;
          case 77:
            v14 = CFSTR("TAP_DO_NOT_ALLOW");
            break;
          case 78:
            v14 = CFSTR("ADD_RECCOMENDED_FAVORITE");
            break;
          case 79:
            v14 = CFSTR("ADD_RECOMMENDED_HOME_FAVORITE");
            break;
          case 80:
            v14 = CFSTR("ADD_RECOMMENDED_SCHOOL_FAVORITE");
            break;
          case 81:
            v14 = CFSTR("ADD_RECOMMENDED_WORK_FAVORITE");
            break;
          case 82:
            v14 = CFSTR("CREATE_RECCOMENDED_SCHOOL_FAVORITE");
            break;
          case 83:
            v14 = CFSTR("CREATE_SCHOOL_FAVORITE");
            break;
          case 84:
            v14 = CFSTR("TAP_SCHOOL_FAVORITE");
            break;
          case 85:
            v14 = CFSTR("SELECT_ROUTING_TYPE_CYCLING");
            break;
          case 86:
            v14 = CFSTR("REPORT_PHOTO");
            break;
          case 87:
            v14 = CFSTR("TAP_LARGE_WIDGET_BROWSE_CATEGORY");
            break;
          case 88:
            v14 = CFSTR("TAP_MEDIUM_WIDGET_BROWSE_CATEGORY");
            break;
          case 89:
            v14 = CFSTR("TAP_SMALL_WIDGET_BROWSE_CATEGORY");
            break;
          case 90:
            v14 = CFSTR("CREATE_RECOMMENDED_FAVORITE");
            break;
          case 91:
            v14 = CFSTR("CREATE_RECOMMENDED_HOME_FAVORITE");
            break;
          case 92:
            v14 = CFSTR("CREATE_RECOMMENDED_SCHOOL_FAVORITE");
            break;
          case 93:
            v14 = CFSTR("CREATE_RECOMMENDED_WORK_FAVORITE");
            break;
          case 94:
            v14 = CFSTR("TAP_SMALL_WIDGET_ITEM");
            break;
          case 95:
            v14 = CFSTR("TAP_MEDIUM_WIDGET_ITEM");
            break;
          case 96:
            v14 = CFSTR("TAP_LARGE_WIDGET_ITEM");
            break;
          case 97:
            v14 = CFSTR("DISPLAY_ARP_TIPKIT");
            break;
          case 98:
            v14 = CFSTR("NEXT");
            break;
          case 99:
            v14 = CFSTR("TAP_RATE_AND_ADD_PHOTOS");
            break;
          case 100:
            v14 = CFSTR("TAP_TO_ADD_POSITIVE_RATING");
            break;
          case 101:
            v14 = CFSTR("TAP_TO_ADD_NEGATIVE_RATING");
            break;
          case 102:
            v14 = CFSTR("TAP_ACTIVE_SHARING_NOTIFICATION");
            break;
          case 103:
            v14 = CFSTR("INVOKE_SIRI_PROMPT");
            break;
          case 104:
            v14 = CFSTR("ETA_SHARED_SUCCESSFULLY");
            break;
          case 105:
            v14 = CFSTR("ENDED_ETA_SHARE_SUCCESSFULLY");
            break;
          case 106:
            v14 = CFSTR("CLEAR_INCIDENT");
            break;
          case 107:
            v14 = CFSTR("CONFIRM_INCIDENT");
            break;
          case 108:
            v14 = CFSTR("DISMISS_INCIDENT");
            break;
          case 109:
            v14 = CFSTR("INCIDENT_ALERT_TIMEOUT");
            break;
          case 110:
            v14 = CFSTR("INCIDENT_ALERT_TRAY_SHOWN");
            break;
          case 111:
            v14 = CFSTR("INCIDENT_CARD_SHOWN");
            break;
          case 112:
            v14 = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN");
            break;
          case 113:
            v14 = CFSTR("INCIDENT_REPORT_TRAY_SHOWN");
            break;
          case 114:
            v14 = CFSTR("NAV_TRAY_DISCOVERY_SHOWN");
            break;
          case 115:
            v14 = CFSTR("TAP_TO_REPORT_INCIDENT");
            break;
          case 116:
            v14 = CFSTR("TAP_SHORTCUT");
            break;
          case 117:
            v14 = CFSTR("BLOCK_CONTACT");
            break;
          case 118:
            v14 = CFSTR("TAP_TO_ADD_RATING");
            break;
          case 119:
            v14 = CFSTR("AR_WALKING_LOCALIZATION_FAILED");
            break;
          case 120:
            v14 = CFSTR("AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE");
            break;
          case 121:
            v14 = CFSTR("AR_WALKING_LOCALIZATION_SUCCESSFUL");
            break;
          case 122:
            v14 = CFSTR("AR_WALKING_LOCALIZATION_USER_ABANDON");
            break;
          case 123:
            v14 = CFSTR("ATTEMPT_AR_WALKING_LOCALIZATION");
            break;
          case 124:
            v14 = CFSTR("RAISE_TO_ENTER_AR_WALKING");
            break;
          case 125:
            v14 = CFSTR("TAP_DISMISS");
            break;
          case 126:
            v14 = CFSTR("TAP_ENTER_AR_WALKING");
            break;
          case 127:
            v14 = CFSTR("TAP_OK");
            break;
          case 128:
            v14 = CFSTR("TAP_TRY_AGAIN");
            break;
          case 129:
            v14 = CFSTR("TAP_TURN_ON_IN_SETTINGS");
            break;
          case 130:
            v14 = CFSTR("VLF_CORRECTION_FAILED_TO_INITIALIZE");
            break;
          case 131:
            v14 = CFSTR("VLF_CORRECTION_USER_ABANDON");
            break;
          case 132:
            v14 = CFSTR("AREA_EVENTS_ALERT");
            break;
          case 133:
            v14 = CFSTR("TAP_SHOW_EVENTS_ADVISORY_DETAILS");
            break;
          case 134:
            v14 = CFSTR("ACCEPT_EVENT_REROUTE");
            break;
          case 135:
            v14 = CFSTR("DISPLAY_AREA_EVENTS_ADVISORY");
            break;
          case 136:
            v14 = CFSTR("DISMISS_EVENT_REROUTE");
            break;
          case 137:
            v14 = CFSTR("PUNCH_OUT_EVENTS_LINK");
            break;
          case 138:
            v14 = CFSTR("SELECT_VOICE_GUIDANCE_ALERTS_ONLY");
            break;
          case 139:
            v14 = CFSTR("ADJUST_GUIDANCE_SETTINGS");
            break;
          case 140:
            v14 = CFSTR("HIDE_DETAILS");
            break;
          case 141:
            v14 = CFSTR("SELECT_VOICE_GUIDANCE_ON");
            break;
          case 142:
            v14 = CFSTR("SELECT_VOICE_GUIDANCE_OFF");
            break;
          case 143:
            v14 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE");
            break;
          case 144:
            v14 = CFSTR("TAP_TEXT_LABEL");
            break;
          case 145:
            v14 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_WALKING");
            break;
          case 146:
            v14 = CFSTR("TAP_EXIT");
            break;
          case 147:
            v14 = CFSTR("TAP_CITY_MENU");
            break;
          case 148:
            v14 = CFSTR("CHECK_AVOID_TOLLS");
            break;
          case 149:
            v14 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT");
            break;
          case 150:
            v14 = CFSTR("TAP_ICLOUD");
            break;
          case 151:
            v14 = CFSTR("CHECK_AVOID_HIGHWAYS");
            break;
          case 152:
            v14 = CFSTR("TAP_FAVORITES");
            break;
          case 153:
            v14 = CFSTR("SELECT_DISTANCE_IN_KM");
            break;
          case 154:
            v14 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE");
            break;
          case 155:
            v14 = CFSTR("OPEN_FULL_CARD_FILTER");
            break;
          case 156:
            v14 = CFSTR("SCROLL_TEMPORAL_COLLECTION_BACKWARD");
            break;
          case 157:
            v14 = CFSTR("OPEN_SINGLE_CARD_FILTER");
            break;
          case 158:
            v14 = CFSTR("SELECT_RESULT_REFINEMENT_MULTI_SELECT");
            break;
          case 159:
            v14 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE");
            break;
          case 160:
            v14 = CFSTR("SESSIONLESS_REVEAL");
            break;
          case 161:
            v14 = CFSTR("SCROLL_CITY_CURATED_COLLECTION_BACKWARD");
            break;
          case 162:
            v14 = CFSTR("SCROLL_TEMPORAL_COLLECTION_FORWARD");
            break;
          case 163:
            v14 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_CYCLING");
            break;
          case 164:
            v14 = CFSTR("ENTER_RAP_REPORT_MENU");
            break;
          case 165:
            v14 = CFSTR("SELECT_PREFERRED_TRAVEL_TYPE_DRIVING");
            break;
          case 166:
            v14 = CFSTR("TAP_MY_VEHICLES");
            break;
          case 167:
            v14 = CFSTR("SUBMIT_SINGLE_CARD_FILTER");
            break;
          case 168:
            v14 = CFSTR("SUBMIT_FULL_CARD_FILTER");
            break;
          case 169:
            v14 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE");
            break;
          case 170:
            v14 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE");
            break;
          case 171:
            v14 = CFSTR("TAP_EXPLORE_CURATED_COLELCTIONS");
            break;
          case 172:
            v14 = CFSTR("TAP_ACCOUNT");
            break;
          case 173:
            v14 = CFSTR("TAP_WORLDWIDE_CURATED_COLLECTIONS");
            break;
          case 174:
            v14 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE");
            break;
          case 175:
            v14 = CFSTR("TAP_RECENTLY_VIEWED_CURATED_COLLECTION");
            break;
          case 176:
            v14 = CFSTR("RESULT_REFINEMENT_TOGGLE_OFF");
            break;
          case 177:
            v14 = CFSTR("TAP_CITY_CURATED_COLLECTIONS");
            break;
          case 178:
            v14 = CFSTR("TAP_REPORTS");
            break;
          case 179:
            v14 = CFSTR("TAP_RATINGS");
            break;
          case 180:
            v14 = CFSTR("TAP_EXPLORE_CURATED_COLLECTIONS");
            break;
          case 181:
            v14 = CFSTR("TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION");
            break;
          case 182:
            v14 = CFSTR("RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE");
            break;
          case 183:
            v14 = CFSTR("SELECT_DISTANCE_IN_MILES");
            break;
          case 184:
            v14 = CFSTR("TAP_PRIVACY_STATEMENT");
            break;
          case 185:
            v14 = CFSTR("TAP_MAPS_SETTINGS");
            break;
          case 186:
            v14 = CFSTR("CANCEL_FULL_CARD_FILTER");
            break;
          case 187:
            v14 = CFSTR("TAP_LATEST_CURATED_COLLECTION");
            break;
          case 188:
            v14 = CFSTR("TAP_TEMPORAL_CURATED_COLLECTION");
            break;
          case 189:
            v14 = CFSTR("UNCHECK_AVOID_TOLLS");
            break;
          case 190:
            v14 = CFSTR("UNSELECT_SEARCH_REFINEMENT");
            break;
          case 191:
            v14 = CFSTR("TAP_RATING");
            break;
          case 192:
            v14 = CFSTR("TAP_ICLOUD_SIGN_IN");
            break;
          case 193:
            v14 = CFSTR("RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE");
            break;
          case 194:
            v14 = CFSTR("TAP_POI_HIGHLIGHTED_AUXILIARY");
            break;
          case 195:
            v14 = CFSTR("UNCHECK_AVOID_HIGHWAYS");
            break;
          case 196:
            v14 = CFSTR("SCROLL_CITY_CURATED_COLLECTION_FORWARD");
            break;
          case 197:
            v14 = CFSTR("RESULT_REFINEMENT_TOGGLE_ON");
            break;
          case 198:
            v14 = CFSTR("TAP_CONTEXT_LINE_HYPERLINK");
            break;
          case 199:
            v14 = CFSTR("TAP_MY_GUIDES");
            break;
          case 200:
            v14 = CFSTR("SELECT_SEARCH_REFINEMENT");
            break;
          case 201:
            v14 = CFSTR("SESSIONLESS_TAP_ACCOUNT");
            break;
          case 202:
            v14 = CFSTR("UNSELECT_RESULT_REFINEMENT_MULTI_SELECT");
            break;
          case 203:
            v14 = CFSTR("TAP_TRAVEL_PREFERENCES");
            break;
          case 204:
            v14 = CFSTR("SHOW_CURATED_COLLECTION_LIST");
            break;
          case 205:
            v14 = CFSTR("CANCEL_SINGLE_CARD_FILTER");
            break;
          case 206:
            v14 = CFSTR("DISPLAY_HFP_OPTION");
            break;
          case 207:
            v14 = CFSTR("SWITCH_OFF_HFP");
            break;
          case 208:
            v14 = CFSTR("SWITCH_ON_HFP");
            break;
          case 209:
            v14 = CFSTR("TAP_QUICK_ACTION_TRAY");
            break;
          case 210:
            v14 = CFSTR("SHOW_ALL_CITIES");
            break;
          case 211:
            v14 = CFSTR("TAP_ADD_NEARBY_TRANSIT");
            break;
          case 212:
            v14 = CFSTR("RESUME");
            break;
          case 213:
            v14 = CFSTR("DISPLAY_TIPKIT_PROMPT");
            break;
          case 214:
            v14 = CFSTR("TAP_NEARBY_TRANSIT_FAVORITE");
            break;
          case 215:
            v14 = CFSTR("TAP_DRIVING_MODE");
            break;
          case 216:
            v14 = CFSTR("SWITCH_ON_VOICE_GUIDANCE");
            break;
          case 217:
            v14 = CFSTR("DISMISS_TIPKIT_PROMPT");
            break;
          case 218:
            v14 = CFSTR("TAP_EXPAND_EXIT_DETAILS");
            break;
          case 219:
            v14 = CFSTR("TAP_NEARBY_TRANSIT_FILTER");
            break;
          case 220:
            v14 = CFSTR("TAP_MORE_DEPARTURES");
            break;
          case 221:
            v14 = CFSTR("RAP_INDIVIDUAL_PLACE");
            break;
          case 222:
            v14 = CFSTR("RAP_ADD_MAP");
            break;
          case 223:
            v14 = CFSTR("TAP_SUGGESTED_RAP");
            break;
          case 224:
            v14 = CFSTR("RAP_STREET_ISSUE");
            break;
          case 225:
            v14 = CFSTR("SWIPE_PIN_REVEAL");
            break;
          case 226:
            v14 = CFSTR("TAP_ADD_TIPKIT_FAVORITE");
            break;
          case 227:
            v14 = CFSTR("SCROLL_VEHICLE_INFORMATION_BACKWARD");
            break;
          case 228:
            v14 = CFSTR("RAP_BAD_TRIP");
            break;
          case 229:
            v14 = CFSTR("RAP_PLACE_ISSUE");
            break;
          case 230:
            v14 = CFSTR("TAP_OPEN_MAPS");
            break;
          case 231:
            v14 = CFSTR("TAP_NEARBY_TRANSIT_RESULT");
            break;
          case 232:
            v14 = CFSTR("RAP_GUIDE");
            break;
          case 233:
            v14 = CFSTR("SWITCH_OFF_VOICE_GUIDANCE");
            break;
          case 234:
            v14 = CFSTR("DISPLAY_TRIP_FEEDBACK_MESSAGE");
            break;
          case 235:
            v14 = CFSTR("SELECT_TRANSIT_STEP");
            break;
          case 236:
            v14 = CFSTR("SCROLL_VEHICLE_INFORMATION_FORWARD");
            break;
          case 237:
            v14 = CFSTR("TAP_SEE_MORE");
            break;
          case 238:
            v14 = CFSTR("RAP_IN_REVIEW");
            break;
          case 239:
            v14 = CFSTR("TAP_OPEN_MENU");
            break;
          case 240:
            v14 = CFSTR("TAP_NEARBY_TRANSIT");
            break;
          case 241:
            v14 = CFSTR("TAP_PIN_LINE");
            break;
          case 242:
            v14 = CFSTR("SWITCH_OFF_TRIP_FEEDBACK");
            break;
          case 243:
            v14 = CFSTR("RAP_GOOD_TRIP");
            break;
          case 244:
            v14 = CFSTR("TAP_FILTERED_CURATED_COLLECTION");
            break;
          case 245:
            v14 = CFSTR("SHARE_MY_LOCATION");
            break;
          case 246:
            v14 = CFSTR("ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION");
            break;
          case 247:
            v14 = CFSTR("DISPLAY_GENERIC_ADVISORY");
            break;
          case 248:
            v14 = CFSTR("ADVISORY_ALERT");
            break;
          case 249:
            v14 = CFSTR("PUNCH_OUT_LINK");
            break;
          case 250:
            v14 = CFSTR("TAP_GENERIC_ADVISORY");
            break;
          case 251:
            v14 = CFSTR("TAP_EXPLORE_MODE");
            break;
          case 252:
            v14 = CFSTR("TAP_UNPIN_LINE");
            break;
          case 253:
            v14 = CFSTR("MENU_UNPIN");
            break;
          case 254:
            v14 = CFSTR("MENU_PIN");
            break;
          case 255:
            v14 = CFSTR("SWIPE_PIN");
            break;
          case 256:
            v14 = CFSTR("SWIPE_UNPIN");
            break;
          case 257:
            v14 = CFSTR("TAP_MEDIA_APP");
            break;
          case 258:
            v14 = CFSTR("TAP_GUIDES_SUBACTION");
            break;
          case 259:
            v14 = CFSTR("TAP_MEDIA");
            break;
          case 260:
            v14 = CFSTR("PUNCH_OUT_MEDIA");
            break;
          case 261:
            v14 = CFSTR("SHOW_MEDIA_APP_MENU");
            break;
          case 262:
            v14 = CFSTR("SCROLL_RIGHT_RIBBON");
            break;
          case 263:
            v14 = CFSTR("SCROLL_LEFT_RIBBON");
            break;
          case 264:
            v14 = CFSTR("TAP_GOOD_TO_KNOW_MORE_BUTTON");
            break;
          case 265:
            v14 = CFSTR("TAP_SHOW_MORE_TEXT");
            break;
          case 266:
            v14 = CFSTR("SCROLL_LEFT_RATINGS");
            break;
          case 267:
            v14 = CFSTR("SCROLL_LEFT_TEMPLATE_PLACE");
            break;
          case 268:
            v14 = CFSTR("SCROLL_RIGHT_TEMPLATE_PLACE");
            break;
          case 269:
            v14 = CFSTR("SCROLL_RIGHT_RATINGS");
            break;
          case 270:
            v14 = CFSTR("TAP_ALLOW");
            break;
          case 271:
            v14 = CFSTR("TAP_GO_TO_SETTING");
            break;
          case 272:
            v14 = CFSTR("START_SUBMIT_REPORT");
            break;
          case 273:
            v14 = CFSTR("AUTHENTICATION_INFO_FAILURE");
            break;
          case 274:
            v14 = CFSTR("SUCCESSFULLY_SUBMIT_REPORT");
            break;
          case 275:
            v14 = CFSTR("FAILED_SUBMIT_REPORT");
            break;
          case 276:
            v14 = CFSTR("AUTHENTICATION_INFO_SUCCESS");
            break;
          case 277:
            v14 = CFSTR("EDIT_WAYPOINT");
            break;
          case 278:
            v14 = CFSTR("CLEAR_TEXT");
            break;
          case 279:
            v14 = CFSTR("REORDER_WAYPOINT");
            break;
          case 280:
            v14 = CFSTR("REMOVE_WAYPOINT");
            break;
          case 281:
            v14 = CFSTR("TAP_SECONDARY_MULTI_VENDORS_SELECTION");
            break;
          case 282:
            v14 = CFSTR("TAP_SHOWCASE_MENU");
            break;
          case 283:
            v14 = CFSTR("TAP_SHORTCUT_MULTI_VENDORS_SELECTION");
            break;
          case 284:
            v14 = CFSTR("TAP_PHOTO_ALBUM");
            break;
          case 285:
            v14 = CFSTR("RESEARVE_TABLE_MULTI_VENDORS_SELECTION");
            break;
          case 286:
            v14 = CFSTR("RAP_INLINE_ADD");
            break;
          case 287:
            v14 = CFSTR("RAP_TAP_EDIT");
            break;
          case 288:
            v14 = CFSTR("CLAIM_BUSINESS");
            break;
          case 289:
            v14 = CFSTR("RAP_EDIT_OPTIONS");
            break;
          case 290:
            v14 = CFSTR("TAP_IN_REVIEW_RAP");
            break;
          case 291:
            v14 = CFSTR("ORB_MENU_ADD_STOP");
            break;
          case 292:
            v14 = CFSTR("NEXT_STOP");
            break;
          case 293:
            v14 = CFSTR("ARRIVE_AT_WAYPOINT");
            break;
          case 294:
            v14 = CFSTR("REMOVE_STOP");
            break;
          case 295:
            v14 = CFSTR("DISPLAY_PAUSE_BUTTON");
            break;
          case 296:
            v14 = CFSTR("DISPLAY_PAUSE_NEXT_BUTTONS");
            break;
          case 297:
            v14 = CFSTR("AUTO_ADVANCE_NEXT_STOP");
            break;
          case 298:
            v14 = CFSTR("ADD_INLINE_NEGATIVE_RATING");
            break;
          case 299:
            v14 = CFSTR("ADD_INLINE_POSITIVE_RATING");
            break;
          case 300:
            v14 = CFSTR("TAP_TO_ADD_RATING_AND_PHOTO");
            break;
          case 301:
            v14 = CFSTR("SUBMIT_RATINGS_AND_PHOTOS");
            break;
          case 302:
            v14 = CFSTR("TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE");
            break;
          case 303:
            v14 = CFSTR("TAP_RECENTLY_VIEWED_ROUTE");
            break;
          case 304:
            v14 = CFSTR("SHOW_ALL_RECENTS");
            break;
          case 305:
            v14 = CFSTR("RESUME_MULTIPOINT_ROUTE");
            break;
          case 306:
            v14 = CFSTR("DISMISS_TRANSIT_TIPKIT");
            break;
          case 307:
            v14 = CFSTR("DISPLAY_TRANSIT_TIPKIT");
            break;
          case 308:
            v14 = CFSTR("TAP_TRANSIT_TIPKIT");
            break;
          case 309:
            v14 = CFSTR("FILTER_EV");
            break;
          case 310:
            v14 = CFSTR("FILTER_SURCHARGE");
            break;
          case 311:
            v14 = CFSTR("FILTER_PREFER");
            break;
          case 312:
            v14 = CFSTR("TAP_WALKING_ANNOTATION");
            break;
          case 313:
            v14 = CFSTR("FILTER_AVOID");
            break;
          case 314:
            v14 = CFSTR("FILTER_TRANSPORTATION_MODE");
            break;
          case 315:
            v14 = CFSTR("FILTER_RECOMMENDED_ROUTES");
            break;
          case 316:
            v14 = CFSTR("FILTER_IC_FARES");
            break;
          case 317:
            v14 = CFSTR("FILTER_TRANSIT_CARD_FARES");
            break;
          case 318:
            v14 = CFSTR("RESERVE_TABLE_MULTI_VENDORS_SELECTION");
            break;
          case 319:
            v14 = CFSTR("TAP_NOTIFICATION_SETTINGS");
            break;
          case 320:
            v14 = CFSTR("TAP_ENABLE_NOTIFICATION");
            break;
          case 321:
            v14 = CFSTR("ARP_SUGGESTIONS_TURN_OFF");
            break;
          case 322:
            v14 = CFSTR("ARP_SUGGESTIONS_TURN_ON");
            break;
          case 323:
            v14 = CFSTR("DISMISS_ARP_SUGGESTION");
            break;
          case 324:
            v14 = CFSTR("RATINGS_AND_PHOTOS_TURN_ON");
            break;
          case 325:
            v14 = CFSTR("SCROLL_RIGHT_SUGGESTED_PHOTOS");
            break;
          case 326:
            v14 = CFSTR("UNSELECT_SUGGESTED_PHOTOS");
            break;
          case 327:
            v14 = CFSTR("SUGGESTED_PHOTOS_SHOWN");
            break;
          case 328:
            v14 = CFSTR("DISMISS_PHOTOS_LIVE_NOTIFICATION");
            break;
          case 329:
            v14 = CFSTR("TAP_YOUR_PHOTOS_ALBUM");
            break;
          case 330:
            v14 = CFSTR("RATINGS_AND_PHOTOS_TURN_OFF");
            break;
          case 331:
            v14 = CFSTR("DELETE_PHOTO");
            break;
          case 332:
            v14 = CFSTR("DISPLAY_PHOTOS_LIVE_NOTIFICATION");
            break;
          case 333:
            v14 = CFSTR("SCROLL_LEFT_SUGGESTED_PHOTOS");
            break;
          case 334:
            v14 = CFSTR("TAP_PHOTOS_LIVE_NOTIFICATION");
            break;
          case 335:
            v14 = CFSTR("DISPLAY_YOUR_PHOTOS_ALBUM");
            break;
          case 336:
            v14 = CFSTR("SELECT_SUGGESTED_PHOTOS");
            break;
          case 337:
            v14 = CFSTR("ADD_STOP");
            break;
          case 338:
            v14 = CFSTR("SHOW_CREDIT_TURN_ON");
            break;
          case 339:
            v14 = CFSTR("DISPLAY_ARP_SUGGESTION");
            break;
          case 340:
            v14 = CFSTR("TAP_TO_ADD_PHOTO_CREDIT");
            break;
          case 341:
            v14 = CFSTR("SHOW_CREDIT_TURN_OFF");
            break;
          case 342:
            v14 = CFSTR("TAP_TO_EDIT_NICKNAME");
            break;
          case 343:
            v14 = CFSTR("SUBMIT_RATINGS");
            break;
          case 344:
            v14 = CFSTR("END_NAV_ON_WATCH");
            break;
          case 345:
            v14 = CFSTR("FILTER_EBIKE");
            break;
          case 356:
            v14 = CFSTR("ADD_STOP_SIRI");
            break;
          case 357:
            v14 = CFSTR("TAP_REVIEWED_RAP");
            break;
          case 358:
            v14 = CFSTR("TAP_OUTREACH_RAP");
            break;
          case 359:
            v14 = CFSTR("DISPLAY_SUGGESTED_ITEM");
            break;
          case 360:
            v14 = CFSTR("DISPLAY_HIKING_TIPKIT");
            break;
          case 361:
            v14 = CFSTR("DISMISS_HIKING_TIPKIT");
            break;
          case 362:
            v14 = CFSTR("TAP_HIKING_TIPKIT");
            break;
          case 363:
            v14 = CFSTR("SCROLL_LEFT_TRAILS");
            break;
          case 364:
            v14 = CFSTR("TAP_MORE_TRAILS");
            break;
          case 365:
            v14 = CFSTR("TAP_RELATED_TRAIL");
            break;
          case 366:
            v14 = CFSTR("DISPLAY_EXPIRED_SHOWCASE_ERROR");
            break;
          case 367:
            v14 = CFSTR("SCROLL_RIGHT_TRAILS");
            break;
          case 368:
            v14 = CFSTR("SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS");
            break;
          case 369:
            v14 = CFSTR("DISPLAY_DOWNLOAD_MAPS_ALERTS");
            break;
          case 370:
            v14 = CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS");
            break;
          case 371:
            v14 = CFSTR("TAP_DOWNLOAD_MAPS_TIPKIT");
            break;
          case 372:
            v14 = CFSTR("SELECT_DOWNLOAD_OFFLINE_MAPS");
            break;
          case 373:
            v14 = CFSTR("EXPIRED_MAPS_REMOVED");
            break;
          case 374:
            v14 = CFSTR("UPDATE_ALL_DOWNLOAD_MAPS");
            break;
          case 375:
            v14 = CFSTR("TAP_EXPIRED_MAPS");
            break;
          case 376:
            v14 = CFSTR("DISPLAY_COMPLETE_DOWNLOAD_MAPS");
            break;
          case 377:
            v14 = CFSTR("MOVE_DOWNLOAD_MAPS");
            break;
          case 378:
            v14 = CFSTR("SAVE_RENAME_DOWNLOAD_MAPS");
            break;
          case 379:
            v14 = CFSTR("TAP_COMPLETE_DOWNLOAD_MAPS");
            break;
          case 380:
            v14 = CFSTR("TAP_ENTER_OFFLINE_MAPS");
            break;
          case 381:
            v14 = CFSTR("TAP_DOWNLOAD_MAPS");
            break;
          case 382:
            v14 = CFSTR("TAP_DOWNLOAD_MAPS_CONTINUE");
            break;
          case 383:
            v14 = CFSTR("DELETE_DOWNLOAD_MAPS");
            break;
          case 384:
            v14 = CFSTR("SLIDE_CLEAR_EXPIRED_MAPS");
            break;
          case 385:
            v14 = CFSTR("RENAME_DOWNLOAD_MAPS");
            break;
          case 386:
            v14 = CFSTR("RESIZE_DOWNLOAD_MAPS");
            break;
          case 387:
            v14 = CFSTR("DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS");
            break;
          case 388:
            v14 = CFSTR("RESTORE_EXPIRED_MAPS");
            break;
          case 389:
            v14 = CFSTR("CLEAR_EXPIRED_MAPS");
            break;
          case 390:
            v14 = CFSTR("TAP_USING_OFFLINE_BAR");
            break;
          case 391:
            v14 = CFSTR("UPDATE_DOWNLOAD_MAPS");
            break;
          case 392:
            v14 = CFSTR("DISPLAY_DOWNLOAD_MAPS_TIPKIT");
            break;
          case 393:
            v14 = CFSTR("DISPLAY_DOWNLOAD_MAPS");
            break;
          case 394:
            v14 = CFSTR("TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION");
            break;
          case 395:
            v14 = CFSTR("DISPLAY_EXPIRED_MAPS");
            break;
          case 396:
            v14 = CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS");
            break;
          case 397:
            v14 = CFSTR("DISPLAY_SUGGESTED_DOWNLOAD_MAPS");
            break;
          case 398:
            v14 = CFSTR("SLIDE_RESTORE_EXPIRED_MAPS");
            break;
          case 399:
            v14 = CFSTR("ETA_SHARE_TRAY_TIMEOUT");
            break;
          case 400:
            v14 = CFSTR("START_ETA_SHARING");
            break;
          case 401:
            v14 = CFSTR("PERSON_LOCATION_UPDATE");
            break;
          case 402:
            v14 = CFSTR("STOP_ETA_SHARING");
            break;
          case 403:
            v14 = CFSTR("PUNCH_OUT_TO_FINDMY");
            break;
          case 404:
            v14 = CFSTR("TAP_PEOPLE_LOCATION");
            break;
          case 405:
            v14 = CFSTR("TAP_TO_REQUEST_LOCATION");
            break;
          case 406:
            v14 = CFSTR("ZOOM_OUT_CROWN");
            break;
          case 407:
            v14 = CFSTR("TAP_RESIZE_DOWNLOAD_MAPS");
            break;
          case 408:
            v14 = CFSTR("TAP_DELETE_DOWNLOAD_MAPS");
            break;
          case 409:
            v14 = CFSTR("SELECT_LIST_VIEW");
            break;
          case 410:
            v14 = CFSTR("SCROLL_RIGHT_TRAILHEADS");
            break;
          case 411:
            v14 = CFSTR("SWITCH_TO_ONLINE_MODE");
            break;
          case 412:
            v14 = CFSTR("TAP_RELATED_TRAILHEAD");
            break;
          case 413:
            v14 = CFSTR("SELECT_ELEVATION_VIEW");
            break;
          case 414:
            v14 = CFSTR("TOGGLE_PROXIMITY_RADIUS_ON");
            break;
          case 415:
            v14 = CFSTR("SEE_MORE_RECENTS");
            break;
          case 416:
            v14 = CFSTR("SEE_MORE_GUIDES");
            break;
          case 417:
            v14 = CFSTR("SELECT_CONTROLS");
            break;
          case 418:
            v14 = CFSTR("NO_SEARCH_RESULTS");
            break;
          case 419:
            v14 = CFSTR("TAP_VIEW_RESULTS_CAROUSEL");
            break;
          case 420:
            v14 = CFSTR("TAP_VIEW_RESULTS_LIST");
            break;
          case 421:
            v14 = CFSTR("SELECT_MAP_VIEW");
            break;
          case 422:
            v14 = CFSTR("SCROLL_LEFT_TRAILHEADS");
            break;
          case 423:
            v14 = CFSTR("SWITCH_TO_OFFLINE_MODE");
            break;
          case 424:
            v14 = CFSTR("ZOOM_IN_CROWN");
            break;
          case 425:
            v14 = CFSTR("TOGGLE_PROXIMITY_RADIUS_OFF");
            break;
          case 426:
            v14 = CFSTR("TAP_MAP");
            break;
          case 427:
            v14 = CFSTR("SWIPE_DOWN");
            break;
          case 428:
            v14 = CFSTR("TAP_MORE_TRAILHEADS");
            break;
          case 429:
            v14 = CFSTR("TAP_ROUTE_OPTIONS");
            break;
          case 430:
            v14 = CFSTR("TAP_ROUTE_NAV_MAP");
            break;
          case 431:
            v14 = CFSTR("TAP_ROUTE_OVERVIEW_MAP");
            break;
          case 432:
            v14 = CFSTR("TAP_AUDIO");
            break;
          case 433:
            v14 = CFSTR("TAP_OPEN_PLACECARD");
            break;
          case 434:
            v14 = CFSTR("TAP_VIEW_STOPS");
            break;
          case 435:
            v14 = CFSTR("TAP_ROUTE_DETAILS");
            break;
          case 436:
            v14 = CFSTR("ADD_LPR_VEHICLE");
            break;
          case 437:
            v14 = CFSTR("TAP_ADD_VEHICLE");
            break;
          case 438:
            v14 = CFSTR("TAP_PLUG_TYPE");
            break;
          case 439:
            v14 = CFSTR("UNSELECT_SUGGESTED_NETWORK");
            break;
          case 440:
            v14 = CFSTR("TAP_SET_UP_LATER");
            break;
          case 441:
            v14 = CFSTR("ADD_EV_VEHICLE");
            break;
          case 442:
            v14 = CFSTR("UPDATE_COLOR");
            break;
          case 443:
            v14 = CFSTR("SELECT_OTHER_NETWORK");
            break;
          case 444:
            v14 = CFSTR("UNSELECT_NETWORK");
            break;
          case 445:
            v14 = CFSTR("TAP_BACK");
            break;
          case 446:
            v14 = CFSTR("TAP_CANCEL");
            break;
          case 447:
            v14 = CFSTR("UNSELECT_VEHICLE");
            break;
          case 448:
            v14 = CFSTR("UNSELECT_OTHER_NETWORK");
            break;
          case 449:
            v14 = CFSTR("DISPLAY_EV_TIPKIT");
            break;
          case 450:
            v14 = CFSTR("SELECT_NETWORK");
            break;
          case 451:
            v14 = CFSTR("TAP_EV_TIPKIT");
            break;
          case 452:
            v14 = CFSTR("TAP_CHOOSE_NETWORKS");
            break;
          case 453:
            v14 = CFSTR("TAP_ADD_NETWORK");
            break;
          case 454:
            v14 = CFSTR("FILTER_NETWORK");
            break;
          case 455:
            v14 = CFSTR("SELECT_SUGGESTED_NETWORK");
            break;
          case 456:
            v14 = CFSTR("TRANSIT_TO_WALKING");
            break;
          case 457:
            v14 = CFSTR("TRANSIT_TO_FINDMY");
            break;
          case 458:
            v14 = CFSTR("TAP_AC_KEYBOARD");
            break;
          case 459:
            v14 = CFSTR("REACH_PHOTO_STRIP_END");
            break;
          case 460:
            v14 = CFSTR("SEARCH_HERE_REVEAL");
            break;
          case 461:
            v14 = CFSTR("TAP_SEARCH_HERE");
            break;
          case 462:
            v14 = CFSTR("TAP_RECENTLY_VIEWED_CURATED_HIKE");
            break;
          case 463:
            v14 = CFSTR("SAVE");
            break;
          case 464:
            v14 = CFSTR("TAP_MORE_CURATED_HIKES");
            break;
          case 465:
            v14 = CFSTR("CREATE_CUSTOM_ROUTE");
            break;
          case 466:
            v14 = CFSTR("TAP_TRY_NOW");
            break;
          case 467:
            v14 = CFSTR("TAP_CURATED_HIKE");
            break;
          case 468:
            v14 = CFSTR("TAP_RECENTLY_VIEWED_CUSTOM_ROUTE");
            break;
          case 469:
            v14 = CFSTR("ADD_TO_LIBRARY");
            break;
          case 470:
            v14 = CFSTR("START_HIKING");
            break;
          case 471:
            v14 = CFSTR("EDIT_NOTE");
            break;
          case 472:
            v14 = CFSTR("CREATE_NOTE");
            break;
          case 473:
            v14 = CFSTR("DELETE_PIN");
            break;
          case 474:
            v14 = CFSTR("ADD_ROUTE");
            break;
          case 475:
            v14 = CFSTR("ADD_PIN");
            break;
          case 476:
            v14 = CFSTR("REMOVE_FROM_COLLECTION");
            break;
          case 477:
            v14 = CFSTR("REMOVE_FROM_LIBRARY");
            break;
          case 478:
            v14 = CFSTR("TAP_ITEM");
            break;
          case 479:
            v14 = CFSTR("DELETE_ROUTE");
            break;
          case 480:
            v14 = CFSTR("TAP_ROUTE");
            break;
          case 481:
            v14 = CFSTR("TAP_DOWNLOAD_WATCH_MAPS");
            break;
          case 482:
            v14 = CFSTR("DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT");
            break;
          case 483:
            v14 = CFSTR("STOP_DOWNLOAD_ONTO_WATCH");
            break;
          case 484:
            v14 = CFSTR("TAP_DOWNLOAD_ONTO_WATCH");
            break;
          case 485:
            v14 = CFSTR("TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT");
            break;
          case 486:
            v14 = CFSTR("TAP_DOWNLOAD_NOW_WATCH");
            break;
          case 1001:
            v14 = CFSTR("PAN");
            break;
          case 1002:
            v14 = CFSTR("ZOOM_IN");
            break;
          case 1003:
            v14 = CFSTR("ZOOM_OUT");
            break;
          case 1004:
            v14 = CFSTR("ROTATE");
            break;
          case 1010:
            v14 = CFSTR("TAP_POI");
            break;
          case 1011:
            v14 = CFSTR("TAP_POI_TRANSIT");
            break;
          case 1017:
            v14 = CFSTR("TAP_POI_HIGHLIGHTED");
            break;
          case 1018:
            v14 = CFSTR("TAP_POI_CLUSTERED");
            break;
          case 1020:
            v14 = CFSTR("TAP_POI_DROPPED_PIN");
            break;
          case 1030:
            v14 = CFSTR("DROP_PIN");
            break;
          case 1031:
            v14 = CFSTR("TAP_INCIDENT");
            break;
          case 1032:
            v14 = CFSTR("TAP_TRANSIT_LINE");
            break;
          case 1033:
            v14 = CFSTR("TAP_POI_CALENDAR");
            break;
          case 1034:
            v14 = CFSTR("TAP_POI_CURRENT_LOCATION");
            break;
          case 1035:
            v14 = CFSTR("TAP_POI_TRANSIT_LINE");
            break;
          case 1036:
            v14 = CFSTR("TAP_POI_LANDMARK");
            break;
          case 1037:
            v14 = CFSTR("TAP_POI_FLYOVER");
            break;
          case 1038:
            v14 = CFSTR("TAP_TO_HIDE_TRAY");
            break;
          case 1039:
            v14 = CFSTR("TAP_TO_REVEAL_TRAY");
            break;
          case 1040:
            v14 = CFSTR("TAP_COMPASS");
            break;
          case 1041:
            v14 = CFSTR("PITCH_AWAY_FROM_GROUND");
            break;
          case 1042:
            v14 = CFSTR("PITCH_CLOSER_TO_GROUND");
            break;
          case 1043:
            v14 = CFSTR("ZOOM_IN_PINCH");
            break;
          case 1044:
            v14 = CFSTR("ZOOM_OUT_PINCH");
            break;
          case 1045:
            v14 = CFSTR("ZOOM_IN_DOUBLE_TAP");
            break;
          case 1046:
            v14 = CFSTR("ZOOM_OUT_TWO_FINGER_TAP");
            break;
          case 1047:
            v14 = CFSTR("ZOOM_IN_ONE_FINGER");
            break;
          case 1048:
            v14 = CFSTR("ZOOM_OUT_ONE_FINGER");
            break;
          case 1049:
            v14 = CFSTR("ZOOM_IN_BUTTON");
            break;
          case 1050:
            v14 = CFSTR("ZOOM_OUT_BUTTON");
            break;
          case 1051:
            v14 = CFSTR("TAP_TRAFFIC_CAMERA");
            break;
          case 1052:
            v14 = CFSTR("DISPLAY_INDOOR_MAP_BUTTON");
            break;
          case 1053:
            v14 = CFSTR("OPEN_INDOOR_MAP");
            break;
          case 1054:
            v14 = CFSTR("DISPLAY_VENUE_BROWSE_BUTTON");
            break;
          case 1055:
            v14 = CFSTR("TAP_VENUE_BROWSE_BUTTON");
            break;
          case 1056:
            v14 = CFSTR("ENTER_VENUE_EXPERIENCE");
            break;
          case 1057:
            v14 = CFSTR("EXIT_VENUE_EXPERIENCE");
            break;
          case 1058:
            v14 = CFSTR("ZOOM_IN_SCENE_PINCH");
            break;
          case 1059:
            v14 = CFSTR("ZOOM_OUT_SCENE_PINCH");
            break;
          case 1060:
            v14 = CFSTR("ZOOM_RESET");
            break;
          case 1061:
            v14 = CFSTR("TAP_SCENE_UNAVAILABLE_AREA");
            break;
          case 1062:
            v14 = CFSTR("TAP_TRANSIT_ACCESS_POINT");
            break;
          case 1063:
            v14 = CFSTR("TAP_SPEED_CAMERA");
            break;
          case 1064:
            v14 = CFSTR("TAP_RED_LIGHT_CAMERA");
            break;
          case 1065:
            v14 = CFSTR("TAP_GEO");
            break;
          default:
            switch(v13)
            {
              case 2001:
                v14 = CFSTR("TAP_SEARCH_FIELD");
                break;
              case 2002:
                v14 = CFSTR("CLEAR_SEARCH");
                break;
              case 2003:
                v14 = CFSTR("CANCEL_SEARCH");
                break;
              case 2004:
                v14 = CFSTR("TAP_BROWSE_TOP_CATEGORY");
                break;
              case 2005:
                v14 = CFSTR("TAP_BROWSE_SUB_CATEGORY");
                break;
              case 2006:
                v14 = CFSTR("TAP_BACK_TO_BROWSE_TOP_CATEGORY");
                break;
              case 2007:
                v14 = CFSTR("TAP_LIST_ITEM");
                break;
              case 2008:
                v14 = CFSTR("SHARE_LIST_ITEM");
                break;
              case 2009:
                v14 = CFSTR("DELETE_LIST_ITEM");
                break;
              case 2010:
                v14 = CFSTR("EDIT_LIST_ITEM");
                break;
              case 2011:
                v14 = CFSTR("REFRESH_SEARCH");
                break;
              case 2012:
                v14 = CFSTR("REVEAL_LIST_ITEM_ACTIONS");
                break;
              case 2013:
                v14 = CFSTR("HIDE_LIST_ITEM_ACTIONS");
                break;
              case 2014:
                v14 = CFSTR("TAP_SEARCH_BUTTON");
                break;
              case 2015:
                v14 = CFSTR("SHOW_SEARCH_RESULTS");
                break;
              case 2016:
                v14 = CFSTR("SHOW_REFRESH_SEARCH");
                break;
              case 2017:
                v14 = CFSTR("PASTE_TEXT");
                break;
              case 2018:
                v14 = CFSTR("TAP_LIST_SUB_ITEM");
                break;
              case 2019:
                v14 = CFSTR("DISPLAY_DID_YOU_MEAN_MESSAGE");
                break;
              case 2020:
                v14 = CFSTR("TAP_DID_YOU_MEAN_MESSAGE");
                break;
              case 2021:
                v14 = CFSTR("CLOSE_DID_YOU_MEAN_MESSAGE");
                break;
              case 2022:
                v14 = CFSTR("SCROLL_LEFT_DID_YOU_MEAN_MESSAGE");
                break;
              case 2023:
                v14 = CFSTR("SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE");
                break;
              case 2024:
                v14 = CFSTR("RETAINED_QUERY");
                break;
              case 2025:
                v14 = CFSTR("TAP_RECENT_AC_SUGGESTION");
                break;
              case 2026:
                v14 = CFSTR("CLEAR_RECENT_AC_SUGGESTION");
                break;
              case 2027:
                v14 = CFSTR("DELETE_RECENT_AC_SUGGESTION");
                break;
              case 2028:
              case 2029:
                goto LABEL_578;
              case 2030:
                v14 = CFSTR("TAP_BROWSE_NEARBY_CATEGORY");
                break;
              case 2031:
                v14 = CFSTR("TAP_SUBACTION");
                break;
              case 2032:
                v14 = CFSTR("TAP_QUERY_BUILDING_ARROW");
                break;
              case 2033:
                v14 = CFSTR("CLICK_ON_EDIT_SEARCH");
                break;
              case 2034:
                v14 = CFSTR("REMOVE_CLIENT_AC_SUGGESTION");
                break;
              case 2035:
                v14 = CFSTR("SHARE_CLIENT_AC_SUGGESTION");
                break;
              case 2036:
                v14 = CFSTR("TAP_ON_MORE_RESULTS");
                break;
              case 2037:
                v14 = CFSTR("SHARE_ITEM");
                break;
              case 2038:
                v14 = CFSTR("HIDE_ITEM");
                break;
              case 2039:
                v14 = CFSTR("TAP_SUGGESTED_ITEM");
                break;
              case 2040:
                v14 = CFSTR("SHARE_SUGGESTED_ITEM");
                break;
              case 2041:
                v14 = CFSTR("HIDE_SUGGESTED_ITEM");
                break;
              case 2042:
                v14 = CFSTR("ADD_HOME_FAVORITE");
                break;
              case 2043:
                v14 = CFSTR("ADD_WORK_FAVORITE");
                break;
              case 2044:
                v14 = CFSTR("ADD_FAVORITE");
                break;
              case 2045:
                v14 = CFSTR("VIEW_FAVORITES_LIST");
                break;
              case 2046:
                v14 = CFSTR("TAP_HOME_FAVORITE");
                break;
              case 2047:
                v14 = CFSTR("TAP_WORK_FAVORITE");
                break;
              case 2048:
                v14 = CFSTR("TAP_CAR_FAVORITE");
                break;
              case 2049:
                v14 = CFSTR("TAP_FAVORITE_ITEM");
                break;
              case 2050:
                v14 = CFSTR("CREATE_HOME_FAVORITE");
                break;
              case 2051:
                v14 = CFSTR("CREATE_WORK_FAVORITE");
                break;
              case 2052:
                v14 = CFSTR("CREATE_FAVORITE");
                break;
              case 2053:
                v14 = CFSTR("SUBMIT_FAVORITE_EDIT");
                break;
              case 2054:
                v14 = CFSTR("ADD_RECOMMENDED_FAVORITE");
                break;
              case 2055:
                v14 = CFSTR("EDIT_FAVORITE");
                break;
              case 2056:
                v14 = CFSTR("REMOVE_FAVORITE");
                break;
              case 2057:
                v14 = CFSTR("SHARE_FAVORITE");
                break;
              case 2058:
                v14 = CFSTR("EDIT_FAVORITES");
                break;
              case 2059:
                v14 = CFSTR("ADD_FAVORITE_PLACE");
                break;
              case 2060:
                v14 = CFSTR("REMOVE_FAVORITE_PLACE");
                break;
              case 2061:
                v14 = CFSTR("CHANGE_HOME_ADDRESS");
                break;
              case 2062:
                v14 = CFSTR("CHANGE_WORK_ADDRESS");
                break;
              case 2063:
                v14 = CFSTR("REFINE_LOCATION");
                break;
              case 2064:
                v14 = CFSTR("TAP_RECENTLY_VIEWED_ITEM");
                break;
              case 2065:
                v14 = CFSTR("SHOW_COLLECTION_LIST");
                break;
              case 2066:
                v14 = CFSTR("SHOW_FAVORITES_COLLECTION");
                break;
              case 2067:
                v14 = CFSTR("SHOW_COLLECTION");
                break;
              case 2068:
                v14 = CFSTR("TAP_COLLECTION_ITEM");
                break;
              case 2069:
                v14 = CFSTR("SHARE_COLLECTION_ITEM");
                break;
              case 2070:
                v14 = CFSTR("REMOVE_COLLECTION_ITEM");
                break;
              case 2071:
                v14 = CFSTR("SAVE_SHARED_COLLECTION");
                break;
              case 2072:
                v14 = CFSTR("CREATE_NEW_COLLECTION");
                break;
              case 2073:
                v14 = CFSTR("SAVE_TO_COLLECTION");
                break;
              case 2074:
                v14 = CFSTR("EDIT_PHOTO");
                break;
              case 2075:
                v14 = CFSTR("SORT_BY_NAME");
                break;
              case 2076:
                v14 = CFSTR("SORT_BY_DISTANCE");
                break;
              case 2077:
                v14 = CFSTR("SORT_BY_RECENT");
                break;
              case 2078:
                v14 = CFSTR("AUTO_SHARE_ETA");
                break;
              case 2079:
                v14 = CFSTR("CANCEL_AUTO_SHARE_ETA");
                break;
              case 2080:
                v14 = CFSTR("MAP_SEARCH");
                break;
              case 2081:
                v14 = CFSTR("DELETE_COLLECTION");
                break;
              case 2082:
                v14 = CFSTR("SHARE_COLLECTION");
                break;
              case 2083:
                v14 = CFSTR("SHOW_TRANSIT_LINES_COLLECTION");
                break;
              case 2084:
                v14 = CFSTR("SHOW_MY_PLACES");
                break;
              case 2085:
                v14 = CFSTR("SHOW_ALL_PLACES");
                break;
              case 2086:
                v14 = CFSTR("TAP_RECENT_QUERY");
                break;
              case 2087:
                v14 = CFSTR("TAP_QUERY_SUGGESTION");
                break;
              case 2088:
                v14 = CFSTR("DELETE_CURATED_COLLECTION");
                break;
              case 2089:
                v14 = CFSTR("FOLLOW");
                break;
              case 2090:
                v14 = CFSTR("PUNCH_IN");
                break;
              case 2091:
                v14 = CFSTR("SAVE_CURATED_COLLECTION");
                break;
              case 2092:
                v14 = CFSTR("SCROLL_LEFT_COLLECTIONS");
                break;
              case 2093:
                v14 = CFSTR("SCROLL_RIGHT_COLLECTIONS");
                break;
              case 2094:
                v14 = CFSTR("SEE_ALL_CURATED_COLLECTION");
                break;
              case 2095:
                v14 = CFSTR("SEE_ALL_PUBLISHERS");
                break;
              case 2096:
                v14 = CFSTR("SHARE_CURATED_COLLECTION");
                break;
              case 2097:
                v14 = CFSTR("SHARE_PUBLISHER");
                break;
              case 2098:
                v14 = CFSTR("SHOW_MORE_COLLECTION");
                break;
              case 2099:
                v14 = CFSTR("TAP_CURATED_COLLECTION");
                break;
              case 2100:
                v14 = CFSTR("TAP_FEATURED_COLLECTIONS");
                break;
              case 2101:
                v14 = CFSTR("TAP_LOCATION");
                break;
              case 2102:
                v14 = CFSTR("TAP_PUBLISHER");
                break;
              case 2103:
                v14 = CFSTR("TAP_PUBLISHER_APP");
                break;
              case 2104:
                v14 = CFSTR("TAP_PUBLISHER_COLLECTIONS");
                break;
              case 2105:
                v14 = CFSTR("UNFOLLOW");
                break;
              case 2106:
                v14 = CFSTR("CHANGE_SCHOOL_ADDRESS");
                break;
              case 2107:
                v14 = CFSTR("ADD_VEHICLE");
                break;
              case 2108:
                v14 = CFSTR("DISPLAY_VIRTUAL_GARAGE");
                break;
              case 2109:
                v14 = CFSTR("ENTER_VIRTUAL_GARAGE");
                break;
              case 2110:
                v14 = CFSTR("PUNCH_OUT_MANUFACTURER_APP");
                break;
              case 2111:
                v14 = CFSTR("REMOVE_LICENSE_PLATE");
                break;
              case 2112:
                v14 = CFSTR("REMOVE_VEHICLE");
                break;
              case 2113:
                v14 = CFSTR("SELECT_VEHICLE");
                break;
              case 2114:
                v14 = CFSTR("SUBMIT_LICENSE_PLATE");
                break;
              case 2115:
                v14 = CFSTR("TAP_ADD_LICENSE_PLATE");
                break;
              case 2116:
                v14 = CFSTR("TAP_ADD_NEW_CAR");
                break;
              case 2117:
                v14 = CFSTR("TAP_BANNER");
                break;
              case 2118:
                v14 = CFSTR("TAP_CONNECT");
                break;
              case 2119:
                v14 = CFSTR("TAP_CONTINUE");
                break;
              case 2120:
                v14 = CFSTR("TAP_EDIT");
                break;
              case 2121:
                v14 = CFSTR("TAP_NAME");
                break;
              case 2122:
                v14 = CFSTR("TAP_NOT_NOW");
                break;
              case 2123:
                v14 = CFSTR("TAP_OTHER_VEHICLE");
                break;
              case 2124:
                v14 = CFSTR("TAP_REMOVE_LICENSE_PLATE");
                break;
              case 2125:
                v14 = CFSTR("TAP_UPDATE_PLATE_NUMBER");
                break;
              case 2126:
                v14 = CFSTR("TAP_VEHICLE");
                break;
              case 2127:
                v14 = CFSTR("TAP_VEHICLE_NAME");
                break;
              case 2128:
                v14 = CFSTR("UPDATE_NAME");
                break;
              case 2129:
                v14 = CFSTR("DONE_TAKING_PHOTO");
                break;
              case 2130:
                v14 = CFSTR("ENABLE_SHOW_PHOTO_NAME");
                break;
              case 2131:
                v14 = CFSTR("SUBMIT_PHOTO");
                break;
              case 2132:
                v14 = CFSTR("USE_PHOTO");
                break;
              case 2133:
                v14 = CFSTR("ADD_RECOMMENDATION_TO_MAPS");
                break;
              case 2134:
                v14 = CFSTR("CANCEL_PHOTO_SUBMISSION");
                break;
              case 2135:
                v14 = CFSTR("CLOSE_RECOMMENDATION_CARD");
                break;
              case 2136:
                v14 = CFSTR("EDIT_RATING");
                break;
              case 2137:
                v14 = CFSTR("PROMPTED_TO_ADD_PHOTO");
                break;
              case 2138:
                v14 = CFSTR("PROMPTED_TO_ADD_RATING");
                break;
              case 2139:
                v14 = CFSTR("PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION");
                break;
              case 2140:
                v14 = CFSTR("PROMPTED_TO_ADD_RECOMMENDATION_SIRI");
                break;
              case 2141:
                v14 = CFSTR("RETAKE_PHOTO");
                break;
              case 2142:
                v14 = CFSTR("REVEAL_RECOMMENDATION_CARD");
                break;
              case 2143:
                v14 = CFSTR("SUBMIT_NEGATIVE_RATING");
                break;
              case 2144:
                v14 = CFSTR("SUBMIT_POSITIVE_RATING");
                break;
              case 2145:
                v14 = CFSTR("TAP_CHOOSING_PHOTO");
                break;
              case 2146:
                v14 = CFSTR("TAP_TAKE_NEW_PHOTO");
                break;
              case 2147:
                v14 = CFSTR("TAP_TO_ADD_PHOTO");
                break;
              case 2148:
                v14 = CFSTR("CANCEL_INCIDENT_REPORT");
                break;
              case 2149:
                v14 = CFSTR("INCIDENT_REPORT_SUBMITTED");
                break;
              case 2150:
                v14 = CFSTR("REPORTED_INCIDENT_NOT_RECEIVED");
                break;
              case 2151:
                v14 = CFSTR("REPORTED_INCIDENT_RECEIVED");
                break;
              case 2152:
                v14 = CFSTR("REPORT_INCIDENT");
                break;
              case 2153:
                v14 = CFSTR("SELECT_INCIDENT_TYPE");
                break;
              case 2154:
                v14 = CFSTR("SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT");
                break;
              case 2155:
                v14 = CFSTR("TAP_TO_START_REPORT_INCIDENT");
                break;
              case 2156:
                v14 = CFSTR("ACTIVELY_DISPLAY_VLF_ENTRY_POINT");
                break;
              case 2157:
                v14 = CFSTR("ATTEMPT_VLF_CORRECTION");
                break;
              case 2158:
                v14 = CFSTR("DISMISS_VLF_PROMPT");
                break;
              case 2159:
                v14 = CFSTR("PASSIVELY_DISPLAY_VLF_ENTRY_POINT");
                break;
              case 2160:
                v14 = CFSTR("VLF_CORRECTION_FAILED");
                break;
              case 2161:
                v14 = CFSTR("VLF_CORRECTION_SUCCESSFUL");
                break;
              case 2162:
                v14 = CFSTR("ENABLE_WIDGET_SUGGESTIONS");
                break;
              case 2163:
                v14 = CFSTR("DISPLAY_CZ_ADVISORY");
                break;
              case 2164:
                v14 = CFSTR("PUNCH_OUT_URL_PAY");
                break;
              case 2165:
                v14 = CFSTR("TAP_SHOW_CZ_ADVISORY_DETAILS");
                break;
              case 2166:
                v14 = CFSTR("DELETE_ITEM");
                break;
              case 2167:
                v14 = CFSTR("CANCEL_REMOVE");
                break;
              case 2168:
                v14 = CFSTR("DELETE_SUGGESTION");
                break;
              case 2169:
                v14 = CFSTR("ADD_SCHOOL_FAVORITE");
                break;
              case 2170:
                v14 = CFSTR("GO_TO_WEBSITE");
                break;
              case 2171:
                v14 = CFSTR("TRY_AGAIN");
                break;
              case 2172:
                v14 = CFSTR("CHECK_AUTO_RECORD_WORKOUT");
                break;
              case 2173:
                v14 = CFSTR("CHECK_EBIKE");
                break;
              case 2174:
                v14 = CFSTR("DISPLAY_AUTOMATIC_WORKOUT_OPTION");
                break;
              case 2175:
                v14 = CFSTR("DISPLAY_CYCLING_DEFAULT_OPTION");
                break;
              case 2176:
                v14 = CFSTR("DISPLAY_CYCLING_NO_BIKE_ADVISORY");
                break;
              case 2177:
                v14 = CFSTR("DISPLAY_CYCLING_STAIRS_ADVISORY");
                break;
              case 2178:
                v14 = CFSTR("DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY");
                break;
              case 2179:
                v14 = CFSTR("TAP_AUTOMATIC_WORKOUT_OPTION");
                break;
              case 2180:
                v14 = CFSTR("TAP_CYCLING_DEFAULT_OPTION");
                break;
              case 2181:
                v14 = CFSTR("TAP_CYCLING_NO_BIKE_ADVISORY");
                break;
              case 2182:
                v14 = CFSTR("TAP_CYCLING_STAIRS_ADVISORY");
                break;
              case 2183:
                v14 = CFSTR("TAP_CYCLING_STEEP_CLIMB_ADVISORY");
                break;
              case 2184:
                v14 = CFSTR("UNCHECK_AUTO_RECORD_WORKOUT");
                break;
              case 2185:
                v14 = CFSTR("UNCHECK_EBIKE");
                break;
              case 2186:
                v14 = CFSTR("DISPLAY_LICENSE_PLATE_SUGGESTION");
                break;
              case 2187:
                v14 = CFSTR("DISPLAY_LPR_ADVISORY");
                break;
              case 2188:
                v14 = CFSTR("TAP_SHOW_LPR_ADVISORY_DETAILS");
                break;
              case 2189:
                v14 = CFSTR("CREATE_WIDGET");
                break;
              case 2190:
                v14 = CFSTR("REVEAL_WIDGET_TRAY");
                break;
              case 2191:
                v14 = CFSTR("LPR_ERROR_CODE");
                break;
              case 2192:
                v14 = CFSTR("TAP_SEE_ALL_RECENTLY_VIEWED");
                break;
              case 2193:
                v14 = CFSTR("TAP_CLEAR_RECENTLY_VIEWED");
                break;
              case 2194:
                v14 = CFSTR("LPR_HARD_STOP");
                break;
              case 2195:
                v14 = CFSTR("TAP_PUBLISHER_SUBACTION");
                break;
              case 2196:
                v14 = CFSTR("CARPLAY_DISPLAY_ACTIVATED");
                break;
              case 2197:
                v14 = CFSTR("CARPLAY_DISPLAY_DEACTIVATED");
                break;
              case 2198:
                v14 = CFSTR("TAP_FEATURED_COLLECTION");
                break;
              case 2199:
                v14 = CFSTR("SCROLL_FEATURED_COLLECTION_FORWARD");
                break;
              case 2200:
                v14 = CFSTR("SCROLL_FEATURED_COLLECTION_BACKWARD");
                break;
              default:
                switch(v13)
                {
                  case 3001:
                    v14 = CFSTR("START_NAV");
                    break;
                  case 3002:
                    v14 = CFSTR("END_NAV");
                    break;
                  case 3003:
                    v14 = CFSTR("OPEN_NAV_AUDIO_SETTINGS");
                    break;
                  case 3004:
                    v14 = CFSTR("VIEW_DETAILS");
                    break;
                  case 3005:
                    v14 = CFSTR("TAP_SEARCH_ALONG_ROUTE_CATEGORY");
                    break;
                  case 3006:
                    v14 = CFSTR("OPEN_ROUTING_EDITOR");
                    break;
                  case 3007:
                    v14 = CFSTR("EDIT_ORIGIN");
                    break;
                  case 3008:
                    v14 = CFSTR("EDIT_DESTINATION");
                    break;
                  case 3009:
                    v14 = CFSTR("SWAP_ORIGIN_DESTINATION");
                    break;
                  case 3010:
                    v14 = CFSTR("OPEN_MORE_ROUTES");
                    break;
                  case 3011:
                    v14 = CFSTR("SELECT_ROUTING_TYPE_DRIVING");
                    break;
                  case 3012:
                    v14 = CFSTR("SELECT_ROUTING_TYPE_WALKING");
                    break;
                  case 3013:
                    v14 = CFSTR("SELECT_ROUTING_TYPE_TRANSIT");
                    break;
                  case 3014:
                    v14 = CFSTR("SELECT_ROUTING_TYPE_RIDESHARE");
                    break;
                  case 3015:
                    v14 = CFSTR("SELECT_ROUTE");
                    break;
                  case 3016:
                    v14 = CFSTR("COLLAPSE_STEP_DETAILS_WALK");
                    break;
                  case 3017:
                    v14 = CFSTR("EXPAND_STEP_DETAILS_WALK");
                    break;
                  case 3018:
                    v14 = CFSTR("COLLAPSE_STEP_DETAILS_TRANSIT");
                    break;
                  case 3019:
                    v14 = CFSTR("EXPAND_STEP_DETAILS_TRANSIT");
                    break;
                  case 3020:
                    v14 = CFSTR("UNCHECK_BUS");
                    break;
                  case 3021:
                    v14 = CFSTR("UNCHECK_SUBWAY_AND_LIGHT_RAIL");
                    break;
                  case 3022:
                    v14 = CFSTR("UNCHECK_COMMUTER_RAIL");
                    break;
                  case 3023:
                    v14 = CFSTR("UNCHECK_FERRY");
                    break;
                  case 3024:
                    v14 = CFSTR("CHECK_BUS");
                    break;
                  case 3025:
                    v14 = CFSTR("CHECK_SUBWAY_AND_LIGHT_RAIL");
                    break;
                  case 3026:
                    v14 = CFSTR("CHECK_COMMUTER_RAIL");
                    break;
                  case 3027:
                    v14 = CFSTR("CHECK_FERRY");
                    break;
                  case 3028:
                    v14 = CFSTR("SELECT_LEAVE_AT");
                    break;
                  case 3029:
                    v14 = CFSTR("SELECT_ARRIVE_BY");
                    break;
                  case 3030:
                    v14 = CFSTR("SELECT_LEAVE_NOW");
                    break;
                  case 3031:
                    v14 = CFSTR("SELECT_DATE_TIME");
                    break;
                  case 3032:
                    v14 = CFSTR("SWITCH_ON_IC_FARES");
                    break;
                  case 3033:
                    v14 = CFSTR("SWITCH_OFF_IC_FARES");
                    break;
                  case 3034:
                    v14 = CFSTR("OPEN_ROUTE_OPTIONS_DATETIME");
                    break;
                  case 3035:
                    v14 = CFSTR("OPEN_ROUTE_OPTIONS_TRANSIT");
                    break;
                  case 3036:
                    v14 = CFSTR("OPEN_ROUTE_OPTIONS_DRIVING");
                    break;
                  case 3037:
                    v14 = CFSTR("OPEN_TRANSIT_ROUTE_CLUSTER_SHEET");
                    break;
                  case 3038:
                    v14 = CFSTR("REVEAL_FROM_ROUTING");
                    break;
                  case 3039:
                    v14 = CFSTR("DISPLAY_ROUTES");
                    break;
                  case 3040:
                    v14 = CFSTR("CHECK_RECOMMENDED_ROUTES");
                    break;
                  case 3041:
                    v14 = CFSTR("UNCHECK_RECOMMENDED_ROUTES");
                    break;
                  case 3042:
                    v14 = CFSTR("CHECK_FASTER_TRIPS");
                    break;
                  case 3043:
                    v14 = CFSTR("UNCHECK_FASTER_TRIPS");
                    break;
                  case 3044:
                    v14 = CFSTR("CHECK_FEWER_TRANSFERS");
                    break;
                  case 3045:
                    v14 = CFSTR("UNCHECK_FEWER_TRANSFERS");
                    break;
                  case 3046:
                    v14 = CFSTR("CHECK_LESS_WALKING");
                    break;
                  case 3047:
                    v14 = CFSTR("UNCHECK_LESS_WALKING");
                    break;
                  case 3048:
                    v14 = CFSTR("OPEN_ROUTE_OPTIONS_CYCLING");
                    break;
                  case 3049:
                    v14 = CFSTR("TAP_MORE_ROUTES");
                    break;
                  case 3050:
                    v14 = CFSTR("OPEN_NAV_OVERVIEW");
                    break;
                  case 3051:
                    v14 = CFSTR("RESUME_NAV_MANEUVER_VIEW");
                    break;
                  case 3052:
                    v14 = CFSTR("SELECT_AUDIO_VOLUME_SILENT");
                    break;
                  case 3053:
                    v14 = CFSTR("SELECT_AUDIO_VOLUME_LOW");
                    break;
                  case 3054:
                    v14 = CFSTR("SELECT_AUDIO_VOLUME_NORMAL");
                    break;
                  case 3055:
                    v14 = CFSTR("SELECT_AUDIO_VOLUME_LOUD");
                    break;
                  case 3056:
                    v14 = CFSTR("SWITCH_ON_PAUSE_SPOKEN_AUDIO");
                    break;
                  case 3057:
                    v14 = CFSTR("SWITCH_OFF_PAUSE_SPOKEN_AUDIO");
                    break;
                  case 3058:
                    v14 = CFSTR("RESUME_PREV_NAV");
                    break;
                  case 3059:
                    v14 = CFSTR("ACKNOWLEDGE_TRAFFIC_INCIDENT");
                    break;
                  case 3060:
                    v14 = CFSTR("ACCEPT_REROUTE");
                    break;
                  case 3061:
                    v14 = CFSTR("DISMISS_REROUTE");
                    break;
                  case 3062:
                    v14 = CFSTR("ATTEMPT_END_NAV");
                    break;
                  case 3063:
                    v14 = CFSTR("DISPLAY_BANNER");
                    break;
                  case 3064:
                    v14 = CFSTR("VIEW_BANNER_DETAILS");
                    break;
                  case 3065:
                    v14 = CFSTR("ENTER_GUIDANCE");
                    break;
                  case 3066:
                    v14 = CFSTR("AUTO_ADVANCE_GUIDANCE");
                    break;
                  case 3067:
                    v14 = CFSTR("TAP_OPEN_WALLET");
                    break;
                  case 3068:
                    v14 = CFSTR("SELECT_VOICE_GUIDANCE_ALL");
                    break;
                  case 3069:
                    v14 = CFSTR("SELECT_VOICE_GUIDANCE_INCIDENTS");
                    break;
                  case 3070:
                    v14 = CFSTR("SELECT_VOICE_GUIDANCE_NONE");
                    break;
                  case 3071:
                    v14 = CFSTR("DISPLAY_CARD");
                    break;
                  case 3072:
                    v14 = CFSTR("RENDER_ROUTE");
                    break;
                  case 3073:
                    v14 = CFSTR("DISPLAY_JUNCTION_VIEW");
                    break;
                  case 3074:
                    v14 = CFSTR("SELECT_DEPARTURE");
                    break;
                  case 3075:
                    v14 = CFSTR("DISPLAY_AR_VIEW_RAISE_BANNER");
                    break;
                  case 3076:
                    v14 = CFSTR("DEVICE_RAISE");
                    break;
                  case 3077:
                    v14 = CFSTR("ENTER_AR_NAV_VIEW");
                    break;
                  case 3078:
                    v14 = CFSTR("EXIT_AR_NAV_VIEW");
                    break;
                  case 3079:
                    v14 = CFSTR("AR_CALIBRATION_START");
                    break;
                  case 3080:
                    v14 = CFSTR("AR_CALIBRATION_FAILURE");
                    break;
                  case 3081:
                    v14 = CFSTR("AR_CALIBRATION_SUCCESS");
                    break;
                  case 3082:
                    v14 = CFSTR("DISPLAY_AR_NAV_ARROW");
                    break;
                  case 3083:
                    v14 = CFSTR("DISPLAY_AR_NAV_TURN_AROUND");
                    break;
                  case 3084:
                    v14 = CFSTR("DISPLAY_GO_OUTSIDE_BANNER");
                    break;
                  case 3085:
                    v14 = CFSTR("DISPLAY_AR_DARKNESS_MESSAGE");
                    break;
                  case 3086:
                    v14 = CFSTR("DISPLAY_AR_NAV_ENDPOINT");
                    break;
                  case 3087:
                    v14 = CFSTR("DISPLAY_ADVISORY_BANNER");
                    break;
                  case 3088:
                    v14 = CFSTR("TAP_SHOW_ADVISORY_DETAILS");
                    break;
                  default:
                    goto LABEL_578;
                }
                break;
            }
            break;
        }
      }
      if (a2)
        v15 = CFSTR("userActionEventAction");
      else
        v15 = CFSTR("user_action_event_action");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

    }
    objc_msgSend((id)a1, "moduleInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v16, "jsonRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("moduleInfo");
      }
      else
      {
        objc_msgSend(v16, "dictionaryRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("module_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

    }
    if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    {
      v20 = *(int *)(a1 + 60);
      if (v20 >= 0x10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E1C235D0[v20];
      }
      if (a2)
        v22 = CFSTR("buttonType");
      else
        v22 = CFSTR("button_type");
      objc_msgSend(v4, "setObject:forKey:", v21, v22);

    }
    objc_msgSend((id)a1, "actionRichProviderId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      if (a2)
        v24 = CFSTR("actionRichProviderId");
      else
        v24 = CFSTR("action_rich_provider_id");
      objc_msgSend(v4, "setObject:forKey:", v23, v24);
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
  return -[GEOLogMsgEventUserAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventUserAction)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventUserAction *)-[GEOLogMsgEventUserAction _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgEventUserAction)initWithJSON:(id)a3
{
  return (GEOLogMsgEventUserAction *)-[GEOLogMsgEventUserAction _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4520;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4521;
    GEOLogMsgEventUserActionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLogMsgEventUserActionModuleInfo readAll:](self->_moduleInfo, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventUserActionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventUserActionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventUserAction readAll:](self, "readAll:", 0);
    if (self->_userActionEventKey)
      PBDataWriterWriteStringField();
    if (self->_userActionEventValue)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_moduleInfo)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_actionRichProviderId)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOLogMsgEventUserAction readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userActionEventKey)
    objc_msgSend(v6, "setUserActionEventKey:");
  if (self->_userActionEventValue)
    objc_msgSend(v6, "setUserActionEventValue:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_userActionEventTarget;
    *((_BYTE *)v6 + 72) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_userActionEventAction;
    *((_BYTE *)v6 + 72) |= 2u;
  }
  if (self->_moduleInfo)
  {
    objc_msgSend(v6, "setModuleInfo:");
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_buttonType;
    *((_BYTE *)v5 + 72) |= 1u;
  }
  if (self->_actionRichProviderId)
  {
    objc_msgSend(v6, "setActionRichProviderId:");
    v5 = v6;
  }

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
  char flags;
  id v14;
  void *v15;
  uint64_t v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventUserActionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventUserAction readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_userActionEventKey, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_userActionEventValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_userActionEventTarget;
    *(_BYTE *)(v5 + 72) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_userActionEventAction;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  v14 = -[GEOLogMsgEventUserActionModuleInfo copyWithZone:](self->_moduleInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_buttonType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_actionRichProviderId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *userActionEventKey;
  NSString *userActionEventValue;
  char flags;
  char v8;
  GEOLogMsgEventUserActionModuleInfo *moduleInfo;
  NSString *actionRichProviderId;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOLogMsgEventUserAction readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  userActionEventKey = self->_userActionEventKey;
  if ((unint64_t)userActionEventKey | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](userActionEventKey, "isEqual:"))
      goto LABEL_26;
  }
  userActionEventValue = self->_userActionEventValue;
  if ((unint64_t)userActionEventValue | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](userActionEventValue, "isEqual:"))
      goto LABEL_26;
  }
  flags = (char)self->_flags;
  v8 = *((_BYTE *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_userActionEventTarget != *((_DWORD *)v4 + 17))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_userActionEventAction != *((_DWORD *)v4 + 16))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_26;
  }
  moduleInfo = self->_moduleInfo;
  if ((unint64_t)moduleInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLogMsgEventUserActionModuleInfo isEqual:](moduleInfo, "isEqual:"))
    {
LABEL_26:
      v11 = 0;
      goto LABEL_27;
    }
    flags = (char)self->_flags;
    v8 = *((_BYTE *)v4 + 72);
  }
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_buttonType != *((_DWORD *)v4 + 15))
      goto LABEL_26;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_26;
  }
  actionRichProviderId = self->_actionRichProviderId;
  if ((unint64_t)actionRichProviderId | *((_QWORD *)v4 + 2))
    v11 = -[NSString isEqual:](actionRichProviderId, "isEqual:");
  else
    v11 = 1;
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOLogMsgEventUserAction readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_userActionEventKey, "hash");
  v4 = -[NSString hash](self->_userActionEventValue, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v5 = 2654435761 * self->_userActionEventTarget;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_userActionEventAction;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[GEOLogMsgEventUserActionModuleInfo hash](self->_moduleInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_buttonType;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_actionRichProviderId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOLogMsgEventUserActionModuleInfo *moduleInfo;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if (v8[4])
  {
    -[GEOLogMsgEventUserAction setUserActionEventKey:](self, "setUserActionEventKey:");
    v4 = v8;
  }
  if (v4[5])
  {
    -[GEOLogMsgEventUserAction setUserActionEventValue:](self, "setUserActionEventValue:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 4) != 0)
  {
    self->_userActionEventTarget = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 2) != 0)
  {
    self->_userActionEventAction = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 2u;
  }
  moduleInfo = self->_moduleInfo;
  v7 = v4[3];
  if (moduleInfo)
  {
    if (!v7)
      goto LABEL_15;
    -[GEOLogMsgEventUserActionModuleInfo mergeFrom:](moduleInfo, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[GEOLogMsgEventUserAction setModuleInfo:](self, "setModuleInfo:");
  }
  v4 = v8;
LABEL_15:
  if ((v4[9] & 1) != 0)
  {
    self->_buttonType = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v4[2])
  {
    -[GEOLogMsgEventUserAction setActionRichProviderId:](self, "setActionRichProviderId:");
    v4 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActionEventValue, 0);
  objc_storeStrong((id *)&self->_userActionEventKey, 0);
  objc_storeStrong((id *)&self->_moduleInfo, 0);
  objc_storeStrong((id *)&self->_actionRichProviderId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
