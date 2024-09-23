@implementation GEOPlace

- (GEOPlace)initWithUrlRepresentation:(id)a3
{
  id v4;
  GEOPlace *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  GEOLatLng *v11;
  double v12;
  double v13;
  double v14;
  GEOLatLng *v15;
  void *v16;
  GEOAddress *v17;
  GEOPlace *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOPlace;
  v5 = -[GEOPlace init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("latlng"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v8 && v9)
      {
        v11 = [GEOLatLng alloc];
        objc_msgSend(v8, "doubleValue");
        v13 = v12;
        objc_msgSend(v10, "doubleValue");
        v15 = -[GEOLatLng initWithLatitude:longitude:](v11, "initWithLatitude:longitude:", v13, v14);
        -[GEOPlace setCenter:](v5, "setCenter:", v15);

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      -[GEOPlace setName:](v5, "setName:", v16);
    v17 = -[GEOAddress initWithUrlRepresentation:]([GEOAddress alloc], "initWithUrlRepresentation:", v4);
    if (v17)
      -[GEOPlace setAddress:](v5, "setAddress:", v17);
    v18 = v5;

  }
  return v5;
}

- (id)urlRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOPlace hasCenter](self, "hasCenter"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOPlace center](self, "center");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lat");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOPlace center](self, "center");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lng");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("latlng"));

  }
  -[GEOPlace name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[GEOPlace name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("name"));

  }
  if (-[GEOPlace hasAddress](self, "hasAddress"))
  {
    -[GEOPlace address](self, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "urlRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v15);

  }
  return v3;
}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  int v9;
  char v10;
  int v11;
  void *v13;
  void *v14;

  v8 = a3;
  if (-[GEOPlace hasName](self, "hasName") || objc_msgSend(v8, "hasName"))
  {
    -[GEOPlace name](self, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v10 = 0;
      goto LABEL_12;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (!-[GEOPlace hasCenter](self, "hasCenter") && !objc_msgSend(v8, "hasCenter"))
  {
    v11 = 0;
LABEL_15:
    if (-[GEOPlace hasAddress](self, "hasAddress") || (objc_msgSend(v8, "hasAddress") & 1) != 0)
    {
      -[GEOPlace address](self, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "_isEquivalentURLRepresentationTo:", v14);

      if (v11)
        goto LABEL_18;
    }
    else
    {
      v10 = 1;
      if ((v11 & 1) != 0)
      {
LABEL_18:

        if ((v9 & 1) == 0)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
    if (!v9)
      goto LABEL_13;
LABEL_12:

    goto LABEL_13;
  }
  -[GEOPlace center](self, "center");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v11 = 1;
    goto LABEL_15;
  }

  v10 = 0;
  if ((v9 & 1) != 0)
    goto LABEL_12;
LABEL_13:

  return v10;
}

+ (id)_urlRepresentationForCurrentLocation
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("currentloc");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_urlForAction:(id)a3 rison:(id)a4
{
  id v5;
  id v6;
  GEORisonParser *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(GEORisonParser);
  v8 = (void *)MEMORY[0x1E0C99E98];
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[GEORisonParser stringFromRisonObject:](v7, "stringFromRisonObject:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%@?%@"), CFSTR("map"), v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_urlToShowURLRepresentations:(id)a3 options:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  GEOURLOptions *v10;
  void *v11;
  void *v12;
  GEOURLOptions *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("pois"));

  v10 = (GEOURLOptions *)v6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v10;
  if (v12)
  {
    v13 = v10;
    if (!v10)
      v13 = objc_alloc_init(GEOURLOptions);
    if (!-[GEOURLOptions hasReferralIdentifier](v13, "hasReferralIdentifier"))
      -[GEOURLOptions setReferralIdentifier:](v13, "setReferralIdentifier:", v12);
  }

  -[GEOURLOptions urlRepresentation](v13, "urlRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("options"));
  objc_msgSend(a1, "_urlForAction:rison:", CFSTR("show"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_urlToShowWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOPlace urlRepresentation](self, "urlRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlToShowURLRepresentations:options:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_urlToShowPlaces:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v14, (_QWORD)v18) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v14);
          objc_msgSend(v14, "urlRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  objc_msgSend((id)objc_opt_class(), "_urlToShowURLRepresentations:options:", v8, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_urlToShowCurrentLocationAndPlaces:(id)a3 currentLocationIndex:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count") + 1);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v17, (_QWORD)v22) & 1) == 0)
        {
          objc_msgSend(v10, "addObject:", v17);
          objc_msgSend(v17, "urlRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v11, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(a1, "_urlRepresentationForCurrentLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertObject:atIndex:", v19, a4);

  objc_msgSend((id)objc_opt_class(), "_urlToShowURLRepresentations:options:", v11, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_urlToShowCurrentLocationWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_urlRepresentationForCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_urlToShowURLRepresentations:options:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_urlForDirectionsWithWaypoints:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  GEOURLOptions *v24;
  void *v25;
  void *v26;
  GEOURLOptions *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = a1;
  objc_msgSend(a1, "_urlRepresentationForCurrentLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v11)
    goto LABEL_15;
  v12 = v11;
  v13 = *(_QWORD *)v35;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v35 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "urlRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        goto LABEL_13;
      }
      if (objc_msgSend(v15, "isEqual:", v8))
      {
        v17 = v9;
        v18 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_13;
        v17 = v9;
        v18 = v15;
      }
      objc_msgSend(v17, "addObject:", v18);
LABEL_13:
      ++v14;
    }
    while (v12 != v14);
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  }
  while (v12);
LABEL_15:

  v19 = objc_msgSend(v7, "transportType");
  if (v19 > 3)
    v20 = CFSTR("preferred");
  else
    v20 = off_1E1C03400[v19];
  v40[0] = CFSTR("saddr");
  objc_msgSend(v9, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v21;
  v40[1] = CFSTR("daddr");
  if ((unint64_t)objc_msgSend(v9, "count") >= 3)
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
  else
    objc_msgSend(v9, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = CFSTR("dirtype");
  v41[1] = v22;
  v41[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (GEOURLOptions *)v7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v24;
  if (v26)
  {
    v27 = v24;
    if (!v24)
      v27 = objc_alloc_init(GEOURLOptions);
    if (!-[GEOURLOptions hasReferralIdentifier](v27, "hasReferralIdentifier"))
      -[GEOURLOptions setReferralIdentifier:](v27, "setReferralIdentifier:", v26);
  }

  -[GEOURLOptions urlRepresentation](v27, "urlRepresentation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");

  if (-[GEOURLOptions hasTransportType](v27, "hasTransportType"))
    objc_msgSend(v29, "removeObjectForKey:", CFSTR("dirtype"));
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[0] = CFSTR("route");
  v38[1] = CFSTR("options");
  v39[0] = v23;
  v39[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_urlForAction:rison:", CFSTR("directions"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)_urlForDirectionsFromOrigin:(id)a3 toDestination:(id)a4 options:(id)a5
{
  void *v5;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[3];

  v5 = 0;
  v15[2] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v15[0] = a3;
    v15[1] = a4;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = a5;
    v11 = a4;
    v12 = a3;
    objc_msgSend(v9, "arrayWithObjects:count:", v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_urlForDirectionsWithWaypoints:options:", v13, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_urlForDirectionsToPlace:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[GEOPlace _isEquivalentURLRepresentationTo:](self, "_isEquivalentURLRepresentationTo:", v6))
  {
    v8 = 0;
  }
  else
  {
    -[GEOPlace urlRepresentation](self, "urlRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_urlForDirectionsFromOrigin:toDestination:options:", v9, v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_urlForDirectionsFromPlace:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[GEOPlace _isEquivalentURLRepresentationTo:](self, "_isEquivalentURLRepresentationTo:", v6))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "urlRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlace urlRepresentation](self, "urlRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_urlForDirectionsFromOrigin:toDestination:options:", v9, v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_urlForDirectionsToCurrentLocationWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[GEOPlace urlRepresentation](self, "urlRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_urlRepresentationForCurrentLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_urlForDirectionsFromOrigin:toDestination:options:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_urlForDirectionsFromCurrentLocationWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_urlRepresentationForCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlace urlRepresentation](self, "urlRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_urlForDirectionsFromOrigin:toDestination:options:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_placesFromPresentAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  id v9;
  GEOURLPresent *v10;
  id *p_isa;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t i;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  id v20;
  void *v22;

  v9 = a3;
  if (a4)
    *a4 = 0;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 1);
  v10 = -[GEOURLPresent initWithData:]([GEOURLPresent alloc], "initWithData:", v22);
  p_isa = (id *)&v10->super.super.isa;
  if (a6)
  {
    -[GEOURLPresent options]((id *)&v10->super.super.isa);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[GEOURLPresent items](p_isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
  if (v13)
  {
    for (i = 0; v13 != i; ++i)
    {
      -[GEOURLPresent items](p_isa);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", i);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_20:

        v20 = 0;
        goto LABEL_19;
      }
      if (*(_BYTE *)(v17 + 44))
      {
        v18 = 1;
        if (a4)
          goto LABEL_13;
      }
      else
      {
        -[GEOURLItem _readPlace](v17);
        if (!*(_QWORD *)(v17 + 24))
          goto LABEL_20;
        -[GEOURLItem place]((id *)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

        v18 = *(unsigned __int8 *)(v17 + 44);
        if (a4)
        {
LABEL_13:
          if (v18)
          {
            if (!*a4)
            {
              *a4 = 1;
              if (a5)
                *a5 = i;
            }
          }
        }
      }

    }
  }
  v20 = v14;
LABEL_19:

  return v20;
}

+ (id)_placesFromShowAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(a1, "_placesFromShowAction:currentLocationIndices:options:", a3, &v10, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = objc_msgSend(v10, "lastIndex");
  if (a4)
    *a4 = objc_msgSend(v10, "count") != 0;
  return v8;
}

+ (id)_placesFromShowAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v21;
  char v22;
  uint64_t v23;

  v8 = a3;
  if (a5)
    *a5 = 0;
  if (a4)
  {
    v9 = objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0CB3788]));
    *a4 = v9;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("present"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v23 = 0;
    v22 = 0;
    objc_msgSend(a1, "_placesFromPresentAction:hasCurrentLocation:currentLocationIndex:options:", v10, &v22, &v23, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndex:", v23);
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("options"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (a5 && v12)
      *a5 = -[GEOURLOptions initWithUrlRepresentation:]([GEOURLOptions alloc], "initWithUrlRepresentation:", v12);
    objc_msgSend(v8, "objectForKey:", CFSTR("pois"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "count");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v16);
      if (v16)
      {
        for (i = 0; i != v16; ++i)
        {
          objc_msgSend(v15, "objectAtIndex:", i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          objc_msgSend(v18, "_placeOrCurrentLocation:", &v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v11, "addObject:", v19);
          if (v21)
            objc_msgSend(v9, "addIndex:", i);

        }
      }
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

+ (id)_placesFromDirectionsAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "_placesFromDirectionsAction:currentLocationIndices:options:", a3, &v12, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a5)
    *a5 = objc_msgSend(v9, "firstIndex");
  if (a4)
    *a4 = objc_msgSend(v10, "count") != 0;

  return v8;
}

+ (id)_placesFromDirectionsAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  id v25;
  GEOURLOptions *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  _BYTE v34[15];
  char v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    v9 = objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0CB3788]));
    *a4 = v9;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (a5)
LABEL_3:
    *a5 = 0;
LABEL_4:
  objc_msgSend(v8, "objectForKey:", CFSTR("present"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("options"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v26 = -[GEOURLOptions initWithUrlRepresentation:]([GEOURLOptions alloc], "initWithUrlRepresentation:", v12);
    else
      v26 = 0;
    objc_msgSend(v8, "objectForKey:", CFSTR("route"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v11 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "objectForKey:", CFSTR("saddr"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34[0] = 0;
    objc_msgSend(v15, "_placeOrCurrentLocation:", v34);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v14, "addObject:", v16);
    if (*((_BYTE *)v32 + 24))
      objc_msgSend(v9, "addIndex:", 0);
    objc_msgSend(v13, "objectForKey:", CFSTR("daddr"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v16;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
    }
    else
    {
      if (!v17)
      {
        v19 = 0;
LABEL_22:
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __85__GEOPlace_GEOURLExtras___placesFromDirectionsAction_currentLocationIndices_options___block_invoke;
        v27[3] = &unk_1E1C033C0;
        v30 = &v31;
        v20 = v14;
        v28 = v20;
        v29 = v9;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v27);
        objc_msgSend(v13, "objectForKey:", CFSTR("dirtype"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          if (!v26)
            v26 = objc_alloc_init(GEOURLOptions);
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("drive"), v24) & 1) != 0)
          {
            v22 = 0;
LABEL_36:
            -[GEOURLOptions setTransportType:](v26, "setTransportType:", v22);
            goto LABEL_37;
          }
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("walk")) & 1) != 0)
          {
            v22 = 2;
            goto LABEL_36;
          }
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("transit")) & 1) != 0)
          {
            v22 = 1;
            goto LABEL_36;
          }
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("cycling")) & 1) != 0)
          {
            v22 = 3;
            goto LABEL_36;
          }
          if (objc_msgSend(v21, "isEqualToString:", CFSTR("preferred")))
          {
            v22 = 4;
            goto LABEL_36;
          }
        }
LABEL_37:
        if (a5)
          *a5 = objc_retainAutorelease(v26);
        v11 = (void *)objc_msgSend(v20, "copy", v24);

        _Block_object_dispose(&v31, 8);
        goto LABEL_40;
      }
      v36[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1, v16);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    goto LABEL_22;
  }
  v31 = 0;
  v35 = 0;
  objc_msgSend(a1, "_placesFromPresentAction:hasCurrentLocation:currentLocationIndex:options:", v10, &v35, &v31, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndex:", v31);
LABEL_41:

  return v11;
}

void __85__GEOPlace_GEOURLExtras___placesFromDirectionsAction_currentLocationIndices_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  objc_msgSend(a2, "_placeOrCurrentLocation:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v5 = v6;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3 + 1);
    v5 = v6;
  }

}

+ (id)_placesFromURL:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "_placesFromURL:currentLocationIndices:options:", a3, &v12, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a5)
    *a5 = objc_msgSend(v9, "firstIndex");
  if (a4)
    *a4 = objc_msgSend(v10, "count") != 0;

  return v8;
}

+ (id)_placesFromURL:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GEORisonParser *v18;
  void *v19;
  uint64_t v20;

  v8 = a3;
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("map"));

  if (v10)
  {
    objc_msgSend(v8, "resourceSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasPrefix:", CFSTR("//")))
    {
      objc_msgSend(v11, "substringFromIndex:", 2);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    v13 = objc_msgSend(v11, "rangeOfString:", CFSTR("?"));
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v15 = v13;
    objc_msgSend(v11, "substringToIndex:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("show")) & 1) == 0
      && !objc_msgSend(v16, "isEqualToString:", CFSTR("directions")))
    {
      v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v11, "substringFromIndex:", v15 + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(GEORisonParser);
    -[GEORisonParser objectFromRisonString:](v18, "objectFromRisonString:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("show")))
    {
      objc_msgSend(a1, "_placesFromShowAction:currentLocationIndices:options:", v19, a4, a5);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("directions")))
      {
        v14 = 0;
        goto LABEL_16;
      }
      objc_msgSend(a1, "_placesFromDirectionsAction:currentLocationIndices:options:", v19, a4, a5);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v20;
LABEL_16:

    goto LABEL_17;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (GEOPlace)initWithPlaceInfo:(id)a3 entity:(id)a4 addressObject:(id)a5 bounds:(id)a6 roadAccessInfo:(id)a7
{
  id *v12;
  id v13;
  id v14;
  id *v15;
  id *v16;
  GEOPlace *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  GEOPlace *v36;
  id *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = (id *)a3;
  v13 = a4;
  v14 = a5;
  v15 = (id *)a6;
  v16 = (id *)a7;
  v43.receiver = self;
  v43.super_class = (Class)GEOPlace;
  v17 = -[GEOPlace init](&v43, sel_init);
  if (v17)
  {
    if (objc_msgSend(v13, "hasType"))
    {
      objc_msgSend(v13, "type");
      -[GEOPlace setType:](v17, "setType:");
    }
    if (v15)
    {
      -[GEOPDBounds _readDisplayMapRegion]((uint64_t)v15);
      if (v15[3])
      {
        -[GEOPDBounds displayMapRegion](v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPlace setMapRegion:](v17, "setMapRegion:", v18);

      }
    }
    if (v14)
    {
      objc_msgSend(v14, "address");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlace setAddress:](v17, "setAddress:", v19);

      objc_msgSend(v14, "spokenAddress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlace setSpokenAddress:](v17, "setSpokenAddress:", v20);

      objc_msgSend(v14, "phoneticLocaleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlace setPhoneticLocaleIdentifier:](v17, "setPhoneticLocaleIdentifier:", v21);

    }
    if (v12)
    {
      -[GEOPDPlaceInfo _readCenter]((uint64_t)v12);
      if (v12[5])
      {
        -[GEOPDPlaceInfo center](v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPlace setCenter:](v17, "setCenter:", v22);

      }
    }
    if (objc_msgSend(v13, "namesCount"))
    {
      objc_msgSend(v13, "bestLocalizedName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "hasStringValue"))
      {
        objc_msgSend(v23, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPlace setName:](v17, "setName:", v24);

      }
    }
    if (objc_msgSend(v13, "spokenNamesCount"))
    {
      objc_msgSend(v13, "spokenNameAtIndex:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "hasStringValue"))
      {
        objc_msgSend(v25, "stringValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPlace setSpokenName:](v17, "setSpokenName:", v26);

      }
    }
    if (v16 && objc_msgSend(v16[2], "count"))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v38 = v16;
      -[GEOPDRoadAccessInfo roadAccessPoints](v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v40 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            if (objc_msgSend(v32, "hasLocation"))
            {
              objc_msgSend(v32, "location");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOPlace addEntryPoint:](v17, "addEntryPoint:", v33);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v29);
      }

      v16 = v38;
    }
    if (v12 && (*((_WORD *)v12 + 46) & 1) != 0)
      -[GEOPlace setArea:](v17, "setArea:", *((double *)v12 + 3));
    if (objc_msgSend(v13, "isDisputed"))
      -[GEOPlace setIsDisputed:](v17, "setIsDisputed:", objc_msgSend(v13, "isDisputed"));
    if (v14 && objc_msgSend(v14, "hasKnownAccuracy"))
    {
      v34 = objc_msgSend(v14, "knownAccuracy");
      if (v34 - 1 >= 5)
        v35 = 0;
      else
        v35 = v34;
      -[GEOPlace setAddressGeocodeAccuracy:](v17, "setAddressGeocodeAccuracy:", v35);
    }
    v36 = v17;
  }

  return v17;
}

+ (id)placeForPlaceData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  GEOPlace *v6;
  GEOPlace *v7;
  GEOBusiness *v8;
  uint64_t v9;
  GEOBusiness *v10;
  void *v11;
  _QWORD v13[15];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;

  v3 = a3;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__36;
  v74 = __Block_byref_object_dispose__36;
  v75 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__36;
  v68 = __Block_byref_object_dispose__36;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__36;
  v62 = __Block_byref_object_dispose__36;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__36;
  v56 = __Block_byref_object_dispose__36;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__36;
  v50 = __Block_byref_object_dispose__36;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__36;
  v44 = __Block_byref_object_dispose__36;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__36;
  v38 = __Block_byref_object_dispose__36;
  v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__36;
  v32[4] = __Block_byref_object_dispose__36;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__36;
  v30 = __Block_byref_object_dispose__36;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__36;
  v24 = __Block_byref_object_dispose__36;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__36;
  v18 = __Block_byref_object_dispose__36;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__GEOPlace_PlaceDataExtras__placeForPlaceData___block_invoke;
  v13[3] = &unk_1E1C096F0;
  v13[4] = &v70;
  v13[5] = &v64;
  v13[6] = &v14;
  v13[7] = &v40;
  v13[8] = &v34;
  v13[9] = v32;
  v13[10] = &v26;
  v13[11] = &v20;
  v13[12] = &v58;
  v13[13] = &v52;
  v13[14] = &v46;
  objc_msgSend(v3, "enumerateValidComponentsWithValuesUsingBlock:", v13);
  +[GEOAddressObject addressObjectForPlaceData:](GEOAddressObject, "addressObjectForPlaceData:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v71[5] && !(v65[5] | v4) && !v53[5] && !v47[5])
  {
    v7 = 0;
    goto LABEL_25;
  }
  v6 = [GEOPlace alloc];
  v7 = -[GEOPlace initWithPlaceInfo:entity:addressObject:bounds:roadAccessInfo:](v6, "initWithPlaceInfo:entity:addressObject:bounds:roadAccessInfo:", v71[5], v65[5], v5, v53[5], v47[5]);
  if (objc_msgSend(v3, "hasMuid"))
    -[GEOPlace setUID:](v7, "setUID:", objc_msgSend(v3, "muid"));
  if (objc_msgSend(v3, "hasResultProviderId"))
    -[GEOPlace setLocalSearchProviderID:](v7, "setLocalSearchProviderID:", objc_msgSend(v3, "resultProviderId"));
  if (v7 && v65[5])
  {
    v8 = [GEOBusiness alloc];
    v9 = v21[5];
    if (!v9)
      v9 = v27[5];
    v10 = -[GEOBusiness initWithPlaceDataEntity:rating:hours:reviews:photos:entityAttribution:](v8, "initWithPlaceDataEntity:rating:hours:reviews:photos:entityAttribution:", v65[5], v59[5], v41[5], v35[5], v9, v15[5]);
    if (objc_msgSend(v3, "hasMuid"))
      -[GEOBusiness setUID:](v10, "setUID:", objc_msgSend(v3, "muid"));
    if (!v10)
      goto LABEL_24;
    if (-[GEOBusiness hasName](v10, "hasName") || !-[GEOPlace hasName](v7, "hasName"))
    {
      if (!-[GEOBusiness hasName](v10, "hasName") || -[GEOPlace hasName](v7, "hasName"))
        goto LABEL_23;
      -[GEOBusiness name](v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlace setName:](v7, "setName:", v11);
    }
    else
    {
      -[GEOPlace name](v7, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOBusiness setName:](v10, "setName:", v11);
    }

LABEL_23:
    -[GEOPlace addBusiness:](v7, "addBusiness:", v10);
LABEL_24:

  }
LABEL_25:

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  return v7;
}

void __47__GEOPlace_PlaceDataExtras__placeForPlaceData___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t m;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[GEOPDComponent values](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3 || (*((_WORD *)v3 + 50) & 0x80) == 0)
    goto LABEL_66;
  v6 = *((_DWORD *)v3 + 22);
  switch(v6)
  {
    case 1:
      objc_msgSend(v4, "firstObject");
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentValue entity](v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[5] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (!v3[2])
        goto LABEL_26;
      -[GEOPDComponent attribution](v3);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[6];
      goto LABEL_25;
    case 2:
      objc_msgSend(v4, "firstObject");
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentValue placeInfo](v7);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[4];
      goto LABEL_25;
    case 3:
      objc_msgSend(v4, "firstObject");
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentValue accessInfo](v7);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[14];
      goto LABEL_25;
    case 4:
      objc_msgSend(v4, "firstObject");
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentValue bounds](v7);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[13];
      goto LABEL_25;
    case 5:
      goto LABEL_66;
    case 6:
      objc_msgSend(v4, "firstObject");
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentValue rating](v7);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[12];
LABEL_25:
      v24 = *(_QWORD *)(v12 + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v11;

LABEL_26:
      goto LABEL_66;
    case 7:
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v72 = v4;
      v13 = v4;
      v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v87;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v87 != v28)
              objc_enumerationMutation(v13);
            v30 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
            if (v30 && *(_QWORD *)(v30 + 536))
            {
              v31 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
              if (!v31)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = *(_QWORD *)(a1[8] + 8);
                v34 = *(void **)(v33 + 40);
                *(_QWORD *)(v33 + 40) = v32;

                v31 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
              }
              -[GEOPDComponentValue review]((id *)v30);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v35);

            }
          }
          v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
        }
        while (v27);
      }
      goto LABEL_65;
    case 8:
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v72 = v4;
      v13 = v4;
      v36 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v79;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v79 != v38)
              objc_enumerationMutation(v13);
            v40 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
            if (v40 && *(_QWORD *)(v40 + 368))
            {
              v41 = *(void **)(*(_QWORD *)(a1[10] + 8) + 40);
              if (!v41)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v42 = objc_claimAutoreleasedReturnValue();
                v43 = *(_QWORD *)(a1[10] + 8);
                v44 = *(void **)(v43 + 40);
                *(_QWORD *)(v43 + 40) = v42;

                v41 = *(void **)(*(_QWORD *)(a1[10] + 8) + 40);
              }
              -[GEOPDComponentValue photo]((id *)v40);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObject:", v45);

            }
          }
          v37 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
        }
        while (v37);
      }
      goto LABEL_65;
    case 9:
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v72 = v4;
      v13 = v4;
      v46 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v91;
        do
        {
          for (k = 0; k != v47; ++k)
          {
            if (*(_QWORD *)v91 != v48)
              objc_enumerationMutation(v13);
            v50 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * k);
            if (v50 && *(_QWORD *)(v50 + 296))
            {
              v51 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
              if (!v51)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v52 = objc_claimAutoreleasedReturnValue();
                v53 = *(_QWORD *)(a1[7] + 8);
                v54 = *(void **)(v53 + 40);
                *(_QWORD *)(v53 + 40) = v52;

                v51 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
              }
              -[GEOPDComponentValue hours]((id *)v50);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "addObject:", v55);

            }
          }
          v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
        }
        while (v47);
      }
      goto LABEL_65;
    default:
      if (v6 == 26)
      {
        v73 = v4;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v56 = v4;
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
        if (!v57)
        {
LABEL_84:

          v5 = v73;
          goto LABEL_66;
        }
        v58 = v57;
        v59 = *(_QWORD *)v75;
LABEL_69:
        v60 = 0;
        while (1)
        {
          if (*(_QWORD *)v75 != v59)
            objc_enumerationMutation(v56);
          v61 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v60);
          if (!v61 || !*(_QWORD *)(v61 + 128))
            goto LABEL_80;
          -[GEOPDComponentValue captionedPhoto](*(id **)(*((_QWORD *)&v74 + 1) + 8 * v60));
          v62 = objc_claimAutoreleasedReturnValue();
          if (!v62)
            break;
          v63 = (_QWORD *)v62;
          -[GEOPDCaptionedPhoto _readPhoto](v62);
          v64 = v63[10];

          if (v64)
          {
            v65 = *(void **)(*(_QWORD *)(a1[11] + 8) + 40);
            if (!v65)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v66 = objc_claimAutoreleasedReturnValue();
              v67 = *(_QWORD *)(a1[11] + 8);
              v68 = *(void **)(v67 + 40);
              *(_QWORD *)(v67 + 40) = v66;

              v65 = *(void **)(*(_QWORD *)(a1[11] + 8) + 40);
            }
            -[GEOPDComponentValue captionedPhoto]((id *)v61);
            v69 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDCaptionedPhoto photo](v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObject:", v70);

            goto LABEL_79;
          }
LABEL_80:
          if (v58 == ++v60)
          {
            v71 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
            v58 = v71;
            if (!v71)
              goto LABEL_84;
            goto LABEL_69;
          }
        }
        v69 = 0;
LABEL_79:

        goto LABEL_80;
      }
      if (v6 == 36)
      {
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v72 = v4;
        v13 = v4;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v83;
          do
          {
            for (m = 0; m != v15; ++m)
            {
              if (*(_QWORD *)v83 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * m);
              if (v18 && *(_QWORD *)(v18 + 624))
              {
                v19 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
                if (!v19)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v20 = objc_claimAutoreleasedReturnValue();
                  v21 = *(_QWORD *)(a1[9] + 8);
                  v22 = *(void **)(v21 + 40);
                  *(_QWORD *)(v21 + 40) = v20;

                  v19 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
                }
                -[GEOPDComponentValue tip]((id *)v18);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v23);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
          }
          while (v15);
        }
LABEL_65:

        v5 = v72;
      }
LABEL_66:

      return;
  }
}

- (GEOPlace)init
{
  GEOPlace *v2;
  GEOPlace *v3;
  GEOPlace *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlace;
  v2 = -[GEOPlace init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlace)initWithData:(id)a3
{
  GEOPlace *v3;
  GEOPlace *v4;
  GEOPlace *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlace;
  v3 = -[GEOPlace initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int64_t)uID
{
  return self->_uID;
}

- (void)setUID:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x1000001u;
  self->_uID = a3;
}

- (void)setHasUID:(BOOL)a3
{
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x1000000);
}

- (BOOL)hasUID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  $E5113E26C002D925BA55E10430DBDBDB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000040u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16777280;
  else
    v3 = 0x1000000;
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        result = CFSTR("DMA");
        break;
      case 'e':
        result = CFSTR("CAT_10284_POSTAL");
        break;
      case 'f':
        result = CFSTR("CAT_10285_CITY");
        break;
      case 'g':
        result = CFSTR("CAT_10286_COUNTY");
        break;
      case 'h':
        result = CFSTR("CAT_10287_STATE");
        break;
      case 'i':
        result = CFSTR("CAT_10288_COUNTRY");
        break;
      case 'j':
        result = CFSTR("CAT_10288_COUNTRY_CODE");
        break;
      case 'k':
        result = CFSTR("CAT_10287_STATE_CODE");
        break;
      default:
        if (a3 == 1016)
        {
          result = CFSTR("PERDU_CITY");
        }
        else
        {
LABEL_38:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
          result = v3;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '#':
        v3 = CFSTR("TIME_ZONE");
        goto LABEL_4;
      case '$':
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '4':
      case '5':
      case '8':
      case ':':
      case '<':
      case '>':
      case '?':
      case '@':
        goto LABEL_38;
      case '+':
        result = CFSTR("NEIGHBORHOOD");
        break;
      case ',':
        result = CFSTR("OCEAN");
        break;
      case '-':
        result = CFSTR("AOI");
        break;
      case '.':
        result = CFSTR("INLAND_WATER");
        break;
      case '/':
        result = CFSTR("POI");
        break;
      case '0':
        result = CFSTR("ISLAND");
        break;
      case '1':
        result = CFSTR("STREET");
        break;
      case '2':
        result = CFSTR("ADMIN");
        break;
      case '3':
        result = CFSTR("POSTAL");
        break;
      case '6':
        result = CFSTR("INTERSECTION");
        break;
      case '7':
        result = CFSTR("BUILDING");
        break;
      case '9':
        result = CFSTR("ADDRESS");
        break;
      case ';':
        result = CFSTR("ZCTAS");
        break;
      case '=':
        result = CFSTR("CONTINENT");
        break;
      case 'A':
        result = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v3 = CFSTR("PT_UNKNOWN");
        switch(a3)
        {
          case 0:
            goto LABEL_4;
          case 1:
            result = CFSTR("COUNTRY");
            break;
          case 2:
            result = CFSTR("STATE");
            break;
          case 3:
            goto LABEL_38;
          case 4:
            result = CFSTR("COUNTY");
            break;
          default:
            if (a3 != 16)
              goto LABEL_38;
            result = CFSTR("CITY");
            break;
        }
        break;
    }
  }
  return result;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEIGHBORHOOD")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZCTAS")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERDU_CITY")) & 1) != 0)
  {
    v4 = 1016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DMA")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10284_POSTAL")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10285_CITY")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10286_COUNTY")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10287_STATE")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10288_COUNTRY")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10288_COUNTRY_CODE")) & 1) != 0)
  {
    v4 = 106;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAT_10287_STATE_CODE")))
  {
    v4 = 107;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 201) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_1504);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasName
{
  -[GEOPlace _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOPlace _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1008000u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 201) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasMapRegion
{
  -[GEOPlace _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOPlace _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1004000u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 201) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasAddress
{
  -[GEOPlace _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEOAddress)address
{
  -[GEOPlace _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1000200u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readPhoneticName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticName_tags_1505);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticName
{
  -[GEOPlace _readPhoneticName]((uint64_t)self);
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEOPlace _readPhoneticName]((uint64_t)self);
  return self->_phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1040000u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (void)_readPhoneticAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticAddress
{
  -[GEOPlace _readPhoneticAddress]((uint64_t)self);
  return self->_phoneticAddress != 0;
}

- (GEOAddress)phoneticAddress
{
  -[GEOPlace _readPhoneticAddress]((uint64_t)self);
  return self->_phoneticAddress;
}

- (void)setPhoneticAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1010000u;
  objc_storeStrong((id *)&self->_phoneticAddress, a3);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 201) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_1506);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasCenter
{
  -[GEOPlace _readCenter]((uint64_t)self);
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPlace _readCenter]((uint64_t)self);
  return self->_center;
}

- (void)setCenter:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1000800u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)_readBusiness
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 201) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusiness_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)business
{
  -[GEOPlace _readBusiness]((uint64_t)self);
  return self->_business;
}

- (void)setBusiness:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *business;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  business = self->_business;
  self->_business = v4;

}

- (void)clearBusiness
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  -[NSMutableArray removeAllObjects](self->_business, "removeAllObjects");
}

- (void)addBusiness:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlace _readBusiness]((uint64_t)self);
  -[GEOPlace _addNoFlagsBusiness:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
}

- (void)_addNoFlagsBusiness:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)businessCount
{
  -[GEOPlace _readBusiness]((uint64_t)self);
  return -[NSMutableArray count](self->_business, "count");
}

- (id)businessAtIndex:(unint64_t)a3
{
  -[GEOPlace _readBusiness]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_business, "objectAtIndex:", a3);
}

+ (Class)businessType
{
  return (Class)objc_opt_class();
}

- (int)addressGeocodeAccuracy
{
  os_unfair_lock_s *p_readerLock;
  $E5113E26C002D925BA55E10430DBDBDB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_addressGeocodeAccuracy;
  else
    return 0;
}

- (void)setAddressGeocodeAccuracy:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000008u;
  self->_addressGeocodeAccuracy = a3;
}

- (void)setHasAddressGeocodeAccuracy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16777224;
  else
    v3 = 0x1000000;
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAddressGeocodeAccuracy
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)addressGeocodeAccuracyAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0F1A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAddressGeocodeAccuracy:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBPREMISE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEntryPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 201) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntryPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)entryPoints
{
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  return self->_entryPoints;
}

- (void)setEntryPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *entryPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  entryPoints = self->_entryPoints;
  self->_entryPoints = v4;

}

- (void)clearEntryPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  -[NSMutableArray removeAllObjects](self->_entryPoints, "removeAllObjects");
}

- (void)addEntryPoint:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  -[GEOPlace _addNoFlagsEntryPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
}

- (void)_addNoFlagsEntryPoint:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)entryPointsCount
{
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_entryPoints, "count");
}

- (id)entryPointAtIndex:(unint64_t)a3
{
  -[GEOPlace _readEntryPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_entryPoints, "objectAtIndex:", a3);
}

+ (Class)entryPointType
{
  return (Class)objc_opt_class();
}

- (BOOL)isDisputed
{
  os_unfair_lock_s *p_readerLock;
  $E5113E26C002D925BA55E10430DBDBDB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 0x80) != 0 && self->_isDisputed;
}

- (void)setIsDisputed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x1000080u;
  self->_isDisputed = a3;
}

- (void)setHasIsDisputed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16777344;
  else
    v3 = 0x1000000;
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsDisputed
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000010u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16777232;
  else
    v3 = 0x1000000;
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readSpokenName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasSpokenName
{
  -[GEOPlace _readSpokenName]((uint64_t)self);
  return self->_spokenName != 0;
}

- (NSString)spokenName
{
  -[GEOPlace _readSpokenName]((uint64_t)self);
  return self->_spokenName;
}

- (void)setSpokenName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1200000u;
  objc_storeStrong((id *)&self->_spokenName, a3);
}

- (void)_readSpokenAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasSpokenAddress
{
  -[GEOPlace _readSpokenAddress]((uint64_t)self);
  return self->_spokenAddress != 0;
}

- (NSString)spokenAddress
{
  -[GEOPlace _readSpokenAddress]((uint64_t)self);
  return self->_spokenAddress;
}

- (void)setSpokenAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1100000u;
  objc_storeStrong((id *)&self->_spokenAddress, a3);
}

- (double)area
{
  return self->_area;
}

- (void)setArea:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x1000002u;
  self->_area = a3;
}

- (void)setHasArea:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16777218;
  else
    v3 = 0x1000000;
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasArea
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readSpokenStructuredAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenStructuredAddress_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasSpokenStructuredAddress
{
  -[GEOPlace _readSpokenStructuredAddress]((uint64_t)self);
  return self->_spokenStructuredAddress != 0;
}

- (GEOStructuredAddress)spokenStructuredAddress
{
  -[GEOPlace _readSpokenStructuredAddress]((uint64_t)self);
  return self->_spokenStructuredAddress;
}

- (void)setSpokenStructuredAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1400000u;
  objc_storeStrong((id *)&self->_spokenStructuredAddress, a3);
}

- (void)_readTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasTimezone
{
  -[GEOPlace _readTimezone]((uint64_t)self);
  return self->_timezone != 0;
}

- (GEOTimezone)timezone
{
  -[GEOPlace _readTimezone]((uint64_t)self);
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1800000u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (void)_readDisplayMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 201) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasDisplayMapRegion
{
  -[GEOPlace _readDisplayMapRegion]((uint64_t)self);
  return self->_displayMapRegion != 0;
}

- (GEOMapRegion)displayMapRegion
{
  -[GEOPlace _readDisplayMapRegion]((uint64_t)self);
  return self->_displayMapRegion;
}

- (void)setDisplayMapRegion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1001000u;
  objc_storeStrong((id *)&self->_displayMapRegion, a3);
}

- (void)_readRoadAccessPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoadAccessPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)roadAccessPoints
{
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  return self->_roadAccessPoints;
}

- (void)setRoadAccessPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *roadAccessPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  roadAccessPoints = self->_roadAccessPoints;
  self->_roadAccessPoints = v4;

}

- (void)clearRoadAccessPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  -[NSMutableArray removeAllObjects](self->_roadAccessPoints, "removeAllObjects");
}

- (void)addRoadAccessPoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  -[GEOPlace _addNoFlagsRoadAccessPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x1000000u;
}

- (void)_addNoFlagsRoadAccessPoints:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)roadAccessPointsCount
{
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_roadAccessPoints, "count");
}

- (id)roadAccessPointsAtIndex:(unint64_t)a3
{
  -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_roadAccessPoints, "objectAtIndex:", a3);
}

+ (Class)roadAccessPointsType
{
  return (Class)objc_opt_class();
}

- (int64_t)geoId
{
  return self->_geoId;
}

- (void)setGeoId:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x1000004u;
  self->_geoId = a3;
}

- (void)setHasGeoId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16777220;
  else
    v3 = 0x1000000;
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasGeoId
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPlace;
  -[GEOPlace description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlace dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  id v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 200);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("uID");
    else
      v7 = CFSTR("UID");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_DWORD *)(a1 + 200);
  }
  if ((v5 & 0x40) != 0)
  {
    v8 = *(_DWORD *)(a1 + 192);
    if (v8 > 99)
    {
      switch(v8)
      {
        case 'd':
          v9 = CFSTR("DMA");
          break;
        case 'e':
          v9 = CFSTR("CAT_10284_POSTAL");
          break;
        case 'f':
          v9 = CFSTR("CAT_10285_CITY");
          break;
        case 'g':
          v9 = CFSTR("CAT_10286_COUNTY");
          break;
        case 'h':
          v9 = CFSTR("CAT_10287_STATE");
          break;
        case 'i':
          v9 = CFSTR("CAT_10288_COUNTRY");
          break;
        case 'j':
          v9 = CFSTR("CAT_10288_COUNTRY_CODE");
          break;
        case 'k':
          v9 = CFSTR("CAT_10287_STATE_CODE");
          break;
        default:
          if (v8 == 1016)
          {
            v9 = CFSTR("PERDU_CITY");
          }
          else
          {
LABEL_19:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 192));
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          break;
      }
    }
    else
    {
      switch(v8)
      {
        case '#':
          v9 = CFSTR("TIME_ZONE");
          break;
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '4':
        case '5':
        case '8':
        case ':':
        case '<':
        case '>':
        case '?':
        case '@':
          goto LABEL_19;
        case '+':
          v9 = CFSTR("NEIGHBORHOOD");
          break;
        case ',':
          v9 = CFSTR("OCEAN");
          break;
        case '-':
          v9 = CFSTR("AOI");
          break;
        case '.':
          v9 = CFSTR("INLAND_WATER");
          break;
        case '/':
          v9 = CFSTR("POI");
          break;
        case '0':
          v9 = CFSTR("ISLAND");
          break;
        case '1':
          v9 = CFSTR("STREET");
          break;
        case '2':
          v9 = CFSTR("ADMIN");
          break;
        case '3':
          v9 = CFSTR("POSTAL");
          break;
        case '6':
          v9 = CFSTR("INTERSECTION");
          break;
        case '7':
          v9 = CFSTR("BUILDING");
          break;
        case '9':
          v9 = CFSTR("ADDRESS");
          break;
        case ';':
          v9 = CFSTR("ZCTAS");
          break;
        case '=':
          v9 = CFSTR("CONTINENT");
          break;
        case 'A':
          v9 = CFSTR("PHYSICAL_FEATURE");
          break;
        default:
          v9 = CFSTR("PT_UNKNOWN");
          switch(v8)
          {
            case 0:
              goto LABEL_44;
            case 1:
              v9 = CFSTR("COUNTRY");
              break;
            case 2:
              v9 = CFSTR("STATE");
              break;
            case 3:
              goto LABEL_19;
            case 4:
              v9 = CFSTR("COUNTY");
              break;
            default:
              if (v8 != 16)
                goto LABEL_19;
              v9 = CFSTR("CITY");
              break;
          }
          break;
      }
    }
LABEL_44:
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("type"));

  }
  objc_msgSend((id)a1, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("name"));

  objc_msgSend((id)a1, "mapRegion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("mapRegion"));
  }

  objc_msgSend((id)a1, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v14, "jsonRepresentation");
    else
      objc_msgSend(v14, "dictionaryRepresentation");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("address"));
  }

  objc_msgSend((id)a1, "phoneticName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("phoneticName"));

  objc_msgSend((id)a1, "phoneticAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("phoneticAddress"));
  }

  objc_msgSend((id)a1, "center");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v21, "jsonRepresentation");
    else
      objc_msgSend(v21, "dictionaryRepresentation");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("center"));
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v25 = *(id *)(a1 + 48);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v88 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("business"));
  }
  if ((*(_BYTE *)(a1 + 200) & 8) != 0)
  {
    v32 = *(int *)(a1 + 180);
    if (v32 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 180));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E1C0F1A8[v32];
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("addressGeocodeAccuracy"));

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v35 = *(id *)(a1 + 72);
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v84 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v40, "jsonRepresentation");
          else
            objc_msgSend(v40, "dictionaryRepresentation");
          v41 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "addObject:", v41);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("entryPoint"));
  }
  v42 = *(_DWORD *)(a1 + 200);
  if ((v42 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 196));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("isDisputed"));

    v42 = *(_DWORD *)(a1 + 200);
  }
  if ((v42 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 184));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("localSearchProviderID"));

  }
  objc_msgSend((id)a1, "spokenName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("spokenName"));

  objc_msgSend((id)a1, "spokenAddress");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("spokenAddress"));

  if ((*(_BYTE *)(a1 + 200) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("area"));

  }
  objc_msgSend((id)a1, "spokenStructuredAddress");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v48, "jsonRepresentation");
    else
      objc_msgSend(v48, "dictionaryRepresentation");
    v50 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("spokenStructuredAddress"));
  }

  objc_msgSend((id)a1, "timezone");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v51, "jsonRepresentation");
    else
      objc_msgSend(v51, "dictionaryRepresentation");
    v53 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("timezone"));
  }

  objc_msgSend((id)a1, "displayMapRegion");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v54, "jsonRepresentation");
    else
      objc_msgSend(v54, "dictionaryRepresentation");
    v56 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("displayMapRegion"));
  }

  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v58 = *(id *)(a1 + 128);
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v80;
      do
      {
        for (k = 0; k != v60; ++k)
        {
          if (*(_QWORD *)v80 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v63, "jsonRepresentation");
          else
            objc_msgSend(v63, "dictionaryRepresentation");
          v64 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "addObject:", v64);
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
      }
      while (v60);
    }

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("roadAccessPoints"));
  }
  if ((*(_BYTE *)(a1 + 200) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 80));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("geoId"));

  }
  objc_msgSend((id)a1, "phoneticLocaleIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("phoneticLocaleIdentifier"));

  if ((*(_BYTE *)(a1 + 200) & 0x20) != 0)
  {
    v67 = *(int *)(a1 + 188);
    if (v67 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 188));
      v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v68 = off_1E1C0F128[v67];
    }
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("referenceFrame"));

  }
  v69 = *(void **)(a1 + 16);
  if (v69)
  {
    objc_msgSend(v69, "dictionaryRepresentation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v70, "count"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __38__GEOPlace__dictionaryRepresentation___block_invoke;
      v77[3] = &unk_1E1C00600;
      v73 = v72;
      v78 = v73;
      objc_msgSend(v71, "enumerateKeysAndObjectsUsingBlock:", v77);
      v74 = v73;

      v71 = v74;
    }
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("Unknown Fields"));

  }
  v75 = v4;

  return v75;
}

- (id)jsonRepresentation
{
  return -[GEOPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEOPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPlace)initWithDictionary:(id)a3
{
  return (GEOPlace *)-[GEOPlace _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  GEOMapRegion *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GEOAddress *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  GEOAddress *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  GEOLatLng *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  GEOBusiness *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  GEOLatLng *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  GEOStructuredAddress *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  GEOTimezone *v66;
  void *v67;
  void *v68;
  GEOMapRegion *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  uint64_t v78;
  GEORoadAccessPoint *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (id)objc_msgSend(a1, "init");

    if (a1)
    {
      if (a3)
        v6 = CFSTR("uID");
      else
        v6 = CFSTR("UID");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setUID:", objc_msgSend(v7, "longLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v89 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PT_UNKNOWN")) & 1) != 0)
        {
          v10 = 0;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
        {
          v10 = 1;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
        {
          v10 = 2;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
        {
          v10 = 4;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
        {
          v10 = 16;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
        {
          v10 = 35;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("NEIGHBORHOOD")) & 1) != 0)
        {
          v10 = 43;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
        {
          v10 = 44;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
        {
          v10 = 45;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
        {
          v10 = 46;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI")) & 1) != 0)
        {
          v10 = 47;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
        {
          v10 = 48;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
        {
          v10 = 49;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
        {
          v10 = 50;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
        {
          v10 = 51;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
        {
          v10 = 54;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
        {
          v10 = 55;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
        {
          v10 = 57;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ZCTAS")) & 1) != 0)
        {
          v10 = 59;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
        {
          v10 = 61;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")) & 1) != 0)
        {
          v10 = 65;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PERDU_CITY")) & 1) != 0)
        {
          v10 = 1016;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DMA")) & 1) != 0)
        {
          v10 = 100;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CAT_10284_POSTAL")) & 1) != 0)
        {
          v10 = 101;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CAT_10285_CITY")) & 1) != 0)
        {
          v10 = 102;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CAT_10286_COUNTY")) & 1) != 0)
        {
          v10 = 103;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CAT_10287_STATE")) & 1) != 0)
        {
          v10 = 104;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CAT_10288_COUNTRY")) & 1) != 0)
        {
          v10 = 105;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CAT_10288_COUNTRY_CODE")) & 1) != 0)
        {
          v10 = 106;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("CAT_10287_STATE_CODE")))
        {
          v10 = 107;
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_74;
        v10 = objc_msgSend(v8, "intValue");
      }
      objc_msgSend(a1, "setType:", v10);
LABEL_74:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setName:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapRegion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOMapRegion initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOMapRegion initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setMapRegion:", v15);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOAddress alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOAddress initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOAddress initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setAddress:", v19);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("phoneticName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = (void *)objc_msgSend(v21, "copy");
        objc_msgSend(a1, "setPhoneticName:", v22);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("phoneticAddress"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEOAddress alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEOAddress initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEOAddress initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = (void *)v25;
        objc_msgSend(a1, "setPhoneticAddress:", v25);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEOLatLng initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEOLatLng initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setCenter:", v29);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("business"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v99 != v35)
                objc_enumerationMutation(v32);
              v37 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = [GEOBusiness alloc];
                if ((a3 & 1) != 0)
                  v39 = -[GEOBusiness initWithJSON:](v38, "initWithJSON:", v37);
                else
                  v39 = -[GEOBusiness initWithDictionary:](v38, "initWithDictionary:", v37);
                v40 = (void *)v39;
                objc_msgSend(a1, "addBusiness:", v39);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
          }
          while (v34);
        }

        v5 = v89;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressGeocodeAccuracy"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = v41;
        if ((objc_msgSend(v42, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
        {
          v43 = 0;
        }
        else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
        {
          v43 = 1;
        }
        else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
        {
          v43 = 2;
        }
        else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
        {
          v43 = 3;
        }
        else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
        {
          v43 = 4;
        }
        else if (objc_msgSend(v42, "isEqualToString:", CFSTR("SUBPREMISE")))
        {
          v43 = 5;
        }
        else
        {
          v43 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_130;
        v43 = objc_msgSend(v41, "intValue");
      }
      objc_msgSend(a1, "setAddressGeocodeAccuracy:", v43);
LABEL_130:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entryPoint"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v45 = v44;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v95 != v48)
                objc_enumerationMutation(v45);
              v50 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v51 = [GEOLatLng alloc];
                if ((a3 & 1) != 0)
                  v52 = -[GEOLatLng initWithJSON:](v51, "initWithJSON:", v50);
                else
                  v52 = -[GEOLatLng initWithDictionary:](v51, "initWithDictionary:", v50);
                v53 = (void *)v52;
                objc_msgSend(a1, "addEntryPoint:", v52);

              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
          }
          while (v47);
        }

        v5 = v89;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isDisputed"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsDisputed:", objc_msgSend(v54, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localSearchProviderID"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v55, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spokenName"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = (void *)objc_msgSend(v56, "copy");
        objc_msgSend(a1, "setSpokenName:", v57);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spokenAddress"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = (void *)objc_msgSend(v58, "copy");
        objc_msgSend(a1, "setSpokenAddress:", v59);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("area"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v60, "doubleValue");
        objc_msgSend(a1, "setArea:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spokenStructuredAddress"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = [GEOStructuredAddress alloc];
        if ((a3 & 1) != 0)
          v63 = -[GEOStructuredAddress initWithJSON:](v62, "initWithJSON:", v61);
        else
          v63 = -[GEOStructuredAddress initWithDictionary:](v62, "initWithDictionary:", v61);
        v64 = (void *)v63;
        objc_msgSend(a1, "setSpokenStructuredAddress:", v63);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timezone"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = [GEOTimezone alloc];
        if (v66)
          v67 = -[GEOTimezone _initWithDictionary:isJSON:](v66, v65);
        else
          v67 = 0;
        objc_msgSend(a1, "setTimezone:", v67);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayMapRegion"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v70 = -[GEOMapRegion initWithJSON:](v69, "initWithJSON:", v68);
        else
          v70 = -[GEOMapRegion initWithDictionary:](v69, "initWithDictionary:", v68);
        v71 = (void *)v70;
        objc_msgSend(a1, "setDisplayMapRegion:", v70);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roadAccessPoints"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v73 = v72;
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
        if (v74)
        {
          v75 = v74;
          v76 = *(_QWORD *)v91;
          do
          {
            for (k = 0; k != v75; ++k)
            {
              if (*(_QWORD *)v91 != v76)
                objc_enumerationMutation(v73);
              v78 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v79 = [GEORoadAccessPoint alloc];
                if ((a3 & 1) != 0)
                  v80 = -[GEORoadAccessPoint initWithJSON:](v79, "initWithJSON:", v78);
                else
                  v80 = -[GEORoadAccessPoint initWithDictionary:](v79, "initWithDictionary:", v78);
                v81 = (void *)v80;
                objc_msgSend(a1, "addRoadAccessPoints:", v80);

              }
            }
            v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          }
          while (v75);
        }

        v5 = v89;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geoId"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setGeoId:", objc_msgSend(v82, "longLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("phoneticLocaleIdentifier"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v84 = (void *)objc_msgSend(v83, "copy");
        objc_msgSend(a1, "setPhoneticLocaleIdentifier:", v84);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("referenceFrame"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v86 = v85;
        if ((objc_msgSend(v86, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v87 = 0;
        }
        else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
        {
          v87 = 1;
        }
        else if (objc_msgSend(v86, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
        {
          v87 = 2;
        }
        else
        {
          v87 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_198:

          a1 = a1;
          goto LABEL_199;
        }
        v87 = objc_msgSend(v85, "intValue");
      }
      objc_msgSend(a1, "setReferenceFrame:", v87);
      goto LABEL_198;
    }
  }
LABEL_199:

  return a1;
}

- (GEOPlace)initWithJSON:(id)a3
{
  return (GEOPlace *)-[GEOPlace _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1547;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1548;
    GEOPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPlaceCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $E5113E26C002D925BA55E10430DBDBDB flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  $E5113E26C002D925BA55E10430DBDBDB v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  PBDataReader *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceIsDirty((uint64_t)self) & 1) == 0)
  {
    v20 = self->_reader;
    objc_sync_enter(v20);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v21);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPlace readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      PBDataWriterWriteInt64Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x40) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    if (self->_address)
      PBDataWriterWriteSubmessage();
    if (self->_phoneticName)
      PBDataWriterWriteStringField();
    if (self->_phoneticAddress)
      PBDataWriterWriteSubmessage();
    if (self->_center)
      PBDataWriterWriteSubmessage();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_business;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v8);
    }

    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteInt32Field();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = self->_entryPoints;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v12);
    }

    v15 = self->_flags;
    if ((*(_BYTE *)&v15 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_BYTE *)&v15 & 0x10) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_spokenName)
      PBDataWriterWriteStringField();
    if (self->_spokenAddress)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_spokenStructuredAddress)
      PBDataWriterWriteSubmessage();
    if (self->_timezone)
      PBDataWriterWriteSubmessage();
    if (self->_displayMapRegion)
      PBDataWriterWriteSubmessage();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = self->_roadAccessPoints;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteSubmessage();
          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v17);
    }

    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt64Field();
    if (self->_phoneticLocaleIdentifier)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v22);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  -[GEOPlace _readBusiness]((uint64_t)self);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_business;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_30;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOPlace _readCenter]((uint64_t)self);
  if (!-[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", v3))
  {
    -[GEOPlace _readDisplayMapRegion]((uint64_t)self);
    if (!-[GEOMapRegion hasGreenTeaWithValue:](self->_displayMapRegion, "hasGreenTeaWithValue:", v3))
    {
      -[GEOPlace _readEntryPoints]((uint64_t)self);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v5 = self->_entryPoints;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
LABEL_14:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3) & 1) != 0)
            break;
          if (v12 == ++v14)
          {
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
            if (v12)
              goto LABEL_14;
            goto LABEL_20;
          }
        }
      }
      else
      {
LABEL_20:

        -[GEOPlace _readMapRegion]((uint64_t)self);
        if (-[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", v3))
          return 1;
        -[GEOPlace _readRoadAccessPoints]((uint64_t)self);
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v5 = self->_roadAccessPoints;
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        if (!v15)
        {
LABEL_29:
          v10 = 0;
LABEL_31:

          return v10;
        }
        v16 = v15;
        v17 = *(_QWORD *)v21;
LABEL_23:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "hasGreenTeaWithValue:", v3, (_QWORD)v20) & 1) != 0)
            break;
          if (v16 == ++v18)
          {
            v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
            if (v16)
              goto LABEL_23;
            goto LABEL_29;
          }
        }
      }
LABEL_30:
      v10 = 1;
      goto LABEL_31;
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  $E5113E26C002D925BA55E10430DBDBDB flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  $E5113E26C002D925BA55E10430DBDBDB v13;
  id *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  id *v19;
  id *v20;

  v20 = (id *)a3;
  -[GEOPlace readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 42) = self->_readerMarkPos;
  *((_DWORD *)v20 + 43) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v20[3] = (id)self->_uID;
    *((_DWORD *)v20 + 50) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *((_DWORD *)v20 + 48) = self->_type;
    *((_DWORD *)v20 + 50) |= 0x40u;
  }
  if (self->_name)
    objc_msgSend(v20, "setName:");
  if (self->_mapRegion)
    objc_msgSend(v20, "setMapRegion:");
  if (self->_address)
    objc_msgSend(v20, "setAddress:");
  if (self->_phoneticName)
    objc_msgSend(v20, "setPhoneticName:");
  if (self->_phoneticAddress)
    objc_msgSend(v20, "setPhoneticAddress:");
  if (self->_center)
    objc_msgSend(v20, "setCenter:");
  if (-[GEOPlace businessCount](self, "businessCount"))
  {
    objc_msgSend(v20, "clearBusiness");
    v5 = -[GEOPlace businessCount](self, "businessCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOPlace businessAtIndex:](self, "businessAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addBusiness:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v20 + 45) = self->_addressGeocodeAccuracy;
    *((_DWORD *)v20 + 50) |= 8u;
  }
  if (-[GEOPlace entryPointsCount](self, "entryPointsCount"))
  {
    objc_msgSend(v20, "clearEntryPoints");
    v9 = -[GEOPlace entryPointsCount](self, "entryPointsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOPlace entryPointAtIndex:](self, "entryPointAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addEntryPoint:", v12);

      }
    }
  }
  v13 = self->_flags;
  v14 = v20;
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
    *((_BYTE *)v20 + 196) = self->_isDisputed;
    *((_DWORD *)v20 + 50) |= 0x80u;
    v13 = self->_flags;
  }
  if ((*(_BYTE *)&v13 & 0x10) != 0)
  {
    *((_DWORD *)v20 + 46) = self->_localSearchProviderID;
    *((_DWORD *)v20 + 50) |= 0x10u;
  }
  if (self->_spokenName)
  {
    objc_msgSend(v20, "setSpokenName:");
    v14 = v20;
  }
  if (self->_spokenAddress)
  {
    objc_msgSend(v20, "setSpokenAddress:");
    v14 = v20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v14[5] = *(id *)&self->_area;
    *((_DWORD *)v14 + 50) |= 2u;
  }
  if (self->_spokenStructuredAddress)
    objc_msgSend(v20, "setSpokenStructuredAddress:");
  if (self->_timezone)
    objc_msgSend(v20, "setTimezone:");
  if (self->_displayMapRegion)
    objc_msgSend(v20, "setDisplayMapRegion:");
  if (-[GEOPlace roadAccessPointsCount](self, "roadAccessPointsCount"))
  {
    objc_msgSend(v20, "clearRoadAccessPoints");
    v15 = -[GEOPlace roadAccessPointsCount](self, "roadAccessPointsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[GEOPlace roadAccessPointsAtIndex:](self, "roadAccessPointsAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addRoadAccessPoints:", v18);

      }
    }
  }
  v19 = v20;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v20[10] = (id)self->_geoId;
    *((_DWORD *)v20 + 50) |= 4u;
  }
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v20, "setPhoneticLocaleIdentifier:");
    v19 = v20;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v19 + 47) = self->_referenceFrame;
    *((_DWORD *)v19 + 50) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $E5113E26C002D925BA55E10430DBDBDB flags;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  $E5113E26C002D925BA55E10430DBDBDB v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  uint64_t v48;
  void *v49;
  PBUnknownFields *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_43;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlace readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_uID;
    *(_DWORD *)(v5 + 200) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_type;
    *(_DWORD *)(v5 + 200) |= 0x40u;
  }
  v10 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  v12 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v12;

  v14 = -[GEOAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSString copyWithZone:](self->_phoneticName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v16;

  v18 = -[GEOAddress copyWithZone:](self->_phoneticAddress, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v18;

  v20 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v22 = self->_business;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v61 != v24)
          objc_enumerationMutation(v22);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBusiness:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v23);
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 180) = self->_addressGeocodeAccuracy;
    *(_DWORD *)(v5 + 200) |= 8u;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v27 = self->_entryPoints;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v57 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEntryPoint:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v28);
  }

  v32 = self->_flags;
  if ((*(_BYTE *)&v32 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 196) = self->_isDisputed;
    *(_DWORD *)(v5 + 200) |= 0x80u;
    v32 = self->_flags;
  }
  if ((*(_BYTE *)&v32 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_localSearchProviderID;
    *(_DWORD *)(v5 + 200) |= 0x10u;
  }
  v33 = -[NSString copyWithZone:](self->_spokenName, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v33;

  v35 = -[NSString copyWithZone:](self->_spokenAddress, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v35;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_area;
    *(_DWORD *)(v5 + 200) |= 2u;
  }
  v37 = -[GEOStructuredAddress copyWithZone:](self->_spokenStructuredAddress, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v37;

  v39 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v39;

  v41 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v41;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v43 = self->_roadAccessPoints;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v53 != v45)
          objc_enumerationMutation(v43);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v52);
        objc_msgSend((id)v5, "addRoadAccessPoints:", v47);

      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v44);
  }

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_geoId;
    *(_DWORD *)(v5 + 200) |= 4u;
  }
  v48 = -[NSString copyWithZone:](self->_phoneticLocaleIdentifier, "copyWithZone:", a3, (_QWORD)v52);
  v49 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v48;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 188) = self->_referenceFrame;
    *(_DWORD *)(v5 + 200) |= 0x20u;
  }
  v50 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v50;
LABEL_43:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $E5113E26C002D925BA55E10430DBDBDB flags;
  int v6;
  NSString *name;
  GEOMapRegion *mapRegion;
  GEOAddress *address;
  NSString *phoneticName;
  GEOAddress *phoneticAddress;
  GEOLatLng *center;
  NSMutableArray *business;
  $E5113E26C002D925BA55E10430DBDBDB v14;
  int v15;
  NSMutableArray *entryPoints;
  NSString *spokenName;
  NSString *spokenAddress;
  int v19;
  GEOStructuredAddress *spokenStructuredAddress;
  GEOTimezone *timezone;
  GEOMapRegion *displayMapRegion;
  NSMutableArray *roadAccessPoints;
  $E5113E26C002D925BA55E10430DBDBDB v24;
  int v25;
  NSString *phoneticLocaleIdentifier;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_77;
  -[GEOPlace readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_uID != *((_QWORD *)v4 + 3))
      goto LABEL_77;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 48))
      goto LABEL_77;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 12) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_77;
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_77;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOAddress isEqual:](address, "isEqual:"))
      goto LABEL_77;
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:"))
      goto LABEL_77;
  }
  phoneticAddress = self->_phoneticAddress;
  if ((unint64_t)phoneticAddress | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOAddress isEqual:](phoneticAddress, "isEqual:"))
      goto LABEL_77;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_77;
  }
  business = self->_business;
  if ((unint64_t)business | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](business, "isEqual:"))
      goto LABEL_77;
  }
  v14 = self->_flags;
  v15 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_addressGeocodeAccuracy != *((_DWORD *)v4 + 45))
      goto LABEL_77;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_77;
  }
  entryPoints = self->_entryPoints;
  if ((unint64_t)entryPoints | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](entryPoints, "isEqual:"))
      goto LABEL_77;
    v14 = self->_flags;
    v15 = *((_DWORD *)v4 + 50);
  }
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0)
      goto LABEL_77;
    if (self->_isDisputed)
    {
      if (!*((_BYTE *)v4 + 196))
        goto LABEL_77;
    }
    else if (*((_BYTE *)v4 + 196))
    {
      goto LABEL_77;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 46))
      goto LABEL_77;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  spokenName = self->_spokenName;
  if ((unint64_t)spokenName | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](spokenName, "isEqual:"))
  {
    goto LABEL_77;
  }
  spokenAddress = self->_spokenAddress;
  if ((unint64_t)spokenAddress | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](spokenAddress, "isEqual:"))
      goto LABEL_77;
  }
  v19 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_area != *((double *)v4 + 5))
      goto LABEL_77;
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_77;
  }
  spokenStructuredAddress = self->_spokenStructuredAddress;
  if ((unint64_t)spokenStructuredAddress | *((_QWORD *)v4 + 19)
    && !-[GEOStructuredAddress isEqual:](spokenStructuredAddress, "isEqual:"))
  {
    goto LABEL_77;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:"))
      goto LABEL_77;
  }
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
      goto LABEL_77;
  }
  roadAccessPoints = self->_roadAccessPoints;
  if ((unint64_t)roadAccessPoints | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](roadAccessPoints, "isEqual:"))
      goto LABEL_77;
  }
  v24 = self->_flags;
  v25 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_geoId != *((_QWORD *)v4 + 10))
      goto LABEL_77;
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_77;
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((_QWORD *)v4 + 14))
  {
    if (-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:"))
    {
      v24 = self->_flags;
      v25 = *((_DWORD *)v4 + 50);
      goto LABEL_72;
    }
LABEL_77:
    v27 = 0;
    goto LABEL_78;
  }
LABEL_72:
  if ((*(_BYTE *)&v24 & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 47))
      goto LABEL_77;
    v27 = 1;
  }
  else
  {
    v27 = (v25 & 0x20) == 0;
  }
LABEL_78:

  return v27;
}

- (unint64_t)hash
{
  $E5113E26C002D925BA55E10430DBDBDB flags;
  $E5113E26C002D925BA55E10430DBDBDB v4;
  NSUInteger v5;
  unint64_t v6;
  double area;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  NSUInteger v27;
  unint64_t v28;
  unint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;

  -[GEOPlace readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v32 = 2654435761 * self->_uID;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_3;
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
LABEL_3:
      v31 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  v31 = 0;
LABEL_6:
  v30 = -[NSString hash](self->_name, "hash");
  v29 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v28 = -[GEOAddress hash](self->_address, "hash");
  v27 = -[NSString hash](self->_phoneticName, "hash");
  v26 = -[GEOAddress hash](self->_phoneticAddress, "hash");
  v25 = -[GEOLatLng hash](self->_center, "hash");
  v24 = -[NSMutableArray hash](self->_business, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v23 = 2654435761 * self->_addressGeocodeAccuracy;
  else
    v23 = 0;
  v22 = -[NSMutableArray hash](self->_entryPoints, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
    v21 = 2654435761 * self->_isDisputed;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_11;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
    {
LABEL_11:
      v20 = 2654435761 * self->_localSearchProviderID;
      goto LABEL_14;
    }
  }
  v20 = 0;
LABEL_14:
  v19 = -[NSString hash](self->_spokenName, "hash");
  v5 = -[NSString hash](self->_spokenAddress, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    area = self->_area;
    v8 = -area;
    if (area >= 0.0)
      v8 = self->_area;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = -[GEOStructuredAddress hash](self->_spokenStructuredAddress, "hash");
  v12 = -[GEOTimezone hash](self->_timezone, "hash");
  v13 = -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  v14 = -[NSMutableArray hash](self->_roadAccessPoints, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v15 = 2654435761 * self->_geoId;
  else
    v15 = 0;
  v16 = -[NSString hash](self->_phoneticLocaleIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v17 = 2654435761 * self->_referenceFrame;
  else
    v17 = 0;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  GEOMapRegion *mapRegion;
  uint64_t v7;
  GEOAddress *address;
  uint64_t v9;
  GEOAddress *phoneticAddress;
  uint64_t v11;
  GEOLatLng *center;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  int v24;
  GEOStructuredAddress *spokenStructuredAddress;
  uint64_t v26;
  GEOTimezone *timezone;
  uint64_t v28;
  void *v29;
  GEOMapRegion *displayMapRegion;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_DWORD *)v4 + 50);
  if ((v5 & 1) != 0)
  {
    self->_uID = *((_QWORD *)v4 + 3);
    *(_DWORD *)&self->_flags |= 1u;
    v5 = *((_DWORD *)v4 + 50);
  }
  if ((v5 & 0x40) != 0)
  {
    self->_type = *((_DWORD *)v4 + 48);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  if (*((_QWORD *)v4 + 12))
    -[GEOPlace setName:](self, "setName:");
  mapRegion = self->_mapRegion;
  v7 = *((_QWORD *)v4 + 11);
  if (mapRegion)
  {
    if (v7)
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPlace setMapRegion:](self, "setMapRegion:");
  }
  address = self->_address;
  v9 = *((_QWORD *)v4 + 4);
  if (address)
  {
    if (v9)
      -[GEOAddress mergeFrom:](address, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOPlace setAddress:](self, "setAddress:");
  }
  if (*((_QWORD *)v4 + 15))
    -[GEOPlace setPhoneticName:](self, "setPhoneticName:");
  phoneticAddress = self->_phoneticAddress;
  v11 = *((_QWORD *)v4 + 13);
  if (phoneticAddress)
  {
    if (v11)
      -[GEOAddress mergeFrom:](phoneticAddress, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOPlace setPhoneticAddress:](self, "setPhoneticAddress:");
  }
  center = self->_center;
  v13 = *((_QWORD *)v4 + 7);
  if (center)
  {
    if (v13)
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOPlace setCenter:](self, "setCenter:");
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v14 = *((id *)v4 + 6);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v14);
        -[GEOPlace addBusiness:](self, "addBusiness:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v16);
  }

  if ((*((_BYTE *)v4 + 200) & 8) != 0)
  {
    self->_addressGeocodeAccuracy = *((_DWORD *)v4 + 45);
    *(_DWORD *)&self->_flags |= 8u;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v19 = *((id *)v4 + 9);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(v19);
        -[GEOPlace addEntryPoint:](self, "addEntryPoint:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v21);
  }

  v24 = *((_DWORD *)v4 + 50);
  if ((v24 & 0x80) != 0)
  {
    self->_isDisputed = *((_BYTE *)v4 + 196);
    *(_DWORD *)&self->_flags |= 0x80u;
    v24 = *((_DWORD *)v4 + 50);
  }
  if ((v24 & 0x10) != 0)
  {
    self->_localSearchProviderID = *((_DWORD *)v4 + 46);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (*((_QWORD *)v4 + 18))
    -[GEOPlace setSpokenName:](self, "setSpokenName:");
  if (*((_QWORD *)v4 + 17))
    -[GEOPlace setSpokenAddress:](self, "setSpokenAddress:");
  if ((*((_BYTE *)v4 + 200) & 2) != 0)
  {
    self->_area = *((double *)v4 + 5);
    *(_DWORD *)&self->_flags |= 2u;
  }
  spokenStructuredAddress = self->_spokenStructuredAddress;
  v26 = *((_QWORD *)v4 + 19);
  if (spokenStructuredAddress)
  {
    if (v26)
      -[GEOStructuredAddress mergeFrom:](spokenStructuredAddress, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOPlace setSpokenStructuredAddress:](self, "setSpokenStructuredAddress:");
  }
  timezone = self->_timezone;
  v28 = *((_QWORD *)v4 + 20);
  if (timezone)
  {
    if (v28)
    {
      v29 = *(void **)(v28 + 16);
      if (v29)
        -[GEOTimezone setIdentifier:]((uint64_t)timezone, v29);
    }
  }
  else if (v28)
  {
    -[GEOPlace setTimezone:](self, "setTimezone:");
  }
  displayMapRegion = self->_displayMapRegion;
  v31 = *((_QWORD *)v4 + 8);
  if (displayMapRegion)
  {
    if (v31)
      -[GEOMapRegion mergeFrom:](displayMapRegion, "mergeFrom:");
  }
  else if (v31)
  {
    -[GEOPlace setDisplayMapRegion:](self, "setDisplayMapRegion:");
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v32 = *((id *)v4 + 16);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(v32);
        -[GEOPlace addRoadAccessPoints:](self, "addRoadAccessPoints:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k), (_QWORD)v37);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v34);
  }

  if ((*((_BYTE *)v4 + 200) & 4) != 0)
  {
    self->_geoId = *((_QWORD *)v4 + 10);
    *(_DWORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 14))
    -[GEOPlace setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
  if ((*((_BYTE *)v4 + 200) & 0x20) != 0)
  {
    self->_referenceFrame = *((_DWORD *)v4 + 47);
    *(_DWORD *)&self->_flags |= 0x20u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1551);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  GEOTimezone *timezone;
  PBUnknownFields *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPlace readAll:](self, "readAll:", 0);
    -[GEOMapRegion clearUnknownFields:](self->_mapRegion, "clearUnknownFields:", 1);
    -[GEOAddress clearUnknownFields:](self->_address, "clearUnknownFields:", 1);
    -[GEOAddress clearUnknownFields:](self->_phoneticAddress, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_center, "clearUnknownFields:", 1);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = self->_business;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v9);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = self->_entryPoints;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v14);
    }

    -[GEOStructuredAddress clearUnknownFields:](self->_spokenStructuredAddress, "clearUnknownFields:", 1);
    timezone = self->_timezone;
    if (timezone)
    {
      v18 = timezone->_unknownFields;
      timezone->_unknownFields = 0;

    }
    -[GEOMapRegion clearUnknownFields:](self->_displayMapRegion, "clearUnknownFields:", 1);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = self->_roadAccessPoints;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "clearUnknownFields:", 1, (_QWORD)v24);
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v21);
    }

  }
}

- (void)_readPhoneticLocaleIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 202) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  -[GEOPlace _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEOPlace _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier;
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x1020000u;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (int)referenceFrame
{
  os_unfair_lock_s *p_readerLock;
  $E5113E26C002D925BA55E10430DBDBDB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_referenceFrame;
  else
    return 0;
}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000020u;
  self->_referenceFrame = a3;
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16777248;
  else
    v3 = 0x1000000;
  self->_flags = ($E5113E26C002D925BA55E10430DBDBDB)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasReferenceFrame
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0F128[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReferenceFrame:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_spokenStructuredAddress, 0);
  objc_storeStrong((id *)&self->_spokenName, 0);
  objc_storeStrong((id *)&self->_spokenAddress, 0);
  objc_storeStrong((id *)&self->_roadAccessPoints, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneticAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_entryPoints, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_business, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4 addressDictionary:(id)a5
{
  id v8;
  GEOPlace *v9;
  GEOMapRegion *v10;
  GEOLatLng *v11;
  GEOAddress *v12;
  void *v13;
  GEOPlace *v14;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOPlace;
  v9 = -[GEOPlace init](&v16, sel_init);
  if (v9)
  {
    if (fabs(a3 + 180.0) >= 0.00000001 || fabs(a4 + 180.0) >= 0.00000001)
    {
      v10 = -[GEOMapRegion initWithLatitude:longitude:]([GEOMapRegion alloc], "initWithLatitude:longitude:", a3, a4);
      -[GEOPlace setMapRegion:](v9, "setMapRegion:", v10);
      v11 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a3, a4);
      -[GEOPlace setCenter:](v9, "setCenter:", v11);

    }
    if (v8)
    {
      v12 = -[GEOAddress initWithAddressDictionary:]([GEOAddress alloc], "initWithAddressDictionary:", v8);
      -[GEOPlace setAddress:](v9, "setAddress:", v12);
      if (!-[GEOPlace hasName](v9, "hasName"))
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("Name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          -[GEOPlace setName:](v9, "setName:", v13);

      }
    }
    v14 = v9;
  }

  return v9;
}

- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4 placeType:(int)a5
{
  GEOPlace *v6;

  v6 = -[GEOPlace initWithLatitude:longitude:](self, "initWithLatitude:longitude:", a3, a4);
  if (v6)
    -[GEOPlace setType:](v6, "setType:", _PlaceTypeForMapItemPlaceType(a5));
  return v6;
}

- (GEOPlace)initWithLatitude:(double)a3 longitude:(double)a4
{
  return -[GEOPlace initWithLatitude:longitude:addressDictionary:](self, "initWithLatitude:longitude:addressDictionary:", 0, a3, a4);
}

- (GEOBusiness)firstBusiness
{
  void *v3;
  void *v4;

  -[GEOPlace business](self, "business");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[GEOPlace businessAtIndex:](self, "businessAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (GEOBusiness *)v4;
}

- (id)addressDictionary
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOPlace address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  if (-[GEOPlace hasName](self, "hasName"))
  {
    -[GEOPlace name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Name"));

  }
  return v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[GEOPlace hasCenter](self, "hasCenter"))
  {
    -[GEOPlace center](self, "center");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_7:
      v6 = 0xC066800000000000;
      v8 = 0xC066800000000000;
      goto LABEL_8;
    }
  }
  else
  {
    if (!-[GEOPlace entryPointsCount](self, "entryPointsCount"))
      goto LABEL_7;
    -[GEOPlace entryPoints](self, "entryPoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_7;
  }
  objc_msgSend(v3, "coordinate");
  v6 = v5;
  v8 = v7;

LABEL_8:
  v9 = *(double *)&v6;
  v10 = *(double *)&v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)setCenterCoordinate:(id)a3
{
  GEOLatLng *v4;

  if (a3.var1 >= -180.0 && a3.var1 <= 180.0 && a3.var0 >= -90.0 && a3.var0 <= 90.0)
  {
    v4 = -[GEOLatLng initWithLatitude:longitude:]([GEOLatLng alloc], "initWithLatitude:longitude:", a3.var0, a3.var1);
    -[GEOPlace setCenter:](self, "setCenter:", v4);

  }
}

- (double)radialDistance
{
  int v3;
  double result;

  if (!-[GEOPlace hasAddressGeocodeAccuracy](self, "hasAddressGeocodeAccuracy"))
    return 100.0;
  v3 = -[GEOPlace addressGeocodeAccuracy](self, "addressGeocodeAccuracy");
  result = 100.0;
  if (!v3)
    return 50.0;
  return result;
}

- (id)arrivalMapRegion
{
  void *v3;
  unsigned int v5;

  if (-[GEOPlace hasType](self, "hasType") && !-[GEOPlace addressGeocodeAccuracy](self, "addressGeocodeAccuracy"))
  {
    v5 = -[GEOPlace type](self, "type");
    v3 = 0;
    if (v5 <= 0x39 && ((1 << v5) & 0x242A00000000000) != 0)
    {
      -[GEOPlace mapRegion](self, "mapRegion");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)arrivalMapRegionForTransportType:(int)a3
{
  uint64_t v5;
  void *v6;
  GEOMapRegion *v7;
  GEOMapRegion *v8;

  -[GEOPlace arrivalMapRegion](self, "arrivalMapRegion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3 || v5 || !-[GEOPlace hasCenter](self, "hasCenter"))
    v7 = v6;
  else
    v7 = -[GEOMapRegion initWithRadialPlace:]([GEOMapRegion alloc], "initWithRadialPlace:", self);
  v8 = v7;

  return v8;
}

- (id)bestName
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[GEOPlace name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[GEOPlace firstBusiness](self, "firstBusiness");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "length"))
    {
      -[GEOPlace address](self, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bestName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v4 = v6;
  }
  v7 = v4;
  v6 = v4;
LABEL_6:

  return v7;
}

- (void)setNSTimeZone:(id)a3
{
  GEOTimezone *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = objc_alloc_init(GEOTimezone);
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTimezone setIdentifier:]((uint64_t)v4, v5);

    -[GEOPlace setTimezone:](self, "setTimezone:", v4);
  }
  else
  {
    -[GEOPlace setTimezone:](self, "setTimezone:", 0);
  }

}

- (GEOPlace)initWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 muid:(unint64_t)a8 attributionID:(id)a9 sampleSizeForUserRatingScore:(unsigned int)a10 normalizedUserRatingScore:(float)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  GEOPlace *v23;
  GEOBusiness *v24;
  double v25;
  GEOBusiness *v26;
  GEOPlace *v27;

  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a4;
  objc_msgSend(a3, "coordinate");
  v23 = -[GEOPlace initWithLatitude:longitude:addressDictionary:](self, "initWithLatitude:longitude:addressDictionary:", v22);

  if (v23)
  {
    if (v18)
      -[GEOPlace setName:](v23, "setName:", v18);
    v24 = [GEOBusiness alloc];
    *(float *)&v25 = a11;
    v26 = -[GEOBusiness initWithBusinessURL:phoneNumber:muid:attributionID:sampleSizeForUserRatingScore:normalizedUserRatingScore:](v24, "initWithBusinessURL:phoneNumber:muid:attributionID:sampleSizeForUserRatingScore:normalizedUserRatingScore:", v19, v20, a8, v21, a10, v25);
    if (v26)
      -[GEOPlace addBusiness:](v23, "addBusiness:", v26);
    v27 = v23;

  }
  return v23;
}

- (GEOPlace)initWithName:(id)a3 placeType:(int)a4 areaInMeters:(double)a5
{
  id v8;
  GEOPlace *v9;
  void *v10;
  GEOPlace *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPlace;
  v9 = -[GEOPlace init](&v13, sel_init);
  if (v9)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    -[GEOPlace setName:](v9, "setName:", v10);

    -[GEOPlace setType:](v9, "setType:", _PlaceTypeForMapItemPlaceType(a4));
    -[GEOPlace setArea:](v9, "setArea:", a5);
    v11 = v9;
  }

  return v9;
}

- (id)geoMapItem
{
  return -[_GEOPlaceItem initWithPlace:]([_GEOPlaceItem alloc], "initWithPlace:", self);
}

@end
