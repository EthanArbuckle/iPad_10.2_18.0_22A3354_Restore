@implementation BBDataProviderManager

- (id)rebuildSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BBDataProviderManager dataProviderForSectionID:](self, "dataProviderForSectionID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[BBDataProviderManager _queue_getSectionInfoForSectionID:](self, "_queue_getSectionInfoForSectionID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v9, "dataProviderIDs", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = -[BBDataProviderManager rebuildSectionInfo:forSectionID:](self, "rebuildSectionInfo:forSectionID:", v6, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

    }
    else if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
    {
      -[BBDataProviderManager rebuildSectionInfo:forSectionID:].cold.1();
    }

  }
  -[BBDataProviderManager _configureSectionInfo:forDataProvider:](self, "_configureSectionInfo:forDataProvider:", v6, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)reloadIdentityForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[BBDataProviderManager dataProviderForSectionID:](self, "dataProviderForSectionID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke;
    v9[3] = &unk_24C5649A0;
    v9[4] = self;
    v11 = v7;
    v10 = v8;
    objc_msgSend(v10, "reloadIdentityWithCompletion:", v9);

  }
  else if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
  {
    -[BBDataProviderManager reloadIdentityForSectionID:withCompletion:].cold.1();
  }

}

void __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke_2;
  v3[3] = &unk_24C5631E0;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

}

- (id)dataProviderForSectionID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BBLocalDataProviderStore dataProviderForSectionID:](self->_localDataProviderStore, "dataProviderForSectionID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[BBRemoteDataProviderConnectionResolver dataProviderForSectionID:](self->_remoteDataProviderResolver, "dataProviderForSectionID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_configureSectionInfo:(id)a3 forDataProvider:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint32_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "sectionIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v6;
  +[BBSectionInfo defaultSectionInfoForSection:](BBSectionInfo, "defaultSectionInfoForSection:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 || !v7)
    objc_msgSend(v5, "updateWithDefaultSectionInfo:", v7);
  if (objc_msgSend(v8, "suppressFromSettings"))
  {

    v5 = 0;
  }
  if (v5)
    v9 = v5;
  else
    v9 = v8;
  v10 = v9;

  objc_msgSend(v57, "defaultSubsectionInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {

  }
  else
  {
    objc_msgSend(v10, "subsections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      v56 = 0;
      goto LABEL_57;
    }
  }
  v54 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v57, "defaultSubsectionInfos");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v67 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v21, "subsectionID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_msgSend(v15, "containsObject:", v22) & 1) == 0)
        {
          objc_msgSend(v14, "addObject:", v21);
          objc_msgSend(v15, "addObject:", v22);
        }
        else
        {
          v23 = BBLogDataProvider;
          if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v73 = v22;
            v74 = 2112;
            v75 = v55;
            _os_log_error_impl(&dword_20CCB9000, v23, OS_LOG_TYPE_ERROR, "BBServer: Ignoring empty or duplicate subsectionID (%@) from data provider %@.", buf, 0x16u);
          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v10, "subsections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(v30, "subsectionID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v30, v31);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v27);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v32 = v14;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v59 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
        objc_msgSend(v37, "subsectionID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          v42 = BBLogDataProvider;
          if (!os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
            goto LABEL_51;
          *(_DWORD *)buf = 138412290;
          v73 = v55;
          v43 = v42;
          v44 = "BBServer: Ignoring subsection with no subsectionID, from data provider %@.";
          v45 = 12;
LABEL_48:
          _os_log_error_impl(&dword_20CCB9000, v43, OS_LOG_TYPE_ERROR, v44, buf, v45);
          goto LABEL_51;
        }
        if (objc_msgSend(v37, "sectionType") != 2)
        {
          v46 = BBLogDataProvider;
          if (!os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
            goto LABEL_51;
          *(_DWORD *)buf = 138412546;
          v73 = v38;
          v74 = 2112;
          v75 = v55;
          v43 = v46;
          v44 = "BBServer: Ignoring subsection (%@) not flagged as BBSectionTypeSubsection from data provider %@.";
          v45 = 22;
          goto LABEL_48;
        }
        objc_msgSend(v24, "objectForKey:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          v40 = v39 == 0;
        else
          v40 = 0;
        if (v40)
        {
          objc_msgSend(v37, "setSectionID:", v55);
          objc_msgSend(v10, "_addSubsection:", v37);
          v41 = v37;
          objc_msgSend(v24, "removeObjectForKey:", v38);
LABEL_50:
          objc_msgSend(v56, "addObject:", v41);
          objc_msgSend(v57, "displayNameForSubsectionID:", v38);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setDisplayName:", v47);

          goto LABEL_51;
        }
        v41 = v39;
        objc_msgSend(v39, "updateWithDefaultSectionInfo:", v37);
        objc_msgSend(v24, "removeObjectForKey:", v38);
        if (v41)
          goto LABEL_50;
LABEL_51:

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v34);
  }

  if (objc_msgSend(v24, "count"))
  {
    v48 = (void *)BBLogDataProvider;
    if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      objc_msgSend(v24, "allKeys");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v55;
      v74 = 2114;
      v75 = v50;
      _os_log_impl(&dword_20CCB9000, v49, OS_LOG_TYPE_DEFAULT, "Abandoned subsections for data provider <%{public}@>, removing them: %{public}@", buf, 0x16u);

    }
  }

  v8 = v54;
LABEL_57:
  if (objc_msgSend(v56, "count"))
    v51 = v56;
  else
    v51 = 0;
  objc_msgSend(v10, "setSubsections:", v51);
  v52 = v10;

  return v52;
}

uint64_t __67__BBDataProviderManager_reloadIdentityForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)noteSettingsChanged:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[BBDataProviderManager dataProviderForSectionID:](self, "dataProviderForSectionID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "noteSectionInfoDidChange:", v6);
  }
  else if (os_log_type_enabled((os_log_t)BBLogDataProvider, OS_LOG_TYPE_ERROR))
  {
    -[BBDataProviderManager noteSettingsChanged:forSectionID:].cold.1();
  }

}

- (BBDataProviderManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  BBDataProviderManager *v9;
  BBDataProviderManager *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *loadDataProviderQueue;
  uint64_t v14;
  BBRemoteDataProviderConnectionResolver *remoteDataProviderResolver;
  NSMutableDictionary *v16;
  NSMutableDictionary *parentFactoriesBySectionID;

  v7 = a3;
  v8 = a4;
  v9 = -[BBDataProviderManager init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderManager.loadDataProviderQueue", v11);
    loadDataProviderQueue = v10->_loadDataProviderQueue;
    v10->_loadDataProviderQueue = (OS_dispatch_queue *)v12;

    v10->_loadQueueSuspended = 1;
    dispatch_suspend((dispatch_object_t)v10->_loadDataProviderQueue);
    +[BBRemoteDataProviderConnectionResolver resolverWithDelegate:](BBRemoteDataProviderConnectionResolver, "resolverWithDelegate:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    remoteDataProviderResolver = v10->_remoteDataProviderResolver;
    v10->_remoteDataProviderResolver = (BBRemoteDataProviderConnectionResolver *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parentFactoriesBySectionID = v10->_parentFactoriesBySectionID;
    v10->_parentFactoriesBySectionID = v16;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_loadQueueSuspended)
    dispatch_resume((dispatch_object_t)self->_loadDataProviderQueue);
  v3.receiver = self;
  v3.super_class = (Class)BBDataProviderManager;
  -[BBDataProviderManager dealloc](&v3, sel_dealloc);
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24C5686F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("    "));
      --v6;
    }
    while (v6);
  }
  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%@: %p>"), v5, v9, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_suspend((dispatch_object_t)self->_queue);
  if (self->_loadQueueSuspended)
    objc_msgSend(v10, "appendFormat:", CFSTR(" [SUSPENDED]"));
  if (-[NSMutableDictionary count](self->_parentFactoriesBySectionID, "count"))
  {
    objc_msgSend(v10, "appendFormat:", CFSTR("    %@Parent Sections"), v5);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_parentFactoriesBySectionID;
    v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "appendFormat:", CFSTR("        %@%@"), v5, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

  }
  v16 = a3 + 1;
  -[BBLocalDataProviderStore debugDescriptionWithChildren:](self->_localDataProviderStore, "debugDescriptionWithChildren:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("\n%@"), v17);

  -[BBRemoteDataProviderConnectionResolver debugDescriptionWithChildren:](self->_remoteDataProviderResolver, "debugDescriptionWithChildren:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("\n%@"), v18);

  dispatch_resume((dispatch_object_t)self->_queue);
  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)-[BBDataProviderManager debugDescriptionWithChildren:](self, "debugDescriptionWithChildren:", 0);
}

- (void)loadAllDataProvidersAndPerformMigration:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_loadQueueSuspended = 0;
  dispatch_resume((dispatch_object_t)self->_loadDataProviderQueue);
  -[BBLocalDataProviderStore loadAllDataProvidersAndPerformMigration:](self->_localDataProviderStore, "loadAllDataProvidersAndPerformMigration:", v3);
}

- (id)localSectionIdentifiersFromDismissalSectionIdentifer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[BBDataProviderManager _queue_dataProvidersForUniversalSectionID:](self, "_queue_dataProvidersForUniversalSectionID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "sectionIdentifier", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v5, "addObject:", v4);
  }

  return v5;
}

- (void)performBlockOnDataProviders:(id)a3
{
  id v5;
  uint64_t v6;
  BBLocalDataProviderStore *localDataProviderStore;
  id v8;
  BBRemoteDataProviderConnectionResolver *remoteDataProviderResolver;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProviderManager.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = MEMORY[0x24BDAC760];
  localDataProviderStore = self->_localDataProviderStore;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke;
  v14[3] = &unk_24C565380;
  v14[4] = self;
  v8 = v5;
  v15 = v8;
  -[BBLocalDataProviderStore performBlockOnDataProviders:](localDataProviderStore, "performBlockOnDataProviders:", v14);
  remoteDataProviderResolver = self->_remoteDataProviderResolver;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_3;
  v12[3] = &unk_24C565380;
  v12[4] = self;
  v13 = v8;
  v10 = v8;
  -[BBRemoteDataProviderConnectionResolver performBlockOnDataProviders:](remoteDataProviderResolver, "performBlockOnDataProviders:", v12);

}

void __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_4;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __53__BBDataProviderManager_performBlockOnDataProviders___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)parentSectionDataProviderFactoryForSectionID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parentFactoriesBySectionID, "objectForKey:", a3);
}

- (id)universalSectionIDForSectionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BBDataProviderManager dataProviderForSectionID:](self, "dataProviderForSectionID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "universalSectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BBDataProviderManager parentSectionDataProviderFactoryForSectionID:](self, "parentSectionDataProviderFactoryForSectionID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "universalSectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_queue_dataProvidersForUniversalSectionID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[BBLocalDataProviderStore dataProvidersForUniversalSectionID:](self->_localDataProviderStore, "dataProvidersForUniversalSectionID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBRemoteDataProviderConnectionResolver dataProvidersForUniversalSectionID:](self->_remoteDataProviderResolver, "dataProvidersForUniversalSectionID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unionSet:", v7);
  objc_msgSend(v6, "unionSet:", v8);

  return v6;
}

- (id)_queue_getSectionInfoForSectionID:(id)a3
{
  return (id)-[BBDataProviderManagerDelegate dpManager:sectionInfoForSectionID:](self->_delegate, "dpManager:sectionInfoForSectionID:", self, a3);
}

- (void)dataProviderStore:(id)a3 didAddParentSectionFactory:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  BBDataProviderManager *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__BBDataProviderManager_dataProviderStore_didAddParentSectionFactory___block_invoke;
  v8[3] = &unk_24C562E50;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __70__BBDataProviderManager_dataProviderStore_didAddParentSectionFactory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
    objc_msgSend(*(id *)(a1 + 40), "_queue_getSectionInfoForSectionID:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "sectionInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "updateWithDefaultSectionInfo:", v4);

      objc_msgSend(*(id *)(a1 + 32), "setSectionInfo:", v3);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "dpManager:addParentSectionFactory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    v2 = v5;
  }

}

- (void)dataProviderStore:(id)a3 didAddDataProvider:(id)a4 performMigration:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *loadDataProviderQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v9 = a4;
  v10 = a6;
  loadDataProviderQueue = self->_loadDataProviderQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke;
  v14[3] = &unk_24C5653A8;
  v14[4] = self;
  v15 = v9;
  v17 = a5;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(loadDataProviderQueue, v14);

}

void __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke_2;
  v5[3] = &unk_24C5653A8;
  v5[4] = v2;
  v6 = v3;
  v8 = *(_BYTE *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);

}

void __90__BBDataProviderManager_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v9 = 138543618;
    *(_QWORD *)&v9[4] = v4;
    *(_WORD *)&v9[12] = 2114;
    *(_QWORD *)&v9[14] = v5;
    v6 = v4;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ adding data provider %{public}@ to BBServer", v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_configureDataProvider:performMigration:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "startWatchdog");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dpManager:addDataProvider:withSectionInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7);
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (void)dataProviderStore:(id)a3 didRemoveDataProvider:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__BBDataProviderManager_dataProviderStore_didRemoveDataProvider___block_invoke;
  v8[3] = &unk_24C562E50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __65__BBDataProviderManager_dataProviderStore_didRemoveDataProvider___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v18 = 138543618;
    *(_QWORD *)&v18[4] = v4;
    *(_WORD *)&v18[12] = 2114;
    *(_QWORD *)&v18[14] = v5;
    v6 = v4;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing data provider %{public}@ from BBServer", v18, 0x16u);

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_queue_getSectionInfoForSectionID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "factorySectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v9, "factorySectionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_queue_getSectionInfoForSectionID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v13, "_dissociateDataProviderSectionInfo:", v9);

  }
  v15 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v16 = *(void **)(v15 + 8);
  objc_msgSend(v14, "sectionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dpManager:removeDataProviderSectionID:", v15, v17);

}

- (id)_configureDataProvider:(id)a3 performMigration:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    -[BBDataProviderManager _queue_getSectionInfoForSectionID:](self, "_queue_getSectionInfoForSectionID:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v8 = objc_msgSend(v6, "canPerformMigration");
  -[BBDataProviderManager _queue_getSectionInfoForSectionID:](self, "_queue_getSectionInfoForSectionID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
LABEL_5:
    v12 = 0;
    v11 = 0;
    goto LABEL_6;
  }
  v11 = (void *)objc_msgSend(v9, "copy");
  v12 = 1;
LABEL_6:
  -[BBDataProviderManager _configureSectionInfo:forDataProvider:](self, "_configureSectionInfo:forDataProvider:", v10, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 && v11)
  {
    v15 = (void *)objc_msgSend(v13, "copy");
    if (objc_msgSend(v6, "migrateSectionInfo:oldSectionInfo:", v15, v11))
    {
      v16 = BBLogMigration;
      if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138544130;
        v20 = v7;
        v21 = 2114;
        v22 = v11;
        v23 = 2114;
        v24 = v14;
        v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "Data provider <%{public}@> performed settings migration.\n\tPrevious build settings:   %{public}@\n\tPre-migration settings:    %{public}@\n\tMigrated (final) settings: %{public}@", (uint8_t *)&v19, 0x2Au);
      }

      goto LABEL_16;
    }

  }
  v17 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "Section settings for data provider %{public}@: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  v15 = v14;
LABEL_16:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFactoriesBySectionID, 0);
  objc_storeStrong((id *)&self->_loadDataProviderQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteDataProviderResolver, 0);
  objc_storeStrong((id *)&self->_localDataProviderStore, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)noteSettingsChanged:forSectionID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20CCB9000, v0, v1, "%s no data provider found for: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)rebuildSectionInfo:forSectionID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20CCB9000, v0, v1, "%s no data provider found for: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)reloadIdentityForSectionID:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20CCB9000, v0, v1, "%s no data provider found for: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
