@implementation HFCameraClipPlayerQueueUpdate

- (HFCameraClipPlayerQueueUpdate)initWithClipManager:(id)a3 clips:(id)a4 targetPosition:(id)a5 queuedItems:(id)a6 queueLimit:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HFCameraClipPlayerQueueUpdate *v17;
  HFCameraClipPlayerQueueUpdate *v18;
  uint64_t v19;
  NSArray *initialQueuedItems;
  uint64_t v21;
  NSDictionary *initialQueuedItemsByClipID;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HFCameraClipPlayerQueueUpdate;
  v17 = -[HFCameraClipPlayerQueueUpdate init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clipManager, a3);
    objc_storeStrong((id *)&v18->_clips, a4);
    objc_storeStrong((id *)&v18->_targetPosition, a5);
    v19 = objc_msgSend(v16, "copy");
    initialQueuedItems = v18->_initialQueuedItems;
    v18->_initialQueuedItems = (NSArray *)v19;

    v18->_queueLimit = a7;
    objc_msgSend(v16, "na_dictionaryWithKeyGenerator:", &__block_literal_global_0);
    v21 = objc_claimAutoreleasedReturnValue();
    initialQueuedItemsByClipID = v18->_initialQueuedItemsByClipID;
    v18->_initialQueuedItemsByClipID = (NSDictionary *)v21;

    -[HFCameraClipPlayerQueueUpdate _computeQueueDiff](v18, "_computeQueueDiff");
  }

  return v18;
}

id __97__HFCameraClipPlayerQueueUpdate_initWithClipManager_clips_targetPosition_queuedItems_queueLimit___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "clip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performUpdatesOnQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  HFCameraClipPlayerQueueUpdate *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HFCameraClipPlayerQueueUpdate *v25;
  uint8_t buf[4];
  HFCameraClipPlayerQueueUpdate *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFCameraClipPlayerQueueUpdate initialQueuedItems](self, "initialQueuedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queuableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  if ((v7 & 1) != 0)
  {
    if (-[HFCameraClipPlayerQueueUpdate hasQueueChanges](self, "hasQueueChanges"))
    {
      -[HFCameraClipPlayerQueueUpdate queueDiff](self, "queueDiff");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke;
      v23[3] = &unk_1EA726728;
      v10 = v4;
      v24 = v10;
      v25 = self;
      objc_msgSend(v8, "enumerateDeletesUsingBlock:", v23);

      -[HFCameraClipPlayerQueueUpdate queueDiff](self, "queueDiff");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v9;
      v18 = 3221225472;
      v19 = __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2;
      v20 = &unk_1EA726728;
      v21 = self;
      v22 = v10;
      objc_msgSend(v11, "enumerateInsertsUsingBlock:", &v17);

    }
    objc_msgSend(v4, "queuableItems", v17, v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HFCameraClipPlayerQueueUpdate targetPosition](self, "targetPosition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "offset");
      objc_msgSend(v4, "seekToOffset:inItem:", v13);

    }
  }
  else
  {
    HFLogForCategory(0x17uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[HFCameraClipPlayerQueueUpdate initialQueuedItems](self, "initialQueuedItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "queuableItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v27 = self;
      v28 = 2112;
      v29 = v4;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Attempting to perform updates %@ on queue %@ when its items do not match our initial queued items! Expected; %@, actual: %@",
        buf,
        0x2Au);

    }
  }

}

void __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "queuableItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "initialQueuedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeQueueableItem:", v8);

  objc_msgSend(*(id *)(a1 + 32), "queuableItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != v5 - 1)
  {
    HFLogForCategory(0x17uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "queuableItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218240;
      v14 = a2;
      v15 = 2048;
      v16 = objc_msgSend(v12, "count") - v5;
      _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Remove from queue at index %lu actually resulted in net %lu items!", (uint8_t *)&v13, 0x16u);

    }
  }
}

void __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updatedClipQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "initialQueuedItemsByClipID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_msgSend(v8, "isPlayable") & 1) == 0)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "clipManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createQueueableItemForClipManager:clip:", v10, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 40), "queuableItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = *(void **)(a1 + 40);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2;
  v25 = &unk_1EA726750;
  v27 = a2;
  v15 = v14;
  v26 = v15;
  __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2((uint64_t)&v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertQueueableItem:afterItem:", v8, v16, v22, v23, v24, v25);

  objc_msgSend(*(id *)(a1 + 40), "queuableItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 != v13 + 1)
  {
    HFLogForCategory(0x17uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "queuableItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134218240;
      v29 = a2;
      v30 = 2048;
      v31 = v21 - v13;
      _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "Insert in queue at index %lu actually resulted in net %lu items!", buf, 0x16u);

    }
  }

}

id __55__HFCameraClipPlayerQueueUpdate_performUpdatesOnQueue___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "queuableItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 >= v4)
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "queuableItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 != v9)
    {
      HFLogForCategory(0x17uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "queuableItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 134218242;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Insertion index %lu is out of bounds of queue %@! This likely indicates that the queue was mutated from out under the queue update.", (uint8_t *)&v14, 0x16u);

      }
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queuableItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_computeQueueDiff
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  -[HFCameraClipPlayerQueueUpdate initialQueuedItems](self, "initialQueuedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraClipPlayerQueueUpdate targetPosition](self, "targetPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPlayerQueueUpdate _buildNewClipQueueForPosition:](self, "_buildNewClipQueueForPosition:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPlayerQueueUpdate setUpdatedClipQueue:](self, "setUpdatedClipQueue:", v6);

  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPlayerQueueUpdate updatedClipQueue](self, "updatedClipQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    -[HFCameraClipPlayerQueueUpdate initialQueuedItems](self, "initialQueuedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipPlayerQueueUpdate setQueueChangesRequireRebuild:](self, "setQueueChangesRequireRebuild:", objc_msgSend(v11, "isPlayable") ^ 1);

  }
  else
  {
    -[HFCameraClipPlayerQueueUpdate setQueueChangesRequireRebuild:](self, "setQueueChangesRequireRebuild:", 1);
  }

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setAllowMoves:", 0);
  if (-[HFCameraClipPlayerQueueUpdate queueChangesRequireRebuild](self, "queueChangesRequireRebuild"))
  {
    v13 = &__block_literal_global_7;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke_3;
    v17[3] = &unk_1EA7267F8;
    v17[4] = self;
    v13 = v17;
  }
  objc_msgSend(v12, "setEqualComparator:", v13);
  -[HFCameraClipPlayerQueueUpdate updatedClipQueue](self, "updatedClipQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFUniqueArrayDiff diffFromArray:toArray:options:](HFUniqueArrayDiff, "diffFromArray:toArray:options:", v4, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPlayerQueueUpdate setQueueDiff:](self, "setQueueDiff:", v15);

  -[HFCameraClipPlayerQueueUpdate queueDiff](self, "queueDiff");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPlayerQueueUpdate setHasQueueChanges:](self, "setHasQueueChanges:", objc_msgSend(v16, "numberOfOperations") != 0);

}

uint64_t __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clip");
}

uint64_t __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke_2()
{
  return 0;
}

uint64_t __50__HFCameraClipPlayerQueueUpdate__computeQueueDiff__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "initialQueuedItemsByClipID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPlayable");

  if (!v10)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "initialQueuedItemsByClipID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isPlayable");

  if (v14)
    v15 = objc_msgSend(v5, "isEqual:", v6);
  else
LABEL_4:
    v15 = 0;

  return v15;
}

- (id)_buildNewClipQueueForPosition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0x7FFFFFFFFFFFFFFFLL;
  -[HFCameraClipPlayerQueueUpdate clips](self, "clips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __63__HFCameraClipPlayerQueueUpdate__buildNewClipQueueForPosition___block_invoke;
  v23 = &unk_1EA726820;
  v6 = v4;
  v24 = v6;
  v25 = &v26;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v20);

  if (v27[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    HFLogForCategory(0x17uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "clip", v20, v21, v22, v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraClipPlayerQueueUpdate clips](self, "clips");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      v32 = 2048;
      v33 = v19;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Could not find matching playlist for clip %@ in clips %ld", buf, 0x16u);

    }
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (-[HFCameraClipPlayerQueueUpdate queueLimit](self, "queueLimit", v20, v21, v22, v23))
      v9 = -[HFCameraClipPlayerQueueUpdate queueLimit](self, "queueLimit");
    else
      v9 = -1;
    -[HFCameraClipPlayerQueueUpdate clips](self, "clips");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = v27[3];

    -[HFCameraClipPlayerQueueUpdate clips](self, "clips");
    v13 = objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v9 >= v11 - v12)
      v14 = v11 - v12;
    else
      v14 = v9;
    -[NSObject subarrayWithRange:](v13, "subarrayWithRange:", v27[3], v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v26, 8);
  return v8;
}

void __63__HFCameraClipPlayerQueueUpdate__buildNewClipQueueForPosition___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  objc_msgSend(a2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (HFCameraClipPosition)targetPosition
{
  return self->_targetPosition;
}

- (NSArray)initialQueuedItems
{
  return self->_initialQueuedItems;
}

- (unint64_t)queueLimit
{
  return self->_queueLimit;
}

- (NSArray)updatedClipQueue
{
  return self->_updatedClipQueue;
}

- (void)setUpdatedClipQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updatedClipQueue, a3);
}

- (BOOL)hasQueueChanges
{
  return self->_hasQueueChanges;
}

- (void)setHasQueueChanges:(BOOL)a3
{
  self->_hasQueueChanges = a3;
}

- (BOOL)queueChangesRequireRebuild
{
  return self->_queueChangesRequireRebuild;
}

- (void)setQueueChangesRequireRebuild:(BOOL)a3
{
  self->_queueChangesRequireRebuild = a3;
}

- (HFCameraClipManager)clipManager
{
  return self->_clipManager;
}

- (NSDictionary)initialQueuedItemsByClipID
{
  return self->_initialQueuedItemsByClipID;
}

- (HFUniqueArrayDiff)queueDiff
{
  return self->_queueDiff;
}

- (void)setQueueDiff:(id)a3
{
  objc_storeStrong((id *)&self->_queueDiff, a3);
}

- (NSArray)clips
{
  return self->_clips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_queueDiff, 0);
  objc_storeStrong((id *)&self->_initialQueuedItemsByClipID, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_updatedClipQueue, 0);
  objc_storeStrong((id *)&self->_initialQueuedItems, 0);
  objc_storeStrong((id *)&self->_targetPosition, 0);
}

@end
