@implementation EKPersistentExceptionDate

+ (id)relations
{
  if (relations_onceToken_10 != -1)
    dispatch_once(&relations_onceToken_10, &__block_literal_global_42);
  return (id)relations_relations_10;
}

void __38__EKPersistentExceptionDate_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B2B0]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B830], 0);
  v3 = (void *)relations_relations_10;
  relations_relations_10 = v2;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentExceptionDate *v4;
  void *v5;

  v4 = objc_alloc_init(EKPersistentExceptionDate);
  -[EKPersistentExceptionDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentObject primitiveSetDateValue:forKey:](v4, "primitiveSetDateValue:forKey:", v5, *MEMORY[0x1E0D0B718]);

  return v4;
}

- (id)date
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B718]);
}

- (void)setDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B718]);
}

- (int)entityType
{
  return 10;
}

- (id)owner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B830]);
}

- (void)setOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B830]);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentExceptionDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {date = %@}"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
