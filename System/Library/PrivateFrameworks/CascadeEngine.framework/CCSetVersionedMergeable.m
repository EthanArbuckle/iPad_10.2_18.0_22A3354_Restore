@implementation CCSetVersionedMergeable

- (CCSetVersionedMergeable)initWithSet:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  CCSetVersionedMergeable *v9;

  v4 = (void *)MEMORY[0x24BE15640];
  v5 = *MEMORY[0x24BE0C060];
  v6 = a3;
  objc_msgSend(v4, "defaultInstanceWithUseCase:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "databaseReadAccessForSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CCSetVersionedMergeable initWithSet:readAccess:donateServiceProvider:](self, "initWithSet:readAccess:donateServiceProvider:", v6, v8, 0);

  return v9;
}

- (CCSetVersionedMergeable)initWithSet:(id)a3 readAccess:(id)a4 donateServiceProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CCSetVersionedMergeable *v12;
  CCSetVersionedMergeable *v13;
  uint64_t v14;
  CCDatabaseSetStateReader *stateReader;
  uint64_t v16;
  NSString *encodedSetDescriptors;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CCSetVersionedMergeable;
  v12 = -[CCSetVersionedMergeable init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_set, a3);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE15658]), "initWithDatabaseAccess:", v10);
    stateReader = v13->_stateReader;
    v13->_stateReader = (CCDatabaseSetStateReader *)v14;

    objc_storeStrong((id *)&v13->_donateServiceProvider, a5);
    objc_msgSend(v9, "encodedDescriptors");
    v16 = objc_claimAutoreleasedReturnValue();
    encodedSetDescriptors = v13->_encodedSetDescriptors;
    v13->_encodedSetDescriptors = (NSString *)v16;

  }
  return v13;
}

- (id)mergeableDeltaAfterStateVector:(id)a3 atomBatchVersion:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
    v6 = (id)objc_opt_new();
  -[CCSetVersionedMergeable stateVector](self, "stateVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clockVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "timestampCount");

  if (v9)
  {
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "clockVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intersectVector:", v11);

    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[CCSetVersionedMergeable description](self, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v6;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v18;
      _os_log_debug_impl(&dword_237B02000, v12, OS_LOG_TYPE_DEBUG, "remote stateVector %@, interestected stateVector %@, %@", buf, 0x20u);

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9138]), "initWithPreviousStateVector:currentStateVector:", v10, v7);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9130]), "initWithVectors:", v13);
    v19 = 0;
    -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:](self, "mergeableDeltasForMetadata:atomBatchVersion:error:", v14, v4, &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)mergeDelta:(id)a3 fromDevice:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  CCDonateServiceProvider *donateServiceProvider;
  id v22;
  id v23;
  id v24;
  dispatch_time_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  NSObject *v35;
  CCSet *set;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  CCSet *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v39 = a4;
  v7 = dispatch_semaphore_create(0);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v8 = MEMORY[0x24BDAC760];
  v52 = 0;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke;
  v46[3] = &unk_25098AC08;
  v48 = &v49;
  v9 = v7;
  v47 = v9;
  v10 = (void *)MEMORY[0x23B8203DC](v46);
  v45 = 0;
  objc_msgSend(v6, "dataWithError:", &v45);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v45;
  v13 = (void *)MEMORY[0x24BDD1618];
  v14 = v6;
  objc_msgSend(v6, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v12;
  objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v44;

  v17 = (void *)MEMORY[0x24BE15700];
  v18 = -[CCSet itemType](self->_set, "itemType");
  -[CCSet descriptors](self->_set, "descriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  donateServiceProvider = self->_donateServiceProvider;
  v40[0] = v20;
  v40[1] = 3221225472;
  v40[2] = __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_2;
  v40[3] = &unk_25098AC30;
  v40[4] = self;
  v22 = v10;
  v43 = v22;
  v23 = v11;
  v41 = v23;
  v24 = v16;
  v42 = v24;
  objc_msgSend(v17, "remoteCRDTSetDonationWithItemType:forAccount:fromDevice:descriptors:serviceProvider:completion:", v18, 0, v39, v19, donateServiceProvider, v40);

  v25 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v25))
  {
    __biome_log_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CCSetVersionedMergeable mergeDelta:fromDevice:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

    v34 = 0;
  }
  else
  {
    __biome_log_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      set = self->_set;
      *(_DWORD *)buf = 138412546;
      v54 = set;
      v55 = 2112;
      v56 = v39;
      _os_log_impl(&dword_237B02000, v35, OS_LOG_TYPE_DEFAULT, "Completed merge of atom batch for set %@ from device %@", buf, 0x16u);
    }

    v34 = *((_BYTE *)v50 + 24) != 0;
  }

  _Block_object_dispose(&v49, 8);
  return v34;
}

intptr_t __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  char v8;
  id v9;
  void (*v10)(void);
  NSObject *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_2_cold_2((uint64_t)a1);

    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "mergeDelta:withDeltaMetadata:", a1[5], a1[6]) & 1) == 0)
  {
LABEL_8:
    (*(void (**)(void))(a1[7] + 16))();
    goto LABEL_9;
  }
  v12 = 0;
  v8 = objc_msgSend(v5, "finish:", &v12);
  v9 = v12;
  if ((v8 & 1) != 0)
  {
    v10 = *(void (**)(void))(a1[7] + 16);
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_2_cold_1((uint64_t)a1);

    v10 = *(void (**)(void))(a1[7] + 16);
  }
  v10();

LABEL_9:
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(v4);
      if (!--v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (!v6)
          break;
      }
    }
  }

  return 1;
}

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  return -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:](self, "mergeableDeltasForMetadata:atomBatchVersion:error:", a3, 3, a4);
}

- (id)mergeableDeltasForMetadata:(id)a3 atomBatchVersion:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  CCDatabaseDeviceMapping *cachedDeviceMapping;
  CCDatabaseDeviceMapping *v13;
  id v14;
  CCDatabaseSetStateReader *stateReader;
  CCDatabaseDeviceMapping *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CCDatabaseSetStateReader *v23;
  void *v24;
  void *v25;
  CCDatabaseDeviceMapping *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v5 = a4;
  v42[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "vectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "timestampCount");

  if (!v10)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:].cold.4();

  }
  cachedDeviceMapping = self->_cachedDeviceMapping;
  if (cachedDeviceMapping)
  {
    v13 = cachedDeviceMapping;
    v14 = 0;
  }
  else
  {
    stateReader = self->_stateReader;
    v41 = 0;
    -[CCDatabaseSetStateReader constructDeviceMapping:](stateReader, "constructDeviceMapping:", &v41);
    v13 = (CCDatabaseDeviceMapping *)objc_claimAutoreleasedReturnValue();
    v14 = v41;
  }
  v16 = self->_cachedDeviceMapping;
  self->_cachedDeviceMapping = v13;

  if (self->_cachedDeviceMapping)
  {
    v17 = objc_alloc(MEMORY[0x24BDB9140]);
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[CCSet itemType](self->_set, "itemType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("(%@,%@)"), v19, self->_encodedSetDescriptors);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v17, "initWithName:", v20);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17958]), "initWriterWithMergeableValueID:metadata:formatVersion:error:", v21, v7, v5, 0);
    v23 = self->_stateReader;
    objc_msgSend(v7, "vectors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_cachedDeviceMapping;
    v40 = v14;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke;
    v38[3] = &unk_25098AC80;
    v38[4] = self;
    v27 = v22;
    v39 = v27;
    -[CCDatabaseSetStateReader enumerateProvenanceRecordsForStateVector:withType:selectAtomsInState:skipOverAtomsInState:deviceMapping:error:usingBlock:](v23, "enumerateProvenanceRecordsForStateVector:withType:selectAtomsInState:skipOverAtomsInState:deviceMapping:error:usingBlock:", v25, 0, 1, 2, v26, &v40, v38);
    v28 = v40;

    v37 = v28;
    objc_msgSend(v27, "finishWritingWithError:", &v37);
    v14 = v37;

    if (v27)
    {
      v36 = 0;
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9128]), "initWithAtomBatch:error:", v27, &v36);
      v30 = v36;
      if (v30)
      {
        __biome_log_for_category();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:].cold.3();

        CCSetError();
        v32 = (void *)MEMORY[0x24BDBD1A8];
      }
      else
      {
        v42[0] = v29;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      __biome_log_for_category();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:].cold.2((uint64_t)v14, v34);

      CCSetError();
      v32 = 0;
    }

  }
  else
  {
    __biome_log_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:].cold.1();

    CCSetError();
    v32 = 0;
  }

  return v32;
}

void __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v3, "deviceRowId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siteIdentifierForDeviceRowId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contentSequenceNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "contentHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchContentRecordFromContentHash:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "contentHash");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "content");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v19;
    _os_log_debug_impl(&dword_237B02000, v11, OS_LOG_TYPE_DEBUG, "appending atom with dot %@::%@ contentHash %@ size %@", buf, 0x2Au);

  }
  v12 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke_13;
  v20[3] = &unk_25098AC58;
  v21 = v6;
  v22 = v7;
  v23 = v10;
  v13 = v10;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v12, "appendAtomWithBlock:", v20);

}

void __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke_13(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distributedSiteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v8, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClock:", objc_msgSend(a1[5], "unsignedIntegerValue"));

  objc_msgSend(a1[6], "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v7);

  objc_msgSend(v8, "setVersion:", 1);
}

- (id)stateVector
{
  CCDatabaseSetStateReader *stateReader;
  char v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  stateReader = self->_stateReader;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  v4 = -[CCDatabaseSetStateReader constructStateVectorsFromDatabaseOutContent:outMetaContent:outDeviceMapping:error:](stateReader, "constructStateVectorsFromDatabaseOutContent:outMetaContent:outDeviceMapping:error:", &v17, 0, &v16, &v15);
  v5 = v17;
  v6 = v16;
  v7 = v16;
  v8 = v15;
  if ((v4 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_cachedDeviceMapping, v6);
    v9 = v5;
  }
  else
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CCSetVersionedMergeable stateVector].cold.1();

    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v11 = (void *)getCKDistributedTimestampStateVectorClass_softClass;
    v22 = getCKDistributedTimestampStateVectorClass_softClass;
    if (!getCKDistributedTimestampStateVectorClass_softClass)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __getCKDistributedTimestampStateVectorClass_block_invoke;
      v18[3] = &unk_25098ACA8;
      v18[4] = &v19;
      __getCKDistributedTimestampStateVectorClass_block_invoke((uint64_t)v18);
      v11 = (void *)v20[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v19, 8);
    v9 = objc_alloc_init(v12);
  }
  v13 = v9;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDeviceMapping, 0);
  objc_storeStrong((id *)&self->_donateServiceProvider, 0);
  objc_storeStrong((id *)&self->_stateReader, 0);
  objc_storeStrong((id *)&self->_encodedSetDescriptors, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

- (void)mergeDelta:(uint64_t)a3 fromDevice:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_237B02000, a1, a3, "Timed out waiting for asynchronous donate operation. timeout=%@ seconds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_237B02000, v1, v2, "Remote CRDT commit rejected for set: %@ error: %@ ", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_8();
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_237B02000, v1, v2, "Remote CRDT merge rejected for set: %@ error: %@ ", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_8();
}

- (void)mergeableDeltasForMetadata:atomBatchVersion:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "Failed to resolve device mapping: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)mergeableDeltasForMetadata:(uint64_t)a1 atomBatchVersion:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = 0;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_237B02000, a2, OS_LOG_TYPE_ERROR, "failed to finish writing atom batch %@ with error %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_8();
}

- (void)mergeableDeltasForMetadata:atomBatchVersion:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_237B02000, v0, v1, "unable to init a CKMergeableDelta with initWithAtomBatch:%@ error:%@");
  OUTLINED_FUNCTION_8();
}

- (void)mergeableDeltasForMetadata:atomBatchVersion:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "contents vector is empty %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)stateVector
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "Failed to construct content state vector: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
