@implementation PKAutoRefineTaskManager

- (PKAutoRefineTaskManager)init
{
  PKAutoRefineTaskManager *v2;
  uint64_t v3;
  NSMutableArray *tasksQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *autoRefineQueue;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAutoRefineTaskManager;
  v2 = -[PKAutoRefineTaskManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v3 = objc_claimAutoreleasedReturnValue();
    tasksQueue = v2->_tasksQueue;
    v2->_tasksQueue = (NSMutableArray *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.PencilKit.AutoRefineTaskManager", v5);
    autoRefineQueue = v2->_autoRefineQueue;
    v2->_autoRefineQueue = (OS_dispatch_queue *)v6;

  }
  v8 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager created", v10, 2u);
  }

  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  PKAutoRefineTask *v4;
  PKAutoRefineTask *activeTask;
  uint64_t v6;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    activeTask = self->_activeTask;
    v6 = -[NSMutableArray count](self->_tasksQueue, "count");
    *(_DWORD *)buf = 67109376;
    v9 = activeTask != 0;
    v10 = 2048;
    v11 = v6;
    _os_log_debug_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager destroyed, had active task ? %d, %ld tasks", buf, 0x12u);
  }

  v4 = self->_activeTask;
  self->_activeTask = 0;

  -[NSMutableArray removeAllObjects](self->_tasksQueue, "removeAllObjects");
  v7.receiver = self;
  v7.super_class = (Class)PKAutoRefineTaskManager;
  -[PKAutoRefineTaskManager dealloc](&v7, sel_dealloc);
}

- (void)scheduleAutoRefineTaskForItem:(uint64_t)a3 firstColumnToCommit:(uint64_t)a4 lastColumnToCommit:(void *)a5 providerVersion:(void *)a6 delay:(double)a7 taskInitBlock:
{
  NSObject *v13;
  PKAutoRefineTask *v14;
  char *v15;
  _QWORD *v16;
  _QWORD **v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  id *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  dispatch_time_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD block[5];
  id v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _QWORD v67[4];
  id *v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id *v72;
  id v73;
  objc_super v74;
  uint8_t buf[4];
  _BYTE v76[18];
  __int16 v77;
  _BYTE v78[18];
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  _BOOL4 v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v56 = a2;
  v57 = a5;
  v55 = a6;
  if (a1)
  {
    v13 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v42 = *(_QWORD *)(a1 + 16);
      v43 = objc_msgSend(*(id *)(a1 + 24), "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v76 = v42 != 0;
      *(_WORD *)&v76[4] = 2048;
      *(_QWORD *)&v76[6] = v43;
      _os_log_debug_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager creating a new task, has active task ? %d, %ld tasks", buf, 0x12u);
    }

    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__23;
    v65 = __Block_byref_object_dispose__23;
    v14 = [PKAutoRefineTask alloc];
    v53 = v56;
    v54 = v57;
    if (v14)
    {
      v74.receiver = v14;
      v74.super_class = (Class)PKAutoRefineTask;
      v15 = (char *)objc_msgSendSuper2(&v74, sel_init);
      v16 = v15;
      if (v15)
      {
        *((_WORD *)v15 + 44) = 0;
        v17 = (_QWORD **)(v15 + 8);
        objc_storeStrong((id *)v15 + 1, a2);
        v16[4] = a3;
        v16[5] = a4;
        v16[2] = a3;
        v16[3] = a4;
        v18 = *v17;
        if (*v17)
          v18 = (_QWORD *)v18[2];
        v19 = (void *)MEMORY[0x1E0CB36B8];
        v20 = v18;
        objc_msgSend(v19, "indexSetWithIndexesInRange:", 0, objc_msgSend(v20, "tokenColumnCount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v21, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke;
        v71[3] = &unk_1E777C210;
        v23 = v16;
        v72 = v23;
        v24 = v22;
        v73 = v24;
        objc_msgSend(v51, "enumerateIndexesUsingBlock:", v71);
        v25 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v24, "description");
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = *v17;
          v50 = (void *)v47;
          if (*v17)
            v48 = (_QWORD *)v48[6];
          v49 = v48;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v76 = v50;
          *(_WORD *)&v76[8] = 2112;
          *(_QWORD *)&v76[10] = v49;
          _os_log_debug_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEBUG, "New AutoRefine task with nonRefinableColumns from stroke checks = %@, queryItem.refinableStrokes = %@", buf, 0x16u);

        }
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_5;
        v69[3] = &unk_1E777C238;
        v26 = v51;
        v70 = v26;
        objc_msgSend(v24, "enumerateRangesUsingBlock:", v69);
        if (objc_msgSend(v26, "count"))
        {
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2_6;
          v67[3] = &unk_1E777C238;
          v68 = v23;
          objc_msgSend(v26, "enumerateRangesUsingBlock:", v67);

        }
        else
        {
          v16[4] = 0;
          v16[5] = 0;
          *((_BYTE *)v16 + 88) = 1;
        }
        objc_storeStrong(v23 + 6, a5);
        v27 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *v17;
          if (*v17)
            v28 = (_QWORD *)v28[2];
          v29 = v28;
          objc_msgSend(v29, "topTranscription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v16[4];
          v32 = v16[5];
          v33 = *((_BYTE *)v16 + 88) == 0;
          *(_DWORD *)buf = 134219523;
          *(_QWORD *)v76 = v23;
          *(_WORD *)&v76[8] = 2117;
          *(_QWORD *)&v76[10] = v30;
          v77 = 2048;
          *(_QWORD *)v78 = v31;
          *(_WORD *)&v78[8] = 2048;
          *(_QWORD *)&v78[10] = v32;
          v79 = 2048;
          v80 = a3;
          v81 = 2048;
          v82 = a4;
          v83 = 1024;
          v84 = v33;
          _os_log_impl(&dword_1BE213000, v27, OS_LOG_TYPE_DEFAULT, "New AutoRefine task created %p with text transcription _%{sensitive}@_, columns to commit (%ld-%ld) from initial columns (%ld-%ld), task valid ? %d", buf, 0x44u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v23[7] = v34;

      }
      -[PKAutoRefineTask updateCommittableRange](v16);
      v35 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = v16[9];
        *(_DWORD *)buf = 134218243;
        *(_QWORD *)v76 = v16;
        *(_WORD *)&v76[8] = 2117;
        *(_QWORD *)&v76[10] = v36;
        _os_log_impl(&dword_1BE213000, v35, OS_LOG_TYPE_DEFAULT, "New AutoRefine task just created %p has committable transcription = _%{sensitive}@_", buf, 0x16u);
      }

    }
    else
    {
      v16 = 0;
    }

    v66 = v16;
    v37 = v62[5];
    if (v37)
      objc_storeWeak((id *)(v37 + 96), (id)a1);
    v38 = (id)a1;
    objc_sync_enter(v38);
    objc_msgSend(*((id *)v38 + 3), "addObject:", v62[5]);
    objc_sync_exit(v38);

    v39 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v44 = v62[5];
      v45 = *((_QWORD *)v38 + 2);
      v46 = objc_msgSend(*((id *)v38 + 3), "count");
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)v76 = v44;
      *(_WORD *)&v76[8] = 2048;
      *(double *)&v76[10] = a7;
      v77 = 1024;
      *(_DWORD *)v78 = v45 != 0;
      *(_WORD *)&v78[4] = 2048;
      *(_QWORD *)&v78[6] = v46;
      _os_log_debug_impl(&dword_1BE213000, v39, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager scheduling task %p for execution with delay = %.2f, has active task ? %d, %ld tasks", buf, 0x26u);
    }

    v40 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
    v41 = *((_QWORD *)v38 + 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__PKAutoRefineTaskManager_scheduleAutoRefineTaskForItem_firstColumnToCommit_lastColumnToCommit_providerVersion_delay_taskInitBlock___block_invoke;
    block[3] = &unk_1E777C2D8;
    v60 = &v61;
    block[4] = v38;
    v59 = v55;
    dispatch_after(v40, v41, block);

    _Block_object_dispose(&v61, 8);
  }

}

void __132__PKAutoRefineTaskManager_scheduleAutoRefineTaskForItem_firstColumnToCommit_lastColumnToCommit_providerVersion_delay_taskInitBlock___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  _BYTE *v3;
  void *v4;
  _BYTE *v5;
  id v6;
  id *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int64_t v29;
  NSObject *WeakRetained;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  uint32_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  _BOOL4 v48;
  NSObject *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  uint8_t v68[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_DWORD *)v68 = 134217984;
    v69 = v22;
    _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p becomes current", v68, 0xCu);
  }

  v3 = *(_BYTE **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v3 || (v3[88] & 1) != 0)
  {
    v19 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v32 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_DWORD *)v68 = 134217984;
    v69 = v32;
    v21 = "AutoRefine Task %p stopped early";
LABEL_35:
    _os_log_debug_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEBUG, v21, v68, 0xCu);
    goto LABEL_17;
  }
  v4 = (void *)a1[4];
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    objc_sync_enter(v6);
    v7 = (id *)v6;
    objc_sync_enter(v7);
    objc_msgSend(v7[3], "indexesOfObjectsPassingTest:", &__block_literal_global_67);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7[3], "removeObjectsAtIndexes:", v8);

    objc_sync_exit(v7);
    objc_storeStrong(v7 + 2, v3);
    objc_msgSend(v7[3], "removeObject:", v5);
    objc_sync_exit(v7);

  }
  v9 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v38 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v39 = a1[4];
    v40 = *(_QWORD *)(v39 + 16);
    v41 = objc_msgSend(*(id *)(v39 + 24), "count");
    *(_DWORD *)v68 = 134218496;
    v69 = v38;
    v70 = 2048;
    v71 = v40;
    v72 = 2048;
    v73 = v41;
    _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p starts execution, active task %p, %ld tasks", v68, 0x20u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  v10 = a1[4];
  v11 = *(_QWORD *)(v10 + 16);
  if (!v11)
  {
    v53 = *(void **)(v10 + 48);
    v13 = *(id *)(v10 + 40);
    v14 = v53;
    goto LABEL_42;
  }
  if ((*(_BYTE *)(v11 + 88) & 1) != 0)
  {
    v19 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v20 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)v68 = 134217984;
    v69 = v20;
    v21 = "AutoRefine Task %p canceled in its init block";
    goto LABEL_35;
  }
  v12 = *(void **)(v10 + 48);
  v13 = *(id *)(v10 + 40);
  v14 = v12;
  v15 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(v11 + 32);
    v17 = *(_QWORD *)(v11 + 40);
    *(_DWORD *)buf = 134218496;
    v59 = v11;
    v60 = 2048;
    v61 = v16;
    v62 = 2048;
    v63 = v17;
    _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "AutoRefine Task %p running with fresh stroke provider, firstColumnToCommit = %ld, lastColumnToCommit = %ld", buf, 0x20u);
  }

  if (*(_BYTE *)(v11 + 88))
  {
    v18 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v59 = v11;
      _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "AutoRefine Task %p was canceled.", buf, 0xCu);
    }
    goto LABEL_41;
  }
  v18 = v13;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v23 = *(_QWORD **)(v11 + 8);
  if (v23)
    v23 = (_QWORD *)v23[4];
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v55;
LABEL_24:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v26)
        objc_enumerationMutation(v24);
      if ((-[NSObject isValidStrokeIdentifier:](v18, "isValidStrokeIdentifier:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v27), (_QWORD)v54) & 1) == 0)break;
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (v25)
          goto LABEL_24;
        goto LABEL_30;
      }
    }

    WeakRetained = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 134217984;
    v59 = v11;
    v31 = "AutoRefine Task %p skipped because the drawing has changed";
    goto LABEL_38;
  }
LABEL_30:

  v28 = *(_QWORD *)(v11 + 32);
  if (v28 <= 0x7FFFFFFFFFFFFFFELL && (v29 = *(_QWORD *)(v11 + 40), v29 >= (uint64_t)v28))
  {
    v45 = v29 + 1;
    if ((unint64_t)objc_msgSend(*(id *)(v11 + 72), "length") > 1)
      goto LABEL_49;
    v46 = *(_QWORD **)(v11 + 8);
    if (v46)
      v46 = (_QWORD *)v46[2];
    v47 = v46;
    v48 = v45 < objc_msgSend(v47, "tokenColumnCount");

    if (v48)
    {
LABEL_49:
      v49 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        v51 = *(_QWORD *)(v11 + 72);
        v52 = objc_msgSend(*(id *)(v11 + 80), "count");
        *(_DWORD *)buf = 134219011;
        v59 = v11;
        v60 = 2048;
        v61 = v28;
        v62 = 2048;
        v63 = v45;
        v64 = 2117;
        v65 = v51;
        v66 = 2048;
        v67 = v52;
        _os_log_debug_impl(&dword_1BE213000, v49, OS_LOG_TYPE_DEBUG, "AutoRefine task %p triggered (cols: %ld -> %ld) for transcription = %{sensitive}@, strokes to replace: %ld", buf, 0x34u);
      }

      WeakRetained = objc_loadWeakRetained((id *)(v11 + 96));
      -[NSObject autoRefineTask:isReadyToSynthesizeRefinedDrawingForStrokes:transcription:drawingUUID:](WeakRetained, "autoRefineTask:isReadyToSynthesizeRefinedDrawingForStrokes:transcription:drawingUUID:", v11, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 72), v14);
      goto LABEL_40;
    }
    WeakRetained = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v50 = *(_QWORD *)(v11 + 72);
      *(_DWORD *)buf = 134218243;
      v59 = v11;
      v60 = 2117;
      v61 = v50;
      v31 = "AutoRefine Task %p skipped because uncertain commit for transcription = %{sensitive}@";
      v33 = WeakRetained;
      v34 = 22;
      goto LABEL_39;
    }
  }
  else
  {
    WeakRetained = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v59 = v11;
      v31 = "AutoRefine Task %p skipped because nothing to commit";
LABEL_38:
      v33 = WeakRetained;
      v34 = 12;
LABEL_39:
      _os_log_impl(&dword_1BE213000, v33, OS_LOG_TYPE_DEFAULT, v31, buf, v34);
    }
  }
LABEL_40:

LABEL_41:
LABEL_42:

  v35 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v42 = a1[4];
    v43 = *(_QWORD *)(v42 + 16);
    v44 = objc_msgSend(*(id *)(v42 + 24), "count");
    *(_DWORD *)v68 = 134218240;
    v69 = v43;
    v70 = 2048;
    v71 = v44;
    _os_log_debug_impl(&dword_1BE213000, v35, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p is done running, %ld tasks", v68, 0x16u);
  }

  v19 = *(id *)(a1[4] + 16);
  objc_sync_enter(v19);
  v36 = a1[4];
  v37 = *(void **)(v36 + 16);
  *(_QWORD *)(v36 + 16) = 0;

  objc_sync_exit(v19);
LABEL_17:

}

uint64_t __45__PKAutoRefineTaskManager_updatePendingTasks__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(_BYTE *)(a2 + 88) & 1;
  else
    return 0;
}

- (void)cancelAllTasks
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    -[PKAutoRefineTask cancel](*((_QWORD *)v1 + 2));
    v2 = (void *)*((_QWORD *)v1 + 2);
    *((_QWORD *)v1 + 2) = 0;

    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *((id *)v1 + 3);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          -[PKAutoRefineTask cancel](*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    objc_msgSend(*((id *)v1 + 3), "removeAllObjects", (_QWORD)v8);
    +[PKAutoRefineLogger sharedAutoRefineLogger]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAutoRefineLogger clearAllEntries](v7);

    objc_sync_exit(v1);
  }
}

- (void)cancelTasksGivenQueryItem:(void *)a1
{
  id v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  char v9;
  char v10;

  v8 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = *((_QWORD *)v3 + 2);
    if (!v4 || (*(_BYTE *)(v4 + 88) & 1) == 0)
    {
      v10 = 0;
      -[PKAutoRefineTask trimTaskForNewItem:shouldCancel:]((_QWORD *)v4, v8, &v10);
      if (v10)
        -[PKAutoRefineTask cancel](*((_QWORD *)v3 + 2));
    }
    for (i = 0; i < objc_msgSend(*((id *)v3 + 3), "count", v8); ++i)
    {
      objc_msgSend(*((id *)v3 + 3), "objectAtIndex:", i);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (!v6 || (*(_BYTE *)(v6 + 88) & 1) == 0)
      {
        v9 = 0;
        -[PKAutoRefineTask trimTaskForNewItem:shouldCancel:]((_QWORD *)v6, v8, &v9);
        if (v9)
          -[PKAutoRefineTask cancel]((uint64_t)v7);
      }

    }
    objc_sync_exit(v3);

  }
}

- (void)cancelTasksGivenRefinableStroke:(void *)a1
{
  id v3;
  uint64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  unint64_t i;
  uint64_t v10;
  _QWORD *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  char v17;
  char v18;

  v16 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = *((_QWORD *)v3 + 2);
    if (!v4 || (*(_BYTE *)(v4 + 88) & 1) == 0)
    {
      v18 = 0;
      objc_msgSend(v16, "_bounds", v16);
      -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:]((_QWORD *)v4, &v18, v5, v6, v7, v8);
      if (v18)
        -[PKAutoRefineTask cancel](*((_QWORD *)v3 + 2));
    }
    for (i = 0; i < objc_msgSend(*((id *)v3 + 3), "count", v16); ++i)
    {
      objc_msgSend(*((id *)v3 + 3), "objectAtIndex:", i);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (_QWORD *)v10;
      if (!v10 || (*(_BYTE *)(v10 + 88) & 1) == 0)
      {
        v17 = 0;
        objc_msgSend(v16, "_bounds");
        -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:](v11, &v17, v12, v13, v14, v15);
        if (v17)
          -[PKAutoRefineTask cancel]((uint64_t)v11);
      }

    }
    objc_sync_exit(v3);

  }
}

- (void)hasOngoingAnimationTask
{
  _BYTE **v1;
  _BOOL8 v2;

  if (result)
  {
    v1 = result;
    objc_sync_enter(v1);
    v2 = -[PKAutoRefineTask hasOngoingAnimation](v1[2]);
    objc_sync_exit(v1);

    return (void *)v2;
  }
  return result;
}

- (void)autoRefineTask:(id)a3 isReadyToSynthesizeRefinedDrawingForStrokes:(id)a4 transcription:(id)a5 drawingUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_112_0);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_2;
  v20[3] = &unk_1E777C340;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v20);
  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

}

void __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_3;
  v7[3] = &unk_1E7776F60;
  v8 = *(id *)(a1 + 72);
  objc_msgSend(WeakRetained, "autoRefineTask:synthesizeRefinedDrawingForStrokes:transcription:drawingUUID:completionBlock:", v3, v4, v5, v6, v7);

}

uint64_t __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)fullLineCommitStyle
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("internalSettings.drawing.autorefineCommitLineLevel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("internalSettings.drawing.autorefineCommitLineLevel"));

  }
  else
  {
    v5 = 1;
  }
  v6 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "AutoRefine commit behavior is line-level ? %d", (uint8_t *)v8, 8u);
  }

  return v5;
}

- (void)setCurrentDrawingUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDrawingUUID, 0);
  objc_storeStrong((id *)&self->_latestStrokeProvider, 0);
  objc_destroyWeak((id *)&self->_autoRefineViewDelegate);
  objc_storeStrong((id *)&self->_tasksQueue, 0);
  objc_storeStrong((id *)&self->_activeTask, 0);
  objc_storeStrong((id *)&self->_autoRefineQueue, 0);
}

@end
