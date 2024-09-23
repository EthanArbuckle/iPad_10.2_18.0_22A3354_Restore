@implementation EKEventActionChange

+ (int)entityType
{
  return 9;
}

- (EKEventActionChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKEventActionChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  EKObjectID *ownerID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKEventActionChange;
  v5 = -[EKObjectChange initWithChangeProperties:](&v11, sel_initWithChangeProperties_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObjectChange changedObjectID](v5, "changedObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](EKObjectChangeOwnerIDHelper, "createOwnerIDWithRowID:objectType:databaseID:", v6, 2, objc_msgSend(v7, "databaseID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerID = v5->_ownerID;
    v5->_ownerID = (EKObjectID *)v8;

  }
  return v5;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerID, 0);
}

@end
