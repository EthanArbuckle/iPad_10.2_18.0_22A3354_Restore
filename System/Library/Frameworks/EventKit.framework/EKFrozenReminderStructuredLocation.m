@implementation EKFrozenReminderStructuredLocation

- (EKFrozenReminderStructuredLocation)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5
{
  id v7;
  id v8;
  EKChangeSet *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  EKFrozenReminderStructuredLocation *v16;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(EKChangeSet);
  -[EKChangeSet setSkipsPersistentObjectCopy:](v9, "setSkipsPersistentObjectCopy:", 1);
  objc_msgSend(v8, "valueForKey:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v10, CFSTR("title"), 0);

  objc_msgSend(v8, "valueForKey:", CFSTR("radius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v11, CFSTR("radius"), 0);

  objc_msgSend(v8, "valueForKey:", CFSTR("address"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v12, CFSTR("address"), 0);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v9, "changeSingleValue:forKey:basedOn:", v14, CFSTR("uniqueIdentifier"), 0);

  -[EKFrozenReminderStructuredLocation setLatitudeAndLongitudeFromAlternateUniverseObject:inChangeSet:](self, "setLatitudeAndLongitudeFromAlternateUniverseObject:inChangeSet:", v8, v9);
  objc_msgSend(v7, "reminderStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](self, "initWithREMObject:inStore:withChanges:", 0, v15, v9);
  return v16;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (NSString)uniqueIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__EKFrozenReminderStructuredLocation_uniqueIdentifier__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("uniqueIdentifier"), v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __54__EKFrozenReminderStructuredLocation_uniqueIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_structuredLocation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "locationUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)remObjectID
{
  return 0;
}

- (id)_structuredLocation
{
  return self->super._remObject;
}

- (id)updatedStructuredLocation
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  -[EKFrozenReminderStructuredLocation title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKFrozenReminderStructuredLocation uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getREMStructuredLocationClass_softClass_0;
  v15 = getREMStructuredLocationClass_softClass_0;
  if (!getREMStructuredLocationClass_softClass_0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getREMStructuredLocationClass_block_invoke_0;
    v11[3] = &unk_1E4784C68;
    v11[4] = &v12;
    __getREMStructuredLocationClass_block_invoke_0((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithTitle:locationUID:", v3, v4);
  -[EKFrozenReminderStructuredLocation latitude](self, "latitude");
  objc_msgSend(v7, "setLatitude:");
  -[EKFrozenReminderStructuredLocation longitude](self, "longitude");
  objc_msgSend(v7, "setLongitude:");
  -[EKFrozenReminderStructuredLocation radius](self, "radius");
  objc_msgSend(v7, "setRadius:");
  -[EKFrozenReminderStructuredLocation address](self, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAddress:", v8);

  -[EKFrozenReminderStructuredLocation mapKitHandle](self, "mapKitHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMapKitHandle:", v9);

  return v7;
}

- (id)title
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__EKFrozenReminderStructuredLocation_title__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("title"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__EKFrozenReminderStructuredLocation_title__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_structuredLocation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (BOOL)canCommitSelf
{
  return 0;
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  return (id)objc_msgSend(a3, "locationUID");
}

- (id)updateParentToCommitSelf:(id)a3
{
  return (id)objc_msgSend(a3, "updatedAlarmWithLocation:", self);
}

- (id)mapKitHandle
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__EKFrozenReminderStructuredLocation_mapKitHandle__block_invoke;
  v3[3] = &unk_1E47858E8;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("mapKitHandle"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__EKFrozenReminderStructuredLocation_mapKitHandle__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_structuredLocation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapKitHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)address
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__EKFrozenReminderStructuredLocation_address__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("address"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__EKFrozenReminderStructuredLocation_address__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_structuredLocation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)latitude
{
  void *v2;
  double v3;
  double v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__EKFrozenReminderStructuredLocation_latitude__block_invoke;
  v6[3] = &unk_1E4784D28;
  v6[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("latitude"), v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

id __46__EKFrozenReminderStructuredLocation_latitude__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_structuredLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latitude");
  objc_msgSend(v1, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)longitude
{
  void *v2;
  double v3;
  double v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__EKFrozenReminderStructuredLocation_longitude__block_invoke;
  v6[3] = &unk_1E4784D28;
  v6[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("longitude"), v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

id __47__EKFrozenReminderStructuredLocation_longitude__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_structuredLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "longitude");
  objc_msgSend(v1, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)referenceFrame
{
  return 0;
}

- (double)radius
{
  void *v2;
  double v3;
  double v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__EKFrozenReminderStructuredLocation_radius__block_invoke;
  v6[3] = &unk_1E4784D28;
  v6[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("radius"), v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

id __44__EKFrozenReminderStructuredLocation_radius__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_structuredLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "radius");
  objc_msgSend(v1, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLatitudeAndLongitudeFromAlternateUniverseObject:(id)a3 inChangeSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "valueForKey:", CFSTR("latitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeSingleValue:forKey:basedOn:", v7, CFSTR("latitude"), 0);

  objc_msgSend(v6, "valueForKey:", CFSTR("latitude"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "changeSingleValue:forKey:basedOn:", v8, CFSTR("latitude"), 0);
}

@end
