@implementation HDSourceQueryServer

- (HDSourceQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSourceQueryServer *v11;
  objc_super v13;

  v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSourceQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v13, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
    v11->_deliversUpdates = objc_msgSend(v10, "shouldDeactivateAfterInitialResults");

  return v11;
}

- (BOOL)_shouldListenForUpdates
{
  return self->_deliversUpdates;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableSet *v20;
  void (**v21)(void *, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  NSMutableSet *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableSet *v38;
  NSMutableSet *sources;
  NSMutableSet *v40;
  NSMutableSet *v41;
  void *v42;
  void *v43;
  id obj;
  id v45;
  void *v46;
  id v47;
  void *v48;
  NSMutableSet *v49;
  void *v50;
  NSMutableSet *v51;
  objc_super v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD aBlock[4];
  id v58;
  id v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)HDSourceQueryServer;
  -[HDQueryServer _queue_start](&v52, sel__queue_start);
  if (self)
  {
    -[HDQueryServer clientProxy](self, "clientProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[HDQueryServer sampleType](self, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v6 = v4;
  v7 = v5;
  if (self)
  {
    -[HDQueryServer profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDQueryServer profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithProfile:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v6, &v51);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      v32 = 0;
LABEL_44:

      goto LABEL_45;
    }
    if (!objc_msgSend(v12, "canRead"))
    {
      if (-[HDQueryServer _shouldStopProcessingQuery](self, "_shouldStopProcessingQuery"))
      {
        v19 = 0;
        v20 = 0;
        v32 = 0;
        goto LABEL_43;
      }
      goto LABEL_40;
    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = (void *)objc_msgSend((id)objc_msgSend(v6, "dataObjectClass"), "hd_dataEntityClass");
    -[HDQueryServer profile](self, "profile");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v18 = (void *)v16;
    v60 = 0;
    v50 = v17;
    objc_msgSend(v15, "sourceIDsForSamplesWithType:profile:predicate:error:", v6, v16);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = (NSMutableSet *)v60;

    if (!v19)
    {

      v32 = 0;
      v11 = v50;
      goto LABEL_43;
    }
    v49 = v20;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__HDSourceQueryServer__sourcesForObjectsOfType_filter_error___block_invoke;
    aBlock[3] = &unk_1E6CECE10;
    v58 = v9;
    obj = v14;
    v47 = v14;
    v59 = v47;
    v21 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    objc_msgSend(v13, "restrictedSourceEntities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v9;
    v48 = v19;
    if (v22)
    {
      v45 = v7;
      v43 = v3;
      objc_msgSend(v13, "restrictedSourceEntities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hk_map:", &__block_literal_global_35);
      v24 = v19;
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v26 = v24;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v54 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
            if (objc_msgSend(v25, "containsObject:", v31))
              v21[2](v21, v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v28);
      }

      v3 = v43;
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v25 = v19;
      v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (!v33)
        goto LABEL_19;
      v34 = v33;
      v45 = v7;
      v35 = *(_QWORD *)v54;
LABEL_30:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v25);
        v37 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v36);
        if (-[HDQueryServer _shouldStopProcessingQuery](self, "_shouldStopProcessingQuery"))
          break;
        v21[2](v21, v37);
        if (v34 == ++v36)
        {
          v34 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v34)
            goto LABEL_30;
          break;
        }
      }
    }
    v7 = v45;
LABEL_19:

    v19 = v47;
    v20 = v49;
    v11 = v50;
    if (-[HDQueryServer _shouldStopProcessingQuery](self, "_shouldStopProcessingQuery"))
    {
      v32 = 0;
      v9 = v46;
LABEL_43:

      goto LABEL_44;
    }
    if (v19)
    {
      objc_storeStrong((id *)&self->_sources, obj);
      v9 = v46;
      if (!v49)
      {
        v20 = 0;
LABEL_42:
        v32 = self->_sources;
        goto LABEL_43;
      }
      goto LABEL_39;
    }
    v9 = v46;
    if (v49)
    {
      v38 = v49;
LABEL_39:
      sources = objc_retainAutorelease(v49);
      v51 = sources;
      v20 = sources;
LABEL_41:

      goto LABEL_42;
    }
LABEL_40:
    v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = 0;
    v19 = 0;
    sources = self->_sources;
    self->_sources = v40;
    goto LABEL_41;
  }
  v32 = 0;
LABEL_45:

  v41 = v51;
  -[HDQueryServer queryUUID](self, "queryUUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    objc_msgSend(v3, "client_deliverError:forQuery:", v41, v42);
  else
    objc_msgSend(v3, "client_deliverSources:forQuery:", v32, v42);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  HDSourceQueryServer *v8;

  v5 = a3;
  if (!-[HDQueryServer _shouldStopProcessingQuery](self, "_shouldStopProcessingQuery"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__HDSourceQueryServer_samplesAdded_anchor___block_invoke;
    v6[3] = &unk_1E6CE8080;
    v7 = v5;
    v8 = self;
    -[HDQueryServer onQueue:](self, "onQueue:", v6);

  }
}

void __43__HDSourceQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSObject *v22;
  id *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3 || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "containsObject:", v3) & 1) != 0)
      goto LABEL_32;
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "sampleType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v4, "readAuthorizationStatusForType:error:", v5, &v33);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;

    if (!v6)
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v7;
        _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status; ignoring added samples: %{public}@",
          buf,
          0xCu);
      }
      goto LABEL_31;
    }
    if (!objc_msgSend(v6, "canRead"))
    {
LABEL_31:

LABEL_32:
      return;
    }
    objc_msgSend(v6, "restrictedSourceEntities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "restrictedSourceEntities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_30;
      objc_msgSend(*(id *)(a1 + 40), "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sourceManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v12, "clientSourceForSourceEntity:error:", v10, &v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v32;

      if (!v13)
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v36 = v14;
          _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve client source: %{public}@:", buf, 0xCu);
        }
      }
      v16 = objc_msgSend(v13, "isEqual:", v3);

      if ((v16 & 1) == 0)
      {
LABEL_30:

        goto LABEL_31;
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "filter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = *(id *)(a1 + 32);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v29 != v20)
              objc_enumerationMutation(v17);
            if ((objc_msgSend(v10, "acceptsDataObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i)) & 1) != 0)
            {

              goto LABEL_26;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v19)
            continue;
          break;
        }
      }
    }
    else
    {
LABEL_26:
      v23 = *(id **)(a1 + 40);
      v17 = v3;
      if (v23)
      {
        if ((objc_msgSend(v23, "_shouldStopProcessingQuery") & 1) == 0)
        {
          objc_msgSend(v23[26], "addObject:", v17);
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v17, 0);
          objc_msgSend(v23, "clientProxy");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v23[26];
          objc_msgSend(v23, "queryUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "client_deliverUpdatedSources:added:forQuery:", v26, v24, v27);

        }
      }
    }

    goto LABEL_30;
  }
}

void __61__HDSourceQueryServer__sourcesForObjectsOfType_filter_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "clientSourceForPersistentID:error:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __61__HDSourceQueryServer__sourcesForObjectsOfType_filter_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
