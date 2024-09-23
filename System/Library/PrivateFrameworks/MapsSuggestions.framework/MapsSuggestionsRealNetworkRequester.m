@implementation MapsSuggestionsRealNetworkRequester

- (id)initFromResourceDepot:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsRealNetworkRequester;
  return -[MapsSuggestionsRealNetworkRequester init](&v4, sel_init, a3);
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)forwardGeocodePostalAddress:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 64;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodePostalAddress:completion:]";
      v22 = 2082;
      v23 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 65;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodePostalAddress:completion:]";
      v22 = 2082;
      v23 = "nil == (postalAddress)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making request: fwd-geo for '%@'", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppIdentifier:", v12);

  v13 = 1;
  objc_msgSend(v9, "ticketForForwardGeocodePostalAddress:maxResults:traits:", v5, 1, v11);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject submitWithHandler:networkActivity:](v8, "submitWithHandler:networkActivity:", v6, 0);
LABEL_12:

  return v13;
}

- (BOOL)forwardGeocodeAddressString:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 80;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodeAddressString:completion:]";
      v22 = 2082;
      v23 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 81;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester forwardGeocodeAddressString:completion:]";
      v22 = 2082;
      v23 = "nil == (addressString)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making request: fwd-geo for '%@'", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppIdentifier:", v12);

  v13 = 1;
  objc_msgSend(v9, "ticketForForwardGeocodeString:maxResults:traits:", v5, 1, v11);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject submitWithHandler:networkActivity:](v8, "submitWithHandler:networkActivity:", v6, 0);
LABEL_12:

  return v13;
}

- (BOOL)canonicalLocalSearchPostalAddress:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  const char *v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v23 = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v25 = 1024;
      v26 = 96;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRealNetworkRequester canonicalLocalSearchPostalAddress:completion:]";
      v29 = 2082;
      v30 = "nil == (completion)";
      v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v23, 0x26u);
    }
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v23 = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v25 = 1024;
      v26 = 97;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRealNetworkRequester canonicalLocalSearchPostalAddress:completion:]";
      v29 = 2082;
      v30 = "nil == (postalAddress)";
      v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D26EC8]);
  -[NSObject languageCode](v7, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject regionCode](v7, "regionCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject languageCode](v7, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithCNPostalAddress:language:country:phoneticLocale:", v5, v9, v10, v11);

  objc_msgSend(v12, "fullAddressWithMultiline:", 0);
  v13 = (char *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412290;
    v24 = v13;
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Making request: canonical for '%@'", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultTraits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAppIdentifier:", v18);

  objc_msgSend(v15, "ticketForCanonicalLocationSearchQueryString:traits:", v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "submitWithHandler:networkActivity:", v6, 0);
  v20 = 1;
LABEL_12:

  return v20;
}

- (BOOL)reverseGeocodeCoordinate:(id)a3 shiftIfNeeded:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  double var1;
  double var0;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const char *v16;
  int v18;
  const char *v19;
  __int16 v20;
  _BYTE v21[14];
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v5 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v20 = 1024;
      *(_DWORD *)v21 = 119;
      *(_WORD *)&v21[4] = 2082;
      *(_QWORD *)&v21[6] = "-[MapsSuggestionsRealNetworkRequester reverseGeocodeCoordinate:shiftIfNeeded:completion:]";
      v22 = 2082;
      v23 = "nil == (completion)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_13:
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x26u);
    }
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (var1 < -180.0 || var1 > 180.0 || var0 < -90.0 || var0 > 90.0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v20 = 1024;
      *(_DWORD *)v21 = 120;
      *(_WORD *)&v21[4] = 2082;
      *(_QWORD *)&v21[6] = "-[MapsSuggestionsRealNetworkRequester reverseGeocodeCoordinate:shiftIfNeeded:completion:]";
      v22 = 2082;
      v23 = "!GEOCoordinate2DIsValid(coordinate)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a valid coordinate";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134218240;
    v19 = *(const char **)&var0;
    v20 = 2048;
    *(double *)v21 = var1;
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Making request: rev-geo for <%.6f,%.6f>", (uint8_t *)&v18, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppIdentifier:", v14);

  objc_msgSend(v11, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", v5, v13, var0, var1);
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject submitWithHandler:networkActivity:](v10, "submitWithHandler:networkActivity:", v8, 0);
  v15 = 1;
LABEL_15:

  return v15;
}

- (BOOL)reverseGeocodeCoordinate:(id)a3 completion:(id)a4
{
  return -[MapsSuggestionsRealNetworkRequester reverseGeocodeCoordinate:shiftIfNeeded:completion:](self, "reverseGeocodeCoordinate:shiftIfNeeded:completion:", 1, a4, a3.var0, a3.var1);
}

- (BOOL)placeRefinementForCoordinate:(id)a3 address:(id)a4 completion:(id)a5
{
  double var1;
  double var0;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  $F24F406B2B787EFB06265DBA3D28CBD5 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BYTE v21[24];
  uint64_t v22;

  var1 = a3.var1;
  var0 = a3.var0;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v8 = a4;
  v9 = a5;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v19 = *(const char **)&var0;
      v20 = 2048;
      *(double *)v21 = var1;
      *(_WORD *)&v21[8] = 2112;
      *(_QWORD *)&v21[10] = v8;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Making place refinement: <%.6f,%.6f>, %@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0D27218], "sharedService", *(_QWORD *)&v17.var0, *(_QWORD *)&v17.var1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    GEOConfigGetString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppIdentifier:", v15);

    objc_msgSend(v12, "ticketForPlaceRefinementRequestWithCoordinate:addressLine:placeName:traits:", &v17, v8, 0, v14);
    v11 = objc_claimAutoreleasedReturnValue();

    -[NSObject submitWithHandler:networkActivity:](v11, "submitWithHandler:networkActivity:", v9, 0);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    v20 = 1024;
    *(_DWORD *)v21 = 142;
    *(_WORD *)&v21[4] = 2082;
    *(_QWORD *)&v21[6] = "-[MapsSuggestionsRealNetworkRequester placeRefinementForCoordinate:address:completion:]";
    *(_WORD *)&v21[14] = 2082;
    *(_QWORD *)&v21[16] = "nil == (completion)";
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
  }

  return v9 != 0;
}

- (BOOL)placeRefinementForAddress:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making place refinement with address: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultTraits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    GEOConfigGetString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAppIdentifier:", v12);

    objc_msgSend(v9, "ticketForPlaceRefinementRequestWithCoordinate:addressLine:placeName:traits:", 0, v5, 0, v11);
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject submitWithHandler:networkActivity:](v8, "submitWithHandler:networkActivity:", v6, 0);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = 136446978;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    v16 = 1024;
    v17 = 154;
    v18 = 2082;
    v19 = "-[MapsSuggestionsRealNetworkRequester placeRefinementForAddress:completion:]";
    v20 = 2082;
    v21 = "nil == (completion)";
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", (uint8_t *)&v14, 0x26u);
  }

  return v6 != 0;
}

- (BOOL)placeForMuid:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D27218];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "defaultTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppIdentifier:", v12);

  objc_msgSend(v8, "ticketForIdentifiers:traits:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitWithHandler:networkActivity:", v6, 0);
  return 1;
}

- (BOOL)searchString:(id)a3 maxResults:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6;
  char *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const char *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3;
  v8 = a5;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v20 = 1024;
      v21 = 176;
      v22 = 2082;
      v23 = "-[MapsSuggestionsRealNetworkRequester searchString:maxResults:completion:]";
      v24 = 2082;
      v25 = "nil == (completion)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x26u);
    }
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v20 = 1024;
      v21 = 177;
      v22 = 2082;
      v23 = "-[MapsSuggestionsRealNetworkRequester searchString:maxResults:completion:]";
      v24 = 2082;
      v25 = "nil == (searchString)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v7;
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Making request: search for '%@'", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppIdentifier:", v14);

  objc_msgSend(v11, "ticketForSearchQuery:completionItem:maxResults:traits:searchSessionData:", v7, 0, v6, v13, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject submitWithHandler:networkActivity:](v10, "submitWithHandler:networkActivity:", v8, 0);
  v15 = 1;
LABEL_12:

  return v15;
}

- (BOOL)searchPOIWithName:(id)a3 ofPOICategory:(id)a4 withinVenue:(id)a5 maxResults:(unint64_t)a6 completion:(id)a7
{
  char *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  const char *v28;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = (char *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!v14)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v33 = 1024;
      *(_DWORD *)v34 = 199;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[MapsSuggestionsRealNetworkRequester searchPOIWithName:ofPOICategory:withinVenue:maxResults:completion:]";
      *(_WORD *)&v34[14] = 2082;
      *(_QWORD *)&v34[16] = "nil == (completion)";
      v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_15:
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, v28, buf, 0x26u);
    }
LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v33 = 1024;
      *(_DWORD *)v34 = 200;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[MapsSuggestionsRealNetworkRequester searchPOIWithName:ofPOICategory:withinVenue:maxResults:completion:]";
      *(_WORD *)&v34[14] = 2082;
      *(_QWORD *)&v34[16] = "nil == (searchString)";
      v28 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v32 = v11;
    v33 = 2112;
    *(_QWORD *)v34 = v12;
    *(_WORD *)&v34[8] = 2048;
    *(_QWORD *)&v34[10] = objc_msgSend(v13, "venueID");
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Making request: search POI for '%@' (category=%@ venue=%llu)", buf, 0x20u);
  }

  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27440]), "initWithResultTypes:", 2);
  -[NSObject addObject:](v16, "addObject:", v17);
  if (v12)
  {
    v18 = objc_alloc(MEMORY[0x1E0D272F8]);
    v30 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithCategoriesToInclude:categoriesToExclude:", v19, 0);

    -[NSObject addObject:](v16, "addObject:", v20);
  }
  if (v13 && objc_msgSend(v13, "_hasFeatureID"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D276E0]), "initWithIdentifier:", v13);
    -[NSObject addObject:](v16, "addObject:", v21);

  }
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "defaultTraits");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAppIdentifier:", v25);

  objc_msgSend(v22, "ticketForSearchQuery:filters:maxResults:traits:searchSessionData:", v11, v16, a6, v24, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "submitWithHandler:networkActivity:", v14, 0);
  v27 = 1;
LABEL_17:

  return v27;
}

- (BOOL)searchWithAirportCode:(id)a3 terminal:(id)a4 gate:(id)a5 completion:(id)a6
{
  char *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  const char *v20;
  int v22;
  const char *v23;
  __int16 v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v22 = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v24 = 1024;
      *(_DWORD *)v25 = 242;
      *(_WORD *)&v25[4] = 2082;
      *(_QWORD *)&v25[6] = "-[MapsSuggestionsRealNetworkRequester searchWithAirportCode:terminal:gate:completion:]";
      *(_WORD *)&v25[14] = 2082;
      *(_QWORD *)&v25[16] = "nil == (completion)";
      v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v22, 0x26u);
    }
LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v24 = 1024;
      *(_DWORD *)v25 = 243;
      *(_WORD *)&v25[4] = 2082;
      *(_QWORD *)&v25[6] = "-[MapsSuggestionsRealNetworkRequester searchWithAirportCode:terminal:gate:completion:]";
      *(_WORD *)&v25[14] = 2082;
      *(_QWORD *)&v25[16] = "nil == (airportCode)";
      v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires at least an airportCode";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v22 = 138412802;
    v23 = v9;
    v24 = 2112;
    *(_QWORD *)v25 = v10;
    *(_WORD *)&v25[8] = 2112;
    *(_QWORD *)&v25[10] = v11;
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Making request: airport for {'%@', '%@', '%@'}", (uint8_t *)&v22, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultTraits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAppIdentifier:", v18);

  objc_msgSend(v15, "ticketForAirportCode:terminalCode:gateCode:traits:", v9, v10, v11, v17);
  v14 = objc_claimAutoreleasedReturnValue();

  -[NSObject submitWithHandler:networkActivity:](v14, "submitWithHandler:networkActivity:", v12, 0);
  v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)resolveMapItemHandleData:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  const char *v14;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v20 = 1024;
      v21 = 258;
      v22 = 2082;
      v23 = "-[MapsSuggestionsRealNetworkRequester resolveMapItemHandleData:completion:]";
      v24 = 2082;
      v25 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v20 = 1024;
      v21 = 259;
      v22 = 2082;
      v23 = "-[MapsSuggestionsRealNetworkRequester resolveMapItemHandleData:completion:]";
      v24 = 2082;
      v25 = "nil == (mapItemHandleData)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a MapItemHandle data";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making request: place-refinement for %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppIdentifier:", v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__MapsSuggestionsRealNetworkRequester_resolveMapItemHandleData_completion___block_invoke;
  v16[3] = &unk_1E4BCF300;
  v17 = v6;
  objc_msgSend(v9, "resolveMapItemFromHandle:traits:completionHandler:", v5, v11, v16);

  v13 = 1;
  v8 = v17;
LABEL_12:

  return v13;
}

void __75__MapsSuggestionsRealNetworkRequester_resolveMapItemHandleData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)composedWaypointForMapItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  const char *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v23 = 1024;
      v24 = 281;
      v25 = 2082;
      v26 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForMapItem:completion:]";
      v27 = 2082;
      v28 = "nil == (completion)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v16, buf, 0x26u);
    }
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v23 = 1024;
      v24 = 282;
      v25 = 2082;
      v26 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForMapItem:completion:]";
      v27 = 2082;
      v28 = "nil == (mapItem)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for mapitem", buf, 2u);
  }

  MapsSuggestionsNow();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D26FF8];
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultTraits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAppIdentifier:", v13);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__MapsSuggestionsRealNetworkRequester_composedWaypointForMapItem_completion___block_invoke;
  v18[3] = &unk_1E4BCF270;
  v19 = v9;
  v20 = v6;
  v8 = v9;
  v14 = (id)objc_msgSend(v10, "composedWaypointForMapItem:traits:clientAttributes:completionHandler:networkActivityHandler:", v5, v12, 0, v18, 0);

  v15 = 1;
LABEL_12:

  return v15;
}

void __77__MapsSuggestionsRealNetworkRequester_composedWaypointForMapItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  MapsSuggestionsNow();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v9 = v8;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134217984;
    v12 = v9;
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Took %.2f seconds", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)composedWaypointForLocation:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 303;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:completion:]";
      v22 = 2082;
      v23 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 304;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:completion:]";
      v22 = 2082;
      v23 = "nil == (location)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for location %@", (uint8_t *)&v16, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0D26FF8];
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v8 = objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setAppIdentifier:](v8, "setAppIdentifier:", v11);

  v12 = (id)objc_msgSend(v9, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v5, 0, v8, v6, 0);
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)composedWaypointForLocation:(id)a3 mapItem:(id)a4 completion:(id)a5
{
  char *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  const char *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    v21 = 1024;
    v22 = 321;
    v23 = 2082;
    v24 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:mapItem:completion:]";
    v25 = 2082;
    v26 = "nil == (completion)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_13:
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x26u);
    goto LABEL_14;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    v21 = 1024;
    v22 = 322;
    v23 = 2082;
    v24 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:mapItem:completion:]";
    v25 = 2082;
    v26 = "nil == (location)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
    goto LABEL_13;
  }
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v21 = 1024;
      v22 = 323;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForLocation:mapItem:completion:]";
      v25 = 2082;
      v26 = "nil == (mapItem)";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a map item";
      goto LABEL_13;
    }
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Making request: waypoint for location %@", (uint8_t *)&v19, 0xCu);
  }

  v12 = (void *)MEMORY[0x1E0D26FF8];
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultTraits");
  v11 = objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setAppIdentifier:](v11, "setAppIdentifier:", v14);

  v15 = (id)objc_msgSend(v12, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v7, v8, v11, v9, 0);
  v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)composedWaypointForCurrentLocation:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 339;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForCurrentLocation:completion:]";
      v22 = 2082;
      v23 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 340;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForCurrentLocation:completion:]";
      v22 = 2082;
      v23 = "nil == (location)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for Currentlocation %@", (uint8_t *)&v16, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0D26FF8];
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v8 = objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setAppIdentifier:](v8, "setAppIdentifier:", v11);

  v12 = (id)objc_msgSend(v9, "composedWaypointForCurrentLocation:traits:completionHandler:networkActivityHandler:", v5, v8, v6, 0);
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)composedWaypointForAddressString:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 355;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForAddressString:completion:]";
      v22 = 2082;
      v23 = "nil == (completion)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v18 = 1024;
      v19 = 356;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealNetworkRequester composedWaypointForAddressString:completion:]";
      v22 = 2082;
      v23 = "nil == (addressString)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an address string";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Making request: waypoint for address '%@'", (uint8_t *)&v16, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0D26FF8];
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v8 = objc_claimAutoreleasedReturnValue();

  GEOConfigGetString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setAppIdentifier:](v8, "setAppIdentifier:", v11);

  v12 = (id)objc_msgSend(v9, "composedWaypointForAddressString:traits:clientAttributes:completionHandler:networkActivityHandler:", v5, v8, 0, v6, 0);
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)ETAFromWaypoint:(id)a3 toWaypoint:(id)a4 transportType:(int)a5 automobileOptions:(id)a6 completion:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  const char *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  int v27;
  _QWORD v28[2];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v9 = *(_QWORD *)&a5;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (!v14)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136446978;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    v31 = 1024;
    v32 = 375;
    v33 = 2082;
    v34 = "-[MapsSuggestionsRealNetworkRequester ETAFromWaypoint:toWaypoint:transportType:automobileOptions:completion:]";
    v35 = 2082;
    v36 = "nil == (completion)";
    v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_17:
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, v21, buf, 0x26u);
    goto LABEL_18;
  }
  if (!v11)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136446978;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
    v31 = 1024;
    v32 = 376;
    v33 = 2082;
    v34 = "-[MapsSuggestionsRealNetworkRequester ETAFromWaypoint:toWaypoint:transportType:automobileOptions:completion:]";
    v35 = 2082;
    v36 = "nil == (hereWaypoint)";
    v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an origin waypoint";
    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v31 = 1024;
      v32 = 377;
      v33 = 2082;
      v34 = "-[MapsSuggestionsRealNetworkRequester ETAFromWaypoint:toWaypoint:transportType:automobileOptions:completion:]";
      v35 = 2082;
      v36 = "nil == (thereWaypoint)";
      v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination waypoint";
      goto LABEL_17;
    }
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Making request: eta", buf, 2u);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0D274A8]);
  -[NSObject setMainTransportType:](v16, "setMainTransportType:", v9);
  if (!(_DWORD)v9)
  {
    if (v13)
      -[NSObject setAutomobileOptions:](v16, "setAutomobileOptions:", v13);
    v17 = objc_alloc(MEMORY[0x1E0D51930]);
    v28[0] = v11;
    v28[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithAttributes:waypoints:", v16, v18);

    v16 = v19;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke;
  v23[3] = &unk_1E4BCF328;
  v24 = v11;
  v25 = v12;
  v27 = v9;
  v26 = v14;
  -[NSObject buildRouteAttributes:result:](v16, "buildRouteAttributes:result:", MEMORY[0x1E0C80D38], v23);

  v20 = 1;
LABEL_19:

  return v20;
}

void __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D27398];
  v4 = *(_QWORD *)(a1 + 32);
  v12[0] = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned int *)(a1 + 56);
  objc_msgSend(v6, "automobileOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke_2;
  v10[3] = &unk_1E4BCDE70;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v3, "requestTrafficAndETAFromWaypoint:toWaypoints:transportType:automobileOptions:handler:", v4, v7, v8, v9, v10);

}

void __109__MapsSuggestionsRealNetworkRequester_ETAFromWaypoint_toWaypoint_transportType_automobileOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  MapsSuggestionsTrafficAndETAResult *v6;
  void *v7;
  MapsSuggestionsTrafficAndETAResult *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "count"))
  {
    v6 = [MapsSuggestionsTrafficAndETAResult alloc];
    objc_msgSend(v9, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MapsSuggestionsTrafficAndETAResult initWithGEOTrafficAndETAResult:](v6, "initWithGEOTrafficAndETAResult:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)routeForWaypoints:(id)a3 currentLocation:(id)a4 routeAttributes:(id)a5 feedback:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v11)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D27050]);
    -[NSObject setRequestType:](v16, "setRequestType:", 1);
    -[NSObject setTransportType:](v16, "setTransportType:", objc_msgSend(v13, "mainTransportType"));
    -[NSObject setWaypoints:](v16, "setWaypoints:", v11);
    -[NSObject setMaxRouteCount:](v16, "setMaxRouteCount:", 1);
    -[NSObject setCurrentLocation:](v16, "setCurrentLocation:", v12);
    -[NSObject setRouteAttributes:](v16, "setRouteAttributes:", v13);
    objc_msgSend(v14, "setRequestingAppId:", CFSTR("com.apple.MapsSuggestions"));
    -[NSObject setFeedback:](v16, "setFeedback:", v14);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26EF8]), "initWithProxiedApplicationBundleId:", CFSTR("com.apple.Maps"));
    -[NSObject setAuditToken:](v16, "setAuditToken:", v17);

    objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __109__MapsSuggestionsRealNetworkRequester_routeForWaypoints_currentLocation_routeAttributes_feedback_completion___block_invoke;
    v21[3] = &unk_1E4BCF350;
    v22 = v15;
    v19 = (id)objc_msgSend(v18, "requestDirections:handler:", v16, v21);

  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealNetworkRequester.m";
      v25 = 1024;
      v26 = 420;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRealNetworkRequester routeForWaypoints:currentLocation:routeAttributes:feedback:completion:]";
      v29 = 2082;
      v30 = "nil == (routeWaypoints)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Waypoints should not be nil!", buf, 0x26u);
    }
  }

  return v11 != 0;
}

uint64_t __109__MapsSuggestionsRealNetworkRequester_routeForWaypoints_currentLocation_routeAttributes_feedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4, a5, a6);
  return result;
}

@end
