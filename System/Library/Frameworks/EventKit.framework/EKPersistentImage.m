@implementation EKPersistentImage

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_2 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_2, &__block_literal_global_10);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_2;
}

void __44__EKPersistentImage_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B728];
  v4[0] = *MEMORY[0x1E0D0B720];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0D0B740];
  v4[2] = *MEMORY[0x1E0D0B730];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_2;
  defaultPropertiesToLoad_defaultPropertiesToLoad_2 = v2;

}

+ (id)relations
{
  if (relations_onceToken_4 != -1)
    dispatch_once(&relations_onceToken_4, &__block_literal_global_6_3);
  return (id)relations_relations_4;
}

void __30__EKPersistentImage_relations__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D0B738];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Source"), 0, v0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)relations_relations_4;
  relations_relations_4 = v2;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 28;
}

- (id)colorData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B720]);
}

- (void)setColorData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B720]);
}

- (id)identifier
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B728]);
}

- (void)setIdentifier:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B728]);
}

- (id)name
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B730]);
}

- (void)setName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B730]);
}

- (int64_t)type
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B740]);
}

- (void)setType:(int64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B740]);
}

- (id)source
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B738]);
}

- (void)setSource:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B738]);
}

@end
