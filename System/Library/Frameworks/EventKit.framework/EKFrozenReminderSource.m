@implementation EKFrozenReminderSource

- (REMAccount)remAccount
{
  return (REMAccount *)self->super._remObject;
}

- (id)meltedObjectInStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "eventSourceForReminderSource:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)EKFrozenReminderSource;
    -[EKPersistentObject meltedObjectInStore:](&v10, sel_meltedObjectInStore_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (NSString)sourceIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKFrozenReminderSource remAccount](self, "remAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)sourceTypeRaw
{
  void *v2;
  unint64_t v3;

  -[EKFrozenReminderSource remAccount](self, "remAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 > 7)
    return 2;
  else
    return qword_1A244A780[v3];
}

- (id)title
{
  void *v2;
  void *v3;

  -[EKFrozenReminderSource remAccount](self, "remAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)externalID
{
  void *v2;
  void *v3;

  -[EKFrozenReminderSource remAccount](self, "remAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)delegatedAccountOwnerStoreID
{
  return 0;
}

- (id)syncError
{
  return 0;
}

- (id)lastSyncStartDate
{
  return 0;
}

- (id)lastSyncEndDate
{
  return 0;
}

- (id)constraintsName
{
  return 0;
}

- (int)managedConfigurationAccountAccess
{
  return 0;
}

- (int)flags
{
  return 2;
}

- (id)defaultAlarmOffset
{
  return 0;
}

- (BOOL)disabled
{
  return 0;
}

- (id)cachedExternalInfoData
{
  return 0;
}

@end
