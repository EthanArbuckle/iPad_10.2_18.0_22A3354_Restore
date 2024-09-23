@implementation EKSuggestedEventInfo

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_1 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_1, &__block_literal_global_15);
  return (id)knownIdentityKeysForComparison_keys_1;
}

void __54__EKSuggestedEventInfo_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0BAE0];
  v3[0] = *MEMORY[0x1E0D0BAD0];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownIdentityKeysForComparison_keys_1;
  knownIdentityKeysForComparison_keys_1 = v1;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_0 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_0, &__block_literal_global_3);
  return (id)knownSingleValueKeysForComparison_keys_0;
}

void __57__EKSuggestedEventInfo_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0BAD8];
  v3[0] = *MEMORY[0x1E0D0BAB8];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownSingleValueKeysForComparison_keys_0;
  knownSingleValueKeysForComparison_keys_0 = v1;

}

- (EKSuggestedEventInfo)initWithOpaqueKey:(id)a3 uniqueKey:(id)a4
{
  return -[EKSuggestedEventInfo initWithEventStore:opaqueKey:uniqueKey:](self, "initWithEventStore:opaqueKey:uniqueKey:", 0, a3, a4);
}

- (EKSuggestedEventInfo)initWithOpaqueKey:(id)a3 uniqueKey:(id)a4 extractionGroupIdentifier:(id)a5
{
  return -[EKSuggestedEventInfo initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:](self, "initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:", 0, a3, a4, a5);
}

- (EKSuggestedEventInfo)initWithEventStore:(id)a3 opaqueKey:(id)a4 uniqueKey:(id)a5
{
  return -[EKSuggestedEventInfo initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:](self, "initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:", a3, a4, a5, 0);
}

- (EKSuggestedEventInfo)initWithEventStore:(id)a3 opaqueKey:(id)a4 uniqueKey:(id)a5 extractionGroupIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EKSuggestedEventInfo *v14;
  EKSuggestedEventInfo *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EKSuggestedEventInfo;
  v14 = -[EKObject init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[EKObject setEventStore:](v14, "setEventStore:", v10);
    -[EKSuggestedEventInfo setOpaqueKey:](v15, "setOpaqueKey:", v11);
    -[EKSuggestedEventInfo setUniqueKey:](v15, "setUniqueKey:", v12);
    -[EKSuggestedEventInfo setChangedFields:](v15, "setChangedFields:", 0);
    -[EKSuggestedEventInfo setChangesAcknowledged:](v15, "setChangesAcknowledged:", 0);
    -[EKSuggestedEventInfo setExtractionGroupIdentifier:](v15, "setExtractionGroupIdentifier:", v13);
  }

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSuggestedEventInfo opaqueKey](self, "opaqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSuggestedEventInfo uniqueKey](self, "uniqueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSuggestedEventInfo extractionGroupIdentifier](self, "extractionGroupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKSuggestedEventInfo changedFields](self, "changedFields");
  v10 = -[EKSuggestedEventInfo changesAcknowledged](self, "changesAcknowledged");
  -[EKSuggestedEventInfo timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] opaqueKey: %@, uniqueKey: %@, extractionGroupIdentifier: %@, changedFields: %lu, changesAcknowledged: %d, timestamp: %f"), v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKSuggestedEventInfo *v5;
  EKSuggestedEventInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
  {
    v12.receiver = self;
    v12.super_class = (Class)EKSuggestedEventInfo;
    return -[EKObject copyWithZone:](&v12, sel_copyWithZone_, a3);
  }
  else
  {
    v6 = [EKSuggestedEventInfo alloc];
    -[EKObject eventStore](self, "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSuggestedEventInfo opaqueKey](self, "opaqueKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSuggestedEventInfo uniqueKey](self, "uniqueKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSuggestedEventInfo extractionGroupIdentifier](self, "extractionGroupIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[EKSuggestedEventInfo initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:](v6, "initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:", v7, v8, v9, v10);

    -[EKSuggestedEventInfo setChangedFields:](v5, "setChangedFields:", -[EKSuggestedEventInfo changedFields](self, "changedFields"));
    -[EKSuggestedEventInfo setChangesAcknowledged:](v5, "setChangesAcknowledged:", -[EKSuggestedEventInfo changesAcknowledged](self, "changesAcknowledged"));
    -[EKSuggestedEventInfo timestamp](self, "timestamp");
    -[EKSuggestedEventInfo setTimestamp:](v5, "setTimestamp:");
  }
  return v5;
}

- (id)relatedEvent
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B830]);
}

- (NSString)opaqueKey
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAD0]);
}

- (void)setOpaqueKey:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BAD0]);
}

- (NSString)uniqueKey
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAE0]);
}

- (void)setUniqueKey:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BAE0]);
}

- (NSString)extractionGroupIdentifier
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAC8]);
}

- (void)setExtractionGroupIdentifier:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BAC8]);
}

- (unint64_t)changedFields
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setChangedFields:(unint64_t)a3
{
  id v5;

  if (-[EKSuggestedEventInfo changedFields](self, "changedFields") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0BAB8]);

  }
}

- (BOOL)changesAcknowledged
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setChangesAcknowledged:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[EKSuggestedEventInfo changesAcknowledged](self, "changesAcknowledged") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0BAC0]);

  }
}

- (void)setTimestamp:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKSuggestedEventInfo setTimestampAsDate:](self, "setTimestampAsDate:", v4);

}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[EKSuggestedEventInfo timestampAsDate](self, "timestampAsDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (void)setTimestampAsDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0BAD8]);
}

- (id)timestampAsDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0BAD8]);
}

- (id)semanticIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[EKObject uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKSuggestedEventInfo;
    -[EKObject semanticIdentifier](&v8, sel_semanticIdentifier);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
