@implementation _DPModelInfoRecord

- (_DPModelInfoRecord)init
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return -[_DPModelInfoRecord initWithMajorVersion:minorVersion:creationDate:objectId:](self, "initWithMajorVersion:minorVersion:creationDate:objectId:", 0, 0, 0, v5);
}

- (_DPModelInfoRecord)initWithMajorVersion:(signed __int16)a3 minorVersion:(signed __int16)a4 creationDate:(double)a5 objectId:(id)a6
{
  id v11;
  _DPModelInfoRecord *v12;
  _DPModelInfoRecord *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_DPModelInfoRecord;
  v12 = -[_DPModelInfoRecord init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_majorVersion = a3;
    v12->_minorVersion = a4;
    v12->_creationDate = a5;
    v12->_submitted = 0;
    objc_storeStrong((id *)&v12->_objectId, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPModelInfoRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("majorVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minorVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shortValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return -[_DPModelInfoRecord initWithMajorVersion:minorVersion:creationDate:objectId:](self, "initWithMajorVersion:minorVersion:creationDate:objectId:", v6, v8, 0, v11);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSManagedObjectID *objectId;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_majorVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("majorVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_minorVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("minorVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("creationDate"));

  objectId = self->_objectId;
  if (objectId)
    objc_msgSend(v8, "encodeObject:forKey:", objectId, CFSTR("objectId"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { majorVersion=%d ; minorVersion=%d ; creationDate=%.16g ; "),
    v5,
    self->_majorVersion,
    self->_minorVersion,
    *(_QWORD *)&self->_creationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_objectId)
    objc_msgSend(v6, "appendFormat:", CFSTR("objectId=%@ }"), self->_objectId);
  else
    objc_msgSend(v6, "appendString:", CFSTR("objectId=(nil) }"));
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[_DPModelInfoRecord majorVersion](self, "majorVersion");
  v6 = -[_DPModelInfoRecord minorVersion](self, "minorVersion");
  -[_DPModelInfoRecord creationDate](self, "creationDate");
  v8 = v7;
  -[_DPModelInfoRecord objectId](self, "objectId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithMajorVersion:minorVersion:creationDate:objectId:", v5, v6, v9, v8);

  return v10;
}

- (BOOL)isEqualToModelInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  BOOL v16;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  -[_DPModelInfoRecord creationDate](self, "creationDate");
  v6 = v5;
  objc_msgSend(v4, "creationDate");
  v8 = areEqualTimeIntervals(v6, v7);
  -[_DPModelInfoRecord objectId](self, "objectId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_DPModelInfoRecord objectId](self, "objectId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

  }
  else
  {
    objc_msgSend(v4, "objectId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v13 == 0;
  }
  if ((v8 & v12) == 1
    && (v14 = -[_DPModelInfoRecord majorVersion](self, "majorVersion"),
        v14 == objc_msgSend(v4, "majorVersion")))
  {
    v15 = -[_DPModelInfoRecord minorVersion](self, "minorVersion");
    v16 = v15 == objc_msgSend(v4, "minorVersion");
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  _DPModelInfoRecord *v4;
  _DPModelInfoRecord *v5;
  BOOL v6;

  v4 = (_DPModelInfoRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPModelInfoRecord isEqualToModelInfo:](self, "isEqualToModelInfo:", v5);

  return v6;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[_DPModelInfoRecord majorVersion](self, "majorVersion");
  v4 = -[_DPModelInfoRecord minorVersion](self, "minorVersion") ^ v3;
  -[_DPModelInfoRecord creationDate](self, "creationDate");
  v6 = (unint64_t)v5;
  -[_DPModelInfoRecord objectId](self, "objectId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ objc_msgSend(v7, "hash") ^ v6;

  return v8;
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
  return CFSTR("ModelInfoRecord");
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

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "setMajorVersion:", -[_DPModelInfoRecord majorVersion](self, "majorVersion"));
    objc_msgSend(v6, "setMinorVersion:", -[_DPModelInfoRecord minorVersion](self, "minorVersion"));
    -[_DPModelInfoRecord objectId](self, "objectId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      objc_msgSend(v6, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPModelInfoRecord setObjectId:](self, "setObjectId:", v9);

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

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    -[_DPModelInfoRecord setMajorVersion:](self, "setMajorVersion:", objc_msgSend(v6, "majorVersion"));
    -[_DPModelInfoRecord setMinorVersion:](self, "setMinorVersion:", objc_msgSend(v6, "minorVersion"));
    objc_msgSend(v6, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPModelInfoRecord setObjectId:](self, "setObjectId:", v7);
  }

  return isKindOfClass & 1;
}

- (signed)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(signed __int16)a3
{
  self->_majorVersion = a3;
}

- (signed)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(signed __int16)a3
{
  self->_minorVersion = a3;
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
}

@end
