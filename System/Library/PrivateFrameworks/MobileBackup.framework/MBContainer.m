@implementation MBContainer

+ (id)uninstalledContainerWithDomainName:(id)a3 volumeMountPoint:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0C9AE78];
  v5 = a4;
  v6 = a3;
  +[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("ContainerContentClass");
  v14[0] = v7;
  v8 = +[MBDomain containerTypeWithName:](MBDomain, "containerTypeWithName:", v6);

  if ((v8 - 1) > 4)
    v9 = 0;
  else
    v9 = off_1E995D260[v8 - 1];
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[MBContainer containerWithPropertyList:volumeMountPoint:](MBContainer, "containerWithPropertyList:volumeMountPoint:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)containerWithPropertyList:(id)a3 volumeMountPoint:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ContainerContentClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MBContainerTypeForString(v7);

  v9 = (void *)objc_msgSend(objc_alloc(*off_1E995D288[v8]), "initWithPropertyList:volumeMountPoint:", v5, v6);
  return v9;
}

- (MBContainer)initWithPropertyList:(id)a3 volumeMountPoint:(id)a4
{
  id v6;
  id v7;
  MBContainer *v8;
  uint64_t v9;
  NSMutableDictionary *plist;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MBContainer;
  v8 = -[MBContainer init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    plist = v8->_plist;
    v8->_plist = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v8->_volumeMountPoint, a4);
  }

  return v8;
}

- (id)copyWithVolumeMountPoint:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[MBContainer copy](self, "copy");
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (BOOL)isSafeHarbor
{
  void *v2;
  BOOL v3;

  -[MBContainer datePlacedInSafeHarbor](self, "datePlacedInSafeHarbor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isSystemContainer
{
  return -[MBContainer containerType](self, "containerType") == 4;
}

- (BOOL)isSystemSharedContainer
{
  return -[MBContainer containerType](self, "containerType") == 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_plist, "mutableCopyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  objc_storeStrong((id *)(v5 + 16), self->_volumeMountPoint);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[MBContainer identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MBContainer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
}

- (int)containerType
{
  void *v2;
  int v3;

  -[MBContainer containerTypeString](self, "containerTypeString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MBContainerTypeForString(v2);

  return v3;
}

- (NSString)containerTypeString
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("ContainerContentClass"));
}

- (NSString)containerDir
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("Container"));
}

- (void)setContainerDir:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_plist, "setObject:forKeyedSubscript:", a3, CFSTR("Container"));
}

- (NSString)safeHarborDir
{
  void *v4;
  void *v5;
  void *v7;

  if (!-[MBContainer isSafeHarbor](self, "isSafeHarbor"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBApp.m"), 307, CFSTR("Not a safe harbor"));

  }
  -[MBContainer containerDir](self, "containerDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSDate)datePlacedInSafeHarbor
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("SafeHarborDockingDate"));
}

- (void)setDatePlacedInSafeHarbor:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_plist, "setObject:forKeyedSubscript:", a3, CFSTR("SafeHarborDockingDate"));
}

- (id)propertyListForSafeHarborInfo
{
  return self->_plist;
}

- (id)propertyListForBackupProperties
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_plist;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", v9, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (MBAppInfoKeysToBackup_onceToken != -1)
          dispatch_once(&MBAppInfoKeysToBackup_onceToken, &__block_literal_global_3);
        if (objc_msgSend((id)MBAppInfoKeysToBackup_sSet, "containsObject:", v9))
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)domain
{
  -[MBContainer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)volumeMountPoint
{
  return self->_volumeMountPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeMountPoint, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

@end
