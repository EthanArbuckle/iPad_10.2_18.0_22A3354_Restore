@implementation EKPersistentInviteReplyNotification

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_8 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_8, &__block_literal_global_50);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_7;
}

void __62__EKPersistentInviteReplyNotification_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B7F0];
  v3[0] = *MEMORY[0x1E0D0B818];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0D0B7A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_7;
  defaultPropertiesToLoad_defaultPropertiesToLoad_7 = v1;

}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EKPersistentInviteReplyNotification_relations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (relations_onceToken_12 != -1)
    dispatch_once(&relations_onceToken_12, block);
  return (id)relations_relations_12;
}

void __48__EKPersistentInviteReplyNotification_relations__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKPersistentInviteReplyNotification;
  objc_msgSendSuper2(&v6, sel_relations);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)relations_relations_12;
  relations_relations_12 = v2;

  v4 = (void *)relations_relations_12;
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Calendar"), 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0D0B7D8]);

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 16;
}

- (id)inReplyTo
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B7D0]);
}

- (void)setInReplyTo:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B7D0]);
}

- (id)shareeDisplayName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B7F0]);
}

- (void)setShareeDisplayName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B7F0]);
}

- (id)shareeFirstName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B7F8]);
}

- (void)setShareeFirstName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B7F8]);
}

- (id)shareeLastName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B800]);
}

- (void)setShareeLastName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B800]);
}

- (id)shareeURLString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B810]);
}

- (void)setShareeURLString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B810]);
}

- (unint64_t)shareeStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B808]);
}

- (void)setShareeStatus:(unint64_t)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", a3, *MEMORY[0x1E0D0B808]);
}

- (id)creationDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B7B8]);
}

- (void)setCreationDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B7B8]);
}

- (id)summary
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B818]);
}

- (void)setSummary:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B818]);
}

- (BOOL)alerted
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B7A8]);
}

- (id)inviteReplyCalendar
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B7D8]);
}

- (void)setInviteReplyCalendar:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B7D8]);
}

@end
