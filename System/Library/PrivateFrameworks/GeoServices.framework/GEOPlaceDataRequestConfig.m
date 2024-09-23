@implementation GEOPlaceDataRequestConfig

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "requestPriority");
    if (v8 == 1)
    {
      v9 = 1280;
    }
    else if (v8 == 2)
    {
      v9 = 1792;
    }
    else if (objc_msgSend(v7, "requestType") == 32)
    {
      if (objc_msgSend(v6, "requestPriority") == 2)
        v9 = 1792;
      else
        v9 = 1280;
    }
    else
    {
      v9 = 768;
    }
    v10 = v9 | (objc_msgSend(v7, "requestType") << 32);
  }
  else
  {
    v10 = 0;
  }

  return ($C4D369C9F02205611300857CFD58F739)v10;
}

- (BOOL)usesBackgroundURL
{
  return self->_usesBackgroundURL;
}

- (id)serviceTypeNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
}

- (id)additionalStatesForNetworkEvent
{
  GEOLogMsgState *v3;
  GEOLogMsgStatePlaceRequest *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(GEOLogMsgState);
  -[GEOLogMsgState setStateType:](v3, "setStateType:", 707);
  v4 = objc_alloc_init(GEOLogMsgStatePlaceRequest);
  -[GEOLogMsgState setPlaceRequest:](v3, "setPlaceRequest:", v4);

  v5 = -[GEOPDPlaceRequest requestType](self->_placeRequest, "requestType");
  -[GEOLogMsgState placeRequest](v3, "placeRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceRequestType:", v5);

  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_requestPriority, 0);
}

- (unint64_t)urlType
{
  return self->_urlType;
}

- (unint64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (id)additionalHTTPHeaders
{
  NSNumber *requestPriority;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  requestPriority = self->_requestPriority;
  if (!requestPriority)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NSNumber unsignedIntegerValue](requestPriority, "unsignedIntegerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("x-msg-priority");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsOffline
{
  return self->_supportsOffline;
}

- (GEOPlaceDataRequestConfig)initWithTimeout:(double)a3 request:(id)a4 traits:(id)a5
{
  id v9;
  id v10;
  GEOPlaceDataRequestConfig *v11;
  GEOPlaceDataRequestConfig *v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *requestPriority;
  uint64_t *v23;
  objc_super v25;

  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GEOPlaceDataRequestConfig;
  v11 = -[GEOPlaceDataRequestConfig init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_timeout = a3;
    v13 = -[GEOPlaceDataRequestConfig dataRequestKindForRequest:traits:](v11, "dataRequestKindForRequest:traits:", v9, v10);
    v14 = v13;
    v15 = HIDWORD(v13);
    objc_storeStrong((id *)&v12->_placeRequest, a4);
    if ((_DWORD)v15 == 26)
    {
      v16 = 55;
      goto LABEL_17;
    }
    if ((_DWORD)v15 == 6
      && objc_msgSend(v10, "hasContainsSensitiveData")
      && objc_msgSend(v10, "containsSensitiveData"))
    {
      v16 = 63;
LABEL_17:
      v12->_urlType = v16;
      goto LABEL_27;
    }
    if (v14 != 1280)
    {
      if ((_DWORD)v15 == 32)
      {
        GEOConfigGetBOOL(GeoServicesConfig_BackgroundBluePOIURLEnabled, (uint64_t)off_1EDF4CFF8);
        goto LABEL_27;
      }
      v16 = 24;
      goto LABEL_17;
    }
    switch((_DWORD)v15)
    {
      case 0x31:
        _GEOGetURLWithSource(34, 0, 1, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 24;
        if (v18)
          v19 = 34;
        v12->_urlType = v19;

LABEL_27:
        if (objc_msgSend(v10, "hasHttpRequestPriority"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "httpRequestPriority"));
          v20 = objc_claimAutoreleasedReturnValue();
          requestPriority = v12->_requestPriority;
          v12->_requestPriority = (NSNumber *)v20;

        }
        if (v15 > 0xD || ((1 << v15) & 0x3402) == 0)
        {
          if (objc_msgSend(v10, "requestPurpose") != 1)
            goto LABEL_35;
          v23 = &GeoServicesConfig_DirectionsMPTCPServiceType;
        }
        else
        {
          v23 = &GeoServicesConfig_SearchACMPTCPServiceType;
        }
        v12->_multipathServiceType = GEOConfigGetInteger(*v23, v23[1]);
LABEL_35:
        v12->_usesBackgroundURL = objc_msgSend(v10, "requestPriority") == 1;
        v12->_supportsOffline = (v15 < 0x3D) & (0x1004108000881E86uLL >> v15);
        goto LABEL_36;
      case 0x20:
        if (GEOConfigGetBOOL(GeoServicesConfig_BackgroundBluePOIURLEnabled, (uint64_t)off_1EDF4CFF8))
        {
          GEOConfigGetBOOL(GeoServicesConfig_BackgroundURLForegroundFallbackEnabled, (uint64_t)off_1EDF4D028);
          v17 = 35;
          goto LABEL_26;
        }
        break;
      case 4:
        if (GEOConfigGetBOOL(GeoServicesConfig_BackgroundRevGeoURLEnabled, (uint64_t)off_1EDF4D018))
        {
          GEOConfigGetBOOL(GeoServicesConfig_BackgroundURLForegroundFallbackEnabled, (uint64_t)off_1EDF4D028);
          v17 = 36;
LABEL_26:
          v12->_urlType = v17;
          goto LABEL_27;
        }
        break;
      default:
        if (GEOConfigGetBOOL(GeoServicesConfig_BackgroundDispatcherURLEnabled, (uint64_t)off_1EDF4D008))
        {
          GEOConfigGetBOOL(GeoServicesConfig_BackgroundURLForegroundFallbackEnabled, (uint64_t)off_1EDF4D028);
          v17 = 34;
          goto LABEL_26;
        }
        break;
    }
    v17 = 24;
    goto LABEL_26;
  }
LABEL_36:

  return v12;
}

@end
