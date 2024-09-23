@implementation FCLocalArea

- (FCLocalArea)initWithDictionary:(id)a3
{
  id v4;
  FCLocalArea *v5;
  void *v6;
  void *v7;
  void *v8;
  FCLocalArea *v9;

  v4 = a3;
  v5 = [FCLocalArea alloc];
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("id"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("bbox"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("regionIds"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FCLocalArea initWithIdentifier:bbox:regionIDs:](v5, "initWithIdentifier:bbox:regionIDs:", v6, v7, v8);
  return v9;
}

- (FCLocalArea)initWithIdentifier:(id)a3 bbox:(id)a4 regionIDs:(id)a5
{
  id v9;
  id v10;
  FCLocalArea *v11;
  FCLocalArea *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  char v30;
  id v32;
  id obj;
  uint64_t v34;
  id v35;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v35 = a5;
  v36.receiver = self;
  v36.super_class = (Class)FCLocalArea;
  v11 = -[FCLocalArea init](&v36, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_bbox, a4);
    objc_storeStrong((id *)&v12->_regionIds, a5);
    v13 = v10;
    if (objc_msgSend(v13, "count") == 4)
    {
      v32 = v9;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v14)
      {
        v15 = v14;
        v34 = *(_QWORD *)v38;
        v16 = 0x1E0CB3000uLL;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v38 != v34)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_opt_class();
            if (!v18 || (objc_opt_isKindOfClass() & 1) == 0)
            {
              v19 = 0;
LABEL_34:

              v30 = 0;
              goto LABEL_35;
            }
            v19 = v18;
            if (objc_msgSend(v19, "count") != 2)
              goto LABEL_34;
            objc_opt_class();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v21 = v20;
              else
                v21 = 0;
            }
            else
            {
              v21 = 0;
            }
            v22 = v21;

            v23 = v16;
            objc_opt_class();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v25 = v24;
              else
                v25 = 0;
            }
            else
            {
              v25 = 0;
            }
            v26 = v25;

            if (!v22 || !v26 || (objc_msgSend(v22, "doubleValue"), v27 < -90.0) || v27 > 90.0)
            {

              goto LABEL_34;
            }
            objc_msgSend(v26, "doubleValue");
            v29 = v28;

            v30 = 0;
            if (v29 < -180.0 || v29 > 180.0)
              goto LABEL_35;
            v16 = v23;
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          v30 = 1;
          if (v15)
            continue;
          break;
        }
      }
      else
      {
        v30 = 1;
      }
LABEL_35:

      v9 = v32;
    }
    else
    {
      v30 = 0;
    }

    v12->_isBboxValid = v30;
  }

  return v12;
}

- (FCLocalArea)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLocalArea init]";
    v9 = 2080;
    v10 = "FCLocalArea.m";
    v11 = 1024;
    v12 = 54;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCLocalArea init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)containsLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = v7;

  return -[FCLocalArea containsPointAtLatitude:longitude:](self, "containsPointAtLatitude:longitude:", v6, v8);
}

- (BOOL)containsPointAtLatitude:(double)a3 longitude:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (!-[FCLocalArea isBboxValid](self, "isBboxValid"))
    return 0;
  -[FCLocalArea minLat](self, "minLat");
  v8 = v7;
  -[FCLocalArea maxLat](self, "maxLat");
  if (!-[FCLocalArea isValue:betweenValue:andValue:](self, "isValue:betweenValue:andValue:", a3, v8, v9))
    return 0;
  -[FCLocalArea minLon](self, "minLon");
  v11 = v10;
  -[FCLocalArea maxLon](self, "maxLon");
  return -[FCLocalArea isValue:betweenValue:andValue:](self, "isValue:betweenValue:andValue:", a4, v11, v12);
}

- (BOOL)isValue:(double)a3 betweenValue:(double)a4 andValue:(double)a5
{
  BOOL v5;

  v5 = a3 <= a4;
  if (a3 < a5)
    v5 = 0;
  return a3 >= a4 && a3 <= a5 || v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: id: %@, regionIDs: %@"), objc_opt_class(), self->_identifier, self->_regionIds);
}

- (double)minLat
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[FCLocalArea bbox](self, "bbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)maxLat
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[FCLocalArea bbox](self, "bbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)minLon
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[FCLocalArea bbox](self, "bbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)maxLon
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[FCLocalArea bbox](self, "bbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (NSArray)regionIds
{
  return self->_regionIds;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)bbox
{
  return self->_bbox;
}

- (void)setBbox:(id)a3
{
  objc_storeStrong((id *)&self->_bbox, a3);
}

- (BOOL)isBboxValid
{
  return self->_isBboxValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bbox, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_regionIds, 0);
}

@end
