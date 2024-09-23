@implementation CCDatabaseSetStateReader

- (CCDatabaseSetStateReader)initWithDatabaseAccess:(id)a3
{
  id v5;
  CCDatabaseSetStateReader *v6;
  CCDatabaseSetStateReader *v7;
  uint64_t v8;
  NSMutableDictionary *commandCache;
  CCDatabaseSetStateReader *v10;
  NSObject *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCDatabaseSetStateReader;
  v6 = -[CCDatabaseSetStateReader init](&v13, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  objc_storeStrong((id *)&v6->_databaseAccess, a3);
  if (v7->_databaseAccess)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
    commandCache = v7->_commandCache;
    v7->_commandCache = (NSMutableDictionary *)v8;

LABEL_4:
    v10 = v7;
    goto LABEL_8;
  }
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetStateReader initWithDatabaseAccess:].cold.1(v11);

  v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)constructStateVectorsFromDatabaseOutContent:(id *)a3 outMetaContent:(id *)a4 outDeviceMapping:(id *)a5 error:(id *)a6
{
  void *v11;
  CCDatabaseSetStateVectorBuilder *v12;
  BOOL v13;
  CCDatabaseSetStateVectorBuilder *v14;
  void *v15;
  void *v16;
  void *v17;
  CCDatabaseSetStateVectorBuilder *v18;
  CCDatabaseSetStateVectorBuilder *v19;
  id v20;
  id *v22;
  id *v23;
  _QWORD v24[4];
  CCDatabaseSetStateVectorBuilder *v25;
  CCDatabaseSetStateVectorBuilder *v26;
  id v27;

  -[CCDatabaseSetStateReader constructDeviceMapping:](self, "constructDeviceMapping:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v23 = a5;
    if (a3)
      v12 = -[CCDatabaseSetStateVectorBuilder initWithDeviceMapping:missingAtomsImplied:]([CCDatabaseSetStateVectorBuilder alloc], "initWithDeviceMapping:missingAtomsImplied:", v11, 1);
    else
      v12 = 0;
    v22 = a4;
    if (a4)
      v14 = -[CCDatabaseSetStateVectorBuilder initWithDeviceMapping:missingAtomsImplied:]([CCDatabaseSetStateVectorBuilder alloc], "initWithDeviceMapping:missingAtomsImplied:", v11, 1);
    else
      v14 = 0;
    +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "build");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x23B82079C]();
    v27 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __110__CCDatabaseSetStateReader_constructStateVectorsFromDatabaseOutContent_outMetaContent_outDeviceMapping_error___block_invoke;
    v24[3] = &unk_250990688;
    v18 = v12;
    v25 = v18;
    v19 = v14;
    v26 = v19;
    v13 = -[CCDatabaseSetStateReader _enumerateProvenanceRecordsFromCommand:error:usingBlock:](self, "_enumerateProvenanceRecordsFromCommand:error:usingBlock:", v16, &v27, v24);
    v20 = v27;

    objc_autoreleasePoolPop(v17);
    if (v13)
    {
      if (a3)
      {
        -[CCDatabaseSetStateVectorBuilder build](v18, "build");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v22)
      {
        -[CCDatabaseSetStateVectorBuilder build](v19, "build");
        *v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v23)
        *v23 = objc_retainAutorelease(v11);
    }
    else
    {
      CCSetError(a6, v20);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __110__CCDatabaseSetStateReader_constructStateVectorsFromDatabaseOutContent_outMetaContent_outDeviceMapping_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v3 = a2;
  v23 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "contentSequenceNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentSequenceNumberEndOfRun");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CCDatabaseSetClockValueRange(v4, v5);
    v8 = v7;

    objc_msgSend(v23, "contentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CCDatabaseSetAtomState(v9);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v23, "deviceRowId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addClockValueRange:withAtomState:forDeviceRowId:", v6, v8, v10, v12);

    v3 = v23;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v23, "metaContentSequenceNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v23;
    if (v13)
    {
      objc_msgSend(v23, "metaContentSequenceNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "metaContentSequenceNumberEndOfRun");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CCDatabaseSetClockValueRange(v14, v15);
      v18 = v17;

      objc_msgSend(v23, "metaContentState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CCDatabaseSetAtomState(v19);

      v21 = *(void **)(a1 + 40);
      objc_msgSend(v23, "deviceRowId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addClockValueRange:withAtomState:forDeviceRowId:", v16, v18, v20, v22);

      v3 = v23;
    }
  }

}

- (BOOL)enumerateProvenanceRecordsForStateVector:(id)a3 withType:(unsigned __int8)a4 selectAtomsInState:(unsigned __int8)a5 skipOverAtomsInState:(unsigned __int8)a6 deviceMapping:(id)a7 error:(id *)a8 usingBlock:(id)a9
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  BOOL v26;
  void *v27;
  unsigned int v31;
  id v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  char v40;
  char v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  char v47;
  unsigned __int8 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v34 = a5;
  v31 = a4;
  v58 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v35 = a7;
  v32 = a9;
  v36 = v11;
  objc_msgSend(v11, "clockVector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "timestampCount");

  if (v13)
  {
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v33 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v36, "allSiteIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    v16 = MEMORY[0x24BDAC760];
    if (v15)
    {
      v17 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v35, "deviceRowIdForSiteIdentifier:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_opt_new();
          v44[0] = v16;
          v44[1] = 3221225472;
          v44[2] = __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke;
          v44[3] = &unk_2509906B0;
          v47 = v34;
          v48 = a6;
          v22 = v21;
          v45 = v22;
          v46 = &v53;
          objc_msgSend(v36, "enumerateClockValuesForSiteIdentifier:usingBlock:", v19, v44);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v22, v20);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v15);
    }

    if ((unint64_t)v54[3] < 0x1F5)
    {
      v24 = v33;
      v25 = (void *)MEMORY[0x23B820934](v32);
    }
    else
    {
      v42[0] = v16;
      v42[1] = 3221225472;
      v42[2] = __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_5;
      v42[3] = &unk_2509906D8;
      v23 = (id)objc_opt_new();
      v43 = v23;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v42);
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2;
      v37[3] = &unk_250990700;
      v38 = v33;
      v40 = v31;
      v41 = v34;
      v39 = v32;
      v24 = v23;
      v25 = (void *)MEMORY[0x23B820934](v37);

    }
    -[CCDatabaseSetStateReader _createProvenanceSelectCommandFromDeviceRowIdToClockValues:type:state:columns:](self, "_createProvenanceSelectCommandFromDeviceRowIdToClockValues:type:state:columns:", v24, v31, v34, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      v26 = -[CCDatabaseSetStateReader _enumerateProvenanceRecordsFromCommand:error:usingBlock:](self, "_enumerateProvenanceRecordsFromCommand:error:usingBlock:", v27, a8, v25);
    else
      v26 = 0;

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    v26 = 1;
  }

  return v26;
}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int8 *)(a1 + 48) == a5 || *(unsigned __int8 *)(a1 + 49) == a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(unsigned __int8 *)(a1 + 48);
      v11 = 134218752;
      v12 = a2;
      v13 = 2048;
      v14 = a2 + a3;
      v15 = 1024;
      v16 = a5;
      v17 = 1024;
      v18 = v10;
      _os_log_debug_impl(&dword_237B25000, v9, OS_LOG_TYPE_DEBUG, "Enumerating clock value (%lu - %lu) which is in state %u when expecting to enumerate clock values in state %u", (uint8_t *)&v11, 0x22u);
    }

  }
}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "addIndexesInRange:", objc_msgSend(v5, "firstIndex"), objc_msgSend(v5, "lastIndex") - objc_msgSend(v5, "firstIndex") + 1);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "deviceRowId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48) == 1)
  {
    objc_msgSend(v3, "metaContentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metaContentSequenceNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metaContentSequenceNumberEndOfRun");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
    {
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2_cold_1(a1 + 48, v15, v16, v17, v18, v19, v20, v21);

      v7 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v3, "contentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSequenceNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSequenceNumberEndOfRun");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = CCDatabaseSetClockValueRange(v8, v9);
  v13 = v12;

  v14 = *(unsigned __int8 *)(a1 + 49);
  if (v14 != 2)
  {
    if (v14 != 1
      || objc_msgSend(v7, "unsignedIntValue") != 1
      || (objc_msgSend(v6, "containsIndexesInRange:", v11, v13) & 1) == 0)
    {
      goto LABEL_16;
    }
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "unsignedIntValue") == 2
    && objc_msgSend(v6, "intersectsIndexesInRange:", v11, v13))
  {
    goto LABEL_15;
  }
LABEL_16:

}

- (id)constructDeviceMapping:(id *)a3
{
  void *v5;
  void *v6;
  CCDatabaseReadOnlyAccess *databaseAccess;
  uint64_t v8;
  CCDatabaseDeviceMapping *v9;
  CCDatabaseDeviceMapping *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  databaseAccess = self->_databaseAccess;
  v8 = objc_opt_class();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__CCDatabaseSetStateReader_constructDeviceMapping___block_invoke;
  v12[3] = &unk_250990728;
  v12[4] = &v13;
  if ((-[CCDatabaseReadOnlyAccess enumerateRecordResultsOfSelect:recordClass:error:usingBlock:](databaseAccess, "enumerateRecordResultsOfSelect:recordClass:error:usingBlock:", v6, v8, a3, v12) & 1) != 0)
  {
    v9 = [CCDatabaseDeviceMapping alloc];
    v10 = -[CCDatabaseDeviceMapping initWithDeviceRecords:](v9, "initWithDeviceRecords:", v14[5]);
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __51__CCDatabaseSetStateReader_constructDeviceMapping___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

- (id)fetchContentRecordFromContentHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CCDatabaseReadOnlyAccess *databaseAccess;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1BB0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "updateParameters:", v5) & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_hash"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCommandCriterion:", v9);
    objc_msgSend(v8, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v7, &unk_2509A1BB0);
    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:].cold.2();

    }
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  databaseAccess = self->_databaseAccess;
  v12 = objc_opt_class();
  v18[4] = &v20;
  v19 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__CCDatabaseSetStateReader_fetchContentRecordFromContentHash___block_invoke;
  v18[3] = &unk_250990728;
  v13 = -[CCDatabaseReadOnlyAccess enumerateRecordResultsOfSelect:recordClass:error:usingBlock:](databaseAccess, "enumerateRecordResultsOfSelect:recordClass:error:usingBlock:", v7, v12, &v19, v18);
  v14 = v19;
  if ((v13 & 1) != 0)
  {
    v15 = (id)v21[5];
  }
  else
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:].cold.1();

    v15 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v15;
}

uint64_t __62__CCDatabaseSetStateReader_fetchContentRecordFromContentHash___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
  return 1;
}

- (BOOL)_enumerateProvenanceRecordsFromCommand:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *, _BYTE *);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  char v21;

  v8 = a3;
  v9 = (void (**)(id, void *, _BYTE *))a5;
  -[CCDatabaseReadOnlyAccess enumeratorForRowResultsOfSelect:error:](self->_databaseAccess, "enumeratorForRowResultsOfSelect:error:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v21 = 0;
    objc_msgSend(v10, "next");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      while (1)
      {
        v14 = (void *)MEMORY[0x23B82079C]();
        objc_msgSend((id)objc_opt_class(), "recordFromDatabaseValueRow:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v9[2](v9, v15, &v21);
          if (v21)
            break;
        }

        objc_autoreleasePoolPop(v14);
        objc_msgSend(v11, "next");
        v16 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v16;
        if (!v16)
          goto LABEL_10;
      }

      objc_autoreleasePoolPop(v14);
    }
LABEL_10:
    objc_msgSend(v11, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v18 == 0;
    if (v18)
    {
      objc_msgSend(v11, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError(a4, v19);

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)provenanceRecordEnumeratorForContentDeltaVector:(id)a3 metaContentDeltaVector:(id)a4 seenContentBuilder:(id)a5 seenMetaContentBuilder:(id)a6 deviceMapping:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CCSQLCommandJoinTable *v19;
  void *v20;
  CCSQLCommandJoinTable *v21;
  CCSQLCommandJoinTable *v22;
  void *v23;
  CCSQLCommandJoinTable *v24;
  void *v25;
  id v26;
  id v27;
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
  CCSQLCommandOrder *v42;
  void *v43;
  CCSQLCommandOrder *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v58[2];
  _QWORD v59[3];
  _QWORD v60[2];
  void *v61;
  _QWORD v62[2];
  _QWORD v63[5];

  v63[3] = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  v52 = a6;
  v49 = a5;
  v50 = a4;
  v13 = a3;
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("provenance"), CFSTR("*"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v15;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("content"), CFSTR("content"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v16;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("metacontent"), CFSTR("metacontent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v14;
  objc_msgSend(v14, "setColumns:", v18);

  v19 = [CCSQLCommandJoinTable alloc];
  +[CCSQLCommandJoinCriterion criterionWithColumnName:onTable:EQUALSColumnName:comparingTableName:](CCSQLCommandJoinCriterion, "criterionWithColumnName:onTable:EQUALSColumnName:comparingTableName:", CFSTR("content_hash"), CFSTR("provenance"), CFSTR("content_hash"), CFSTR("content"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CCSQLCommandJoinTable initWithTable:joinCriterion:](v19, "initWithTable:joinCriterion:", CFSTR("content"), v20);
  v62[0] = v21;
  v22 = [CCSQLCommandJoinTable alloc];
  +[CCSQLCommandJoinCriterion criterionWithColumnName:onTable:EQUALSColumnName:comparingTableName:](CCSQLCommandJoinCriterion, "criterionWithColumnName:onTable:EQUALSColumnName:comparingTableName:", CFSTR("instance_hash"), CFSTR("provenance"), CFSTR("instance_hash"), CFSTR("metacontent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[CCSQLCommandJoinTable initWithTable:joinCriterion:](v22, "initWithTable:joinCriterion:", CFSTR("metacontent"), v23);
  v62[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setJoinWithType:tables:", 2, v25);

  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CCDatabaseSetStateReader _resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:](self, "_resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:", v13, v26, v49, v12, 0);

  v27 = v26;
  v54 = v26;
  -[CCDatabaseSetStateReader _resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:](self, "_resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:", v50, v26, v52, v12, 1);

  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("provenance"), CFSTR("content_hash"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setColumns:", v30);

  +[CCSQLCommandCriterion criterionWithORSubCriteria:](CCSQLCommandCriterion, "criterionWithORSubCriteria:", v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v28;
  objc_msgSend(v28, "setCommandCriterion:", v31);

  objc_msgSend(v28, "build");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("provenance"), CFSTR("content_hash"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:INSubQuery:](CCSQLCommandCriterion, "criterionWithColumnName:INSubQuery:", v48, v51);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v32;
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v33;
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("metacontent_state"), &unk_2509A1BE0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v34;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:ISNOTColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:ISNOTColumnValue:", CFSTR("metacontent_state"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithNOTSubCriteria:](CCSQLCommandCriterion, "criterionWithNOTSubCriteria:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "setCommandCriterion:", v41);
  v42 = [CCSQLCommandOrder alloc];
  v58[0] = CFSTR("content_hash");
  v58[1] = CFSTR("content_state");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[CCSQLCommandOrder initWithOrderMode:columnNames:](v42, "initWithOrderMode:columnNames:", 2, v43);

  objc_msgSend(v55, "setCommandOrder:", v44);
  objc_msgSend(v55, "build");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCDatabaseReadOnlyAccess enumeratorForRowResultsOfSelect:error:](self->_databaseAccess, "enumeratorForRowResultsOfSelect:error:", v45, a8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (void)_resolveSequenceNumberRangesOfDeltaVector:(id)a3 appendToCriteria:(id)a4 seenStateVectorBuilder:(id)a5 deviceMapping:(id)a6 type:(unsigned __int8)a7
{
  uint64_t v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString **v17;
  __CFString **v18;
  __CFString *v19;
  __CFString *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  NSObject *v42;
  void *v43;
  id obj;
  id v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  NSObject *v54;
  __CFString *v55;
  _BYTE v56[128];
  uint64_t v57;

  v7 = a7;
  v57 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v47 = a4;
  v45 = a5;
  v48 = a6;
  objc_msgSend(v11, "removals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allSiteIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v46 = v11;
  objc_msgSend(v11, "contents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allSiteIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  if (!(_DWORD)v7)
  {
    v17 = CCDatabaseColumnContentSequenceNumber;
    v18 = CCDatabaseColumnContentState;
    goto LABEL_5;
  }
  if ((_DWORD)v7 == 1)
  {
    v17 = CCDatabaseColumnMetaContentSequenceNumber;
    v18 = CCDatabaseColumnMetaContentState;
LABEL_5:
    v19 = *v18;
    v20 = *v17;
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_27;
    v53[3] = &unk_250990778;
    v42 = v19;
    v54 = v42;
    v41 = v20;
    v55 = v41;
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x23B820934](v53);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v43 = v14;
    obj = v14;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v50 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v48, "deviceRowIdForSiteIdentifier:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = objc_alloc_init(MEMORY[0x24BDD1698]);
            v29 = objc_alloc_init(MEMORY[0x24BDD1698]);
            objc_msgSend(v46, "removals");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke((uint64_t)v30, v30, v26, v28, v29);

            objc_msgSend(v45, "addClockValueSet:withAtomState:forDeviceRowId:", v29, 2, v27);
            objc_msgSend(v46, "contents");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke((uint64_t)v31, v31, v26, v28, v29);

            if (objc_msgSend(v28, "count"))
            {
              ((void (**)(_QWORD, void *, id, uint64_t))v21)[2](v21, v27, v28, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v32);

            }
            if (objc_msgSend(v29, "count"))
            {
              ((void (**)(_QWORD, void *, id, uint64_t))v21)[2](v21, v27, v29, 2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v33);

            }
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v23);
    }

    v34 = v42;
    v14 = v43;
    goto LABEL_21;
  }
  __biome_log_for_category();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetStateReader _resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:].cold.1(v7, v34, v35, v36, v37, v38, v39, v40);
LABEL_21:

}

void __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_2;
  v12[3] = &unk_250990750;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a2, "enumerateClockValuesForSiteIdentifier:usingBlock:", a3, v12);

}

uint64_t __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id *v5;

  if (a5 == 2)
  {
    v5 = (id *)(result + 40);
  }
  else
  {
    if (a5 != 1)
      return result;
    v5 = (id *)(result + 32);
  }
  return objc_msgSend(*v5, "addIndexesInRange:", a2, a3);
}

id __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_27(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "firstIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD16E0];
  v15 = objc_msgSend(v7, "lastIndex");

  objc_msgSend(v14, "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:", v12, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_createProvenanceSelectCommandFromDeviceRowIdToClockValues:(id)a3 type:(unsigned __int8)a4 state:(unsigned __int8)a5 columns:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  __CFString **v11;
  __CFString **v12;
  __CFString **v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  id v37;
  _QWORD v38[4];
  __CFString *v39;
  __CFString *v40;
  id v41;
  char v42;
  _QWORD v43[3];

  v7 = a5;
  v8 = a4;
  v43[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  if (!(_DWORD)v8)
  {
    v11 = CCDatabaseColumnContentSequenceNumberEndOfRun;
    v12 = CCDatabaseColumnContentSequenceNumber;
    v13 = CCDatabaseColumnContentState;
    goto LABEL_5;
  }
  if ((_DWORD)v8 == 1)
  {
    v11 = CCDatabaseColumnMetaContentSequenceNumberEndOfRun;
    v12 = CCDatabaseColumnMetaContentSequenceNumber;
    v13 = CCDatabaseColumnMetaContentState;
LABEL_5:
    v14 = *v13;
    v15 = *v12;
    v16 = *v11;
    v17 = (void *)objc_opt_new();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke;
    v38[3] = &unk_2509907C8;
    v42 = v7;
    v18 = v15;
    v39 = v18;
    v19 = v16;
    v40 = v19;
    v20 = v17;
    v41 = v20;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v38);
    if (objc_msgSend(v20, "count"))
    {
      v37 = v9;
      +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v10)
        objc_msgSend(v21, "setColumns:", v10);
      v36 = v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", v14, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v43[0] = v24;
      +[CCSQLCommandCriterion criterionWithORSubCriteria:](CCSQLCommandCriterion, "criterionWithORSubCriteria:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setCommandCriterion:", v27);
      objc_msgSend(v22, "build");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v36;
      v9 = v37;
    }
    else
    {
      v28 = 0;
    }

    goto LABEL_14;
  }
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetStateReader _resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:].cold.1(v8, v14, v29, v30, v31, v32, v33, v34);
  v28 = 0;
LABEL_14:

  return v28;
}

void __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke_2;
  v13[3] = &unk_2509907A0;
  v17 = *(_BYTE *)(a1 + 56);
  v14 = *(id *)(a1 + 32);
  v8 = v7;
  v15 = v8;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v13);

  if (objc_msgSend(v8, "count"))
  {
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    +[CCSQLCommandCriterion criterionWithORSubCriteria:](CCSQLCommandCriterion, "criterionWithORSubCriteria:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
  }

}

void __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned __int8 *)(a1 + 56);
  if (v6 == 2)
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:ISNOTColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:ISNOTColumnValue:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:GREATERTHANOrEqualColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:GREATERTHANOrEqualColumnValue:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 + a2 - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:LESSTHANOrEqualColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:LESSTHANOrEqualColumnValue:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)v12;
    v29[0] = v12;
    v29[1] = v15;
    v29[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 + a2 - 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCSQLCommandCriterion criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:", v21, v22, v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v28[0] = v23;
    v28[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithORSubCriteria:](CCSQLCommandCriterion, "criterionWithORSubCriteria:", v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }
  else
  {
    if (v6 != 1)
      return;
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 + a2 - 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCSQLCommandCriterion criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:", v7, v8, v24);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

}

- (id)sharedItemCount:(id *)a3
{
  void *v5;
  void *v6;
  CCDatabaseReadOnlyAccess *databaseAccess;
  id v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCount:", 1);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  databaseAccess = self->_databaseAccess;
  v18 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke;
  v15[3] = &unk_2509907F0;
  v8 = v6;
  v16 = v8;
  v17 = &v19;
  v9 = -[CCDatabaseReadOnlyAccess enumerateRowResultsOfSelect:error:usingBlock:](databaseAccess, "enumerateRowResultsOfSelect:error:usingBlock:", v8, &v18, v15);
  v10 = v18;
  if ((v9 & 1) != 0)
  {

    v11 = (id)v20[5];
  }
  else
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "commandString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCDatabaseSetStateReader sharedItemCount:].cold.1(v13, (uint64_t)v10, (uint64_t)v25);
    }

    CCSetError(a3, v10);
    v11 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v11;
}

BOOL __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    objc_msgSend(v3, "numberValueAtColumnIndex:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke_cold_1();

  }
  return v4 == 1;
}

- (id)itemInstanceCount:(id *)a3
{
  void *v5;
  void *v6;
  CCDatabaseReadOnlyAccess *databaseAccess;
  id v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("metacontent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCount:", 1);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  databaseAccess = self->_databaseAccess;
  v18 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke;
  v15[3] = &unk_2509907F0;
  v8 = v6;
  v16 = v8;
  v17 = &v19;
  v9 = -[CCDatabaseReadOnlyAccess enumerateRowResultsOfSelect:error:usingBlock:](databaseAccess, "enumerateRowResultsOfSelect:error:usingBlock:", v8, &v18, v15);
  v10 = v18;
  if ((v9 & 1) != 0)
  {

    v11 = (id)v20[5];
  }
  else
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "commandString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCDatabaseSetStateReader itemInstanceCount:].cold.1(v13, (uint64_t)v10, (uint64_t)v25);
    }

    CCSetError(a3, v10);
    v11 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v11;
}

BOOL __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    objc_msgSend(v3, "numberValueAtColumnIndex:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke_cold_1();

  }
  return v4 == 1;
}

- (id)resourceVersion:(id *)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "persistedKeyValueForKey:database:error:", CFSTR("resourceVersion"), self->_databaseAccess, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "integerValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastDeltaDate:(id *)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "persistedKeyValueForKey:database:error:", CFSTR("lastDeltaDate"), self->_databaseAccess, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "integerValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)persistedKeyValueForKey:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("keyvalue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("key"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCommandCriterion:", v10);
  objc_msgSend(v9, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v12 = objc_opt_class();
  v19[4] = &v21;
  v20 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__CCDatabaseSetStateReader_persistedKeyValueForKey_database_error___block_invoke;
  v19[3] = &unk_250990728;
  v13 = objc_msgSend(v8, "enumerateRecordResultsOfSelect:recordClass:error:usingBlock:", v11, v12, &v20, v19);
  v14 = v20;
  if (v14)
    v15 = 0;
  else
    v15 = v13;
  if ((v15 & 1) != 0)
  {
    v16 = (id)v22[5];
  }
  else
  {
    __biome_log_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[CCDatabaseSetStateReader persistedKeyValueForKey:database:error:].cold.1();

    CCSetError(a5, v14);
    v16 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v16;
}

uint64_t __67__CCDatabaseSetStateReader_persistedKeyValueForKey_database_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandCache, 0);
  objc_storeStrong((id *)&self->_databaseAccess, 0);
}

- (void)initWithDatabaseAccess:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve database access.", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_237B25000, a2, a3, "Unexpected state vector type: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)fetchContentRecordFromContentHash:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Error while enumerating item content records. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchContentRecordFromContentHash:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to build select with params: (%@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveSequenceNumberRangesOfDeltaVector:(uint64_t)a3 appendToCriteria:(uint64_t)a4 seenStateVectorBuilder:(uint64_t)a5 deviceMapping:(uint64_t)a6 type:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_237B25000, a2, a3, "Unexpected state vector type: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)sharedItemCount:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_5((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v6, v4, "Failed to select shared item count (%@) error: %@", v5);

}

void __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v0, (uint64_t)v0, "Unexpected row (%@) returned from content select: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)itemInstanceCount:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_5((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v6, v4, "Failed to select local instance count (%@) error: %@", v5);

}

void __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v0, (uint64_t)v0, "Unexpected row (%@) returned from metacontent select: %@", v1);
  OUTLINED_FUNCTION_1();
}

+ (void)persistedKeyValueForKey:database:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v1, (uint64_t)v1, "Failed to select key value record for key: %@ error: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
