@implementation HDCloudSyncShardPredicate

- (id)initForShardType:(int)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  HDCloudSyncShardPredicate *v10;
  HDCloudSyncShardPredicate *v11;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncShardPredicate;
  v10 = -[HDCloudSyncShardPredicate init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    v14 = objc_msgSend(v9, "copy");
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

  }
  return v11;
}

- (HDCloudSyncShardPredicate)initWithCodableShardPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDCloudSyncShardPredicate *v9;

  v4 = a3;
  if (objc_msgSend(v4, "hasStartDate"))
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "startDate");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v4, "hasEndDate"))
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "endDate");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:](self, "initForShardType:startDate:endDate:", objc_msgSend(v4, "type"), v6, v8);

  return v9;
}

- (id)codablePredicate
{
  HDCloudSyncCodableShardPredicate *v3;
  NSDate *startDate;
  NSDate *endDate;

  v3 = objc_alloc_init(HDCloudSyncCodableShardPredicate);
  -[HDCloudSyncCodableShardPredicate setType:](v3, "setType:", self->_type);
  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](startDate, "timeIntervalSinceReferenceDate");
    -[HDCloudSyncCodableShardPredicate setStartDate:](v3, "setStartDate:");
  }
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](endDate, "timeIntervalSinceReferenceDate");
    -[HDCloudSyncCodableShardPredicate setEndDate:](v3, "setEndDate:");
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  NSDate *startDate;
  NSDate *v6;
  NSDate *endDate;
  NSDate *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  if (self->_type != v4[2])
    goto LABEL_9;
  startDate = self->_startDate;
  v6 = (NSDate *)*((_QWORD *)v4 + 2);
  if (startDate != v6 && (!v6 || !-[NSDate isEqual:](startDate, "isEqual:")))
    goto LABEL_9;
  endDate = self->_endDate;
  v8 = (NSDate *)*((_QWORD *)v4 + 3);
  if (endDate == v8)
  {
    v9 = 1;
    goto LABEL_10;
  }
  if (v8)
    v9 = -[NSDate isEqual:](endDate, "isEqual:");
  else
LABEL_9:
    v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  uint64_t type;
  uint64_t v4;

  type = self->_type;
  v4 = -[NSDate hash](self->_startDate, "hash") ^ type;
  return v4 ^ -[NSDate hash](self->_endDate, "hash");
}

- (int64_t)compare:(id)a3
{
  id v5;
  int type;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  int64_t v11;
  NSDate *endDate;
  void *v13;
  void *v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStore.m"), 790, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[other isKindOfClass:HDCloudSyncShardPredicate.class]"));

  }
  type = self->_type;
  if (type == 2)
    v7 = 2;
  else
    v7 = 1;
  if (type == 1)
    v8 = 3;
  else
    v8 = v7;
  v9 = objc_msgSend(v5, "type");
  if (v9 == 2)
    v10 = 2;
  else
    v10 = 1;
  if (v9 == 1)
    v10 = 3;
  if (v8 < v10)
  {
    v11 = -1;
    goto LABEL_25;
  }
  if (v8 > v10)
  {
LABEL_18:
    v11 = 1;
    goto LABEL_25;
  }
  endDate = self->_endDate;
  objc_msgSend(v5, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (endDate)
  {
    if (v13)
    {
      objc_msgSend(v5, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "compare:", self->_endDate);

      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (v13)
    v11 = -1;
  else
    v11 = 0;
LABEL_25:

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E6D00718[type];
  }
  -[NSDate description](self->_startDate, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("(Distant Past)");
  -[NSDate description](self->_endDate, "description");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("(Distant Future)");
  if (v9)
    v11 = (const __CFString *)v9;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ - %@>"), v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int)type
{
  return self->_type;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
