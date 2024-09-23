@implementation HMDBackingStoreCacheZone

- (HMDBackingStoreCacheZone)initWithZoneID:(int64_t)a3 name:(id)a4
{
  id v7;
  HMDBackingStoreCacheZone *v8;
  HMDBackingStoreCacheZone *v9;
  uint64_t v10;
  NSMutableArray *actualGroups;
  HMDBackingStoreCacheZone *v12;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreCacheZone;
  v8 = -[HMDBackingStoreCacheZone init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_zoneID = a3;
    objc_storeStrong((id *)&v8->_zoneName, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    actualGroups = v9->_actualGroups;
    v9->_actualGroups = (NSMutableArray *)v10;

    v12 = v9;
  }

  return v9;
}

- (id)dumpDebug
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("zone: %lu (%p)\n"), -[HMDBackingStoreCacheZone zoneID](self, "zoneID"), self);
  -[HMDBackingStoreCacheZone zoneName](self, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  name: %@\n"), v4);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDBackingStoreCacheZone actualGroups](self, "actualGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "dumpDebug");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)zoneID
{
  return self->_zoneID;
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)actualGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActualGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualGroups, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
