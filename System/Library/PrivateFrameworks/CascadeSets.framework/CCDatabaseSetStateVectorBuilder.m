@implementation CCDatabaseSetStateVectorBuilder

- (CCDatabaseSetStateVectorBuilder)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCDatabaseSetStateVectorBuilder)initWithDeviceMapping:(id)a3 missingAtomsImplied:(BOOL)a4
{
  id v7;
  CCDatabaseSetStateVectorBuilder *v8;
  CCDatabaseSetStateVectorBuilder *v9;
  uint64_t v10;
  NSMutableDictionary *allDeviceClockValues;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCDatabaseSetStateVectorBuilder;
  v8 = -[CCDatabaseSetStateVectorBuilder init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deviceMapping, a3);
    v9->_missingAtomsImplied = a4;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[CCDatabaseDeviceMapping count](v9->_deviceMapping, "count"));
    allDeviceClockValues = v9->_allDeviceClockValues;
    v9->_allDeviceClockValues = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (id)_indexSetForAtomState:(unsigned __int8)a3 deviceRowId:(id)a4 maxIndex:(unint64_t)a5
{
  int v7;
  id v9;
  CCDatabaseDeviceClockValues *v10;
  CCDatabaseDeviceClockValues *deviceClockValues;
  CCDatabaseDeviceClockValues *v12;
  CCDatabaseDeviceClockValues *v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isEqual:", self->_lastDeviceRowId) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastDeviceRowId, a4);
    -[NSMutableDictionary objectForKey:](self->_allDeviceClockValues, "objectForKey:", self->_lastDeviceRowId);
    v10 = (CCDatabaseDeviceClockValues *)objc_claimAutoreleasedReturnValue();
    deviceClockValues = self->_deviceClockValues;
    self->_deviceClockValues = v10;

    if (!self->_deviceClockValues)
    {
      v12 = -[CCDatabaseDeviceClockValues initWithDeviceRowId:missingAtomsImplied:]([CCDatabaseDeviceClockValues alloc], "initWithDeviceRowId:missingAtomsImplied:", self->_lastDeviceRowId, self->_missingAtomsImplied);
      v13 = self->_deviceClockValues;
      self->_deviceClockValues = v12;

      -[NSMutableDictionary setObject:forKey:](self->_allDeviceClockValues, "setObject:forKey:", self->_deviceClockValues, self->_lastDeviceRowId);
    }
  }
  -[CCDatabaseDeviceClockValues updateMax:](self->_deviceClockValues, "updateMax:", a5);
  switch(v7)
  {
    case 3:
      -[CCDatabaseDeviceClockValues missing](self->_deviceClockValues, "missing");
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CCDatabaseDeviceClockValues tombstoned](self->_deviceClockValues, "tombstoned");
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CCDatabaseDeviceClockValues present](self->_deviceClockValues, "present");
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v15 = 0;
      goto LABEL_12;
  }
  v15 = (void *)v14;
LABEL_12:

  return v15;
}

- (void)addClockValue:(unint64_t)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5
{
  id v6;

  -[CCDatabaseSetStateVectorBuilder _indexSetForAtomState:deviceRowId:maxIndex:](self, "_indexSetForAtomState:deviceRowId:maxIndex:", a4, a5, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addIndex:", a3);

}

- (void)addClockValueRange:(_NSRange)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a3.length;
  location = a3.location;
  -[CCDatabaseSetStateVectorBuilder _indexSetForAtomState:deviceRowId:maxIndex:](self, "_indexSetForAtomState:deviceRowId:maxIndex:", a4, a5, a3.length + a3.location - 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndexesInRange:", location, length);

}

- (void)addClockValueSet:(id)a3 withAtomState:(unsigned __int8)a4 forDeviceRowId:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CCDatabaseSetStateVectorBuilder _indexSetForAtomState:deviceRowId:maxIndex:](self, "_indexSetForAtomState:deviceRowId:maxIndex:", v5, v8, objc_msgSend(v9, "lastIndex"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addIndexes:", v9);
}

- (id)build
{
  void *v3;
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  CCDatabaseDeviceMapping *deviceMapping;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t v28[128];
  _BYTE buf[24];
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v3 = (void *)getCKDistributedTimestampStateVectorClass_softClass_2;
  v27 = getCKDistributedTimestampStateVectorClass_softClass_2;
  if (!getCKDistributedTimestampStateVectorClass_softClass_2)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCKDistributedTimestampStateVectorClass_block_invoke_2;
    v30 = &unk_2509903C8;
    v31 = &v24;
    __getCKDistributedTimestampStateVectorClass_block_invoke_2((uint64_t)buf);
    v3 = (void *)v25[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v24, 8);
  v5 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_allDeviceClockValues;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v8 = 138412802;
    v19 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_allDeviceClockValues, "objectForKey:", v11, v19, (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CCDatabaseDeviceMapping siteIdentifierForDeviceRowId:](self->_deviceMapping, "siteIdentifierForDeviceRowId:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (self->_missingAtomsImplied)
            objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v12, "max"));
          else
            objc_msgSend(v12, "missing");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addClockValuesInIndexSet:withAtomState:forSiteIdentifier:", v16, 3, v13);

          objc_msgSend(v12, "present");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addClockValuesInIndexSet:withAtomState:forSiteIdentifier:", v17, 1, v13);

          objc_msgSend(v12, "tombstoned");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addClockValuesInIndexSet:withAtomState:forSiteIdentifier:", v14, 2, v13);
        }
        else
        {
          __biome_log_for_category();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            deviceMapping = self->_deviceMapping;
            *(_DWORD *)buf = v19;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = deviceMapping;
            *(_WORD *)&buf[22] = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_237B25000, v14, OS_LOG_TYPE_ERROR, "Ignoring provenance row(s) for deviceRowId: %@ without a siteIdentifier mapping: %@ clockValues: %@", buf, 0x20u);
          }
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClockValues, 0);
  objc_storeStrong((id *)&self->_lastDeviceRowId, 0);
  objc_storeStrong((id *)&self->_allDeviceClockValues, 0);
  objc_storeStrong((id *)&self->_deviceMapping, 0);
}

@end
