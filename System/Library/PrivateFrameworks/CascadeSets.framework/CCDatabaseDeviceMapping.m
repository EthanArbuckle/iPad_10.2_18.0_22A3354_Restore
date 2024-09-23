@implementation CCDatabaseDeviceMapping

- (CCDatabaseDeviceMapping)initWithDeviceRecords:(id)a3
{
  CCDatabaseDeviceMapping *v4;
  uint64_t v5;
  NSMutableDictionary *deviceRowIdMap;
  uint64_t v7;
  NSMutableDictionary *siteIdentifierMap;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  id v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CCDatabaseDeviceMapping;
  v4 = -[CCDatabaseDeviceMapping init](&v28, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v21, "count"));
    deviceRowIdMap = v4->_deviceRowIdMap;
    v4->_deviceRowIdMap = (NSMutableDictionary *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v21, "count"));
    siteIdentifierMap = v4->_siteIdentifierMap;
    v4->_siteIdentifierMap = (NSMutableDictionary *)v7;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v21;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v9)
    {
      v23 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v23)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v11, "deviceRowId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deviceId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dataUsingEncoding:", 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v31 = &v30;
          v32 = 0x2050000000;
          v15 = (void *)getCKDistributedSiteIdentifierClass_softClass;
          v33 = getCKDistributedSiteIdentifierClass_softClass;
          if (!getCKDistributedSiteIdentifierClass_softClass)
          {
            v29[0] = MEMORY[0x24BDAC760];
            v29[1] = 3221225472;
            v29[2] = __getCKDistributedSiteIdentifierClass_block_invoke;
            v29[3] = &unk_2509903C8;
            v29[4] = &v30;
            __getCKDistributedSiteIdentifierClass_block_invoke((uint64_t)v29);
            v15 = (void *)v31[3];
          }
          v16 = objc_retainAutorelease(v15);
          _Block_object_dispose(&v30, 8);
          v17 = (void *)objc_msgSend([v16 alloc], "initWithIdentifier:", v14);
          v18 = v4->_deviceRowIdMap;
          objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v11, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, v12);

          -[NSMutableDictionary setObject:forKey:](v4->_siteIdentifierMap, "setObject:forKey:", v12, v17);
          if ((objc_msgSend(v11, "options") & 1) != 0)
            objc_storeStrong((id *)&v4->_localDeviceIdentifier, v13);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v9);
    }

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCDatabaseDeviceMapping;
  -[CCDatabaseDeviceMapping description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), self->_deviceRowIdMap);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_deviceRowIdMap, "count");
}

- (id)deviceRecordForDeviceRowId:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_deviceRowIdMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)siteIdentifierForDeviceRowId:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_deviceRowIdMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceRowIdForSiteIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_siteIdentifierMap, "objectForKey:", a3);
}

- (id)localDeviceIdentifier
{
  return self->_localDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_siteIdentifierMap, 0);
  objc_storeStrong((id *)&self->_deviceRowIdMap, 0);
}

@end
