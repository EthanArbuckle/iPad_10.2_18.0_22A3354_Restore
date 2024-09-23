@implementation EKPersistentResourceChangeNotification

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__EKPersistentResourceChangeNotification_relations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (relations_onceToken_18 != -1)
    dispatch_once(&relations_onceToken_18, block);
  return (id)relations_relations_18;
}

void __51__EKPersistentResourceChangeNotification_relations__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentResourceChangeNotification;
  objc_msgSendSuper2(&v7, sel_relations);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("notification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:", CFSTR("ResourceChange"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0D0B7E8]);

  v5 = objc_msgSend(v2, "copy");
  v6 = (void *)relations_relations_18;
  relations_relations_18 = v5;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 17;
}

- (id)lastModifiedDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B7E0]);
}

- (void)setLastModifiedDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B7E0]);
}

- (id)resourceChanges
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B7E8]);
}

- (void)setResourceChanges:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B7E8]);
}

@end
