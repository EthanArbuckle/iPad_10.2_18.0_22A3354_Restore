@implementation EKAttachmentChange

+ (int)entityType
{
  return 11;
}

- (EKAttachmentChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKAttachmentChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  EKObjectID *ownerID;
  uint64_t v10;
  NSString *uuid;
  uint64_t v12;
  NSString *externalID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKAttachmentChange;
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

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("external_id"));
    v12 = objc_claimAutoreleasedReturnValue();
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v12;

  }
  return v5;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
}

@end
