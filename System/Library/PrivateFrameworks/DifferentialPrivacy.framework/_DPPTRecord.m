@implementation _DPPTRecord

- (_DPPTRecord)init
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return -[_DPPTRecord initWithKey:privateValue:creationDate:submitted:objectId:](self, "initWithKey:privateValue:creationDate:submitted:objectId:", CFSTR("com.apple._DPPTRecord"), &stru_1E95DA470, 0, 0, v5);
}

- (_DPPTRecord)initWithKey:(id)a3 privateValue:(id)a4 creationDate:(double)a5 submitted:(BOOL)a6 objectId:(id)a7
{
  id v13;
  id v14;
  id v15;
  _DPPTRecord *v16;
  _DPPTRecord *v17;
  uint64_t v18;
  NSString *privateValue;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_DPPTRecord;
  v16 = -[_DPPTRecord init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    v18 = objc_msgSend(v14, "copy");
    privateValue = v17->_privateValue;
    v17->_privateValue = (NSString *)v18;

    v17->_creationDate = a5;
    v17->_submitted = a6;
    v17->_reportVersion = +[_DPJSONOutputHelper currentVersion](_DPJSONOutputHelper, "currentVersion");
    objc_storeStrong((id *)&v17->_objectId, a7);
  }

  return v17;
}

- (id)jsonString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_DPPTRecord privateValue](self, "privateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\"%@\"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPPTRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  _DPPTRecord *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  v12 = -[_DPPTRecord initWithKey:privateValue:creationDate:submitted:objectId:](self, "initWithKey:privateValue:creationDate:submitted:objectId:", v5, v6, v11, 0, v9);

  return v12;
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
  objc_msgSend(v8, "encodeObject:forKey:", self->_privateValue, CFSTR("privateValue"));
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
  objc_msgSend(v4, "appendFormat:", CFSTR("privateValue=%@ ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; "),
    self->_privateValue,
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
  void *v6;
  double v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_DPPTRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPTRecord privateValue](self, "privateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPTRecord creationDate](self, "creationDate");
  v8 = v7;
  v9 = -[_DPPTRecord submitted](self, "submitted");
  -[_DPPTRecord objectId](self, "objectId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithKey:privateValue:creationDate:submitted:objectId:", v5, v6, v9, v10, v8);

  return v11;
}

- (BOOL)isEqualToPTRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  int v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  BOOL v23;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  -[_DPPTRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  -[_DPPTRecord privateValue](self, "privateValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  -[_DPPTRecord creationDate](self, "creationDate");
  v12 = v11;
  objc_msgSend(v4, "creationDate");
  v14 = areEqualTimeIntervals(v12, v13);
  LODWORD(v9) = -[_DPPTRecord submitted](self, "submitted");
  v15 = v9 ^ objc_msgSend(v4, "submitted");
  v16 = -[_DPPTRecord reportVersion](self, "reportVersion");
  v17 = objc_msgSend(v4, "reportVersion");
  -[_DPPTRecord objectId](self, "objectId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_DPPTRecord objectId](self, "objectId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

  }
  else
  {
    objc_msgSend(v4, "objectId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v22 == 0;
  }
  if (((v7 & v10 & v14 ^ 1 | v15) & 1) == 0)
  {
    if (v16 == v17)
      v23 = v21;
    else
      v23 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  _DPPTRecord *v4;
  _DPPTRecord *v5;
  BOOL v6;

  v4 = (_DPPTRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPPTRecord isEqualToPTRecord:](self, "isEqualToPTRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  unint64_t v12;

  -[_DPPTRecord key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DPPTRecord privateValue](self, "privateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[_DPPTRecord creationDate](self, "creationDate");
  v8 = (unint64_t)v7;
  v9 = v6 ^ -[_DPPTRecord submitted](self, "submitted");
  v10 = v9 ^ -[_DPPTRecord reportVersion](self, "reportVersion");
  -[_DPPTRecord objectId](self, "objectId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v8;

  return v12;
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
  return CFSTR("PTRecord");
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

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    -[_DPPTRecord key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKey:", v7);

    -[_DPPTRecord privateValue](self, "privateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrivateValue:", v8);

    -[_DPPTRecord creationDate](self, "creationDate");
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPPTRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPPTRecord reportVersion](self, "reportVersion"));
    -[_DPPTRecord objectId](self, "objectId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
    {
      objc_msgSend(v6, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPPTRecord setObjectId:](self, "setObjectId:", v11);

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

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPPTRecord setKey:](self, "setKey:", v7);

    objc_msgSend(v6, "privateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPPTRecord setPrivateValue:](self, "setPrivateValue:", v8);

    objc_msgSend(v6, "creationDate");
    -[_DPPTRecord setCreationDate:](self, "setCreationDate:");
    -[_DPPTRecord setSubmitted:](self, "setSubmitted:", objc_msgSend(v6, "submitted"));
    -[_DPPTRecord setReportVersion:](self, "setReportVersion:", objc_msgSend(v6, "reportVersion"));
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPPTRecord setObjectId:](self, "setObjectId:", v9);
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
  objc_storeStrong((id *)&self->_privateValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
