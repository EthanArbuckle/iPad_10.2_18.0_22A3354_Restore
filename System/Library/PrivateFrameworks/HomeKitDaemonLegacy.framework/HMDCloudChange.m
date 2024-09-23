@implementation HMDCloudChange

- (HMDCloudChange)init
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

- (id)_initWithObjectChange:(id)a3 cloudObjectRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDCloudChange *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HMDCloudChange *v19;
  HMDCloudChange *v20;
  HMDCloudChange *v21;
  uint64_t v22;
  NSMutableSet *rowIDsSet;
  void *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((v6 == 0) != (v7 != 0))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Either objectChange or cloudObjectRecord must be specified, not both", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);

LABEL_13:
    v19 = 0;
    goto LABEL_19;
  }
  if (v7)
  {
    objc_msgSend(v7, "extractObjectChange");
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v13;
  }
  if (!v6)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Could not create the object change for the given record", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    goto LABEL_13;
  }
  v14 = objc_msgSend(v6, "objectChangeType");
  if (v14 > 3)
    v15 = 0;
  else
    v15 = qword_1CDB8F6C8[v14];
  v27.receiver = self;
  v27.super_class = (Class)HMDCloudChange;
  v20 = -[HMDCloudChange init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_changeType = v15;
    objc_storeStrong((id *)&v20->_cloudRecord, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    rowIDsSet = v21->_rowIDsSet;
    v21->_rowIDsSet = (NSMutableSet *)v22;

    objc_storeStrong((id *)&v21->_objectChange, v6);
    if (!v8)
    {
      -[HMDCloudChange rowIDsSet](v21, "rowIDsSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "bsoLogRowID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v25);

    }
  }
  v10 = v21;

  v19 = v10;
LABEL_19:

  return v19;
}

- (HMDCloudChange)initWithObjectChange:(id)a3
{
  return (HMDCloudChange *)-[HMDCloudChange _initWithObjectChange:cloudObjectRecord:](self, "_initWithObjectChange:cloudObjectRecord:", a3, 0);
}

- (HMDCloudChange)initWithCloudObjectRecord:(id)a3
{
  return (HMDCloudChange *)-[HMDCloudChange _initWithObjectChange:cloudObjectRecord:](self, "_initWithObjectChange:cloudObjectRecord:", 0, a3);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDCloudChange changeType](self, "changeType");
  if (v5 > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E89B4868[v5];
  -[HMDCloudChange cloudRecord](self, "cloudRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Type = %@, Cloud Record = %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudChange shortDescription](self, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSSet)dependentUUIDs
{
  void *v2;
  void *v3;

  -[HMDCloudChange objectChange](self, "objectChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dependentUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSUUID)parentObjectID
{
  void *v2;
  void *v3;

  -[HMDCloudChange objectChange](self, "objectChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSUUID)parentUuid
{
  void *v2;
  void *v3;

  -[HMDCloudChange objectChange](self, "objectChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSUUID)objectID
{
  void *v2;
  void *v3;

  -[HMDCloudChange objectChange](self, "objectChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSUUID)uuid
{
  void *v2;
  void *v3;

  -[HMDCloudChange objectChange](self, "objectChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isAdded
{
  return -[HMDCloudChange changeType](self, "changeType") == 1;
}

- (BOOL)isUpdated
{
  return -[HMDCloudChange changeType](self, "changeType") == 2;
}

- (BOOL)isDeleted
{
  return -[HMDCloudChange changeType](self, "changeType") == 3;
}

- (BOOL)isInvalid
{
  return -[HMDCloudChange changeType](self, "changeType") == 0;
}

- (BOOL)isDropAndDoNotApply
{
  return -[HMDCloudChange applyType](self, "applyType") == 1;
}

- (BOOL)isDropAfterApply
{
  return -[HMDCloudChange applyType](self, "applyType") == 0;
}

- (BOOL)isDropStagedAfterApply
{
  return -[HMDCloudChange applyType](self, "applyType") == 2;
}

- (BOOL)isPushAfterApply
{
  return -[HMDCloudChange applyType](self, "applyType") == 3;
}

- (NSArray)rowIDs
{
  void *v2;
  void *v3;

  -[HMDCloudChange rowIDsSet](self, "rowIDsSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)forceChangeToDelete
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDCloudChange setChangeType:](self, "setChangeType:", 3);
  -[HMDCloudChange objectChange](self, "objectChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    v4 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v8, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithObjectChangeType:uuid:parentUUID:", 3, v5, v6);

    -[HMDCloudChange setObjectChange:](self, "setObjectChange:", v7);
    v3 = v8;
  }

}

- (void)forceChangeToInvalid
{
  -[HMDCloudChange setChangeType:](self, "setChangeType:", 0);
}

- (void)updateCloudRecord:(id)a3
{
  id v5;
  HMDCloudChange *v6;
  void *v7;
  int v8;
  void *v9;
  HMDCloudChange *v10;
  void *v11;
  HMDCloudChange *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCloudChange *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCloudChange *v21;
  NSObject *v22;
  void *v23;
  HMDCloudChange *v24;
  void *v25;
  HMDCloudChange *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  HMDCloudChange *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_cloudRecord, a3);
    if (!-[HMDCloudChange isDeleted](self, "isDeleted"))
    {
      objc_msgSend(v5, "extractObjectChange");
      v6 = (HMDCloudChange *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[HMDCloudChange objectChange](self, "objectChange");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[HMDCloudChange diff:differingFields:](v6, "diff:differingFields:", v7, 0);

        if (v8)
        {
          -[HMDCloudChange objectChange](self, "objectChange");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCloudChange merge:](v6, "merge:", v9);
          v10 = (HMDCloudChange *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v11 = (void *)MEMORY[0x1D17BA0A0]();
            v12 = self;
            HMFGetOSLogHandle();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = 138543618;
              v32 = v14;
              v33 = 2112;
              v34 = v10;
              _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change, merge object change with cached object change fail with error %@", (uint8_t *)&v31, 0x16u);

            }
            objc_autoreleasePoolPop(v11);
            -[HMDCloudChange objectChange](v12, "objectChange");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCloudChange setObjectChangeType:](v6, "setObjectChangeType:", objc_msgSend(v15, "objectChangeType"));

            -[HMDCloudChange setObjectChange:](v12, "setObjectChange:", v6);
            -[HMDCloudChange setChangeType:](v12, "setChangeType:", 0);
          }
          else
          {
            -[HMDCloudChange objectChange](self, "objectChange");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCloudChange setObjectChangeType:](v6, "setObjectChangeType:", objc_msgSend(v30, "objectChangeType"));

            -[HMDCloudChange setObjectChange:](self, "setObjectChange:", v6);
          }

          goto LABEL_22;
        }
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v28;
          v33 = 2112;
          v34 = v6;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Local changes will not modify cloud record, dropping local changes: %@", (uint8_t *)&v31, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        -[HMDCloudChange objectChange](v26, "objectChange");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCloudChange setObjectChangeType:](v6, "setObjectChangeType:", objc_msgSend(v29, "objectChangeType"));

        -[HMDCloudChange setObjectChange:](v26, "setObjectChange:", v6);
        v24 = v26;
      }
      else
      {
        if (-[HMDCloudChange isAdded](self, "isAdded"))
        {
LABEL_22:

          goto LABEL_23;
        }
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v23;
          v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change, cannot add a new record unless the change type is added, %@", (uint8_t *)&v31, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        v24 = v21;
      }
      -[HMDCloudChange setChangeType:](v24, "setChangeType:", 0);
      goto LABEL_22;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update cloud record without cloudRecord", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }
LABEL_23:

}

- (void)updateDeletedCloudRecord:(id)a3
{
  id v5;
  void *v6;
  HMDCloudChange *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_deletedCloudRecord, a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Cannot update deleted cloud record without cloudRecord", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)updateWithObjectChange:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudChange *v11;
  uint64_t v12;
  void *v13;
  HMDCloudChange *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCloudChange *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  void *v22;
  HMDCloudChange *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCloudChange *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "objectChangeType");
  v6 = 0;
  v7 = 1;
  switch(v5)
  {
    case 0:
      v7 = 0;
      v6 = 0;
      v5 = 2;
      break;
    case 1:
      break;
    case 2:
      v7 = 0;
      v6 = 0;
      break;
    case 3:
      v7 = 0;
      v6 = 1;
      break;
    default:
      v7 = 0;
      v6 = 0;
      v5 = 0;
      break;
  }
  if (!-[HMDCloudChange isAdded](self, "isAdded") && !-[HMDCloudChange isUpdated](self, "isUpdated"))
  {
    if (-[HMDCloudChange isDeleted](self, "isDeleted"))
    {
      switch(v5)
      {
        case 3:
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_42;
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v34 = 138543618;
          *(_QWORD *)&v34[4] = v20;
          *(_WORD *)&v34[12] = 2112;
          *(_QWORD *)&v34[14] = v4;
          v21 = "%{public}@Object is already deleted, dropping delete %@";
          break;
        case 2:
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_42;
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v34 = 138543618;
          *(_QWORD *)&v34[4] = v20;
          *(_WORD *)&v34[12] = 2112;
          *(_QWORD *)&v34[14] = v4;
          v21 = "%{public}@Retaining 'delete' change, cannot convert a delete to an update, %@";
          break;
        case 1:
          v11 = self;
          v12 = 1;
          goto LABEL_14;
        default:
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          goto LABEL_22;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v34 = 138543618;
      *(_QWORD *)&v34[4] = v20;
      *(_WORD *)&v34[12] = 2112;
      *(_QWORD *)&v34[14] = v4;
      v21 = "%{public}@Change has already be invalidated, dropping further changes %@";
    }
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, v21, v34, 0x16u);
    goto LABEL_41;
  }
  if ((unint64_t)(v5 - 1) > 1)
  {
    if (v6)
    {
      v11 = self;
      v12 = 3;
LABEL_14:
      -[HMDCloudChange setChangeType:](v11, "setChangeType:", v12);
      -[HMDCloudChange setObjectChange:](self, "setObjectChange:", v4);
      goto LABEL_43;
    }
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_21:
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v34 = 138543618;
      *(_QWORD *)&v34[4] = v16;
      *(_WORD *)&v34[12] = 2112;
      *(_QWORD *)&v34[14] = v4;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change because object change in unknown type, %@", v34, 0x16u);

    }
LABEL_22:

    objc_autoreleasePoolPop(v13);
    -[HMDCloudChange setChangeType:](v14, "setChangeType:", 0);
    goto LABEL_43;
  }
  -[HMDCloudChange objectChange](self, "objectChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCloudChange objectChange](self, "objectChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "merge:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_33;
LABEL_30:
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v34 = 138543618;
      *(_QWORD *)&v34[4] = v29;
      *(_WORD *)&v34[12] = 2112;
      *(_QWORD *)&v34[14] = v10;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change because merge object change fail with error %@", v34, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    -[HMDCloudChange setChangeType:](v27, "setChangeType:", 0);

    goto LABEL_43;
  }
  if (v7)
  {
    -[HMDCloudChange setObjectChange:](self, "setObjectChange:", v4);
    goto LABEL_33;
  }
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 138543362;
    *(_QWORD *)&v34[4] = v25;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot merge updated change into an add because object change does not exist", v34, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_30;
LABEL_33:
  if ((v7 & -[HMDCloudChange isUpdated](self, "isUpdated")) == 1)
  {
    -[HMDCloudChange objectChange](self, "objectChange");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObjectChangeType:", 1);

    v17 = (void *)MEMORY[0x1D17BA0A0](-[HMDCloudChange setChangeType:](self, "setChangeType:", 1));
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChange objectChange](v18, "objectChange");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v34 = 138543618;
      *(_QWORD *)&v34[4] = v20;
      *(_WORD *)&v34[12] = 2112;
      *(_QWORD *)&v34[14] = v31;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Changing update change back to an add %@", v34, 0x16u);

LABEL_41:
    }
LABEL_42:

    objc_autoreleasePoolPop(v17);
  }
LABEL_43:
  -[HMDCloudChange rowIDsSet](self, "rowIDsSet", *(_OWORD *)v34, *(_QWORD *)&v34[16], v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "bsoLogRowID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v33);

}

- (CKRecord)record
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[HMDCloudChange cloudRecord](self, "cloudRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[HMDCloudChange cloudRecord](self, "cloudRecord"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMDCloudChange objectChange](self, "objectChange"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "encodeObjectChange:", v5),
        v5,
        v4,
        v6))
  {
    -[HMDCloudChange cloudRecord](self, "cloudRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "record");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (CKRecord *)v8;
}

- (NSString)recordName
{
  void *v2;
  void *v3;

  -[HMDCloudChange cloudRecord](self, "cloudRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)type
{
  void *v2;
  void *v3;

  -[HMDCloudChange objectChange](self, "objectChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bsoType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CKRecordID)recordID
{
  void *v2;
  void *v3;

  -[HMDCloudChange cloudRecord](self, "cloudRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordID *)v3;
}

- (void)updateChangeWithRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudChange cloudRecord](self, "cloudRecord");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecord:", v4);

}

- (void)resetRecord
{
  id v2;

  -[HMDCloudChange cloudRecord](self, "cloudRecord");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRecord:", 0);

}

- (void)replayChange:(id)a3 stagedChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  HMDCloudChange *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDCloudChange *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDCloudChange *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDCloudChange *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[HMDCloudChange objectChange](self, "objectChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isReplayable");

    if ((v9 & 1) != 0)
    {
      if (-[HMDCloudChange isAdded](self, "isAdded") || -[HMDCloudChange isUpdated](self, "isUpdated"))
      {
        if (objc_msgSend(v7, "isDeleted"))
        {
          if (-[HMDCloudChange isDeleted](self, "isDeleted"))
          {
            v10 = self;
            v11 = 2;
          }
          else
          {
            v10 = self;
            v11 = 1;
          }
          goto LABEL_9;
        }
        -[HMDCloudChange objectChange](self, "objectChange");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v6, "objectChange");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          objc_msgSend(v12, "diff:differingFields:", v13, &v41);
          v14 = v41;

          if (objc_msgSend(v14, "count"))
          {
            v15 = (void *)MEMORY[0x1D17BA0A0]();
            v16 = self;
            HMFGetOSLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectChange");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v43 = v18;
              v44 = 2112;
              v45 = v19;
              v46 = 2112;
              v47 = v14;
              _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Must replay change from cloud: object %@ has diff %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v15);
            -[HMDCloudChange objectChange](v16, "objectChange");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectChange");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "merge:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = (void *)MEMORY[0x1D17BA0A0]();
              v24 = v16;
              HMFGetOSLogHandle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "objectChange");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v43 = v26;
                v44 = 2112;
                v45 = v27;
                v46 = 2112;
                v47 = v22;
                _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to replay: object %@ with error %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v23);
              -[HMDCloudChange setApplyType:](v24, "setApplyType:", 2);
              -[HMDCloudChange rowIDsSet](v24, "rowIDsSet");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "rowIDs");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObjectsFromArray:", v29);

            }
            else
            {
              -[HMDCloudChange setApplyType:](v16, "setApplyType:", 3);
            }

            goto LABEL_30;
          }
        }
        else
        {
          objc_msgSend(v7, "objectChange");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          objc_msgSend(v12, "diff:differingFields:", v35, &v40);
          v14 = v40;

          if (objc_msgSend(v14, "count"))
          {
            v36 = (void *)MEMORY[0x1D17BA0A0]();
            v37 = self;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v43 = v39;
              v44 = 2112;
              v45 = v7;
              v46 = 2112;
              v47 = v14;
              _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Change from cloud: object %@ has diff %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v36);
          }
        }
        -[HMDCloudChange setApplyType:](self, "setApplyType:", 3);
LABEL_30:

        goto LABEL_31;
      }
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      self = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v32;
        v44 = 2112;
        v45 = v7;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Change cannot be process further, dropping changes %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
    }
    -[HMDCloudChange setApplyType:](self, "setApplyType:", 2);
    -[HMDCloudChange rowIDsSet](self, "rowIDsSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rowIDs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v34);

    goto LABEL_31;
  }
  v10 = self;
  v11 = 0;
LABEL_9:
  -[HMDCloudChange setApplyType:](v10, "setApplyType:", v11);
LABEL_31:

}

- (HMDBackingStoreModelObject)objectChange
{
  return self->_objectChange;
}

- (void)setObjectChange:(id)a3
{
  objc_storeStrong((id *)&self->_objectChange, a3);
}

- (HMDCloudRecord)cloudRecord
{
  return self->_cloudRecord;
}

- (HMDCloudRecord)deletedCloudRecord
{
  return self->_deletedCloudRecord;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (unint64_t)applyType
{
  return self->_applyType;
}

- (void)setApplyType:(unint64_t)a3
{
  self->_applyType = a3;
}

- (NSMutableSet)rowIDsSet
{
  return self->_rowIDsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowIDsSet, 0);
  objc_storeStrong((id *)&self->_deletedCloudRecord, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_objectChange, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
