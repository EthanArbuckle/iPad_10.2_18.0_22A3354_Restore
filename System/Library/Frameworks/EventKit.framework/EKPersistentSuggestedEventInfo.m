@implementation EKPersistentSuggestedEventInfo

+ (id)suggestedEventInfoWithOpaqueKey:(id)a3 uniqueKey:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setOpaqueKey:", v6);

  objc_msgSend(v7, "setUniqueKey:", v5);
  return v7;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[EKPersistentSuggestedEventInfo opaqueKey](self, "opaqueKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaqueKey:", v5);

  -[EKPersistentSuggestedEventInfo uniqueKey](self, "uniqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueKey:", v6);

  -[EKPersistentSuggestedEventInfo extractionGroupIdentifier](self, "extractionGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtractionGroupIdentifier:", v7);

  objc_msgSend(v4, "setChangesAcknowledged:", -[EKPersistentSuggestedEventInfo changesAcknowledged](self, "changesAcknowledged"));
  objc_msgSend(v4, "setChangedFields:", -[EKPersistentSuggestedEventInfo changedFields](self, "changedFields"));
  -[EKPersistentSuggestedEventInfo timestampAsDate](self, "timestampAsDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimestampAsDate:", v8);

  return v4;
}

+ (id)relations
{
  if (relations_onceToken_15 != -1)
    dispatch_once(&relations_onceToken_15, &__block_literal_global_60);
  return (id)relations_relations_15;
}

void __43__EKPersistentSuggestedEventInfo_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B700]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B830], 0);
  v3 = (void *)relations_relations_15;
  relations_relations_15 = v2;

}

- (int)entityType
{
  return 20;
}

- (NSString)opaqueKey
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BAD0]);
}

- (void)setOpaqueKey:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BAD0]);
}

- (NSString)uniqueKey
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BAE0]);
}

- (void)setUniqueKey:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BAE0]);
}

- (NSString)extractionGroupIdentifier
{
  return (NSString *)-[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0BAC8]);
}

- (void)setExtractionGroupIdentifier:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0BAC8]);
}

- (unint64_t)changedFields
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BAB8]);
}

- (void)setChangedFields:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0BAB8]);
}

- (BOOL)changesAcknowledged
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0BAC0]) != 0;
}

- (void)setChangesAcknowledged:(BOOL)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0BAC0]);
}

- (id)timestampAsDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0BAD8]);
}

- (void)setTimestampAsDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0BAD8]);
}

- (void)setOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B830]);
}

- (EKPersistentEvent)owner
{
  return (EKPersistentEvent *)-[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B830]);
}

- (id)semanticIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[EKPersistentObject uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKPersistentSuggestedEventInfo;
    -[EKPersistentObject semanticIdentifier](&v8, sel_semanticIdentifier);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
