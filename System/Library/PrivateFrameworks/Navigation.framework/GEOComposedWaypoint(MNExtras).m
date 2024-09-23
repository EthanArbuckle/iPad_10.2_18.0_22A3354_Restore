@implementation GEOComposedWaypoint(MNExtras)

- (id)bestDisplayName:()MNExtras
{
  int v5;
  void *v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "waypointCategory");
  v6 = 0;
  switch(v5)
  {
    case 0:
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315650;
        v10 = "-[GEOComposedWaypoint(MNExtras) bestDisplayName:]";
        v11 = 2080;
        v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedWaypoint+MNExtras.m";
        v13 = 1024;
        v14 = 56;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v9, 0x1Cu);
      }

      goto LABEL_2;
    case 1:
    case 2:
    case 6:
    case 9:
    case 10:
    case 12:
LABEL_2:
      objc_msgSend(a1, "navDisplayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
    case 4:
    case 5:
    case 11:
      objc_msgSend(a1, "navDisplayNameWithSpecialContacts:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(a1, "navDisplayAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v6;
  }
  return v6;
}

- (id)bestSpokenName
{
  void *v2;
  void *v3;
  id result;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend(a1, "waypointCategory"))
  {
    case 0u:
    case 8u:
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136315650;
        v8 = "-[GEOComposedWaypoint(MNExtras) bestSpokenName]";
        v9 = 2080;
        v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedWaypoint+MNExtras.m";
        v11 = 1024;
        v12 = 87;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v7, 0x1Cu);
      }

      objc_msgSend(a1, "navAnnouncementName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      objc_msgSend(a1, "geoMapItem");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "contactSpokenName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 6u:
      objc_msgSend(a1, "_spokenPlaceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7u:
      objc_msgSend(a1, "navAnnouncementAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      result = v6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)directionsListAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "geoMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullAddressWithMultiline:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)navDisplayAddress
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "geoMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    navDisplayAddressForMapItem(v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)navDisplayName
{
  return objc_msgSend(a1, "navDisplayNameWithSpecialContacts:substituteType:", 1, 0);
}

- (id)navDisplayAddressAndSubstituteType:()MNExtras
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  navDisplayAddressForMapItem(v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)navDisplayNameAndSubstituteType:()MNExtras
{
  void *v5;

  objc_msgSend(a1, "geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(a1, "navDisplayNameWithSpecialContacts:substituteType:", 1, a3);
  else
    objc_msgSend(a1, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)navDisplayNameWithSpecialContacts:()MNExtras
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  navDisplayNameForMapItem(v4, a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)navDisplayNameWithSpecialContacts:()MNExtras substituteType:
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "geoMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    navDisplayNameForMapItem(v8, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)localeIdentifier
{
  void *v0;
  int v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_navigation_isNavd");

  if (v1)
  {
    +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentVoiceLanguage");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localeIdentifier");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)navAnnouncementName
{
  return objc_msgSend(a1, "navAnnouncementNameAndSubstituteType:", 0);
}

- (id)navAnnouncementNameAndSubstituteType:()MNExtras
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "contactSpokenName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      if (a3)
        *a3 = 3;
      goto LABEL_12;
    }

  }
  objc_msgSend(a1, "_spokenPlaceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    if (a3)
      *a3 = 4;
    v7 = v8;
  }
  else
  {
    v7 = 0;
  }

LABEL_12:
  return v7;
}

- (uint64_t)navAnnouncementAddress
{
  return objc_msgSend(a1, "navAnnouncementAddressAndSubstituteType:", 0);
}

- (id)navAnnouncementAddressAndSubstituteType:()MNExtras
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_spokenAddressForLocale:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      if (a3)
        *a3 = 2;
      objc_msgSend(v7, "_navigation_stringByMarkingAsNormalText");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v9 = (void *)v8;

      goto LABEL_16;
    }

  }
  if (objc_msgSend(MEMORY[0x1E0D27048], "canSpeakWrittenAddresses"))
  {
    objc_msgSend(a1, "navDisplayAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      if (a3)
        *a3 = 2;
      objc_msgSend(v7, "_navigation_stringByMarkingAsAddress");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }

  }
  v9 = 0;
  if (a3)
    *a3 = 0;
LABEL_16:

  return v9;
}

- (id)_spokenPlaceName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spokenNameForLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(MEMORY[0x1E0D27048], "canSpeakWrittenPlaceNames"))
    {
      objc_msgSend(a1, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
        goto LABEL_7;

    }
    v5 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "_navigation_stringByMarkingAsNormalText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

- (id)humanDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "navDisplayNameWithSpecialContacts:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "hasLatLng"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "latLng");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lat");
    v7 = v6;
    objc_msgSend(a1, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lng");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%f,%f)"), v7, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)humanDescriptionWithLatLng
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "navDisplayNameWithSpecialContacts:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "latLng");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lat");
    v7 = v6;
    objc_msgSend(a1, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lng");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" <%f,%f>"), v4, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "humanDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)humanDescriptionWithAddressAndLatLng
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "geoMapItem");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(a1, "geoMapItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "contactAddressType"),
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "navDisplayNameWithSpecialContacts:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "navDisplayNameWithSpecialContacts:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v11);

  }
  else if (v3)
  {
    objc_msgSend(v2, "addObject:", v3);
  }
  objc_msgSend(a1, "navDisplayAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v2, "addObject:", v12);
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "latLng");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lat");
  v16 = v15;
  objc_msgSend(a1, "latLng");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lng");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%.6f, %.6f"), v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v19);

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" | "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
