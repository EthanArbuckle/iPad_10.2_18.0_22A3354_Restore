@implementation _DPNumericDataRecord

- (_DPNumericDataRecord)init
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return -[_DPNumericDataRecord initWithKey:clearNumber:privateNumber:creationDate:submitted:objectId:](self, "initWithKey:clearNumber:privateNumber:creationDate:submitted:objectId:", CFSTR("com.apple._DPNumericDataRecord"), 0, 0, 0.0, 0.0, v5);
}

- (_DPNumericDataRecord)initWithKey:(id)a3 clearNumber:(double)a4 privateNumber:(double)a5 creationDate:(double)a6 submitted:(BOOL)a7 objectId:(id)a8
{
  id v14;
  id v15;
  _DPNumericDataRecord *v16;
  _DPNumericDataRecord *v17;
  objc_super v19;

  v14 = a3;
  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)_DPNumericDataRecord;
  v16 = -[_DPNumericDataRecord init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    v17->_clearNumber = 0.0;
    v17->_privateNumber = a5;
    v17->_creationDate = a6;
    v17->_submitted = a7;
    v17->_reportVersion = +[_DPJSONOutputHelper currentVersion](_DPJSONOutputHelper, "currentVersion");
    objc_storeStrong((id *)&v17->_objectId, a8);
  }

  return v17;
}

- (id)jsonString
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_DPNumericDataRecord privateNumber](self, "privateNumber");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("\"%lf\"), v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPNumericDataRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  _DPNumericDataRecord *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitted"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "BOOLValue");
  v17 = -[_DPNumericDataRecord initWithKey:clearNumber:privateNumber:creationDate:submitted:objectId:](self, "initWithKey:clearNumber:privateNumber:creationDate:submitted:objectId:", v5, v16, 0, v8, v11, v14);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSManagedObjectID *objectId;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clearNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("clearNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_privateNumber);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("privateNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("creationDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_submitted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("submitted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reportVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("reportVersion"));

  objectId = self->_objectId;
  if (objectId)
    objc_msgSend(v10, "encodeObject:forKey:", objectId, CFSTR("objectId"));

}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  v4 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: { key=%@ ; "), v6, self->_key);

  v7 = "YES";
  if (!self->_submitted)
    v7 = "NO";
  objc_msgSend(v4, "appendFormat:", CFSTR("privateNumber=%lf ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; "),
    *(_QWORD *)&self->_privateNumber,
    *(_QWORD *)&self->_creationDate,
    v7,
    self->_reportVersion);
  if (self->_objectId)
    objc_msgSend(v4, "appendFormat:", CFSTR("objectId=%@ }"), self->_objectId);
  else
    objc_msgSend(v4, "appendString:", CFSTR("objectId=(nil) }"));
  v8 = (void *)objc_msgSend(v4, "copy");

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_DPNumericDataRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPNumericDataRecord clearNumber](self, "clearNumber");
  v7 = v6;
  -[_DPNumericDataRecord privateNumber](self, "privateNumber");
  v9 = v8;
  -[_DPNumericDataRecord creationDate](self, "creationDate");
  v11 = v10;
  v12 = -[_DPNumericDataRecord submitted](self, "submitted");
  -[_DPNumericDataRecord objectId](self, "objectId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithKey:clearNumber:privateNumber:creationDate:submitted:objectId:", v5, v12, v13, v7, v9, v11);

  return v14;
}

- (BOOL)isEqualToNumericDataRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  int v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  BOOL v29;

  v4 = a3;
  if (!v4)
    goto LABEL_10;
  -[_DPNumericDataRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  -[_DPNumericDataRecord clearNumber](self, "clearNumber");
  v9 = v8;
  objc_msgSend(v4, "clearNumber");
  v11 = vabdd_f64(v9, v10);
  -[_DPNumericDataRecord privateNumber](self, "privateNumber");
  v13 = v12;
  objc_msgSend(v4, "privateNumber");
  v15 = vabdd_f64(v13, v14);
  -[_DPNumericDataRecord creationDate](self, "creationDate");
  v17 = v16;
  objc_msgSend(v4, "creationDate");
  v19 = areEqualTimeIntervals(v17, v18);
  LODWORD(v6) = -[_DPNumericDataRecord submitted](self, "submitted");
  v20 = v6 ^ objc_msgSend(v4, "submitted");
  v21 = -[_DPNumericDataRecord reportVersion](self, "reportVersion");
  v22 = objc_msgSend(v4, "reportVersion");
  -[_DPNumericDataRecord objectId](self, "objectId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_DPNumericDataRecord objectId](self, "objectId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

  }
  else
  {
    objc_msgSend(v4, "objectId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v27 == 0;
  }
  v28 = v7 ^ 1;
  if (v11 >= 1.0e-20)
    v28 = 1;
  if (v15 >= 1.0e-20)
    v28 = 1;
  if (((v28 | !v19 | v20) & 1) == 0)
  {
    if (v21 == v22)
      v29 = v26;
    else
      v29 = 0;
  }
  else
  {
LABEL_10:
    v29 = 0;
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  _DPNumericDataRecord *v4;
  _DPNumericDataRecord *v5;
  BOOL v6;

  v4 = (_DPNumericDataRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPNumericDataRecord isEqualToNumericDataRecord:](self, "isEqualToNumericDataRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  unint64_t v14;

  -[_DPNumericDataRecord key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DPNumericDataRecord clearNumber](self, "clearNumber");
  v6 = v4 ^ (unint64_t)v5;
  -[_DPNumericDataRecord privateNumber](self, "privateNumber");
  v8 = (unint64_t)v7;
  -[_DPNumericDataRecord creationDate](self, "creationDate");
  v10 = v6 ^ v8 ^ (unint64_t)v9;
  v11 = -[_DPNumericDataRecord submitted](self, "submitted");
  v12 = v11 ^ -[_DPNumericDataRecord reportVersion](self, "reportVersion");
  -[_DPNumericDataRecord objectId](self, "objectId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
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
  return CFSTR("NumericDataRecord");
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
    -[_DPNumericDataRecord key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKey:", v7);

    -[_DPNumericDataRecord clearNumber](self, "clearNumber");
    objc_msgSend(v6, "setClearNumber:");
    -[_DPNumericDataRecord privateNumber](self, "privateNumber");
    objc_msgSend(v6, "setPrivateNumber:");
    -[_DPNumericDataRecord creationDate](self, "creationDate");
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPNumericDataRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPNumericDataRecord reportVersion](self, "reportVersion"));
    -[_DPNumericDataRecord objectId](self, "objectId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPNumericDataRecord setObjectId:](self, "setObjectId:", v10);

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
    -[_DPNumericDataRecord setKey:](self, "setKey:", v7);

    objc_msgSend(v6, "clearNumber");
    -[_DPNumericDataRecord setClearNumber:](self, "setClearNumber:");
    objc_msgSend(v6, "privateNumber");
    -[_DPNumericDataRecord setPrivateNumber:](self, "setPrivateNumber:");
    objc_msgSend(v6, "creationDate");
    -[_DPNumericDataRecord setCreationDate:](self, "setCreationDate:");
    -[_DPNumericDataRecord setSubmitted:](self, "setSubmitted:", objc_msgSend(v6, "submitted"));
    -[_DPNumericDataRecord setReportVersion:](self, "setReportVersion:", objc_msgSend(v6, "reportVersion"));
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPNumericDataRecord setObjectId:](self, "setObjectId:", v8);
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

- (double)clearNumber
{
  return self->_clearNumber;
}

- (void)setClearNumber:(double)a3
{
  self->_clearNumber = a3;
}

- (double)privateNumber
{
  return self->_privateNumber;
}

- (void)setPrivateNumber:(double)a3
{
  self->_privateNumber = a3;
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
