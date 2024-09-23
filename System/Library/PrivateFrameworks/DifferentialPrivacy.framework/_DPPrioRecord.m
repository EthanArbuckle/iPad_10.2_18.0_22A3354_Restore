@implementation _DPPrioRecord

- (_DPPrioRecord)init
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  _DPPrioRecord *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:](self, "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", CFSTR("com.apple._DPPrioRecord"), v6, v7, 0, MEMORY[0x1E0C9AA70], 0, v5, 0);

  return v8;
}

- (_DPPrioRecord)initWithKey:(id)a3 share1:(id)a4 share2:(id)a5 dimension:(int64_t)a6 metadata:(id)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _DPPrioRecord *v22;
  uint64_t v23;
  NSString *key;
  uint64_t v25;
  NSData *share1;
  uint64_t v27;
  NSData *share2;
  uint64_t v29;
  NSDictionary *metadata;
  objc_super v32;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a10;
  v32.receiver = self;
  v32.super_class = (Class)_DPPrioRecord;
  v22 = -[_DPPrioRecord init](&v32, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v17, "copy");
    key = v22->_key;
    v22->_key = (NSString *)v23;

    v25 = objc_msgSend(v18, "copy");
    share1 = v22->_share1;
    v22->_share1 = (NSData *)v25;

    v27 = objc_msgSend(v19, "copy");
    share2 = v22->_share2;
    v22->_share2 = (NSData *)v27;

    v22->_dimension = a6;
    v29 = objc_msgSend(v20, "copy");
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v29;

    v22->_creationDate = a8;
    v22->_submitted = a9;
    v22->_reportVersion = +[_DPJSONOutputHelper currentVersion](_DPJSONOutputHelper, "currentVersion");
    objc_storeStrong((id *)&v22->_objectId, a10);
  }

  return v22;
}

- (id)jsonString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\"share1\":\"%@\",\"share2\":\"%@\",\"dimension\":\"%lld\"}"), self->_share1, self->_share2, self->_dimension);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPPrioRecord)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  _DPPrioRecord *v18;
  uint64_t v20;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("dimension"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "BOOLValue");
  v18 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:](self, "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v21, v4, v5, v20, v12, v17, v15, 0);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSManagedObjectID *objectId;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_share1, CFSTR("share1"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_share2, CFSTR("share2"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_dimension, CFSTR("dimension"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("creationDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_submitted);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("submitted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reportVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("reportVersion"));

  objectId = self->_objectId;
  if (objectId)
    objc_msgSend(v8, "encodeObject:forKey:", objectId, CFSTR("objectId"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  double creationDate;
  const char *v10;
  int64_t reportVersion;
  int64_t dimension;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  v4 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: { key=%@ ; "), v6, self->_key);

  v7 = -[NSData length](self->_share1, "length");
  v8 = -[NSData length](self->_share2, "length");
  creationDate = self->_creationDate;
  if (self->_submitted)
    v10 = "YES";
  else
    v10 = "NO";
  reportVersion = self->_reportVersion;
  dimension = self->_dimension;
  -[NSDictionary allKeys](self->_metadata, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("share1=(length:%lu) ; share2=(length:%lu) ; dimension=%lld ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; metadata=(keys: %@) ; "),
    v7,
    v8,
    dimension,
    *(_QWORD *)&creationDate,
    v10,
    reportVersion,
    v13);

  if (self->_objectId)
    objc_msgSend(v4, "appendFormat:", CFSTR("objectId=%@ }"), self->_objectId);
  else
    objc_msgSend(v4, "appendString:", CFSTR("objectId=(nil) }"));
  v14 = (void *)objc_msgSend(v4, "copy");

  objc_autoreleasePoolPop(v3);
  return (NSString *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_DPPrioRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrioRecord share1](self, "share1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrioRecord share2](self, "share2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DPPrioRecord dimension](self, "dimension");
  -[_DPPrioRecord metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrioRecord creationDate](self, "creationDate");
  v11 = v10;
  v12 = -[_DPPrioRecord submitted](self, "submitted");
  -[_DPPrioRecord objectId](self, "objectId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v5, v6, v7, v8, v9, v12, v11, v13);

  return v14;
}

- (BOOL)isEqualToPrioRecord:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSData *share1;
  NSData *v10;
  NSData *v11;
  int v12;
  NSData *share2;
  NSData *v14;
  NSData *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  int v25;
  int64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  int64_t v35;
  int v36;
  void *v37;
  void *v38;
  BOOL v39;
  char v41;
  char v42;
  int v43;

  v5 = a3;
  if (!v5)
  {
LABEL_14:
    v39 = 0;
    goto LABEL_18;
  }
  -[_DPPrioRecord key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  share1 = self->_share1;
  objc_msgSend(v5, "share1");
  v10 = (NSData *)objc_claimAutoreleasedReturnValue();
  v43 = v8;
  if (share1 != v10)
  {
    v11 = self->_share1;
    objc_msgSend(v5, "share1");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSData isEqualToData:](v11, "isEqualToData:", v3))
    {
      v12 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  share2 = self->_share2;
  objc_msgSend(v5, "share2");
  v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (share2 == v14)
  {
    v12 = 1;
  }
  else
  {
    v15 = self->_share2;
    objc_msgSend(v5, "share2");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSData isEqualToData:](v15, "isEqualToData:", v16);

  }
  if (share1 != v10)
    goto LABEL_9;
LABEL_10:

  v17 = -[_DPPrioRecord dimension](self, "dimension");
  v18 = objc_msgSend(v5, "dimension");
  -[_DPPrioRecord metadata](self, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v20 = objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v19, "isEqualToDictionary:", v20);

  -[_DPPrioRecord creationDate](self, "creationDate");
  v22 = v21;
  objc_msgSend(v5, "creationDate");
  v24 = areEqualTimeIntervals(v22, v23);
  LODWORD(v20) = -[_DPPrioRecord submitted](self, "submitted");
  v25 = v20 ^ objc_msgSend(v5, "submitted");
  v26 = -[_DPPrioRecord reportVersion](self, "reportVersion");
  v27 = objc_msgSend(v5, "reportVersion");
  -[_DPPrioRecord objectId](self, "objectId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[_DPPrioRecord objectId](self, "objectId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectId");
    v30 = v25;
    v31 = v24;
    v32 = v27;
    v33 = v26;
    v34 = v18;
    v35 = v17;
    v36 = v12;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v29, "isEqual:", v37);

    v12 = v36;
    v17 = v35;
    v18 = v34;
    v26 = v33;
    v27 = v32;
    v24 = v31;
    LOBYTE(v25) = v30;

  }
  else
  {
    objc_msgSend(v5, "objectId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v38 == 0;
  }
  if ((v17 != v18 || (v43 & v12 & 1) == 0 || (v42 & 1) == 0 || !v24) | v25 & 1)
    goto LABEL_14;
  if (v26 == v27)
    v39 = v41;
  else
    v39 = 0;
LABEL_18:

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  _DPPrioRecord *v4;
  _DPPrioRecord *v5;
  BOOL v6;

  v4 = (_DPPrioRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPPrioRecord isEqualToPrioRecord:](self, "isEqualToPrioRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  unint64_t v17;

  -[_DPPrioRecord key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DPPrioRecord share1](self, "share1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[_DPPrioRecord share2](self, "share2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[_DPPrioRecord dimension](self, "dimension");
  -[_DPPrioRecord metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[_DPPrioRecord creationDate](self, "creationDate");
  v13 = (unint64_t)v12;
  v14 = v11 ^ -[_DPPrioRecord submitted](self, "submitted");
  v15 = v14 ^ -[_DPPrioRecord reportVersion](self, "reportVersion");
  -[_DPPrioRecord objectId](self, "objectId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash") ^ v13;

  return v17;
}

+ (id)createRecordFromManagedObject:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "copyFromManagedObject:", v3);

  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

+ (id)entityName
{
  return CFSTR("PrioRecord");
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
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    -[_DPPrioRecord key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKey:", v7);

    -[_DPPrioRecord share1](self, "share1");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShare1:", v8);

    -[_DPPrioRecord share2](self, "share2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShare2:", v9);

    objc_msgSend(v6, "setDimension:", -[_DPPrioRecord dimension](self, "dimension"));
    v10 = (void *)MEMORY[0x1E0CB36F8];
    -[_DPPrioRecord metadata](self, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v25;

    if (v13)
    {
      +[_DPLog framework](_DPLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_DPPrioRecord copyToManagedObject:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

    }
    objc_msgSend(v6, "setMetadata:", v12);
    -[_DPPrioRecord creationDate](self, "creationDate");
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPPrioRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPPrioRecord reportVersion](self, "reportVersion"));
    -[_DPPrioRecord objectId](self, "objectId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 != v22)
    {
      objc_msgSend(v6, "objectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPPrioRecord setObjectId:](self, "setObjectId:", v23);

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v24;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPPrioRecord setKey:](self, "setKey:", v7);

    objc_msgSend(v6, "share1");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPPrioRecord setShare1:](self, "setShare1:", v8);

    objc_msgSend(v6, "share2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPPrioRecord setShare2:](self, "setShare2:", v9);

    -[_DPPrioRecord setDimension:](self, "setDimension:", objc_msgSend(v6, "dimension"));
    v10 = (void *)MEMORY[0x1E0CB3710];
    _DPMetadataExpectedClasses();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v11, v12, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;

    if (v14)
    {
      +[_DPLog framework](_DPLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[_DPPrioRecord copyFromManagedObject:].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

    }
    -[_DPPrioRecord setMetadata:](self, "setMetadata:", v13);
    objc_msgSend(v6, "creationDate");
    -[_DPPrioRecord setCreationDate:](self, "setCreationDate:");
    -[_DPPrioRecord setSubmitted:](self, "setSubmitted:", objc_msgSend(v6, "submitted"));
    -[_DPPrioRecord setReportVersion:](self, "setReportVersion:", objc_msgSend(v6, "reportVersion"));
    objc_msgSend(v6, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPPrioRecord setObjectId:](self, "setObjectId:", v22);

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

- (NSData)share1
{
  return self->_share1;
}

- (void)setShare1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)share2
{
  return self->_share2;
}

- (void)setShare2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (void)setDimension:(int64_t)a3
{
  self->_dimension = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_share2, 0);
  objc_storeStrong((id *)&self->_share1, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)copyToManagedObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Unable to securely archive metadata Dictionary! error: %@", a5, a6, a7, a8, 2u);
}

- (void)copyFromManagedObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Unable to securely unarchive metadata Dictionary! error: %@", a5, a6, a7, a8, 2u);
}

@end
