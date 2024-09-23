@implementation AFDeviceContextMetadata

- (AFDeviceContextMetadata)initWithType:(id)a3 deliveryDate:(id)a4 expirationDate:(id)a5 redactedKeyPaths:(id)a6 historyConfiguration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AFDeviceContextMetadata *v18;
  AFDeviceContextMetadata *v19;
  uint64_t v20;
  NSDate *deliveryDate;
  uint64_t v22;
  NSDate *expirationDate;
  uint64_t v24;
  NSArray *redactedKeyPaths;
  uint64_t v26;
  AFDeviceContextHistoryConfiguration *historyConfiguration;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)AFDeviceContextMetadata;
  v18 = -[AFDeviceContextMetadata init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_type, a3);
    v20 = objc_msgSend(v14, "copy");
    deliveryDate = v19->_deliveryDate;
    v19->_deliveryDate = (NSDate *)v20;

    v22 = objc_msgSend(v15, "copy");
    expirationDate = v19->_expirationDate;
    v19->_expirationDate = (NSDate *)v22;

    v24 = objc_msgSend(v16, "copy");
    redactedKeyPaths = v19->_redactedKeyPaths;
    v19->_redactedKeyPaths = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    historyConfiguration = v19->_historyConfiguration;
    v19->_historyConfiguration = (AFDeviceContextHistoryConfiguration *)v26;

  }
  return v19;
}

- (AFDeviceContextMetadata)initWithBackingStore:(id)a3
{
  id v4;
  AFDeviceContextHistoryConfiguration *v5;
  void *v6;
  AFDeviceContextHistoryConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AFDeviceContextMetadata *v12;
  uint64_t v13;
  NSMutableDictionary *backingStore;

  v4 = a3;
  v5 = [AFDeviceContextHistoryConfiguration alloc];
  objc_msgSend(v4, "objectForKey:", CFSTR("metadata_historyConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AFDeviceContextHistoryConfiguration initWithDictionaryRepresentation:](v5, "initWithDictionaryRepresentation:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("metadata_type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("metadata_timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("metadata_expirationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("metadata_redactedKeyPaths"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AFDeviceContextMetadata initWithType:deliveryDate:expirationDate:redactedKeyPaths:historyConfiguration:](self, "initWithType:deliveryDate:expirationDate:redactedKeyPaths:historyConfiguration:", v8, v9, v10, v11, v7);

  if (v12)
  {
    v13 = objc_msgSend(v4, "mutableCopy");
    backingStore = v12->_backingStore;
    v12->_backingStore = (NSMutableDictionary *)v13;

  }
  return v12;
}

- (id)backingStore
{
  NSMutableDictionary *backingStore;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSString *type;
  NSDate *deliveryDate;
  NSDate *expirationDate;
  NSMutableDictionary *v9;
  NSArray *redactedKeyPaths;
  NSMutableDictionary *v11;
  AFDeviceContextHistoryConfiguration *historyConfiguration;
  NSMutableDictionary *v13;
  void *v14;

  backingStore = self->_backingStore;
  if (!backingStore)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_backingStore;
    self->_backingStore = v4;

    backingStore = self->_backingStore;
  }
  type = self->_type;
  if (type)
  {
    -[NSMutableDictionary setObject:forKey:](backingStore, "setObject:forKey:", type, CFSTR("metadata_type"));
    backingStore = self->_backingStore;
  }
  deliveryDate = self->_deliveryDate;
  if (deliveryDate)
    -[NSMutableDictionary setObject:forKey:](backingStore, "setObject:forKey:", deliveryDate, CFSTR("metadata_timestamp"));
  else
    -[NSMutableDictionary removeObjectForKey:](backingStore, "removeObjectForKey:", CFSTR("metadata_timestamp"));
  expirationDate = self->_expirationDate;
  v9 = self->_backingStore;
  if (expirationDate)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", expirationDate, CFSTR("metadata_expirationDate"));
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", CFSTR("metadata_expirationDate"));
  redactedKeyPaths = self->_redactedKeyPaths;
  v11 = self->_backingStore;
  if (redactedKeyPaths)
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", redactedKeyPaths, CFSTR("metadata_redactedKeyPaths"));
  else
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", CFSTR("metadata_redactedKeyPaths"));
  historyConfiguration = self->_historyConfiguration;
  v13 = self->_backingStore;
  if (historyConfiguration)
  {
    -[AFDeviceContextHistoryConfiguration buildDictionaryRepresentation](historyConfiguration, "buildDictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, CFSTR("metadata_historyConfiguration"));

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_backingStore, "removeObjectForKey:", CFSTR("metadata_historyConfiguration"));
  }
  return self->_backingStore;
}

- (BOOL)isExpiredByDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[AFDeviceContextMetadata expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return v6 == 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)AFDeviceContextMetadata;
  -[AFDeviceContextMetadata description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDeviceContextMetadata type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDeviceContextMetadata deliveryDate](self, "deliveryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDeviceContextMetadata expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %@, expires %@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AFDeviceContextMetadata backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AFDeviceContextMetadata *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (AFDeviceContextMetadata *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFDeviceContextMetadata backingStore](self, "backingStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFDeviceContextMetadata backingStore](v4, "backingStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (AFDeviceContextMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  AFDeviceContextMetadata *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("serializedBackingStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AFDeviceContextMetadata initWithBackingStore:](self, "initWithBackingStore:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFDeviceContextMetadata backingStore](self, "backingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serializedBackingStore"));

}

- (NSString)type
{
  return self->_type;
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)redactedKeyPaths
{
  return self->_redactedKeyPaths;
}

- (AFDeviceContextHistoryConfiguration)historyConfiguration
{
  return self->_historyConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyConfiguration, 0);
  objc_storeStrong((id *)&self->_redactedKeyPaths, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deliveryDate, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
