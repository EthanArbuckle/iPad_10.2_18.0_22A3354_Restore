@implementation MKSiriInteraction

- (MKSiriInteraction)initWithGEOUIAction:(int)a3 target:(int)a4 mapItem:(id)a5 resultIndex:(int)a6 searchCategory:(id)a7 searchQueryString:(id)a8
{
  id v15;
  id v16;
  id v17;
  MKSiriInteraction *v18;
  MKSiriInteraction *v19;
  objc_super v21;

  v15 = a5;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MKSiriInteraction;
  v18 = -[MKSiriInteraction init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_action = a3;
    v18->_target = a4;
    objc_storeStrong((id *)&v18->_mapItem, a5);
    v19->_resultIndex = a6;
    objc_storeStrong((id *)&v19->_searchCategory, a7);
    objc_storeStrong((id *)&v19->_searchQueryString, a8);
  }

  return v19;
}

- (id)intentIfWanted
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int target;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MKSiriInteraction _isValidTargetForNavUI:](self, "_isValidTargetForNavUI:", self->_target);
  target = self->_target;
  if ((target - 803) < 2)
  {
    -[MKSiriInteraction _whiteListedSiriListActionAsString:](self, "_whiteListedSiriListActionAsString:", self->_action);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = 0;
    v7 = CFSTR("ResultListTap");
  }
  else if (target == 501 || target == 201)
  {
    if (self->_action == 21)
      v7 = CFSTR("Show");
    else
      v7 = CFSTR("PlaceCardTap");
    -[MKSiriInteraction _whiteListedPlaceCardActionAsString:](self, "_whiteListedPlaceCardActionAsString:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = 0;
  }
  else if (v5)
  {
    -[MKSiriInteraction _whiteListedNavigationActionAsString:](self, "_whiteListedNavigationActionAsString:", self->_action);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKSiriInteraction navigationHash](MKSiriInteraction, "navigationHash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MKSiriInteraction _isStartNavigationAction:](self, "_isStartNavigationAction:", self->_action))
    {
      if (self->_target == 104)
      {
        v7 = CFSTR("Navigation");
        v10 = CFSTR("Search Along the Route");
      }
      else
      {
        if (!s_navStartedTimer)
        {
          objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__navTimerFired_, 0, 0, 30.0);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)s_navStartedTimer;
          s_navStartedTimer = v37;

        }
        v7 = CFSTR("Navigation");
        v10 = CFSTR("New Request");
      }
    }
    else
    {
      if (self->_action == 3002)
      {
        +[MKSiriInteraction setNavigationHash:](MKSiriInteraction, "setNavigationHash:", 0);
        objc_msgSend((id)s_navStartedTimer, "invalidate");
        v36 = (void *)s_navStartedTimer;
        s_navStartedTimer = 0;

      }
      v10 = 0;
      v7 = CFSTR("Navigation");
    }
  }
  else if (target == 101)
  {
    -[MKSiriInteraction _whiteListedSearchActionAsString:](self, "_whiteListedSearchActionAsString:", self->_action);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = 0;
    v7 = CFSTR("Search");
  }
  else if (target == 9)
  {
    -[MKSiriInteraction _whiteListedBrowseCategoryActionAsString:](self, "_whiteListedBrowseCategoryActionAsString:", self->_action);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = 0;
    v7 = CFSTR("SelectCategory");
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v8 = 0;
    v7 = 0;
  }
  if (-[MKMapItem _muid](self->_mapItem, "_muid")
    || (-[MKMapItem _shortAddress](self->_mapItem, "_shortAddress"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    if (-[MKMapItem _muid](self->_mapItem, "_muid"))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), -[MKMapItem _muid](self->_mapItem, "_muid"));
    else
      -[MKMapItem _shortAddress](self->_mapItem, "_shortAddress");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1E20DFC00;
  }
  v13 = 0;
  if (v7 && v8 && v12)
  {
    v42 = v12;
    v43 = (__CFString *)v10;
    v49[0] = CFSTR("element");
    v49[1] = CFSTR("poi_identifier");
    v50[0] = v8;
    v50[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v9)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("nav_identifier"));
    -[MKMapItem name](self->_mapItem, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      -[MKMapItem name](self->_mapItem, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("title"));

    }
    -[MKMapItem _firstLocalizedCategoryName](self->_mapItem, "_firstLocalizedCategoryName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      -[MKMapItem _firstLocalizedCategoryName](self->_mapItem, "_firstLocalizedCategoryName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("category_type"));

    }
    -[GEOSearchCategory popularTokenString](self->_searchCategory, "popularTokenString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23)
    {
      -[GEOSearchCategory popularTokenString](self->_searchCategory, "popularTokenString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("category_type"));

    }
    if (-[NSString length](self->_searchQueryString, "length"))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", self->_searchQueryString, CFSTR("input"));
    -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addressDictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v39 = v7;
      v40 = v9;
      v41 = v8;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v45 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v27, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v29);
      }

      v8 = v41;
      v7 = v39;
      v9 = v40;
    }
    if (self->_resultIndex != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v34, CFSTR("resultIndex"));

    }
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v4, CFSTR("source"));
    if (-[__CFString length](v43, "length"))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v43, CFSTR("navigationType"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD970]), "initWithDomain:verb:parametersByName:", CFSTR("Maps"), v7, v15);

    v12 = v42;
  }

  return v13;
}

- (void)donateIfWanted
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MKSiriInteraction intentIfWanted](self, "intentIfWanted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v3, 0);
    if (-[MKSiriInteraction _isIntentDeletable](self, "_isIntentDeletable"))
    {
      -[MKSiriInteraction _siriIntentHash:](self, "_siriIntentHash:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGroupIdentifier:", v5);

    }
    objc_msgSend(v4, "donateInteractionWithCompletion:", 0);

    v3 = v6;
  }

}

- (id)_siriIntentHash:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[MKSiriInteraction _isIntentDeletable](self, "_isIntentDeletable", a3))
  {
    if (-[NSString length](self->_searchQueryString, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input=%@"), self->_searchQueryString);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6;
      if (v6)
      {
        if (objc_msgSend(v6, "_hasMUID"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("muid=%llu"), objc_msgSend(v4, "_muid"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:", v7);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "addressObject");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "fullAddressWithMultiline:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("address=%@"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:", v10);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v5 = 0;
      }
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_isIntentDeletable
{
  int target;

  target = self->_target;
  if (target == 501 || target == 201)
  {
    if (self->_action != 21)
      return 0;
  }
  else if (target != 101 || self->_action != 2014)
  {
    return 0;
  }
  return 1;
}

+ (void)removeRecentIntentWithPlacemark:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    objc_msgSend(a3, "_geoMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v11 = v3;
      if (objc_msgSend(v3, "_hasMUID"))
      {
        v4 = (void *)MEMORY[0x1E0CBD9A8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("muid=%llu"), objc_msgSend(v11, "_muid"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deleteInteractionsWithGroupIdentifier:completion:", v6, 0);
      }
      else
      {
        objc_msgSend(v11, "addressObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CBD9A8];
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "fullAddressWithMultiline:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("address=%@"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deleteInteractionsWithGroupIdentifier:completion:", v10, 0);

      }
      v3 = v11;
    }

  }
}

+ (void)removeRecentIntentWithSearchText:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = (const __CFString *)a3;
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E20DFC00;
  v5 = (void *)MEMORY[0x1E0CBD9A8];
  v8 = (__CFString *)v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input=%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteInteractionsWithGroupIdentifier:completion:", v7, 0);

}

- (BOOL)_isValidTargetForNavUI:(int)a3
{
  BOOL result;

  result = 1;
  if (a3 > 400)
  {
    if ((a3 - 401) >= 3 && a3 != 802)
      return 0;
  }
  else if ((a3 - 301) >= 3 && a3 != 104)
  {
    return 0;
  }
  return result;
}

- (id)_whiteListedPlaceCardActionAsString:(int)a3
{
  BOOL v3;
  uint64_t action;
  __CFString *v5;
  id result;

  v3 = (a3 - 6003) > 0x12 || ((1 << (a3 - 115)) & 0x607F1) == 0;
  if (v3 && a3 != 3001 && a3 != 21)
  {
    v5 = 0;
    return v5;
  }
  action = self->_action;
  if ((int)action > 4000)
  {
    if ((int)action <= 10100)
    {
      if ((int)action > 7000)
      {
        switch((int)action)
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
            goto LABEL_55;
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
            switch((int)action)
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
                switch((int)action)
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
                    goto LABEL_55;
                }
                break;
            }
            break;
        }
      }
      else
      {
        switch((int)action)
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
            goto LABEL_55;
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
            switch((int)action)
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
                goto LABEL_55;
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
                switch((int)action)
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
                    goto LABEL_55;
                }
                break;
            }
            break;
        }
      }
    }
    else if ((int)action > 13000)
    {
      if ((int)action <= 16000)
      {
        if ((int)action > 15000)
        {
          switch((_DWORD)action)
          {
            case 0x3A99:
              return CFSTR("ORB_PEEK");
            case 0x3A9A:
              return CFSTR("ORB_POP");
            case 0x3A9B:
              return CFSTR("ORB_DISMISS");
          }
LABEL_55:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), action);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          return v5;
        }
        switch((int)action)
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
            switch((int)action)
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
                goto LABEL_55;
            }
            break;
        }
      }
      else
      {
        switch((int)action)
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
            if ((_DWORD)action == 16001)
            {
              result = CFSTR("SEARCH_IN_MAPS");
            }
            else
            {
              if ((_DWORD)action != 90010)
                goto LABEL_55;
              result = CFSTR("PAN_RIGHT");
            }
            break;
        }
      }
    }
    else
    {
      switch((int)action)
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_55;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v5 = CFSTR("UI_ACTION_UNKNOWN");
    switch((int)action)
    {
      case 0:
        return v5;
      case 1:
        result = CFSTR("PULL_UP");
        break;
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
        goto LABEL_55;
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
        switch((int)action)
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
            goto LABEL_55;
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
            switch((int)action)
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
                goto LABEL_55;
            }
            break;
        }
        break;
    }
  }
  return result;
}

- (id)_whiteListedSiriListActionAsString:(int)a3
{
  uint64_t action;
  __CFString *v4;
  id result;

  if (a3 != 2007)
  {
    v4 = 0;
    return v4;
  }
  action = self->_action;
  if ((int)action <= 4000)
  {
    v4 = CFSTR("UI_ACTION_UNKNOWN");
    switch((int)action)
    {
      case 0:
        return v4;
      case 1:
        result = CFSTR("PULL_UP");
        break;
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
        goto LABEL_50;
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
        switch((int)action)
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
            goto LABEL_50;
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
            switch((int)action)
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
                goto LABEL_50;
            }
            break;
        }
        break;
    }
    return result;
  }
  if ((int)action <= 10100)
  {
    if ((int)action > 7000)
    {
      switch((int)action)
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
          goto LABEL_50;
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch((int)action)
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
          goto LABEL_50;
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
          switch((int)action)
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
              goto LABEL_50;
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    if ((int)action <= 13000)
    {
      switch((int)action)
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
      return result;
    }
    if ((int)action > 16000)
    {
      switch((int)action)
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
          if ((_DWORD)action == 16001)
          {
            result = CFSTR("SEARCH_IN_MAPS");
          }
          else
          {
            if ((_DWORD)action != 90010)
              goto LABEL_50;
            result = CFSTR("PAN_RIGHT");
          }
          break;
      }
      return result;
    }
    if ((int)action > 15000)
    {
      switch((_DWORD)action)
      {
        case 0x3A99:
          return CFSTR("ORB_PEEK");
        case 0x3A9A:
          return CFSTR("ORB_POP");
        case 0x3A9B:
          return CFSTR("ORB_DISMISS");
      }
LABEL_50:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), action);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    switch((int)action)
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
        switch((int)action)
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
            goto LABEL_50;
        }
        break;
    }
  }
  return result;
}

- (id)_whiteListedBrowseCategoryActionAsString:(int)a3
{
  uint64_t action;
  __CFString *v4;
  id result;

  if (a3 != 2004)
  {
    v4 = 0;
    return v4;
  }
  action = self->_action;
  if ((int)action <= 4000)
  {
    v4 = CFSTR("UI_ACTION_UNKNOWN");
    switch((int)action)
    {
      case 0:
        return v4;
      case 1:
        result = CFSTR("PULL_UP");
        break;
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
        goto LABEL_50;
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
        switch((int)action)
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
            goto LABEL_50;
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
            switch((int)action)
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
                goto LABEL_50;
            }
            break;
        }
        break;
    }
    return result;
  }
  if ((int)action <= 10100)
  {
    if ((int)action > 7000)
    {
      switch((int)action)
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
          goto LABEL_50;
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch((int)action)
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
          goto LABEL_50;
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
          switch((int)action)
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
              goto LABEL_50;
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    if ((int)action <= 13000)
    {
      switch((int)action)
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
      return result;
    }
    if ((int)action > 16000)
    {
      switch((int)action)
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
          if ((_DWORD)action == 16001)
          {
            result = CFSTR("SEARCH_IN_MAPS");
          }
          else
          {
            if ((_DWORD)action != 90010)
              goto LABEL_50;
            result = CFSTR("PAN_RIGHT");
          }
          break;
      }
      return result;
    }
    if ((int)action > 15000)
    {
      switch((_DWORD)action)
      {
        case 0x3A99:
          return CFSTR("ORB_PEEK");
        case 0x3A9A:
          return CFSTR("ORB_POP");
        case 0x3A9B:
          return CFSTR("ORB_DISMISS");
      }
LABEL_50:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), action);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    switch((int)action)
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
        switch((int)action)
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
            goto LABEL_50;
        }
        break;
    }
  }
  return result;
}

- (id)_whiteListedSearchActionAsString:(int)a3
{
  uint64_t action;
  __CFString *v4;
  id result;

  if (a3 != 2014)
  {
    v4 = 0;
    return v4;
  }
  action = self->_action;
  if ((int)action <= 4000)
  {
    v4 = CFSTR("UI_ACTION_UNKNOWN");
    switch((int)action)
    {
      case 0:
        return v4;
      case 1:
        result = CFSTR("PULL_UP");
        break;
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
        goto LABEL_50;
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
        switch((int)action)
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
            goto LABEL_50;
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
            switch((int)action)
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
                goto LABEL_50;
            }
            break;
        }
        break;
    }
    return result;
  }
  if ((int)action <= 10100)
  {
    if ((int)action > 7000)
    {
      switch((int)action)
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
          goto LABEL_50;
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch((int)action)
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
          goto LABEL_50;
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
          switch((int)action)
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
              goto LABEL_50;
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    if ((int)action <= 13000)
    {
      switch((int)action)
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_50;
              }
              break;
          }
          break;
      }
      return result;
    }
    if ((int)action > 16000)
    {
      switch((int)action)
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
          if ((_DWORD)action == 16001)
          {
            result = CFSTR("SEARCH_IN_MAPS");
          }
          else
          {
            if ((_DWORD)action != 90010)
              goto LABEL_50;
            result = CFSTR("PAN_RIGHT");
          }
          break;
      }
      return result;
    }
    if ((int)action > 15000)
    {
      switch((_DWORD)action)
      {
        case 0x3A99:
          return CFSTR("ORB_PEEK");
        case 0x3A9A:
          return CFSTR("ORB_POP");
        case 0x3A9B:
          return CFSTR("ORB_DISMISS");
      }
LABEL_50:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), action);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    switch((int)action)
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
        switch((int)action)
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
            goto LABEL_50;
        }
        break;
    }
  }
  return result;
}

- (id)_whiteListedNavigationActionAsString:(int)a3
{
  __CFString *v4;
  int v5;
  uint64_t action;
  id result;

  v4 = 0;
  if (a3 > 9015)
  {
    if (a3 == 9016 || a3 == 11017)
      goto LABEL_8;
    v5 = 9021;
  }
  else
  {
    if ((a3 - 3001) < 2)
      goto LABEL_8;
    v5 = 8006;
  }
  if (a3 != v5)
    return v4;
LABEL_8:
  action = self->_action;
  if ((int)action <= 4000)
  {
    v4 = CFSTR("UI_ACTION_UNKNOWN");
    switch((int)action)
    {
      case 0:
        return v4;
      case 1:
        result = CFSTR("PULL_UP");
        break;
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
        goto LABEL_53;
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
        switch((int)action)
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
            goto LABEL_53;
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
            switch((int)action)
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
                goto LABEL_53;
            }
            break;
        }
        break;
    }
    return result;
  }
  if ((int)action <= 10100)
  {
    if ((int)action > 7000)
    {
      switch((int)action)
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
          goto LABEL_53;
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_53;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch((int)action)
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
          goto LABEL_53;
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
          switch((int)action)
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
              goto LABEL_53;
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
              switch((int)action)
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
                  goto LABEL_53;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    if ((int)action <= 13000)
    {
      switch((int)action)
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
          switch((int)action)
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
              switch((int)action)
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
                  goto LABEL_53;
              }
              break;
          }
          break;
      }
      return result;
    }
    if ((int)action > 16000)
    {
      switch((int)action)
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
          if ((_DWORD)action == 16001)
          {
            result = CFSTR("SEARCH_IN_MAPS");
          }
          else
          {
            if ((_DWORD)action != 90010)
              goto LABEL_53;
            result = CFSTR("PAN_RIGHT");
          }
          break;
      }
      return result;
    }
    if ((int)action > 15000)
    {
      switch((_DWORD)action)
      {
        case 0x3A99:
          return CFSTR("ORB_PEEK");
        case 0x3A9A:
          return CFSTR("ORB_POP");
        case 0x3A9B:
          return CFSTR("ORB_DISMISS");
      }
LABEL_53:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), action);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    switch((int)action)
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
        switch((int)action)
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
            v4 = CFSTR("SORT_LIST_ITEM");
            return v4;
          default:
            goto LABEL_53;
        }
        break;
    }
  }
  return result;
}

- (BOOL)_isStartNavigationAction:(int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if (a3 > 9020)
  {
    if (a3 == 9021)
      return result;
    v4 = 11017;
  }
  else
  {
    if (a3 == 3001)
      return result;
    v4 = 9016;
  }
  if (a3 != v4)
    return 0;
  return result;
}

- (void)_navTimerFired:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3 && s_navStartedTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[MKSiriInteraction navigationHash](MKSiriInteraction, "navigationHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("nav_identifier");
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Continue"), CFSTR("navigationType"));
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("source"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD970]), "initWithDomain:verb:parametersByName:", CFSTR("Maps"), CFSTR("Navigation"), v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v8, 0);
    objc_msgSend(v9, "donateInteractionWithCompletion:", 0);
    objc_msgSend((id)s_navStartedTimer, "invalidate");
    v10 = (void *)s_navStartedTimer;
    s_navStartedTimer = 0;

  }
}

+ (void)generateHashForNavigationURL:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "absoluteString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
  }
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)s_navigationHash;
  s_navigationHash = v3;

}

+ (id)_siriIntentMurmurHash:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLength:", 16);
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "UTF8String");
  objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4);

  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "mutableBytes");
  _GEOMurmurHash3_128_realign();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (NSString)navigationHash
{
  void *v2;

  v2 = (void *)s_navigationHash;
  if (!s_navigationHash)
  {
    objc_msgSend(a1, "generateHashForNavigationURL:", 0);
    v2 = (void *)s_navigationHash;
  }
  return (NSString *)v2;
}

+ (void)setNavigationHash:(id)a3
{
  objc_storeStrong((id *)&s_navigationHash, a3);
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (int)target
{
  return self->_target;
}

- (void)setTarget:(int)a3
{
  self->_target = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (int)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(int)a3
{
  self->_resultIndex = a3;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
  objc_storeStrong((id *)&self->_searchCategory, a3);
}

- (NSString)searchQueryString
{
  return self->_searchQueryString;
}

- (void)setSearchQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueryString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryString, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
