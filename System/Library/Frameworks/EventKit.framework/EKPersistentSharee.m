@implementation EKPersistentSharee

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken, &__block_literal_global_0);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad;
}

void __45__EKPersistentSharee_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B988];
  v3[0] = *MEMORY[0x1E0D0B828];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad;
  defaultPropertiesToLoad_defaultPropertiesToLoad = v1;

}

+ (id)relations
{
  if (relations_onceToken != -1)
    dispatch_once(&relations_onceToken, &__block_literal_global_6_0);
  return (id)relations_relations;
}

void __31__EKPersistentSharee_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B560]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Calendar"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B830], 0);
  v3 = (void *)relations_relations;
  relations_relations = v2;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentSharee *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(EKPersistentSharee);
  if (v4)
  {
    EKUUIDString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentSharee setUUID:](v4, "setUUID:", v5);

    -[EKPersistentSharee displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentSharee setDisplayName:](v4, "setDisplayName:", v6);

    -[EKPersistentSharee address](self, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentSharee setAddress:](v4, "setAddress:", v7);

    -[EKPersistentSharee externalID](self, "externalID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentSharee setExternalID:](v4, "setExternalID:", v8);

    -[EKPersistentSharee setShareeStatusRaw:](v4, "setShareeStatusRaw:", -[EKPersistentSharee shareeStatusRaw](self, "shareeStatusRaw"));
    -[EKPersistentSharee setShareeAccessLevelRaw:](v4, "setShareeAccessLevelRaw:", -[EKPersistentSharee shareeAccessLevelRaw](self, "shareeAccessLevelRaw"));
  }
  return v4;
}

- (int)entityType
{
  return 15;
}

- (id)UUID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)displayName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B988]);
}

- (void)setDisplayName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B988]);
}

- (id)address
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B980]);
}

- (void)setAddress:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B980]);
}

- (id)firstName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B990]);
}

- (void)setFirstName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B990]);
}

- (id)lastName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B998]);
}

- (void)setLastName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B998]);
}

- (id)externalID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (int)shareeStatusRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B9A8]);
}

- (void)setShareeStatusRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B9A8]);
}

- (int)shareeAccessLevelRaw
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B978]);
}

- (void)setShareeAccessLevelRaw:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B978]);
}

- (void)setOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B830]);
}

- (id)owner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B830]);
}

- (BOOL)shareeMuteRemoval
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B9A0]);
}

- (void)setShareeMuteRemoval:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B9A0]);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentSharee UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentSharee displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentSharee address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentSharee firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentSharee lastName](self, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {UUID = %@; displayName = %@; address = %@; firstName = %@; lastName = %@; status = %lu; accessLevel = %lu;}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    -[EKPersistentSharee shareeStatusRaw](self, "shareeStatusRaw"),
    -[EKPersistentSharee shareeAccessLevelRaw](self, "shareeAccessLevelRaw"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
