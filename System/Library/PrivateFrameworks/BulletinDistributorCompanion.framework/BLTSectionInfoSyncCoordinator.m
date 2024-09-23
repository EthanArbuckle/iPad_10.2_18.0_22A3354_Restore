@implementation BLTSectionInfoSyncCoordinator

- (BLTSectionInfoSyncCoordinator)initWithAlertingSectionIDs:(id)a3 infoProvider:(id)a4
{
  id v6;
  id v7;
  BLTSectionInfoSyncCoordinator *v8;
  uint64_t v9;
  id infoProvider;
  uint64_t v11;
  NSMutableArray *alertingSectionIDs;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *alertingSectionState;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)BLTSectionInfoSyncCoordinator;
  v8 = -[BLTSectionInfoSyncCoordinator init](&v31, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    infoProvider = v8->_infoProvider;
    v8->_infoProvider = (id)v9;

    v11 = objc_msgSend(v6, "mutableCopy");
    alertingSectionIDs = v8->_alertingSectionIDs;
    v8->_alertingSectionIDs = (NSMutableArray *)v11;

    v13 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(MEMORY[0x24BDBCE70], "sharedKeySetForKeys:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithSharedKeySet:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    alertingSectionState = v8->_alertingSectionState;
    v8->_alertingSectionState = (NSMutableDictionary *)v15;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v8->_alertingSectionIDs;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v22 = (void *)objc_opt_new();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_alertingSectionState, "setObject:forKeyedSubscript:", v22, v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }

    objc_initWeak(&location, v8);
    BLTWorkQueue();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v25, &location);
    v8->_stateHandler = os_state_add_handler();

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v8;
}

_DWORD *__73__BLTSectionInfoSyncCoordinator_initWithAlertingSectionIDs_infoProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  objc_class *v2;
  void *v3;
  void *v4;
  _DWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BLTStateDataWithTitleAndDescription(v3, (uint64_t)v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  self->_stateHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)BLTSectionInfoSyncCoordinator;
  -[BLTSectionInfoSyncCoordinator dealloc](&v3, sel_dealloc);
}

- (unint64_t)performSyncForSectionID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v16;
  NSObject *v17;
  unint64_t *p_mostRecentIndex;
  unint64_t mostRecentIndex;
  NSMutableArray **p_alertingSectionIDs;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _QWORD block[4];
  NSObject *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alertingSectionState, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || objc_msgSend(v11, "state") == 2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__BLTSectionInfoSyncCoordinator_performSyncForSectionID_queue_completion___block_invoke;
    block[3] = &unk_24D761B98;
    v26 = v10;
    dispatch_async(v9, block);
    v13 = 3;
    v14 = v26;
    goto LABEL_4;
  }
  blt_settings_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl(&dword_2173D9000, v16, OS_LOG_TYPE_DEFAULT, "Section %@ hasn't completed sync'ing", buf, 0xCu);
  }

  objc_msgSend(v12, "setClientCompletion:", v10);
  objc_msgSend(v12, "setClientQueue:", v9);
  if (objc_msgSend(v12, "state") == 1)
    goto LABEL_17;
  blt_settings_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_DEFAULT, "Moving %@ to front of send queue", buf, 0xCu);
  }

  p_mostRecentIndex = &self->_mostRecentIndex;
  mostRecentIndex = self->_mostRecentIndex;
  p_alertingSectionIDs = &self->_alertingSectionIDs;
  if (mostRecentIndex >= -[NSMutableArray count](self->_alertingSectionIDs, "count"))
  {
    blt_settings_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BLTSectionInfoSyncCoordinator performSyncForSectionID:queue:completion:].cold.1((uint64_t *)&self->_mostRecentIndex, (id *)&self->_alertingSectionIDs, v24);

    goto LABEL_17;
  }
  v21 = -[NSMutableArray indexOfObject:](*p_alertingSectionIDs, "indexOfObject:", v8);
  if (v21 == *p_mostRecentIndex + 1)
  {
LABEL_17:
    v13 = 2;
    goto LABEL_18;
  }
  v22 = v21;
  -[NSMutableArray objectAtIndexedSubscript:](*p_alertingSectionIDs, "objectAtIndexedSubscript:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](*p_alertingSectionIDs, "setObject:atIndexedSubscript:", v23, v22);

  -[NSMutableArray setObject:atIndexedSubscript:](*p_alertingSectionIDs, "setObject:atIndexedSubscript:", v8, *p_mostRecentIndex + 1);
  v13 = 0;
LABEL_18:
  if (self->_mostRecentIndexSinceSync != self->_mostRecentIndex)
    goto LABEL_5;
  blt_settings_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v14, OS_LOG_TYPE_DEFAULT, "Section info sync coordinator has not completed sync'ing any sections since last call", buf, 2u);
  }
  v13 = 1;
LABEL_4:

LABEL_5:
  self->_mostRecentIndexSinceSync = self->_mostRecentIndex;

  return v13;
}

uint64_t __74__BLTSectionInfoSyncCoordinator_performSyncForSectionID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)effectiveSectionInfoForSectionIDIndex:(unint64_t)a3
{
  NSMutableDictionary *alertingSectionState;
  void *v6;
  void *v7;
  void (**infoProvider)(id, void *);
  void *v9;
  void *v10;

  self->_mostRecentIndex = a3;
  alertingSectionState = self->_alertingSectionState;
  -[NSMutableArray objectAtIndexedSubscript:](self->_alertingSectionIDs, "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](alertingSectionState, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setState:", 1);

  infoProvider = (void (**)(id, void *))self->_infoProvider;
  -[NSMutableArray objectAtIndexedSubscript:](self->_alertingSectionIDs, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  infoProvider[2](infoProvider, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)sectionInfoSendCompleted:(unint64_t)a3
{
  NSMutableDictionary *alertingSectionState;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  alertingSectionState = self->_alertingSectionState;
  -[NSMutableArray objectAtIndexedSubscript:](self->_alertingSectionIDs, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](alertingSectionState, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "state") != 2)
  {
    objc_msgSend(v5, "setState:", 2);
    objc_msgSend(v5, "clientCompletion");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "clientQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v5, "clientQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __58__BLTSectionInfoSyncCoordinator_sectionInfoSendCompleted___block_invoke;
        block[3] = &unk_24D761AD0;
        v11 = v5;
        dispatch_async(v9, block);

      }
    }
  }

}

void __58__BLTSectionInfoSyncCoordinator_sectionInfoSendCompleted___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "clientCompletion");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_alertingSectionState, CFSTR("alertingSectionState"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_alertingSectionIDs, CFSTR("alertingSectionIDs"));
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_mostRecentIndex, CFSTR("mostRecentIndex"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)infoProvider
{
  return self->_infoProvider;
}

- (void)setInfoProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)alertingSectionIDs
{
  return self->_alertingSectionIDs;
}

- (void)setAlertingSectionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_alertingSectionIDs, a3);
}

- (NSMutableDictionary)alertingSectionState
{
  return self->_alertingSectionState;
}

- (void)setAlertingSectionState:(id)a3
{
  objc_storeStrong((id *)&self->_alertingSectionState, a3);
}

- (unint64_t)mostRecentIndex
{
  return self->_mostRecentIndex;
}

- (void)setMostRecentIndex:(unint64_t)a3
{
  self->_mostRecentIndex = a3;
}

- (unint64_t)mostRecentIndexSinceSync
{
  return self->_mostRecentIndexSinceSync;
}

- (void)setMostRecentIndexSinceSync:(unint64_t)a3
{
  self->_mostRecentIndexSinceSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingSectionState, 0);
  objc_storeStrong((id *)&self->_alertingSectionIDs, 0);
  objc_storeStrong(&self->_infoProvider, 0);
}

- (void)performSyncForSectionID:(uint64_t *)a1 queue:(id *)a2 completion:(NSObject *)a3 .cold.1(uint64_t *a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = objc_msgSend(*a2, "count");
  v6 = 134218240;
  v7 = v4;
  v8 = 2048;
  v9 = v5;
  _os_log_error_impl(&dword_2173D9000, a3, OS_LOG_TYPE_ERROR, "Most recent index (%lu) has completed section sync count (%lu)", (uint8_t *)&v6, 0x16u);
}

@end
