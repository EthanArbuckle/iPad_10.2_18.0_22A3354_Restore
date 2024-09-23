@implementation EKNotification

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_1 != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_1, &__block_literal_global_34);
  return (id)knownRelationshipSingleValueKeys_keys_1;
}

void __50__EKNotification_knownRelationshipSingleValueKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B7B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipSingleValueKeys_keys_1;
  knownRelationshipSingleValueKeys_keys_1 = v0;

}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_2 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_2, &__block_literal_global_3_0);
  return (id)knownRelationshipWeakKeys_keys_2;
}

void __43__EKNotification_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B7D8];
  v3[0] = *MEMORY[0x1E0D0B7B0];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownRelationshipWeakKeys_keys_2;
  knownRelationshipWeakKeys_keys_2 = v1;

}

- (EKObjectID)objectID
{
  void *v2;
  void *v3;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKObjectID *)v3;
}

- (NSString)externalID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (NSURL)hostURL
{
  return (NSURL *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7C8]);
}

- (void)setHostURL:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B7C8]);
}

- (NSString)externalModificationTag
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7C0]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B7C0]);
}

- (NSString)UUID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)calendar
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B7B0]);
}

- (BOOL)save:(id *)a3
{
  id v5;
  BOOL result;

  if (a3)
  {
    *a3 = 0;
    if (-[EKObject isNew](self, "isNew"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:description:", 35, CFSTR("In order to save a new notification, add it to a NotificationCollection, save, and commit the collection instead."));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v5;
      return result;
    }
  }
  else if (-[EKObject isNew](self, "isNew"))
  {
    return 0;
  }
  -[EKObject updatePersistentObject](self, "updatePersistentObject");
  return 1;
}

@end
