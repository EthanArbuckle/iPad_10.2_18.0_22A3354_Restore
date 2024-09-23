@implementation _MKPolygonGeoRegion

- (_MKPolygonGeoRegion)initWithJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  _MKPolygonGeoRegion *v7;
  _MKPolygonGeoRegion *v8;
  _MKPolygonGeoRegion *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MKPolygonGeoRegion;
  v7 = -[_MKPolygonGeoRegion init](&v11, sel_init);
  v8 = v7;
  if (v7 && !-[_MKPolygonGeoRegion _loadWithJSONObject:error:](v7, "_loadWithJSONObject:error:", v6, a4))
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (BOOL)coordinateLiesInRegion:(CLLocationCoordinate2D)a3
{
  return _MKPointInPolygon((uint64_t)self->_polygon, self->_vertexCount, a3.latitude, a3.longitude);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_polygon);
  v3.receiver = self;
  v3.super_class = (Class)_MKPolygonGeoRegion;
  -[_MKPolygonGeoRegion dealloc](&v3, sel_dealloc);
}

- (BOOL)_loadWithJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  CLLocationDegrees v19;
  CLLocationDegrees v20;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  CLLocationCoordinate2D *v23;
  BOOL v24;
  void *v25;
  const __CFString *v26;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  CLLocationCoordinate2D v37;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      if (v10 < 4 || self->_vertexCount >= 0x15)
      {
        if (!a4)
        {
LABEL_24:
          v24 = 0;
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid number of coordinates for Polygon LinearRing: %lu. Expected between %lu and %lu."), v10, 4, 20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v14, CFSTR("ParseError"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = v10 - 1;
        self->_vertexCount = v11;
        self->_polygon = (CLLocationCoordinate2D *)malloc_type_calloc(v11, 0x10uLL, 0x1000040451B5BE8uLL);
        if (!self->_vertexCount)
        {
          v24 = 1;
          goto LABEL_25;
        }
        v12 = 0;
        v13 = 0;
        v36 = v9;
        while (1)
        {
          objc_msgSend(v9, "objectAtIndex:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          v15 = v14;
          if (objc_msgSend(v15, "count") != 2)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A coordinate array didn't contain exactly 2 elements."));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v31, CFSTR("ParseError"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v32);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v14 = v15;
            goto LABEL_22;
          }
          objc_msgSend(v15, "objectAtIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (a4)
            {
              v28 = (void *)MEMORY[0x1E0CB3940];
              v29 = CFSTR("A coordinate didn't contain exactly 2 points.");
              goto LABEL_37;
            }
LABEL_38:

            v14 = v15;
            v9 = v36;
            goto LABEL_22;
          }
          objc_msgSend(v16, "doubleValue");
          v19 = v18;
          objc_msgSend(v17, "doubleValue");
          v37 = CLLocationCoordinate2DMake(v19, v20);
          latitude = v37.latitude;
          longitude = v37.longitude;
          if (!CLLocationCoordinate2DIsValid(v37))
          {
            if (a4)
            {
              v28 = (void *)MEMORY[0x1E0CB3940];
              v35 = v15;
              v29 = CFSTR("Invalid coordinate parsed: %@.");
LABEL_37:
              objc_msgSend(v28, "stringWithFormat:", v29, v35);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v33, CFSTR("ParseError"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v34);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_38;
          }
          v23 = &self->_polygon[v12];
          v23->latitude = latitude;
          v23->longitude = longitude;

          ++v13;
          ++v12;
          v24 = 1;
          v9 = v36;
          if (v13 >= self->_vertexCount)
            goto LABEL_25;
        }
        if (!a4)
          goto LABEL_23;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected coordinates to element to be an array."));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15, CFSTR("ParseError"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v30);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    if (a4)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = CFSTR("Expected LinearRing to contain an array of coordinates.");
      goto LABEL_18;
    }
  }
  else if (a4)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = CFSTR("Expected polygon to contain a LinearRing array, with the first element representing the exterior ring and the other elements ignored.");
LABEL_18:
    objc_msgSend(v25, "stringWithFormat:", v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, CFSTR("ParseError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Maps"), 0, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v24 = 0;
LABEL_26:

  return v24;
}

@end
