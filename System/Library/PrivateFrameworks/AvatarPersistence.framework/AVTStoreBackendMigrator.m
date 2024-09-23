@implementation AVTStoreBackendMigrator

- (AVTStoreBackendMigrator)initWithEnvironment:(id)a3
{
  id v5;
  AVTStoreBackendMigrator *v6;
  uint64_t v7;
  AVTUILogger *logger;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTStoreBackendMigrator;
  v6 = -[AVTStoreBackendMigrator init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    logger = v6->_logger;
    v6->_logger = (AVTUILogger *)v7;

    objc_storeStrong((id *)&v6->_environment, a3);
  }

  return v6;
}

- (BOOL)migrateContentFromSource:(id)a3 toDestination:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  -[AVTStoreBackendMigrator logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__AVTStoreBackendMigrator_migrateContentFromSource_toDestination_error___block_invoke;
  v15[3] = &unk_24DD32B58;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v18 = &v20;
  v19 = &v26;
  v12 = v9;
  v17 = v12;
  objc_msgSend(v10, "migratingPersistedContent:", v15);

  v13 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
    *a5 = objc_retainAutorelease((id)v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13 != 0;
}

void __72__AVTStoreBackendMigrator_migrateContentFromSource_toDestination_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logMigratingSource:", v3);

  objc_msgSend(*(id *)(a1 + 40), "createSourceBackend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarFetchRequest requestForAllAvatars](AVTAvatarFetchRequest, "requestForAllAvatars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "avatarsForFetchRequest:error:", v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7 != 0;
  v8 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(v8, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logReadingError:", v19);
LABEL_10:

    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(id *)(v11 + 40);
  objc_msgSend(v8, "updatedRecordsForMigratingRecords:source:destinationBackend:error:", v7, v9, v10, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), v23);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v12 != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logErrorUpdatingRecordsForMigration:", v20);
    goto LABEL_9;
  }
  v13 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "saveAvatars:error:", v12, &v22);
  objc_storeStrong((id *)(v14 + 40), v22);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v15;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logSavingError:", v20);
    goto LABEL_9;
  }
  v16 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v21 = *(id *)(v17 + 40);
  v18 = objc_msgSend(v16, "finalizeMigration:", &v21);
  objc_storeStrong((id *)(v17 + 40), v21);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v18;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logErrorDeletingMigratedContent:", v20);
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:

}

- (id)updatedRecordsForMigratingRecords:(id)a3 source:(id)a4 destinationBackend:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[AVTAvatarFetchRequest requestForAllAvatars](AVTAvatarFetchRequest, "requestForAllAvatars");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "avatarsForFetchRequest:error:", v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "avt_map:", &__block_literal_global_7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v17 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v15, "containsObject:", v19);

        if (v20)
        {
          -[AVTStoreBackendMigrator logger](self, "logger");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logFoundExistingRecordDuringMigration");
        }
        else
        {
          objc_msgSend(v11, "migratedRecordFromRecord:index:totalCount:", v18, v17, objc_msgSend(v10, "count"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v21);
        }

        ++v17;
      }
      while (v17 < objc_msgSend(v10, "count"));
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __93__AVTStoreBackendMigrator_updatedRecordsForMigratingRecords_source_destinationBackend_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
