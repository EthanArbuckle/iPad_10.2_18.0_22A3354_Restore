@implementation HMDCloudChangeNode

- (HMDCloudChangeNode)init
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

- (id)_initWithUUID:(id)a3 parentUUID:(id)a4 recordName:(id)a5 type:(id)a6 change:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDCloudChangeNode *v18;
  HMDCloudChangeNode *v19;
  uint64_t v20;
  NSString *type;
  uint64_t v22;
  NSMapTable *children;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMDCloudChangeNode;
  v18 = -[HMDCloudChangeNode init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_parentUuid, a4);
    objc_storeStrong((id *)&v19->_recordName, a5);
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v16);
    v20 = objc_claimAutoreleasedReturnValue();
    type = v19->_type;
    v19->_type = (NSString *)v20;

    objc_storeStrong((id *)&v19->_change, a7);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v22 = objc_claimAutoreleasedReturnValue();
    children = v19->_children;
    v19->_children = (NSMapTable *)v22;

  }
  return v19;
}

- (HMDCloudChangeNode)initWithRecordMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCloudChangeNode *v9;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentUuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDCloudChangeNode _initWithUUID:parentUUID:recordName:type:change:](self, "_initWithUUID:parentUUID:recordName:type:change:", v5, v6, v7, v8, 0);
  return v9;
}

- (HMDCloudChangeNode)initWithModel:(id)a3
{
  id v4;
  HMDCloudChange *v5;
  HMDCloudChange *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudChangeNode *v11;
  HMDCloudChangeNode *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDCloudChange initWithObjectChange:]([HMDCloudChange alloc], "initWithObjectChange:", v4);
  v6 = v5;
  if (v5)
  {
    -[HMDCloudChange objectID](v5, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChange parentObjectID](v6, "parentObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChange recordName](v6, "recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bsoType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (HMDCloudChangeNode *)-[HMDCloudChangeNode _initWithUUID:parentUUID:recordName:type:change:](self, "_initWithUUID:parentUUID:recordName:type:change:", v7, v8, v9, v10, v6);

    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create cloud change node from %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (HMDCloudChangeNode)initWithChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCloudChangeNode *v10;

  v4 = a3;
  objc_msgSend(v4, "objectChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bsoType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDCloudChangeNode _initWithUUID:parentUUID:recordName:type:change:](self, "_initWithUUID:parentUUID:recordName:type:change:", v6, v7, v8, v9, v4);

  return v10;
}

- (HMDCloudChangeNode)initWithCloudRecord:(id)a3
{
  id v4;
  HMDCloudChange *v5;
  HMDCloudChangeNode *v6;

  v4 = a3;
  v5 = -[HMDCloudChange initWithCloudObjectRecord:]([HMDCloudChange alloc], "initWithCloudObjectRecord:", v4);

  v6 = -[HMDCloudChangeNode initWithChange:](self, "initWithChange:", v5);
  return v6;
}

- (id)shortDescription
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudChangeNode type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringWithRange:", 0, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode recordName](self, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringWithRange:", 0, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode change](self, "change");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Type = %@ UUID = %@ Record Name = %@ Data = change=%d/forceDelete=%d"), v4, v7, v9, v10 != 0, -[HMDCloudChangeNode forceDelete](self, "forceDelete"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudChangeNode shortDescription](self, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)logChangeTreeWithIndent:(id)a3
{
  id v4;
  void *v5;
  HMDCloudChangeNode *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeNode shortDescription](v6, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@%@HMDCloudChangeNode<%@>:", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  "), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode children](v6, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "nextObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      objc_msgSend(v14, "logChangeTreeWithIndent:", v10);
      objc_msgSend(v12, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    while (v15);
  }

}

- (void)addChild:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDCloudChangeNode children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

  objc_msgSend(v6, "setParent:", self);
}

- (void)removeChild:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setParent:", 0);
  -[HMDCloudChangeNode children](self, "children");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)updateRecordMapping:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "recordName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[HMDCloudChangeNode recordName](self, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = HMFEqualObjects();

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v28, "recordName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChangeNode setRecordName:](self, "setRecordName:", v9);

    }
  }
  objc_msgSend(v28, "uuid");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[HMDCloudChangeNode uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v28, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChangeNode setUuid:](self, "setUuid:", v15);

    }
  }
  objc_msgSend(v28, "parentUuid");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[HMDCloudChangeNode parentUuid](self, "parentUuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "parentUuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if ((v20 & 1) == 0)
    {
      objc_msgSend(v28, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChangeNode setUuid:](self, "setUuid:", v21);

    }
  }
  objc_msgSend(v28, "type");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[HMDCloudChangeNode type](self, "type");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "type");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = HMFEqualObjects();

    if ((v26 & 1) == 0)
    {
      objc_msgSend(v28, "type");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChangeNode setType:](self, "setType:", v27);

    }
  }

}

- (void)_updateWithModel:(id)a3
{
  void *v4;
  HMDCloudChange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[HMDCloudChangeNode change](self, "change");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDCloudChangeNode change](self, "change");
    v5 = (HMDCloudChange *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChange updateWithObjectChange:](v5, "updateWithObjectChange:", v22);
  }
  else
  {
    v5 = -[HMDCloudChange initWithObjectChange:]([HMDCloudChange alloc], "initWithObjectChange:", v22);
    -[HMDCloudChangeNode setChange:](self, "setChange:", v5);
  }

  -[HMDCloudChangeNode uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[HMDCloudChangeNode change](self, "change");
    v5 = (HMDCloudChange *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChange objectID](v5, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      goto LABEL_11;
    }
  }
  -[HMDCloudChangeNode uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode change](self, "change");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v6)
  {

    if (!v10)
      goto LABEL_12;
    goto LABEL_11;
  }

  if ((v10 & 1) != 0)
  {
LABEL_11:
    -[HMDCloudChangeNode change](self, "change");
    v5 = (HMDCloudChange *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChange objectID](v5, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeNode setUuid:](self, "setUuid:", v12);

  }
LABEL_12:
  -[HMDCloudChangeNode parentUuid](self, "parentUuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[HMDCloudChangeNode change](self, "change");
    v5 = (HMDCloudChange *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChange parentObjectID](v5, "parentObjectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

      goto LABEL_19;
    }
  }
  -[HMDCloudChangeNode parentUuid](self, "parentUuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode change](self, "change");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parentObjectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqual:", v16);

  if (v13)
  {

    if (!v17)
      goto LABEL_20;
    goto LABEL_19;
  }

  if ((v17 & 1) != 0)
  {
LABEL_19:
    -[HMDCloudChangeNode change](self, "change");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "parentObjectID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeNode setParentUuid:](self, "setParentUuid:", v20);

  }
LABEL_20:
  objc_msgSend(v22, "bsoType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode setType:](self, "setType:", v21);

}

- (void)_updateWithChange:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;

  -[HMDCloudChangeNode setChange:](self, "setChange:", a3);
  if (-[HMDCloudChangeNode forceDelete](self, "forceDelete"))
  {
    -[HMDCloudChangeNode change](self, "change");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceChangeToDelete");

  }
  -[HMDCloudChangeNode uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[HMDCloudChangeNode change](self, "change");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

      goto LABEL_10;
    }
  }
  -[HMDCloudChangeNode uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode change](self, "change");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v5)
  {

    if (!v9)
      goto LABEL_11;
    goto LABEL_10;
  }

  if ((v9 & 1) != 0)
  {
LABEL_10:
    -[HMDCloudChangeNode change](self, "change");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeNode setUuid:](self, "setUuid:", v11);

  }
LABEL_11:
  -[HMDCloudChangeNode parentUuid](self, "parentUuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[HMDCloudChangeNode change](self, "change");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentObjectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

      goto LABEL_18;
    }
  }
  -[HMDCloudChangeNode parentUuid](self, "parentUuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode change](self, "change");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parentObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqual:", v15);

  if (v12)
  {

    if (!v16)
      goto LABEL_19;
    goto LABEL_18;
  }

  if ((v16 & 1) != 0)
  {
LABEL_18:
    -[HMDCloudChangeNode change](self, "change");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentObjectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeNode setParentUuid:](self, "setParentUuid:", v18);

  }
LABEL_19:
  -[HMDCloudChangeNode recordName](self, "recordName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    -[HMDCloudChangeNode change](self, "change");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {

      goto LABEL_26;
    }
  }
  -[HMDCloudChangeNode recordName](self, "recordName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode change](self, "change");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "recordName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "isEqual:", v22);

  if (!v19)
  {

    if ((v23 & 1) == 0)
      return;
    goto LABEL_26;
  }

  if (v23)
  {
LABEL_26:
    -[HMDCloudChangeNode change](self, "change");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "recordName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeNode setRecordName:](self, "setRecordName:", v25);

  }
}

- (void)_updateWithCloudRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCloudChange *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode setRecordName:](self, "setRecordName:", v5);

  -[HMDCloudChangeNode change](self, "change");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCloudChangeNode change](self, "change");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateCloudRecord:", v4);

  }
  else
  {
    v7 = -[HMDCloudChange initWithCloudObjectRecord:]([HMDCloudChange alloc], "initWithCloudObjectRecord:", v4);

    -[HMDCloudChangeNode setChange:](self, "setChange:", v7);
    if (!-[HMDCloudChangeNode forceDelete](self, "forceDelete"))
      return;
    -[HMDCloudChangeNode change](self, "change");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceChangeToDelete");
  }

}

- (void)deleteChildren
{
  void *v3;
  HMDCloudChangeNode *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[HMDCloudChangeNode forceDelete](self, "forceDelete"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChangeNode shortDescription](v4, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deleting children objects %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v4->_forceDelete = 1;
    -[HMDCloudChangeNode change](v4, "change");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[HMDCloudChangeNode change](v4, "change");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isDeleted");

      if ((v11 & 1) == 0)
      {
        -[HMDCloudChangeNode change](v4, "change");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "forceChangeToDelete");

      }
    }
    -[HMDCloudChangeNode children](v4, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[HMDCloudChangeNode children](v4, "children");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "nextObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        do
        {
          objc_msgSend(v18, "deleteChildren");
          objc_msgSend(v16, "nextObject");
          v19 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v19;
        }
        while (v19);
      }

    }
  }
}

- (id)_allNodesInBranch
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeNode uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[HMDCloudChangeNode children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[HMDCloudChangeNode children](self, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nextObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      do
      {
        objc_msgSend(v10, "_allNodesInBranch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        objc_msgSend(v8, "nextObject");
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
      }
      while (v12);
    }

  }
  objc_msgSend(v3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_markBranchOrphaned
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  self->_orphaned = 1;
  -[HMDCloudChangeNode children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HMDCloudChangeNode children](self, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectEnumerator");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "nextObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        objc_msgSend(v7, "_markBranchOrphaned");
        objc_msgSend(v9, "nextObject");
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
      }
      while (v8);
    }

  }
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)parentUuid
{
  return self->_parentUuid;
}

- (void)setParentUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)forceDelete
{
  return self->_forceDelete;
}

- (BOOL)orphaned
{
  return self->_orphaned;
}

- (HMDCloudChangeNode)parent
{
  return (HMDCloudChangeNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (HMDCloudChange)change
{
  return self->_change;
}

- (void)setChange:(id)a3
{
  objc_storeStrong((id *)&self->_change, a3);
}

- (NSMapTable)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parentUuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
