@implementation EKExceptionDateChange

+ (int)entityType
{
  return 10;
}

- (EKExceptionDateChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKExceptionDateChange *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  EKObjectID *ownerID;
  uint64_t v11;
  NSDate *date;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKExceptionDateChange;
  v5 = -[EKObjectChange initWithChangeProperties:](&v14, sel_initWithChangeProperties_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("owner_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if ((_DWORD)v7)
    {
      -[EKObjectChange changedObjectID](v5, "changedObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 2, v7, objc_msgSend(v8, "databaseID"));
      v9 = objc_claimAutoreleasedReturnValue();
      ownerID = v5->_ownerID;
      v5->_ownerID = (EKObjectID *)v9;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v11 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v11;

  }
  return v5;
}

- (id)owningEventInEventStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKExceptionDateChange ownerID](self, "ownerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "publicObjectWithObjectID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
}

@end
