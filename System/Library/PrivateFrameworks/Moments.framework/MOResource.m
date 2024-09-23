@implementation MOResource

- (MOResource)initWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  MOResource *v8;

  v5 = a3;
  if (!v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOResource initWithIdentifier:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOResource.m"), 29, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOResource initWithIdentifier:]", 29);

  }
  v8 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v5, CFSTR("Resource"), 0, 0, 0, 0, 0.0, -1.0, 0, 0);

  return v8;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 assets:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  MOResource *v12;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v11, v10, a4, v9, 0, 0, 0.0, -1.0, 0, 0);

  return v12;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  MOResource *v9;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a3;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v8, v7, a4, 0, 0, 0, 0.0, -1.0, 0, 0);

  return v9;
}

- (MOResource)initWithName:(id)a3 value:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  MOResource *v9;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a3;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v8, v7, 1, 0, 0, 0, a4, -1.0, 0, 0);

  return v9;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 dict:(id)a5 value:(double)a6
{
  id v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  MOResource *v15;
  id v17;

  v10 = a3;
  if (a5)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a5, 0, &v17);
    a5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if (v11)
      v12 = 1;
    else
      v12 = a5 == 0;
    if (v12)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[MOResource initWithName:type:dict:value:].cold.1((uint64_t)v11, v13);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v14, v10, a4, 0, a5, 0, a6, -1.0, 0, 0);

  return v15;
}

- (MOResource)initWithIdentifier:(id)a3 name:(id)a4 type:(unint64_t)a5 assets:(id)a6 data:(id)a7 value:(double)a8 priorityScore:(double)a9 photoCurationScore:(id)a10 photoFaceCount:(unint64_t)a11 photoAssetMediaType:(unint64_t)a12
{
  id v21;
  id v22;
  id v23;
  MOResource *v24;
  MOResource *v25;
  id v27;
  id v28;
  objc_super v29;

  v21 = a3;
  v22 = a4;
  v28 = a6;
  v27 = a7;
  v23 = a10;
  v29.receiver = self;
  v29.super_class = (Class)MOResource;
  v24 = -[MOResource init](&v29, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifier, a3);
    objc_storeStrong((id *)&v25->_name, a4);
    v25->_type = a5;
    objc_storeStrong((id *)&v25->_assets, a6);
    objc_storeStrong((id *)&v25->_data, a7);
    v25->_value = a8;
    v25->_priorityScore = a9;
    objc_storeStrong((id *)&v25->_photoCurationScore, a10);
    v25->_photoFaceCount = a11;
    v25->_photoAssetMediaType = a12;
    v25->_sourceEventAccessType = -[MOResource dataAccessTypeFromResourceType:](v25, "dataAccessTypeFromResourceType:", a5);
  }

  return v25;
}

- (unint64_t)dataAccessTypeFromResourceType:(unint64_t)a3
{
  if (a3 > 0x10)
    return 0;
  else
    return qword_1CAE9D160[a3];
}

+ (id)getDictionaryForData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v7)
      goto LABEL_10;
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "count"))
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_INFO, "resource data dictionary , %@", buf, 0xCu);
    }

    v6 = v6;
    v7 = 0;
    v9 = v6;
    goto LABEL_15;
  }
  v7 = 0;
LABEL_10:
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[MOResource getDictionaryForData:error:].cold.1((uint64_t)v7, v10, v11);

  if (a4)
  {
    v7 = objc_retainAutorelease(v7);
    v9 = 0;
    *a4 = v7;
  }
  else
  {
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (id)getDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[MOResource data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDictionaryForData:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOResource identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOResource name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOResource type](self, "type");
  -[MOResource assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOResource data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  -[MOResource value](self, "value");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOResource identifier, %@, name, %@, type, %lu, assets, %@, data.length, %lu, value, %f"), v4, v6, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (void)setPriorityScore:(double)a3
{
  self->_priorityScore = a3;
}

- (void)setPhotoCurationScore:(id)a3
{
  objc_storeStrong((id *)&self->_photoCurationScore, a3);
}

- (void)setPhotoCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_photoCreationDate, a3);
}

+ (id)describeType:(unint64_t)a3
{
  if (a3 > 0x10)
    return CFSTR("Invalid");
  else
    return off_1E8541690[a3];
}

- (id)describeType
{
  return +[MOResource describeType:](MOResource, "describeType:", -[MOResource type](self, "type"));
}

+ (id)getStringTypeForResources:(unint64_t)a3
{
  return +[MOResource describeType:](MOResource, "describeType:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOResource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOResource *v6;
  uint64_t v7;
  NSString *name;
  double v9;
  double v10;
  uint64_t v11;
  NSNumber *photoCurationScore;
  uint64_t v13;
  NSDate *photoCreationDate;
  uint64_t v15;
  NSString *assets;
  uint64_t v17;
  NSData *data;
  uint64_t v19;
  NSUUID *sourceEventIdentifier;
  MOResource *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MOResource initWithIdentifier:](self, "initWithIdentifier:", v5);
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
      v7 = objc_claimAutoreleasedReturnValue();
      name = v6->_name;
      v6->_name = (NSString *)v7;

      v6->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("value"));
      v6->_value = v9;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("priorityScore"));
      v6->_priorityScore = v10;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoCurationScore"));
      v11 = objc_claimAutoreleasedReturnValue();
      photoCurationScore = v6->_photoCurationScore;
      v6->_photoCurationScore = (NSNumber *)v11;

      v6->_photoFaceCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoFaceCount"));
      v6->_photoAssetMediaType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoAssetMediaType"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoCreationDate"));
      v13 = objc_claimAutoreleasedReturnValue();
      photoCreationDate = v6->_photoCreationDate;
      v6->_photoCreationDate = (NSDate *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Assets"));
      v15 = objc_claimAutoreleasedReturnValue();
      assets = v6->_assets;
      v6->_assets = (NSString *)v15;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
      v17 = objc_claimAutoreleasedReturnValue();
      data = v6->_data;
      v6->_data = (NSData *)v17;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceEventIdentifier"));
      v19 = objc_claimAutoreleasedReturnValue();
      sourceEventIdentifier = v6->_sourceEventIdentifier;
      v6->_sourceEventIdentifier = (NSUUID *)v19;

      v6->_sourceEventAccessType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType"));
    }
    self = v6;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("value"), self->_value);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("priorityScore"), self->_priorityScore);
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoCurationScore, CFSTR("photoCurationScore"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_photoFaceCount, CFSTR("photoFaceCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_photoAssetMediaType, CFSTR("photoAssetMediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoCreationDate, CFSTR("photoCreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assets, CFSTR("Assets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOResource identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOResource *v5;
  MOResource *v6;
  MOResource *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOResource *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOResource identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[MOResource identifier](v7, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOResource identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOResource identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

+ (id)getDedupeKeyForResourceData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  id v5;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v14;
  const __CFString *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    if (a4 == 6)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v33 = objc_msgSend(v8, "length");
        _os_log_impl(&dword_1CAE42000, v9, OS_LOG_TYPE_INFO, "Using for the dedupe key the map item handler , %lu", buf, 0xCu);
      }

      v5 = v8;
      v10 = 0;
LABEL_6:
      v11 = 0;
      goto LABEL_18;
    }
    v31 = 0;
    +[MOResource getDictionaryForData:error:](MOResource, "getDictionaryForData:error:", v8, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;
    if (v11 || !objc_msgSend(v10, "count"))
    {
      if (a5)
      {
        v11 = objc_retainAutorelease(v11);
        v5 = 0;
        *a5 = v11;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v11 = 0;
      switch(a4)
      {
        case 0uLL:
        case 1uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
          _mo_log_facility_get_os_log(MOLogFacilityGeneral);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            +[MOResource getDedupeKeyForResourceData:type:error:].cold.4(a4, v12);
          goto LABEL_15;
        case 2uLL:
          objc_msgSend(v10, "allKeys");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = CFSTR("MOPhotoResourceLocalIdentifier");
          v16 = objc_msgSend(v14, "containsObject:", CFSTR("MOPhotoResourceLocalIdentifier"));

          _mo_log_facility_get_os_log(MOLogFacilityGeneral);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v16)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              +[MOResource getDedupeKeyForResourceData:type:error:].cold.1();
            goto LABEL_38;
          }
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            goto LABEL_27;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MOPhotoResourceLocalIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v33 = (uint64_t)v19;
          goto LABEL_26;
        case 0xAuLL:
          objc_msgSend(v10, "allKeys");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = CFSTR("MOWorkoutMetaDataKeyWorkoutID");
          v21 = objc_msgSend(v20, "containsObject:", CFSTR("MOWorkoutMetaDataKeyWorkoutID"));

          _mo_log_facility_get_os_log(MOLogFacilityGeneral);
          v22 = objc_claimAutoreleasedReturnValue();
          v18 = v22;
          if (!v21)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              +[MOResource getDedupeKeyForResourceData:type:error:].cold.2();
LABEL_38:

            goto LABEL_16;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MOWorkoutMetaDataKeyWorkoutID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v33 = (uint64_t)v19;
LABEL_26:
            _os_log_impl(&dword_1CAE42000, v18, OS_LOG_TYPE_INFO, "Using for the dedupe key, %@", buf, 0xCu);

          }
LABEL_27:

          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        case 0xDuLL:
          objc_msgSend(v10, "allKeys");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v23, "containsObject:", CFSTR("MOActivityMetaDataMotionType")))
            goto LABEL_40;
          objc_msgSend(v10, "allKeys");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "containsObject:", CFSTR("MOActivityMetaDataKeyStartDate")) & 1) != 0)
          {
            objc_msgSend(v10, "allKeys");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "containsObject:", CFSTR("MOActivityMetaDataKeyEndDate"));

            if (v26)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v5 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MOActivityMetaDataMotionType"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("MOActivityMetaDataMotionType"));

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MOActivityMetaDataKeyStartDate"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("MOActivityMetaDataKeyStartDate"));

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MOActivityMetaDataKeyEndDate"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("MOActivityMetaDataKeyEndDate"));

              _mo_log_facility_get_os_log(MOLogFacilityGeneral);
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v33 = (uint64_t)v5;
                _os_log_impl(&dword_1CAE42000, v30, OS_LOG_TYPE_INFO, "Using for the dedupe key the dictionary, %@", buf, 0xCu);
              }

              goto LABEL_6;
            }
          }
          else
          {

LABEL_40:
          }
          _mo_log_facility_get_os_log(MOLogFacilityGeneral);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            +[MOResource getDedupeKeyForResourceData:type:error:].cold.3();
LABEL_15:

LABEL_16:
          v11 = 0;
          break;
        default:
          goto LABEL_18;
      }
    }
    v5 = 0;
    goto LABEL_18;
  }
  v5 = 0;
LABEL_19:

  return v5;
}

- (id)getDedupeKeyError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[MOResource data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDedupeKeyForResourceData:type:error:", v6, -[MOResource type](self, "type"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)value
{
  return self->_value;
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (NSNumber)photoCurationScore
{
  return self->_photoCurationScore;
}

- (unint64_t)photoFaceCount
{
  return self->_photoFaceCount;
}

- (void)setPhotoFaceCount:(unint64_t)a3
{
  self->_photoFaceCount = a3;
}

- (float)photoOverallAestheticScore
{
  return self->_photoOverallAestheticScore;
}

- (void)setPhotoOverallAestheticScore:(float)a3
{
  self->_photoOverallAestheticScore = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)assets
{
  return self->_assets;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)photoAssetMediaType
{
  return self->_photoAssetMediaType;
}

- (void)setPhotoAssetMediaType:(unint64_t)a3
{
  self->_photoAssetMediaType = a3;
}

- (NSDate)photoCreationDate
{
  return self->_photoCreationDate;
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_photoCreationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_photoCurationScore, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MOResource)initWithPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  MOResource *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuidFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOResource(MOPerson) initWithPerson:].cold.1((uint64_t)v7, v4, v8);

  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "priorityScore");
  v12 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v7, v9, 11, v10, 0, 0, 0.0, v11, 0, 0);

  return v12;
}

- (id)sourceAppBundleIds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  if (-[MOResource type](self, "type") != 3)
    return 0;
  -[MOResource data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOResource(Source) sourceAppBundleIds].cold.1(v7, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
    goto LABEL_18;
  }
  v4 = (void *)MEMORY[0x1E0CB36D8];
  -[MOResource data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v4, "JSONObjectWithData:options:error:", v5, 0, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;

  if (v7 || !v6)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOResource(Source) sourceAppBundleIds].cold.3((uint64_t)v7, v8);
    goto LABEL_16;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MOResource(Source) sourceAppBundleIds].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
  return v9;
}

- (id)bundleSourceType
{
  unint64_t v2;

  v2 = -[MOResource type](self, "type") - 2;
  if (v2 <= 0xE && ((0x6F93u >> v2) & 1) != 0)
    return *off_1E8541780[v2];
  else
    return 0;
}

- (id)photoLocalDate
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  -[MOResource data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MOPhotoResourceLocalTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v6);
  return v7;
}

- (MOResource)initWithWeather:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v28;
  void *v29;
  MOResource *v30;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("MOWeatherMetaDataKeyStartDate"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("MOWeatherMetaDataKeyEndDate"));

  objc_msgSend(v4, "weatherSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("MOWeatherMetaDataKeyWeatherSummary"));

  objc_msgSend(v4, "weatherSymbolName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("MOWeatherMetaDataKeySymbolName"));

  objc_msgSend(v4, "temperature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "temperature");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v15, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("MOWeatherMetaDataKeyTemperatureValue"));

    objc_msgSend(v4, "temperature");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "symbol");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("MOWeatherMetaDataKeyTemperatureUnitSymbol"));

  }
  objc_msgSend(v4, "windSpeed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "windSpeed");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(v22, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("MOWeatherMetaDataKeyWindSpeedValue"));

    objc_msgSend(v4, "windSpeed");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "unit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "symbol");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("MOWeatherMetaDataKeyWindSpeedUnitSymbol"));

  }
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v29, CFSTR("Weather"), 14, 0, v28, 0, 0.0, -1.0, 0, 0);

  return v30;
}

- (double)endDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[MOResource metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (double)startDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[MOResource metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (id)temperature
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[MOResource metaData](self, "metaData"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyTemperatureValue")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3758]);
    -[MOResource metaData](self, "metaData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyTemperatureValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = objc_alloc(MEMORY[0x1E0CB3B00]);
    -[MOResource metaData](self, "metaData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyTemperatureUnitSymbol"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithSymbol:", v13);
    v15 = (void *)objc_msgSend(v6, "initWithDoubleValue:unit:", v14, v10);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)weatherSummary
{
  void *v3;
  void *v4;
  void *v5;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource metaData](self, "metaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWeatherSummary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)weatherSymbolName
{
  void *v3;
  void *v4;
  void *v5;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource metaData](self, "metaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeySymbolName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)windSpeed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[MOResource metaData](self, "metaData"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWindSpeedValue")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3758]);
    -[MOResource metaData](self, "metaData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWindSpeedValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = objc_alloc(MEMORY[0x1E0CB3A50]);
    -[MOResource metaData](self, "metaData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWindSpeedUnitSymbol"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithSymbol:", v13);
    v15 = (void *)objc_msgSend(v6, "initWithDoubleValue:unit:", v14, v10);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (MOResource)initWithPlace:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  MOResource *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "placeType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("placeType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "placeUserType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("placeUserType"));

  objc_msgSend(v8, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("location"));

  objc_msgSend(v8, "poiCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("poiCategory"));

  if (objc_msgSend(v8, "placeType") != 101 && objc_msgSend(v8, "placeType") != 102)
  {
    objc_msgSend(v8, "enclosingArea");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("cityName"));

  }
  objc_msgSend(v8, "enclosingArea");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("enclosingArea"));

  if (v9)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("startDate"));

  }
  if (v10)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("endDate"));

  }
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeNameConfidence");
  v27 = v26;
  objc_msgSend(v8, "priorityScore");
  v29 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v24, v25, 12, 0, v23, 0, v27, v28, 0, 0);

  return v29;
}

- (MOResource)initWithName:(id)a3 mapItemHandle:(id)a4 priorityScore:(double)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  MOResource *v12;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v11, v10, 6, 0, v9, 0, 0.0, a5, 0, 0);

  return v12;
}

- (id)metaData
{
  void *v2;
  void *v3;

  -[MOResource data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cityName
{
  void *v3;
  void *v4;
  void *v5;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource metaData](self, "metaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cityName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)enclosingArea
{
  void *v3;
  void *v4;
  void *v5;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource metaData](self, "metaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enclosingArea"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)placeUserType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[MOResource metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeUserType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)placeType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[MOResource metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (id)location
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource metaData](self, "metaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D183B0], "locationFromDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)poiCategory
{
  void *v3;
  void *v4;
  void *v5;

  -[MOResource metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource metaData](self, "metaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("poiCategory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  MOResource *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = +[MOResource evergreenTypeFromEvergreenTypeString:](MOResource, "evergreenTypeFromEvergreenTypeString:", v6);
  v13[0] = CFSTR("evergreen_type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v13[1] = CFSTR("evergreen_index");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[MOResource initWithName:type:dict:value:](self, "initWithName:type:dict:value:", v6, 9, v10, (double)a4);
  return v11;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndexes:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  MOResource *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = +[MOResource evergreenTypeFromEvergreenTypeString:](MOResource, "evergreenTypeFromEvergreenTypeString:", v7);
  v14[0] = CFSTR("evergreen_type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = v6;
  v14[1] = CFSTR("evergreen_indexes");
  v14[2] = CFSTR("evergreen_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MOResource initWithName:type:dict:value:](self, "initWithName:type:dict:value:", v7, 9, v11, 0.0);
  return v12;
}

- (unint64_t)evergreenType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MOResource getDictionary](self, "getDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[MOResource getDictionary](self, "getDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)promptIndex
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;

  -[MOResource getDictionary](self, "getDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource getDictionary](self, "getDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_index"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

  }
  else
  {
    -[MOResource value](self, "value");
    return (unint64_t)v7;
  }
  return v6;
}

- (id)promptIndexes
{
  void *v3;
  void *v4;
  void *v5;

  -[MOResource getDictionary](self, "getDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource getDictionary](self, "getDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_indexes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (unint64_t)promptCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;

  -[MOResource getDictionary](self, "getDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MOResource getDictionary](self, "getDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

  }
  else
  {
    -[MOResource value](self, "value");
    return (unint64_t)v7;
  }
  return v6;
}

+ (id)evergreenTypeStringFromEvergreenType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return *off_1E8543918[a3 - 1];
}

+ (unint64_t)evergreenTypeFromEvergreenTypeString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(CFSTR("WISDOM"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(CFSTR("PURPOSE"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(CFSTR("KINDNESS"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(CFSTR("GRATITUDE"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(CFSTR("CREATIVITY"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(CFSTR("RESILIENCE"), "isEqualToString:", v3))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MOResource initWithIdentifier:]";
  v3 = 1024;
  v4 = 29;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithName:(uint64_t)a1 type:(NSObject *)a2 dict:value:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)getDictionaryForData:(uint64_t)a3 error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_1CAE42000, a2, a3, "Unable to deserialize data to dictionary, %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_0();
  +[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CAE42000, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_0();
  +[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", 10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CAE42000, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  OUTLINED_FUNCTION_2_0();
  v14 = *MEMORY[0x1E0C80C00];
  +[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138413314;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = v1;
  v10 = 2112;
  v11 = CFSTR("MOActivityMetaDataKeyStartDate");
  v12 = 2112;
  v13 = CFSTR("MOActivityMetaDataKeyEndDate");
  _os_log_error_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_ERROR, "Malformed dictionary, %@, for resource type, %@, the one of the keys %@, %@, %@ is missing.", (uint8_t *)&v4, 0x34u);

}

+ (void)getDedupeKeyForResourceData:(uint64_t)a1 type:(NSObject *)a2 error:.cold.4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_1CAE42000, a2, v4, "Dedupe key not available for this type, %@.", (uint8_t *)&v5);

}

@end
