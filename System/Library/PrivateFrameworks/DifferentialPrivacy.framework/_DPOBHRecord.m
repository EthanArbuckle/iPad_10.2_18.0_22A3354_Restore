@implementation _DPOBHRecord

- (_DPOBHRecord)initWithKey:(id)a3 creationDate:(double)a4 submitted:(BOOL)a5 objectId:(id)a6
{
  id v11;
  id v12;
  _DPOBHRecord *v13;
  _DPOBHRecord *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_DPOBHRecord;
  v13 = -[_DPOBHRecord init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_creationDate = a4;
    v14->_submitted = a5;
    v14->_reportVersion = +[_DPJSONOutputHelper currentVersion](_DPJSONOutputHelper, "currentVersion");
    objc_storeStrong((id *)&v14->_objectId, a6);
  }

  return v14;
}

- (id)jsonString
{
  return &stru_1E95DA470;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPOBHRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  _DPOBHRecord *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = -[_DPOBHRecord initWithKey:creationDate:submitted:objectId:](self, "initWithKey:creationDate:submitted:objectId:", v5, v10, 0, v8);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  void *v5;
  void *v6;
  void *v7;
  NSManagedObjectID *objectId;
  id v9;

  v9 = a3;
  key = self->_key;
  if (key)
    objc_msgSend(v9, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("creationDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_submitted);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("submitted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reportVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("reportVersion"));

  objectId = self->_objectId;
  if (objectId)
    objc_msgSend(v9, "encodeObject:forKey:", objectId, CFSTR("objectId"));

}

- (id)description
{
  void *v3;
  __CFString *key;
  __CFString *v5;
  objc_class *v6;
  void *v7;
  const __CFString *v8;
  NSManagedObjectID *objectId;
  void *v10;

  v3 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  key = (__CFString *)self->_key;
  if (!key)
    key = CFSTR("(nil)");
  v5 = key;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: { key=%@ ; "), v7, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("creationDate=%.16g ; "), *(_QWORD *)&self->_creationDate);
  if (self->_submitted)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("submitted=%@ ; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("reportVersion=%lld ; "), self->_reportVersion);
  objectId = self->_objectId;
  if (!objectId)
    objectId = (NSManagedObjectID *)CFSTR("(nil)");
  objc_msgSend(v3, "appendFormat:", CFSTR("objectId=%@ }"), objectId);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_DPOBHRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPOBHRecord creationDate](self, "creationDate");
  v7 = v6;
  v8 = -[_DPOBHRecord submitted](self, "submitted");
  -[_DPOBHRecord objectId](self, "objectId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithKey:creationDate:submitted:objectId:", v5, v8, v9, v7);

  return v10;
}

- (BOOL)isEqualToOBHRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  int v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  BOOL v20;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  -[_DPOBHRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  -[_DPOBHRecord creationDate](self, "creationDate");
  v9 = v8;
  objc_msgSend(v4, "creationDate");
  v11 = areEqualTimeIntervals(v9, v10);
  LODWORD(v6) = -[_DPOBHRecord submitted](self, "submitted");
  v12 = v6 ^ objc_msgSend(v4, "submitted");
  v13 = -[_DPOBHRecord reportVersion](self, "reportVersion");
  v14 = objc_msgSend(v4, "reportVersion");
  -[_DPOBHRecord objectId](self, "objectId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_DPOBHRecord objectId](self, "objectId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

  }
  else
  {
    objc_msgSend(v4, "objectId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v19 == 0;
  }
  if (((v7 & v11 ^ 1 | v12) & 1) == 0)
  {
    if (v13 == v14)
      v20 = v18;
    else
      v20 = 0;
  }
  else
  {
LABEL_6:
    v20 = 0;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  _DPOBHRecord *v4;
  _DPOBHRecord *v5;
  BOOL v6;

  v4 = (_DPOBHRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPOBHRecord isEqualToOBHRecord:](self, "isEqualToOBHRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  unint64_t v10;

  -[_DPOBHRecord key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DPOBHRecord creationDate](self, "creationDate");
  v6 = (unint64_t)v5;
  v7 = v4 ^ -[_DPOBHRecord submitted](self, "submitted");
  v8 = v7 ^ -[_DPOBHRecord reportVersion](self, "reportVersion");
  -[_DPOBHRecord objectId](self, "objectId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v6;

  return v10;
}

+ (id)createRecordFromManagedObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "entityName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v6);

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
LABEL_12:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v19)
        objc_enumerationMutation(v16);
      v21 = (void *)objc_opt_new();
      if ((objc_msgSend(v21, "copyFromManagedObject:", v3, v23) & 1) != 0)
        break;

      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v18)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    v21 = 0;
  }

  return v21;
}

+ (id)entityName
{
  return CFSTR("OBHRecord");
}

- (id)entityName
{
  return (id)objc_msgSend((id)objc_opt_class(), "entityName");
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    -[_DPOBHRecord key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKey:", v7);

    -[_DPOBHRecord creationDate](self, "creationDate");
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPOBHRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPOBHRecord reportVersion](self, "reportVersion"));
    -[_DPOBHRecord objectId](self, "objectId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPOBHRecord setObjectId:](self, "setObjectId:", v10);

    }
  }

  return isKindOfClass & 1;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPOBHRecord setKey:](self, "setKey:", v7);

    objc_msgSend(v6, "creationDate");
    -[_DPOBHRecord setCreationDate:](self, "setCreationDate:");
    -[_DPOBHRecord setSubmitted:](self, "setSubmitted:", objc_msgSend(v6, "submitted"));
    -[_DPOBHRecord setReportVersion:](self, "setReportVersion:", objc_msgSend(v6, "reportVersion"));
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPOBHRecord setObjectId:](self, "setObjectId:", v8);
  }

  return isKindOfClass & 1;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (int64_t)reportVersion
{
  return self->_reportVersion;
}

- (void)setReportVersion:(int64_t)a3
{
  self->_reportVersion = a3;
}

- (NSManagedObjectID)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
  objc_storeStrong((id *)&self->_objectId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
