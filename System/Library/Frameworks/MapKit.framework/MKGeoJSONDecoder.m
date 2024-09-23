@implementation MKGeoJSONDecoder

- (MKGeoJSONDecoder)init
{
  MKGeoJSONDecoder *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKGeoJSONDecoder;
  v2 = -[MKGeoJSONDecoder init](&v5, sel_init);
  if (v2)
  {
    +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "count:", 6);

  }
  return v2;
}

- (NSArray)geoJSONObjectsWithData:(NSData *)data error:(NSError *)errorPtr
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", data, 0, errorPtr);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (errorPtr)
    {
      v12 = CFSTR("Root object is not a dictionary");
LABEL_11:
      _errorWithReason(v12);
      v11 = 0;
      *errorPtr = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (errorPtr)
    {
      v12 = CFSTR("Root object is missing 'type' key");
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _geoJSONObjectType((uint64_t)v8);

  switch(v9)
  {
    case 0:
      if (!errorPtr)
        goto LABEL_14;
      v12 = CFSTR("Root object has invalid value for 'type' key");
      goto LABEL_11;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      +[MKGeoJSONDecoder _decodeGeometry:error:](MKGeoJSONDecoder, "_decodeGeometry:error:", v6, errorPtr);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 8:
      v14 = -[MKGeoJSONFeature _initWithGeoJSONObject:error:]([MKGeoJSONFeature alloc], "_initWithGeoJSONObject:error:", v6, errorPtr);
      v15 = v14;
      if (v14)
      {
        v16[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

      break;
    case 9:
      -[MKGeoJSONDecoder _decodeFeatureCollection:error:](self, "_decodeFeatureCollection:error:", v6, errorPtr);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = (void *)v10;
      break;
    default:
      goto LABEL_14;
  }
LABEL_15:

  return (NSArray *)v11;
}

+ (id)_decodeGeometry:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)_geoJSONGeometryType((uint64_t)v6);

    switch((unint64_t)v7)
    {
      case 0uLL:
        if (!a4)
          goto LABEL_8;
        v8 = CFSTR("Invalid geometry type");
        goto LABEL_7;
      case 1uLL:
        v9 = -[MKPointAnnotation _initWithGeoJSONObject:error:]([MKPointAnnotation alloc], "_initWithGeoJSONObject:error:", v5, a4);
        v10 = v9;
        if (!v9)
          goto LABEL_22;
        v24[0] = v9;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = (id *)v24;
        goto LABEL_21;
      case 2uLL:
        v13 = -[MKMultiPoint _initWithGeoJSONObject:error:]([MKMultiPoint alloc], "_initWithGeoJSONObject:error:", v5, a4);
        v10 = v13;
        if (!v13)
          goto LABEL_22;
        v23 = v13;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v23;
        goto LABEL_21;
      case 3uLL:
        v14 = -[MKPolyline _initWithGeoJSONObject:error:]([MKPolyline alloc], "_initWithGeoJSONObject:error:", v5, a4);
        v10 = v14;
        if (!v14)
          goto LABEL_22;
        v22 = v14;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v22;
        goto LABEL_21;
      case 4uLL:
        v15 = -[MKMultiPolyline _initWithGeoJSONObject:error:]([MKMultiPolyline alloc], "_initWithGeoJSONObject:error:", v5, a4);
        v10 = v15;
        if (!v15)
          goto LABEL_22;
        v21 = v15;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v21;
        goto LABEL_21;
      case 5uLL:
        v16 = -[MKPolygon _initWithGeoJSONObject:error:]([MKPolygon alloc], "_initWithGeoJSONObject:error:", v5, a4);
        v10 = v16;
        if (!v16)
          goto LABEL_22;
        v20 = v16;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v20;
        goto LABEL_21;
      case 6uLL:
        v17 = -[MKMultiPolygon _initWithGeoJSONObject:error:]([MKMultiPolygon alloc], "_initWithGeoJSONObject:error:", v5, a4);
        v10 = v17;
        if (v17)
        {
          v19 = v17;
          v11 = (void *)MEMORY[0x1E0C99D20];
          v12 = &v19;
LABEL_21:
          objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_22:
          v7 = 0;
        }

        break;
      case 7uLL:
        +[MKGeoJSONDecoder _decodeGeometryCollection:error:](MKGeoJSONDecoder, "_decodeGeometryCollection:error:", v5, a4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        break;
    }
  }
  else if (a4)
  {
    v8 = CFSTR("geometry object must be a dictionary");
LABEL_7:
    _errorWithReason(v8);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    v7 = 0;
  }

  return v7;
}

+ (id)_decodeGeometryCollection:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  __CFString *v17;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("geometries"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a4)
    {
      v17 = CFSTR("GeometryCollection object is missing 'geometries' value");
LABEL_20:
      _errorWithReason(v17);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_21:
    v16 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v17 = CFSTR("GeometryCollection's 'geometries' value must be an array");
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_decodeGeometry:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

          v16 = 0;
          goto LABEL_23;
        }
        v14 = v13;
        if ((unint64_t)objc_msgSend(v13, "count") >= 2)
        {
          MKGetMKGeoJSONSerializationLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_INFO, "To maximize interoperability, implementations should avoid nested geometry collections.", v19, 2u);
          }

        }
        objc_msgSend(v7, "addObjectsFromArray:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = v7;
LABEL_23:

LABEL_24:
  return v16;
}

- (id)_decodeFeatureCollection:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MKGeoJSONFeature *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("features"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
          v13 = [MKGeoJSONFeature alloc];
          v14 = -[MKGeoJSONFeature _initWithGeoJSONObject:error:](v13, "_initWithGeoJSONObject:error:", v12, a4, (_QWORD)v19);
          if (!v14)
          {

            v16 = 0;
            goto LABEL_15;
          }
          v15 = (void *)v14;
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }

    v16 = v6;
LABEL_15:

  }
  else if (a4)
  {
    if (v5)
      v17 = CFSTR("FeatureCollection object has invalid 'features' value");
    else
      v17 = CFSTR("FeatureCollection object is missing 'features' value");
    _errorWithReason(v17);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
