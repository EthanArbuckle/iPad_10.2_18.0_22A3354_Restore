@implementation HMDCloudChangeTree

- (HMDCloudChangeTree)init
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

- (HMDCloudChangeTree)initWithRootUUIDs:(id)a3
{
  id v4;
  HMDCloudChangeTree *v5;
  HMDCloudChangeTree *v6;
  uint64_t v7;
  NSMutableArray *objects;
  uint64_t v9;
  NSMapTable *objectMap;
  uint64_t v11;
  NSMapTable *recordMap;
  uint64_t v13;
  NSMapTable *branchMap;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *validRootUUIDs;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDCloudChangeTree;
  v5 = -[HMDCloudChangeTree init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    objects = v6->_objects;
    v6->_objects = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    objectMap = v6->_objectMap;
    v6->_objectMap = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    recordMap = v6->_recordMap;
    v6->_recordMap = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    branchMap = v6->_branchMap;
    v6->_branchMap = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "zeroUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

    v17 = objc_msgSend(v15, "copy");
    validRootUUIDs = v6->_validRootUUIDs;
    v6->_validRootUUIDs = (NSSet *)v17;

  }
  return v6;
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudChangeTree shortDescription](self, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)logChangeTreeWithIndent:(id)a3
{
  uint64_t v4;
  void *v5;
  HMDCloudChangeTree *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *i;
  void *v14;
  void *v15;
  HMDCloudChangeTree *v16;
  NSObject *v17;
  void *v18;
  os_unfair_lock_t lock;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  lock = &self->_lock;
  v4 = os_unfair_lock_lock_with_options();
  v5 = (void *)MEMORY[0x1D17BA0A0](v4);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeTree shortDescription](v6, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2112;
    v24 = v20;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@%@HMDCloudChangeNode<%@>:", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  "), v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeTree branchMap](v6, "branchMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; objc_msgSend(i, "logChangeTreeWithIndent:", v10))
  {
    objc_msgSend(v12, "nextObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      break;
    i = v14;
    if (objc_msgSend(v14, "orphaned"))
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v18;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@%@Orphaned Branch", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
  }

  os_unfair_lock_unlock(lock);
}

- (id)_objectForUUID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)objectForUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree _objectForUUID:](self, "_objectForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_objectForRecordName:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[HMDCloudChangeTree recordMap](self, "recordMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)objectForRecordName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree _objectForRecordName:](self, "_objectForRecordName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_findNodeWithRecordMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeTree _objectForUUID:](self, "_objectForUUID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeTree _objectForRecordName:](self, "_objectForRecordName:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

LABEL_6:
  return v9;
}

- (void)_updateNode:(id)a3 oldRecordName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v6, "uuid");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[HMDCloudChangeTree objectMap](self, "objectMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChangeTree branchMap](self, "branchMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectEnumerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        do
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          objc_msgSend(v17, "parentUuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if (v21)
          {
            objc_msgSend(v13, "addObject:", v17);
            objc_msgSend(v6, "addChild:", v17);
            objc_msgSend(v17, "setParent:", v6);
          }
          objc_autoreleasePoolPop(v18);
          objc_msgSend(v15, "nextObject");
          v22 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v22;
        }
        while (v22);
      }
      if (objc_msgSend(v13, "count"))
      {
        v47 = v13;
        v48 = v7;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v23 = v13;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v50 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              v29 = (void *)MEMORY[0x1D17BA0A0]();
              -[HMDCloudChangeTree branchMap](self, "branchMap");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "uuid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "removeObjectForKey:", v31);

              objc_autoreleasePoolPop(v29);
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          }
          while (v25);
        }

        v13 = v47;
        v7 = v48;
      }
      objc_msgSend(v6, "parentUuid", v47, v48, (_QWORD)v49);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[HMDCloudChangeTree objectMap](self, "objectMap");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "parentUuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKey:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v35, "addChild:", v6);
          objc_msgSend(v6, "setParent:", v35);
        }
        else
        {
          -[HMDCloudChangeTree branchMap](self, "branchMap");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKey:", v6, v38);

          v35 = 0;
        }
      }
      else
      {
        -[HMDCloudChangeTree branchMap](self, "branchMap");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v6, v36);

      }
      -[HMDCloudChangeTree objectMap](self, "objectMap");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKey:", v6, v40);

    }
  }
  objc_msgSend(v6, "recordName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    if (v7)
    {
      objc_msgSend(v6, "recordName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v7, "isEqualToString:", v42);

      if ((v43 & 1) == 0)
      {
        -[HMDCloudChangeTree recordMap](self, "recordMap");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "removeObjectForKey:", v7);

      }
    }
    -[HMDCloudChangeTree recordMap](self, "recordMap");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKey:", v6, v46);

  }
}

- (void)_addNode:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[HMDCloudChangeTree objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[HMDCloudChangeTree _updateNode:oldRecordName:](self, "_updateNode:oldRecordName:", v6, 0);
}

- (void)removeNode:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *i;
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
  id v19;

  v19 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v19, "parent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeChild:", v19);
  objc_msgSend(v19, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v9)
  {

    objc_msgSend(v7, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    -[HMDCloudChangeTree branchMap](self, "branchMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, v10);

  }
  objc_msgSend(v19, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  objc_msgSend(v19, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDCloudChangeTree recordMap](self, "recordMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v14);

  }
  objc_msgSend(v19, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDCloudChangeTree objectMap](self, "objectMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v17);

  }
  -[HMDCloudChangeTree objects](self, "objects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObject:", v19);

  os_unfair_lock_unlock(p_lock);
}

- (void)updateRecordMapping:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  HMDCloudChangeNode *v6;
  HMDCloudChangeNode *v7;
  void *v8;
  HMDCloudChangeTree *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree _findNodeWithRecordMapping:](self, "_findNodeWithRecordMapping:", v4);
  v6 = (HMDCloudChangeNode *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[HMDCloudChangeNode updateRecordMapping:](v6, "updateRecordMapping:", v4);
LABEL_5:
    -[HMDCloudChangeTree _updateNode:oldRecordName:](self, "_updateNode:oldRecordName:", v7, 0);
    goto LABEL_6;
  }
  v7 = -[HMDCloudChangeNode initWithRecordMapping:]([HMDCloudChangeNode alloc], "initWithRecordMapping:", v4);
  if (v7)
  {
    -[HMDCloudChangeTree _addNode:](self, "_addNode:", v7);
    goto LABEL_5;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change node for record mapping %@/%@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v7 = 0;
LABEL_6:

  os_unfair_lock_unlock(p_lock);
}

- (void)updateModel:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDCloudChangeNode *v7;
  void *v8;
  HMDCloudChangeTree *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudChangeTree _objectForUUID:](self, "_objectForUUID:", v6);
  v7 = (HMDCloudChangeNode *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDCloudChangeNode _updateWithModel:](v7, "_updateWithModel:", v4);
LABEL_5:
    -[HMDCloudChangeTree _updateNode:oldRecordName:](self, "_updateNode:oldRecordName:", v7, 0);
    goto LABEL_6;
  }
  v7 = -[HMDCloudChangeNode initWithModel:]([HMDCloudChangeNode alloc], "initWithModel:", v4);
  if (v7)
  {
    -[HMDCloudChangeTree _addNode:](self, "_addNode:", v7);
    goto LABEL_5;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change node for model %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v7 = 0;
LABEL_6:

  os_unfair_lock_unlock(p_lock);
}

- (void)updateChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  HMDCloudChangeNode *v6;
  HMDCloudChangeNode *v7;
  void *v8;
  void *v9;
  HMDCloudChangeTree *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree _findNodeWithRecordMapping:](self, "_findNodeWithRecordMapping:", v4);
  v6 = (HMDCloudChangeNode *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[HMDCloudChangeNode recordName](v6, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudChangeNode _updateWithChange:](v7, "_updateWithChange:", v4);
LABEL_5:
    -[HMDCloudChangeTree _updateNode:oldRecordName:](self, "_updateNode:oldRecordName:", v7, v8);
    goto LABEL_6;
  }
  v7 = -[HMDCloudChangeNode initWithChange:]([HMDCloudChangeNode alloc], "initWithChange:", v4);
  if (v7)
  {
    -[HMDCloudChangeTree _addNode:](self, "_addNode:", v7);
    v8 = 0;
    goto LABEL_5;
  }
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change node for change %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v8 = 0;
  v7 = 0;
LABEL_6:

  os_unfair_lock_unlock(p_lock);
}

- (void)updateNode:(id)a3 withCloudRecord:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v8, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateWithCloudRecord:", v6);
  -[HMDCloudChangeTree _updateNode:oldRecordName:](self, "_updateNode:oldRecordName:", v8, v7);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)findAndDeletedChildren
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  HMDCloudChangeTree *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v4 = os_unfair_lock_lock_with_options();
  v5 = (void *)MEMORY[0x1D17BA0A0](v4);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Determining child records to delete", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCloudChangeTree objectMap](v6, "objectMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  while (1)
  {
    objc_msgSend(v10, "nextObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      break;
    objc_msgSend(v12, "change");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v12;
    if (v13)
    {
      objc_msgSend(v12, "change");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isDeleted");

      v11 = v12;
      if (v15)
      {
        objc_msgSend(v12, "deleteChildren");
        v11 = v12;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)findAndMarkOrphanedBranches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDCloudChangeTree *v12;
  NSObject *v13;
  id v14;
  void *v15;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree branchMap](self, "branchMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  while (1)
  {
    objc_msgSend(v4, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    objc_msgSend(v6, "parentUuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if (v7)
    {
      -[HMDCloudChangeTree validRootUUIDs](self, "validRootUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentUuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsObject:", v9);

      v5 = v6;
      if ((v10 & 1) == 0)
      {
        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v14;
          v19 = 2112;
          v20 = v15;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Orphaned Branch %@, marking all children as deleted", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v6, "_markBranchOrphaned");
        v5 = v6;
      }
    }
  }

  os_unfair_lock_unlock(lock);
}

- (NSArray)objectsWithPotentialChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  while (1)
  {
    v7 = v6;
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    if (objc_msgSend(v6, "forceDelete")
      || (objc_msgSend(v6, "change"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9)
      && (objc_msgSend(v6, "change"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isInvalid"),
          v10,
          (v11 & 1) == 0))
    {
      objc_msgSend(v6, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

    }
    objc_autoreleasePoolPop(v8);
  }
  -[HMDCloudChangeTree branchMap](self, "branchMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  while (1)
  {
    v16 = v15;
    objc_msgSend(v14, "nextObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      break;
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    objc_msgSend(v15, "parentUuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[HMDCloudChangeTree validRootUUIDs](self, "validRootUUIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "parentUuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "containsObject:", v20);

      if ((v21 & 1) == 0)
      {
        objc_msgSend(v15, "_allNodesInBranch");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v22);

      }
    }
    objc_autoreleasePoolPop(v17);
  }

  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v3, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v23;
}

- (NSArray)allTransactionStoreRowIDs
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_2:

  v8 = v7;
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "change");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (v9)
    {
      objc_msgSend(v7, "change");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rowIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v10);

      goto LABEL_2;
    }
  }

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (NSArray)orphans
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    v7 = v8;
    if (objc_msgSend(v8, "orphaned"))
    {
      objc_msgSend(v3, "addObject:", v8);
      v7 = v8;
    }
  }

  os_unfair_lock_unlock(p_lock);
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v9;
}

- (NSMutableArray)cloudChanges
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_2:

  v8 = v7;
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "change");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (v9)
    {
      objc_msgSend(v7, "change");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isInvalid");

      v8 = v7;
      if ((v11 & 1) == 0)
      {
        objc_msgSend(v7, "change");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v5);
        goto LABEL_2;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v3;
}

- (NSMutableArray)invalidCloudChanges
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_2:

  v8 = v7;
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "change");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (v9)
    {
      objc_msgSend(v7, "change");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isInvalid");

      v8 = v7;
      if (v11)
      {
        objc_msgSend(v7, "change");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v5);
        goto LABEL_2;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v3;
}

- (id)recordMapWithFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_2:

  v12 = v11;
  while (1)
  {
    objc_msgSend(v10, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      break;
    objc_msgSend(v11, "change");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "change");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isDeleted");

      v12 = v11;
      if ((v15 & 1) != 0)
        continue;
    }
    objc_msgSend(v11, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "recordName");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v9)
    {
      if (v17)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v9);
    }

    goto LABEL_2;
  }

  os_unfair_lock_unlock(p_lock);
  v19 = (void *)objc_msgSend(v7, "copy");

  return v19;
}

- (BOOL)hasValidChanges
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCloudChangeTree objectMap](self, "objectMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  while (1)
  {
    objc_msgSend(v5, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "change");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v8)
    {
      objc_msgSend(v7, "change");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isInvalid");

      v6 = v7;
      v11 = v7;
      if ((v10 & 1) == 0)
        goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_7:

  os_unfair_lock_unlock(p_lock);
  return v7 != 0;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (NSMapTable)objectMap
{
  return self->_objectMap;
}

- (void)setObjectMap:(id)a3
{
  objc_storeStrong((id *)&self->_objectMap, a3);
}

- (NSMapTable)recordMap
{
  return self->_recordMap;
}

- (void)setRecordMap:(id)a3
{
  objc_storeStrong((id *)&self->_recordMap, a3);
}

- (NSMapTable)branchMap
{
  return self->_branchMap;
}

- (void)setBranchMap:(id)a3
{
  objc_storeStrong((id *)&self->_branchMap, a3);
}

- (NSSet)validRootUUIDs
{
  return self->_validRootUUIDs;
}

- (void)setValidRootUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_validRootUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRootUUIDs, 0);
  objc_storeStrong((id *)&self->_branchMap, 0);
  objc_storeStrong((id *)&self->_recordMap, 0);
  objc_storeStrong((id *)&self->_objectMap, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_23241 != -1)
    dispatch_once(&logCategory__hmf_once_t3_23241, &__block_literal_global_23242);
  return (id)logCategory__hmf_once_v4_23243;
}

+ (BOOL)modelTypeCanBeOrphaned:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (isInternalBuild())
  {
    if (modelTypeCanBeOrphaned__pred != -1)
      dispatch_once(&modelTypeCanBeOrphaned__pred, &__block_literal_global_94);
    v4 = objc_msgSend((id)modelTypeCanBeOrphaned___models, "containsObject:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __45__HMDCloudChangeTree_modelTypeCanBeOrphaned___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8B31D28);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)modelTypeCanBeOrphaned___models;
  modelTypeCanBeOrphaned___models = v0;

}

void __33__HMDCloudChangeTree_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_23243;
  logCategory__hmf_once_v4_23243 = v0;

}

@end
