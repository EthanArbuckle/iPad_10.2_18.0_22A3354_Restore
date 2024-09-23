@implementation EKPersistentEventAction

+ (id)relations
{
  if (relations_onceToken_14 != -1)
    dispatch_once(&relations_onceToken_14, &__block_literal_global_55);
  return (id)relations_relations_14;
}

void __36__EKPersistentEventAction_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B620]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Event"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B830], 0);
  v3 = (void *)relations_relations_14;
  relations_relations_14 = v2;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)externalID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (id)externalFolderID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B600]);
}

- (void)setExternalFolderID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B600]);
}

- (id)externalScheduleID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B618]);
}

- (void)setExternalScheduleID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B618]);
}

- (id)externalModificationTag
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B608]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B608]);
}

- (id)externalRepresentation
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B610]);
}

- (void)setExternalRepresentation:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B610]);
}

- (int)entityType
{
  return 9;
}

- (id)owner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B830]);
}

- (void)setOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B830]);
}

@end
