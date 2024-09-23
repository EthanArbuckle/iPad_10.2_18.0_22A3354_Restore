@implementation _DPBitValueRecord

- (_DPBitValueRecord)init
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:](self, "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", CFSTR("com.apple._DPBitValueDataRecord"), 0, &stru_1E95DA470, 0, 0, v5);
}

- (_DPBitValueRecord)initWithKey:(id)a3 clearBitValue:(signed __int16)a4 privateBitValueStr:(id)a5 creationDate:(double)a6 submitted:(BOOL)a7 objectId:(id)a8
{
  id v14;
  id v15;
  id v16;
  _DPBitValueRecord *v17;
  _DPBitValueRecord *v18;
  objc_super v20;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_DPBitValueRecord;
  v17 = -[_DPBitValueRecord init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_key, a3);
    v18->_clearBitValue = 0;
    objc_storeStrong((id *)&v18->_privateBitValueStr, a5);
    v18->_creationDate = a6;
    v18->_submitted = a7;
    v18->_reportVersion = +[_DPJSONOutputHelper currentVersion](_DPJSONOutputHelper, "currentVersion");
    objc_storeStrong((id *)&v18->_objectId, a8);
  }

  return v18;
}

- (id)jsonString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_DPBitValueRecord privateBitValueStr](self, "privateBitValueStr");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\"%@\"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPBitValueRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  _DPBitValueRecord *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearBitValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shortValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateBitValueStr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "BOOLValue");
  v14 = -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:](self, "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v5, v7, v8, v13, 0, v11);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSManagedObjectID *objectId;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_clearBitValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("clearBitValue"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_privateBitValueStr, CFSTR("privateBitValueStr"));
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
  objc_msgSend(v4, "appendFormat:", CFSTR("privateBitValueStr=%@ ; creationDate=%.16g ; submitted=%s ; reportVersion=%lld ; "),
    self->_privateBitValueStr,
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
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  void *v12;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_DPBitValueRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_DPBitValueRecord clearBitValue](self, "clearBitValue");
  -[_DPBitValueRecord privateBitValueStr](self, "privateBitValueStr");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPBitValueRecord creationDate](self, "creationDate");
  v9 = v8;
  v10 = -[_DPBitValueRecord submitted](self, "submitted");
  -[_DPBitValueRecord objectId](self, "objectId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v5, v6, v7, v10, v11, v9);

  return v12;
}

- (BOOL)isEqualToBitValueRecord:(id)a3
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
  int v23;
  BOOL v24;
  int v26;
  int v27;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  -[_DPBitValueRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v5, "isEqualToString:", v6);

  v26 = -[_DPBitValueRecord clearBitValue](self, "clearBitValue");
  v7 = objc_msgSend(v4, "clearBitValue");
  -[_DPBitValueRecord privateBitValueStr](self, "privateBitValueStr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateBitValueStr");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  -[_DPBitValueRecord creationDate](self, "creationDate");
  v12 = v11;
  objc_msgSend(v4, "creationDate");
  v14 = areEqualTimeIntervals(v12, v13);
  LODWORD(v9) = -[_DPBitValueRecord submitted](self, "submitted");
  v15 = v9 ^ objc_msgSend(v4, "submitted");
  v16 = -[_DPBitValueRecord reportVersion](self, "reportVersion");
  v17 = objc_msgSend(v4, "reportVersion");
  -[_DPBitValueRecord objectId](self, "objectId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_DPBitValueRecord objectId](self, "objectId");
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
  v23 = v27 ^ 1;
  if (v26 != v7)
    v23 = 1;
  if (((v23 | v10 ^ 1 | !v14 | v15) & 1) == 0)
  {
    if (v16 == v17)
      v24 = v21;
    else
      v24 = 0;
  }
  else
  {
LABEL_8:
    v24 = 0;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  _DPBitValueRecord *v4;
  _DPBitValueRecord *v5;
  BOOL v6;

  v4 = (_DPBitValueRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPBitValueRecord isEqualToBitValueRecord:](self, "isEqualToBitValueRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  unint64_t v13;

  -[_DPBitValueRecord key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[_DPBitValueRecord clearBitValue](self, "clearBitValue");
  -[_DPBitValueRecord privateBitValueStr](self, "privateBitValueStr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[_DPBitValueRecord creationDate](self, "creationDate");
  v9 = (unint64_t)v8;
  v10 = v7 ^ -[_DPBitValueRecord submitted](self, "submitted");
  v11 = v10 ^ -[_DPBitValueRecord reportVersion](self, "reportVersion");
  -[_DPBitValueRecord objectId](self, "objectId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v9;

  return v13;
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
  return CFSTR("BitValueRecord");
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
    -[_DPBitValueRecord key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKey:", v7);

    objc_msgSend(v6, "setClearBitValue:", -[_DPBitValueRecord clearBitValue](self, "clearBitValue"));
    -[_DPBitValueRecord privateBitValueStr](self, "privateBitValueStr");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrivateBitValueStr:", v8);

    -[_DPBitValueRecord creationDate](self, "creationDate");
    objc_msgSend(v6, "setCreationDate:");
    objc_msgSend(v6, "setSubmitted:", -[_DPBitValueRecord submitted](self, "submitted"));
    objc_msgSend(v6, "setReportVersion:", -[_DPBitValueRecord reportVersion](self, "reportVersion"));
    -[_DPBitValueRecord objectId](self, "objectId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
    {
      objc_msgSend(v6, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPBitValueRecord setObjectId:](self, "setObjectId:", v11);

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
    -[_DPBitValueRecord setKey:](self, "setKey:", v7);

    -[_DPBitValueRecord setClearBitValue:](self, "setClearBitValue:", objc_msgSend(v6, "clearBitValue"));
    objc_msgSend(v6, "privateBitValueStr");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPBitValueRecord setPrivateBitValueStr:](self, "setPrivateBitValueStr:", v8);

    objc_msgSend(v6, "creationDate");
    -[_DPBitValueRecord setCreationDate:](self, "setCreationDate:");
    -[_DPBitValueRecord setSubmitted:](self, "setSubmitted:", objc_msgSend(v6, "submitted"));
    -[_DPBitValueRecord setReportVersion:](self, "setReportVersion:", objc_msgSend(v6, "reportVersion"));
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPBitValueRecord setObjectId:](self, "setObjectId:", v9);
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

- (signed)clearBitValue
{
  return self->_clearBitValue;
}

- (void)setClearBitValue:(signed __int16)a3
{
  self->_clearBitValue = a3;
}

- (NSString)privateBitValueStr
{
  return self->_privateBitValueStr;
}

- (void)setPrivateBitValueStr:(id)a3
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
  objc_storeStrong((id *)&self->_privateBitValueStr, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
