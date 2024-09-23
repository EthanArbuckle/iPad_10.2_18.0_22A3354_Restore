@implementation EKPersistentColor

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_10 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_10, &__block_literal_global_61);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_9;
}

void __44__EKPersistentColor_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B5C0];
  v4[0] = *MEMORY[0x1E0D0B5B8];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0D0B828];
  v4[2] = *MEMORY[0x1E0D0B820];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_9;
  defaultPropertiesToLoad_defaultPropertiesToLoad_9 = v2;

}

+ (id)relations
{
  if (relations_onceToken_16 != -1)
    dispatch_once(&relations_onceToken_16, &__block_literal_global_6_6);
  return (id)relations_relations_16;
}

void __30__EKPersistentColor_relations__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D0B5C8];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Source"), 0, v0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)relations_relations_16;
  relations_relations_16 = v2;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentColor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(EKPersistentColor);
  -[EKPersistentColor data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentColor setData:](v4, "setData:", v5);

  -[EKPersistentColor UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentColor setUUID:](v4, "setUUID:", v6);

  -[EKPersistentColor providerIdentifier](self, "providerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentColor setProviderIdentifier:](v4, "setProviderIdentifier:", v7);

  -[EKPersistentColor externalID](self, "externalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentColor setExternalID:](v4, "setExternalID:", v8);

  -[EKPersistentColor source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentColor setSource:](v4, "setSource:", v9);

  return v4;
}

- (int)entityType
{
  return 29;
}

- (id)data
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B5B8]);
}

- (void)setData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B5B8]);
}

- (id)UUID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)providerIdentifier
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B5C0]);
}

- (void)setProviderIdentifier:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B5C0]);
}

- (id)externalID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
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
