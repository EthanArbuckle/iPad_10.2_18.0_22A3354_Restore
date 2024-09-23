@implementation MKGeoJSONFeature

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  MKGeoJSONFeature *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _geoJSONObjectType((uint64_t)v7);

    if (v8 == 8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("geometry"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[MKGeoJSONDecoder _decodeGeometry:error:](MKGeoJSONDecoder, "_decodeGeometry:error:", v9, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("properties"));
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            if (a4)
            {
              _errorWithReason(CFSTR("GeoJSON Feature objects must have a member with the name \"properties\"));
              v12 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v12 = 0;
            }
            goto LABEL_34;
          }
          v14 = (void *)v13;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            v14 = 0;
            v15 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v14, 4, a4);
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              v12 = 0;
              goto LABEL_33;
            }
            v15 = (void *)v17;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  _errorWithReason(CFSTR("Feature 'id' has invalid type"));
                  v20 = 0;
                  v12 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v20 = 0;
                  v12 = 0;
                }
                goto LABEL_32;
              }
              objc_msgSend(v18, "stringValue");
              v19 = (id)objc_claimAutoreleasedReturnValue();
            }
            v20 = v19;
          }
          else
          {
            v20 = 0;
          }
          self = (MKGeoJSONFeature *)-[MKGeoJSONFeature _initWithProperties:geometry:identifier:](self, "_initWithProperties:geometry:identifier:", v15, v10, v20);
          v12 = self;
LABEL_32:

LABEL_33:
LABEL_34:

          goto LABEL_35;
        }
      }
      else if (a4)
      {
        if (v9)
          v16 = CFSTR("Feature object has invalid geometry");
        else
          v16 = CFSTR("Feature object is missing geometry");
        _errorWithReason(v16);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      v12 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (a4)
    {
      v11 = CFSTR("Input is not a Feature GeoJSON object");
      goto LABEL_9;
    }
LABEL_10:
    v12 = 0;
    goto LABEL_36;
  }
  if (!a4)
    goto LABEL_10;
  v11 = CFSTR("Feature object must be a dictionary");
LABEL_9:
  _errorWithReason(v11);
  v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v12;
}

- (id)_initWithProperties:(id)a3 geometry:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  MKGeoJSONFeature *v12;
  MKGeoJSONFeature *v13;
  uint64_t v14;
  NSArray *geometry;
  MKGeoJSONFeature *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKGeoJSONFeature;
  v12 = -[MKGeoJSONFeature init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_properties, a3);
    v14 = objc_msgSend(v10, "copy");
    geometry = v13->_geometry;
    v13->_geometry = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_identifier, a5);
    v16 = v13;
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)properties
{
  return self->_properties;
}

- (NSArray)geometry
{
  return self->_geometry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
