@implementation _MKMultiPolygonGeoRegion

- (_MKMultiPolygonGeoRegion)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6;
  _MKMultiPolygonGeoRegion *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _MKMultiPolygonGeoRegion *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKMultiPolygonGeoRegion;
  v7 = -[_MKMultiPolygonGeoRegion init](&v13, sel_init);
  if (!v7)
    goto LABEL_6;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v6, 0, a4);
  if (!v8)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || !-[_MKMultiPolygonGeoRegion _loadWithRootJSONObject:error:](v7, "_loadWithRootJSONObject:error:", v10, a4))
  {

    goto LABEL_8;
  }

LABEL_6:
  v11 = v7;
LABEL_9:

  return v11;
}

- (_MKMultiPolygonGeoRegion)initWithJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  _MKMultiPolygonGeoRegion *v7;
  _MKMultiPolygonGeoRegion *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMultiPolygonGeoRegion;
  v7 = -[_MKMultiPolygonGeoRegion init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[_MKMultiPolygonGeoRegion _loadWithJSONObject:error:](v7, "_loadWithJSONObject:error:", v6, a4);

  return v8;
}

- (BOOL)coordinateLiesInRegion:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_polygons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "coordinateLiesInRegion:", latitude, longitude, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_loadWithRootJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;
  void *v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "objectForKey:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("MultiPolygon"));

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("coordinates"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_MKMultiPolygonGeoRegion _loadWithJSONObject:error:](self, "_loadWithJSONObject:error:", v10, a4);
    }
    else
    {
      if (!a4)
      {
        v11 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected MultiPolygon as the root type."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, CFSTR("ParseError"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected JSON root object to be NSDictionary"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("ParseError"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v10);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
LABEL_10:

  return v11;
}

- (BOOL)_loadWithJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _MKPolygonGeoRegion *v15;
  _MKPolygonGeoRegion *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _MKMultiPolygonGeoRegion *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = objc_msgSend(v7, "count");
    if ((unint64_t)(v8 - 1) >= 0x32)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid number of polygons: %lu. Expected between %lu and %lu."), v8, 1, 50);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, CFSTR("ParseError"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      v22 = self;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v10);
            v15 = -[_MKPolygonGeoRegion initWithJSONObject:error:]([_MKPolygonGeoRegion alloc], "initWithJSONObject:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), a4);
            if (!v15)
            {

              LOBYTE(a4) = 0;
              goto LABEL_17;
            }
            v16 = v15;
            objc_msgSend(v9, "addObject:", v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v12)
            continue;
          break;
        }
      }

      -[_MKMultiPolygonGeoRegion setPolygons:](v22, "setPolygons:", v9);
      LOBYTE(a4) = 1;
LABEL_17:

    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected an array in the coordinates field."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v17, CFSTR("ParseError"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (NSArray)polygons
{
  return self->_polygons;
}

- (void)setPolygons:(id)a3
{
  objc_storeStrong((id *)&self->_polygons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygons, 0);
}

@end
