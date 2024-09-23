@implementation ASDJobManifest

- (ASDJobManifest)init
{
  return -[ASDJobManifest initWithManifestType:](self, "initWithManifestType:", 0);
}

- (ASDJobManifest)initWithManifestType:(int64_t)a3
{
  ASDJobManifest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDJobManifest;
  result = -[ASDJobManifest init](&v5, sel_init);
  if (result)
    result->_manifestType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDJobManifest *v5;
  uint64_t v6;
  NSMutableArray *activities;
  uint64_t v8;
  NSNumber *purchaseID;
  uint64_t v10;
  NSString *storeCorrelationID;

  v5 = -[ASDJobManifest initWithManifestType:](+[ASDJobManifest allocWithZone:](ASDJobManifest, "allocWithZone:"), "initWithManifestType:", self->_manifestType);
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithArray:copyItems:", self->_activities, 1);
  activities = v5->_activities;
  v5->_activities = (NSMutableArray *)v6;

  v8 = -[NSNumber copyWithZone:](self->_purchaseID, "copyWithZone:", a3);
  purchaseID = v5->_purchaseID;
  v5->_purchaseID = (NSNumber *)v8;

  v10 = -[NSString copyWithZone:](self->_storeCorrelationID, "copyWithZone:", a3);
  storeCorrelationID = v5->_storeCorrelationID;
  v5->_storeCorrelationID = (NSString *)v10;

  return v5;
}

- (id)addActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 0;
    v8[1] = 0;
    objc_msgSend(v5, "getUUIDBytes:", v8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[ASDJobManifest _addActivity:withIdentifier:persistentID:]((uint64_t)self, v4, v6, v6);

  return v6;
}

- (void)_addActivity:(void *)a3 withIdentifier:(void *)a4 persistentID:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((objc_msgSend(v14, "isValid") & 1) != 0)
      -[ASDJobActivity setPersistentID:]((uint64_t)v14, v8);
    else
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Activity %@ is invalid: %@"), v14, CFSTR("Missing bundle ID"));
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v9, "addObject:", v10);
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v10 = (void *)objc_msgSend(v14, "copy");
      v12 = objc_msgSend(v11, "initWithObjects:", v10, 0);
      v13 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v12;

    }
  }

}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_activities, "count");
}

- (void)enumerateActivitiesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *activities;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  activities = self->_activities;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ASDJobManifest_enumerateActivitiesUsingBlock___block_invoke;
  v7[3] = &unk_1E37BF340;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](activities, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __48__ASDJobManifest_enumerateActivitiesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addActivity:(id)a3 withIdentifier:(id)a4
{
  -[ASDJobManifest _addActivity:withIdentifier:persistentID:]((uint64_t)self, a3, a4, a4);
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ASDJobManifest;
  -[ASDJobManifest description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASDJobManifest count](self, "count");
  -[ASDJobManifest storeCorrelationID](self, "storeCorrelationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: (%lu, %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobManifest)initWithCoder:(id)a3
{
  id v4;
  ASDJobManifest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *activities;
  uint64_t v11;
  NSNumber *purchaseID;
  uint64_t v13;
  NSString *storeCorrelationID;

  v4 = a3;
  v5 = -[ASDJobManifest initWithManifestType:](self, "initWithManifestType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("manifestType")));
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("activities"));
    v9 = objc_claimAutoreleasedReturnValue();
    activities = v5->_activities;
    v5->_activities = (NSMutableArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseID"));
    v11 = objc_claimAutoreleasedReturnValue();
    purchaseID = v5->_purchaseID;
    v5->_purchaseID = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeCorrelationID"));
    v13 = objc_claimAutoreleasedReturnValue();
    storeCorrelationID = v5->_storeCorrelationID;
    v5->_storeCorrelationID = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *activities;
  id v5;

  activities = self->_activities;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activities, CFSTR("activities"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_manifestType, CFSTR("manifestType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseID, CFSTR("purchaseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeCorrelationID, CFSTR("storeCorrelationID"));

}

- (int64_t)manifestType
{
  return self->_manifestType;
}

- (NSNumber)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCorrelationID, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end
