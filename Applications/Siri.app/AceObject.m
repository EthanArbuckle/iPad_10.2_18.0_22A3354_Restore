@implementation AceObject

- (id)_afui_mapsRelatedChild
{
  return 0;
}

- (id)_afui_mapsRelatedChildren
{
  return 0;
}

- (BOOL)_afui_updateMapsAnalytics
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  void *i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  if ((objc_opt_respondsToSelector(self, "extSessionGuid") & 1) != 0
    && (objc_opt_respondsToSelector(self, "extSessionGuidCreatedTimestamp") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject extSessionGuid](self, "extSessionGuid"));
    v4 = objc_claimAutoreleasedReturnValue(-[AceObject extSessionGuidCreatedTimestamp](self, "extSessionGuidCreatedTimestamp"));
    v5 = (void *)v4;
    if (v3 && v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance"));
      v7 = objc_alloc_init((Class)GEOUserSessionEntity);
      objc_msgSend(v7, "updateSessionIDFromUUIDString:", v3);
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      objc_msgSend(v7, "setSessionCreationTime:");
      v8 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_opt_class(self, v10);
        v12 = v11;
        v13 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject aceId](self, "aceId"));
        *(_DWORD *)buf = 136315906;
        v28 = "-[AceObject(MapsSession) _afui_updateMapsAnalytics]";
        v29 = 2112;
        v30 = v7;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Setting maps user session to %@ from <%@ %@>", buf, 0x2Au);

      }
      LOBYTE(v15) = 1;
      objc_msgSend(v6, "setSharedMapsUserSessionEntity:shareSessionIDWithMaps:", v7, 1);

LABEL_23:
      return (char)v15;
    }
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_1000A0990((uint64_t)self, v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject _afui_mapsRelatedChild](self, "_afui_mapsRelatedChild"));
  v18 = objc_msgSend(v17, "_afui_updateMapsAnalytics");

  if ((v18 & 1) == 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject _afui_mapsRelatedChildren](self, "_afui_mapsRelatedChildren", 0));
    v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v19 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "_afui_updateMapsAnalytics") & 1) != 0)
          {
            LOBYTE(v15) = 1;
            goto LABEL_23;
          }
        }
        v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
          continue;
        break;
      }
    }
    goto LABEL_23;
  }
  LOBYTE(v15) = 1;
  return (char)v15;
}

@end
