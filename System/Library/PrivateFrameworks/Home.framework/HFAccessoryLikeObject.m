@implementation HFAccessoryLikeObject

- (HFAccessoryLikeObjectRootHomeKitObjectProvider)dataSource
{
  return (HFAccessoryLikeObjectRootHomeKitObjectProvider *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HFAccessoryType)hf_accessoryType
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_accessoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFAccessoryType *)v3;
}

- (Class)hf_itemClass
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_itemClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)hf_effectiveShowInHomeDashboard
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_shouldBeOnForContextType:", 3);

  return v3;
}

- (BOOL)hf_effectiveIsFavorite
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_shouldBeOnForContextType:", 2);

  return v3;
}

+ (id)_accessoryLikeObjectForObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a3, "hf_rootAccessoryLikeHomeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  objc_msgSend(a1, "objectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v6, "dataSource"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    v8 = objc_msgSend(objc_alloc((Class)a1), "initWithHomeKitObject:", v4);

    objc_msgSend(a1, "objectMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

    v6 = (void *)v8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_HFAccessoryLikeObjectMapLock);

  return v6;
}

+ (NSMapTable)objectMap
{
  if (qword_1ED379BA8 != -1)
    dispatch_once(&qword_1ED379BA8, &__block_literal_global_196);
  return (NSMapTable *)(id)_MergedGlobals_305;
}

- (HFAccessoryLikeObject)initWithHomeKitObject:(id)a3
{
  id v4;
  HFAccessoryLikeObject *v5;
  HFAccessoryLikeObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFAccessoryLikeObject;
  v5 = -[HFAccessoryLikeObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (NSSet)hf_associatedAccessories
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_associatedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)hf_containedServices
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_containedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)hf_containedProfiles
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_containedProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)hf_isFavorite
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isOnForContextType:", 2);

  return v3;
}

void __34__HFAccessoryLikeObject_objectMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_305;
  _MergedGlobals_305 = v0;

}

+ (void)initialize
{
  _HFAccessoryLikeObjectMapLock = 0;
}

+ (void)_invalidateObjectMap
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating HFAccessoryLikeObject objectMap", v5, 2u);
  }

  os_unfair_lock_lock_with_options();
  objc_msgSend(a1, "objectMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock((os_unfair_lock_t)&_HFAccessoryLikeObjectMapLock);
}

- (HMRoom)room
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "hf_parentRoom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    return (HMRoom *)v7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HFAccessoryLikeObject dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hf_areAllServicesInSameRoom"))
    {
      objc_msgSend(v6, "services");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_parentRoom");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_8;
  }
  v7 = 0;
  return (HMRoom *)v7;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_serviceNameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFServiceNameComponents *)v3;
}

- (NSSet)hf_containedCharacteristics
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_containedCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)hf_isInRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HFAccessoryLikeObject room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFAccessoryLikeObject room](self, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  }
  else
  {
    -[HFAccessoryLikeObject accessories](self, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__HFAccessoryLikeObject_hf_isInRoom___block_invoke;
    v11[3] = &unk_1EA727840;
    v12 = v4;
    v9 = objc_msgSend(v6, "na_any:", v11);
    v7 = v12;
  }

  return v9;
}

uint64_t __37__HFAccessoryLikeObject_hf_isInRoom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (BOOL)hf_canSpanMultipleRooms
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_canSpanMultipleRooms");

  return v3;
}

- (BOOL)hf_isIdentifiable
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isIdentifiable");

  return v3;
}

- (BOOL)hf_canShowInControlCenter
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  char v7;
  char v8;
  BOOL v9;

  -[HFAccessoryLikeObject homeKitObject](self, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HFAccessoryLikeObject homeKitObject](self, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = objc_msgSend(v5, "hf_showsAsAccessoryInControlCentre");
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
      return 1;
    -[HFAccessoryLikeObject homeKitObject](self, "homeKitObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_showsAsServiceInControlCentre");
  }
  v9 = v7;

  return v9;
}

- (BOOL)hf_isMatterOnlyAccessory
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isMatterOnlyAccessory");

  return v3;
}

- (id)hf_moveToRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_moveToRoom:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HFAccessoryLikeObject homeKitObject](self, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p-%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)hf_hasSetFavorite
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_hasSetForContextType:", 2);

  return v3;
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_updateValue:forContextType:", v3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hf_supportsHomeStatus
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_supportsHomeStatus");

  return v3;
}

- (BOOL)hf_isVisibleInHomeStatus
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isVisibleInHomeStatus");

  return v3;
}

- (BOOL)hf_hasSetVisibleInHomeStatus
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_hasSetVisibleInHomeStatus");

  return v3;
}

- (BOOL)hf_isForcedVisibleInHomeStatus
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isForcedVisibleInHomeStatus");

  return v3;
}

- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_updateIsVisibleInHomeStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hf_showInHomeDashboard
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isOnForContextType:", 3);

  return v3;
}

- (BOOL)hf_hasSetShowInHomeDashboard
{
  void *v2;
  char v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_hasSetForContextType:", 3);

  return v3;
}

- (id)hf_updateShowInHomeDashboard:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_updateValue:forContextType:", v3, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)hf_tileSize
{
  void *v2;
  void *v3;

  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_tileSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)hf_setTileSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFAccessoryLikeObject dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_setTileSize:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)accessoryLikeObjectsForAccessoryRepresentable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = v7;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "hf_accessoryLikeObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_setWithSafeObject:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v4, "hf_accessoryLikeObjects"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (qword_1ED379BB0 != -1)
      dispatch_once(&qword_1ED379BB0, &__block_literal_global_17_12);
    v7 = (id)qword_1ED379BB8;
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

void __71__HFAccessoryLikeObject_accessoryLikeObjectsForAccessoryRepresentable___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379BB8;
  qword_1ED379BB8 = v0;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
