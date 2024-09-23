@implementation HMDBackingStoreModelObject

- (BOOL)propertyIsReadOnly:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;

  v4 = a3;
  if (-[HMDBackingStoreModelObject isReadOnly](self, "isReadOnly")
    || !-[HMDBackingStoreModelObject propertyIsAvailable:](self, "propertyIsAvailable:", v4))
  {
    v8 = 1;
  }
  else
  {
    -[NSMutableDictionary hmf_dictionaryForKey:](self->_reserved, "hmf_dictionaryForKey:", CFSTR("_R"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDBackingStoreModelObject bsoDataVersionOverride](self, "bsoDataVersionOverride");
    v8 = 0;
    if (!v7 && v6)
    {
      +[HMDBackingStoreSingleton dataVersion](HMDBackingStoreSingleton, "dataVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isLessThanOrEqualTo:", v6);

    }
  }

  return v8;
}

- (BOOL)bsoDataVersionOverride
{
  return self->_bsoDataVersionOverride;
}

- (BOOL)isReadOnly
{
  char v2;
  void *v3;
  void *v4;

  if (-[HMDBackingStoreModelObject isGenericRepresentation](self, "isGenericRepresentation"))
    return 1;
  objc_msgSend((id)objc_opt_class(), "readonlyBefore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HMDBackingStoreSingleton dataVersion](HMDBackingStoreSingleton, "dataVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "isGreaterThan:", v4);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)isGenericRepresentation
{
  uint64_t v2;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_class(), "genericRepresentation");
  if ((objc_msgSend((id)objc_opt_class(), "isEqual:", v2) & 1) != 0)
    return 1;
  v4 = (void *)objc_opt_class();
  return objc_msgSend(v4, "isEqual:", objc_opt_class());
}

- (BOOL)propertyIsAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "genericRepresentation");
  -[NSMutableDictionary hmf_dictionaryForKey:](self->_reserved, "hmf_dictionaryForKey:", CFSTR("_U"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "isEqual:", v5) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[HMDBackingStoreSingleton dataVersion](HMDBackingStoreSingleton, "dataVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isGreaterThan:", v8);

    }
    else
    {
      v7 = 1;
    }

  }
  return v7;
}

+ (Class)genericRepresentation
{
  return (Class)objc_opt_class();
}

+ (id)readonlyBefore
{
  return 0;
}

- (BOOL)diff:(id)a3 differingFields:(id *)a4
{
  id *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "setProperties");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_reserved, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6[1], "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((isEqualDeepCompare(v13, v14) & 1) == 0)
          {
            if (!a4)
            {

              goto LABEL_22;
            }
            if (!v9)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v9 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v9, "addObject:", v12);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }

    if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      *a4 = v9;
      LOBYTE(a4) = objc_msgSend(v9, "count") != 0;
    }
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
LABEL_22:
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (id)setProperties
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableDictionary count](self->_reserved, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_reserved;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "characterAtIndex:", 0, (_QWORD)v11) != 95)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (HMDBackingStoreModelObject)initWithVersion:(id)a3 changeType:(unint64_t)a4 uuid:(id)a5 parentUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMDBackingStoreModelObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *bsoType;
  objc_class *v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  NSUUID *uuid;
  uint64_t v23;
  NSUUID *parentUUID;
  void *v25;
  objc_super v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDBackingStoreModelObject;
  v13 = -[HMDBackingStoreModelObject init](&v27, sel_init);
  if (v13)
  {
    +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "classToNameTransform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", objc_opt_class());
    v16 = objc_claimAutoreleasedReturnValue();
    bsoType = v13->_bsoType;
    v13->_bsoType = (NSString *)v16;

    if (!v13->_bsoType)
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v13->_bsoType;
      v13->_bsoType = (NSString *)v19;

    }
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v11);
    v21 = objc_claimAutoreleasedReturnValue();
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v21;

    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v12);
    v23 = objc_claimAutoreleasedReturnValue();
    parentUUID = v13->_parentUUID;
    v13->_parentUUID = (NSUUID *)v23;

    v13->_objectChangeType = a4;
    v25 = v10;
    if (!v10)
    {
      +[HMDBackingStoreSingleton dataVersion](HMDBackingStoreSingleton, "dataVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v13->_bsoDataVersion, v25);
    if (!v10)

    v13->_bsoDataVersionOverride = 1;
  }

  return v13;
}

- (HMDBackingStoreModelObject)initWithObjectChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  return -[HMDBackingStoreModelObject initWithVersion:changeType:uuid:parentUUID:](self, "initWithVersion:changeType:uuid:parentUUID:", 0, a3, a4, a5);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsoRecord, 0);
  objc_storeStrong((id *)&self->_bsoDataVersion, 0);
  objc_storeStrong((id *)&self->_bsoType, 0);
  objc_destroyWeak((id *)&self->_bsoDelegate);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
}

- (void)setPropertyIfNotNil:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDBackingStoreModelObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  objc_class *v18;
  objc_class *v19;
  NSMutableDictionary *reserved;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  objc_class *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreModelObject typeNameForDebug](v11, "typeNameForDebug");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v13;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v16;
      v17 = "%{public}@Unable to set property %@ of %@ from type %@ (no such property exists)";
      goto LABEL_10;
    }
LABEL_12:

    objc_autoreleasePoolPop(v10);
    goto LABEL_13;
  }
  if (!-[HMDBackingStoreModelObject propertyIsAvailable:](self, "propertyIsAvailable:", v7))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreModelObject typeNameForDebug](v11, "typeNameForDebug");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v13;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v16;
      v17 = "%{public}@Unable to set property %@ of %@ from type %@ (property is unavailable)";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if (-[HMDBackingStoreModelObject propertyIsReadOnly:](self, "propertyIsReadOnly:", v7))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreModelObject typeNameForDebug](v11, "typeNameForDebug");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v13;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v16;
      v17 = "%{public}@Unable to set property %@ of %@ from type %@ (property is read-only)";
LABEL_10:
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v25, 0x2Au);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_reserved, "removeObjectForKey:", v7);
    goto LABEL_13;
  }
  objc_msgSend(v9, "classObj");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreModelObject typeNameForDebug](v11, "typeNameForDebug");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)objc_msgSend(v9, "classObj"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138544386;
    v26 = v13;
    v27 = 2112;
    v28 = v7;
    v29 = 2112;
    v30 = v14;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to set property %@ of %@ from type %@ (does not match the expected type %@)", (uint8_t *)&v25, 0x34u);

    goto LABEL_11;
  }
  reserved = self->_reserved;
  if (!reserved)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v22 = self->_reserved;
    self->_reserved = v21;

    reserved = self->_reserved;
  }
  -[NSMutableDictionary setObject:forKey:](reserved, "setObject:forKey:", v6, v7);
LABEL_13:

}

- (id)typeNameForDebug
{
  void *v2;
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMDBackingStoreModelObject bsoType](self, "bsoType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", v4) & 1) != 0)
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v4, v2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (HMDBackingStoreModelObject)initWithUUID:(id)a3
{
  return -[HMDBackingStoreModelObject initWithVersion:changeType:uuid:parentUUID:](self, "initWithVersion:changeType:uuid:parentUUID:", 0, 0, a3, 0);
}

- (HMDBackingStoreModelObject)initWithUUID:(id)a3 parentUUID:(id)a4
{
  return -[HMDBackingStoreModelObject initWithVersion:changeType:uuid:parentUUID:](self, "initWithVersion:changeType:uuid:parentUUID:", 0, 0, a3, a4);
}

- (id)backedObjectWithParent:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (objc_class *)objc_msgSend((id)objc_opt_class(), "backedObjectClass");
  if (v7)
  {
    v8 = v7;
    v9 = [v7 alloc];
    v10 = v9;
    if (v9
      && objc_msgSend(v9, "conformsToProtocol:", &unk_1EFA62A28)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = (void *)objc_msgSend([v8 alloc], "initWithModelObject:parent:error:", self, v6, a4);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setBsoIgnoredBefore:(id)a3
{
  id v4;
  NSMutableDictionary *reserved;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v4 = a3;
  reserved = self->_reserved;
  v8 = v4;
  if (!reserved)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_reserved;
    self->_reserved = v6;

    v4 = v8;
    reserved = self->_reserved;
  }
  -[NSMutableDictionary setObject:forKey:](reserved, "setObject:forKey:", v4, CFSTR("_i"));

}

- (HMFVersion)bsoIgnoredBefore
{
  return (HMFVersion *)-[NSMutableDictionary objectForKey:](self->_reserved, "objectForKey:", CFSTR("_i"));
}

- (BOOL)bsoIgnoreModel
{
  void *v2;
  void *v3;
  char v4;

  -[HMDBackingStoreModelObject bsoIgnoredBefore](self, "bsoIgnoredBefore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDBackingStoreSingleton dataVersion](HMDBackingStoreSingleton, "dataVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "isGreaterThan:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSSet)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E60];
  if (v3)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

- (BOOL)_validateType:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[3];
  _QWORD v57[3];
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[3];
  _QWORD v61[3];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
    *a4 = 0;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (!v8)
    goto LABEL_11;
  v9 = v8;
  v10 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v53 != v10)
        objc_enumerationMutation(v7);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v14 = v6;
          v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          if (v21)
          {
            v22 = v21;
            v23 = 0;
            v24 = *(_QWORD *)v49;
LABEL_16:
            v25 = 0;
            v26 = v23 + v22;
            while (1)
            {
              if (*(_QWORD *)v49 != v24)
                objc_enumerationMutation(v14);
              if (-[HMDBackingStoreModelObject _validateType:error:](self, "_validateType:error:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v25), a4))
              {
                break;
              }
              if (v22 == ++v25)
              {
                v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
                v23 = v26;
                if (v22)
                  goto LABEL_16;
                goto LABEL_33;
              }
            }
            if (!a4)
              goto LABEL_39;
            objc_msgSend(*a4, "userInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", CFSTR("pathStack"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%lu]"), v23 + v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v18;
            v34 = v19;
            goto LABEL_36;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v32 = 0;
            goto LABEL_41;
          }
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v14 = v6;
          v27 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v45;
LABEL_26:
            v30 = 0;
            while (1)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v14);
              v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v30);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                  goto LABEL_39;
                v43 = (void *)MEMORY[0x1E0CB35C8];
                v36 = *MEMORY[0x1E0D27FC8];
                v56[0] = CFSTR("message");
                objc_msgSend(MEMORY[0x1E0CB37A0], "string");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v57[0] = v15;
                v56[1] = CFSTR("pathStack");
                v37 = (void *)MEMORY[0x1E0C99DE8];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v31);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "arrayWithObject:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v57[1] = v19;
                v56[2] = CFSTR("errorText");
                v38 = (void *)MEMORY[0x1E0CB3940];
                v39 = (objc_class *)objc_opt_class();
                NSStringFromClass(v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "stringWithFormat:", CFSTR("(key must be of string type (is %@))"), v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v57[2] = v41;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "errorWithDomain:code:userInfo:", v36, 3, v42);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_37;
              }
              objc_msgSend(v14, "objectForKey:", v31);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[HMDBackingStoreModelObject _validateType:error:](self, "_validateType:error:", v15, a4))
                break;

              if (v28 == ++v30)
              {
                v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
                if (v28)
                  goto LABEL_26;
                goto LABEL_33;
              }
            }
            if (!a4)
              goto LABEL_38;
            objc_msgSend(*a4, "userInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("pathStack"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v33;
            v34 = v31;
LABEL_36:
            objc_msgSend(v33, "addObject:", v34);
LABEL_37:

LABEL_38:
LABEL_39:
            v32 = 1;
LABEL_40:

            goto LABEL_41;
          }
        }
LABEL_33:
        v32 = 0;
        goto LABEL_40;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v9)
      continue;
    break;
  }
LABEL_11:

  if (a4)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D27FC8];
    v60[0] = CFSTR("message");
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v61[0] = v14;
    v60[1] = CFSTR("pathStack");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v15;
    v60[2] = CFSTR("errorText");
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("(%@ not a valid type within an aggregate type)"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 3, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  v32 = 1;
LABEL_41:

  return v32;
}

- (id)validateType:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  const __CFString *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v32 = 0;
  LODWORD(self) = -[HMDBackingStoreModelObject _validateType:error:](self, "_validateType:error:", a3, &v32);
  v7 = v32;
  v8 = v7;
  v9 = 0;
  if ((_DWORD)self)
  {
    objc_msgSend(v7, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("pathStack"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v6);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v12, "reverseObjectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "appendFormat:", CFSTR("/%@"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v16);
    }

    objc_msgSend(v8, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("errorText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" %@"), v20);

    objc_msgSend(v8, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("message"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setString:", v13);

    v23 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v8, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v8, "code");
    v33 = CFSTR("message");
    v34 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)prepareFor:(unint64_t)a3
{
  NSMutableDictionary *reserved;

  reserved = self->_reserved;
  if (reserved)
    return (id)-[NSMutableDictionary mutableCopy](reserved, "mutableCopy", a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)encodeAsNSDictionaryFor:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  objc_class *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id *v71;
  HMDBackingStoreModelObject *v72;
  void *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, &unk_1E8B36B28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  -[HMDBackingStoreModelObject prepareFor:](self, "prepareFor:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v71 = a4;
  -[HMDBackingStoreModelObject bsoDataVersion](self, "bsoDataVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "versionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("_V"));

  -[HMDBackingStoreModelObject bsoType](self, "bsoType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("_t"));

  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v13, CFSTR("_u"));

  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("_P"));

  }
  objc_msgSend((id)objc_opt_class(), "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary hmf_dictionaryForKey:](self->_reserved, "hmf_dictionaryForKey:", CFSTR("_R"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "mutableCopy");

  v70 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v72 = self;
  -[NSMutableDictionary hmf_dictionaryForKey:](self->_reserved, "hmf_dictionaryForKey:", CFSTR("_U"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "mutableCopy");

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v21;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  v24 = (void *)v70;
  v25 = v71;
  if (!v23)
    goto LABEL_46;
  v26 = v23;
  v74 = *(_QWORD *)v80;
  v69 = v8;
  do
  {
    v27 = 0;
    do
    {
      if (*(_QWORD *)v80 != v74)
        objc_enumerationMutation(v22);
      v28 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v27);
      v29 = v22;
      objc_msgSend(v22, "valueForKey:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "readOnly");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v30, "readOnly");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v32, v28);

      }
      objc_msgSend(v30, "unavailable");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v30, "unavailable");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKey:", v34, v28);

      }
      objc_msgSend(v8, "valueForKey:", v28);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
        goto LABEL_23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v76;
            while (2)
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v76 != v41)
                  objc_enumerationMutation(v38);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {

                  v8 = v69;
                  v24 = (void *)v70;
                  v25 = v71;
                  goto LABEL_23;
                }
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
              v25 = v71;
              if (v40)
                continue;
              break;
            }
          }

          v8 = v69;
          if (objc_msgSend((id)objc_msgSend(v30, "classObj"), "isEqual:", objc_opt_class()))
          {
            v24 = (void *)v70;
            if (v25)
            {
              v56 = (void *)MEMORY[0x1E0CB35C8];
              v57 = *MEMORY[0x1E0D27FC8];
              v87 = CFSTR("message");
              v58 = (void *)MEMORY[0x1E0CB3940];
              v59 = (objc_class *)objc_opt_class();
              NSStringFromClass(v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "stringWithFormat:", CFSTR("/%@ (Cannot encode non-standard type %@ as NSObject generic)"), v28, v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = v61;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v57;
              v8 = v69;
              objc_msgSend(v56, "errorWithDomain:code:userInfo:", v63, 3, v62);
              *v25 = (id)objc_claimAutoreleasedReturnValue();

            }
LABEL_63:
            v37 = 0;
LABEL_67:

LABEL_68:
            v22 = v29;

            v49 = 0;
            v45 = v73;
            goto LABEL_69;
          }
          v24 = (void *)v70;
          if (!objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EFA5C4F0)
            || (objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) == 0)
          {
            if (v25)
            {
              v51 = (void *)MEMORY[0x1E0CB35C8];
              v52 = *MEMORY[0x1E0D27FC8];
              v85 = CFSTR("message");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@ (property does not support secureCoding)"), v28);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v53;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v52;
              v8 = v69;
              objc_msgSend(v51, "errorWithDomain:code:userInfo:", v55, 3, v54);
              *v25 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_63;
          }
          encodeRootObjectForRemoteDeviceOnSameAccountMigrateToHH2(v35, 1, 0);
          v43 = objc_claimAutoreleasedReturnValue();

          if (!v43)
          {
            if (v25)
            {
              v64 = (void *)MEMORY[0x1E0CB35C8];
              v65 = *MEMORY[0x1E0D27FC8];
              v83 = CFSTR("message");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@ (property could not be encoded as NSData)"), v28);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v66;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v65;
              v8 = v69;
              objc_msgSend(v64, "errorWithDomain:code:userInfo:", v68, 3, v67);
              *v25 = (id)objc_claimAutoreleasedReturnValue();

            }
            v37 = 0;
            v35 = 0;
            goto LABEL_67;
          }
          objc_msgSend(v69, "setValue:forKey:", v43, v28);
          v35 = (void *)v43;
LABEL_23:

          goto LABEL_29;
        }
      }
      -[HMDBackingStoreModelObject validateType:path:](v72, "validateType:path:", v35, v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v25 && v36)
      {
        v37 = objc_retainAutorelease(v36);
        *v25 = v37;
        goto LABEL_67;
      }

      if (v37)
        goto LABEL_68;
LABEL_29:
      ++v27;
      v22 = v29;
    }
    while (v27 != v26);
    v44 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    v26 = v44;
  }
  while (v44);
LABEL_46:

  if (objc_msgSend(v24, "count"))
    objc_msgSend(v8, "setObject:forKey:", v24, CFSTR("_R"));
  v45 = v73;
  if (objc_msgSend(v73, "count"))
    objc_msgSend(v8, "setObject:forKey:", v73, CFSTR("_U"));
  v46 = (objc_class *)objc_msgSend((id)objc_opt_class(), "genericRepresentation");
  if (v46)
  {
    v47 = v46;
    if ((-[objc_class isEqual:](v46, "isEqual:", objc_opt_class()) & 1) == 0)
    {
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v48, CFSTR("_G"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_69:

  return v49;
}

- (id)encodeWithError:(id *)a3
{
  return -[HMDBackingStoreModelObject encodeFor:error:](self, "encodeFor:error:", 0, a3);
}

- (id)encodeWithEncoding:(unint64_t)a3 error:(id *)a4
{
  return -[HMDBackingStoreModelObject encodeWithEncoding:for:error:](self, "encodeWithEncoding:for:error:", a3, 0, a4);
}

- (id)encodeFor:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = 0;
  -[HMDBackingStoreModelObject encodeWithEncoding:for:error:](self, "encodeWithEncoding:for:error:", 1, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || a4 && *a4)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "addObject:", v8);
    v9 = v7;
  }

  return v9;
}

- (id)encodeWithEncoding:(unint64_t)a3 for:(unint64_t)a4 error:(id *)a5
{
  void *v10;

  -[HMDBackingStoreModelObject clearVersionOverride](self, "clearVersionOverride");
  if (a5)
  {
    *a5 = 0;
    if (a3 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
  }
  else if (a3 != 1)
  {
    v10 = 0;
    return v10;
  }
  -[HMDBackingStoreModelObject encodeAsNSDictionaryFor:error:](self, "encodeAsNSDictionaryFor:error:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)encodeForCloud:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("ObjectRecord"));
  -[HMDBackingStoreModelObject encodeWithEncoding:for:error:](self, "encodeWithEncoding:for:error:", 1, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "setObject:forKey:", &unk_1E8B34338, CFSTR("k00"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k%02lu"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreModelObject uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setParentUUIDIfNotNil:(id)a3
{
  id v5;
  NSUUID **p_parentUUID;
  void *v7;
  HMDBackingStoreModelObject *v8;
  NSObject *v9;
  void *v10;
  HMDAssertionLogEvent *v11;
  void *v12;
  void *v13;
  HMDBackingStoreModelObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_parentUUID = &self->_parentUUID;
  if (!self->_parentUUID)
    goto LABEL_2;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Parent identifier is already present for this object", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Parent identifier is already present for this object"));
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitLogEvent:", v11);

  if (*p_parentUUID)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Parent identifier is already present for this object", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
LABEL_2:
    objc_storeStrong((id *)p_parentUUID, a3);
  }

}

- (BOOL)propertyWasSet:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary valueForKey:](self->_reserved, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isReplayable
{
  return 1;
}

- (BOOL)validForStorage
{
  return 1;
}

- (id)merge:(id)a3 from:(unint64_t)a4
{
  HMDBackingStoreModelObject *v5;
  HMDBackingStoreModelObject *v6;
  uint64_t v7;
  HMDBackingStoreModelObject *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSString *v14;
  Class v15;
  NSString *v16;
  Class v17;
  NSMutableDictionary **p_reserved;
  void *v19;
  NSMutableDictionary *reserved;
  id v21;
  void *v22;
  uint64_t v23;
  HMDBackingStoreModelObject *v24;
  NSObject *v25;
  void *v26;
  _QWORD v28[5];
  HMDBackingStoreModelObject *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  Class v34;
  __int16 v35;
  Class v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (HMDBackingStoreModelObject *)a3;
  v6 = v5;
  if (v5 != self)
  {
    if (-[HMDBackingStoreModelObject bsoIgnoreModel](v5, "bsoIgnoreModel"))
    {
      v7 = MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreSingleton dataVersion](HMDBackingStoreSingleton, "dataVersion");
        v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreModelObject bsoIgnoredBefore](v6, "bsoIgnoredBefore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v32 = v10;
        v33 = 2112;
        v34 = (Class)v6;
        v35 = 2112;
        v36 = v11;
        v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping merge merge from model %@ (our version less than ignore before version %@ <= %@)", buf, 0x2Au);

      }
      v13 = (void *)v7;
LABEL_16:
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 19, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    -[HMDBackingStoreModelObject bsoType](self, "bsoType");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = NSClassFromString(v14);

    -[HMDBackingStoreModelObject bsoType](v6, "bsoType");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = NSClassFromString(v16);

    if ((-[objc_class isSubclassOfClass:](v15, "isSubclassOfClass:", v17) & 1) == 0)
    {
      v23 = MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v26;
        v33 = 2112;
        v34 = v17;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot merge from model class, %@, to model class, %@", buf, 0x20u);

      }
      v13 = (void *)v23;
      goto LABEL_16;
    }
    p_reserved = &self->_reserved;
    v19 = (void *)-[NSMutableDictionary mutableCopy](self->_reserved, "mutableCopy");
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    reserved = v6->_reserved;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __41__HMDBackingStoreModelObject_merge_from___block_invoke;
    v28[3] = &unk_1E89B73E0;
    v28[4] = self;
    v29 = v6;
    v21 = v19;
    v30 = v21;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](reserved, "enumerateKeysAndObjectsUsingBlock:", v28);
    if (objc_msgSend(v21, "count"))
      objc_storeStrong((id *)p_reserved, v19);

  }
  v22 = 0;
LABEL_17:

  return v22;
}

- (id)merge:(id)a3
{
  return -[HMDBackingStoreModelObject merge:from:](self, "merge:from:", a3, 0);
}

- (BOOL)merge:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[HMDBackingStoreModelObject merge:from:](self, "merge:from:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return v6 == 0;
}

- (id)defaultValueForPropertyNamed:(id)a3 isSet:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDBackingStoreModelObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (a4)
      *a4 = objc_msgSend(v8, "defaultValueSet");
    objc_msgSend(v8, "defaultValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreModelObject typeNameForDebug](v11, "typeNameForDebug");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to get default value of property %@ from type %@ (no such property exists)", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDBackingStoreModelObject typeNameForDebug](self, "typeNameForDebug");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject bsoDataVersion](self, "bsoDataVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uuid:%@ version:%@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  HMDBackingStoreModelObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HMDBackingStoreModelObject debugString:prefix:](self, "debugString:prefix:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, (os_log_type_t)a5))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v13;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1CD062000, v12, (os_log_type_t)a5, "%{public}@HMDBackingStoreModelObject %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v10);

}

- (id)debugString:(BOOL)a3
{
  return -[HMDBackingStoreModelObject debugString:prefix:](self, "debugString:prefix:", a3, &stru_1E89C3E38);
}

- (id)debugString:(BOOL)a3 prefix:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  __CFString *v38;
  void *v40;
  id v41;
  char v42;
  id obj;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v4 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject typeNameForDebug](self, "typeNameForDebug");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@%@:"), v6, v8);

  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n  uuid: %@"), v10);

  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n  parent: %@"), v12);

  if (v4)
  {
    -[HMDBackingStoreModelObject bsoDataVersion](self, "bsoDataVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDBackingStoreModelObject bsoDataVersionOverride](self, "bsoDataVersionOverride");
    v15 = "";
    if (v14)
      v15 = " (override)";
    objc_msgSend(v7, "appendFormat:", CFSTR("\n  version: %@%s"), v13, v15);

    -[HMDBackingStoreModelObject bsoIgnoredBefore](self, "bsoIgnoredBefore");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n  ignore before: %@"), v16);
    v40 = v17;
    v41 = v6;
    objc_msgSend(v7, "appendString:", CFSTR("\n  dependents:"));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[HMDBackingStoreModelObject dependentUUIDs](self, "dependentUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v51 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR(" %@"), v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v20);
    }
    v44 = v7;

    objc_msgSend((id)objc_opt_class(), "properties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = shouldLogPrivateInformation();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v24;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v25)
    {
      v26 = v25;
      v45 = *(_QWORD *)v47;
      v27 = &stru_1E89C3E38;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v47 != v45)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend((id)objc_opt_class(), "properties");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKey:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary valueForKey:](self->_reserved, "valueForKey:", v29);
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = (void *)v32;
            +[HMDBackingStoreModelObject formatValue:](HMDBackingStoreModelObject, "formatValue:", v32);
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = v27;
            v36 = v27;
          }
          else
          {
            if (!objc_msgSend(v31, "defaultValueSet"))
              goto LABEL_31;
            objc_msgSend(v31, "defaultValue");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDBackingStoreModelObject formatValue:](HMDBackingStoreModelObject, "formatValue:", v33);
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = v27;
            v36 = CFSTR(" (default)");
          }

          v27 = v35;
          if (-[HMDBackingStoreModelObject propertyIsReadOnly:](self, "propertyIsReadOnly:", v29))
            v37 = CFSTR(" (read-only)");
          else
            v37 = v35;
          if (objc_msgSend(v31, "logging") == 3 || (v42 & 1) == 0 && (!v31 || !objc_msgSend(v31, "logging")))
          {
            v38 = CFSTR("...");

            v34 = CFSTR("...");
          }
          objc_msgSend(v44, "appendFormat:", CFSTR("\n  %@%@%@: %@"), v29, v37, v36, v34);

LABEL_31:
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v26);
    }

    v6 = v41;
    v7 = v44;
  }

  return v7;
}

- (void)clearVersionOverride
{
  -[HMDBackingStoreModelObject setBsoDataVersionOverride:](self, "setBsoDataVersionOverride:", 0);
}

- (void)dumpDebug:(id)a3
{
  -[HMDBackingStoreModelObject dumpWithVerbosity:prefix:logType:](self, "dumpWithVerbosity:prefix:logType:", 0, a3, 1);
}

- (void)dumpDebug
{
  -[HMDBackingStoreModelObject dumpDebug:](self, "dumpDebug:", &stru_1E89C3E38);
}

- (id)logIdentifier
{
  return CFSTR("BackingStore");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUID:parentUUID:", v5, v6);

  v8 = (id)objc_msgSend(v7, "merge:", self);
  return v7;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (void)setParentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_parentUUID, a3);
}

- (HMDBackingStoreObjectProtocol)bsoDelegate
{
  return (HMDBackingStoreObjectProtocol *)objc_loadWeakRetained((id *)&self->_bsoDelegate);
}

- (void)setBsoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bsoDelegate, a3);
}

- (NSString)bsoType
{
  return self->_bsoType;
}

- (void)setBsoType:(id)a3
{
  objc_storeStrong((id *)&self->_bsoType, a3);
}

- (unint64_t)bsoLogRowID
{
  return self->_bsoLogRowID;
}

- (HMFVersion)bsoDataVersion
{
  return self->_bsoDataVersion;
}

- (unint64_t)objectChangeType
{
  return self->_objectChangeType;
}

- (void)setObjectChangeType:(unint64_t)a3
{
  self->_objectChangeType = a3;
}

- (CKRecord)bsoRecord
{
  return self->_bsoRecord;
}

- (void)setBsoRecord:(id)a3
{
  objc_storeStrong((id *)&self->_bsoRecord, a3);
}

- (void)setBsoDataVersionOverride:(BOOL)a3
{
  self->_bsoDataVersionOverride = a3;
}

void __41__HMDBackingStoreModelObject_merge_from___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "characterAtIndex:", 0);
  v8 = a1[4];
  if (v7 == 95)
  {
    objc_msgSend(v8, "bsoDataVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "bsoDataVersion");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isLessThan:", v10))
    {
LABEL_19:

      goto LABEL_20;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_U")) & 1) != 0)
    {

LABEL_12:
      objc_msgSend(a1[6], "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v10 = v20;

      if (v10)
      {
        if (v9)
        {
          objc_msgSend(v9, "addEntriesFromDictionary:", v10);
        }
        else
        {
          v9 = (void *)objc_msgSend(v19, "mutableCopy");
          objc_msgSend(a1[6], "setObject:forKey:", v9, v5);
        }
      }
      goto LABEL_19;
    }
    v18 = objc_msgSend(v5, "isEqualToString:", CFSTR("_R"));

    if ((v18 & 1) != 0)
      goto LABEL_12;
  }
  else if (objc_msgSend(v8, "propertyIsReadOnly:", v5))
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = a1[4];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "bsoType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "bsoDataVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v14;
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge %@ property of model class %@ (marked readonly for %@).", (uint8_t *)&v21, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
  }
  else if (v6)
  {
    v17 = a1[6];
    objc_msgSend(v5, "hmf_stringWithSmallestEncoding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v6, v9);
LABEL_20:

  }
}

+ (Class)backedObjectClass
{
  return 0;
}

+ (id)properties
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

+ (id)schemaHashRoot
{
  return 0;
}

+ (id)bsoSchemaHash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "schemaHashRoot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(a1, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("551E3F88-0C11-4402-A486-6D1EB759AADD"));
  v9 = (void *)MEMORY[0x1E0CB3A28];
  v10 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v9, "hm_deriveUUIDFromBaseUUID:withSalts:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)objectFromDictionaryData:(id)a3 type:(id)a4 error:(id *)a5
{
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  Class v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  HMDHomeKitVersion *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  BOOL v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  HMDAssertionLogEvent *v82;
  void *v83;
  NSString *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  objc_class *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v96;
  uint64_t v97;
  HMDHomeKitVersion *v98;
  id *v99;
  id v100;
  __CFString *v101;
  void *v102;
  id v103;
  NSString *v104;
  void *v105;
  void *context;
  id v107;
  void *v108;
  uint64_t v109;
  id obj;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  uint64_t v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _QWORD v134[7];
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  _QWORD v138[4];

  v138[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  if (a5)
    *a5 = 0;
  if (!objc_msgSend(v8, "length"))
  {
    v13 = 0;
    goto LABEL_79;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
  +[HMDBackingStore internalAllowedTypes](HMDBackingStore, "internalAllowedTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = *MEMORY[0x1E0CB2CD0];
  objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 2, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_76;
  }
  v107 = a1;
  if (!v9)
  {
    objc_msgSend(v13, "valueForKey:", CFSTR("_t"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x1D17BA0A0]();
      v75 = a1;
      HMFGetOSLogHandle();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v123 = v77;
        v124 = 2112;
        v125 = v108;
        _os_log_impl(&dword_1CD062000, v76, OS_LOG_TYPE_ERROR, "%{public}@Received an object with a dictionary missing the kType key: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v74);
      v78 = (void *)MEMORY[0x1D17BA0A0]();
      v79 = v75;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v123 = v81;
        _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received a model missing a critical field.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v78);
      v82 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Received a model missing a critical field."));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "submitLogEvent:", v82);

      v13 = 0;
      v9 = 0;
      goto LABEL_76;
    }
  }
  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nameToClassTransform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (objc_class *)objc_msgSend(v15, "objectForKey:", v9);

  if (!v16)
  {
    v17 = NSClassFromString(v9);
    if (!v17)
    {
      objc_msgSend(v13, "valueForKey:", CFSTR("_G"));
      v84 = (NSString *)objc_claimAutoreleasedReturnValue();

      v104 = v84;
      if (!v84 || (v85 = (uint64_t)NSClassFromString(v84)) == 0)
        v85 = objc_opt_class();
      v16 = (objc_class *)v85;
      goto LABEL_11;
    }
    v16 = v17;
  }
  v104 = v9;
LABEL_11:
  v105 = v11;
  if ((-[objc_class isSubclassOfClass:](v16, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    v68 = (void *)MEMORY[0x1E0CB35C8];
    v69 = *MEMORY[0x1E0D27FC8];
    v137 = CFSTR("message");
    v70 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(v16);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "stringWithFormat:", CFSTR("remapped (or explicit map) is not a subclass of HMDBackingStoreModelObject (%@ is not a sub-class of HMDBackingStoreModelObject)"), v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v138[0] = v72;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, &v137, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "errorWithDomain:code:userInfo:", v69, 3, v73);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v9 = v104;
    v11 = v105;
    goto LABEL_76;
  }
  v102 = v10;
  v18 = [v16 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "initWithVersion:changeType:uuid:parentUUID:", 0, 0, v19, 0);

  v21 = objc_msgSend(v13, "mutableCopy");
  v22 = *(void **)(v20 + 8);
  *(_QWORD *)(v20 + 8) = v21;

  v23 = (void *)MEMORY[0x1E0D28638];
  objc_msgSend(v13, "valueForKey:", CFSTR("_u"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hmf_cachedInstanceForNSString:", v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(void **)(v20 + 24);
  *(_QWORD *)(v20 + 24) = v25;

  v27 = (void *)MEMORY[0x1E0D28638];
  objc_msgSend(v13, "valueForKey:", CFSTR("_P"));
  v28 = v13;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hmf_cachedInstanceForNSString:", v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = *(void **)(v20 + 32);
  *(_QWORD *)(v20 + 32) = v30;

  v32 = (void *)MEMORY[0x1E0D28630];
  objc_msgSend(v28, "valueForKey:", CFSTR("_t"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "hmf_cachedInstanceForString:", v33);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = *(void **)(v20 + 48);
  *(_QWORD *)(v20 + 48) = v34;

  objc_msgSend(v28, "hmf_stringForKey:", CFSTR("_V"));
  v36 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v101 = (__CFString *)v36;
  if (!v36)
  {
    objc_msgSend(v108, "valueForKey:", CFSTR("_v"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v96 = (void *)MEMORY[0x1E0CB35C8];
      v97 = *MEMORY[0x1E0D27FC8];
      v135 = CFSTR("message");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expecting a versioning key named %@ but one does not exist"), CFSTR("_v"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "errorWithDomain:code:userInfo:", v97, 3);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_75;
    }
    v36 = CFSTR("4.0");
  }
  v37 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v36);
  objc_storeStrong((id *)(v20 + 64), v37);
  v38 = *(void **)(v20 + 8);
  v134[0] = CFSTR("_P");
  v134[1] = CFSTR("_u");
  v134[2] = CFSTR("_v");
  v134[3] = CFSTR("_t");
  v134[4] = CFSTR("_T");
  v134[5] = CFSTR("_d");
  v134[6] = CFSTR("_G");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "removeObjectsForKeys:", v39);

  objc_msgSend((id)objc_opt_class(), "properties");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  objc_msgSend(*(id *)(v20 + 8), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v133, 16);
  if (!v41)
  {
    v67 = 0;
    goto LABEL_74;
  }
  v42 = v41;
  v98 = v37;
  v99 = a5;
  v100 = v8;
  v43 = *(_QWORD *)v119;
  v44 = obj;
  v111 = *(_QWORD *)v119;
  while (2)
  {
    v45 = 0;
    v113 = v42;
    do
    {
      if (*(_QWORD *)v119 != v43)
        objc_enumerationMutation(v44);
      v46 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v45);
      objc_msgSend(v40, "valueForKey:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v20 + 8), "valueForKey:", v46);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v48;
      if (v47)
        v50 = v48 == 0;
      else
        v50 = 1;
      if (!v50)
      {
        if (objc_msgSend((id)objc_msgSend(v47, "classObj"), "isEqual:", objc_opt_class()))
        {
          objc_msgSend(*(id *)(v20 + 8), "removeObjectForKey:", v46);
LABEL_53:
          v42 = v113;
          goto LABEL_54;
        }
        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        v51 = v112;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
        if (v52)
        {
          v53 = v20;
          v54 = v40;
          v55 = *(_QWORD *)v115;
          while (2)
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v115 != v55)
                objc_enumerationMutation(v51);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                LODWORD(v52) = 1;
                goto LABEL_36;
              }
            }
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
            if (v52)
              continue;
            break;
          }
LABEL_36:
          v40 = v54;
          v20 = v53;
          v44 = obj;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (_DWORD)v52
          && ((objc_msgSend(v51, "containsObject:", objc_msgSend(v47, "classObj")) & 1) != 0
           || objc_msgSend((id)objc_msgSend(v47, "classObj"), "isEqual:", objc_opt_class())))
        {
          objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v46);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v20 + 8), "removeObjectForKey:", v46);
          objc_msgSend(*(id *)(v20 + 8), "setObject:forKey:", v49, v57);
LABEL_52:

          v43 = v111;
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!objc_msgSend((id)objc_msgSend(v47, "classObj"), "isEqual:", objc_opt_class()))
          {
            v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v49, 0);
            objc_msgSend(v57, "_allowDecodingCyclesInSecureMode");
            if (objc_msgSend((id)objc_msgSend(v47, "classObj"), "isSubclassOfClass:", objc_opt_class()))
            {
              objc_msgSend(v47, "decodeClasses");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "decodeObjectOfClasses:forKey:", v58, v109);
              v59 = objc_claimAutoreleasedReturnValue();

              v49 = (void *)v59;
              v44 = obj;
            }
            else
            {
              objc_msgSend(v57, "decodeObjectOfClass:forKey:", objc_msgSend(v47, "classObj"), v109);
              v58 = v49;
              v49 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v57, "finishDecoding");
            v60 = objc_msgSend(*(id *)(v20 + 8), "removeObjectForKey:", v46);
            if (v49)
            {
              objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v46);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v20 + 8), "setObject:forKey:", v49, v61);

            }
            else
            {
              context = (void *)MEMORY[0x1D17BA0A0](v60);
              v62 = v107;
              HMFGetOSLogHandle();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v103 = v62;
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "error");
                v65 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v123 = v64;
                v124 = 2112;
                v125 = v46;
                v126 = 2112;
                v127 = v65;
                v66 = (void *)v65;
                _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_ERROR, "%{public}@failed to unarchive implicitly archived property %@: %@", buf, 0x20u);

                v62 = v103;
              }

              objc_autoreleasePoolPop(context);
              v44 = obj;
            }
            goto LABEL_52;
          }
          v93 = (void *)MEMORY[0x1E0CB35C8];
          v94 = *MEMORY[0x1E0D27FC8];
          v128 = CFSTR("message");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not have a internally handled type of NSObject (but we hit one for key %@)"), v46);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = v90;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "errorWithDomain:code:userInfo:", v94, 3, v91);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v86 = (void *)MEMORY[0x1E0CB35C8];
          v87 = *MEMORY[0x1E0D27FC8];
          v130 = CFSTR("message");
          v88 = (void *)MEMORY[0x1E0CB3940];
          v89 = (objc_class *)objc_opt_class();
          NSStringFromClass(v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "stringWithFormat:", CFSTR("expecting internal storage to be a NSData, but it's a %@"), v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = v91;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "errorWithDomain:code:userInfo:", v87, 3, v92);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v20 = 0;
        goto LABEL_73;
      }
LABEL_54:

      ++v45;
    }
    while (v45 != v42);
    v42 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v118, v133, 16);
    if (v42)
      continue;
    break;
  }
  v67 = 0;
LABEL_73:
  a5 = v99;
  v8 = v100;
  v37 = v98;
LABEL_74:
  v13 = (void *)v20;

  v20 = (uint64_t)v37;
LABEL_75:
  v9 = v104;
  v11 = v105;

  v10 = v102;
LABEL_76:

  objc_autoreleasePoolPop(v10);
  if (a5)
    *a5 = objc_retainAutorelease(v67);

LABEL_79:
  return v13;
}

+ (id)objectFromDictionaryData:(id)a3 error:(id *)a4
{
  return +[HMDBackingStoreModelObject objectFromDictionaryData:type:error:](HMDBackingStoreModelObject, "objectFromDictionaryData:type:error:", a3, 0, a4);
}

+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a5)
    *a5 = 0;
  if (!objc_msgSend(v7, "length"))
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (a4 != 1
    || (+[HMDBackingStoreModelObject objectFromDictionaryData:type:error:](HMDBackingStoreModelObject, "objectFromDictionaryData:type:error:", v8, 0, a5), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (a5 && !*a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v10 = v9;
  objc_msgSend(v9, "clearVersionOverride");
LABEL_10:

  return v10;
}

+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 rowID:(unint64_t)a5 error:(id *)a6
{
  id result;

  result = +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", a3, a4, a6);
  if (result)
    *((_QWORD *)result + 7) = a5;
  return result;
}

+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 record:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  _QWORD *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v10, a4, a6);
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, &v24);
  v15 = v24;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v14);
  v17 = (void *)v12[10];
  v12[10] = v16;

  objc_autoreleasePoolPop(v13);
  if (v15)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive CKRecord for BSO (%@): %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    if (a6)
      *a6 = objc_retainAutorelease(v15);

    v22 = 0;
  }
  else
  {
LABEL_8:
    v22 = v12;
  }

  return v22;
}

+ (id)objectFromCloud:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("k00"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k%02lu"), objc_msgSend(v8, "unsignedIntValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v12, objc_msgSend(v8, "unsignedIntValue"), a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)formatValue:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  objc_class *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFSTR("<NULL>");
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSArray: %lu items>"), objc_msgSend(v3, "count"));
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSDictionary: %lu items>"), objc_msgSend(v3, "count"));
LABEL_7:
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v4 = v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v7, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v8, v3, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3940];
    if (v9)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ / NSData: %lu bytes>"), v12, objc_msgSend(v3, "length"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSData: %lu bytes>"), objc_msgSend(v3, "length"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            v5 = (__CFString *)v3;
            goto LABEL_8;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v15)
          continue;
        break;
      }
    }

    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@>"), v20);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_134170 != -1)
    dispatch_once(&logCategory__hmf_once_t19_134170, &__block_literal_global_134171);
  return (id)logCategory__hmf_once_v20_134172;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  objc_class *v9;
  void (*v10)(void);
  const char *v11;
  BOOL v12;

  keyFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend((id)objc_opt_class(), "properties"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKey:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    NSStringFromSelector(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

    v9 = (objc_class *)objc_opt_class();
    if (v8)
    {
      v10 = (void (*)(void))propertyIMP;
      v11 = "@@:";
    }
    else
    {
      v10 = (void (*)(void))setPropertyIMP;
      v11 = "v@:@";
    }
    class_addMethod(v9, a3, v10, v11);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __41__HMDBackingStoreModelObject_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_134172;
  logCategory__hmf_once_v20_134172 = v0;

}

@end
