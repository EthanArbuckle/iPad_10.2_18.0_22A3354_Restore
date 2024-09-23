@implementation HMDCloudZoneInformation

- (HMDCloudZoneInformation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCloudZoneInformation)initWithOwnerName:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  HMDCloudZoneInformation *v8;
  uint64_t v9;
  NSString *ownerName;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUUID *uuid;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCloudZoneInformation;
  v8 = -[HMDCloudZoneInformation init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    ownerName = v8->_ownerName;
    v8->_ownerName = (NSString *)v9;

    if (v7)
    {
      v11 = objc_msgSend(v7, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v13;

    v8->_schemaVersion = 2;
    v8->_firstFetch = 1;

  }
  return v8;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZoneInformation uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudZoneInformation shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E89C3E38;
  }
  -[HMDCloudZoneInformation ownerName](self, "ownerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Owner = %@>"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDCloudZoneInformation descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDCloudZoneInformation descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCloudZoneInformation uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDCloudZoneInformation *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMDCloudZoneInformation *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMDCloudZoneInformation uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudZoneInformation uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (HMDCloudZoneInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCloudZoneInformation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.zoneUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.zoneOwner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDCloudZoneInformation initWithOwnerName:uuid:](self, "initWithOwnerName:uuid:", v7, v6);
  if (v8)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.zoneFetchFailed")))
      v8->_fetchFailed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.zoneFetchFailed"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.zoneZoneCreated")))
      v8->_zoneCreated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.zoneZoneCreated"));
    else
      v8->_zoneCreated = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.zoneSchemaVersion")))
      v8->_schemaVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.zoneSchemaVersion"));
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDCloudZoneInformation uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("HM.zoneUUID"));

  -[HMDCloudZoneInformation ownerName](self, "ownerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("HM.zoneOwner"));

  objc_msgSend(v7, "encodeBool:forKey:", -[HMDCloudZoneInformation didFetchFailed](self, "didFetchFailed"), CFSTR("HM.zoneFetchFailed"));
  objc_msgSend(v7, "encodeBool:forKey:", -[HMDCloudZoneInformation isZoneCreated](self, "isZoneCreated"), CFSTR("HM.zoneZoneCreated"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[HMDCloudZoneInformation schemaVersion](self, "schemaVersion"), CFSTR("HM.zoneSchemaVersion"));

}

- (void)updateCloudZoneInformationWithModel:(id)a3 message:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HMDCloudZoneInformation setZoneCreated:](self, "setZoneCreated:", 1);
  objc_msgSend(v8, "setProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("ownerName"));

  if (v6)
  {
    objc_msgSend(v8, "ownerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudZoneInformation setOwnerName:](self, "setOwnerName:", v7);

  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v11;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
  {
    -[HMDCloudZoneInformation updateCloudZoneInformationWithModel:message:](self, "updateCloudZoneInformationWithModel:message:", v9, v7);
    objc_msgSend(v7, "transactionResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markChanged");
    objc_msgSend(v7, "respondWithPayload:", 0);

  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3 parent:(id)a4
{
  return -[HMDCloudZoneInformation modelObjectWithChangeType:version:parent:](self, "modelObjectWithChangeType:version:parent:", a3, 4, a4);
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4 parent:(id)a5
{
  void *v6;
  void *v7;

  -[HMDCloudZoneInformation emptyModelObjectWithChangeType:parent:](self, "emptyModelObjectWithChangeType:parent:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZoneInformation ownerName](self, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOwnerName:", v7);

  return v6;
}

- (id)emptyModelObjectWithChangeType:(unint64_t)a3 parent:(id)a4
{
  id v6;
  HMDCloudZoneInformationModel *v7;
  void *v8;
  HMDCloudZoneInformationModel *v9;

  v6 = a4;
  v7 = [HMDCloudZoneInformationModel alloc];
  -[HMDCloudZoneInformation uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v6);

  return v9;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerName, a3);
}

- (BOOL)didFetchFailed
{
  return self->_fetchFailed;
}

- (void)setFetchFailed:(BOOL)a3
{
  self->_fetchFailed = a3;
}

- (BOOL)isFirstFetch
{
  return self->_firstFetch;
}

- (void)setFirstFetch:(BOOL)a3
{
  self->_firstFetch = a3;
}

- (BOOL)isZoneCreated
{
  return self->_zoneCreated;
}

- (void)setZoneCreated:(BOOL)a3
{
  self->_zoneCreated = a3;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(int64_t)a3
{
  self->_schemaVersion = a3;
}

- (BOOL)doesHandlesCloudRecord
{
  return self->_handlesCloudRecord;
}

- (void)setHandlesCloudRecord:(BOOL)a3
{
  self->_handlesCloudRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)cloudZonesWithDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCloudZoneInformation *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HM.zoneOwner"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HMDCloudZoneInformation initWithOwnerName:uuid:]([HMDCloudZoneInformation alloc], "initWithOwnerName:uuid:", v12, v11);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HM.zoneFetchFailed"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          -[HMDCloudZoneInformation setFetchFailed:](v13, "setFetchFailed:", 1);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HM.zoneHandlesRecord"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          -[HMDCloudZoneInformation setHandlesCloudRecord:](v13, "setHandlesCloudRecord:", 1);
        objc_msgSend(v10, "hmf_numberForKey:", CFSTR("HM.zoneSchemaVersion"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v18 = objc_msgSend(v16, "integerValue");
        else
          v18 = 1;
        -[HMDCloudZoneInformation setSchemaVersion:](v13, "setSchemaVersion:", v18);
        objc_msgSend(v4, "addObject:", v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)cloudZoneInformationWithCloudZones:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  id v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v29;
    *(_QWORD *)&v6 = 138543618;
    v24 = v6;
    v25 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "uuid", v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "ownerName");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (v15)
        {
          v16 = v8;
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = a1;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v33 = v20;
            v34 = 2112;
            v35 = v10;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot convert zone information to zone information dictionary, %@", buf, 0x16u);

            v4 = v25;
          }

          objc_autoreleasePoolPop(v17);
          v8 = v16;
        }
        else
        {
          v36[0] = CFSTR("HM.zoneOwner");
          v36[1] = CFSTR("HM.zoneHandlesRecord");
          v37[0] = v13;
          v37[1] = MEMORY[0x1E0C9AAB0];
          v36[2] = CFSTR("HM.zoneSchemaVersion");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "schemaVersion"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v37[2] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, v12);

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v7);
  }

  return v27;
}

+ (id)cloudZonesArrayWithCloudZones:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "uuid", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
