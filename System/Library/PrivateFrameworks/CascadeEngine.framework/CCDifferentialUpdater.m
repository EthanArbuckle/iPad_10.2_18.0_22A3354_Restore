@implementation CCDifferentialUpdater

- (BOOL)addItemsWithContents:(id)a3 metaContents:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CCDifferentialUpdater addItemsWithContents:metaContents:].cold.2();
    goto LABEL_8;
  }
  v8 = objc_msgSend(v6, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CCDifferentialUpdater addItemsWithContents:metaContents:].cold.1();
LABEL_8:

    -[CCDifferentialUpdater abort](self, "abort");
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  self->_clientAddOrUpdateCount += objc_msgSend(v6, "count");
  if (!-[CCDifferentialUpdater _diffUpdateItemsWithContents:metaContents:](self, "_diffUpdateItemsWithContents:metaContents:", v6, v7))
  {
    -[CCDifferentialUpdater _complete:](self, "_complete:", 0);
    goto LABEL_9;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotifier, 0);
  objc_storeStrong((id *)&self->_diffUpdateCache, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_setWriter, 0);
  objc_storeStrong((id *)&self->_stateReader, 0);
  objc_storeStrong((id *)&self->_databaseUpdater, 0);
}

- (void)setDidCommit:(BOOL)a3
{
  self->_didCommit = a3;
}

- (BOOL)_diffUpdateItemsWithContents:(id)a3 metaContents:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  CCDatabaseUpdater *databaseUpdater;
  id v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  int v33;
  CCDatabaseUpdater *v34;
  char v35;
  int v36;
  NSObject *v37;
  CCDatabaseUpdater *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  unint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  char v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  uint8_t buf[4];
  NSObject *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  NSObject *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v53 = a4;
  v54 = v6;
  v52 = objc_msgSend(v6, "count");
  if (!v52)
  {
    v7 = 1;
    goto LABEL_44;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0x24BE15000uLL;
  while (1)
  {
    v11 = (void *)MEMORY[0x23B820268]();
    if (self->_interrupt)
      break;
    v12 = *(void **)(v10 + 1664);
    v13 = -[CCSet itemType](self->_set, "itemType");
    objc_msgSend(v54, "objectAtIndex:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v9;
    objc_msgSend(v12, "contentMessageForItemType:data:error:", v13, v14, &v63);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v63;

    if (!v15)
    {
      __biome_log_for_category();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[CCDifferentialUpdater _diffUpdateItemsWithContents:metaContents:].cold.1();

      v9 = v16;
      break;
    }
    v17 = *(void **)(v10 + 1664);
    v18 = -[CCSet itemType](self->_set, "itemType");
    objc_msgSend(v53, "objectAtIndex:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v16;
    objc_msgSend(v17, "metaContentMessageForItemType:data:error:", v18, v19, &v62);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v62;

    if (!v20)
    {
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v21;
        _os_log_error_impl(&dword_237B02000, v23, OS_LOG_TYPE_ERROR, "Failed to initialize metaContent message: %@", buf, 0xCu);
      }
      v29 = 1;
      v9 = v21;
      goto LABEL_31;
    }
    v22 = objc_alloc(MEMORY[0x24BE15678]);
    v61 = v21;
    v23 = objc_msgSend(v22, "initWithContent:metaContent:error:", v15, v20, &v61);
    v9 = v61;

    if (!v23)
    {
      __biome_log_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v65 = v15;
        v66 = 2112;
        v67 = v20;
        v68 = 2112;
        v69 = v9;
        _os_log_error_impl(&dword_237B02000, v25, OS_LOG_TYPE_ERROR, "Failed to initialize instance from content: %@ metaContent: %@ error: %@", buf, 0x20u);
      }
      v29 = 1;
      goto LABEL_30;
    }
    objc_msgSend(v20, "sourceItemIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CCHash64String();
    v25 = objc_claimAutoreleasedReturnValue();

    -[NSObject instanceIdentifier](v23, "instanceIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    databaseUpdater = self->_databaseUpdater;
    v59 = 0;
    v57 = 0;
    v58 = 0;
    v55 = 0;
    v56 = 0;
    LODWORD(v24) = -[CCDatabaseUpdater selectSourceItemIdHash:outLocalInstanceRowId:outProvenanceRowId:outInstanceHash:outContentHash:outContentSequenceNumber:isDuplicate:](databaseUpdater, "selectSourceItemIdHash:outLocalInstanceRowId:outProvenanceRowId:outInstanceHash:outContentHash:outContentSequenceNumber:isDuplicate:", v25, &v59, &v58, &v57, &v56, &v55, &v60);
    v47 = v59;
    v50 = v58;
    v49 = v57;
    v48 = v56;
    v27 = v55;
    if (!(_DWORD)v24)
      goto LABEL_28;
    v46 = v27;
    if (v60)
    {
      __biome_log_for_category();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 138412290;
      v65 = v25;
      v30 = v28;
      v31 = "Donated set contains multiple duplicate sourceItemIds (hash: %@) not donated previously";
LABEL_37:
      _os_log_error_impl(&dword_237B02000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
      goto LABEL_10;
    }
    if (v50)
    {
      if (objc_msgSend(v51, "isEqual:", v49))
      {
        if (!-[CCDifferentialUpdateCache addUnmodifiedSourceItemIdHash:](self->_diffUpdateCache, "addUnmodifiedSourceItemIdHash:", v25))
        {
          __biome_log_for_category();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v25;
            v30 = v28;
            v31 = "Donated set contains multiple duplicate sourceItemIds (hash: %@) matching a previously donated item";
            goto LABEL_37;
          }
LABEL_10:

        }
      }
      else
      {
        -[NSObject sharedIdentifier](v23, "sharedIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v45, "isEqual:", v48);
        v34 = self->_databaseUpdater;
        if (v33)
        {
          objc_msgSend(v20, "data");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[CCDatabaseUpdater updateMetaContent:localInstanceRowId:provenanceRowId:priorInstanceHash:instanceHash:contentHash:contentSequenceNumber:](v34, "updateMetaContent:localInstanceRowId:provenanceRowId:priorInstanceHash:instanceHash:contentHash:contentSequenceNumber:", v42, v47, v50, v49, v51, v45, v46);

          if ((v35 & 1) == 0)
            goto LABEL_27;
        }
        else
        {
          -[NSObject data](v15, "data");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "data");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[CCDatabaseUpdater updateContent:andMetaContent:localInstanceRowId:priorProvenanceRowId:contentHash:instanceHash:](v34, "updateContent:andMetaContent:localInstanceRowId:priorProvenanceRowId:contentHash:instanceHash:", v43, v40, v47, v50, v45, v51);

          if (!v36)
          {
LABEL_27:

            v27 = v46;
LABEL_28:
            v29 = 1;
            goto LABEL_29;
          }
        }

      }
      v29 = 4;
      v27 = v46;
      goto LABEL_29;
    }
    -[NSObject sharedIdentifier](v23, "sharedIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self->_databaseUpdater;
    objc_msgSend(v20, "data");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject data](v15, "data");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v39) = -[CCDatabaseUpdater insertItemWithSourceItemIdHash:instanceHash:contentHash:metaContent:content:](v39, "insertItemWithSourceItemIdHash:instanceHash:contentHash:metaContent:content:", v25, v51, v44, v41, v32);

    v27 = v46;
    if ((v39 & 1) == 0)
      goto LABEL_28;
    v29 = 4;
LABEL_29:

LABEL_30:
LABEL_31:

    objc_autoreleasePoolPop(v11);
    if (v29 == 4)
    {
      v7 = ++v8 >= v52;
      v10 = 0x24BE15000;
      if (v52 != v8)
        continue;
    }
    goto LABEL_43;
  }
  objc_autoreleasePoolPop(v11);
LABEL_43:

LABEL_44:
  return v7;
}

uint64_t __42__CCDifferentialUpdater__deleteStaleItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 81))
  {
    v5 = 0;
  }
  else if ((objc_msgSend(*(id *)(v4 + 64), "hasUnmodifiedSourceItemIdHash:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteSourceItemIdHash:", v3);
  }

  return v5;
}

- (BOOL)isIncremental
{
  return self->_isIncremental;
}

- (int64_t)incrementalErrorCode
{
  return self->_incrementalErrorCode;
}

- (unint64_t)modifiedRowCount
{
  return -[CCDatabaseUpdater modifiedRowCount](self->_databaseUpdater, "modifiedRowCount");
}

- (BOOL)_deleteStaleItems
{
  CCDatabaseUpdater *databaseUpdater;
  _QWORD v4[5];

  databaseUpdater = self->_databaseUpdater;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__CCDifferentialUpdater__deleteStaleItems__block_invoke;
  v4[3] = &unk_25098ADC8;
  v4[4] = self;
  return -[CCDatabaseUpdater enumerateUnmodifiedLocalInstancesUsingBlock:](databaseUpdater, "enumerateUnmodifiedLocalInstancesUsingBlock:", v4);
}

- (void)_complete:(BOOL)a3
{
  void (**completion)(id, BOOL);
  id v5;

  completion = (void (**)(id, BOOL))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    v5 = self->_completion;
    self->_completion = 0;

  }
}

+ (id)updaterForSet:(id)a3 withRequest:(id)a4 setWriter:(id)a5 changeNotifier:(id)a6 timeout:(double)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  dispatch_semaphore_t v15;
  dispatch_semaphore_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  id v30;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  uint64_t *v40;
  _QWORD *v41;
  double v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD *v45;
  _QWORD v46[3];
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = dispatch_semaphore_create(0);
  v16 = dispatch_semaphore_create(0);
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  v53 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v17 = MEMORY[0x24BDAC760];
  v47 = 0;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke;
  v43[3] = &unk_25098AC08;
  v45 = v46;
  v18 = v16;
  v44 = v18;
  v19 = (void *)MEMORY[0x23B8203DC](v43);
  _sharedQueue();
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_2;
  block[3] = &unk_25098ADA0;
  v21 = v12;
  v33 = v21;
  v22 = v13;
  v34 = v22;
  v23 = v11;
  v35 = v23;
  v40 = &v48;
  v24 = v14;
  v36 = v24;
  v25 = v19;
  v39 = v25;
  v26 = v15;
  v37 = v26;
  v27 = v18;
  v42 = a7;
  v38 = v27;
  v41 = v46;
  dispatch_async(v20, block);

  v28 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
  if (dispatch_semaphore_wait(v26, v28))
  {
    __biome_log_for_category();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[CCDifferentialUpdater updaterForSet:withRequest:setWriter:changeNotifier:timeout:].cold.1(a7);

    (*((void (**)(id, _QWORD))v25 + 2))(v25, 0);
    v30 = 0;
  }
  else
  {
    v30 = (id)v49[5];
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

  return v30;
}

intptr_t __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t, void *, _QWORD *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v29 = v3;
    _os_log_impl(&dword_237B02000, v2, OS_LOG_TYPE_DEFAULT, "Submitting transaction for request %@", buf, 0xCu);
  }

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1;
  v17 = &unk_25098AD78;
  v4 = *(void **)(a1 + 40);
  v18 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 88);
  v19 = v5;
  v25 = v6;
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 80);
  v22 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  v27 = *(_QWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 96);
  v23 = v7;
  v26 = v8;
  v9 = objc_msgSend(v4, "submitDatabaseTransactionUsingBlock:", &v14);
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (!v10)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  }
  objc_msgSend(v10, "setDidCommit:", v9, v14, v15, v16, v17);
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("aborted");
    v13 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)v9)
      v12 = CFSTR("committed");
    *(_DWORD *)buf = 138412546;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_237B02000, v11, OS_LOG_TYPE_DEFAULT, "Database update %@ for request %@", buf, 0x16u);
  }

}

BOOL __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  CCDifferentialUpdater *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = *MEMORY[0x24BE155F0];
    v31 = 0;
    objc_msgSend(MEMORY[0x24BE15658], "persistedKeyValueForKey:database:error:", v8, v5, &v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v31;
    objc_msgSend(v9, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = v10 == 0;
    else
      v12 = 0;
    if (!v12)
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v30 = *(_QWORD *)(a1 + 32);
        v29 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v33 = v29;
        v34 = 2112;
        v35 = v30;
        v36 = 2112;
        v37 = v10;
        _os_log_error_impl(&dword_237B02000, v13, OS_LOG_TYPE_ERROR, "Failed to find local device identifier for set: %@, request: %@, error: %@", buf, 0x20u);
      }

      v7 = 0;
      goto LABEL_18;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15668]), "initWithIdentifier:options:", v11, 1);

  }
  v14 = -[CCDifferentialUpdater initWithSet:device:request:setWriter:database:changeNotifier:completion:]([CCDifferentialUpdater alloc], "initWithSet:device:request:setWriter:database:changeNotifier:completion:", *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    v17 = *(NSObject **)(a1 + 72);
    v18 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 104) * 1000000000.0));
    if (dispatch_semaphore_wait(v17, v18))
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_2((uint64_t *)(a1 + 104), (uint64_t *)(a1 + 32), v19);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "_interrupt");
      objc_msgSend(*(id *)(a1 + 32), "timeout");
    }
    else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      *a3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "modifiedRowCount");
      v27 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) != 0;
      goto LABEL_19;
    }
  }
  else
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_1(v6, v20, v21, v22, v23, v24, v25, v26);

  }
LABEL_18:
  v27 = 0;
LABEL_19:

  return v27;
}

- (CCDifferentialUpdater)initWithSet:(id)a3 device:(id)a4 request:(id)a5 setWriter:(id)a6 database:(id)a7 changeNotifier:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CCDifferentialUpdater *v21;
  id v22;
  void *v23;
  double v24;
  uint64_t v25;
  CCDatabaseUpdater *databaseUpdater;
  uint64_t v27;
  CCDatabaseSetStateReader *stateReader;
  CCDatabaseUpdater *v29;
  id v30;
  CCDatabaseUpdater *v31;
  void *v32;
  NSObject *v33;
  CCDifferentialUpdater *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CCDatabaseUpdater *v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  uint64_t v48;
  id completion;
  CCDifferentialUpdateCache *v50;
  CCDifferentialUpdateCache *diffUpdateCache;
  NSObject *v52;
  CCSet *set;
  void *v54;
  os_log_t log;
  NSObject *loga;
  unint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  objc_super v65;
  uint8_t buf[4];
  os_log_t v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v64 = a6;
  v19 = a7;
  v63 = a8;
  v20 = a9;
  v65.receiver = self;
  v65.super_class = (Class)CCDifferentialUpdater;
  v21 = -[CCDifferentialUpdater init](&v65, sel_init);
  if (!v21)
  {
LABEL_35:
    v34 = v21;
    goto LABEL_36;
  }
  v62 = v16;
  v22 = objc_alloc(MEMORY[0x24BE15660]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSince1970");
  v25 = objc_msgSend(v22, "initWithDatabase:device:request:startTimeMicros:", v19, v17, v18, (uint64_t)(v24 * 1000000.0));
  databaseUpdater = v21->_databaseUpdater;
  v21->_databaseUpdater = (CCDatabaseUpdater *)v25;

  if (v21->_databaseUpdater)
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BE15658]), "initWithDatabaseAccess:", v19);
    stateReader = v21->_stateReader;
    v21->_stateReader = (CCDatabaseSetStateReader *)v27;

    objc_storeStrong((id *)&v21->_set, a3);
    objc_storeStrong((id *)&v21->_setWriter, a6);
    v21->_incrementalErrorCode = 0;
    v29 = v21->_databaseUpdater;
    v30 = v18;
    v31 = v29;
    objc_msgSend(v30, "device");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v62;
    if (v32)
    {
      LOBYTE(v33) = 1;
      goto LABEL_29;
    }
    if (!objc_msgSend(v30, "version"))
    {
      objc_msgSend(v30, "validity");
      v33 = objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
LABEL_29:

        v21->_isIncremental = (char)v33;
        v48 = MEMORY[0x23B8203DC](v20);
        completion = v21->_completion;
        v21->_completion = (id)v48;

        if (v21->_isIncremental)
          v50 = objc_alloc_init(CCDifferentialUpdateCache);
        else
          v50 = -[CCDifferentialUpdateCache initWithCapacity:]([CCDifferentialUpdateCache alloc], "initWithCapacity:", -[CCDatabaseUpdater priorLocalInstanceCount](v21->_databaseUpdater, "priorLocalInstanceCount"));
        diffUpdateCache = v21->_diffUpdateCache;
        v21->_diffUpdateCache = v50;

        objc_storeStrong((id *)&v21->_changeNotifier, a8);
        __biome_log_for_category();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          set = v21->_set;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCDatabaseUpdater priorLocalInstanceCount](v21->_databaseUpdater, "priorLocalInstanceCount"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v67 = (os_log_t)set;
          v16 = v62;
          v68 = 2112;
          v69 = (unint64_t)v54;
          _os_log_impl(&dword_237B02000, v52, OS_LOG_TYPE_DEFAULT, "Updating set: %@ stored local item instance count: %@", buf, 0x16u);

        }
        goto LABEL_35;
      }
    }
    v60 = v20;
    -[CCDatabaseUpdater priorValidityHash](v31, "priorValidityHash");
    v35 = objc_claimAutoreleasedReturnValue();
    v61 = v35;
    if (!v35)
    {
      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237B02000, v33, OS_LOG_TYPE_DEFAULT, "No prior set found - full update required", buf, 2u);
      }

      LOBYTE(v33) = 0;
      v21->_incrementalErrorCode = 11;
      goto LABEL_28;
    }
    v36 = (void *)v35;
    v59 = v30;
    -[CCDatabaseUpdater updateValidityHash](v31, "updateValidityHash");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v31;
    v39 = objc_msgSend(v36, "isEqual:", v37);

    if ((v39 & 1) == 0)
    {
      v31 = v38;
      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      v20 = v60;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        -[CCDatabaseUpdater updateValidityHash](v38, "updateValidityHash");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "validity");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v67 = v61;
        v68 = 2112;
        v69 = (unint64_t)v45;
        v70 = 2112;
        v71 = v46;
        _os_log_impl(&dword_237B02000, v33, OS_LOG_TYPE_DEFAULT, "Validity hash mismatch detected {prior: %@ requested: %@ (%@)} - full update required", buf, 0x20u);

        v16 = v62;
      }

      LOBYTE(v33) = 0;
      v21->_incrementalErrorCode = 8;
      v30 = v59;
      goto LABEL_28;
    }
    v40 = -[CCDatabaseUpdater priorVersion](v38, "priorVersion");
    v41 = -[CCDatabaseUpdater updateVersion](v38, "updateVersion");
    v42 = v41;
    v58 = v40;
    v43 = v41 >= v40;
    v31 = v38;
    v20 = v60;
    if (v43)
    {
      __biome_log_for_category();
      loga = objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT);
      v30 = v59;
      if (v42 != v58)
      {
        if (v47)
        {
          *(_DWORD *)buf = 134218240;
          v67 = (os_log_t)v58;
          v68 = 2048;
          v69 = v42;
          _os_log_impl(&dword_237B02000, loga, OS_LOG_TYPE_DEFAULT, "Validity and version evolution verified - set is eligible for incremental update from version (%llu) to (%llu)", buf, 0x16u);
        }

        LOBYTE(v33) = 1;
        goto LABEL_28;
      }
      if (v47)
      {
        *(_DWORD *)buf = 134218240;
        v67 = (os_log_t)v58;
        v68 = 2048;
        v69 = v58;
        _os_log_impl(&dword_237B02000, loga, OS_LOG_TYPE_DEFAULT, "Update set version (%llu) is equal to the prior version (%llu) - update may either be skipped or completed in full", buf, 0x16u);
      }

      LOBYTE(v33) = 0;
      v44 = 9;
    }
    else
    {
      log = (os_log_t)v41;
      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      v30 = v59;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v67 = log;
        v68 = 2048;
        v69 = v58;
        _os_log_impl(&dword_237B02000, v33, OS_LOG_TYPE_DEFAULT, "Update set version (%llu) is not greater than prior version (%llu) - full update required", buf, 0x16u);
      }

      LOBYTE(v33) = 0;
      v44 = 10;
    }
    v21->_incrementalErrorCode = v44;
LABEL_28:

    goto LABEL_29;
  }
  v34 = 0;
  v16 = v62;
LABEL_36:

  return v34;
}

- (unint64_t)priorVersion
{
  return -[CCDatabaseUpdater priorVersion](self->_databaseUpdater, "priorVersion");
}

- (BOOL)removeSourceItemIdentifier:(id)a3
{
  CCDatabaseUpdater *databaseUpdater;
  void *v5;
  int v6;

  databaseUpdater = self->_databaseUpdater;
  CCHash64String();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CCDatabaseUpdater deleteSourceItemIdHash:](databaseUpdater, "deleteSourceItemIdHash:", v5);

  if (v6)
    ++self->_clientRemoveCount;
  return v6;
}

- (BOOL)_tombstoneSet
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  CCDataResourceWriter *setWriter;
  uint8_t v20[8];
  uint64_t v21;

  if (self->_isIncremental)
  {
    __biome_log_for_category();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[CCDifferentialUpdater _tombstoneSet].cold.2(v2, v3, v4, v5, v6, v7, v8, v9);
LABEL_7:
    LOBYTE(v17) = 0;
    goto LABEL_8;
  }
  if (self->_clientAddOrUpdateCount)
  {
    __biome_log_for_category();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[CCDifferentialUpdater _tombstoneSet].cold.1(v2, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_7;
  }
  setWriter = self->_setWriter;
  v21 = 0;
  v17 = -[CCDataResourceWriter tombstoneResource:](setWriter, "tombstoneResource:", &v21);
  if (!v17)
    return v17;
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_237B02000, v2, OS_LOG_TYPE_DEFAULT, "Updater successfully tombstoned resource", v20, 2u);
  }
LABEL_8:

  return v17;
}

- (BOOL)_clearSetTombstoneStatus
{
  CCDataResourceWriter *setWriter;
  uint64_t v4;

  setWriter = self->_setWriter;
  v4 = 0;
  return -[CCDataResourceWriter clearTombstoneStatus:](setWriter, "clearTombstoneStatus:", &v4);
}

- (BOOL)finish:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  BOOL v10;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  unsigned __int8 v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  -[CCDifferentialUpdater _complete:](self, "_complete:", -[CCDifferentialUpdater _shouldCommit:](self, "_shouldCommit:", &v17));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  _sharedQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CCDifferentialUpdater_finish___block_invoke;
  block[3] = &unk_25098A910;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v14 + 24))
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v17;
      v8 = v17 ? CFSTR("the following local item instance") : CFSTR("NO");
      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(": (%u added, %u updated, %u removed) and shared item changes (%u added, %u removed, %u provenance updated)"), -[CCDatabaseUpdater localInstanceAddedCount](self->_databaseUpdater, "localInstanceAddedCount"), -[CCDatabaseUpdater localInstanceUpdatedCount](self->_databaseUpdater, "localInstanceUpdatedCount"), -[CCDatabaseUpdater localInstanceRemovedCount](self->_databaseUpdater, "localInstanceRemovedCount"), -[CCDatabaseUpdater sharedItemAddedCount](self->_databaseUpdater, "sharedItemAddedCount"), -[CCDatabaseUpdater sharedItemRemovedCount](self->_databaseUpdater, "sharedItemRemovedCount"), -[CCDatabaseUpdater sharedItemProvenanceUpdatedCount](self->_databaseUpdater, "sharedItemProvenanceUpdatedCount"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = CFSTR(".");
      }
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_237B02000, v6, OS_LOG_TYPE_DEFAULT, "Committed dataset update producing %@ changes%@", buf, 0x16u);
      if (v7)

    }
    if (v17)
      -[CCSetChangeNotifierProtocol notifyChangeToSet:](self->_changeNotifier, "notifyChangeToSet:", self->_set);
    if (v3)
    {
      if (!-[CCDifferentialUpdater _tombstoneSet](self, "_tombstoneSet"))
      {
LABEL_19:
        v10 = 0;
        goto LABEL_20;
      }
    }
    else if (v17 && !-[CCDifferentialUpdater _clearSetTombstoneStatus](self, "_clearSetTombstoneStatus"))
    {
      goto LABEL_19;
    }
  }
  v10 = *((_BYTE *)v14 + 24) != 0;
LABEL_20:
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __32__CCDifferentialUpdater_finish___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 82);
  return result;
}

- (BOOL)_shouldCommit:(BOOL *)a3
{
  char v5;
  _BOOL4 isIncremental;
  NSObject *v7;
  _BOOL4 v8;
  unsigned int v9;
  unsigned int clientRemoveCount;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t clientAddOrUpdateCount;
  int v22;
  NSObject *v23;
  unsigned int v24;
  NSObject *v26;
  int v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_isIncremental
    || !-[CCDatabaseUpdater priorLocalInstanceCount](self->_databaseUpdater, "priorLocalInstanceCount"))
  {
    goto LABEL_2;
  }
  clientAddOrUpdateCount = self->_clientAddOrUpdateCount;
  if ((_DWORD)clientAddOrUpdateCount)
  {
    v22 = -[CCDifferentialUpdateCache unmodifiedItemCount](self->_diffUpdateCache, "unmodifiedItemCount") == clientAddOrUpdateCount;
    if (-[CCDatabaseUpdater priorLocalInstanceCount](self->_databaseUpdater, "priorLocalInstanceCount") == v22)
    {
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_237B02000, v23, OS_LOG_TYPE_DEFAULT, "Full set update contains no modified item(s)", (uint8_t *)&v27, 2u);
      }

      goto LABEL_2;
    }
    if (-[CCDifferentialUpdater _deleteStaleItems](self, "_deleteStaleItems"))
      goto LABEL_2;
    return 0;
  }
  __biome_log_for_category();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_237B02000, v26, OS_LOG_TYPE_DEFAULT, "Full set update is empty - deleting stored items", (uint8_t *)&v27, 2u);
  }

  if ((-[CCDatabaseUpdater deleteAllLocalInstances](self->_databaseUpdater, "deleteAllLocalInstances") & 1) == 0)
    return 0;
LABEL_2:
  v5 = -[CCDatabaseUpdater finish:](self->_databaseUpdater, "finish:", a3);
  if ((v5 & 1) == 0)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCDifferentialUpdater _shouldCommit:].cold.1(v7, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_17;
  }
  isIncremental = self->_isIncremental;
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (isIncremental)
  {
    if (v8)
    {
      v9 = self->_clientAddOrUpdateCount;
      clientRemoveCount = self->_clientRemoveCount;
      v27 = 67109376;
      v28 = v9;
      v29 = 1024;
      v30 = clientRemoveCount;
      v11 = "Committing incremental set update. Client added or updated %u item(s) and removed %u item(s)";
      v12 = v7;
      v13 = 14;
LABEL_16:
      _os_log_impl(&dword_237B02000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, v13);
    }
  }
  else if (v8)
  {
    v24 = self->_clientAddOrUpdateCount;
    v27 = 67109120;
    v28 = v24;
    v11 = "Committing full set update. Client registered %u item(s)";
    v12 = v7;
    v13 = 8;
    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (void)abort
{
  -[CCDifferentialUpdater _interrupt](self, "_interrupt");
  -[CCDifferentialUpdater _complete:](self, "_complete:", 0);
}

- (void)_interrupt
{
  self->_interrupt = 1;
}

- (BOOL)mergeDelta:(id)a3 withDeltaMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  CCDatabaseSetStateReader *stateReader;
  void *v17;
  NSObject *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  CCDifferentialUpdater *v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  CCDifferentialUpdater *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  id v45;
  id v46;
  id v47[2];

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v8 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = 0;
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v9, v7, v47);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v47[0];

    if (v10)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDB9128]), "initWithData:metadata:", v6, v10);
      v46 = 0;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17958]), "initWithMergeableDelta:error:", v12, &v46);
      v14 = v46;
      v15 = v14;
      if (v13)
      {
        v30 = v14;
        v31 = v11;
        stateReader = self->_stateReader;
        v45 = 0;
        -[CCDatabaseSetStateReader constructDeviceMapping:](stateReader, "constructDeviceMapping:", &v45);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v45;
        if (v17)
        {
          v41 = 0;
          v42 = &v41;
          v43 = 0x2020000000;
          v44 = 0;
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke;
          v37[3] = &unk_25098ADF0;
          v29 = v17;
          v38 = v29;
          v39 = self;
          v40 = &v41;
          objc_msgSend(v13, "enumerateAtomsWithOptions:usingBlock:", 0, v37);
          if (*((_BYTE *)v42 + 24))
          {
            v19 = 0;
          }
          else
          {
            objc_msgSend(v13, "vectors");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "contents");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v22, "mutableCopy");

            objc_msgSend(v13, "vectors");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "removals");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "unionStateVector:", v24);

            objc_msgSend(v28, "allSiteIdentifiers");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_34;
            v32[3] = &unk_25098AE40;
            v33 = v29;
            v25 = v28;
            v34 = v25;
            v35 = self;
            v36 = &v41;
            objc_msgSend(v27, "enumerateObjectsUsingBlock:", v32);
            if (*((_BYTE *)v42 + 24))
              v19 = 0;
            else
              v19 = -[CCDatabaseUpdater deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord](self->_databaseUpdater, "deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord");

          }
          _Block_object_dispose(&v41, 8);
        }
        else
        {
          __biome_log_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[CCDifferentialUpdater mergeDelta:withDeltaMetadata:].cold.3();

          v19 = 0;
        }

        v15 = v30;
        v11 = v31;
      }
      else
      {
        __biome_log_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[CCDifferentialUpdater mergeDelta:withDeltaMetadata:].cold.2((uint64_t)v15, self, v18);
        v19 = 0;
      }

    }
    else
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CCDifferentialUpdater mergeDelta:withDeltaMetadata:].cold.1((uint64_t)v11, self, v12);
      v19 = 0;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  _BYTE *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  NSObject *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v6, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distributedSiteIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithData:encoding:", v10, 4);

  v12 = objc_alloc(MEMORY[0x24BDB9088]);
  objc_msgSend(v6, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "distributedSiteIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithIdentifier:", v15);

  objc_msgSend(*(id *)(a1 + 32), "deviceRowIdForSiteIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v38 = v11;
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "clock"));
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BE15680];
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "itemType");
    v41 = 0;
    objc_msgSend(v22, "contentMessageForItemType:data:error:", v23, v21, &v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v41;
    if (!v24)
    {
      __biome_log_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_2();
      v27 = v25;
      goto LABEL_22;
    }
    v36 = a4;
    v40 = v25;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE15708]), "initWithContent:error:", v24, &v40);
    v27 = v40;

    if (!v26)
    {
      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_3();
      goto LABEL_21;
    }
    v35 = v27;
    -[NSObject sharedIdentifier](v26, "sharedIdentifier");
    v37 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v39 = 0;
    v29 = objc_msgSend(v28, "selectProvenanceWithContentSequenceNumber:onDeviceRowId:outProvenanceRowId:", v20, v17, &v39);
    v30 = v39;
    if ((v29 & 1) != 0)
    {
      __biome_log_for_category();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412546;
          v43 = v38;
          v44 = 2112;
          v45 = v20;
          _os_log_impl(&dword_237B02000, v31, OS_LOG_TYPE_DEFAULT, "dropping atom with dot %@::%@ which we've already received", buf, 0x16u);
        }

        goto LABEL_19;
      }
      if (v32)
      {
        *(_DWORD *)buf = 138412802;
        v43 = v38;
        v44 = 2112;
        v45 = v20;
        v46 = 2112;
        v47 = v37;
        _os_log_impl(&dword_237B02000, v31, OS_LOG_TYPE_DEFAULT, "inserting atom with dot %@::%@ contentHash %@", buf, 0x20u);
      }

      v33 = v37;
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "insertContent:contentHash:sequenceNumber:onDeviceRowId:", v21, v37, v20, v17) & 1) != 0)goto LABEL_20;
      __biome_log_for_category();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_4();
    }
    else
    {
      __biome_log_for_category();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_5();
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *v36 = 1;
LABEL_19:
    v33 = v37;
LABEL_20:

    v27 = v35;
LABEL_21:

LABEL_22:
    v11 = v38;
    goto LABEL_23;
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_1();
LABEL_23:

}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_34(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "deviceRowIdForSiteIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_35;
    v12[3] = &unk_25098AE18;
    v8 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 48);
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 56);
    v13 = v9;
    v14 = v10;
    objc_msgSend(v8, "enumerateClockValuesForSiteIdentifier:usingBlock:", v5, v12);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      *a3 = 1;

  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_1();

  }
}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_35(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _BYTE *a6)
{
  NSObject *v8;

  if (a5 != 1
    && (objc_msgSend(*(id *)(a1[4] + 8), "tombstoneContentSequenceNumbersInRange:forDeviceRowId:", a2, a3, a1[5]) & 1) == 0)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_35_cold_1();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a6 = 1;
  }
}

- (BOOL)didCommit
{
  return self->_didCommit;
}

+ (void)updaterForSet:(double)a1 withRequest:setWriter:changeNotifier:timeout:.cold.1(double a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, v1, v2, "Timed out waiting for updater to be initialized for %lf seconds - %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

void __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_237B02000, a2, a3, "Failed to initialize updater - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_2(uint64_t *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 134218242;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_4_0(&dword_237B02000, a3, (uint64_t)a3, "Transaction timed out after %lf seconds. Aborting update - %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_8();
}

- (void)addItemsWithContents:metaContents:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, v0, (uint64_t)v0, "Donation contains asymmetrical batch counts: {%@, %@}", v1);
  OUTLINED_FUNCTION_8();
}

- (void)addItemsWithContents:metaContents:.cold.2()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  OUTLINED_FUNCTION_8_0();
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0(&dword_237B02000, v1, v2, "Donation contains unexpected batch objects: {%@, %@} expected: %@", v3, v4, v5, v6, 2u);

}

- (void)_tombstoneSet
{
  OUTLINED_FUNCTION_13(&dword_237B02000, a1, a3, "Updater can not tombstone incremental donations, aborting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_shouldCommit:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_237B02000, a1, a3, "Aborting after failure to finish update", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_diffUpdateItemsWithContents:metaContents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "Failed to initialize content message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)mergeDelta:(NSObject *)a3 withDeltaMetadata:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, a3, v6, "Failed to initialize CKMergeableDeltaMetadata from incoming data %@, %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)mergeDelta:(NSObject *)a3 withDeltaMetadata:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, a3, v6, "Failed to initialize CKAtomBatch from incoming mergeable delta %@, %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)mergeDelta:withDeltaMetadata:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "Failed to construct device mapping: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "Relaying changes not yet supported, dropping atoms for site identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_2()
{
  void *v0;
  objc_class *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_8_0();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v0, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0(&dword_237B02000, v4, v5, "%@ failed to be initialized and verified from itemBuffer length: %@ error: %@", v6, v7, v8, v9, 2u);

}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "Failed to initialize sharedItem: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, v0, (uint64_t)v0, "failed to insert content %@ with sequence number %@", v1);
  OUTLINED_FUNCTION_8();
}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_cold_5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, v0, (uint64_t)v0, "failed to search for existing provenance row for content hash %@ with sequence number %@", v1);
  OUTLINED_FUNCTION_8();
}

void __54__CCDifferentialUpdater_mergeDelta_withDeltaMetadata___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0();
  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2 + v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, v0, v5, "failed to delete content with sequence numbers in range (%@, %@)", (uint8_t *)&v6);

}

@end
