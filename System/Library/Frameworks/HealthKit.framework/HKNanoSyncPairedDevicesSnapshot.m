@implementation HKNanoSyncPairedDevicesSnapshot

- (HKNanoSyncPairedDevicesSnapshot)initWithPairedDeviceInfos:(id)a3
{
  id v5;
  HKNanoSyncPairedDevicesSnapshot *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSSet *allDeviceInfos;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKNanoSyncPairedDevicesSnapshot.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceInfos != nil"));

  }
  v21.receiver = self;
  v21.super_class = (Class)HKNanoSyncPairedDevicesSnapshot;
  v6 = -[HKNanoSyncPairedDevicesSnapshot init](&v21, sel_init);
  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v12, "isActive"))
          {
            objc_storeStrong((id *)&v6->_activeDeviceInfo, v12);
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    allDeviceInfos = v6->_allDeviceInfos;
    v6->_allDeviceInfos = (NSSet *)v13;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  HKNanoSyncPairedDeviceInfo *activeDeviceInfo;
  HKNanoSyncPairedDeviceInfo *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    activeDeviceInfo = self->_activeDeviceInfo;
    v7 = (HKNanoSyncPairedDeviceInfo *)v5[1];
    v8 = (activeDeviceInfo == v7 || v7 && -[HKNanoSyncPairedDeviceInfo isEqual:](activeDeviceInfo, "isEqual:"))
      && -[NSSet isEqualToSet:](self->_allDeviceInfos, "isEqualToSet:", v5[2]);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDeviceInfos, 0);
  objc_storeStrong((id *)&self->_activeDeviceInfo, 0);
}

- (HKNanoSyncPairedDeviceInfo)activeDeviceInfo
{
  return self->_activeDeviceInfo;
}

- (NSSet)allDeviceInfos
{
  return self->_allDeviceInfos;
}

- (id)deviceInfoForSourceBundleIdentifier:(id)a3
{
  id v5;
  NSSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKNanoSyncPairedDevicesSnapshot.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceBundleIdentifier != nil"));

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_allDeviceInfos;
  v7 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "sourceBundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_msgSend(v5, "isEqualToString:", v11) & 1) != 0)
        {
          v7 = v10;

          goto LABEL_14;
        }

      }
      v7 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKNanoSyncPairedDeviceInfo hash](self->_activeDeviceInfo, "hash");
  return -[NSSet hash](self->_allDeviceInfos, "hash") ^ v3;
}

- (id)description
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSUInteger v10;
  const char *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p devices={"), objc_opt_class(), self);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_allDeviceInfos;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if (*(HKNanoSyncPairedDeviceInfo **)(*((_QWORD *)&v13 + 1) + 8 * v8) == self->_activeDeviceInfo)
          v9 = " (active)";
        else
          v9 = "";
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@%s,"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++), v9, (_QWORD)v13);
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v10 = -[NSSet count](self->_allDeviceInfos, "count");
  v11 = "\n";
  if (!v10)
    v11 = "";
  objc_msgSend(v3, "appendFormat:", CFSTR("%s}>"), v11);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNanoSyncPairedDevicesSnapshot)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKNanoSyncPairedDevicesSnapshot *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("allDevices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[HKNanoSyncPairedDevicesSnapshot initWithPairedDeviceInfos:](self, "initWithPairedDeviceInfos:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *allDeviceInfos;
  id v4;
  id v5;

  allDeviceInfos = self->_allDeviceInfos;
  v4 = a3;
  -[NSSet allObjects](allDeviceInfos, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("allDevices"));

}

@end
