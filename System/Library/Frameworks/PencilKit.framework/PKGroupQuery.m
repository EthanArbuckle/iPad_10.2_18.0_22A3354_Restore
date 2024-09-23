@implementation PKGroupQuery

- (PKGroupQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4;
  PKGroupQuery *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CHStrokeGroupQuery *strokeGroupQuery;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *intersectionQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *strokeGroupComputationQueue;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKGroupQuery;
  v5 = -[PKQuery initWithRecognitionSessionManager:](&v23, sel_initWithRecognitionSessionManager_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D16868]);
    -[PKRecognitionSessionManager session](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithRecognitionSession:", v7);
    strokeGroupQuery = v5->_strokeGroupQuery;
    v5->_strokeGroupQuery = (CHStrokeGroupQuery *)v8;

    -[PKGroupQuery strokeGroupQuery](v5, "strokeGroupQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v5);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.PencilKit.GroupQueryIntersection", v12);
    intersectionQueue = v5->_intersectionQueue;
    v5->_intersectionQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.PencilKit.GroupQueryStrokeGroupComputation", v15);
    strokeGroupComputationQueue = v5->_strokeGroupComputationQueue;
    v5->_strokeGroupComputationQueue = (OS_dispatch_queue *)v16;

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("internalSettings.drawing.forceFastGroupingForLassolessSelection"));

  if (v19)
  {
    -[PKQuery sessionManager](v5, "sessionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager session](v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShouldForceFastGrouping:", 1);

  }
  return v5;
}

- (void)setupForMath
{
  id v2;

  -[PKGroupQuery strokeGroupQuery](self, "strokeGroupQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredUpdatesInterval:", 0.3);

}

- (void)fetchCurrentStrokeGroupItems:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(id, id);

  v8 = (void (**)(id, id))a3;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8[2](v8, v7);
}

- (void)setStrokeGroups:(id)a3
{
  PKGroupQuery *v4;
  uint64_t v5;
  NSArray *strokeGroups;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  strokeGroups = v4->_strokeGroups;
  v4->_strokeGroups = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (id)strokeGroups
{
  PKGroupQuery *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_strokeGroups;
  objc_sync_exit(v2);

  return v3;
}

- (void)start
{
  id v2;

  -[PKGroupQuery strokeGroupQuery](self, "strokeGroupQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)pause
{
  id v2;

  -[PKGroupQuery strokeGroupQuery](self, "strokeGroupQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)teardown
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__PKGroupQuery_teardown__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __24__PKGroupQuery_teardown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDelegate:", 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKGroupQuery;
  -[PKGroupQuery dealloc](&v2, sel_dealloc);
}

- (PKDrawing)drawing
{
  void *v2;
  void *v3;

  -[PKQuery sessionManager](self, "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKDrawing *)v3;
}

- (void)queryDidUpdateResult:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  PKGroupQuery *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "strokeGroupItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    -[PKQuery sessionManager](self, "sessionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = self;
    v10 = 2048;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "StateUpdate: Did update group query results for %@ with %lu stroke group items for session manager %@", (uint8_t *)&v8, 0x20u);

  }
  -[PKGroupQuery _precalculateStrokeGroupProperties:](self, "_precalculateStrokeGroupProperties:", v4);

}

- (void)textStrokesCoveredByStroke:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD aBlock[5];
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[16];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _PKSignpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _PKSignpostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "textStrokesCoveredByStroke", (const char *)&unk_1BE532412, buf, 2u);
  }

  v12 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_INFO, "BEGIN \"textStrokesCoveredByStroke\", buf, 2u);
  }

  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKStrokeProvider slicesForStrokes:](PKStrokeProvider, "slicesForStrokes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKGroupQuery_textStrokesCoveredByStroke_completion___block_invoke;
  aBlock[3] = &unk_1E7776EC0;
  aBlock[4] = self;
  v22 = v9;
  v15 = v7;
  v21 = v15;
  v16 = _Block_copy(aBlock);
  -[PKGroupQuery strokeGroupQuery](self, "strokeGroupQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndex:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "tokenStrokeIdentifiersWithCoveringStroke:completion:shouldCancel:", v18, v16, 0);

}

void __54__PKGroupQuery_textStrokesCoveredByStroke_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
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
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.pencilkit", "Actions");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "strokeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 134217984;
    v24 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Scratch Out will delete %lu text strokes.", (uint8_t *)&v23, 0xCu);

  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v5, "strokeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "drawing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_strokesForIdentifiers:inDrawing:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 32);
  objc_msgSend(v6, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "drawing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_strokesForIdentifiers:inDrawing:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _PKSignpostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = *(_QWORD *)(a1 + 48);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v20, OS_SIGNPOST_INTERVAL_END, v21, "textStrokesCoveredByStroke", (const char *)&unk_1BE532412, (uint8_t *)&v23, 2u);
  }

  v22 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_INFO, "END \"textStrokesCoveredByStroke\", (uint8_t *)&v23, 2u);
  }

  (*(void (**)(_QWORD, void *, void *, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v14, v18, objc_msgSend(v5, "resultLevel") == 0);
}

- (void)_precalculateStrokeGroupProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *strokeGroupComputationQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  PKGroupQuery *v14;

  v4 = a3;
  -[PKGroupQuery drawing](self, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)objc_msgSend(v4, "copy");
  strokeGroupComputationQueue = self->_strokeGroupComputationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKGroupQuery__precalculateStrokeGroupProperties___block_invoke;
  block[3] = &unk_1E7776FB0;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(strokeGroupComputationQueue, block);

}

void __51__PKGroupQuery__precalculateStrokeGroupProperties___block_invoke(uint64_t a1)
{
  unint64_t i;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  PKStrokeGroupItem *v14;
  PKStrokeGroupItem *v15;
  SEL v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKGroupQuery _strokesInLine:inDrawing:](PKGroupQuery, "_strokesInLine:inDrawing:", v3, *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (objc_msgSend(v3, "strokeGroupType") == 1)
      v13 = 1;
    else
      v13 = 2;
    v14 = objc_alloc_init(PKStrokeGroupItem);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_strokeGroupItem, v3);
      objc_setProperty_nonatomic_copy(v15, v16, v4, 16);
      v15->_bounds.origin.x = v6;
      v15->_bounds.origin.y = v8;
      v15->_bounds.size.width = v10;
      v15->_bounds.size.height = v12;
      v15->_contentType = v13;
    }
    objc_msgSend(v22, "addObject:", v15);

  }
  objc_msgSend(*(id *)(a1 + 48), "setStrokeGroups:", v22);
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 48);
    v21 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v19, "groupQuery:foundItems:", v20, v21);

  }
}

- (id)_strokesForIdentifiers:(id)a3 inDrawing:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "strokeUUID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_visibleStrokeForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)_strokesInLine:(id)a3 inDrawing:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "strokeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "strokeUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_visibleStrokeForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          v14 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "Unable to find stroke from stroke group in drawing.", buf, 2u);
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

- (id)_lines:(id)a3 containingStrokes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if (v13)
          v14 = *(void **)(v13 + 16);
        else
          v14 = 0;
        v15 = v14;
        if (-[PKGroupQuery _strokes:containsAnyStrokes:](self, "_strokes:containsAnyStrokes:", v15, v7, (_QWORD)v18))
          objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v10 = v16;
    }
    while (v16);
  }

  return v8;
}

- (BOOL)_strokes:(id)a3 containsAnyStrokes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      v20 = v7;
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = v22;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v9, "_strokeUUID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "_strokeUUID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqual:", v16);

              if ((v17 & 1) != 0)
              {

                v18 = 1;
                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v18 = 0;
    }
    while (v7);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)q_fetchStrokesForPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  void (**v14)(id, _QWORD);
  PKIntersectionResult *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *intersectionQueue;
  void (**v20)(id, _QWORD);
  PKIntersectionResult *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  PKIntersectionResult *v25;
  PKGroupQuery *v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  CGFloat v30;
  CGFloat v31;
  int64_t v32;
  int64_t v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;

  y = a3.y;
  x = a3.x;
  v13 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  v15 = objc_alloc_init(PKIntersectionResult);
  -[PKQuery sessionManager](self, "sessionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "state") == 3)
    v17 = 3;
  else
    v17 = 2;
  -[PKIntersectionResult setIntersectionAlgorithmType:](v15, "setIntersectionAlgorithmType:", v17);

  if (a4 == 6 || !a4)
    v14[2](v14, 0);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy_;
  v36[4] = __Block_byref_object_dispose_;
  -[PKGroupQuery strokeGroupQuery](self, "strokeGroupQuery");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  -[PKGroupQuery drawing](self, "drawing");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  intersectionQueue = self->_intersectionQueue;
  v35 = v18;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke;
  v23[3] = &unk_1E7776F10;
  v30 = x;
  v31 = y;
  v24 = v13;
  v25 = v15;
  v26 = self;
  v27 = v14;
  v32 = a5;
  v33 = a4;
  v28 = v36;
  v29 = v34;
  v20 = v14;
  v21 = v15;
  v22 = v13;
  dispatch_async(intersectionQueue, v23);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

void __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[2];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;

  +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 96), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 48), "_tokenizationLevelForSelectionType:", *(_QWORD *)(a1 + 104));
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(double *)(a1 + 80);
    v7 = *(double *)(a1 + 88);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_3;
    v14[3] = &unk_1E7776EE8;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v15[0] = v8;
    v15[1] = v9;
    v10 = *(_QWORD *)(a1 + 104);
    v19 = *(_QWORD *)(a1 + 72);
    v20 = v10;
    v16 = *(id *)(a1 + 32);
    v17 = v2;
    v18 = *(id *)(a1 + 56);
    v11 = (id)objc_msgSend(v4, "tokenizedStrokeResultForInitialStrokes:point:tokenizationLevel:completion:shouldCancel:", v5, v3, v14, 0, v6, v7);
    v12 = (id *)v15;

    v13 = v16;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setIntersectedStrokes:", v2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2;
    block[3] = &unk_1E7776F88;
    v12 = &v23;
    v23 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v13 = v22;
  }

}

uint64_t __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  if (objc_msgSend(v3, "resultLevel") == 1)
    v4 = 1;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "intersectionAlgorithmType");
  objc_msgSend(*(id *)(a1 + 32), "setIntersectionAlgorithmType:", v4);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v3, "strokeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_strokesForIdentifiers:inDrawing:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (*(_QWORD *)(a1 + 80) == 5)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    v11 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "intersectsOrderedSet:", *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    objc_msgSend(v12, "unionOrderedSet:", *(_QWORD *)(a1 + 56));
    v13 = v12;

    v11 = v13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setIntersectedStrokes:", v11);
  objc_msgSend(*(id *)(a1 + 32), "setContentType:", objc_msgSend(*(id *)(a1 + 40), "contentTypeForIntersectedStrokes:", v11));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_4;
  v14[3] = &unk_1E7776F88;
  v16 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

uint64_t __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (int64_t)_tokenizationLevelForSelectionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3)
    return 0;
  else
    return qword_1BE4FBC60[a3 - 2];
}

- (id)_closestLineToPoint:(CGPoint)a3 isTop:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  CGFloat v18;
  CGFloat v19;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  BOOL v24;
  double v25;
  _QWORD *v26;
  uint64_t v27;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v8)
  {
    v30 = *(_QWORD *)v36;
    v9 = 1.79769313e308;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        if (v11)
          v12 = (void *)v11[2];
        else
          v12 = 0;
        v13 = v12;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "_bounds");
              v18 = v42.origin.x;
              v19 = v42.origin.y;
              width = v42.size.width;
              height = v42.size.height;
              MidX = CGRectGetMidX(v42);
              v43.origin.x = v18;
              v43.origin.y = v19;
              v43.size.width = width;
              v43.size.height = height;
              MidY = CGRectGetMidY(v43);
              if (v4)
                v24 = MidY <= y;
              else
                v24 = MidY >= y;
              if (!v24)
              {
                v25 = sqrt((MidY - y) * (MidY - y) + (MidX - x) * (MidX - x));
                if (v25 < v9)
                {
                  v26 = v11;

                  v7 = v26;
                  v9 = v25;
                }
              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v15);
        }

        ++v10;
      }
      while (v10 != v8);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v8 = v27;
    }
    while (v27);
  }

  return v7;
}

- (void)q_fetchStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 isRTL:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  _BOOL4 v23;
  BOOL v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  PKIntersectionResult *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  PKIntersectionResult *v46;
  id v47;
  _BOOL4 v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  PKIntersectionResult *v53;
  id v54;
  uint8_t buf[16];
  _QWORD block[4];
  id v57;

  v6 = a5;
  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a6;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PKGroupQuery strokeGroups](self, "strokeGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v49 = v12;
      -[PKGroupQuery _closestLineToPoint:isTop:](self, "_closestLineToPoint:isTop:", 1, v10, v9);
      v16 = objc_claimAutoreleasedReturnValue();
      -[PKGroupQuery _closestLineToPoint:isTop:](self, "_closestLineToPoint:isTop:", 0, x, y);
      v17 = objc_claimAutoreleasedReturnValue();
      -[PKGroupQuery strokeGroups](self, "strokeGroups");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "indexOfObject:", v16);

      -[PKGroupQuery strokeGroups](self, "strokeGroups");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "indexOfObject:", v17);

      if (!(v16 | v17))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke;
        block[3] = &unk_1E7776F60;
        v57 = v12;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      v22 = v16 != 0;
      v23 = v17 == 0;
      if (v17)
        v24 = v16 == 0;
      else
        v24 = 0;
      if (v24)
        v25 = v21;
      else
        v25 = v19;
      if (v22 && v23)
        v26 = v19;
      else
        v26 = v21;
      if (v22 && v23)
        v27 = v19;
      else
        v27 = v25;
      if (v26 < v27)
      {
        v28 = (id)v16;

        v26 = v27;
        v17 = (uint64_t)v28;
      }
      if (v16)
      {
        v29 = *(_QWORD *)(v16 + 24);
        if (v17)
        {
LABEL_21:
          v30 = *(_QWORD *)(v17 + 24);
LABEL_22:
          v48 = v6;
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29 == v30)
            v32 = v29;
          else
            v32 = 3;
          v33 = v27 + 1;
          if (v27 + 1 < v26)
          {
            do
            {
              -[PKGroupQuery strokeGroups](self, "strokeGroups");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
              v35 = (_QWORD *)objc_claimAutoreleasedReturnValue();

              if (v35)
                v36 = (void *)v35[2];
              else
                v36 = 0;
              v37 = v36;
              objc_msgSend(v31, "addObjectsFromArray:", v37);

              if (v32 != 3)
              {
                v38 = v35 ? v35[3] : 0;
                if (v38 != v32)
                  v32 = 3;
              }

              ++v33;
            }
            while (v26 != v33);
          }
          v41 = v31;
          v51 = (void *)objc_msgSend(v41, "mutableCopy");
          -[PKGroupQuery _strokesInLine:leftOf:point:](self, "_strokesInLine:leftOf:point:", v16, v48, v10, v9);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKGroupQuery _strokesInLine:leftOf:point:](self, "_strokesInLine:leftOf:point:", v17, !v48, x, y);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 == v17)
          {
            v43 = (void *)objc_msgSend(v50, "mutableCopy");
            objc_msgSend(v43, "intersectOrderedSet:", v42);
            objc_msgSend(v51, "unionOrderedSet:", v43);

          }
          else
          {
            objc_msgSend(v51, "unionOrderedSet:", v50);
            objc_msgSend(v51, "unionOrderedSet:", v42);
          }
          v39 = v51;

          v40 = objc_alloc_init(PKIntersectionResult);
          -[PKIntersectionResult setIntersectedStrokes:](v40, "setIntersectedStrokes:", v39);
          -[PKQuery sessionManager](self, "sessionManager");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v44, "state") == 3)
            v45 = 3;
          else
            v45 = 2;
          -[PKIntersectionResult setIntersectionAlgorithmType:](v40, "setIntersectionAlgorithmType:", v45);

          -[PKIntersectionResult setContentType:](v40, "setContentType:", v32);
          v12 = v49;
          goto LABEL_47;
        }
      }
      else
      {
        v29 = 0;
        if (v17)
          goto LABEL_21;
      }
      v30 = 0;
      goto LABEL_22;
    }
  }
  v16 = (uint64_t)os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "No recognition results available", buf, 2u);
  }
  v39 = 0;
  v40 = 0;
LABEL_47:

  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke_32;
  v52[3] = &unk_1E7776F88;
  v53 = v40;
  v54 = v12;
  v46 = v40;
  v47 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v52);

}

uint64_t __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_strokesInLine:(id)a3 leftOf:(BOOL)a4 point:(CGPoint)a5
{
  double x;
  _BOOL4 v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  _BOOL4 v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  x = a5.x;
  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  if (v7)
    v9 = (void *)v7[2];
  else
    v9 = 0;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "_bounds", (_QWORD)v23);
        v15 = v29.origin.x;
        y = v29.origin.y;
        width = v29.size.width;
        height = v29.size.height;
        MidX = CGRectGetMidX(v29);
        v30.origin.x = v15;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        MidY = CGRectGetMidY(v30);
        if (v6)
          v21 = MidX < x;
        else
          v21 = MidX > x;
        if (v21)
          objc_msgSend(v8, "addObject:", v14, MidY);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  return v8;
}

- (int64_t)_firstLineIndexFromInitialStrokes:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    -[PKGroupQuery strokeGroups](self, "strokeGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = i < objc_msgSend(v7, "count");

    if (!v8)
      break;
    -[PKGroupQuery strokeGroups](self, "strokeGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    -[PKGroupQuery _lines:containingStrokes:](self, "_lines:containingStrokes:", v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v11) = objc_msgSend(v12, "count") == 1;
    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
  i = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return i;
}

- (int64_t)_lastLineIndexFromInitialStrokes:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  while (--v6 >= 0)
  {
    -[PKGroupQuery strokeGroups](self, "strokeGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    -[PKGroupQuery _lines:containingStrokes:](self, "_lines:containingStrokes:", v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v9) = objc_msgSend(v10, "count") == 1;
    if ((v9 & 1) != 0)
      goto LABEL_6;
  }
  v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v6;
}

- (id)firstStrokesInStrokes:(id)a3 isRTL:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v12;
  void *v13;
  double *v14;
  CGFloat v15;
  CGFloat v16;
  double *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double MinY;
  double v23;
  _BOOL4 v24;
  void *v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v6 = a3;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && objc_msgSend(v7, "count")
    && (v9 = -[PKGroupQuery _firstLineIndexFromInitialStrokes:](self, "_firstLineIndexFromInitialStrokes:", v6),
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[PKGroupQuery _strokesAtLineIndex:containingStrokes:](self, "_strokesAtLineIndex:containingStrokes:", v9, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v14 = (double *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14[6];
      v28 = v14[4];
      v29 = v14[5];
      v16 = v14[7];
    }
    else
    {
      v28 = 0.0;
      v29 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
    }

    while (v9 < objc_msgSend(v8, "count", *(_QWORD *)&v28, *(_QWORD *)&v29))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v17 = (double *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v19 = v17[4];
        v18 = v17[5];
        v20 = v17[6];
        v21 = v17[7];
      }
      else
      {
        v18 = 0.0;
        v20 = 0.0;
        v21 = 0.0;
        v19 = 0.0;
      }

      v30.origin.x = v19;
      v30.origin.y = v18;
      v30.size.width = v20;
      v30.size.height = v21;
      MinY = CGRectGetMinY(v30);
      v31.origin.x = v28;
      v31.origin.y = v29;
      v31.size.width = v15;
      v31.size.height = v16;
      v23 = CGRectGetMinY(v31);
      v32.origin.x = v19;
      v32.origin.y = v18;
      v32.size.width = v20;
      v32.size.height = v21;
      v33.origin.x = v28;
      v33.origin.y = v29;
      v33.size.width = v15;
      v33.size.height = v16;
      v24 = CGRectIntersectsRect(v32, v33);
      if (MinY - v23 < 20.0 && v24)
      {
        -[PKGroupQuery _strokesAtLineIndex:containingStrokes:](self, "_strokesAtLineIndex:containingStrokes:", v9, v6, MinY - v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26 && objc_msgSend(v26, "count"))
          objc_msgSend(v13, "unionOrderedSet:", v27);

      }
      ++v9;
    }
    if (a4)
      +[PKDrawing _findRightmostStrokes:](PKDrawing, "_findRightmostStrokes:", v13);
    else
      +[PKDrawing _findLeftmostStrokes:](PKDrawing, "_findLeftmostStrokes:", v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_strokesAtLineIndex:(int64_t)a3 containingStrokes:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = a4;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v14 = 0;
  }
  else
  {
    -[PKGroupQuery strokeGroups](self, "strokeGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = *(void **)(v10 + 16);
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "intersectOrderedSet:", v6);

  }
  return v14;
}

- (id)lastStrokesInStrokes:(id)a3 isRTL:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  void *v12;
  void *v13;
  double *v14;
  CGFloat v15;
  CGFloat v16;
  double *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double MaxY;
  double v23;
  _BOOL4 v24;
  void *v26;
  void *v27;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v6 = a3;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && objc_msgSend(v7, "count")
    && (v9 = -[PKGroupQuery _lastLineIndexFromInitialStrokes:](self, "_lastLineIndexFromInitialStrokes:", v6),
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[PKGroupQuery _strokesAtLineIndex:containingStrokes:](self, "_strokesAtLineIndex:containingStrokes:", v9, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v14 = (double *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14[6];
      v29 = v14[4];
      v30 = v14[5];
      v16 = v14[7];
    }
    else
    {
      v29 = 0.0;
      v30 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
    }

    if ((v9 & 0x8000000000000000) == 0)
    {
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9, *(_QWORD *)&v29, *(_QWORD *)&v30);
        v17 = (double *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v19 = v17[4];
          v18 = v17[5];
          v20 = v17[6];
          v21 = v17[7];
        }
        else
        {
          v18 = 0.0;
          v20 = 0.0;
          v21 = 0.0;
          v19 = 0.0;
        }

        v31.origin.x = v19;
        v31.origin.y = v18;
        v31.size.width = v20;
        v31.size.height = v21;
        MaxY = CGRectGetMaxY(v31);
        v32.origin.x = v29;
        v32.origin.y = v30;
        v32.size.width = v15;
        v32.size.height = v16;
        v23 = CGRectGetMaxY(v32);
        v33.origin.x = v19;
        v33.origin.y = v18;
        v33.size.width = v20;
        v33.size.height = v21;
        v34.origin.x = v29;
        v34.origin.y = v30;
        v34.size.width = v15;
        v34.size.height = v16;
        v24 = CGRectIntersectsRect(v33, v34);
        if (MaxY - v23 > -20.0 && v24)
        {
          -[PKGroupQuery _strokesAtLineIndex:containingStrokes:](self, "_strokesAtLineIndex:containingStrokes:", v9, v6, MaxY - v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26 && objc_msgSend(v26, "count"))
            objc_msgSend(v13, "unionOrderedSet:", v27);

        }
      }
      while (v9-- > 0);
    }
    if (a4)
      +[PKDrawing _findLeftmostStrokes:](PKDrawing, "_findLeftmostStrokes:", v13);
    else
      +[PKDrawing _findRightmostStrokes:](PKDrawing, "_findRightmostStrokes:", v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)q_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD, void *, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void (**v43)(_QWORD, void *, void *);
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v55 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v6 = (void (**)(_QWORD, void *, void *))a4;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (-[PKGroupQuery strokeGroups](self, "strokeGroups"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9))
  {
    v43 = v6;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKGroupQuery strokeGroups](self, "strokeGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKGroupQuery _lines:containingStrokes:](self, "_lines:containingStrokes:", v12, v44);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v50;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD **)(*((_QWORD *)&v49 + 1) + 8 * v21);
          if (v22)
            v23 = (void *)v22[2];
          else
            v23 = 0;
          v24 = v23;
          objc_msgSend(v10, "addObjectsFromArray:", v24);

          if (v22)
          {
            v25 = v22[4];
            v26 = v22[5];
            v27 = v22[6];
            v28 = v22[7];
          }
          else
          {
            v26 = 0;
            v27 = 0;
            v28 = 0;
            v25 = 0;
          }
          v56.origin.x = x;
          v56.origin.y = y;
          v56.size.width = width;
          v56.size.height = height;
          v57 = CGRectUnion(v56, *(CGRect *)&v25);
          x = v57.origin.x;
          y = v57.origin.y;
          width = v57.size.width;
          height = v57.size.height;
          ++v21;
        }
        while (v19 != v21);
        v29 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        v19 = v29;
      }
      while (v29);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[PKGroupQuery strokeGroups](self, "strokeGroups");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v31)
    {
      v32 = y + -20.0;
      v33 = *(_QWORD *)v46;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v46 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD **)(*((_QWORD *)&v45 + 1) + 8 * v34);
          if ((objc_msgSend(v18, "containsObject:", v35) & 1) == 0)
          {
            if (v35)
            {
              v36 = v35[4];
              v37 = v35[5];
              v38 = v35[6];
              v39 = v35[7];
            }
            else
            {
              v37 = 0;
              v38 = 0;
              v39 = 0;
              v36 = 0;
            }
            v58.origin.x = x;
            v58.origin.y = v32;
            v58.size.width = width;
            v58.size.height = 40.0;
            if (CGRectIntersectsRect(*(CGRect *)&v36, v58))
            {
              if (v35)
                v40 = (void *)v35[2];
              else
                v40 = 0;
              v41 = v40;
              objc_msgSend(v11, "addObjectsFromArray:", v41);

            }
          }
          ++v34;
        }
        while (v31 != v34);
        v42 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        v31 = v42;
      }
      while (v42);
    }

    v43[2](v43, v10, v11);
    v6 = v43;
  }
  else
  {
    v6[2](v6, 0, 0);
  }

}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PKGroupQuery strokeGroups](self, "strokeGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v5;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        if (v10)
          v11 = *(void **)(v10 + 16);
        else
          v11 = 0;
        v12 = (void *)MEMORY[0x1E0C99E40];
        v13 = v11;
        objc_msgSend(v12, "orderedSetWithArray:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "intersectsOrderedSet:", v14);

        if (v15)
        {
          if (v6)
          {
            if (v10)
              v16 = *(_QWORD *)(v10 + 24);
            else
              v16 = 0;
            if (v6 != v16)
            {
              v6 = 3;
              v5 = obj;
              goto LABEL_22;
            }
          }
          else if (v10)
          {
            v6 = *(_QWORD *)(v10 + 24);
          }
          else
          {
            v6 = 0;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v5 = obj;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 = v17;
    }
    while (v17);
  }
LABEL_22:

  return v6;
}

- (CHStrokeGroupQuery)strokeGroupQuery
{
  return self->_strokeGroupQuery;
}

- (void)setStrokeGroupQuery:(id)a3
{
  objc_storeStrong((id *)&self->_strokeGroupQuery, a3);
}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_strokeGroupQuery, 0);
  objc_storeStrong((id *)&self->_strokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroupComputationQueue, 0);
  objc_storeStrong((id *)&self->_intersectionQueue, 0);
}

@end
