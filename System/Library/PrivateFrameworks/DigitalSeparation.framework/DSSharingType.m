@implementation DSSharingType

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSharingType");
    v3 = (void *)DSLogSharingType;
    DSLogSharingType = (uint64_t)v2;

  }
}

- (DSSharingType)initWithSource:(id)a3
{
  id v4;
  DSSharingType *v5;
  DSSharingType *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSSharingType;
  v5 = -[DSSharingType init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DSSharingType setSource:](v5, "setSource:", v4);
    v7 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    -[DSSharingType setPeople:](v6, "setPeople:", v7);

  }
  return v6;
}

- (void)addPerson:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DSSharingType people](self, "people");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removePerson:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DSSharingType people](self, "people");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (int64_t)score
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[DSSharingType source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "priority");

  return v5;
}

- (NSString)displayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[DSSharingType source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)localizedDetailText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DSSharingType source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedDetailTextByType:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DSSharingType source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  DSSharingType *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (DSSharingType *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DSSharingType source](self, "source");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSSharingType source](v4, "source");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)valueForKey:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("displayName")))
  {
    -[DSSharingType displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSArray)sortedPeople
{
  void *v2;
  void *v3;

  -[DSSharingType people](self, "people");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __29__DSSharingType_sortedPeople__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "score");
  if (v6 >= objc_msgSend(v5, "score"))
  {
    v8 = objc_msgSend(v4, "score");
    if (v8 <= objc_msgSend(v5, "score"))
    {
      objc_msgSend(v4, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "localizedStandardCompare:", v10);

    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSArray)allPeople
{
  void *v2;
  void *v3;

  -[DSSharingType people](self, "people");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25[2];
  uint8_t v26[16];
  _QWORD block[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DSSharingType source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[DSRestrictionStore isSourceRestricted:](DSRestrictionStore, "isSourceRestricted:", v9);

  if (v10)
  {
    v11 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      objc_msgSend(v8, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v13;
      _os_log_impl(&dword_227D24000, v12, OS_LOG_TYPE_INFO, "Cannot reset %@ due to restrictions", buf, 0xCu);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke;
    block[3] = &unk_24F081590;
    v29 = v7;
    v28 = v8;
    dispatch_async(v6, block);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v14 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingType);
    v15 = (id)DSLogSharingType;
    v16 = v15;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "stopAll", " enableTelemetry=YES ", v26, 2u);
    }

    -[DSSharingType people](self, "people");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_199;
    v20[3] = &unk_24F081608;
    v21 = v8;
    v22 = v6;
    v24 = v7;
    v19 = v18;
    v23 = v19;
    objc_copyWeak(v25, (id *)buf);
    v25[1] = v14;
    objc_msgSend(v21, "stopAllSharingWithCompletion:", v20);
    objc_destroyWeak(v25);

    objc_destroyWeak((id *)buf);
  }

}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[DSError errorWithCode:sourceName:](DSError, "errorWithCode:sourceName:", 6, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_199(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  NSObject *v19;
  _QWORD v20[4];
  _QWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = a1 + 32;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_ERROR))
      __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_199_cold_1(v4, v9);
    v10 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_201;
    block[3] = &unk_24F0815B8;
    v11 = &v29;
    v29 = *(id *)(a1 + 56);
    v27 = *(id *)(a1 + 32);
    v28 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = *(id *)(a1 + 48);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(WeakRetained, "removePerson:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v14);
    }

    v19 = *(NSObject **)(a1 + 40);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_2;
    v20[3] = &unk_24F0815E0;
    v21[1] = *(_QWORD *)(a1 + 72);
    v11 = (id *)v21;
    v21[0] = *(id *)(a1 + 56);
    dispatch_async(v19, v20);
  }

}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_201(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

}

uint64_t __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = (id)DSLogSharingType;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v3, OS_SIGNPOST_INTERVAL_END, v4, "stopAll", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopSharingWithPeople:(id)a3 asParticipantsOnQueue:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *queue;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35[2];
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  queue = a4;
  v8 = a5;
  -[DSSharingType source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[DSRestrictionStore isSourceRestricted:](DSRestrictionStore, "isSourceRestricted:", v10);

  if (v11)
  {
    v12 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend(v9, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v14;
      _os_log_impl(&dword_227D24000, v13, OS_LOG_TYPE_INFO, "Cannot reset %@ due to restrictions", buf, 0xCu);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke;
    block[3] = &unk_24F081590;
    v43 = v8;
    v42 = v9;
    dispatch_async(queue, block);

    v15 = v43;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    v16 = v28;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
          objc_msgSend(v9, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "participationForSourceName:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v22);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v17);
    }

    objc_initWeak(&location, self);
    v23 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingType);
    v24 = (id)DSLogSharingType;
    v25 = v24;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v25, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v23, "stopParticipants", " enableTelemetry=YES ", buf, 2u);
    }

    v26 = (id)DSLogSharingType;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v45 = v15;
      v46 = 2114;
      v47 = v27;
      _os_log_impl(&dword_227D24000, v26, OS_LOG_TYPE_INFO, "Stopping sharing of participants %{private}@ from source %{public}@", buf, 0x16u);

    }
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_205;
    v30[3] = &unk_24F081608;
    v31 = v9;
    v32 = queue;
    v34 = v8;
    v33 = v16;
    objc_copyWeak(v35, &location);
    v35[1] = v23;
    objc_msgSend(v31, "stopSharingWithParticipants:completion:", v15, v30);
    objc_destroyWeak(v35);

    objc_destroyWeak(&location);
  }

}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[DSError errorWithCode:sourceName:](DSError, "errorWithCode:sourceName:", 6, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_205(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  NSObject *v19;
  _QWORD v20[4];
  _QWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = a1 + 32;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_ERROR))
      __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_205_cold_1(v4, v9);
    v10 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_206;
    block[3] = &unk_24F0815B8;
    v11 = &v29;
    v29 = *(id *)(a1 + 56);
    v27 = *(id *)(a1 + 32);
    v28 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = *(id *)(a1 + 48);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(WeakRetained, "removePerson:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v14);
    }

    v19 = *(NSObject **)(a1 + 40);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_2;
    v20[3] = &unk_24F0815E0;
    v21[1] = *(_QWORD *)(a1 + 72);
    v11 = (id *)v21;
    v21[0] = *(id *)(a1 + 56);
    dispatch_async(v19, v20);
  }

}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_206(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

}

uint64_t __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = (id)DSLogSharingType;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v3, OS_SIGNPOST_INTERVAL_END, v4, "stopParticipants", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopSharingPeople:(id)a3 queue:(id)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id obj;
  uint64_t v21;
  NSObject *queue;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  id v30;
  DSSharingType *v31;
  NSObject *v32;
  id v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  queue = a4;
  v18 = a5;
  -[DSSharingType source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DSSharingType stopSharingWithPeople:asParticipantsOnQueue:completion:](self, "stopSharingWithPeople:asParticipantsOnQueue:completion:", v19, queue, v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_group_create();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v19;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v23)
    {
      v21 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_initWeak(&location, self);
          v13 = (id)DSLogSharingType;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            -[DSSharingType source](self, "source");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478083;
            v41 = v12;
            v42 = 2114;
            v43 = v15;
            _os_log_impl(&dword_227D24000, v13, OS_LOG_TYPE_INFO, "Stopping sharing of %{private}@ from source %{public}@", buf, 0x16u);

          }
          dispatch_group_enter(v10);
          v39 = v8;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke;
          v27[3] = &unk_24F081630;
          v28 = v8;
          v29 = v12;
          v30 = v9;
          v31 = self;
          objc_copyWeak(&v33, &location);
          v32 = v10;
          objc_msgSend(v12, "stopSharingSources:queue:completion:", v16, queue, v27);

          objc_destroyWeak(&v33);
          objc_destroyWeak(&location);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v23);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke_209;
    block[3] = &unk_24F081658;
    v25 = v9;
    v26 = v18;
    v17 = v9;
    dispatch_group_notify(v10, queue, block);

  }
}

void __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)DSLogSharingType;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      v18 = v8;
      objc_msgSend(v16, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v22 = v17;
      v23 = 2114;
      v24 = v19;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_227D24000, v18, OS_LOG_TYPE_ERROR, "Failed to stop sharing with %{private}@ from source %{public}@ because %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 2, v9, v10);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", WeakRetained);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_INFO))
    {
      v12 = *(void **)(a1 + 56);
      v13 = v8;
      objc_msgSend(v12, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v22 = v15;
      _os_log_impl(&dword_227D24000, v13, OS_LOG_TYPE_INFO, "Stopping sharing with %{private}@ complete", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "removePerson:", *(_QWORD *)(a1 + 40));
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke_209(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[DSError errorWithCode:underlyingErrors:](DSError, "errorWithCode:underlyingErrors:", 2, *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (DSSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSMutableOrderedSet)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
  objc_storeStrong((id *)&self->_people, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_199_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227D24000, v5, v6, "Failed to stop all sharing with %{public}@ because %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_205_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227D24000, v5, v6, "Failed to stop sharing with participants for %{public}@ because %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
