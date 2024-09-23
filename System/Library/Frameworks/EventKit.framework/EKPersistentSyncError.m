@implementation EKPersistentSyncError

+ (id)relations
{
  if (relations_onceToken_1 != -1)
    dispatch_once(&relations_onceToken_1, &__block_literal_global_3);
  return (id)relations_relations_1;
}

void __34__EKPersistentSyncError_relations__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0D0B5D0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B3F8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  v8[1] = *MEMORY[0x1E0D0B5D8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B5A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Calendar"), 0, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = *MEMORY[0x1E0D0B5F0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0BAA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Store"), 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)relations_relations_1;
  relations_relations_1 = v6;

}

- (int)entityType
{
  return 24;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (void)setErrorType:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B5E8]);
}

- (int)errorType
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B5E8]);
}

- (void)setErrorCode:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B5E0]);
}

- (int)errorCode
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B5E0]);
}

- (void)setUserInfoData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B5F8]);
}

- (id)userInfoData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B5F8]);
}

@end
