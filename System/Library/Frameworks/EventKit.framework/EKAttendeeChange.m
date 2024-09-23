@implementation EKAttendeeChange

+ (int)entityType
{
  return 7;
}

- (EKAttendeeChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKAttendeeChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  EKObjectID *ownerID;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *attendeeEmailAddress;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKAttendeeChange;
  v5 = -[EKObjectChange initWithChangeProperties:](&v15, sel_initWithChangeProperties_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("owner_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObjectChange changedObjectID](v5, "changedObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](EKObjectChangeOwnerIDHelper, "createOwnerIDWithRowID:objectType:databaseID:", v6, 2, objc_msgSend(v7, "databaseID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerID = v5->_ownerID;
    v5->_ownerID = (EKObjectID *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("role"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_attendeeRole = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_attendeeStatus = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("email"));
    v12 = objc_claimAutoreleasedReturnValue();
    attendeeEmailAddress = v5->_attendeeEmailAddress;
    v5->_attendeeEmailAddress = (NSString *)v12;

  }
  return v5;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (BOOL)attendeeRole
{
  return self->_attendeeRole;
}

- (BOOL)attendeeStatus
{
  return self->_attendeeStatus;
}

- (NSString)attendeeEmailAddress
{
  return self->_attendeeEmailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeeEmailAddress, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
}

@end
