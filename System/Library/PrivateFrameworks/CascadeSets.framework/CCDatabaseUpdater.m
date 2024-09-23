@implementation CCDatabaseUpdater

- (CCDatabaseUpdater)initWithDatabase:(id)a3 device:(id)a4 request:(id)a5 startTimeMicros:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  CCDatabaseUpdater *v14;
  uint64_t v15;
  NSString *requestDescription;
  uint64_t v17;
  NSString *encodedDescriptors;
  uint64_t v19;
  NSString *deviceId;
  uint64_t v21;
  uint64_t v22;
  NSNumber *versionNumber;
  void *v24;
  void *v25;
  uint64_t v26;
  NSNumber *updateValidityHash;
  NSObject *v28;
  uint64_t v29;
  NSNumber *itemTypeNumber;
  uint64_t v31;
  NSNumber *startTimeMicros;
  uint64_t v33;
  NSMutableDictionary *commandCache;
  _BOOL4 v35;
  NSObject *v36;
  CCDatabaseUpdater *v37;
  id v39;
  objc_super v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v40.receiver = self;
  v40.super_class = (Class)CCDatabaseUpdater;
  v14 = -[CCDatabaseUpdater init](&v40, sel_init);
  if (!v14)
    goto LABEL_22;
  objc_msgSend(v13, "description");
  v15 = objc_claimAutoreleasedReturnValue();
  requestDescription = v14->_requestDescription;
  v14->_requestDescription = (NSString *)v15;

  if (!v13)
  {
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:].cold.1();
    goto LABEL_24;
  }
  objc_storeStrong((id *)&v14->_database, a3);
  if (!v14->_database)
  {
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:].cold.2();
    goto LABEL_24;
  }
  objc_msgSend(v13, "encodedDescriptors");
  v17 = objc_claimAutoreleasedReturnValue();
  encodedDescriptors = v14->_encodedDescriptors;
  v14->_encodedDescriptors = (NSString *)v17;

  if (!v14->_encodedDescriptors)
  {
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:].cold.3();
    goto LABEL_24;
  }
  objc_msgSend(v12, "identifier");
  v19 = objc_claimAutoreleasedReturnValue();
  deviceId = v14->_deviceId;
  v14->_deviceId = (NSString *)v19;

  if (!v14->_deviceId)
  {
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:].cold.4();
    goto LABEL_24;
  }
  v14->_deviceOptions = objc_msgSend(v12, "options");
  v21 = objc_msgSend(v13, "version");
  v14->_updateVersion = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  versionNumber = v14->_versionNumber;
  v14->_versionNumber = (NSNumber *)v22;

  objc_msgSend(v13, "validity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v13, "validity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CCHash64String(v25);
    v26 = objc_claimAutoreleasedReturnValue();
    updateValidityHash = v14->_updateValidityHash;
    v14->_updateValidityHash = (NSNumber *)v26;

  }
  else
  {
    v25 = v14->_updateValidityHash;
    v14->_updateValidityHash = (NSNumber *)&unk_2509A1D00;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v13, "itemType"));
  v29 = objc_claimAutoreleasedReturnValue();
  itemTypeNumber = v14->_itemTypeNumber;
  v14->_itemTypeNumber = (NSNumber *)v29;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a6);
  v31 = objc_claimAutoreleasedReturnValue();
  startTimeMicros = v14->_startTimeMicros;
  v14->_startTimeMicros = (NSNumber *)v31;

  v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 18);
  commandCache = v14->_commandCache;
  v14->_commandCache = (NSMutableDictionary *)v33;

  if (!-[CCDatabaseUpdater _registerDevice](v14, "_registerDevice")
    || !-[CCDatabaseUpdater _registerSetVersionAndValidity](v14, "_registerSetVersionAndValidity"))
  {
    v28 = 0;
LABEL_24:

    v37 = 0;
    goto LABEL_25;
  }
  v39 = 0;
  v35 = -[CCDatabaseUpdater _selectLocalInstanceCount:](v14, "_selectLocalInstanceCount:", &v39);
  v36 = v39;
  v28 = v36;
  if (!v35 || !v36)
    goto LABEL_24;
  v14->_priorLocalInstanceCount = -[NSObject unsignedIntValue](v36, "unsignedIntValue");

LABEL_22:
  v37 = v14;
LABEL_25:

  return v37;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("request: %@, startTimeMicros: %@"), self->_requestDescription, self->_startTimeMicros);
}

- (BOOL)_registerDevice
{
  _BOOL4 v3;
  id v4;
  NSNumber *v5;
  NSNumber *v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  NSNumber *v10;
  NSObject *p_super;
  NSNumber *deviceRowId;
  NSString *deviceId;
  int deviceOptions;
  id v16;
  id v17;
  unsigned __int8 v18;
  uint8_t buf[4];
  NSNumber *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v17 = 0;
  v3 = -[CCDatabaseUpdater _selectDeviceRowId:options:](self, "_selectDeviceRowId:options:", &v17, &v18);
  v4 = v17;
  v5 = (NSNumber *)v17;
  v6 = v5;
  if (!v3)
    goto LABEL_9;
  v7 = v5 == 0;
  if (!v5)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseUpdater _registerDevice].cold.1((uint64_t)self, v8);

    v16 = 0;
    v9 = -[CCDatabaseUpdater _insertDeviceReturningRowId:](self, "_insertDeviceReturningRowId:", &v16);
    v10 = (NSNumber *)v16;
    v6 = v10;
    if (v9)
    {
      v6 = v10;
      p_super = &self->_deviceRowId->super.super;
      self->_deviceRowId = v6;
LABEL_12:

      goto LABEL_13;
    }
LABEL_9:
    v7 = 0;
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_deviceRowId, v4);
  if (self->_deviceOptions != v18)
  {
    __biome_log_for_category();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      deviceId = self->_deviceId;
      deviceRowId = self->_deviceRowId;
      deviceOptions = self->_deviceOptions;
      *(_DWORD *)buf = 138413058;
      v20 = deviceRowId;
      v21 = 2112;
      v22 = deviceId;
      v23 = 1024;
      v24 = v18;
      v25 = 1024;
      v26 = deviceOptions;
      _os_log_error_impl(&dword_237B25000, p_super, OS_LOG_TYPE_ERROR, "Row %@ for deviceId: %@ has device options value %i inconsistent with expected: %i", buf, 0x22u);
    }
    goto LABEL_12;
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)_registerSetVersionAndValidity
{
  void *v3;
  CCDatabaseReadWriteAccess *database;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  CCDatabaseReadWriteAccess *v9;
  NSNumber *v10;
  NSNumber *priorValidityHash;
  id v13;
  id v14;

  v3 = (void *)objc_opt_class();
  database = self->_database;
  v14 = 0;
  objc_msgSend(v3, "selectSetVersionInDatabase:error:", database, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  self->_priorVersion = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _registerSetVersionAndValidity].cold.2();
LABEL_7:

    return 0;
  }
  v8 = (void *)objc_opt_class();
  v9 = self->_database;
  v13 = 0;
  objc_msgSend(v8, "selectSetValidityHashInDatabase:error:", v9, &v13);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  priorValidityHash = self->_priorValidityHash;
  self->_priorValidityHash = v10;

  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _registerSetVersionAndValidity].cold.1();
    goto LABEL_7;
  }
  return -[CCDatabaseUpdater _updateSetVersionAndValidity](self, "_updateSetVersionAndValidity");
}

- (BOOL)deleteAllLocalInstances
{
  _BOOL4 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__CCDatabaseUpdater_deleteAllLocalInstances__block_invoke;
  v5[3] = &unk_250991318;
  v5[4] = self;
  v5[5] = &v6;
  v3 = -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:](self, "_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:", 0, v5);
  if (v3)
    self->_localInstanceRemovedCount += *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__CCDatabaseUpdater_deleteAllLocalInstances__block_invoke(uint64_t a1, uint64_t a2)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "deleteSourceItemIdHash:", a2);
}

- (BOOL)deleteSourceItemIdHash:(id)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  BOOL v7;
  id v9;

  v9 = 0;
  v4 = -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:](self, "_deleteSourceItemIdHash:outProvenanceRowId:", a3, &v9);
  v5 = v9;
  v6 = v5;
  if (v4)
  {
    if (v5)
      v7 = -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:](self, "_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:", v5, 1);
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_deleteSourceItemIdHash:(id)a3 outProvenanceRowId:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CCDatabaseReadWriteAccess *database;
  char v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1D18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "updateParameters:", v7) & 1) != 0)
  {
    v9 = v8;
    goto LABEL_5;
  }
  +[CCDatabaseDelete builderWithTableName:](CCDatabaseDelete, "builderWithTableName:", CFSTR("instance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:onTable:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:onTable:EQUALSColumnValue:", CFSTR("source_item_id_hash"), CFSTR("instance"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCommandCriterion:", v11);
  v26 = CFSTR("provenance_row_id");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReturningColumns:", v12);

  objc_msgSend(v9, "build");
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v13, &unk_2509A1D18);

    v9 = (void *)v13;
LABEL_5:
    database = self->_database;
    v22 = 0;
    v23 = 0;
    v15 = -[CCDatabaseReadWriteAccess executeCommand:error:returningRow:](database, "executeCommand:error:returningRow:", v9, &v23, &v22);
    v16 = v23;
    v17 = v22;
    v11 = v17;
    if ((v15 & 1) != 0)
    {
      if (v17)
      {
        ++self->_modifiedRowCount;
        ++self->_localInstanceRemovedCount;
        if (a4)
        {
          objc_msgSend(v17, "numberValueAtColumnIndex:", 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        __biome_log_for_category();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v6;
          _os_log_impl(&dword_237B25000, v20, OS_LOG_TYPE_DEFAULT, "No item exists with sourceItemIdHash: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.1();

    }
    goto LABEL_18;
  }
  __biome_log_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.2();

  v16 = 0;
  v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)_tombstoneMetaContentWithProvenanceRowId:(id)a3 tombstoneContentIfNoLongerPresent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CCDatabaseReadWriteAccess *database;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  CCDatabaseReadWriteAccess *v28;
  char v29;
  id v30;
  BOOL v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSNumber *deviceRowId;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  CCDatabaseReadWriteAccess *v52;
  char v53;
  id v54;
  CCDatabaseReadWriteAccess *v55;
  int v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  CCDatabaseReadWriteAccess *v66;
  char v67;
  id v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  __int16 v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  _QWORD v93[3];
  _QWORD v94[4];
  uint64_t v95;
  _QWORD v96[3];
  _QWORD v97[4];

  v4 = a4;
  v97[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v97[0] = &unk_2509A1D30;
  v97[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1D48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "updateParameters:", v7) & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("provenance_row_id"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("provenance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forColumn:", v12, CFSTR("metacontent_state"));

    objc_msgSend(v11, "setCommandCriterion:", v9);
    v96[0] = CFSTR("instance_hash");
    v96[1] = CFSTR("content_hash");
    v96[2] = CFSTR("content_sequence_number");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setReturningColumns:", v13);

    objc_msgSend(v11, "build");
    v14 = objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      __biome_log_for_category();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();
      v17 = 0;
      goto LABEL_19;
    }
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v14, &unk_2509A1D48);

    v9 = (void *)v14;
  }
  database = self->_database;
  v90 = 0;
  v91 = 0;
  v16 = -[CCDatabaseReadWriteAccess executeCommand:error:returningRow:](database, "executeCommand:error:returningRow:", v9, &v91, &v90);
  v17 = v91;
  v18 = v90;
  v11 = v18;
  if ((v16 & 1) != 0)
  {
    v77 = v4;
    ++self->_modifiedRowCount;
    objc_msgSend(v18, "numberValueAtColumnIndex:", 0);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberValueAtColumnIndex:", 1);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberValueAtColumnIndex:", 2);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
    v21 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1D60);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)v21;
    v79 = v19;
    v84 = (void *)v20;
    if ((objc_msgSend(v22, "updateParameters:", v21) & 1) == 0)
    {
      v23 = v6;
      +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("instance_hash"), v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCDatabaseDelete builderWithTableName:](CCDatabaseDelete, "builderWithTableName:", CFSTR("metacontent"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCommandCriterion:", v24);
      objc_msgSend(v25, "build");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v22;
      v22 = (void *)v26;

      if (!v22)
      {
        __biome_log_for_category();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.2();

        v22 = 0;
        v31 = 0;
        v6 = v23;
        goto LABEL_28;
      }
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v22, &unk_2509A1D60);

      v6 = v23;
    }
    v28 = self->_database;
    v89 = v17;
    v29 = -[CCDatabaseReadWriteAccess executeCommand:error:](v28, "executeCommand:error:", v22, &v89);
    v30 = v89;

    if ((v29 & 1) != 0)
    {
      ++self->_modifiedRowCount;
      if (v77)
      {
        v88 = 0;
        if (!-[CCDatabaseUpdater _selectProvenanceWithContentHash:outLocalInstancePresent:outRemoteContentPresent:](self, "_selectProvenanceWithContentHash:outLocalInstancePresent:outRemoteContentPresent:", v20, (char *)&v88 + 1, &v88))
        {
          v31 = 0;
          goto LABEL_32;
        }
        if (HIBYTE(v88))
        {
          v31 = 1;
LABEL_32:
          v32 = v79;
          v35 = v80;
LABEL_33:
          v17 = v30;
          goto LABEL_29;
        }
        v78 = v6;
        deviceRowId = self->_deviceRowId;
        v94[0] = &unk_2509A1D30;
        v94[1] = deviceRowId;
        v94[2] = v83;
        v94[3] = &unk_2509A1D60;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1D78);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v38, "updateParameters:", v35) & 1) == 0)
        {
          v81 = v22;
          v72 = v38;
          v39 = v35;
          objc_msgSend(v35, "objectAtIndex:", 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), v40);
          v41 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "objectAtIndex:", 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_sequence_number"), v42);
          v43 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "objectAtIndex:", 3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_state"), v44);
          v45 = objc_claimAutoreleasedReturnValue();

          v73 = (void *)v43;
          v74 = (void *)v41;
          v93[0] = v41;
          v93[1] = v43;
          v71 = (void *)v45;
          v93[2] = v45;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 3);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("provenance"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v39;
          objc_msgSend(v39, "objectAtIndex:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setValue:forColumn:", v49, CFSTR("content_state"));

          objc_msgSend(v48, "setCommandCriterion:", v47);
          objc_msgSend(v48, "build");
          v50 = objc_claimAutoreleasedReturnValue();

          v38 = (void *)v50;
          if (v50)
          {
            -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v50, &unk_2509A1D78);
            v22 = v81;
            v35 = v75;
          }
          else
          {
            __biome_log_for_category();
            v51 = objc_claimAutoreleasedReturnValue();
            v35 = v75;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();

            v22 = v81;
          }

          if (!v38)
          {
            v31 = 0;
            v6 = v78;
            v32 = v79;
            goto LABEL_33;
          }
        }
        v52 = self->_database;
        v87 = v30;
        v53 = -[CCDatabaseReadWriteAccess executeCommand:error:](v52, "executeCommand:error:", v38, &v87);
        v54 = v87;

        if ((v53 & 1) == 0)
        {
          __biome_log_for_category();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.4();

          v31 = 0;
          goto LABEL_53;
        }
        v55 = self->_database;
        v86 = v54;
        v56 = -[CCDatabaseReadWriteAccess rowsModified:](v55, "rowsModified:", &v86);
        v57 = v86;

        if (v56 < 0)
        {
          __biome_log_for_category();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.1();

          v31 = 0;
          goto LABEL_52;
        }
        self->_modifiedRowCount += v56;
        if ((_BYTE)v88)
        {
          ++self->_sharedItemProvenanceUpdatedCount;
          v31 = 1;
LABEL_52:
          v54 = v57;
LABEL_53:
          v32 = v79;
LABEL_54:

          v17 = v54;
          v6 = v78;
          goto LABEL_29;
        }
        v54 = v57;
        v76 = v38;
        v92 = v84;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
        v60 = objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1D30);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)v60;
        if ((objc_msgSend(v61, "updateParameters:", v60) & 1) != 0)
        {
          v62 = v61;
        }
        else
        {
          v63 = v22;
          +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_hash"), v84);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          +[CCDatabaseDelete builderWithTableName:](CCDatabaseDelete, "builderWithTableName:", CFSTR("content"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setCommandCriterion:", v62);
          objc_msgSend(v64, "build");
          v65 = objc_claimAutoreleasedReturnValue();

          if (!v65)
          {
            __biome_log_for_category();
            v70 = objc_claimAutoreleasedReturnValue();
            v22 = v63;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.2();

            v31 = 0;
            goto LABEL_65;
          }
          -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v65, &unk_2509A1D30);

          v62 = (void *)v65;
          v22 = v63;
        }
        v66 = self->_database;
        v85 = v57;
        v67 = -[CCDatabaseReadWriteAccess executeCommand:error:](v66, "executeCommand:error:", v62, &v85);
        v68 = v85;

        if ((v67 & 1) != 0)
        {
          ++self->_sharedItemRemovedCount;
          ++self->_modifiedRowCount;
          v31 = 1;
        }
        else
        {
          __biome_log_for_category();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.1();

          v31 = 0;
        }
        v54 = v68;
LABEL_65:

        v32 = v79;
        v35 = v82;
        v38 = v76;
        goto LABEL_54;
      }
      v31 = 1;
    }
    else
    {
      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.1();

      v31 = 0;
    }
    v17 = v30;
LABEL_28:
    v32 = v79;
    v35 = v80;
LABEL_29:

    v7 = v35;
    goto LABEL_30;
  }
  __biome_log_for_category();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.8();
LABEL_19:
  v31 = 0;
LABEL_30:

  return v31;
}

- (BOOL)tombstoneContentSequenceNumbersInRange:(_NSRange)a3 forDeviceRowId:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  NSNumber *deviceRowId;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  CCDatabaseReadWriteAccess *database;
  char v26;
  id v27;
  NSObject *v28;
  void *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  _QWORD v36[3];
  _QWORD v37[6];

  length = a3.length;
  location = a3.location;
  v37[5] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", length + location - 1);
  v9 = objc_claimAutoreleasedReturnValue();
  deviceRowId = self->_deviceRowId;
  v37[0] = &unk_2509A1D30;
  v37[1] = deviceRowId;
  v37[2] = v8;
  v37[3] = v9;
  v34 = (void *)v9;
  v37[4] = &unk_2509A1D60;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1D90);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "updateParameters:", v11) & 1) != 0)
  {
    v13 = v12;
  }
  else
  {
    v31 = length;
    v33 = v7;
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), v7);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:BETWEENLowerColumnValue:ANDUpperColumnValue:", CFSTR("content_sequence_number"), v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndex:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_state"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)v14;
    v36[0] = v14;
    v36[1] = v17;
    v30 = (void *)v17;
    v36[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("provenance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forColumn:", v23, CFSTR("content_state"));

    objc_msgSend(v22, "setCommandCriterion:", v21);
    objc_msgSend(v22, "build");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v13, &unk_2509A1D90);
    }
    else
    {
      __biome_log_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();

    }
    LODWORD(length) = v31;

    v7 = v33;
    if (!v13)
    {
      v27 = 0;
      v26 = 0;
      goto LABEL_15;
    }
  }
  database = self->_database;
  v35 = 0;
  v26 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v13, &v35);
  v27 = v35;
  if ((v26 & 1) != 0)
  {
    self->_sharedItemRemovedCount += length;
    self->_modifiedRowCount += length;
  }
  else
  {
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater tombstoneContentSequenceNumbersInRange:forDeviceRowId:].cold.1();

  }
LABEL_15:

  return v26;
}

- (BOOL)deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CCDatabaseReadWriteAccess *database;
  id v13;
  CCDatabaseReadWriteAccess *v14;
  int v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:onTable:EQUALSColumnName:onTable:](CCSQLCommandCriterion, "criterionWithColumnName:onTable:EQUALSColumnName:onTable:", CFSTR("content_hash"), CFSTR("content"), CFSTR("content_hash"), CFSTR("provenance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_state"), &unk_2509A1D60);
  v5 = objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setCommandCriterion:", v7);
  +[CCDatabaseDelete builderWithTableName:](CCDatabaseDelete, "builderWithTableName:", CFSTR("content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithNOTEXISTSSubQuery:](CCSQLCommandCriterion, "criterionWithNOTEXISTSSubQuery:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommandCriterion:", v10);

  objc_msgSend(v8, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v22 = 0;
  LOBYTE(v5) = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v11, &v22);
  v13 = v22;
  if ((v5 & 1) != 0)
  {
    v14 = self->_database;
    v21 = v13;
    v15 = -[CCDatabaseReadWriteAccess rowsModified:](v14, "rowsModified:", &v21);
    v16 = v21;

    if (v15 < 0)
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord].cold.1();

      v17 = 0;
    }
    else
    {
      self->_modifiedRowCount += v15;
      v17 = 1;
    }
    v13 = v16;
  }
  else
  {
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord].cold.2();

    v17 = 0;
  }

  return v17;
}

+ (BOOL)compactContiguousRunsOfDeletesInDatabase:(id)a3 deletedCount:(unint64_t *)a4 shouldDefer:(id)a5
{
  id v6;
  NSObject *v7;
  CCDatabaseSetStateReader *v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  char v47;
  id v48;
  unsigned int v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  id v55;
  void *v56;
  void *v57;
  CCDatabaseSetStateReader *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  unint64_t *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  NSObject *v75;
  NSObject *v76;
  id v77;
  _QWORD v78[4];
  NSObject *v79;
  NSObject *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint8_t buf[4];
  unsigned int v88;
  _QWORD v89[3];
  _QWORD v90[2];
  _QWORD v91[4];

  v91[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B25000, v7, OS_LOG_TYPE_DEFAULT, "Starting database tombstone compaction operation", buf, 2u);
  }

  v8 = -[CCDatabaseSetStateReader initWithDatabaseAccess:]([CCDatabaseSetStateReader alloc], "initWithDatabaseAccess:", v6);
  v85 = 0;
  v86 = 0;
  v83 = 0;
  v84 = 0;
  v9 = -[CCDatabaseSetStateReader constructStateVectorsFromDatabaseOutContent:outMetaContent:outDeviceMapping:error:](v8, "constructStateVectorsFromDatabaseOutContent:outMetaContent:outDeviceMapping:error:", &v86, &v85, &v84, &v83);
  v10 = v86;
  v71 = v85;
  v11 = v84;
  v12 = v83;
  v13 = v12;
  if (v9)
  {
    v69 = v11;
    v70 = v10;
    v62 = a4;
    v68 = v12;
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_state"), &unk_2509A1D30);
    v14 = objc_claimAutoreleasedReturnValue();
    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:ISNOTColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:ISNOTColumnValue:", CFSTR("content_sequence_number"), v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:ISNOTColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:ISNOTColumnValue:", CFSTR("metacontent_sequence_number"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v64 = (void *)v19;
    v65 = (void *)v17;
    v91[0] = v17;
    v91[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithORSubCriteria:](CCSQLCommandCriterion, "criterionWithORSubCriteria:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v90[0] = v14;
    v90[1] = v21;
    v66 = (void *)v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCommandCriterion:", v23);

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forColumn:", v24, CFSTR("content_sequence_number_end_of_run"));

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forColumn:", v25, CFSTR("metacontent_sequence_number_end_of_run"));

    v63 = v15;
    objc_msgSend(v15, "build");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.5(v26, v27);

    v82 = 0;
    v28 = objc_msgSend(v6, "executeCommand:error:", v26, &v82);
    v67 = v82;
    if ((v28 & 1) == 0)
    {
      __biome_log_for_category();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.4();
      v47 = 0;
      v52 = v63;
      goto LABEL_32;
    }
    v58 = v8;
    v29 = v14;
    v30 = MEMORY[0x24BDAC760];
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke;
    v78[3] = &unk_250991340;
    v31 = v11;
    v79 = v31;
    v60 = v29;
    v32 = v29;
    v33 = v6;
    v34 = v32;
    v80 = v32;
    v59 = v33;
    v35 = v33;
    v81 = v35;
    objc_msgSend(v70, "enumerateAllClockValuesUsingBlock:", v78);
    v74[0] = v30;
    v74[1] = 3221225472;
    v74[2] = __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_24;
    v74[3] = &unk_250991340;
    v75 = v31;
    v36 = v34;
    v76 = v36;
    v37 = v35;
    v77 = v37;
    objc_msgSend(v71, "enumerateAllClockValuesUsingBlock:", v74);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:ISColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:ISColumnValue:", CFSTR("content_sequence_number_end_of_run"), v38);
    v39 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:ISColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:ISColumnValue:", CFSTR("metacontent_sequence_number_end_of_run"), v40);
    v41 = objc_claimAutoreleasedReturnValue();

    v89[0] = v36;
    v89[1] = v39;
    v57 = (void *)v39;
    v56 = (void *)v41;
    v89[2] = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    +[CCDatabaseDelete builderWithTableName:](CCDatabaseDelete, "builderWithTableName:", CFSTR("provenance"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v43;
    objc_msgSend(v44, "setCommandCriterion:", v43);
    objc_msgSend(v44, "build");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.3(v45, v46);

    v73 = 0;
    v47 = objc_msgSend(v37, "executeCommand:error:", v45, &v73);
    v48 = v73;
    if ((v47 & 1) == 0)
    {
      __biome_log_for_category();
      v53 = objc_claimAutoreleasedReturnValue();
      v8 = v58;
      v6 = v59;
      v14 = v60;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.2();
      goto LABEL_31;
    }
    v72 = v68;
    v49 = objc_msgSend(v37, "rowsModified:", &v72);
    v55 = v72;

    v8 = v58;
    v6 = v59;
    v14 = v60;
    if ((v49 & 0x80000000) != 0)
    {
      __biome_log_for_category();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.1();
      v49 = 0;
    }
    else
    {
      if (!v49)
      {
LABEL_26:
        if (v62)
          *v62 = v49;
        __biome_log_for_category();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v88 = v49;
          _os_log_impl(&dword_237B25000, v53, OS_LOG_TYPE_DEFAULT, "Finished database tombstone compaction operation with deleted count: %u", buf, 8u);
        }
        v68 = v55;
LABEL_31:
        v52 = v63;

        v51 = v79;
LABEL_32:
        v13 = v68;

        v11 = v69;
        v10 = v70;
        goto LABEL_33;
      }
      __biome_log_for_category();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v88 = v49;
        _os_log_impl(&dword_237B25000, v50, OS_LOG_TYPE_DEFAULT, "Deleted %u tombstone(s) from the database.", buf, 8u);
      }
    }

    v14 = v60;
    goto LABEL_26;
  }
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.6();
  v47 = 0;
LABEL_33:

  return v47;
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  if (a6 == 2 && a4)
  {
    v9 = a2;
    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("provenance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deviceRowIdForSiteIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_sequence_number"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forColumn:", v15, CFSTR("instance_hash"));

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forColumn:", v16, CFSTR("content_hash"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 + a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forColumn:", v17, CFSTR("content_sequence_number_end_of_run"));

    v27[0] = v12;
    v27[1] = v14;
    v27[2] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCommandCriterion:", v19);

    objc_msgSend(v10, "build");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_2(v20, v21);

    v22 = *(void **)(a1 + 48);
    v26 = 0;
    v23 = objc_msgSend(v22, "executeCommand:error:", v20, &v26);
    v24 = v26;
    if ((v23 & 1) == 0)
    {
      __biome_log_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_1();

    }
  }
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_24(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  if (a6 == 2 && a4)
  {
    v9 = a2;
    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("provenance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deviceRowIdForSiteIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("metacontent_sequence_number"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forColumn:", v15, CFSTR("instance_hash"));

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forColumn:", v16, CFSTR("content_hash"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 + a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forColumn:", v17, CFSTR("metacontent_sequence_number_end_of_run"));

    v27[0] = v12;
    v27[1] = v14;
    v27[2] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCommandCriterion:", v19);

    objc_msgSend(v10, "build");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_24_cold_2(v20, v21);

    v22 = *(void **)(a1 + 48);
    v26 = 0;
    v23 = objc_msgSend(v22, "executeCommand:error:", v20, &v26);
    v24 = v26;
    if ((v23 & 1) == 0)
    {
      __biome_log_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_24_cold_1();

    }
  }
}

- (BOOL)_insertDeviceReturningRowId:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CCDatabaseReadWriteAccess *database;
  char v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v31[0] = CFSTR("device_id");
  v31[1] = CFSTR("options");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCDatabaseInsert builderWithTableName:columnNames:](CCDatabaseInsert, "builderWithTableName:columnNames:", CFSTR("device"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = self->_deviceId;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_deviceOptions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColumnValues:", v8);

  v29 = CFSTR("device_row_id");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReturningColumns:", v9);

  v22 = 0;
  objc_msgSend(v6, "buildWithError:", &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  database = self->_database;
  v20 = 0;
  v21 = v11;
  v13 = -[CCDatabaseReadWriteAccess executeCommand:error:returningRow:](database, "executeCommand:error:returningRow:", v10, &v21, &v20);
  v14 = v21;

  v15 = v20;
  v16 = v15;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v15, "numberValueAtColumnIndex:", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    ++self->_modifiedRowCount;
  }
  else
  {
    __biome_log_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[CCDatabaseUpdater description](self, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = v19;
      v27 = 2112;
      v28 = v14;
      _os_log_error_impl(&dword_237B25000, v17, OS_LOG_TYPE_ERROR, "Insert %@ failed. %@ error: %@", buf, 0x20u);

    }
  }

  return v13;
}

- (BOOL)insertItemWithSourceItemIdHash:(id)a3 instanceHash:(id)a4 contentHash:(id)a5 metaContent:(id)a6 content:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _BOOL4 v16;
  id v17;
  _BOOL4 v18;
  id v19;
  NSNumber *deviceRowId;
  _BOOL4 v21;
  id v22;
  BOOL v23;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v27 = 0;
  v16 = -[CCDatabaseUpdater _insertMetaContent:instanceHash:outSequenceNumber:](self, "_insertMetaContent:instanceHash:outSequenceNumber:", a6, v13, &v27);
  v17 = v27;
  if (v16)
  {
    v26 = 0;
    v18 = -[CCDatabaseUpdater _insertContent:contentHash:outSequenceNumber:](self, "_insertContent:contentHash:outSequenceNumber:", v15, v14, &v26);
    v19 = v26;
    if (v18)
    {
      deviceRowId = self->_deviceRowId;
      v25 = 0;
      v21 = -[CCDatabaseUpdater _insertProvenanceForItemWithContentHash:contentSequenceNumber:metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:](self, "_insertProvenanceForItemWithContentHash:contentSequenceNumber:metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:", v14, v19, v17, v13, deviceRowId, &v25);
      v22 = v25;
      v23 = v21
         && -[CCDatabaseUpdater _insertLocalInstanceForItemWithSourceItemIdHash:provenanceRowId:](self, "_insertLocalInstanceForItemWithSourceItemIdHash:provenanceRowId:", v12, v22);

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)insertContent:(id)a3 contentHash:(id)a4 sequenceNumber:(id)a5 onDeviceRowId:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CCDatabaseReadWriteAccess *database;
  int v22;
  NSObject *v23;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[CCDatabaseUpdater _insertContentIfNotExists:contentHash:](self, "_insertContentIfNotExists:contentHash:", a3, v10))
  {
    v35[0] = v12;
    v35[1] = v10;
    v35[2] = v11;
    v35[3] = &unk_2509A1D60;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1DA8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "updateParameters:", v13) & 1) != 0)
    {
      v15 = 0;
      v16 = v14;
    }
    else
    {
      v34[0] = CFSTR("device_row_id");
      v34[1] = CFSTR("content_hash");
      v34[2] = CFSTR("content_sequence_number");
      v34[3] = CFSTR("content_state");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCDatabaseInsert builderWithTableName:columnNames:](CCDatabaseInsert, "builderWithTableName:columnNames:", CFSTR("provenance"), v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setColumnValues:", v13);
      v27 = 0;
      objc_msgSend(v16, "buildWithError:", &v27);
      v19 = objc_claimAutoreleasedReturnValue();
      v15 = v27;

      if (!v19)
      {
        __biome_log_for_category();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          -[CCDatabaseUpdater description](self, "description");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v13;
          v30 = 2112;
          v31 = v25;
          v32 = 2112;
          v33 = v15;
          _os_log_error_impl(&dword_237B25000, v23, OS_LOG_TYPE_ERROR, "Failed to build provenance with params: {%@}, %@ error: %@", buf, 0x20u);

        }
        goto LABEL_13;
      }
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v19, &unk_2509A1DA8);

      v16 = (void *)v19;
    }
    v20 = v15;
    database = self->_database;
    v26 = v15;
    v22 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v16, &v26);
    v15 = v26;

    if (v22)
    {
      ++self->_modifiedRowCount;
      v17 = 1;
LABEL_14:

      goto LABEL_15;
    }
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:].cold.1();
LABEL_13:

    v17 = 0;
    goto LABEL_14;
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)_insertMetaContent:(id)a3 instanceHash:(id)a4 outSequenceNumber:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CCDatabaseReadWriteAccess *database;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v34[0] = v9;
  v34[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCDatabaseUpdater _incrementLocalHighestMetaContentSequenceNumber](self, "_incrementLocalHighestMetaContentSequenceNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1DC0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "updateParameters:", v10) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      v33[0] = CFSTR("instance_hash");
      v33[1] = CFSTR("metacontent");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCDatabaseInsert builderWithTableName:columnNames:](CCDatabaseInsert, "builderWithTableName:columnNames:", CFSTR("metacontent"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setColumnValues:", v10);
      v26 = 0;
      objc_msgSend(v16, "buildWithError:", &v26);
      v17 = objc_claimAutoreleasedReturnValue();
      v13 = v26;

      if (!v17)
      {
        __biome_log_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          -[CCDatabaseUpdater description](self, "description");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v28 = v10;
          v29 = 2112;
          v30 = v24;
          v31 = 2112;
          v32 = v13;
          _os_log_error_impl(&dword_237B25000, v22, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);

        }
        v12 = 0;
        goto LABEL_17;
      }
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v17, &unk_2509A1DC0);

      v12 = (void *)v17;
    }
    v18 = v13;
    database = self->_database;
    v25 = v13;
    v20 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v12, &v25);
    v13 = v25;

    if (v20)
    {
      ++self->_modifiedRowCount;
      if (a5)
        *a5 = objc_retainAutorelease(v11);
      v14 = 1;
      goto LABEL_18;
    }
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:].cold.1();

LABEL_17:
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v13 = 0;
  v14 = 0;
LABEL_19:

  return v14;
}

- (BOOL)_insertContent:(id)a3 contentHash:(id)a4 outSequenceNumber:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  id v16;

  v8 = a3;
  v9 = a4;
  v16 = 0;
  v10 = -[CCDatabaseUpdater _selectLocalDeviceProvenenceWithContentHash:outSequenceNumber:](self, "_selectLocalDeviceProvenenceWithContentHash:outSequenceNumber:", v9, &v16);
  v11 = v16;
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      *a5 = objc_retainAutorelease(v11);
      v13 = 1;
    }
    else
    {
      -[CCDatabaseUpdater _incrementLocalHighestContentSequenceNumber](self, "_incrementLocalHighestContentSequenceNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        && -[CCDatabaseUpdater _insertContentIfNotExists:contentHash:](self, "_insertContentIfNotExists:contentHash:", v8, v9))
      {
        *a5 = objc_retainAutorelease(v14);
        v13 = 1;
      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_insertContentIfNotExists:(id)a3 contentHash:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CCDatabaseReadWriteAccess *database;
  char v17;
  CCDatabaseReadWriteAccess *v18;
  int v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v36[0] = v7;
  v36[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1DD8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "updateParameters:", v8) & 1) != 0)
  {
    v10 = 0;
    v11 = v9;
  }
  else
  {
    v35[0] = CFSTR("content_hash");
    v35[1] = CFSTR("content");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCDatabaseInsert builderWithTableName:columnNames:](CCDatabaseInsert, "builderWithTableName:columnNames:", CFSTR("content"), v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setColumnValues:", v8);
    +[CCDatabaseOnConflict onConflictWithType:](CCDatabaseOnConflict, "onConflictWithType:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOnConflict:", v13);

    v28 = 0;
    objc_msgSend(v11, "buildWithError:", &v28);
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = v28;

    if (!v14)
    {
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[CCDatabaseUpdater description](self, "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v8;
        v31 = 2112;
        v32 = v25;
        v33 = 2112;
        v34 = v10;
        _os_log_error_impl(&dword_237B25000, v21, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);

      }
      goto LABEL_13;
    }
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v14, &unk_2509A1DD8);

    v11 = (void *)v14;
  }
  v15 = v10;
  database = self->_database;
  v27 = v10;
  v17 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v11, &v27);
  v10 = v27;

  if ((v17 & 1) == 0)
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:].cold.1();
LABEL_13:

    v22 = 0;
    goto LABEL_20;
  }
  v18 = self->_database;
  v26 = v10;
  v19 = -[CCDatabaseReadWriteAccess rowsModified:](v18, "rowsModified:", &v26);
  v20 = v26;

  if (v19 < 0)
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _insertContentIfNotExists:contentHash:].cold.1();

    v22 = 0;
  }
  else
  {
    if (v19)
    {
      self->_modifiedRowCount += v19;
      ++self->_sharedItemAddedCount;
    }
    else
    {
      ++self->_sharedItemProvenanceUpdatedCount;
    }
    v22 = 1;
  }
  v10 = v20;
LABEL_20:

  return v22;
}

- (BOOL)_insertProvenanceForItemWithContentHash:(id)a3 contentSequenceNumber:(id)a4 metaContentSequenceNumber:(id)a5 instanceHash:(id)a6 onDeviceRowId:(id)a7 insertedRowId:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  CCDatabaseReadWriteAccess *database;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  NSObject *v47;
  const __CFString *v48;
  _QWORD v49[7];
  _QWORD v50[9];

  v50[7] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = v18;
  if (v15)
  {
    v36 = a8;
    v37 = v16;
    v50[0] = v18;
    v50[1] = v14;
    v38 = v14;
    v50[2] = v17;
    v50[3] = v15;
    v50[4] = &unk_2509A1D60;
    v50[5] = v16;
    v50[6] = &unk_2509A1D60;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1DF0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "updateParameters:", v20) & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      v49[0] = CFSTR("device_row_id");
      v49[1] = CFSTR("content_hash");
      v49[2] = CFSTR("instance_hash");
      v49[3] = CFSTR("content_sequence_number");
      v49[4] = CFSTR("content_state");
      v49[5] = CFSTR("metacontent_sequence_number");
      v49[6] = CFSTR("metacontent_state");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCDatabaseInsert builderWithTableName:columnNames:](CCDatabaseInsert, "builderWithTableName:columnNames:", CFSTR("provenance"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "setColumnValues:", v20);
      v48 = CFSTR("provenance_row_id");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setReturningColumns:", v26);

      v41 = 0;
      objc_msgSend(v25, "buildWithError:", &v41);
      v27 = objc_claimAutoreleasedReturnValue();
      v22 = v41;

      if (!v27)
      {
        __biome_log_for_category();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          -[CCDatabaseUpdater description](self, "description");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v43 = v20;
          v44 = 2112;
          v45 = v35;
          v46 = 2112;
          v47 = v22;
          _os_log_error_impl(&dword_237B25000, v31, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);

        }
        v23 = 0;
        v21 = v25;
        goto LABEL_17;
      }
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v27, &unk_2509A1DF0);

      v21 = (void *)v27;
    }
    v28 = v22;
    database = self->_database;
    v39 = 0;
    v40 = v22;
    v23 = -[CCDatabaseReadWriteAccess executeCommand:error:returningRow:](database, "executeCommand:error:returningRow:", v21, &v40, &v39);
    v22 = v40;

    v30 = v39;
    v31 = v30;
    if ((v23 & 1) != 0)
    {
      -[NSObject numberValueAtColumnIndex:](v30, "numberValueAtColumnIndex:", 0);
      *v36 = (id)objc_claimAutoreleasedReturnValue();
      ++self->_modifiedRowCount;
    }
    else
    {
      __biome_log_for_category();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        -[CCDatabaseUpdater description](self, "description");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v43 = v21;
        v44 = 2112;
        v45 = v34;
        v46 = 2112;
        v47 = v22;
        _os_log_error_impl(&dword_237B25000, v32, OS_LOG_TYPE_ERROR, "Insert %@ failed. %@ error: %@", buf, 0x20u);

      }
    }
LABEL_17:

    v16 = v37;
    v14 = v38;
    goto LABEL_18;
  }
  __biome_log_for_category();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[CCDatabaseUpdater _insertProvenanceForItemWithContentHash:contentSequenceNumber:metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:].cold.1(self, v22);
  v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)_insertLocalInstanceForItemWithSourceItemIdHash:(id)a3 provenanceRowId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CCDatabaseReadWriteAccess *database;
  int v16;
  BOOL v17;
  NSObject *v18;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30[0] = v6;
  v30[1] = v7;
  v30[2] = self->_startTimeMicros;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1E08);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "updateParameters:", v8) & 1) != 0)
  {
    v10 = 0;
    v11 = v9;
  }
  else
  {
    v29[0] = CFSTR("source_item_id_hash");
    v29[1] = CFSTR("provenance_row_id");
    v29[2] = CFSTR("modified");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCDatabaseInsert builderWithTableName:columnNames:](CCDatabaseInsert, "builderWithTableName:columnNames:", CFSTR("instance"), v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setColumnValues:", v8);
    v22 = 0;
    objc_msgSend(v11, "buildWithError:", &v22);
    v13 = objc_claimAutoreleasedReturnValue();
    v10 = v22;

    if (!v13)
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        -[CCDatabaseUpdater description](self, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v8;
        v25 = 2112;
        v26 = v20;
        v27 = 2112;
        v28 = v10;
        _os_log_error_impl(&dword_237B25000, v18, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);

      }
      goto LABEL_11;
    }
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v13, &unk_2509A1E08);

    v11 = (void *)v13;
  }
  v14 = v10;
  database = self->_database;
  v21 = v10;
  v16 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v11, &v21);
  v10 = v21;

  if (!v16)
  {
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:].cold.1();
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  *(int32x2_t *)&self->_modifiedRowCount = vadd_s32(*(int32x2_t *)&self->_modifiedRowCount, (int32x2_t)0x100000001);
  v17 = 1;
LABEL_12:

  return v17;
}

+ (BOOL)_writeRecordWithKey:(id)a3 stringValue:(id)a4 integerValue:(id)a5 dataValue:(id)a6 onConflictType:(int64_t)a7 database:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v34[0] = CFSTR("key");
  v34[1] = CFSTR("string_value");
  v34[2] = CFSTR("integer_value");
  v34[3] = CFSTR("data_value");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCDatabaseInsert builderWithTableName:columnNames:](CCDatabaseInsert, "builderWithTableName:columnNames:", CFSTR("keyvalue"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v12;
  v19 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[1] = v19;
  v20 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[2] = v20;
  v21 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setColumnValues:", v22);

  if (v15)
  {
    if (v14)
      goto LABEL_9;
LABEL_16:

    if (v13)
      goto LABEL_10;
LABEL_17:

    goto LABEL_10;
  }

  if (!v14)
    goto LABEL_16;
LABEL_9:
  if (!v13)
    goto LABEL_17;
LABEL_10:
  +[CCDatabaseOnConflict onConflictWithType:](CCDatabaseOnConflict, "onConflictWithType:", v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOnConflict:", v23);

  v32 = 0;
  objc_msgSend(v18, "buildWithError:", &v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v32;
  v26 = v25;
  v27 = 0;
  if (v24)
  {
    if (!v25)
    {
      v31 = 0;
      v27 = objc_msgSend(v16, "executeCommand:error:", v24, &v31);
      v26 = v31;
      if (v26)
        v27 = 0;
    }
  }

  return v27;
}

+ (BOOL)insertOrUpdateLastMaintenanceDate:(id)a3 database:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  if (!a3)
    return 0;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("lastMaintenanceDate"), 0, v8, 0, 2, v7);

  return (char)a1;
}

+ (BOOL)insertOrUpdateRowsModified:(unint64_t)a3 database:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("rowsModified"), 0, v8, 0, 2, v7);

  return (char)a1;
}

+ (BOOL)insertOrUpdateLocalDeviceIdentifier:(id)a3 database:(id)a4
{
  if (a3)
    return objc_msgSend(a1, "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("localDeviceIdentifier"), a3, 0, 0, 2, a4);
  else
    return 0;
}

+ (BOOL)insertResourceVersion:(id)a3 database:(id)a4
{
  if (a3)
    return objc_msgSend(a1, "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("resourceVersion"), 0, a3, 0, 3, a4);
  else
    return 0;
}

+ (BOOL)insertOrUpdateLastDeltaDate:(id)a3 database:(id)a4
{
  return objc_msgSend(a1, "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("lastDeltaDate"), 0, a3, 0, 2, a4);
}

- (BOOL)_selectDeviceRowId:(id *)a3 options:(unsigned __int8 *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CCDatabaseReadWriteAccess *database;
  int v12;
  id v13;
  NSObject *v14;
  _QWORD v16[7];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_id"), self->_deviceId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommandCriterion:", v7);
  v28[0] = CFSTR("device_row_id");
  v28[1] = CFSTR("options");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColumns:", v9);

  objc_msgSend(v8, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11;
  v26 = __Block_byref_object_dispose__11;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  database = self->_database;
  v17 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke;
  v16[3] = &unk_250991368;
  v16[5] = &v22;
  v16[6] = &v18;
  v16[4] = self;
  v12 = -[CCDatabaseReadWriteAccess enumerateRowResultsOfSelect:error:usingBlock:](database, "enumerateRowResultsOfSelect:error:usingBlock:", v10, &v17, v16);
  v13 = v17;
  if (v12)
  {
    *a3 = objc_retainAutorelease((id)v23[5]);
    *a4 = *((_BYTE *)v19 + 24);
  }
  else
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[CCDatabaseUpdater description](self, "description");
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:].cold.1();
    }

  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

BOOL __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v6 = a2;
  *a4 = 1;
  v7 = objc_msgSend(v6, "count");
  if (v7 == 2)
  {
    objc_msgSend(v6, "numberValueAtColumnIndex:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v6, "numberValueAtColumnIndex:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[NSObject unsignedCharValue](v11, "unsignedCharValue");
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke_cold_1();
  }

  return v7 == 2;
}

- (BOOL)_selectLocalInstanceCount:(id *)a3
{
  void *v5;
  void *v6;
  CCDatabaseReadWriteAccess *database;
  int v8;
  id v9;
  NSObject *v10;
  _QWORD v12[6];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCount:", 1);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  v19 = 0;
  database = self->_database;
  v13 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke;
  v12[3] = &unk_250991390;
  v12[4] = self;
  v12[5] = &v14;
  v8 = -[CCDatabaseReadWriteAccess enumerateRowResultsOfSelect:error:usingBlock:](database, "enumerateRowResultsOfSelect:error:usingBlock:", v6, &v13, v12);
  v9 = v13;
  if (v8)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
  }
  else
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[CCDatabaseUpdater description](self, "description");
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:].cold.1();
    }

  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

BOOL __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v6 = a2;
  *a4 = 1;
  v7 = objc_msgSend(v6, "count");
  if (v7 == 1)
  {
    objc_msgSend(v6, "numberValueAtColumnIndex:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_1(a1 + 40, a1);
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_2();
  }

  return v7 == 1;
}

- (BOOL)selectSourceItemIdHash:(id)a3 outLocalInstanceRowId:(id *)a4 outProvenanceRowId:(id *)a5 outInstanceHash:(id *)a6 outContentHash:(id *)a7 outContentSequenceNumber:(id *)a8 isDuplicate:(BOOL *)a9
{
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CCSQLCommandJoinTable *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CCDatabaseReadWriteAccess *database;
  char v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v28;
  id v34;
  _QWORD v35[10];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE v73[32];
  _QWORD v74[2];
  _QWORD v75[6];
  CCSQLCommandJoinTable *v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v77[0] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1E20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "updateParameters:", v10) & 1) != 0)
  {
    v12 = (uint64_t)v11;
LABEL_5:
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__11;
    v71 = __Block_byref_object_dispose__11;
    v72 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__11;
    v65 = __Block_byref_object_dispose__11;
    v66 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__11;
    v59 = __Block_byref_object_dispose__11;
    v60 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__11;
    v53 = __Block_byref_object_dispose__11;
    v54 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__11;
    v47 = __Block_byref_object_dispose__11;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__11;
    v41 = __Block_byref_object_dispose__11;
    v42 = 0;
    database = self->_database;
    v36 = 0;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke;
    v35[3] = &unk_2509913B8;
    v35[4] = &v67;
    v35[5] = &v61;
    v35[6] = &v55;
    v35[7] = &v49;
    v35[8] = &v43;
    v35[9] = &v37;
    v22 = -[CCDatabaseReadWriteAccess enumerateRowResultsOfSelect:error:usingBlock:](database, "enumerateRowResultsOfSelect:error:usingBlock:", v12, &v36, v35);
    v23 = v36;
    if ((v22 & 1) != 0)
    {
      if (v62[5])
      {
        if (a4)
          *a4 = objc_retainAutorelease((id)v68[5]);
        if (a5)
          *a5 = objc_retainAutorelease((id)v62[5]);
        if (a6)
          *a6 = objc_retainAutorelease((id)v50[5]);
        if (a7)
          *a7 = objc_retainAutorelease((id)v44[5]);
        if (a8)
          *a8 = objc_retainAutorelease((id)v38[5]);
        if (objc_msgSend((id)v56[5], "isEqual:", self->_startTimeMicros))
        {
          __biome_log_for_category();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            -[CCDatabaseUpdater description](self, "description");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[CCDatabaseUpdater selectSourceItemIdHash:outLocalInstanceRowId:outProvenanceRowId:outInstanceHash:outContentHash:outContentSequenceNumber:isDuplicate:].cold.1((uint64_t)v34, v25, (uint64_t)v73);
          }

          if (a9)
            *a9 = 1;
        }
      }
    }
    else
    {
      __biome_log_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[CCDatabaseUpdater description](self, "description");
        objc_claimAutoreleasedReturnValue();
        -[CCDatabaseUpdater _selectDeviceRowId:options:].cold.1();
      }

    }
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
    v13 = (void *)v12;
    goto LABEL_26;
  }
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("instance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandJoinCriterion criterionWithColumnName:onTable:EQUALSColumnName:comparingTableName:](CCSQLCommandJoinCriterion, "criterionWithColumnName:onTable:EQUALSColumnName:comparingTableName:", CFSTR("provenance_row_id"), CFSTR("instance"), CFSTR("provenance_row_id"), CFSTR("provenance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CCSQLCommandJoinTable initWithTable:joinCriterion:]([CCSQLCommandJoinTable alloc], "initWithTable:joinCriterion:", CFSTR("provenance"), v14);
  v76 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setJoinWithType:tables:", 1, v16);

  objc_msgSend(v10, "objectAtIndex:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:onTable:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:onTable:EQUALSColumnValue:", CFSTR("source_item_id_hash"), CFSTR("instance"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setCommandCriterion:", v18);
  v75[0] = CFSTR("rowid");
  v75[1] = CFSTR("provenance_row_id");
  v75[2] = CFSTR("modified");
  v75[3] = CFSTR("instance_hash");
  v75[4] = CFSTR("content_hash");
  v75[5] = CFSTR("content_sequence_number");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = CFSTR("instance");
  v74[1] = CFSTR("instance");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColumns:withTablePrefixes:", v19, v20);

  objc_msgSend(v13, "build");
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v12, &unk_2509A1E20);

    goto LABEL_5;
  }
  __biome_log_for_category();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:].cold.2();

  v23 = 0;
  v22 = 0;
LABEL_26:

  return v22;
}

uint64_t __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;

  v6 = a2;
  v7 = v6;
  v8 = 1;
  *a4 = 1;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v7, "count") == 6)
      {
        objc_msgSend(v7, "numberValueAtColumnIndex:", 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1[4] + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        v8 = 1;
        objc_msgSend(v7, "numberValueAtColumnIndex:", 1);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1[5] + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        objc_msgSend(v7, "numberValueAtColumnIndex:", 2);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1[6] + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        objc_msgSend(v7, "numberValueAtColumnIndex:", 3);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1[7] + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        objc_msgSend(v7, "numberValueAtColumnIndex:", 4);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1[8] + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        objc_msgSend(v7, "numberValueAtColumnIndex:", 5);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1[9] + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

      }
      else
      {
        __biome_log_for_category();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke_cold_1();

        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }
  }

  return v8;
}

- (BOOL)selectProvenanceWithContentSequenceNumber:(id)a3 onDeviceRowId:(id)a4 outProvenanceRowId:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CCDatabaseReadWriteAccess *database;
  uint64_t v17;
  char v18;
  id v19;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_sequence_number"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  v29[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCommandCriterion:", v13);
  objc_msgSend(v14, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__11;
  v27 = __Block_byref_object_dispose__11;
  v28 = 0;
  database = self->_database;
  v17 = objc_opt_class();
  v21[4] = &v23;
  v22 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __96__CCDatabaseUpdater_selectProvenanceWithContentSequenceNumber_onDeviceRowId_outProvenanceRowId___block_invoke;
  v21[3] = &unk_250990728;
  v18 = -[CCDatabaseReadWriteAccess enumerateRecordResultsOfSelect:recordClass:error:usingBlock:](database, "enumerateRecordResultsOfSelect:recordClass:error:usingBlock:", v15, v17, &v22, v21);
  v19 = v22;
  if (a5)
  {
    objc_msgSend((id)v24[5], "provenanceRowId");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v23, 8);

  return v18;
}

uint64_t __96__CCDatabaseUpdater_selectProvenanceWithContentSequenceNumber_onDeviceRowId_outProvenanceRowId___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
  return 1;
}

- (BOOL)_selectProvenenceWithRowId:(id)a3 outInstanceHash:(id *)a4 outContentHash:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CCDatabaseReadWriteAccess *database;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v20;
  _QWORD v21[6];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v36[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1E38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "updateParameters:", v9) & 1) != 0)
  {
    v11 = (uint64_t)v10;
LABEL_5:
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__11;
    v33 = __Block_byref_object_dispose__11;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__11;
    v27 = __Block_byref_object_dispose__11;
    v28 = 0;
    database = self->_database;
    v22 = 0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke;
    v21[3] = &unk_2509913E0;
    v21[4] = &v29;
    v21[5] = &v23;
    v16 = -[CCDatabaseReadWriteAccess enumerateRowResultsOfSelect:error:usingBlock:](database, "enumerateRowResultsOfSelect:error:usingBlock:", v11, &v22, v21);
    v17 = v22;
    if ((v16 & 1) != 0)
    {
      if (a4)
        *a4 = objc_retainAutorelease((id)v30[5]);
      if (a5)
        *a5 = objc_retainAutorelease((id)v24[5]);
    }
    else
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        -[CCDatabaseUpdater description](self, "description");
        objc_claimAutoreleasedReturnValue();
        -[CCDatabaseUpdater _selectDeviceRowId:options:].cold.1();
      }

    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
    v12 = (void *)v11;
    goto LABEL_14;
  }
  +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("provenance_row_id"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCommandCriterion:", v12);
  v35[0] = CFSTR("instance_hash");
  v35[1] = CFSTR("content_hash");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColumns:", v14);

  objc_msgSend(v13, "build");
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v11, &unk_2509A1E38);

    goto LABEL_5;
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:].cold.2();

  v17 = 0;
  v16 = 0;
LABEL_14:

  return v16;
}

uint64_t __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;

  v6 = a2;
  v7 = v6;
  v8 = 1;
  *a4 = 1;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v7, "count") == 2)
      {
        objc_msgSend(v7, "numberValueAtColumnIndex:", 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        v8 = 1;
        objc_msgSend(v7, "numberValueAtColumnIndex:", 1);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      else
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke_cold_1();

        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }
  }

  return v8;
}

- (BOOL)_selectProvenanceWithContentHash:(id)a3 outLocalInstancePresent:(BOOL *)a4 outRemoteContentPresent:(BOOL *)a5
{
  id v6;
  void *v7;
  void *v8;
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
  NSObject *v19;
  CCDatabaseReadWriteAccess *database;
  int v21;
  id v22;
  NSObject *v23;
  void *v27;
  _QWORD v28[7];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  const __CFString *v38;
  _QWORD v39[3];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v40[0] = v6;
  v40[1] = &unk_2509A1D60;
  v40[2] = &unk_2509A1D30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1E50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "updateParameters:", v7) & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_hash"), v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_state"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:ISNOTColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:ISNOTColumnValue:", CFSTR("metacontent_state"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v39[0] = v27;
    v39[1] = v13;
    v39[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setCommandCriterion:", v17);
    v38 = CFSTR("device_row_id");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColumns:", v18);

    objc_msgSend(v10, "build");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v9, &unk_2509A1E50);
    }
    else
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:].cold.2();

    }
    if (!v9)
    {
      v22 = 0;
      LOBYTE(v21) = 0;
      goto LABEL_18;
    }
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  database = self->_database;
  v29 = 0;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke;
  v28[3] = &unk_250991368;
  v28[5] = &v34;
  v28[6] = &v30;
  v28[4] = self;
  v21 = -[CCDatabaseReadWriteAccess enumerateRowResultsOfSelect:error:usingBlock:](database, "enumerateRowResultsOfSelect:error:usingBlock:", v9, &v29, v28);
  v22 = v29;
  if (v21)
  {
    if (a4)
      *a4 = *((_BYTE *)v35 + 24);
    if (a5)
      *a5 = *((_BYTE *)v31 + 24);
  }
  else
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[CCDatabaseUpdater description](self, "description");
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:].cold.1();
    }

  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

LABEL_18:
  return v21;
}

uint64_t __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v6 = a2;
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) && *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v8 = 1;
    *a4 = 1;
  }
  else if (v6 && objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "numberValueAtColumnIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1[4] + 88)))
        v10 = a1[5];
      else
        v10 = a1[6];
      v8 = 1;
      *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = 1;

    }
    else
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke_cold_1();

      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_selectLocalDeviceProvenenceWithContentHash:(id)a3 outSequenceNumber:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  CCDatabaseReadWriteAccess *database;
  int v19;
  id v20;
  NSObject *v21;
  void *v23;
  id v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  const __CFString *v34;
  _QWORD v35[3];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v36[0] = v25;
  v36[1] = &unk_2509A1D60;
  v36[2] = self->_deviceRowId;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1E68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "updateParameters:", v5) & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("provenance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_hash"), v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("content_state"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("device_row_id"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = v23;
    v35[1] = v11;
    v35[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithANDSubCriteria:](CCSQLCommandCriterion, "criterionWithANDSubCriteria:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setCommandCriterion:", v15);
    v34 = CFSTR("content_sequence_number");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColumns:", v16);

    objc_msgSend(v8, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v7, &unk_2509A1E68);
    }
    else
    {
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:].cold.2();

    }
    if (!v7)
    {
      v20 = 0;
      LOBYTE(v19) = 0;
      goto LABEL_16;
    }
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__11;
  v32 = __Block_byref_object_dispose__11;
  v33 = 0;
  database = self->_database;
  v26[4] = &v28;
  v27 = 0;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke;
  v26[3] = &unk_250991408;
  v19 = -[CCDatabaseReadWriteAccess enumerateRowResultsOfSelect:error:usingBlock:](database, "enumerateRowResultsOfSelect:error:usingBlock:", v7, &v27, v26);
  v20 = v27;
  if (v19)
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v29[5]);
  }
  else
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[CCDatabaseUpdater description](self, "description");
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:].cold.1();
    }

  }
  _Block_object_dispose(&v28, 8);

LABEL_16:
  return v19;
}

uint64_t __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v6 = a2;
  v7 = v6;
  v8 = 1;
  *a4 = 1;
  if (v6 && objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "numberValueAtColumnIndex:", 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    else
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke_cold_1();

      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)enumerateUnmodifiedLocalInstancesUsingBlock:(id)a3
{
  return -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:](self, "_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:", 1, a3);
}

- (BOOL)_enumerateLocalInstancesSelectingOnlyUnmodified:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL4 v4;
  uint64_t (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CCDatabaseReadWriteAccess *database;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  id v24;
  _QWORD v25[2];

  v4 = a3;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (**)(id, void *))a4;
  +[CCDatabaseSelect builderWithTableName:](CCDatabaseSelect, "builderWithTableName:", CFSTR("instance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CCSQLCommandCriterion criterionWithColumnName:LESSTHANColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:LESSTHANColumnValue:", CFSTR("modified"), self->_startTimeMicros);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCommandCriterion:", v8);

  }
  v25[0] = CFSTR("source_item_id_hash");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColumns:", v9);

  objc_msgSend(v7, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v24 = 0;
  -[CCDatabaseReadWriteAccess enumeratorForRowResultsOfSelect:error:](database, "enumeratorForRowResultsOfSelect:error:", v10, &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v24;
  if (!v12)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:].cold.1();
    goto LABEL_22;
  }
  objc_msgSend(v12, "next");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    while (1)
    {
      v15 = (void *)MEMORY[0x23B82079C]();
      if (!-[NSObject count](v14, "count"))
      {
        objc_autoreleasePoolPop(v15);
        goto LABEL_13;
      }
      if (-[NSObject count](v14, "count") != 1)
        break;
      -[NSObject numberValueAtColumnIndex:](v14, "numberValueAtColumnIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v6[2](v6, v16);

      if ((v17 & 1) == 0)
        goto LABEL_21;
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v12, "next");
      v18 = objc_claimAutoreleasedReturnValue();

      v14 = v18;
      if (!v18)
        goto LABEL_13;
    }
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:].cold.3();

LABEL_21:
    objc_autoreleasePoolPop(v15);
    goto LABEL_22;
  }
LABEL_13:
  objc_msgSend(v12, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:].cold.2();

LABEL_22:
    v21 = 0;
    goto LABEL_23;
  }
  v21 = 1;
LABEL_23:

  return v21;
}

+ (id)selectRowsModifiedCountInDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[CCDatabaseSetStateReader persistedKeyValueForKey:database:error:](CCDatabaseSetStateReader, "persistedKeyValueForKey:database:error:", CFSTR("rowsModified"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)selectSetVersionInDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[CCDatabaseSetStateReader persistedKeyValueForKey:database:error:](CCDatabaseSetStateReader, "persistedKeyValueForKey:database:error:", CFSTR("sourceVersion"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)selectSetValidityHashInDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[CCDatabaseSetStateReader persistedKeyValueForKey:database:error:](CCDatabaseSetStateReader, "persistedKeyValueForKey:database:error:", CFSTR("sourceValidityHash"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)selectLocalHighestContentSequenceNumberInDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[CCDatabaseSetStateReader persistedKeyValueForKey:database:error:](CCDatabaseSetStateReader, "persistedKeyValueForKey:database:error:", CFSTR("localHighestContent"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)selectLocalHighestMetaContentSequenceNumberInDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[CCDatabaseSetStateReader persistedKeyValueForKey:database:error:](CCDatabaseSetStateReader, "persistedKeyValueForKey:database:error:", CFSTR("localHighestMetaContent"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_updateSetVersionAndValidity
{
  NSObject *v4;

  if ((objc_msgSend((id)objc_opt_class(), "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("sourceVersion"), 0, self->_versionNumber, 0, 2, self->_database) & 1) != 0)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("sourceValidityHash"), 0, self->_updateValidityHash, 0, 2, self->_database) & 1) != 0)return 1;
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _updateSetVersionAndValidity].cold.1(self, v4);
  }
  else
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _updateSetVersionAndValidity].cold.2(self, v4);
  }

  return 0;
}

- (id)_incrementLocalHighestContentSequenceNumber
{
  NSNumber *localHighestContentSequenceNumber;
  id *p_localHighestContentSequenceNumber;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  CCDatabaseReadWriteAccess *database;
  NSNumber *v10;
  id v11;
  NSNumber *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;

  p_localHighestContentSequenceNumber = (id *)&self->_localHighestContentSequenceNumber;
  localHighestContentSequenceNumber = self->_localHighestContentSequenceNumber;
  if (localHighestContentSequenceNumber)
  {
LABEL_2:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSNumber unsignedIntegerValue](localHighestContentSequenceNumber, "unsignedIntegerValue") + 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *p_localHighestContentSequenceNumber;
    *p_localHighestContentSequenceNumber = (id)v5;

    v7 = *p_localHighestContentSequenceNumber;
    return v7;
  }
  v8 = (void *)objc_opt_class();
  database = self->_database;
  v16 = 0;
  objc_msgSend(v8, "selectLocalHighestContentSequenceNumberInDatabase:error:", database, &v16);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  v12 = self->_localHighestContentSequenceNumber;
  self->_localHighestContentSequenceNumber = v10;

  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseUpdater _incrementLocalHighestContentSequenceNumber].cold.1();

    localHighestContentSequenceNumber = (NSNumber *)*p_localHighestContentSequenceNumber;
    goto LABEL_2;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CCDatabaseUpdater _incrementLocalHighestContentSequenceNumber].cold.2();

  v7 = 0;
  return v7;
}

- (id)_incrementLocalHighestMetaContentSequenceNumber
{
  NSNumber *localHighestMetaContentSequenceNumber;
  id *p_localHighestMetaContentSequenceNumber;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  CCDatabaseReadWriteAccess *database;
  NSNumber *v10;
  id v11;
  NSNumber *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;

  p_localHighestMetaContentSequenceNumber = (id *)&self->_localHighestMetaContentSequenceNumber;
  localHighestMetaContentSequenceNumber = self->_localHighestMetaContentSequenceNumber;
  if (localHighestMetaContentSequenceNumber)
  {
LABEL_2:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSNumber unsignedIntegerValue](localHighestMetaContentSequenceNumber, "unsignedIntegerValue") + 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *p_localHighestMetaContentSequenceNumber;
    *p_localHighestMetaContentSequenceNumber = (id)v5;

    v7 = *p_localHighestMetaContentSequenceNumber;
    return v7;
  }
  v8 = (void *)objc_opt_class();
  database = self->_database;
  v16 = 0;
  objc_msgSend(v8, "selectLocalHighestMetaContentSequenceNumberInDatabase:error:", database, &v16);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  v12 = self->_localHighestMetaContentSequenceNumber;
  self->_localHighestMetaContentSequenceNumber = v10;

  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseUpdater _incrementLocalHighestMetaContentSequenceNumber].cold.1();

    localHighestMetaContentSequenceNumber = (NSNumber *)*p_localHighestMetaContentSequenceNumber;
    goto LABEL_2;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CCDatabaseUpdater _incrementLocalHighestMetaContentSequenceNumber].cold.2();

  v7 = 0;
  return v7;
}

- (BOOL)_updateLocalHighestSequenceNumbers
{
  NSObject *v4;

  if (self->_localHighestContentSequenceNumber)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("localHighestContent"), 0, self->_localHighestContentSequenceNumber, 0, 2, self->_database) & 1) == 0)
    {
      __biome_log_for_category();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _updateLocalHighestSequenceNumbers].cold.2(self, v4);
      goto LABEL_12;
    }
    ++self->_modifiedRowCount;
  }
  if (!self->_localHighestMetaContentSequenceNumber)
    return 1;
  if ((objc_msgSend((id)objc_opt_class(), "_writeRecordWithKey:stringValue:integerValue:dataValue:onConflictType:database:", CFSTR("localHighestMetaContent"), 0, self->_localHighestMetaContentSequenceNumber, 0, 2, self->_database) & 1) != 0)
  {
    ++self->_modifiedRowCount;
    return 1;
  }
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CCDatabaseUpdater _updateLocalHighestSequenceNumbers].cold.1(self, v4);
LABEL_12:

  return 0;
}

- (BOOL)_updateLastDelta
{
  char v3;
  NSObject *v4;

  v3 = objc_msgSend((id)objc_opt_class(), "insertOrUpdateLastDeltaDate:database:", self->_startTimeMicros, self->_database);
  if ((v3 & 1) != 0)
  {
    ++self->_modifiedRowCount;
  }
  else
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _updateLastDelta].cold.1(self, v4);

  }
  return v3;
}

- (BOOL)updateMetaContent:(id)a3 localInstanceRowId:(id)a4 provenanceRowId:(id)a5 priorInstanceHash:(id)a6 instanceHash:(id)a7 contentHash:(id)a8 contentSequenceNumber:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _BOOL4 v19;
  id v20;
  _BOOL4 v21;
  id v22;
  uint64_t v24;
  id v25;
  id v26;

  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v26 = 0;
  v19 = -[CCDatabaseUpdater _insertMetaContent:instanceHash:outSequenceNumber:](self, "_insertMetaContent:instanceHash:outSequenceNumber:", a3, v16, &v26);
  v20 = v26;
  if (v19)
  {
    v25 = 0;
    LOBYTE(v24) = 0;
    v21 = -[CCDatabaseUpdater _insertNewProvenanceAndTombstonePriorProvenanceRow:outInsertedProvenanceRowId:instanceHash:contentHash:contentSequenceNumber:metaContentSequenceNumber:contentChanged:](self, "_insertNewProvenanceAndTombstonePriorProvenanceRow:outInsertedProvenanceRowId:instanceHash:contentHash:contentSequenceNumber:metaContentSequenceNumber:contentChanged:", v15, &v25, v16, v17, v18, v20, v24);
    v22 = v25;
    LOBYTE(v19) = 0;
    if (v21)
      LOBYTE(v19) = -[CCDatabaseUpdater _updateLocalInstanceRowId:provenanceRowId:](self, "_updateLocalInstanceRowId:provenanceRowId:", v14, v22);

  }
  return v19;
}

- (BOOL)updateContent:(id)a3 andMetaContent:(id)a4 localInstanceRowId:(id)a5 priorProvenanceRowId:(id)a6 contentHash:(id)a7 instanceHash:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _BOOL4 v19;
  id v20;
  _BOOL4 v21;
  id v22;
  _BOOL4 v23;
  id v24;
  BOOL v25;
  uint64_t v27;
  id v28;
  id v29;
  id v30;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30 = 0;
  v19 = -[CCDatabaseUpdater _insertMetaContent:instanceHash:outSequenceNumber:](self, "_insertMetaContent:instanceHash:outSequenceNumber:", a4, v18, &v30);
  v20 = v30;
  if (v19)
  {
    v29 = 0;
    v21 = -[CCDatabaseUpdater _insertContent:contentHash:outSequenceNumber:](self, "_insertContent:contentHash:outSequenceNumber:", v14, v17, &v29);
    v22 = v29;
    if (v21)
    {
      v28 = 0;
      LOBYTE(v27) = 1;
      v23 = -[CCDatabaseUpdater _insertNewProvenanceAndTombstonePriorProvenanceRow:outInsertedProvenanceRowId:instanceHash:contentHash:contentSequenceNumber:metaContentSequenceNumber:contentChanged:](self, "_insertNewProvenanceAndTombstonePriorProvenanceRow:outInsertedProvenanceRowId:instanceHash:contentHash:contentSequenceNumber:metaContentSequenceNumber:contentChanged:", v16, &v28, v18, v17, v22, v20, v27);
      v24 = v28;
      v25 = v23
         && -[CCDatabaseUpdater _updateLocalInstanceRowId:provenanceRowId:](self, "_updateLocalInstanceRowId:provenanceRowId:", v15, v24);

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)_updateLocalInstanceRowId:(id)a3 provenanceRowId:(id)a4
{
  id v6;
  id v7;
  NSNumber *startTimeMicros;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CCDatabaseReadWriteAccess *database;
  int v18;
  id v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  startTimeMicros = self->_startTimeMicros;
  v25[0] = v7;
  v25[1] = startTimeMicros;
  v25[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1E80);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "updateParameters:", v9) & 1) != 0)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("rowid"), v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("instance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forColumn:", v14, CFSTR("provenance_row_id"));

    objc_msgSend(v9, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forColumn:", v15, CFSTR("modified"));

    objc_msgSend(v13, "setCommandCriterion:", v11);
    objc_msgSend(v13, "build");
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      __biome_log_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();

      v19 = 0;
      goto LABEL_13;
    }
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v16, &unk_2509A1E80);

    v11 = (void *)v16;
  }
  database = self->_database;
  v24 = 0;
  v18 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v11, &v24);
  v19 = v24;
  if (!v18)
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _updateLocalInstanceRowId:provenanceRowId:].cold.1();

LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  ++self->_localInstanceUpdatedCount;
  ++self->_modifiedRowCount;
  v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)_updateLocalInstanceRowId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CCDatabaseReadWriteAccess *database;
  int v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20[0] = self->_startTimeMicros;
  v20[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1E98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "updateParameters:", v5) & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("rowid"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("instance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forColumn:", v10, CFSTR("modified"));

    objc_msgSend(v9, "setCommandCriterion:", v7);
    objc_msgSend(v9, "build");
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();

      v14 = 0;
      goto LABEL_13;
    }
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v11, &unk_2509A1E98);

    v7 = (void *)v11;
  }
  database = self->_database;
  v19 = 0;
  v13 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v7, &v19);
  v14 = v19;
  if (!v13)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CCDatabaseUpdater _updateLocalInstanceRowId:provenanceRowId:].cold.1();

LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  ++self->_modifiedRowCount;
  v15 = 1;
LABEL_14:

  return v15;
}

- (BOOL)_insertNewProvenanceAndTombstonePriorProvenanceRow:(id)a3 outInsertedProvenanceRowId:(id *)a4 instanceHash:(id)a5 contentHash:(id)a6 contentSequenceNumber:(id)a7 metaContentSequenceNumber:(id)a8 contentChanged:(BOOL)a9
{
  id v15;
  NSNumber *deviceRowId;
  id v17;
  void *v18;
  BOOL v19;
  id v21;

  v15 = a3;
  deviceRowId = self->_deviceRowId;
  v21 = 0;
  LODWORD(a7) = -[CCDatabaseUpdater _insertProvenanceForItemWithContentHash:contentSequenceNumber:metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:](self, "_insertProvenanceForItemWithContentHash:contentSequenceNumber:metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:", a6, a7, a8, a5, deviceRowId, &v21);
  v17 = v21;
  v18 = v17;
  if ((_DWORD)a7)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v17);
    v19 = -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:](self, "_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:", v15, a9);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_updateProvenanceRowId:(id)a3 priorInstanceHash:(id)a4 instanceHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  CCDatabaseReadWriteAccess *database;
  char v21;
  id v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  void *v26;
  void *v27;
  uint64_t v28;
  CCDatabaseReadWriteAccess *v29;
  char v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v41[0] = v10;
  v41[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1EB0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "updateParameters:", v11) & 1) != 0)
  {
    v13 = v12;
  }
  else
  {
    v36 = v10;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v11, "objectAtIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("provenance_row_id"), v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:", CFSTR("provenance"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forColumn:](v17, "setValue:forColumn:", v18, CFSTR("instance_hash"));

    -[NSObject setCommandCriterion:](v17, "setCommandCriterion:", v13);
    -[NSObject build](v17, "build");
    v19 = objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      __biome_log_for_category();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();

      v22 = 0;
      v25 = 0;
      v9 = v15;
      v8 = v14;
      v10 = v36;
      goto LABEL_23;
    }
    -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v19, &unk_2509A1EB0);

    v13 = (void *)v19;
    v9 = v15;
    v8 = v14;
    v10 = v36;
  }
  database = self->_database;
  v39 = 0;
  v21 = -[CCDatabaseReadWriteAccess executeCommand:error:](database, "executeCommand:error:", v13, &v39);
  v22 = v39;
  if ((v21 & 1) != 0)
  {
    ++self->_modifiedRowCount;
    v37 = v9;
    v40 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_commandCache, "objectForKey:", &unk_2509A1D60);
    v24 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject updateParameters:](v24, "updateParameters:", v23) & 1) != 0)
    {
      v17 = v24;
    }
    else
    {
      objc_msgSend(v23, "objectAtIndex:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:", CFSTR("instance_hash"), v26);
      v17 = objc_claimAutoreleasedReturnValue();

      +[CCDatabaseDelete builderWithTableName:](CCDatabaseDelete, "builderWithTableName:", CFSTR("metacontent"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setCommandCriterion:", v17);
      objc_msgSend(v27, "build");
      v28 = objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        __biome_log_for_category();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.2();

        v25 = 0;
        v11 = v23;
        goto LABEL_22;
      }
      -[NSMutableDictionary setObject:forKey:](self->_commandCache, "setObject:forKey:", v28, &unk_2509A1D60);

      v17 = v28;
    }
    v29 = self->_database;
    v38 = v22;
    v30 = -[CCDatabaseReadWriteAccess executeCommand:error:](v29, "executeCommand:error:", v17, &v38);
    v31 = v38;

    if ((v30 & 1) != 0)
    {
      ++self->_modifiedRowCount;
      v25 = 1;
    }
    else
    {
      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:].cold.1();

      v25 = 0;
    }
    v11 = v23;
    v22 = v31;
LABEL_22:
    v9 = v37;
    goto LABEL_23;
  }
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[CCDatabaseUpdater _updateLocalInstanceRowId:provenanceRowId:].cold.1();
  v25 = 0;
LABEL_23:

  return v25;
}

- (BOOL)finish:(BOOL *)a3
{
  _BOOL4 v5;
  _BOOL4 v6;

  v5 = -[CCDatabaseUpdater _updateLocalHighestSequenceNumbers](self, "_updateLocalHighestSequenceNumbers");
  if (!v5)
    return v5;
  if (!self->_localInstanceAddedCount
    && !self->_localInstanceRemovedCount
    && !self->_localInstanceUpdatedCount
    && !self->_sharedItemAddedCount
    && !self->_sharedItemRemovedCount)
  {
    v6 = self->_sharedItemProvenanceUpdatedCount != 0;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v6 = 1;
  if (a3)
LABEL_8:
    *a3 = v6;
LABEL_9:
  if (!v6 || (v5 = -[CCDatabaseUpdater _updateLastDelta](self, "_updateLastDelta")))
    LOBYTE(v5) = 1;
  return v5;
}

- (unsigned)priorLocalInstanceCount
{
  return self->_priorLocalInstanceCount;
}

- (unsigned)modifiedRowCount
{
  return self->_modifiedRowCount;
}

- (unint64_t)updateVersion
{
  return self->_updateVersion;
}

- (unint64_t)priorVersion
{
  return self->_priorVersion;
}

- (NSNumber)updateValidityHash
{
  return self->_updateValidityHash;
}

- (NSNumber)setHash
{
  return self->_setHash;
}

- (NSNumber)priorValidityHash
{
  return self->_priorValidityHash;
}

- (unsigned)localInstanceAddedCount
{
  return self->_localInstanceAddedCount;
}

- (unsigned)localInstanceUpdatedCount
{
  return self->_localInstanceUpdatedCount;
}

- (unsigned)localInstanceRemovedCount
{
  return self->_localInstanceRemovedCount;
}

- (unsigned)sharedItemAddedCount
{
  return self->_sharedItemAddedCount;
}

- (unsigned)sharedItemRemovedCount
{
  return self->_sharedItemRemovedCount;
}

- (unsigned)sharedItemProvenanceUpdatedCount
{
  return self->_sharedItemProvenanceUpdatedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorValidityHash, 0);
  objc_storeStrong((id *)&self->_setHash, 0);
  objc_storeStrong((id *)&self->_updateValidityHash, 0);
  objc_storeStrong((id *)&self->_deviceRowId, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_localHighestMetaContentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_localHighestContentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_commandCache, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_encodedDescriptors, 0);
  objc_storeStrong((id *)&self->_itemTypeNumber, 0);
  objc_storeStrong((id *)&self->_startTimeMicros, 0);
  objc_storeStrong((id *)&self->_requestDescription, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "nil request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "nil database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "nil encodedDescriptors", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "nil deviceId", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_registerDevice
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a1 + 96) & 1) != 0)
    v3 = &stru_250991730;
  else
    v3 = CFSTR("Non-");
  v4 = *(_QWORD *)(a1 + 80);
  objc_msgSend((id)a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_237B25000, a2, OS_LOG_TYPE_DEBUG, "%@local deviceId: %@ not yet registered. Inserting new device record. %@", (uint8_t *)&v6, 0x20u);

}

- (void)_registerSetVersionAndValidity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to select prior set version with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteSourceItemIdHash:outProvenanceRowId:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Delete failed. %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)_deleteSourceItemIdHash:outProvenanceRowId:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13();
  objc_msgSend((id)OUTLINED_FUNCTION_17(v0, v1), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v3, v4, "Failed to build delete with params: {%@}, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_4();
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Failed to count modified rows after provenance update %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Update provenance rows for content state failed. %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13();
  objc_msgSend((id)OUTLINED_FUNCTION_17(v0, v1), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v3, v4, "Failed to build update with params: (%@}, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_4();
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.8()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Update provenance for metacontent failed. %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)tombstoneContentSequenceNumbersInRange:forDeviceRowId:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Update provenance for content failed. %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Delete dangling content records failed %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to retrieve the number of tombstones being deleted, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Delete failed. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)compactContiguousRunsOfDeletesInDatabase:(void *)a1 deletedCount:(NSObject *)a2 shouldDefer:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "commandString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, a2, v4, "Delete command: %@", v5);

  OUTLINED_FUNCTION_3_0();
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to clear prior state of deletion compaction. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)compactContiguousRunsOfDeletesInDatabase:(void *)a1 deletedCount:(NSObject *)a2 shouldDefer:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "commandString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, a2, v4, "Clear prior state of deletion compaction command: %@", v5);

  OUTLINED_FUNCTION_3_0();
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to extract content and metacontent state vectors. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Compact content sequence numbers failed. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "commandString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, a2, v4, "Compact content sequence numbers command: %@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Compact metacontent sequence numbers command failed. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_24_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "commandString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, a2, v4, "Compact metacontent sequence numbers command: %@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)insertContent:contentHash:sequenceNumber:onDeviceRowId:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Insert failed. %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)_insertContentIfNotExists:contentHash:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Failed to count modified rows after insert %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)_insertProvenanceForItemWithContentHash:(void *)a1 contentSequenceNumber:(NSObject *)a2 metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, v4, "contentSequenceNumber is unexpectedly nil %@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_selectDeviceRowId:options:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v6, v4, "Select failed. %@ error: %@", v5);

  OUTLINED_FUNCTION_18();
}

void __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(*(id *)(v0 + 32), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Select device row returned invalid row: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

void __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a2 + 32), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_16(&dword_237B25000, v3, v4, "Counted %@ item records in the database. %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_4();
}

void __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend(*(id *)(v0 + 32), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Select count returned invalid row: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)selectSourceItemIdHash:(uint64_t)a3 outLocalInstanceRowId:outProvenanceRowId:outInstanceHash:outContentHash:outContentSequenceNumber:isDuplicate:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_5(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v6, v4, "Record with sourceItemIdHash: %@ has already been updated - donated set (%@) contains items with duplicate sourceItemIdentifiers", v5);

  OUTLINED_FUNCTION_18();
}

void __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, v0, v1, "Expected itemRowId and hash from select but got unexpected row: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, v0, v1, "Expected instance hash and content hash from provenance table select but got unexpected row: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Expected deviceRowId from select but got unexpected row: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, v0, v1, "Expected sequence number from provenance table select but got unexpected row: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Failed to construct local instance enumerator. %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v4, v5, "Local instance enumeration failed. %@ error: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_4();
}

- (void)_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_237B25000, v0, v1, "Expected rowId from select but got unexpected row: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_updateSetVersionAndValidity
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, v4, "Could not update set version - update failed. %@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_incrementLocalHighestContentSequenceNumber
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to select local highest content sequence number with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_incrementLocalHighestMetaContentSequenceNumber
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to select local highest metacontent sequence number with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateLocalHighestSequenceNumbers
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, v4, "Could not update local highest content sequence number - update failed. %@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_updateLastDelta
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, v4, "Could not update last delta date - update failed. %@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_updateLocalInstanceRowId:provenanceRowId:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_237B25000, v2, v3, "Update failed. %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

@end
