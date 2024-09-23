@implementation GEODailyUseSummaryUseEvent

- (int)eventType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("UNKNOWN_EVENT");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("ACCIDENT_CONFIRMATION");
      return v3;
    case 2:
      return CFSTR("ACCIDENT_SUBMISSION");
    case 3:
      return CFSTR("ADD_LICENSE_PLATE");
    case 4:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL");
    case 5:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_FLYOVER");
    case 6:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_GENERAL");
    case 7:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE");
    case 8:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_LOOK_AROUND");
    case 9:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_TRANSIT");
    case 10:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_UNKNOWN");
    case 11:
      return CFSTR("ANNOUNCEMENT_DISPLAYED_VENUES");
    case 12:
      return CFSTR("ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL");
    case 13:
      return CFSTR("ANNOUNCEMENT_TAPPED_FLYOVER");
    case 14:
      return CFSTR("ANNOUNCEMENT_TAPPED_GENERAL");
    case 15:
      return CFSTR("ANNOUNCEMENT_TAPPED_LANE_GUIDANCE");
    case 16:
      return CFSTR("ANNOUNCEMENT_TAPPED_LOOK_AROUND");
    case 17:
      return CFSTR("ANNOUNCEMENT_TAPPED_TRANSIT");
    case 18:
      return CFSTR("ANNOUNCEMENT_TAPPED_UNKNOWN");
    case 19:
      return CFSTR("ANNOUNCEMENT_TAPPED_VENUES");
    case 20:
      return CFSTR("APP_CLIP_USED");
    case 21:
      return CFSTR("AR_MODE_ENTER");
    case 22:
      return CFSTR("AUTOCOMPLETE_RESULTS_SHOWN");
    case 23:
      return CFSTR("CARPLAY_CONNECTED");
    case 24:
      return CFSTR("COARSE_LOCATION_USED");
    case 25:
      return CFSTR("COLLECTION_CREATED");
    case 26:
      return CFSTR("COLLECTION_ITEM_TAPPED");
    case 27:
      return CFSTR("COLLECTION_SHARED");
    case 28:
      return CFSTR("COLLECTION_SHOWN");
    case 29:
      return CFSTR("CURATED_COLLECTION_ITEM_TAPPED");
    case 30:
      return CFSTR("CURATED_COLLECTION_REMOVED");
    case 31:
      return CFSTR("CURATED_COLLECTION_SAVED");
    case 32:
      return CFSTR("CURATED_COLLECTION_SHARED");
    case 33:
      return CFSTR("CURATED_COLLECTION_SHOWN");
    case 34:
      return CFSTR("DEVICE_CONNECTED");
    case 35:
      return CFSTR("DIRECTIONS");
    case 36:
      return CFSTR("DIRECTIONS_REQUESTED_CYCLING");
    case 37:
      return CFSTR("DIRECTIONS_REQUESTED_DRIVING");
    case 38:
      return CFSTR("DIRECTIONS_REQUESTED_EBIKE");
    case 39:
      return CFSTR("DIRECTIONS_REQUESTED_EV_ROUTING");
    case 40:
      return CFSTR("DIRECTIONS_REQUESTED_TRANSIT");
    case 41:
      return CFSTR("DIRECTIONS_REQUESTED_WALKING");
    case 42:
      return CFSTR("DIRECTIONS_SAFARI");
    case 43:
      return CFSTR("DIRECTIONS_SIRI_PLACECARD");
    case 44:
      return CFSTR("DIRECTIONS_SPOTLIGHT");
    case 45:
      return CFSTR("ENTER_MAPS_CARPLAY");
    case 46:
      return CFSTR("ENTER_VENUE_EXPERIENCE");
    case 47:
      return CFSTR("ETA_RECEIVED");
    case 48:
      return CFSTR("ETA_SHARED");
    case 49:
      return CFSTR("FAVORITE_ADD_PLACE");
    case 50:
      return CFSTR("FAVORITE_TAP_LIST_ITEM");
    case 51:
      return CFSTR("FLYOVER_FOREGROUNDED");
    case 52:
      return CFSTR("INCIDENT_SUBMISSION");
    case 53:
      return CFSTR("LOOK_AROUND_FOREGROUNDED");
    case 54:
      return CFSTR("LOOK_AROUND_SHARED");
    case 55:
      return CFSTR("MAPSHOME_GET_DIRECTIONS");
    case 56:
      return CFSTR("MAPS_HANDOFF_FROM_IPAD");
    case 57:
      return CFSTR("MAPS_HANDOFF_FROM_MAC");
    case 58:
      return CFSTR("MAPS_HANDOFF_FROM_PHONE");
    case 59:
      return CFSTR("MAPS_HANDOFF_FROM_WATCH");
    case 60:
      return CFSTR("MAP_VIEW_FOREGROUNDED");
    case 61:
      return CFSTR("NAV_SESSION_COARSE_LOCATION");
    case 62:
      return CFSTR("NAV_SESSION_PRECISE_LOCATION");
    case 63:
      return CFSTR("NAV_STARTED_CARPLAY");
    case 64:
      return CFSTR("NAV_STARTED_CYCLING");
    case 65:
      return CFSTR("NAV_STARTED_DRIVING");
    case 66:
      return CFSTR("NAV_STARTED_EBIKE");
    case 67:
      return CFSTR("NAV_STARTED_EV_ROUTING");
    case 68:
      return CFSTR("NAV_STARTED_JUNCTION_VIEW");
    case 69:
      return CFSTR("NAV_STARTED_LANE_GUIDANCE");
    case 70:
      return CFSTR("NAV_STARTED_TRANSIT");
    case 71:
      return CFSTR("NAV_STARTED_WALKING");
    case 72:
      return CFSTR("OPEN_INDOOR_MAP");
    case 73:
      return CFSTR("OTHER_GET_DIRECTIONS");
    case 74:
      return CFSTR("PLACECARD_GET_DIRECTIONS");
    case 75:
      return CFSTR("PLACECARD_RICH_DATA_USED");
    case 76:
      return CFSTR("PLACECARD_SHARED");
    case 77:
      return CFSTR("PLACECARD_SHOWN");
    case 78:
      return CFSTR("PLACECARD_SHOWN_SAFARI");
    case 79:
      return CFSTR("PLACECARD_SHOWN_SIRI");
    case 80:
      return CFSTR("PLACECARD_SHOWN_SPOTLIGHT");
    case 81:
      return CFSTR("PLACECARD_START_NAV");
    case 82:
      return CFSTR("PROMINENT_GET_DIRECTIONS");
    case 83:
      return CFSTR("RAP_STARTED");
    case 84:
      return CFSTR("RIDESHARE_REQUESTED");
    case 85:
      return CFSTR("SEARCH_NEARBY_CATEGORY_TAPPED");
    case 86:
      return CFSTR("SEARCH_RECENTLY_VIEWED_TAPPED");
    case 87:
      return CFSTR("SEARCH_RECENT_SEARCHES_TAPPED");
    case 88:
      return CFSTR("SEARCH_RESULTS_SHOWN_MAPS");
    case 89:
      return CFSTR("SEARCH_RESULTS_SHOWN_SAFARI");
    case 90:
      return CFSTR("SEARCH_RESULTS_SHOWN_SIRI");
    case 91:
      return CFSTR("SEARCH_RESULTS_SHOWN_SPOTLIGHT");
    case 92:
      return CFSTR("SEARCH_RESULTS_TAPPED_SAFARI");
    case 93:
      return CFSTR("SEARCH_RESULTS_TAPPED_SIRI");
    case 94:
      return CFSTR("SEARCH_RESULTS_TAPPED_SPOTLIGHT");
    case 95:
      return CFSTR("SEARCH_RESULT_TAPPED_MAPS");
    case 96:
      return CFSTR("SEARCH_SUGGESTION_TAPPED");
    case 97:
      return CFSTR("SHARE_DRIVING_ROUTES");
    case 98:
      return CFSTR("SHARE_FAVORITES");
    case 99:
      return CFSTR("SHARE_MYLOCATION");
    case 100:
      return CFSTR("SHARE_TO_DEVICE");
    case 101:
      return CFSTR("SHARE_TRANSIT_ROUTES");
    case 102:
      return CFSTR("SHARE_WALKING_ROUTES");
    case 103:
      return CFSTR("SHOW_MAPS_SETTINGS");
    case 104:
      return CFSTR("SIRI_START_NAV");
    case 105:
      return CFSTR("SNAPSHOTTER_USED");
    case 106:
      return CFSTR("TAP_COMPASS_MODE");
    case 107:
      return CFSTR("UGC_PHOTO_SUBMISSION");
    case 108:
      return CFSTR("UGC_RATING_SUBMISSION");
    case 109:
      return CFSTR("VLF_CORRECTION_ATTEMPTED");
    case 110:
      return CFSTR("VLF_CORRECTION_FAILED");
    case 111:
      return CFSTR("VLF_CORRECTION_SUCCESS");
    case 112:
      return CFSTR("WIDGET_ENTER");
    case 113:
      return CFSTR("JUNCTION_VIEW_SHOWN");
    case 114:
      return CFSTR("ETA_SHARED_DRIVING");
    case 115:
      return CFSTR("ETA_SHARED_WALKING");
    case 116:
      return CFSTR("ETA_SHARED_CYCLING");
    case 117:
      return CFSTR("MAPS_HANDOFF");
    case 118:
      return CFSTR("AR_WALKING_LOCALIZATION_ATTEMPTED");
    case 119:
      return CFSTR("AR_WALKING_LOCALIZATION_FAILED");
    case 120:
      return CFSTR("AR_WALKING_LOCALIZATION_SUCCESS");
    case 121:
      return CFSTR("CURATED_COLLECTIONS_HOME_SHOWN");
    case 122:
      return CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN");
    case 123:
      return CFSTR("NEARBY_TRANSIT_SHOWN");
    case 124:
      return CFSTR("NEARBY_TRANSIT_TAPPED");
    case 125:
      return CFSTR("SPR_GLOBE_EXPLORED");
    case 126:
      return CFSTR("SPR_METROS_EXPLORED");
    case 127:
      return CFSTR("TRANSIT_DETAILS_USED");
    case 128:
      return CFSTR("USER_ACCOUNT_OPENED_ACCOUNT");
    case 129:
      return CFSTR("USER_ACCOUNT_SHOWN");
    case 130:
      return CFSTR("MAP_MODE_DRIVING_SELECTED");
    case 131:
      return CFSTR("MAP_MODE_EXPLORE_SELECTED");
    case 132:
      return CFSTR("MAP_MODE_TRANSIT_SELECTED");
    case 133:
      return CFSTR("MAP_MODE_SATELLITE_SELECTED");
    case 134:
      return CFSTR("MAP_MODE_DRIVING_USED");
    case 135:
      return CFSTR("MAP_MODE_EXPLORE_USED");
    case 136:
      return CFSTR("MAP_MODE_TRANSIT_USED");
    case 137:
      return CFSTR("MAP_MODE_SATELLITE_USED");
    case 138:
      return CFSTR("WATCH_GET_DIRECTIONS_CYCLING");
    case 139:
      return CFSTR("WATCH_START_NAV_CYCLING");
    case 140:
      return CFSTR("WATCH_GET_DIRECTIONS_WALKING");
    case 141:
      return CFSTR("WATCH_START_NAV_WALKING");
    case 142:
      return CFSTR("WATCH_GET_DIRECTIONS_TRANSIT");
    case 143:
      return CFSTR("WATCH_START_NAV_TRANSIT");
    case 144:
      return CFSTR("WATCH_GET_DIRECTIONS_DRIVING");
    case 145:
      return CFSTR("WATCH_START_NAV_DRIVING");
    case 146:
      return CFSTR("ETA_SHARED_TRANSIT");
    case 147:
      return CFSTR("USER_ACCOUNT_OPENED");
    case 148:
      return CFSTR("VENUE_INTERACTION");
    case 149:
      return CFSTR("ENTER_MAPS");
    case 150:
      return CFSTR("EXIT_MAPS");
    case 151:
      return CFSTR("TOTAL_SECONDS_IN_MAPS_DEVICE");
    case 152:
      return CFSTR("ENTER_MAPS_DEVICE");
    case 153:
      return CFSTR("MAP_VIEW_INSTANTIATED");
    case 154:
      return CFSTR("MAP_VIEW_ACTIVATED");
    case 155:
      return CFSTR("DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI");
    case 156:
      return CFSTR("DIRECTIONS_LIST_ITEM_CARPLAY_UI");
    case 157:
      return CFSTR("DIRECTIONS_FAVORITE_CARPLAY_UI");
    case 158:
      return CFSTR("GET_DIRECTIONS_CARPLAY_CONNECTED");
    case 159:
      return CFSTR("DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED");
    case 160:
      return CFSTR("SIRI_SEARCH_CARPLAY_UI");
    case 161:
      return CFSTR("OPEN_KEYBOARD_CARPLAY_UI");
    case 162:
      return CFSTR("TAP_SEARCH_CARPLAY_UI");
    case 163:
      return CFSTR("OPEN_SEARCH_CARPLAY_UI");
    case 164:
      return CFSTR("MAPS_SEARCH_CARPLAY_CONNECTED");
    case 165:
      return CFSTR("EXIT_MAPS_CARPLAY");
    case 166:
      return CFSTR("TOTAL_SECONDS_IN_MAPS_CARPLAY");
    case 167:
      return CFSTR("NAV_FEEDBACK_DRIVING");
    case 168:
      return CFSTR("TRIP_COMPLETED_DRIVING");
    case 169:
      return CFSTR("HAS_REROUTE_DRIVING");
    case 170:
      return CFSTR("ETA_OVERESTIMATE_DRIVING");
    case 171:
      return CFSTR("EXTREME_ETA_OVERESTIMATE_DRIVING");
    case 172:
      return CFSTR("ETA_UNDERESTIMATE_DRIVING");
    case 173:
      return CFSTR("EXTREME_ETA_UNDERESTIMATE_DRIVING");
    case 174:
      return CFSTR("RAP_GOOD_TRIP");
    case 175:
      return CFSTR("ENRICHED_RESULTS_SHOWN_MAPS");
    case 176:
      return CFSTR("TAP_TRANSIT_TIPKIT");
    case 177:
      return CFSTR("ADD_STOP_CARPLAY");
    case 178:
      return CFSTR("ADD_STOP_CARPLAY_SIRI");
    case 179:
      return CFSTR("ADD_STOP_DEVICE");
    case 180:
      return CFSTR("ADD_STOP_DEVICE_SIRI");
    case 181:
      return CFSTR("SHOWCASE_SHOWN");
    case 182:
      return CFSTR("SHOWCASE_TAPPED");
    case 183:
      return CFSTR("PUNCH_IN_SIRI");
    case 184:
      return CFSTR("PUNCH_IN_SAFARI");
    case 185:
      return CFSTR("PUNCH_IN_SPOTLIGHT");
    case 186:
      return CFSTR("PUNCH_IN_SMS");
    case 187:
      return CFSTR("PUNCH_IN_FINDMY");
    case 188:
      return CFSTR("PUNCH_IN_OTHER_2ND_PARTY");
    case 189:
      return CFSTR("PUNCH_IN_3RD_PARTY");
    case 191:
      return CFSTR("RAP_SUBMITTED");
    case 192:
      return CFSTR("ARP_PHOTO_SUBMISSION");
    case 193:
      return CFSTR("ARP_RATING_SUBMISSION");
    case 194:
      return CFSTR("TRAFFIC_INCIDENT_REPORT");
    case 195:
      return CFSTR("TRAFFIC_INCIDENT_CONFIRM");
    case 196:
      return CFSTR("TRAFFIC_INCIDENT_DISMISS");
    case 197:
      return CFSTR("TRAFFIC_INCIDENT_CLEAR");
    case 198:
      return CFSTR("MODERN_MAP_EXPLORED");
    case 199:
      return CFSTR("CARPLAY_ROUTING_UI_USED");
    case 200:
      return CFSTR("CARPLAY_SEARCH_UI_USED");
    case 201:
      return CFSTR("ANNOUNCEMENT_DISPLAYED");
    case 202:
      return CFSTR("ANNOUNCEMENT_TAPPED");
    case 203:
      return CFSTR("POSITIVE_SEARCH_ENGAGEMENT");
    case 204:
      return CFSTR("PUNCH_OUT_FINDMY");
    case 205:
      return CFSTR("WATCH_START_NAV");
    case 206:
      return CFSTR("HIKING_ENGAGEMENT");
    case 207:
      return CFSTR("HIKING_PLACECARD");
    case 208:
      return CFSTR("NO_SEARCH_RESULTS");
    case 209:
      return CFSTR("PUNCH_IN_SHOWCASE");
    case 210:
      return CFSTR("SHARED_LOCATION_ENGAGEMENT");
    case 211:
      return CFSTR("SHARE_SHOWCASE");
    case 212:
      return CFSTR("WATCH_MAP_VIEW");
    case 213:
      return CFSTR("WATCH_PLACECARD");
    case 214:
      return CFSTR("WATCH_SEARCH");
    case 215:
      return CFSTR("CURATED_HIKE_SAVED");
    case 216:
      return CFSTR("CUSTOM_HIKE_SAVED");
    case 217:
      return CFSTR("CUSTOM_HIKE_CREATION_TRAY_SHOWN");
    case 218:
      return CFSTR("DIRECTIONS_REQUESTED_CURATED_HIKE");
    case 219:
      return CFSTR("DIRECTIONS_REQUESTED_CUSTOM_HIKE");
    case 220:
      return CFSTR("NAV_STARTED_CURATED_HIKE");
    case 221:
      return CFSTR("NAV_STARTED_CUSTOM_HIKE");
    case 222:
      return CFSTR("ROUTING_TRAY_CURATED_HIKE_SHOWN");
    case 223:
      return CFSTR("ROUTING_TRAY_CUSTOM_HIKE_SHOWN");
    case 224:
      return CFSTR("SEARCH_PHOTO_INTERACTION");
    case 225:
      return CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS");
    case 226:
      return CFSTR("LIBRARY_INTERACTION");
    case 227:
      return CFSTR("SEARCH_FILTER_INTERACTION");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_EVENT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCIDENT_CONFIRMATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCIDENT_SUBMISSION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_LICENSE_PLATE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_FLYOVER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_GENERAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_TRANSIT")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_UNKNOWN")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_VENUES")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_FLYOVER")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_GENERAL")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_LANE_GUIDANCE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_TRANSIT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_UNKNOWN")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_VENUES")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_CLIP_USED")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_MODE_ENTER")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULTS_SHOWN")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_CONNECTED")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COARSE_LOCATION_USED")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_CREATED")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_ITEM_TAPPED")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_SHARED")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_SHOWN")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_ITEM_TAPPED")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_REMOVED")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_SAVED")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_SHARED")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_SHOWN")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_CONNECTED")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_CYCLING")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_DRIVING")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_EBIKE")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_EV_ROUTING")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_TRANSIT")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_WALKING")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_SAFARI")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_SIRI_PLACECARD")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_SPOTLIGHT")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER_MAPS_CARPLAY")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER_VENUE_EXPERIENCE")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_RECEIVED")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_SHARED")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_ADD_PLACE")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_TAP_LIST_ITEM")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_FOREGROUNDED")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_SUBMISSION")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_FOREGROUNDED")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_SHARED")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPSHOME_GET_DIRECTIONS")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_IPAD")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_MAC")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_PHONE")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_WATCH")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_VIEW_FOREGROUNDED")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_SESSION_COARSE_LOCATION")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_SESSION_PRECISE_LOCATION")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_CARPLAY")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_CYCLING")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_DRIVING")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_EBIKE")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_EV_ROUTING")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_JUNCTION_VIEW")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_LANE_GUIDANCE")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_TRANSIT")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_WALKING")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_INDOOR_MAP")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER_GET_DIRECTIONS")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_GET_DIRECTIONS")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_RICH_DATA_USED")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_SHARED")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_SHOWN")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_SHOWN_SAFARI")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_SHOWN_SIRI")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_SHOWN_SPOTLIGHT")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_START_NAV")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROMINENT_GET_DIRECTIONS")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STARTED")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE_REQUESTED")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_NEARBY_CATEGORY_TAPPED")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RECENTLY_VIEWED_TAPPED")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RECENT_SEARCHES_TAPPED")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_MAPS")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_SAFARI")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_SIRI")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_SPOTLIGHT")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_TAPPED_SAFARI")) & 1) != 0)
  {
    v4 = 92;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_TAPPED_SIRI")) & 1) != 0)
  {
    v4 = 93;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_TAPPED_SPOTLIGHT")) & 1) != 0)
  {
    v4 = 94;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULT_TAPPED_MAPS")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_SUGGESTION_TAPPED")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_DRIVING_ROUTES")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_FAVORITES")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_MYLOCATION")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_TO_DEVICE")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_TRANSIT_ROUTES")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_WALKING_ROUTES")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_MAPS_SETTINGS")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_START_NAV")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SNAPSHOTTER_USED")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_COMPASS_MODE")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UGC_PHOTO_SUBMISSION")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UGC_RATING_SUBMISSION")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLF_CORRECTION_ATTEMPTED")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLF_CORRECTION_FAILED")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLF_CORRECTION_SUCCESS")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_ENTER")) & 1) != 0)
  {
    v4 = 112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JUNCTION_VIEW_SHOWN")) & 1) != 0)
  {
    v4 = 113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_SHARED_DRIVING")) & 1) != 0)
  {
    v4 = 114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_SHARED_WALKING")) & 1) != 0)
  {
    v4 = 115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_SHARED_CYCLING")) & 1) != 0)
  {
    v4 = 116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_HANDOFF")) & 1) != 0)
  {
    v4 = 117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_WALKING_LOCALIZATION_ATTEMPTED")) & 1) != 0)
  {
    v4 = 118;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_WALKING_LOCALIZATION_FAILED")) & 1) != 0)
  {
    v4 = 119;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_WALKING_LOCALIZATION_SUCCESS")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_SHOWN")) & 1) != 0)
  {
    v4 = 121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN")) & 1) != 0)
  {
    v4 = 122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEARBY_TRANSIT_SHOWN")) & 1) != 0)
  {
    v4 = 123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEARBY_TRANSIT_TAPPED")) & 1) != 0)
  {
    v4 = 124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPR_GLOBE_EXPLORED")) & 1) != 0)
  {
    v4 = 125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPR_METROS_EXPLORED")) & 1) != 0)
  {
    v4 = 126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_DETAILS_USED")) & 1) != 0)
  {
    v4 = 127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ACCOUNT_OPENED_ACCOUNT")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ACCOUNT_SHOWN")) & 1) != 0)
  {
    v4 = 129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_DRIVING_SELECTED")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_EXPLORE_SELECTED")) & 1) != 0)
  {
    v4 = 131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_TRANSIT_SELECTED")) & 1) != 0)
  {
    v4 = 132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_SATELLITE_SELECTED")) & 1) != 0)
  {
    v4 = 133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_DRIVING_USED")) & 1) != 0)
  {
    v4 = 134;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_EXPLORE_USED")) & 1) != 0)
  {
    v4 = 135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_TRANSIT_USED")) & 1) != 0)
  {
    v4 = 136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MODE_SATELLITE_USED")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_CYCLING")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_START_NAV_CYCLING")) & 1) != 0)
  {
    v4 = 139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_WALKING")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_START_NAV_WALKING")) & 1) != 0)
  {
    v4 = 141;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_TRANSIT")) & 1) != 0)
  {
    v4 = 142;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_START_NAV_TRANSIT")) & 1) != 0)
  {
    v4 = 143;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_DRIVING")) & 1) != 0)
  {
    v4 = 144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_START_NAV_DRIVING")) & 1) != 0)
  {
    v4 = 145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_SHARED_TRANSIT")) & 1) != 0)
  {
    v4 = 146;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ACCOUNT_OPENED")) & 1) != 0)
  {
    v4 = 147;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VENUE_INTERACTION")) & 1) != 0)
  {
    v4 = 148;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER_MAPS")) & 1) != 0)
  {
    v4 = 149;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT_MAPS")) & 1) != 0)
  {
    v4 = 150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOTAL_SECONDS_IN_MAPS_DEVICE")) & 1) != 0)
  {
    v4 = 151;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER_MAPS_DEVICE")) & 1) != 0)
  {
    v4 = 152;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_VIEW_INSTANTIATED")) & 1) != 0)
  {
    v4 = 153;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_VIEW_ACTIVATED")) & 1) != 0)
  {
    v4 = 154;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI")) & 1) != 0)
  {
    v4 = 155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_LIST_ITEM_CARPLAY_UI")) & 1) != 0)
  {
    v4 = 156;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_FAVORITE_CARPLAY_UI")) & 1) != 0)
  {
    v4 = 157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GET_DIRECTIONS_CARPLAY_CONNECTED")) & 1) != 0)
  {
    v4 = 158;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED")) & 1) != 0)
  {
    v4 = 159;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SEARCH_CARPLAY_UI")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_KEYBOARD_CARPLAY_UI")) & 1) != 0)
  {
    v4 = 161;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_SEARCH_CARPLAY_UI")) & 1) != 0)
  {
    v4 = 162;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_SEARCH_CARPLAY_UI")) & 1) != 0)
  {
    v4 = 163;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_SEARCH_CARPLAY_CONNECTED")) & 1) != 0)
  {
    v4 = 164;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT_MAPS_CARPLAY")) & 1) != 0)
  {
    v4 = 165;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOTAL_SECONDS_IN_MAPS_CARPLAY")) & 1) != 0)
  {
    v4 = 166;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_FEEDBACK_DRIVING")) & 1) != 0)
  {
    v4 = 167;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIP_COMPLETED_DRIVING")) & 1) != 0)
  {
    v4 = 168;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_REROUTE_DRIVING")) & 1) != 0)
  {
    v4 = 169;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_OVERESTIMATE_DRIVING")) & 1) != 0)
  {
    v4 = 170;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTREME_ETA_OVERESTIMATE_DRIVING")) & 1) != 0)
  {
    v4 = 171;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_UNDERESTIMATE_DRIVING")) & 1) != 0)
  {
    v4 = 172;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTREME_ETA_UNDERESTIMATE_DRIVING")) & 1) != 0)
  {
    v4 = 173;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_GOOD_TRIP")) & 1) != 0)
  {
    v4 = 174;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENRICHED_RESULTS_SHOWN_MAPS")) & 1) != 0)
  {
    v4 = 175;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_TRANSIT_TIPKIT")) & 1) != 0)
  {
    v4 = 176;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_STOP_CARPLAY")) & 1) != 0)
  {
    v4 = 177;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_STOP_CARPLAY_SIRI")) & 1) != 0)
  {
    v4 = 178;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_STOP_DEVICE")) & 1) != 0)
  {
    v4 = 179;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_STOP_DEVICE_SIRI")) & 1) != 0)
  {
    v4 = 180;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_SHOWN")) & 1) != 0)
  {
    v4 = 181;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_TAPPED")) & 1) != 0)
  {
    v4 = 182;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_SIRI")) & 1) != 0)
  {
    v4 = 183;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_SAFARI")) & 1) != 0)
  {
    v4 = 184;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_SPOTLIGHT")) & 1) != 0)
  {
    v4 = 185;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_SMS")) & 1) != 0)
  {
    v4 = 186;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_FINDMY")) & 1) != 0)
  {
    v4 = 187;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_OTHER_2ND_PARTY")) & 1) != 0)
  {
    v4 = 188;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_3RD_PARTY")) & 1) != 0)
  {
    v4 = 189;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SUBMITTED")) & 1) != 0)
  {
    v4 = 191;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_PHOTO_SUBMISSION")) & 1) != 0)
  {
    v4 = 192;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_RATING_SUBMISSION")) & 1) != 0)
  {
    v4 = 193;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_REPORT")) & 1) != 0)
  {
    v4 = 194;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_CONFIRM")) & 1) != 0)
  {
    v4 = 195;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_DISMISS")) & 1) != 0)
  {
    v4 = 196;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_CLEAR")) & 1) != 0)
  {
    v4 = 197;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODERN_MAP_EXPLORED")) & 1) != 0)
  {
    v4 = 198;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_ROUTING_UI_USED")) & 1) != 0)
  {
    v4 = 199;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SEARCH_UI_USED")) & 1) != 0)
  {
    v4 = 200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED")) & 1) != 0)
  {
    v4 = 202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSITIVE_SEARCH_ENGAGEMENT")) & 1) != 0)
  {
    v4 = 203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_OUT_FINDMY")) & 1) != 0)
  {
    v4 = 204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_START_NAV")) & 1) != 0)
  {
    v4 = 205;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_ENGAGEMENT")) & 1) != 0)
  {
    v4 = 206;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_PLACECARD")) & 1) != 0)
  {
    v4 = 207;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 208;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUNCH_IN_SHOWCASE")) & 1) != 0)
  {
    v4 = 209;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_LOCATION_ENGAGEMENT")) & 1) != 0)
  {
    v4 = 210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_SHOWCASE")) & 1) != 0)
  {
    v4 = 211;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAP_VIEW")) & 1) != 0)
  {
    v4 = 212;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PLACECARD")) & 1) != 0)
  {
    v4 = 213;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH")) & 1) != 0)
  {
    v4 = 214;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_HIKE_SAVED")) & 1) != 0)
  {
    v4 = 215;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM_HIKE_SAVED")) & 1) != 0)
  {
    v4 = 216;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM_HIKE_CREATION_TRAY_SHOWN")) & 1) != 0)
  {
    v4 = 217;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_CURATED_HIKE")) & 1) != 0)
  {
    v4 = 218;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_CUSTOM_HIKE")) & 1) != 0)
  {
    v4 = 219;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_CURATED_HIKE")) & 1) != 0)
  {
    v4 = 220;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_STARTED_CUSTOM_HIKE")) & 1) != 0)
  {
    v4 = 221;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CURATED_HIKE_SHOWN")) & 1) != 0)
  {
    v4 = 222;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CUSTOM_HIKE_SHOWN")) & 1) != 0)
  {
    v4 = 223;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_PHOTO_INTERACTION")) & 1) != 0)
  {
    v4 = 224;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS")) & 1) != 0)
  {
    v4 = 225;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIBRARY_INTERACTION")) & 1) != 0)
  {
    v4 = 226;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_FILTER_INTERACTION")))
  {
    v4 = 227;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)appType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_appType;
  else
    return 0;
}

- (void)setAppType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_appType = a3;
}

- (void)setHasAppType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAppType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)appTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C230E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAppType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIRST_PARTY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECOND_PARTY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_PARTY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAEMONS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("END_SENTINEL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)usageBool
{
  return self->_usageBool;
}

- (void)setUsageBool:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_usageBool = a3;
}

- (void)setHasUsageBool:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasUsageBool
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)hasUsageString
{
  return self->_usageString != 0;
}

- (NSString)usageString
{
  return self->_usageString;
}

- (void)setUsageString:(id)a3
{
  objc_storeStrong((id *)&self->_usageString, a3);
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
  v8.super_class = (Class)GEODailyUseSummaryUseEvent;
  -[GEODailyUseSummaryUseEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODailyUseSummaryUseEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODailyUseSummaryUseEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 32);
    if ((v5 & 4) != 0)
    {
      v6 = CFSTR("UNKNOWN_EVENT");
      switch(*(_DWORD *)(a1 + 24))
      {
        case 0:
          break;
        case 1:
          v6 = CFSTR("ACCIDENT_CONFIRMATION");
          break;
        case 2:
          v6 = CFSTR("ACCIDENT_SUBMISSION");
          break;
        case 3:
          v6 = CFSTR("ADD_LICENSE_PLATE");
          break;
        case 4:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL");
          break;
        case 5:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_FLYOVER");
          break;
        case 6:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_GENERAL");
          break;
        case 7:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE");
          break;
        case 8:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_LOOK_AROUND");
          break;
        case 9:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_TRANSIT");
          break;
        case 0xA:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_UNKNOWN");
          break;
        case 0xB:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED_VENUES");
          break;
        case 0xC:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL");
          break;
        case 0xD:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_FLYOVER");
          break;
        case 0xE:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_GENERAL");
          break;
        case 0xF:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_LANE_GUIDANCE");
          break;
        case 0x10:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_LOOK_AROUND");
          break;
        case 0x11:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_TRANSIT");
          break;
        case 0x12:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_UNKNOWN");
          break;
        case 0x13:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED_VENUES");
          break;
        case 0x14:
          v6 = CFSTR("APP_CLIP_USED");
          break;
        case 0x15:
          v6 = CFSTR("AR_MODE_ENTER");
          break;
        case 0x16:
          v6 = CFSTR("AUTOCOMPLETE_RESULTS_SHOWN");
          break;
        case 0x17:
          v6 = CFSTR("CARPLAY_CONNECTED");
          break;
        case 0x18:
          v6 = CFSTR("COARSE_LOCATION_USED");
          break;
        case 0x19:
          v6 = CFSTR("COLLECTION_CREATED");
          break;
        case 0x1A:
          v6 = CFSTR("COLLECTION_ITEM_TAPPED");
          break;
        case 0x1B:
          v6 = CFSTR("COLLECTION_SHARED");
          break;
        case 0x1C:
          v6 = CFSTR("COLLECTION_SHOWN");
          break;
        case 0x1D:
          v6 = CFSTR("CURATED_COLLECTION_ITEM_TAPPED");
          break;
        case 0x1E:
          v6 = CFSTR("CURATED_COLLECTION_REMOVED");
          break;
        case 0x1F:
          v6 = CFSTR("CURATED_COLLECTION_SAVED");
          break;
        case 0x20:
          v6 = CFSTR("CURATED_COLLECTION_SHARED");
          break;
        case 0x21:
          v6 = CFSTR("CURATED_COLLECTION_SHOWN");
          break;
        case 0x22:
          v6 = CFSTR("DEVICE_CONNECTED");
          break;
        case 0x23:
          v6 = CFSTR("DIRECTIONS");
          break;
        case 0x24:
          v6 = CFSTR("DIRECTIONS_REQUESTED_CYCLING");
          break;
        case 0x25:
          v6 = CFSTR("DIRECTIONS_REQUESTED_DRIVING");
          break;
        case 0x26:
          v6 = CFSTR("DIRECTIONS_REQUESTED_EBIKE");
          break;
        case 0x27:
          v6 = CFSTR("DIRECTIONS_REQUESTED_EV_ROUTING");
          break;
        case 0x28:
          v6 = CFSTR("DIRECTIONS_REQUESTED_TRANSIT");
          break;
        case 0x29:
          v6 = CFSTR("DIRECTIONS_REQUESTED_WALKING");
          break;
        case 0x2A:
          v6 = CFSTR("DIRECTIONS_SAFARI");
          break;
        case 0x2B:
          v6 = CFSTR("DIRECTIONS_SIRI_PLACECARD");
          break;
        case 0x2C:
          v6 = CFSTR("DIRECTIONS_SPOTLIGHT");
          break;
        case 0x2D:
          v6 = CFSTR("ENTER_MAPS_CARPLAY");
          break;
        case 0x2E:
          v6 = CFSTR("ENTER_VENUE_EXPERIENCE");
          break;
        case 0x2F:
          v6 = CFSTR("ETA_RECEIVED");
          break;
        case 0x30:
          v6 = CFSTR("ETA_SHARED");
          break;
        case 0x31:
          v6 = CFSTR("FAVORITE_ADD_PLACE");
          break;
        case 0x32:
          v6 = CFSTR("FAVORITE_TAP_LIST_ITEM");
          break;
        case 0x33:
          v6 = CFSTR("FLYOVER_FOREGROUNDED");
          break;
        case 0x34:
          v6 = CFSTR("INCIDENT_SUBMISSION");
          break;
        case 0x35:
          v6 = CFSTR("LOOK_AROUND_FOREGROUNDED");
          break;
        case 0x36:
          v6 = CFSTR("LOOK_AROUND_SHARED");
          break;
        case 0x37:
          v6 = CFSTR("MAPSHOME_GET_DIRECTIONS");
          break;
        case 0x38:
          v6 = CFSTR("MAPS_HANDOFF_FROM_IPAD");
          break;
        case 0x39:
          v6 = CFSTR("MAPS_HANDOFF_FROM_MAC");
          break;
        case 0x3A:
          v6 = CFSTR("MAPS_HANDOFF_FROM_PHONE");
          break;
        case 0x3B:
          v6 = CFSTR("MAPS_HANDOFF_FROM_WATCH");
          break;
        case 0x3C:
          v6 = CFSTR("MAP_VIEW_FOREGROUNDED");
          break;
        case 0x3D:
          v6 = CFSTR("NAV_SESSION_COARSE_LOCATION");
          break;
        case 0x3E:
          v6 = CFSTR("NAV_SESSION_PRECISE_LOCATION");
          break;
        case 0x3F:
          v6 = CFSTR("NAV_STARTED_CARPLAY");
          break;
        case 0x40:
          v6 = CFSTR("NAV_STARTED_CYCLING");
          break;
        case 0x41:
          v6 = CFSTR("NAV_STARTED_DRIVING");
          break;
        case 0x42:
          v6 = CFSTR("NAV_STARTED_EBIKE");
          break;
        case 0x43:
          v6 = CFSTR("NAV_STARTED_EV_ROUTING");
          break;
        case 0x44:
          v6 = CFSTR("NAV_STARTED_JUNCTION_VIEW");
          break;
        case 0x45:
          v6 = CFSTR("NAV_STARTED_LANE_GUIDANCE");
          break;
        case 0x46:
          v6 = CFSTR("NAV_STARTED_TRANSIT");
          break;
        case 0x47:
          v6 = CFSTR("NAV_STARTED_WALKING");
          break;
        case 0x48:
          v6 = CFSTR("OPEN_INDOOR_MAP");
          break;
        case 0x49:
          v6 = CFSTR("OTHER_GET_DIRECTIONS");
          break;
        case 0x4A:
          v6 = CFSTR("PLACECARD_GET_DIRECTIONS");
          break;
        case 0x4B:
          v6 = CFSTR("PLACECARD_RICH_DATA_USED");
          break;
        case 0x4C:
          v6 = CFSTR("PLACECARD_SHARED");
          break;
        case 0x4D:
          v6 = CFSTR("PLACECARD_SHOWN");
          break;
        case 0x4E:
          v6 = CFSTR("PLACECARD_SHOWN_SAFARI");
          break;
        case 0x4F:
          v6 = CFSTR("PLACECARD_SHOWN_SIRI");
          break;
        case 0x50:
          v6 = CFSTR("PLACECARD_SHOWN_SPOTLIGHT");
          break;
        case 0x51:
          v6 = CFSTR("PLACECARD_START_NAV");
          break;
        case 0x52:
          v6 = CFSTR("PROMINENT_GET_DIRECTIONS");
          break;
        case 0x53:
          v6 = CFSTR("RAP_STARTED");
          break;
        case 0x54:
          v6 = CFSTR("RIDESHARE_REQUESTED");
          break;
        case 0x55:
          v6 = CFSTR("SEARCH_NEARBY_CATEGORY_TAPPED");
          break;
        case 0x56:
          v6 = CFSTR("SEARCH_RECENTLY_VIEWED_TAPPED");
          break;
        case 0x57:
          v6 = CFSTR("SEARCH_RECENT_SEARCHES_TAPPED");
          break;
        case 0x58:
          v6 = CFSTR("SEARCH_RESULTS_SHOWN_MAPS");
          break;
        case 0x59:
          v6 = CFSTR("SEARCH_RESULTS_SHOWN_SAFARI");
          break;
        case 0x5A:
          v6 = CFSTR("SEARCH_RESULTS_SHOWN_SIRI");
          break;
        case 0x5B:
          v6 = CFSTR("SEARCH_RESULTS_SHOWN_SPOTLIGHT");
          break;
        case 0x5C:
          v6 = CFSTR("SEARCH_RESULTS_TAPPED_SAFARI");
          break;
        case 0x5D:
          v6 = CFSTR("SEARCH_RESULTS_TAPPED_SIRI");
          break;
        case 0x5E:
          v6 = CFSTR("SEARCH_RESULTS_TAPPED_SPOTLIGHT");
          break;
        case 0x5F:
          v6 = CFSTR("SEARCH_RESULT_TAPPED_MAPS");
          break;
        case 0x60:
          v6 = CFSTR("SEARCH_SUGGESTION_TAPPED");
          break;
        case 0x61:
          v6 = CFSTR("SHARE_DRIVING_ROUTES");
          break;
        case 0x62:
          v6 = CFSTR("SHARE_FAVORITES");
          break;
        case 0x63:
          v6 = CFSTR("SHARE_MYLOCATION");
          break;
        case 0x64:
          v6 = CFSTR("SHARE_TO_DEVICE");
          break;
        case 0x65:
          v6 = CFSTR("SHARE_TRANSIT_ROUTES");
          break;
        case 0x66:
          v6 = CFSTR("SHARE_WALKING_ROUTES");
          break;
        case 0x67:
          v6 = CFSTR("SHOW_MAPS_SETTINGS");
          break;
        case 0x68:
          v6 = CFSTR("SIRI_START_NAV");
          break;
        case 0x69:
          v6 = CFSTR("SNAPSHOTTER_USED");
          break;
        case 0x6A:
          v6 = CFSTR("TAP_COMPASS_MODE");
          break;
        case 0x6B:
          v6 = CFSTR("UGC_PHOTO_SUBMISSION");
          break;
        case 0x6C:
          v6 = CFSTR("UGC_RATING_SUBMISSION");
          break;
        case 0x6D:
          v6 = CFSTR("VLF_CORRECTION_ATTEMPTED");
          break;
        case 0x6E:
          v6 = CFSTR("VLF_CORRECTION_FAILED");
          break;
        case 0x6F:
          v6 = CFSTR("VLF_CORRECTION_SUCCESS");
          break;
        case 0x70:
          v6 = CFSTR("WIDGET_ENTER");
          break;
        case 0x71:
          v6 = CFSTR("JUNCTION_VIEW_SHOWN");
          break;
        case 0x72:
          v6 = CFSTR("ETA_SHARED_DRIVING");
          break;
        case 0x73:
          v6 = CFSTR("ETA_SHARED_WALKING");
          break;
        case 0x74:
          v6 = CFSTR("ETA_SHARED_CYCLING");
          break;
        case 0x75:
          v6 = CFSTR("MAPS_HANDOFF");
          break;
        case 0x76:
          v6 = CFSTR("AR_WALKING_LOCALIZATION_ATTEMPTED");
          break;
        case 0x77:
          v6 = CFSTR("AR_WALKING_LOCALIZATION_FAILED");
          break;
        case 0x78:
          v6 = CFSTR("AR_WALKING_LOCALIZATION_SUCCESS");
          break;
        case 0x79:
          v6 = CFSTR("CURATED_COLLECTIONS_HOME_SHOWN");
          break;
        case 0x7A:
          v6 = CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN");
          break;
        case 0x7B:
          v6 = CFSTR("NEARBY_TRANSIT_SHOWN");
          break;
        case 0x7C:
          v6 = CFSTR("NEARBY_TRANSIT_TAPPED");
          break;
        case 0x7D:
          v6 = CFSTR("SPR_GLOBE_EXPLORED");
          break;
        case 0x7E:
          v6 = CFSTR("SPR_METROS_EXPLORED");
          break;
        case 0x7F:
          v6 = CFSTR("TRANSIT_DETAILS_USED");
          break;
        case 0x80:
          v6 = CFSTR("USER_ACCOUNT_OPENED_ACCOUNT");
          break;
        case 0x81:
          v6 = CFSTR("USER_ACCOUNT_SHOWN");
          break;
        case 0x82:
          v6 = CFSTR("MAP_MODE_DRIVING_SELECTED");
          break;
        case 0x83:
          v6 = CFSTR("MAP_MODE_EXPLORE_SELECTED");
          break;
        case 0x84:
          v6 = CFSTR("MAP_MODE_TRANSIT_SELECTED");
          break;
        case 0x85:
          v6 = CFSTR("MAP_MODE_SATELLITE_SELECTED");
          break;
        case 0x86:
          v6 = CFSTR("MAP_MODE_DRIVING_USED");
          break;
        case 0x87:
          v6 = CFSTR("MAP_MODE_EXPLORE_USED");
          break;
        case 0x88:
          v6 = CFSTR("MAP_MODE_TRANSIT_USED");
          break;
        case 0x89:
          v6 = CFSTR("MAP_MODE_SATELLITE_USED");
          break;
        case 0x8A:
          v6 = CFSTR("WATCH_GET_DIRECTIONS_CYCLING");
          break;
        case 0x8B:
          v6 = CFSTR("WATCH_START_NAV_CYCLING");
          break;
        case 0x8C:
          v6 = CFSTR("WATCH_GET_DIRECTIONS_WALKING");
          break;
        case 0x8D:
          v6 = CFSTR("WATCH_START_NAV_WALKING");
          break;
        case 0x8E:
          v6 = CFSTR("WATCH_GET_DIRECTIONS_TRANSIT");
          break;
        case 0x8F:
          v6 = CFSTR("WATCH_START_NAV_TRANSIT");
          break;
        case 0x90:
          v6 = CFSTR("WATCH_GET_DIRECTIONS_DRIVING");
          break;
        case 0x91:
          v6 = CFSTR("WATCH_START_NAV_DRIVING");
          break;
        case 0x92:
          v6 = CFSTR("ETA_SHARED_TRANSIT");
          break;
        case 0x93:
          v6 = CFSTR("USER_ACCOUNT_OPENED");
          break;
        case 0x94:
          v6 = CFSTR("VENUE_INTERACTION");
          break;
        case 0x95:
          v6 = CFSTR("ENTER_MAPS");
          break;
        case 0x96:
          v6 = CFSTR("EXIT_MAPS");
          break;
        case 0x97:
          v6 = CFSTR("TOTAL_SECONDS_IN_MAPS_DEVICE");
          break;
        case 0x98:
          v6 = CFSTR("ENTER_MAPS_DEVICE");
          break;
        case 0x99:
          v6 = CFSTR("MAP_VIEW_INSTANTIATED");
          break;
        case 0x9A:
          v6 = CFSTR("MAP_VIEW_ACTIVATED");
          break;
        case 0x9B:
          v6 = CFSTR("DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI");
          break;
        case 0x9C:
          v6 = CFSTR("DIRECTIONS_LIST_ITEM_CARPLAY_UI");
          break;
        case 0x9D:
          v6 = CFSTR("DIRECTIONS_FAVORITE_CARPLAY_UI");
          break;
        case 0x9E:
          v6 = CFSTR("GET_DIRECTIONS_CARPLAY_CONNECTED");
          break;
        case 0x9F:
          v6 = CFSTR("DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED");
          break;
        case 0xA0:
          v6 = CFSTR("SIRI_SEARCH_CARPLAY_UI");
          break;
        case 0xA1:
          v6 = CFSTR("OPEN_KEYBOARD_CARPLAY_UI");
          break;
        case 0xA2:
          v6 = CFSTR("TAP_SEARCH_CARPLAY_UI");
          break;
        case 0xA3:
          v6 = CFSTR("OPEN_SEARCH_CARPLAY_UI");
          break;
        case 0xA4:
          v6 = CFSTR("MAPS_SEARCH_CARPLAY_CONNECTED");
          break;
        case 0xA5:
          v6 = CFSTR("EXIT_MAPS_CARPLAY");
          break;
        case 0xA6:
          v6 = CFSTR("TOTAL_SECONDS_IN_MAPS_CARPLAY");
          break;
        case 0xA7:
          v6 = CFSTR("NAV_FEEDBACK_DRIVING");
          break;
        case 0xA8:
          v6 = CFSTR("TRIP_COMPLETED_DRIVING");
          break;
        case 0xA9:
          v6 = CFSTR("HAS_REROUTE_DRIVING");
          break;
        case 0xAA:
          v6 = CFSTR("ETA_OVERESTIMATE_DRIVING");
          break;
        case 0xAB:
          v6 = CFSTR("EXTREME_ETA_OVERESTIMATE_DRIVING");
          break;
        case 0xAC:
          v6 = CFSTR("ETA_UNDERESTIMATE_DRIVING");
          break;
        case 0xAD:
          v6 = CFSTR("EXTREME_ETA_UNDERESTIMATE_DRIVING");
          break;
        case 0xAE:
          v6 = CFSTR("RAP_GOOD_TRIP");
          break;
        case 0xAF:
          v6 = CFSTR("ENRICHED_RESULTS_SHOWN_MAPS");
          break;
        case 0xB0:
          v6 = CFSTR("TAP_TRANSIT_TIPKIT");
          break;
        case 0xB1:
          v6 = CFSTR("ADD_STOP_CARPLAY");
          break;
        case 0xB2:
          v6 = CFSTR("ADD_STOP_CARPLAY_SIRI");
          break;
        case 0xB3:
          v6 = CFSTR("ADD_STOP_DEVICE");
          break;
        case 0xB4:
          v6 = CFSTR("ADD_STOP_DEVICE_SIRI");
          break;
        case 0xB5:
          v6 = CFSTR("SHOWCASE_SHOWN");
          break;
        case 0xB6:
          v6 = CFSTR("SHOWCASE_TAPPED");
          break;
        case 0xB7:
          v6 = CFSTR("PUNCH_IN_SIRI");
          break;
        case 0xB8:
          v6 = CFSTR("PUNCH_IN_SAFARI");
          break;
        case 0xB9:
          v6 = CFSTR("PUNCH_IN_SPOTLIGHT");
          break;
        case 0xBA:
          v6 = CFSTR("PUNCH_IN_SMS");
          break;
        case 0xBB:
          v6 = CFSTR("PUNCH_IN_FINDMY");
          break;
        case 0xBC:
          v6 = CFSTR("PUNCH_IN_OTHER_2ND_PARTY");
          break;
        case 0xBD:
          v6 = CFSTR("PUNCH_IN_3RD_PARTY");
          break;
        case 0xBF:
          v6 = CFSTR("RAP_SUBMITTED");
          break;
        case 0xC0:
          v6 = CFSTR("ARP_PHOTO_SUBMISSION");
          break;
        case 0xC1:
          v6 = CFSTR("ARP_RATING_SUBMISSION");
          break;
        case 0xC2:
          v6 = CFSTR("TRAFFIC_INCIDENT_REPORT");
          break;
        case 0xC3:
          v6 = CFSTR("TRAFFIC_INCIDENT_CONFIRM");
          break;
        case 0xC4:
          v6 = CFSTR("TRAFFIC_INCIDENT_DISMISS");
          break;
        case 0xC5:
          v6 = CFSTR("TRAFFIC_INCIDENT_CLEAR");
          break;
        case 0xC6:
          v6 = CFSTR("MODERN_MAP_EXPLORED");
          break;
        case 0xC7:
          v6 = CFSTR("CARPLAY_ROUTING_UI_USED");
          break;
        case 0xC8:
          v6 = CFSTR("CARPLAY_SEARCH_UI_USED");
          break;
        case 0xC9:
          v6 = CFSTR("ANNOUNCEMENT_DISPLAYED");
          break;
        case 0xCA:
          v6 = CFSTR("ANNOUNCEMENT_TAPPED");
          break;
        case 0xCB:
          v6 = CFSTR("POSITIVE_SEARCH_ENGAGEMENT");
          break;
        case 0xCC:
          v6 = CFSTR("PUNCH_OUT_FINDMY");
          break;
        case 0xCD:
          v6 = CFSTR("WATCH_START_NAV");
          break;
        case 0xCE:
          v6 = CFSTR("HIKING_ENGAGEMENT");
          break;
        case 0xCF:
          v6 = CFSTR("HIKING_PLACECARD");
          break;
        case 0xD0:
          v6 = CFSTR("NO_SEARCH_RESULTS");
          break;
        case 0xD1:
          v6 = CFSTR("PUNCH_IN_SHOWCASE");
          break;
        case 0xD2:
          v6 = CFSTR("SHARED_LOCATION_ENGAGEMENT");
          break;
        case 0xD3:
          v6 = CFSTR("SHARE_SHOWCASE");
          break;
        case 0xD4:
          v6 = CFSTR("WATCH_MAP_VIEW");
          break;
        case 0xD5:
          v6 = CFSTR("WATCH_PLACECARD");
          break;
        case 0xD6:
          v6 = CFSTR("WATCH_SEARCH");
          break;
        case 0xD7:
          v6 = CFSTR("CURATED_HIKE_SAVED");
          break;
        case 0xD8:
          v6 = CFSTR("CUSTOM_HIKE_SAVED");
          break;
        case 0xD9:
          v6 = CFSTR("CUSTOM_HIKE_CREATION_TRAY_SHOWN");
          break;
        case 0xDA:
          v6 = CFSTR("DIRECTIONS_REQUESTED_CURATED_HIKE");
          break;
        case 0xDB:
          v6 = CFSTR("DIRECTIONS_REQUESTED_CUSTOM_HIKE");
          break;
        case 0xDC:
          v6 = CFSTR("NAV_STARTED_CURATED_HIKE");
          break;
        case 0xDD:
          v6 = CFSTR("NAV_STARTED_CUSTOM_HIKE");
          break;
        case 0xDE:
          v6 = CFSTR("ROUTING_TRAY_CURATED_HIKE_SHOWN");
          break;
        case 0xDF:
          v6 = CFSTR("ROUTING_TRAY_CUSTOM_HIKE_SHOWN");
          break;
        case 0xE0:
          v6 = CFSTR("SEARCH_PHOTO_INTERACTION");
          break;
        case 0xE1:
          v6 = CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS");
          break;
        case 0xE2:
          v6 = CFSTR("LIBRARY_INTERACTION");
          break;
        case 0xE3:
          v6 = CFSTR("SEARCH_FILTER_INTERACTION");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2)
        v7 = CFSTR("eventType");
      else
        v7 = CFSTR("event_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 32);
    }
    if ((v5 & 1) != 0)
    {
      v8 = *(int *)(a1 + 16);
      if (v8 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E1C230E8[v8];
      }
      if (a2)
        v10 = CFSTR("appType");
      else
        v10 = CFSTR("app_type");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      v5 = *(_BYTE *)(a1 + 32);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("count"));

      v5 = *(_BYTE *)(a1 + 32);
    }
    if ((v5 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("usageBool"));

    }
    objc_msgSend((id)a1, "usageString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("usageString"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODailyUseSummaryUseEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODailyUseSummaryUseEvent)initWithDictionary:(id)a3
{
  return (GEODailyUseSummaryUseEvent *)-[GEODailyUseSummaryUseEvent _initWithDictionary:isJSON:](self, a3, 0);
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
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a2;
  if (!a1)
    goto LABEL_492;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_492;
  if (a3)
    v6 = CFSTR("eventType");
  else
    v6 = CFSTR("event_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_EVENT")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ACCIDENT_CONFIRMATION")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ACCIDENT_SUBMISSION")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADD_LICENSE_PLATE")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_FLYOVER")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_GENERAL")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_LOOK_AROUND")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_TRANSIT")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_UNKNOWN")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED_VENUES")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_FLYOVER")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_GENERAL")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_LANE_GUIDANCE")) & 1) != 0)
    {
      v9 = 15;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_LOOK_AROUND")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_TRANSIT")) & 1) != 0)
    {
      v9 = 17;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_UNKNOWN")) & 1) != 0)
    {
      v9 = 18;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED_VENUES")) & 1) != 0)
    {
      v9 = 19;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("APP_CLIP_USED")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_MODE_ENTER")) & 1) != 0)
    {
      v9 = 21;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULTS_SHOWN")) & 1) != 0)
    {
      v9 = 22;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CARPLAY_CONNECTED")) & 1) != 0)
    {
      v9 = 23;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COARSE_LOCATION_USED")) & 1) != 0)
    {
      v9 = 24;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COLLECTION_CREATED")) & 1) != 0)
    {
      v9 = 25;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COLLECTION_ITEM_TAPPED")) & 1) != 0)
    {
      v9 = 26;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COLLECTION_SHARED")) & 1) != 0)
    {
      v9 = 27;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COLLECTION_SHOWN")) & 1) != 0)
    {
      v9 = 28;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_COLLECTION_ITEM_TAPPED")) & 1) != 0)
    {
      v9 = 29;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_COLLECTION_REMOVED")) & 1) != 0)
    {
      v9 = 30;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_COLLECTION_SAVED")) & 1) != 0)
    {
      v9 = 31;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_COLLECTION_SHARED")) & 1) != 0)
    {
      v9 = 32;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_COLLECTION_SHOWN")) & 1) != 0)
    {
      v9 = 33;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DEVICE_CONNECTED")) & 1) != 0)
    {
      v9 = 34;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
    {
      v9 = 35;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_CYCLING")) & 1) != 0)
    {
      v9 = 36;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_DRIVING")) & 1) != 0)
    {
      v9 = 37;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_EBIKE")) & 1) != 0)
    {
      v9 = 38;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_EV_ROUTING")) & 1) != 0)
    {
      v9 = 39;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_TRANSIT")) & 1) != 0)
    {
      v9 = 40;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_WALKING")) & 1) != 0)
    {
      v9 = 41;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_SAFARI")) & 1) != 0)
    {
      v9 = 42;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_SIRI_PLACECARD")) & 1) != 0)
    {
      v9 = 43;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_SPOTLIGHT")) & 1) != 0)
    {
      v9 = 44;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENTER_MAPS_CARPLAY")) & 1) != 0)
    {
      v9 = 45;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENTER_VENUE_EXPERIENCE")) & 1) != 0)
    {
      v9 = 46;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_RECEIVED")) & 1) != 0)
    {
      v9 = 47;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_SHARED")) & 1) != 0)
    {
      v9 = 48;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAVORITE_ADD_PLACE")) & 1) != 0)
    {
      v9 = 49;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAVORITE_TAP_LIST_ITEM")) & 1) != 0)
    {
      v9 = 50;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FLYOVER_FOREGROUNDED")) & 1) != 0)
    {
      v9 = 51;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INCIDENT_SUBMISSION")) & 1) != 0)
    {
      v9 = 52;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOOK_AROUND_FOREGROUNDED")) & 1) != 0)
    {
      v9 = 53;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOOK_AROUND_SHARED")) & 1) != 0)
    {
      v9 = 54;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPSHOME_GET_DIRECTIONS")) & 1) != 0)
    {
      v9 = 55;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_IPAD")) & 1) != 0)
    {
      v9 = 56;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_MAC")) & 1) != 0)
    {
      v9 = 57;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_PHONE")) & 1) != 0)
    {
      v9 = 58;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_HANDOFF_FROM_WATCH")) & 1) != 0)
    {
      v9 = 59;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_VIEW_FOREGROUNDED")) & 1) != 0)
    {
      v9 = 60;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_SESSION_COARSE_LOCATION")) & 1) != 0)
    {
      v9 = 61;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_SESSION_PRECISE_LOCATION")) & 1) != 0)
    {
      v9 = 62;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_CARPLAY")) & 1) != 0)
    {
      v9 = 63;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_CYCLING")) & 1) != 0)
    {
      v9 = 64;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_DRIVING")) & 1) != 0)
    {
      v9 = 65;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_EBIKE")) & 1) != 0)
    {
      v9 = 66;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_EV_ROUTING")) & 1) != 0)
    {
      v9 = 67;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_JUNCTION_VIEW")) & 1) != 0)
    {
      v9 = 68;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_LANE_GUIDANCE")) & 1) != 0)
    {
      v9 = 69;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_TRANSIT")) & 1) != 0)
    {
      v9 = 70;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_WALKING")) & 1) != 0)
    {
      v9 = 71;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OPEN_INDOOR_MAP")) & 1) != 0)
    {
      v9 = 72;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OTHER_GET_DIRECTIONS")) & 1) != 0)
    {
      v9 = 73;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_GET_DIRECTIONS")) & 1) != 0)
    {
      v9 = 74;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_RICH_DATA_USED")) & 1) != 0)
    {
      v9 = 75;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_SHARED")) & 1) != 0)
    {
      v9 = 76;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_SHOWN")) & 1) != 0)
    {
      v9 = 77;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_SHOWN_SAFARI")) & 1) != 0)
    {
      v9 = 78;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_SHOWN_SIRI")) & 1) != 0)
    {
      v9 = 79;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_SHOWN_SPOTLIGHT")) & 1) != 0)
    {
      v9 = 80;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACECARD_START_NAV")) & 1) != 0)
    {
      v9 = 81;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROMINENT_GET_DIRECTIONS")) & 1) != 0)
    {
      v9 = 82;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RAP_STARTED")) & 1) != 0)
    {
      v9 = 83;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RIDESHARE_REQUESTED")) & 1) != 0)
    {
      v9 = 84;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_NEARBY_CATEGORY_TAPPED")) & 1) != 0)
    {
      v9 = 85;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RECENTLY_VIEWED_TAPPED")) & 1) != 0)
    {
      v9 = 86;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RECENT_SEARCHES_TAPPED")) & 1) != 0)
    {
      v9 = 87;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_MAPS")) & 1) != 0)
    {
      v9 = 88;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_SAFARI")) & 1) != 0)
    {
      v9 = 89;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_SIRI")) & 1) != 0)
    {
      v9 = 90;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_SHOWN_SPOTLIGHT")) & 1) != 0)
    {
      v9 = 91;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_TAPPED_SAFARI")) & 1) != 0)
    {
      v9 = 92;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_TAPPED_SIRI")) & 1) != 0)
    {
      v9 = 93;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_TAPPED_SPOTLIGHT")) & 1) != 0)
    {
      v9 = 94;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULT_TAPPED_MAPS")) & 1) != 0)
    {
      v9 = 95;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_SUGGESTION_TAPPED")) & 1) != 0)
    {
      v9 = 96;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_DRIVING_ROUTES")) & 1) != 0)
    {
      v9 = 97;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_FAVORITES")) & 1) != 0)
    {
      v9 = 98;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_MYLOCATION")) & 1) != 0)
    {
      v9 = 99;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_TO_DEVICE")) & 1) != 0)
    {
      v9 = 100;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_TRANSIT_ROUTES")) & 1) != 0)
    {
      v9 = 101;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_WALKING_ROUTES")) & 1) != 0)
    {
      v9 = 102;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHOW_MAPS_SETTINGS")) & 1) != 0)
    {
      v9 = 103;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SIRI_START_NAV")) & 1) != 0)
    {
      v9 = 104;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SNAPSHOTTER_USED")) & 1) != 0)
    {
      v9 = 105;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TAP_COMPASS_MODE")) & 1) != 0)
    {
      v9 = 106;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UGC_PHOTO_SUBMISSION")) & 1) != 0)
    {
      v9 = 107;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UGC_RATING_SUBMISSION")) & 1) != 0)
    {
      v9 = 108;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLF_CORRECTION_ATTEMPTED")) & 1) != 0)
    {
      v9 = 109;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLF_CORRECTION_FAILED")) & 1) != 0)
    {
      v9 = 110;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLF_CORRECTION_SUCCESS")) & 1) != 0)
    {
      v9 = 111;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WIDGET_ENTER")) & 1) != 0)
    {
      v9 = 112;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("JUNCTION_VIEW_SHOWN")) & 1) != 0)
    {
      v9 = 113;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_SHARED_DRIVING")) & 1) != 0)
    {
      v9 = 114;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_SHARED_WALKING")) & 1) != 0)
    {
      v9 = 115;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_SHARED_CYCLING")) & 1) != 0)
    {
      v9 = 116;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_HANDOFF")) & 1) != 0)
    {
      v9 = 117;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_WALKING_LOCALIZATION_ATTEMPTED")) & 1) != 0)
    {
      v9 = 118;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_WALKING_LOCALIZATION_FAILED")) & 1) != 0)
    {
      v9 = 119;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_WALKING_LOCALIZATION_SUCCESS")) & 1) != 0)
    {
      v9 = 120;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_SHOWN")) & 1) != 0)
    {
      v9 = 121;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN")) & 1) != 0)
    {
      v9 = 122;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NEARBY_TRANSIT_SHOWN")) & 1) != 0)
    {
      v9 = 123;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NEARBY_TRANSIT_TAPPED")) & 1) != 0)
    {
      v9 = 124;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SPR_GLOBE_EXPLORED")) & 1) != 0)
    {
      v9 = 125;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SPR_METROS_EXPLORED")) & 1) != 0)
    {
      v9 = 126;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_DETAILS_USED")) & 1) != 0)
    {
      v9 = 127;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("USER_ACCOUNT_OPENED_ACCOUNT")) & 1) != 0)
    {
      v9 = 128;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("USER_ACCOUNT_SHOWN")) & 1) != 0)
    {
      v9 = 129;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_DRIVING_SELECTED")) & 1) != 0)
    {
      v9 = 130;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_EXPLORE_SELECTED")) & 1) != 0)
    {
      v9 = 131;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_TRANSIT_SELECTED")) & 1) != 0)
    {
      v9 = 132;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_SATELLITE_SELECTED")) & 1) != 0)
    {
      v9 = 133;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_DRIVING_USED")) & 1) != 0)
    {
      v9 = 134;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_EXPLORE_USED")) & 1) != 0)
    {
      v9 = 135;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_TRANSIT_USED")) & 1) != 0)
    {
      v9 = 136;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MODE_SATELLITE_USED")) & 1) != 0)
    {
      v9 = 137;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_CYCLING")) & 1) != 0)
    {
      v9 = 138;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_START_NAV_CYCLING")) & 1) != 0)
    {
      v9 = 139;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_WALKING")) & 1) != 0)
    {
      v9 = 140;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_START_NAV_WALKING")) & 1) != 0)
    {
      v9 = 141;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_TRANSIT")) & 1) != 0)
    {
      v9 = 142;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_START_NAV_TRANSIT")) & 1) != 0)
    {
      v9 = 143;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_GET_DIRECTIONS_DRIVING")) & 1) != 0)
    {
      v9 = 144;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_START_NAV_DRIVING")) & 1) != 0)
    {
      v9 = 145;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_SHARED_TRANSIT")) & 1) != 0)
    {
      v9 = 146;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("USER_ACCOUNT_OPENED")) & 1) != 0)
    {
      v9 = 147;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VENUE_INTERACTION")) & 1) != 0)
    {
      v9 = 148;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENTER_MAPS")) & 1) != 0)
    {
      v9 = 149;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EXIT_MAPS")) & 1) != 0)
    {
      v9 = 150;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TOTAL_SECONDS_IN_MAPS_DEVICE")) & 1) != 0)
    {
      v9 = 151;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENTER_MAPS_DEVICE")) & 1) != 0)
    {
      v9 = 152;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_VIEW_INSTANTIATED")) & 1) != 0)
    {
      v9 = 153;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_VIEW_ACTIVATED")) & 1) != 0)
    {
      v9 = 154;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI")) & 1) != 0)
    {
      v9 = 155;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_LIST_ITEM_CARPLAY_UI")) & 1) != 0)
    {
      v9 = 156;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_FAVORITE_CARPLAY_UI")) & 1) != 0)
    {
      v9 = 157;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GET_DIRECTIONS_CARPLAY_CONNECTED")) & 1) != 0)
    {
      v9 = 158;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED")) & 1) != 0)
    {
      v9 = 159;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SIRI_SEARCH_CARPLAY_UI")) & 1) != 0)
    {
      v9 = 160;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OPEN_KEYBOARD_CARPLAY_UI")) & 1) != 0)
    {
      v9 = 161;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TAP_SEARCH_CARPLAY_UI")) & 1) != 0)
    {
      v9 = 162;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OPEN_SEARCH_CARPLAY_UI")) & 1) != 0)
    {
      v9 = 163;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_SEARCH_CARPLAY_CONNECTED")) & 1) != 0)
    {
      v9 = 164;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EXIT_MAPS_CARPLAY")) & 1) != 0)
    {
      v9 = 165;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TOTAL_SECONDS_IN_MAPS_CARPLAY")) & 1) != 0)
    {
      v9 = 166;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_FEEDBACK_DRIVING")) & 1) != 0)
    {
      v9 = 167;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRIP_COMPLETED_DRIVING")) & 1) != 0)
    {
      v9 = 168;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HAS_REROUTE_DRIVING")) & 1) != 0)
    {
      v9 = 169;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_OVERESTIMATE_DRIVING")) & 1) != 0)
    {
      v9 = 170;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EXTREME_ETA_OVERESTIMATE_DRIVING")) & 1) != 0)
    {
      v9 = 171;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_UNDERESTIMATE_DRIVING")) & 1) != 0)
    {
      v9 = 172;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EXTREME_ETA_UNDERESTIMATE_DRIVING")) & 1) != 0)
    {
      v9 = 173;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RAP_GOOD_TRIP")) & 1) != 0)
    {
      v9 = 174;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENRICHED_RESULTS_SHOWN_MAPS")) & 1) != 0)
    {
      v9 = 175;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TAP_TRANSIT_TIPKIT")) & 1) != 0)
    {
      v9 = 176;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADD_STOP_CARPLAY")) & 1) != 0)
    {
      v9 = 177;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADD_STOP_CARPLAY_SIRI")) & 1) != 0)
    {
      v9 = 178;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADD_STOP_DEVICE")) & 1) != 0)
    {
      v9 = 179;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADD_STOP_DEVICE_SIRI")) & 1) != 0)
    {
      v9 = 180;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHOWCASE_SHOWN")) & 1) != 0)
    {
      v9 = 181;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHOWCASE_TAPPED")) & 1) != 0)
    {
      v9 = 182;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_SIRI")) & 1) != 0)
    {
      v9 = 183;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_SAFARI")) & 1) != 0)
    {
      v9 = 184;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_SPOTLIGHT")) & 1) != 0)
    {
      v9 = 185;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_SMS")) & 1) != 0)
    {
      v9 = 186;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_FINDMY")) & 1) != 0)
    {
      v9 = 187;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_OTHER_2ND_PARTY")) & 1) != 0)
    {
      v9 = 188;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_3RD_PARTY")) & 1) != 0)
    {
      v9 = 189;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RAP_SUBMITTED")) & 1) != 0)
    {
      v9 = 191;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARP_PHOTO_SUBMISSION")) & 1) != 0)
    {
      v9 = 192;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARP_RATING_SUBMISSION")) & 1) != 0)
    {
      v9 = 193;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_REPORT")) & 1) != 0)
    {
      v9 = 194;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_CONFIRM")) & 1) != 0)
    {
      v9 = 195;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_DISMISS")) & 1) != 0)
    {
      v9 = 196;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_CLEAR")) & 1) != 0)
    {
      v9 = 197;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MODERN_MAP_EXPLORED")) & 1) != 0)
    {
      v9 = 198;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CARPLAY_ROUTING_UI_USED")) & 1) != 0)
    {
      v9 = 199;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CARPLAY_SEARCH_UI_USED")) & 1) != 0)
    {
      v9 = 200;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_DISPLAYED")) & 1) != 0)
    {
      v9 = 201;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ANNOUNCEMENT_TAPPED")) & 1) != 0)
    {
      v9 = 202;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("POSITIVE_SEARCH_ENGAGEMENT")) & 1) != 0)
    {
      v9 = 203;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_OUT_FINDMY")) & 1) != 0)
    {
      v9 = 204;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_START_NAV")) & 1) != 0)
    {
      v9 = 205;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HIKING_ENGAGEMENT")) & 1) != 0)
    {
      v9 = 206;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HIKING_PLACECARD")) & 1) != 0)
    {
      v9 = 207;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NO_SEARCH_RESULTS")) & 1) != 0)
    {
      v9 = 208;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PUNCH_IN_SHOWCASE")) & 1) != 0)
    {
      v9 = 209;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARED_LOCATION_ENGAGEMENT")) & 1) != 0)
    {
      v9 = 210;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARE_SHOWCASE")) & 1) != 0)
    {
      v9 = 211;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_MAP_VIEW")) & 1) != 0)
    {
      v9 = 212;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_PLACECARD")) & 1) != 0)
    {
      v9 = 213;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WATCH_SEARCH")) & 1) != 0)
    {
      v9 = 214;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CURATED_HIKE_SAVED")) & 1) != 0)
    {
      v9 = 215;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CUSTOM_HIKE_SAVED")) & 1) != 0)
    {
      v9 = 216;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CUSTOM_HIKE_CREATION_TRAY_SHOWN")) & 1) != 0)
    {
      v9 = 217;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_CURATED_HIKE")) & 1) != 0)
    {
      v9 = 218;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUESTED_CUSTOM_HIKE")) & 1) != 0)
    {
      v9 = 219;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_CURATED_HIKE")) & 1) != 0)
    {
      v9 = 220;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV_STARTED_CUSTOM_HIKE")) & 1) != 0)
    {
      v9 = 221;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUTING_TRAY_CURATED_HIKE_SHOWN")) & 1) != 0)
    {
      v9 = 222;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUTING_TRAY_CUSTOM_HIKE_SHOWN")) & 1) != 0)
    {
      v9 = 223;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_PHOTO_INTERACTION")) & 1) != 0)
    {
      v9 = 224;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMPLETE_DOWNLOAD_OFFLINE_MAPS")) & 1) != 0)
    {
      v9 = 225;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIBRARY_INTERACTION")) & 1) != 0)
    {
      v9 = 226;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_FILTER_INTERACTION")))
    {
      v9 = 227;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_466;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setEventType:", v9);
LABEL_466:

  if (a3)
    v10 = CFSTR("appType");
  else
    v10 = CFSTR("app_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FIRST_PARTY")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SECOND_PARTY")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("THIRD_PARTY")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("DAEMONS")) & 1) != 0)
    {
      v13 = 3;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("END_SENTINEL")))
    {
      v13 = 4;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_484;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_484:
    objc_msgSend(a1, "setAppType:", v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCount:", objc_msgSend(v14, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("usageBool"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUsageBool:", objc_msgSend(v15, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("usageString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(a1, "setUsageString:", v17);

  }
LABEL_492:

  return a1;
}

- (GEODailyUseSummaryUseEvent)initWithJSON:(id)a3
{
  return (GEODailyUseSummaryUseEvent *)-[GEODailyUseSummaryUseEvent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEODailyUseSummaryUseEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODailyUseSummaryUseEventReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_6:
  if (self->_usageString)
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
  -[GEODailyUseSummaryUseEvent readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_eventType;
    *((_BYTE *)v6 + 32) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 4) = self->_appType;
  *((_BYTE *)v6 + 32) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v6 + 5) = self->_count;
  *((_BYTE *)v6 + 32) |= 2u;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((_BYTE *)v6 + 28) = self->_usageBool;
    *((_BYTE *)v6 + 32) |= 8u;
  }
LABEL_6:
  if (self->_usageString)
  {
    objc_msgSend(v6, "setUsageString:");
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
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(_BYTE *)(v5 + 32) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_count;
      *(_BYTE *)(v5 + 32) |= 2u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_appType;
  *(_BYTE *)(v5 + 32) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 28) = self->_usageBool;
    *(_BYTE *)(v5 + 32) |= 8u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_usageString, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSString *usageString;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEODailyUseSummaryUseEvent readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_eventType != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_appType != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_count != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_27;
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 32) & 8) == 0)
    goto LABEL_21;
  if (!self->_usageBool)
  {
    if (!*((_BYTE *)v4 + 28))
      goto LABEL_27;
    goto LABEL_21;
  }
  if (!*((_BYTE *)v4 + 28))
    goto LABEL_21;
LABEL_27:
  usageString = self->_usageString;
  if ((unint64_t)usageString | *((_QWORD *)v4 + 1))
    v5 = -[NSString isEqual:](usageString, "isEqual:");
  else
    v5 = 1;
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEODailyUseSummaryUseEvent readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_eventType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_appType;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_usageString, "hash");
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_count;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_usageBool;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_usageString, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 32);
  if ((v5 & 4) != 0)
  {
    self->_eventType = *((_DWORD *)v6 + 6);
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v6 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v6 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_appType = *((_DWORD *)v6 + 4);
  *(_BYTE *)&self->_flags |= 1u;
  v5 = *((_BYTE *)v6 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_count = *((_DWORD *)v6 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v6 + 32) & 8) != 0)
  {
LABEL_5:
    self->_usageBool = *((_BYTE *)v6 + 28);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_6:
  if (*((_QWORD *)v6 + 1))
  {
    -[GEODailyUseSummaryUseEvent setUsageString:](self, "setUsageString:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageString, 0);
}

@end
