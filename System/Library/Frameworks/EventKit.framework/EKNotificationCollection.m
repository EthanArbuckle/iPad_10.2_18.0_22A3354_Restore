@implementation EKNotificationCollection

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken_0 != -1)
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_0, &__block_literal_global_43);
  return (id)knownRelationshipMultiValueKeys_keys_0;
}

void __59__EKNotificationCollection_knownRelationshipMultiValueKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B4B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipMultiValueKeys_keys_0;
  knownRelationshipMultiValueKeys_keys_0 = v0;

}

+ (BOOL)isWeakRelationship
{
  return 1;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

- (EKNotificationCollection)initWithOptions:(id)a3
{
  id v4;
  EKNotificationCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKNotificationCollection;
  v5 = -[EKObject init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKNotificationCollection setSource:](v5, "setSource:", v6);

    objc_msgSend(v4, "externalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKNotificationCollection setExternalID:](v5, "setExternalID:", v7);

    objc_msgSend(v4, "externalIDTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKNotificationCollection setExternalIDTag:](v5, "setExternalIDTag:", v8);

    -[EKNotificationCollection _setNotificationsCollectionFlag](v5, "_setNotificationsCollectionFlag");
    objc_msgSend(v4, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKObject persistentObject](v5, "persistentObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_registerObject:", v11);

  }
  return v5;
}

- (EKSource)source
{
  return (EKSource *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B578]);
}

- (NSSet)notifications
{
  return (NSSet *)-[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B4B8]);
}

- (void)setNotifications:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B4B8]);
}

- (void)addNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Adding nil Notification to notification collection."));
    v4 = 0;
  }
  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", v4, *MEMORY[0x1E0D0B4B8]);

}

- (void)removeNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Removing nil Notification from notification collection."));
    v4 = 0;
  }
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", v4, *MEMORY[0x1E0D0B4B8]);

}

- (BOOL)validate:(id *)a3
{
  _BOOL4 v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKNotificationCollection;
  v5 = -[EKObject validate:](&v8, sel_validate_);
  if (v5)
  {
    if (-[EKNotificationCollection _hasNotificationsCollectionFlag](self, "_hasNotificationsCollectionFlag"))
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 32);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v6;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)save:(id *)a3
{
  if (a3)
    *a3 = 0;
  -[EKObject insertPersistentObjectIfNeeded](self, "insertPersistentObjectIfNeeded");
  -[EKObject updatePersistentObject](self, "updatePersistentObject");
  return 1;
}

- (void)setSource:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B578];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKSource frozenClass](EKSource, "frozenClass"));

}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (void)setExternalIDTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B450]);
}

- (void)_setNotificationsCollectionFlag
{
  -[EKNotificationCollection setFlags:](self, "setFlags:", -[EKNotificationCollection flags](self, "flags") | 0x40);
}

- (BOOL)_hasNotificationsCollectionFlag
{
  return (-[EKNotificationCollection flags](self, "flags") >> 6) & 1;
}

- (unsigned)flags
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B468]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B468]);

}

@end
