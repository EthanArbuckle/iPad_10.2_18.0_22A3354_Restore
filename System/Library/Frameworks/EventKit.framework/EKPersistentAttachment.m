@implementation EKPersistentAttachment

+ (id)relations
{
  if (relations_onceToken_5 != -1)
    dispatch_once(&relations_onceToken_5, &__block_literal_global_21);
  return (id)relations_relations_5;
}

void __35__EKPersistentAttachment_relations__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D0B270]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E0D0B830], 0);
  v3 = (void *)relations_relations_5;
  relations_relations_5 = v2;

}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E0D0B820];
}

+ (id)propertiesToUnloadOnCommit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EKPersistentAttachment_propertiesToUnloadOnCommit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToUnloadOnCommit_onceToken != -1)
    dispatch_once(&propertiesToUnloadOnCommit_onceToken, block);
  return (id)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;
}

void __52__EKPersistentAttachment_propertiesToUnloadOnCommit__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentAttachment;
  objc_msgSendSuper2(&v7, sel_propertiesToUnloadOnCommit);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit = v1;

  v3 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;
  v8[0] = *MEMORY[0x1E0D0B208];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit = v5;

}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentAttachment *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc_init(EKPersistentAttachment);
  -[EKPersistentAttachment UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setUUID:](v4, "setUUID:", v5);

  -[EKPersistentAttachment URLString](self, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setURLString:](v4, "setURLString:", v6);

  -[EKPersistentAttachment fileNameRaw](self, "fileNameRaw");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setFileNameRaw:](v4, "setFileNameRaw:", v7);

  -[EKPersistentAttachment fileFormat](self, "fileFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setFileFormat:](v4, "setFileFormat:", v8);

  -[EKPersistentAttachment setFlags:](v4, "setFlags:", -[EKPersistentAttachment flags](self, "flags"));
  -[EKPersistentAttachment localRelativePath](self, "localRelativePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setLocalRelativePath:](v4, "setLocalRelativePath:", v9);

  -[EKPersistentAttachment fileSize](self, "fileSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setFileSize:](v4, "setFileSize:", v10);

  -[EKPersistentAttachment XPropertiesData](self, "XPropertiesData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setXPropertiesData:](v4, "setXPropertiesData:", v11);

  -[EKPersistentAttachment externalID](self, "externalID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setExternalID:](v4, "setExternalID:", v12);

  -[EKPersistentAttachment securityScopedURLWrapperForPendingFileCopy](self, "securityScopedURLWrapperForPendingFileCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setSecurityScopedURLWrapperForPendingFileCopy:](v4, "setSecurityScopedURLWrapperForPendingFileCopy:", v13);

  -[EKPersistentAttachment setShouldSetQuarantineAttributesOnCopiedFile:](v4, "setShouldSetQuarantineAttributesOnCopiedFile:", -[EKPersistentAttachment shouldSetQuarantineAttributesOnCopiedFile](self, "shouldSetQuarantineAttributesOnCopiedFile"));
  -[EKPersistentAttachment securityScopedLocalURLWrapper](self, "securityScopedLocalURLWrapper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment setSecurityScopedLocalURLWrapper:](v4, "setSecurityScopedLocalURLWrapper:", v14);

  return v4;
}

- (int)entityType
{
  return 11;
}

- (id)URLString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B1B8]);
}

- (void)setURLString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B1B8]);
}

- (id)externalModificationTag
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B1C8]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B1C8]);
}

- (id)fileNameRaw
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B1D8]);
}

- (void)setFileNameRaw:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B1D8]);
}

- (id)fileFormat
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B1D0]);
}

- (void)setFileFormat:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B1D0]);
}

- (int)flags
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B1E8]);
}

- (void)setFlags:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B1E8]);
}

- (id)localRelativePath
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B1F0]);
}

- (void)setLocalRelativePath:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B1F0]);
}

- (id)securityScopedLocalURLWrapper
{
  return -[EKPersistentObject primitiveSecurityScopedURLWrapperValueForKey:](self, "primitiveSecurityScopedURLWrapperValueForKey:", *MEMORY[0x1E0D0B200]);
}

- (void)setSecurityScopedLocalURLWrapper:(id)a3
{
  -[EKPersistentObject primitiveSetSecurityScopedURLWrapperValue:forKey:](self, "primitiveSetSecurityScopedURLWrapperValue:forKey:", a3, *MEMORY[0x1E0D0B200]);
}

- (id)securityScopedLocalURLForArchivedDataWrapper
{
  return -[EKPersistentObject primitiveSecurityScopedURLWrapperValueForKey:](self, "primitiveSecurityScopedURLWrapperValueForKey:", *MEMORY[0x1E0D0B1F8]);
}

- (void)setSecurityScopedLocalURLForArchivedDataWrapper:(id)a3
{
  -[EKPersistentObject primitiveSetSecurityScopedURLWrapperValue:forKey:](self, "primitiveSetSecurityScopedURLWrapperValue:forKey:", a3, *MEMORY[0x1E0D0B1F8]);
}

- (id)fileSize
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B1E0]);
}

- (void)setFileSize:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B1E0]);
}

- (id)UUID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)XPropertiesData
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B1C0]);
}

- (void)setXPropertiesData:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B1C0]);
}

- (id)externalID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentAttachment URLString](self, "URLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment fileNameRaw](self, "fileNameRaw");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment fileFormat](self, "fileFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment fileSize](self, "fileSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongValue");
  -[EKPersistentAttachment localRelativePath](self, "localRelativePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentAttachment UUID](self, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {URLString = %@; fileName = %@; fileFormat = %@; fileSize = %lu; localRelativePath = %@; UUID = %@;}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)securityScopedURLWrapperForPendingFileCopy
{
  return -[EKPersistentObject primitiveSecurityScopedURLWrapperValueForKey:](self, "primitiveSecurityScopedURLWrapperValueForKey:", *MEMORY[0x1E0D0B208]);
}

- (void)setSecurityScopedURLWrapperForPendingFileCopy:(id)a3
{
  -[EKPersistentObject primitiveSetSecurityScopedURLWrapperValue:forKey:](self, "primitiveSetSecurityScopedURLWrapperValue:forKey:", a3, *MEMORY[0x1E0D0B208]);
}

- (BOOL)shouldSetQuarantineAttributesOnCopiedFile
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B210]);
}

- (void)setShouldSetQuarantineAttributesOnCopiedFile:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B210]);
}

@end
