@implementation _DPBSSFPRecord

- (_DPBSSFPRecord)init
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return -[_DPBSSFPRecord initWithKey:privateValue:tableVersion:segmentIndex:verificationMode:creationDate:submitted:objectId:](self, "initWithKey:privateValue:tableVersion:segmentIndex:verificationMode:creationDate:submitted:objectId:", CFSTR("com.apple._DPBSSFPRecord"), &stru_1E95DA470, &stru_1E95DA470, 0, 0, 0, v5, 0);
}

- (_DPBSSFPRecord)initWithKey:(id)a3 privateValue:(id)a4 tableVersion:(id)a5 segmentIndex:(int64_t)a6 verificationMode:(BOOL)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  _DPBSSFPRecord *v22;
  _DPBSSFPRecord *v23;
  uint64_t v24;
  NSString *privateValue;
  uint64_t v26;
  NSString *tableVersion;
  objc_super v29;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a10;
  v29.receiver = self;
  v29.super_class = (Class)_DPBSSFPRecord;
  v22 = -[_DPBSSFPRecord init](&v29, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_key, a3);
    v24 = objc_msgSend(v19, "copy");
    privateValue = v23->_privateValue;
    v23->_privateValue = (NSString *)v24;

    v26 = objc_msgSend(v20, "copy");
    tableVersion = v23->_tableVersion;
    v23->_tableVersion = (NSString *)v26;

    v23->_segmentIndex = a6;
    v23->_verificationMode = a7;
    v23->_creationDate = a8;
    v23->_submitted = a9;
    v23->_reportVersion = +[_DPJSONOutputHelper currentVersion](_DPJSONOutputHelper, "currentVersion");
    objc_storeStrong((id *)&v23->_objectId, a10);
  }

  return v23;
}

- (id)jsonString
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_DPBSSFPRecord tableVersion](self, "tableVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_DPBSSFPRecord verificationMode](self, "verificationMode");
  v6 = -[_DPBSSFPRecord segmentIndex](self, "segmentIndex");
  -[_DPBSSFPRecord privateValue](self, "privateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@;%d;%lld;%@\"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPBSSFPRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  _DPBSSFPRecord *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tableVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("segmentIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verificationMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitted"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "BOOLValue");
  v17 = -[_DPBSSFPRecord initWithKey:privateValue:tableVersion:segmentIndex:verificationMode:creationDate:submitted:objectId:](self, "initWithKey:privateValue:tableVersion:segmentIndex:verificationMode:creationDate:submitted:objectId:", v5, v6, v7, v9, v11, v16, v14, 0);

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
  objc_msgSend(v10, "encodeObject:forKey:", self->_privateValue, CFSTR("privateValue"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_tableVersion, CFSTR("tableVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_segmentIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("segmentIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_verificationMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("verificationMode"));

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
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  v4 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: { key=%@ ; "), v6, self->_key);

  v7 = "YES";
  if (self->_verificationMode)
    v8 = "YES";
  else
    v8 = "NO";
  if (!self->_submitted)
    v7 = "NO";
  objc_msgSend(v4, "appendFormat:", CFSTR("privateValue=%@ ; tableVersion=%@ ; sergmentIndex=%lld ; verificationMode=%s ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; "),
    *(_OWORD *)&self->_privateValue,
    self->_segmentIndex,
    v8,
    *(_QWORD *)&self->_creationDate,
    v7,
    self->_reportVersion);
  if (self->_objectId)
    objc_msgSend(v4, "appendFormat:", CFSTR("objectId=%@ }"), self->_objectId);
  else
    objc_msgSend(v4, "appendString:", CFSTR("objectId=(nil) }"));
  v9 = (void *)objc_msgSend(v4, "copy");

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  _BOOL8 v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_DPBSSFPRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPBSSFPRecord privateValue](self, "privateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPBSSFPRecord tableVersion](self, "tableVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DPBSSFPRecord segmentIndex](self, "segmentIndex");
  v9 = -[_DPBSSFPRecord verificationMode](self, "verificationMode");
  -[_DPBSSFPRecord creationDate](self, "creationDate");
  v11 = v10;
  v12 = -[_DPBSSFPRecord submitted](self, "submitted");
  -[_DPBSSFPRecord objectId](self, "objectId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithKey:privateValue:tableVersion:segmentIndex:verificationMode:creationDate:submitted:objectId:", v5, v6, v7, v8, v9, v12, v11, v13);

  return v14;
}

- (BOOL)isEqualToBSSFPRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  _BOOL4 v18;
  int v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  uint64_t v26;
  char v27;
  int64_t v28;
  int v29;
  void *v30;
  void *v31;
  BOOL v32;
  char v34;
  int64_t v35;
  int v36;
  int v37;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  -[_DPBSSFPRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v5, "isEqualToString:", v6);

  -[_DPBSSFPRecord privateValue](self, "privateValue");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)v13, "isEqualToString:", v7);

  -[_DPBSSFPRecord tableVersion](self, "tableVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v9, "isEqualToString:", v10);

  v35 = -[_DPBSSFPRecord segmentIndex](self, "segmentIndex");
  v11 = objc_msgSend(v4, "segmentIndex");
  v12 = -[_DPBSSFPRecord verificationMode](self, "verificationMode");
  LODWORD(v13) = v12 ^ objc_msgSend(v4, "verificationMode");
  -[_DPBSSFPRecord creationDate](self, "creationDate");
  v15 = v14;
  objc_msgSend(v4, "creationDate");
  v17 = areEqualTimeIntervals(v15, v16);
  v18 = -[_DPBSSFPRecord submitted](self, "submitted");
  v19 = v18 ^ objc_msgSend(v4, "submitted");
  v20 = -[_DPBSSFPRecord reportVersion](self, "reportVersion");
  v21 = objc_msgSend(v4, "reportVersion");
  -[_DPBSSFPRecord objectId](self, "objectId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_DPBSSFPRecord objectId](self, "objectId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectId");
    v24 = v19;
    v25 = v17;
    v26 = v21;
    v27 = v13;
    v13 = v11;
    v28 = v20;
    v29 = v8;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v23, "isEqual:", v30);

    v8 = v29;
    v20 = v28;
    v11 = v13;
    LOBYTE(v13) = v27;
    v21 = v26;
    v17 = v25;
    LOBYTE(v19) = v24;

  }
  else
  {
    objc_msgSend(v4, "objectId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v31 == 0;
  }
  if (!((v35 != v11 || (v37 & v8 & v36 & 1) == 0) | v13 & 1 | !v17 | v19 & 1))
  {
    if (v20 == v21)
      v32 = v34;
    else
      v32 = 0;
  }
  else
  {
LABEL_6:
    v32 = 0;
  }

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  _DPBSSFPRecord *v4;
  _DPBSSFPRecord *v5;
  BOOL v6;

  v4 = (_DPBSSFPRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPBSSFPRecord isEqualToBSSFPRecord:](self, "isEqualToBSSFPRecord:", v5);

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
  int64_t v10;
  double v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  unint64_t v16;

  -[_DPBSSFPRecord key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DPBSSFPRecord privateValue](self, "privateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[_DPBSSFPRecord tableVersion](self, "tableVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[_DPBSSFPRecord segmentIndex](self, "segmentIndex");
  v10 = v9 ^ -[_DPBSSFPRecord verificationMode](self, "verificationMode");
  -[_DPBSSFPRecord creationDate](self, "creationDate");
  v12 = (unint64_t)v11;
  v13 = v10 ^ -[_DPBSSFPRecord submitted](self, "submitted");
  v14 = v13 ^ -[_DPBSSFPRecord reportVersion](self, "reportVersion");
  -[_DPBSSFPRecord objectId](self, "objectId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash") ^ v12;

  return v16;
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
  return CFSTR("BSSFPRecord");
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

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    -[_DPBSSFPRecord key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKey:", v7);

    -[_DPBSSFPRecord privateValue](self, "privateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrivateValue:", v8);

    -[_DPBSSFPRecord tableVersion](self, "tableVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTableVersion:", v9);

    objc_msgSend(v6, "setSegmentIndex:", -[_DPBSSFPRecord segmentIndex](self, "segmentIndex"));
    objc_msgSend(v6, "setVerificationMode:", -[_DPBSSFPRecord verificationMode](self, "verificationMode"));
    -[_DPBSSFPRecord creationDate](self, "creationDate");
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPBSSFPRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPBSSFPRecord reportVersion](self, "reportVersion"));
    -[_DPBSSFPRecord objectId](self, "objectId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
    {
      objc_msgSend(v6, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPBSSFPRecord setObjectId:](self, "setObjectId:", v12);

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

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPBSSFPRecord setKey:](self, "setKey:", v7);

    objc_msgSend(v6, "privateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPBSSFPRecord setPrivateValue:](self, "setPrivateValue:", v8);

    objc_msgSend(v6, "tableVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPBSSFPRecord setTableVersion:](self, "setTableVersion:", v9);

    -[_DPBSSFPRecord setSegmentIndex:](self, "setSegmentIndex:", objc_msgSend(v6, "segmentIndex"));
    -[_DPBSSFPRecord setVerificationMode:](self, "setVerificationMode:", objc_msgSend(v6, "verificationMode"));
    objc_msgSend(v6, "creationDate");
    -[_DPBSSFPRecord setCreationDate:](self, "setCreationDate:");
    -[_DPBSSFPRecord setSubmitted:](self, "setSubmitted:", objc_msgSend(v6, "submitted"));
    -[_DPBSSFPRecord setReportVersion:](self, "setReportVersion:", objc_msgSend(v6, "reportVersion"));
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPBSSFPRecord setObjectId:](self, "setObjectId:", v10);
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

- (NSString)privateValue
{
  return self->_privateValue;
}

- (void)setPrivateValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)tableVersion
{
  return self->_tableVersion;
}

- (void)setTableVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(int64_t)a3
{
  self->_segmentIndex = a3;
}

- (BOOL)verificationMode
{
  return self->_verificationMode;
}

- (void)setVerificationMode:(BOOL)a3
{
  self->_verificationMode = a3;
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
  objc_storeStrong((id *)&self->_tableVersion, 0);
  objc_storeStrong((id *)&self->_privateValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
