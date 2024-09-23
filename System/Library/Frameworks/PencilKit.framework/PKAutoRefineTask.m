@implementation PKAutoRefineTask

void __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v4)
    v4 = (_QWORD *)v4[2];
  v5 = v4;
  objc_msgSend(v5, "strokeIndexesForColumnsInRange:", a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2;
  v13 = &unk_1E777C1E8;
  v14 = *(id *)(a1 + 32);
  v15 = &v16;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", &v10);
  v7 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "description", v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *((unsigned __int8 *)v17 + 24);
    *(_DWORD *)buf = 134218498;
    v21 = a2;
    v22 = 2112;
    v23 = v8;
    v24 = 1024;
    v25 = v9;
    _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "New AutoRefine task checking refinable strokes in column %ld, stroke indexes: %@, foundRefinable ? %d", buf, 0x1Cu);

  }
  if (!*((_BYTE *)v17 + 24))
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);

  _Block_object_dispose(&v16, 8);
}

void __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  int v10;

  v8 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v8)
    v8 = (_QWORD *)v8[6];
  v9 = v8;
  v10 = objc_msgSend(v9, "intersectsIndexesInRange:", a2, a3);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
}

uint64_t __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2_6(uint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)(result + 32);
  v5 = *(_QWORD *)(v4 + 32);
  if (a2 + a3 > v5)
  {
    if (a2 > v5)
      v5 = a2;
    *(_QWORD *)(v4 + 32) = v5;
    v6 = *(_QWORD *)(result + 32);
    v7 = a2 + a3 - 1;
    if (*(_QWORD *)(v6 + 40) > v7)
      *(_QWORD *)(v6 + 40) = v7;
    *a4 = 1;
  }
  return result;
}

- (void)updateCommittableRange
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  if (a1)
  {
    v2 = a1[4];
    v3 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (_QWORD *)a1[1];
    if (v5)
      v5 = (_QWORD *)v5[2];
    v6 = v5;
    v7 = (_QWORD *)a1[1];
    if (v7)
      v7 = (_QWORD *)v7[2];
    v8 = v7;
    objc_msgSend(v8, "transcriptionPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v3 - v2 + 1;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __42__PKAutoRefineTask_updateCommittableRange__block_invoke;
    v25[3] = &unk_1E777C260;
    v12 = v4;
    v26 = v12;
    objc_msgSend(v6, "enumerateTokensInTranscriptionPath:columnRange:tokenProcessingBlock:", v10, v2, v11, v25);

    v13 = (_QWORD *)a1[1];
    if (v13)
      v13 = (_QWORD *)v13[4];
    v14 = v13;
    objc_msgSend(v14, "objectsAtIndexes:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)a1[10];
    a1[10] = v15;

    v17 = (_QWORD *)a1[1];
    if (v17)
      v17 = (_QWORD *)v17[2];
    v18 = v17;
    v19 = (_QWORD *)a1[1];
    if (v19)
      v19 = (_QWORD *)v19[2];
    v20 = v19;
    objc_msgSend(v20, "transcriptionPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transcriptionWithPath:columnRange:filterLowConfidence:", v22, v2, v11, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)a1[9];
    a1[9] = v23;

  }
}

- (void)dealloc
{
  PKAutoRefineQueryItem *queryItem;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PKAutoRefineTask *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  queryItem = self->_queryItem;
  self->_queryItem = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "AutoRefine task destroyed %p.", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PKAutoRefineTask;
  -[PKAutoRefineTask dealloc](&v5, sel_dealloc);
}

void __42__PKAutoRefineTask_updateCommittableRange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "strokeIndexes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndexes:");

}

- (void)executeSynthesisWithSession:(void *)a3 tokenProcessingBlock:(void *)a4 completionBlock:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = a1;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "AutoRefine task performing the synthesis query %p.", buf, 0xCu);
    }

    if (v7)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16890]), "initWithRecognitionSession:", v7);
      v12 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query initialized.", buf, 2u);
      }

      v13 = MEMORY[0x1E0C809B0];
      v15 = *(_QWORD *)(a1 + 72);
      v14 = *(_QWORD *)(a1 + 80);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke;
      v19[3] = &unk_1E777C2B0;
      v19[4] = a1;
      v20 = v8;
      v21 = v9;
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_25;
      v18[3] = &unk_1E7777A48;
      v18[4] = a1;
      v16 = (id)objc_msgSend(v11, "refinedTokensForSingleLineContextStrokes:transcription:completion:shouldCancel:", v14, v15, v19, v18);

    }
    else
    {
      v17 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v23 = a1;
        _os_log_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEFAULT, "Session has been invalidated, canceling task %p.", buf, 0xCu);
      }

      -[PKAutoRefineTask cancel](a1);
    }
  }

}

- (uint64_t)cancel
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = v1;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "AutoRefine task cancelled %p.", (uint8_t *)&v4, 0xCu);
    }

    *(_BYTE *)(v1 + 88) = 1;
    result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)(v1 + 64) = v3;
  }
  return result;
}

void __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double x;
  double y;
  double width;
  double height;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD aBlock[4];
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  _BYTE *v67;
  _OWORD v68[8];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE buf[24];
  double v78;
  __int16 v79;
  uint64_t v80;
  void *v81;
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v85 = *MEMORY[0x1E0C80C00];
  v58 = a2;
  v57 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5 - *(double *)(*(_QWORD *)(a1 + 32) + 56);
  v7 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v58, "count");
    *(_WORD *)&buf[22] = 2048;
    v78 = v6;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query %p, starting the drawing update block with %ld synthesized tokens, after task duration = %f", buf, 0x20u);
  }

  if (v6 < 0.5)
  {
    v9 = 0.5 - v6;
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v9);
    v10 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v9;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query %p sleeping for %f before triggering the strokes update.", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v13 = v12;
  v14 = *(double *)(*(_QWORD *)(a1 + 32) + 56);
  v15 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = objc_msgSend(v58, "count");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2048;
    v78 = v13 - v14;
    _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query %p, running the drawing update block with %ld synthesized tokens, after task duration = %f", buf, 0x20u);
  }

  v60 = v58;
  v59 = v57;
  v18 = v59;
  v19 = v60;
  if (objc_msgSend((id)objc_opt_class(), "fullLineCommitStyle"))
  {
    v20 = COERCE_DOUBLE(objc_opt_new());
    v21 = (void *)objc_opt_new();
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v26 = v60;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v74 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          if (objc_msgSend(v30, "hasPrecedingSpace"))
            objc_msgSend(*(id *)&v20, "appendString:", CFSTR(" "));
          objc_msgSend(v30, "string");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&v20, "appendString:", v31);

          objc_msgSend(v30, "drawing");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "appendDrawing:", v32);

          objc_msgSend(v30, "bounds");
          v88.origin.x = v33;
          v88.origin.y = v34;
          v88.size.width = v35;
          v88.size.height = v36;
          v86.origin.x = x;
          v86.origin.y = y;
          v86.size.width = width;
          v86.size.height = height;
          v87 = CGRectUnion(v86, v88);
          x = v87.origin.x;
          y = v87.origin.y;
          width = v87.size.width;
          height = v87.size.height;
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      }
      while (v27);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v38 = v59;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v70 != v40)
            objc_enumerationMutation(v38);
          objc_msgSend(v37, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j));
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
      }
      while (v39);
    }

    v42 = objc_alloc(MEMORY[0x1E0D16840]);
    objc_msgSend(v26, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
      objc_msgSend(v43, "principalLines");
    else
      memset(v68, 0, sizeof(v68));
    objc_msgSend(v26, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v42, "initWithDrawing:string:principalLines:bounds:hasPrecedingSpace:", v21, *(_QWORD *)&v20, v68, objc_msgSend(v45, "hasPrecedingSpace"), x, y, width, height);

    v82 = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = *(_QWORD *)(a1 + 32);
      v49 = objc_msgSend(v19, "count");
      v50 = objc_msgSend(v37, "count");
      *(_DWORD *)buf = 134218755;
      *(_QWORD *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v49;
      *(_WORD *)&buf[22] = 2117;
      v78 = v20;
      v79 = 2048;
      v80 = v50;
      _os_log_impl(&dword_1BE213000, v47, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query %p, running the token drawing update block with tokens = %ld, string = %{sensitive}@, strokes=%ld", buf, 0x2Au);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v78 = 0.0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_20;
  aBlock[3] = &unk_1E777C288;
  v67 = buf;
  v51 = v19;
  v52 = *(_QWORD *)(a1 + 32);
  v53 = *(void **)(a1 + 40);
  v62 = v51;
  v63 = v52;
  v65 = v53;
  v54 = v18;
  v64 = v54;
  v66 = *(id *)(a1 + 48);
  v55 = _Block_copy(aBlock);
  v56 = _Block_copy(v55);
  (*((void (**)(void *, void *))v55 + 2))(v55, v56);

  _Block_object_dispose(buf, 8);
}

void __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v4 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_2;
    block[3] = &unk_1E7776F88;
    v14 = &v17;
    v15 = *(id *)(a1 + 64);
    block[4] = *(_QWORD *)(a1 + 40);
    v17 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v6 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218499;
      v21 = v8;
      v22 = 2048;
      v23 = v7;
      v24 = 2117;
      v25 = v10;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "AutoRefine task completed synthesis query %p, running the token drawing update block with token index = %ld, string = %{sensitive}@ ", buf, 0x20u);

    }
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_21;
    v18[3] = &unk_1E7776F60;
    v19 = v3;
    (*(void (**)(uint64_t, void *, void *, _QWORD *))(v11 + 16))(v11, v12, v13, v18);

    v14 = &v19;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }

}

void __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_21(uint64_t a1)
{
  void (**v1)(_QWORD);
  id v2;

  v1 = *(void (***)(_QWORD))(a1 + 32);
  v2 = _Block_copy(v1);
  v1[2](v1);

}

void __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "AutoRefine task completed %p.", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __85__PKAutoRefineTask_executeSynthesisWithSession_tokenProcessingBlock_completionBlock___block_invoke_25(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(_BYTE *)(v1 + 88) & 1;
  else
    return 0;
}

- (BOOL)hasOngoingAnimation
{
  _BOOL8 v2;
  NSObject *v3;
  int v5;
  _BYTE *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = !a1[88] && !a1[89] && a1[90] != 0;
  v3 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218240;
    v6 = a1;
    v7 = 1024;
    v8 = v2;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "AutoRefine task %p hasOngoingAnimation ? %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

- (uint64_t)logEventCompletionWithSuccess:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    *(_BYTE *)(result + 89) = 1;
    result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)(v3 + 64) = v4;
    *(_BYTE *)(v3 + 91) = a2;
  }
  return result;
}

- (id)debugInfo
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[8];
  _QWORD v48[8];
  _QWORD v49[4];
  _QWORD v50[6];

  v50[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localeIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    CHGetSynthesisModelVersionForLocale();
    v1 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v1;
    if (v38)
      v2 = v1 == 0;
    else
      v2 = 1;
    if (!v2)
    {
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v1, CFSTR("modelVersionForUserLocale"));
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("userLocale"));
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      v4 = *(id *)(v3 + 16);
      v5 = v4;
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "tokenColumnCount"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "transcriptionPaths");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "topModelTranscriptionPath");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i < objc_msgSend(v5, "tokenColumnCount"); ++i)
        {
          objc_msgSend(v5, "tokenRowsAtColumnIndex:", i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "transcriptionWithPath:columnRange:filterLowConfidence:", v41, i, 1, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "transcriptionWithPath:columnRange:filterLowConfidence:", v7, i, 1, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "strokeIndexesForColumnsInRange:", i, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __41__PKAutoRefineTask__serializedTextResult__block_invoke;
          v43[3] = &unk_1E777C238;
          v14 = v13;
          v44 = v14;
          objc_msgSend(v12, "enumerateRangesUsingBlock:", v43);
          v49[0] = CFSTR("topTranscription");
          v49[1] = CFSTR("topModelTranscription");
          v50[0] = v10;
          v50[1] = v11;
          v49[2] = CFSTR("rowCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v49[3] = CFSTR("strokeIndexes");
          v50[2] = v15;
          v50[3] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v16);

        }
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v42, CFSTR("tokenColumns"));

      }
    }
    else
    {
      v5 = 0;
    }

    objc_msgSend(v39, "setObject:forKeyedSubscript:", v37, CFSTR("textResult"));
    v17 = *(_QWORD **)(a1 + 8);
    if (v17)
      v17 = (_QWORD *)v17[2];
    v18 = v17;
    objc_msgSend(v18, "topModelTranscription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v19, CFSTR("textTranscription"));

    v47[0] = CFSTR("lastColumnToCommit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v20;
    v47[1] = CFSTR("firstColumnToCommit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v21;
    v47[2] = CFSTR("startTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v22;
    v47[3] = CFSTR("completionTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v23;
    v47[4] = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64) - *(double *)(a1 + 56));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v24;
    v47[5] = CFSTR("initialFirstColumnToCommit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 16));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[5] = v25;
    v47[6] = CFSTR("initialLastColumnToCommit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 24));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[6] = v26;
    v47[7] = CFSTR("strokesToReplace");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48[7] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v28, CFSTR("commit"));

    v45[0] = CFSTR("isCanceled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v29;
    v45[1] = CFSTR("isComplete");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 89));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v30;
    v45[2] = CFSTR("hasStrokeAnimationStarted");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 90));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v31;
    v45[3] = CFSTR("strokesRefinementSuccessful");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 91));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v33, CFSTR("status"));

  }
  else
  {
    v39 = 0;
  }
  return v39;
}

void __41__PKAutoRefineTask__serializedTextResult__block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  void *v6;
  id v7;
  NSRange v8;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  v6 = *(void **)(a1 + 32);
  v8.location = a2;
  v8.length = a3;
  NSStringFromRange(v8);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v7);

}

- (void)trimTaskForNewStrokeInRect:(CGFloat)a3 shouldCancel:(CGFloat)a4
{
  uint64_t v7;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  CGFloat Height;
  double v27;
  double v28;
  double Width;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat MinY;
  CGFloat v35;
  double v36;
  NSObject *v37;
  _QWORD *v39;
  _QWORD *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  void *v47;
  _QWORD *v48;
  _QWORD *v49;
  void *v50;
  _QWORD *v51;
  _QWORD *v52;
  void *v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  void *v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  CGFloat rect1;
  double MinX;
  double v65;
  CGFloat y;
  CGFloat v67;
  CGFloat rect;
  CGFloat v69;
  uint8_t buf[4];
  _QWORD *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  id v79;
  __int16 v80;
  void *v81;
  uint64_t v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v82 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = a1[5];
    if (v7 < a1[4])
      goto LABEL_22;
    LOBYTE(v12) = 0;
    while (1)
    {
      v13 = -[PKAutoRefineQueryItem boundsForTextResultsColumnAtIndex:](a1[1], v7);
      rect = v15;
      v69 = v14;
      v16 = v13;
      v18 = v17;
      v19 = (_QWORD *)a1[1];
      if (v19)
        v19 = (_QWORD *)v19[2];
      v20 = v19;
      v21 = (_QWORD *)a1[1];
      if (v21)
        v21 = (_QWORD *)v21[2];
      v22 = v21;
      objc_msgSend(v22, "transcriptionPaths");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "transcriptionWithPath:columnRange:filterLowConfidence:", v24, v7, 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v83.origin.x = v16;
      v83.origin.y = v18;
      v83.size.width = v69;
      v83.size.height = rect;
      Height = CGRectGetHeight(v83);
      v84.origin.y = v18;
      v27 = Height;
      y = v84.origin.y;
      v67 = v16;
      v84.origin.x = v16;
      v84.size.width = v69;
      v84.size.height = rect;
      v28 = fmax(CGRectGetWidth(v84) / fmax((double)(unint64_t)objc_msgSend(v25, "length"), 1.0), 20.0);
      if (v28 < v27)
        v28 = v27;
      v65 = v28;
      v85.origin.x = a3;
      v85.origin.y = a4;
      v85.size.width = a5;
      v85.size.height = a6;
      MinX = CGRectGetMinX(v85);
      v86.origin.x = a3;
      v86.origin.y = a4;
      v86.size.width = a5;
      v86.size.height = a6;
      rect1 = CGRectGetMinY(v86);
      v87.origin.x = a3;
      v87.origin.y = a4;
      v87.size.width = a5;
      v87.size.height = a6;
      Width = CGRectGetWidth(v87);
      v88.origin.x = a3;
      v88.origin.y = a4;
      v88.size.width = a5;
      v88.size.height = a6;
      v30 = CGRectGetHeight(v88);
      v89.origin.x = a3;
      v31 = a4;
      v89.origin.y = a4;
      v32 = a5;
      v89.size.width = a5;
      v33 = a6;
      v89.size.height = a6;
      MinY = CGRectGetMinY(v89);
      v90.origin.y = y;
      v90.origin.x = v67;
      v90.size.height = rect;
      v90.size.width = v69;
      v35 = CGRectGetWidth(v90);
      v91.origin.x = a3;
      v91.origin.y = v31;
      v91.size.width = v32;
      v91.size.height = v33;
      v36 = CGRectGetHeight(v91);
      if (v12)
      {
        v12 = 1;
      }
      else
      {
        v92.size.height = v36;
        v96.origin.y = y;
        v92.origin.x = v67;
        v92.origin.y = MinY;
        v92.size.width = v35;
        v96.origin.x = v67;
        v96.size.height = rect;
        v96.size.width = v69;
        v12 = CGRectIntersectsRect(v92, v96);
      }
      v93.origin.x = MinX + v65 * -0.5;
      v93.size.width = v65 + Width;
      v93.origin.y = rect1;
      v93.size.height = v30;
      v97.origin.y = y;
      v97.origin.x = v67;
      v97.size.height = rect;
      v97.size.width = v69;
      if (!CGRectIntersectsRect(v93, v97))
        break;
      v37 = os_log_create("com.apple.pencilkit", "AutoRefine");
      a6 = v33;
      a5 = v32;
      a4 = v31;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v39 = (_QWORD *)a1[1];
        if (v39)
          v39 = (_QWORD *)v39[2];
        v40 = v39;
        objc_msgSend(v40, "topTranscription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v94.origin.x = a3;
        v94.origin.y = v31;
        v94.size.width = v32;
        v94.size.height = a6;
        NSStringFromCGRect(v94);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        v95.origin.x = v67;
        v95.origin.y = y;
        v95.size.width = v69;
        v95.size.height = rect;
        NSStringFromCGRect(v95);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219267;
        v71 = a1;
        v72 = 2117;
        v73 = v41;
        v74 = 2048;
        v75 = v7;
        v76 = 2117;
        v77 = (uint64_t)v25;
        v78 = 2112;
        v79 = v42;
        v80 = 2112;
        v81 = v43;
        _os_log_debug_impl(&dword_1BE213000, v37, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ - column [%ld] = _%{sensitive}@_ TRIMMED by new stroke that is too close: bounds %@ vs %@", buf, 0x3Eu);

      }
      if (v7-- <= a1[4])
        goto LABEL_22;
    }

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_22:
      v44 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v48 = (_QWORD *)a1[1];
        if (v48)
          v48 = (_QWORD *)v48[2];
        v49 = v48;
        objc_msgSend(v49, "topTranscription");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218243;
        v71 = a1;
        v72 = 2117;
        v73 = v50;
        _os_log_debug_impl(&dword_1BE213000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ CANCELED by new stroke - no safe column remaining", buf, 0x16u);

      }
    }
    else
    {
      if (v7 < a1[5])
      {
        v46 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v51 = (_QWORD *)a1[1];
          if (v51)
            v51 = (_QWORD *)v51[2];
          v52 = v51;
          objc_msgSend(v52, "topTranscription");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = a1[5];
          *(_DWORD *)buf = 134218755;
          v71 = a1;
          v72 = 2117;
          v73 = v53;
          v74 = 2048;
          v75 = v54;
          v76 = 2048;
          v77 = v7;
          _os_log_debug_impl(&dword_1BE213000, v46, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ TRIMMED with last column changed from %ld to %ld", buf, 0x2Au);

        }
        a1[5] = v7;
        -[PKAutoRefineTask updateCommittableRange](a1);
        v45 = objc_msgSend((id)objc_opt_class(), "fullLineCommitStyle");
        v44 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v47 = (void *)a1[9];
          *(_DWORD *)buf = 134218499;
          v71 = a1;
          v72 = 2117;
          v73 = v47;
          v74 = 1024;
          LODWORD(v75) = v45;
          _os_log_debug_impl(&dword_1BE213000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine task %p just trimmed has committable transcription = _%{sensitive}@_, task canceled ? %d ", buf, 0x1Cu);
        }
        goto LABEL_24;
      }
      if (!v12 || !objc_msgSend((id)objc_opt_class(), "fullLineCommitStyle"))
      {
        v44 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v55 = (_QWORD *)a1[1];
          if (v55)
            v55 = (_QWORD *)v55[2];
          v56 = v55;
          objc_msgSend(v56, "topTranscription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = a1[5];
          *(_DWORD *)buf = 134218499;
          v71 = a1;
          v72 = 2117;
          v73 = v57;
          v74 = 2048;
          v75 = v58;
          _os_log_debug_impl(&dword_1BE213000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ - last column [%ld] NOT TRIMMED by new stroke.", buf, 0x20u);

        }
        LOBYTE(v45) = 0;
        goto LABEL_24;
      }
      v44 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v59 = (_QWORD *)a1[1];
        if (v59)
          v59 = (_QWORD *)v59[2];
        v60 = v59;
        objc_msgSend(v60, "topTranscription");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218243;
        v71 = a1;
        v72 = 2117;
        v73 = v61;
        _os_log_debug_impl(&dword_1BE213000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ - CANCELED by new stroke that may fall on the same line of text", buf, 0x16u);

      }
    }

    LOBYTE(v45) = 1;
LABEL_24:

    *a2 = v45;
  }
}

- (void)trimTaskForNewItem:(_BYTE *)a3 shouldCancel:
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  char v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  _QWORD *v69;
  _QWORD *v70;
  void *v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  _QWORD *v77;
  void *v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  void *v88;
  _QWORD *v89;
  _QWORD *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  _QWORD *v98;
  _QWORD *v99;
  void *v100;
  unint64_t v101;
  unint64_t v102;
  _QWORD *v104;
  uint64_t v105;
  _QWORD *v106;
  void *v107;
  void *v108;
  uint8_t buf[4];
  _QWORD *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    v104 = v4;
    if (v4)
    {
      v6 = *((id *)v4 + 2);
      v7 = (void *)v5[4];
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    v8 = v7;
    v9 = (_QWORD *)a1[1];
    if (v9)
      v9 = (_QWORD *)v9[4];
    v10 = v9;
    v108 = v6;
    objc_msgSend(v8, "differenceFromArray:", v10);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (_QWORD *)a1[1];
      if (v12)
        v12 = (_QWORD *)v12[2];
      v13 = v12;
      objc_msgSend(v13, "topTranscription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topTranscription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "insertions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      objc_msgSend(v107, "removals");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219011;
      v110 = a1;
      v111 = 2117;
      v112 = v14;
      v113 = 2117;
      v114 = (uint64_t)v15;
      v115 = 2048;
      v116 = v17;
      v117 = 2048;
      v118 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "AutoRefine Task %p with transcription %{sensitive}@ comparing with new item with transcription %{sensitive}@. different strokes +%ld, -%ld", buf, 0x34u);

    }
    if (objc_msgSend((id)objc_opt_class(), "fullLineCommitStyle"))
    {
      objc_msgSend(v107, "removals");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v19, "count"))
      {
        objc_msgSend(v107, "insertions");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "count");

        *a3 = 1;
        v50 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v110 = a1;
          _os_log_impl(&dword_1BE213000, v50, OS_LOG_TYPE_DEFAULT, "AutoRefine task %p should be canceled", buf, 0xCu);
        }

LABEL_60:
        v5 = v104;
        goto LABEL_61;
      }

    }
    objc_msgSend(v107, "removals");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {

      objc_msgSend(v107, "removals");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count") == 0;

      if (!v22)
      {
        v23 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v69 = (_QWORD *)a1[1];
          if (v69)
            v69 = (_QWORD *)v69[2];
          v70 = v69;
          objc_msgSend(v70, "topTranscription");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (_QWORD *)a1[1];
          if (v72)
            v72 = (_QWORD *)v72[2];
          v73 = v72;
          v74 = objc_msgSend(v73, "tokenColumnCount");
          objc_msgSend(v108, "topTranscription");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v108, "tokenColumnCount");
          *(_DWORD *)buf = 134219011;
          v110 = a1;
          v111 = 2117;
          v112 = v71;
          v113 = 2048;
          v114 = v74;
          v115 = 2117;
          v116 = (uint64_t)v75;
          v117 = 2048;
          v118 = v76;
          _os_log_debug_impl(&dword_1BE213000, v23, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns) CANCELLED by new item with transcription %{sensitive}@ (%ld columns) that has removed strokes.", buf, 0x34u);

        }
        *a3 = 1;
      }
    }
    else
    {
      objc_msgSend(v107, "insertions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "count");

      v25 = a1[4];
      v105 = a1[5];
      v102 = v105 + 1 - v25;
      v26 = v108;
      if (v105 + 1 <= v25)
        goto LABEL_44;
      v27 = a1[4];
      v28 = 0x7FFFFFFFFFFFFFFFLL;
      v101 = v27;
      while (v27 < objc_msgSend(v26, "tokenColumnCount"))
      {
        objc_msgSend(v26, "strokeIndexesForColumnsInRange:", v27, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (_QWORD *)a1[1];
        if (v30)
          v30 = (_QWORD *)v30[2];
        v31 = v30;
        objc_msgSend(v31, "strokeIndexesForColumnsInRange:", v27, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (_QWORD *)a1[1];
        if (v33)
          v33 = (_QWORD *)v33[2];
        v34 = v33;
        v35 = (_QWORD *)a1[1];
        if (v35)
          v35 = (_QWORD *)v35[2];
        v36 = v35;
        objc_msgSend(v36, "rawTranscriptionPath");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "transcriptionWithPath:columnRange:filterLowConfidence:", v37, v27, 1, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v108, "rawTranscriptionPath");
        v39 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "transcriptionWithPath:columnRange:filterLowConfidence:", v39, v27, 1, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v39) = objc_msgSend(v38, "isEqualToString:", v40);
        v41 = objc_msgSend(v29, "isEqualToIndexSet:", v32) & v39;
        v42 = v27;
        if ((v41 & 1) == 0)
        {
          v43 = os_log_create("com.apple.pencilkit", "AutoRefine");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v46 = (_QWORD *)a1[1];
            if (v46)
              v46 = (_QWORD *)v46[2];
            v98 = v46;
            objc_msgSend(v98, "topTranscription");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (_QWORD *)a1[1];
            if (v47)
              v47 = (_QWORD *)v47[2];
            v99 = v47;
            v96 = objc_msgSend(v99, "tokenColumnCount");
            v94 = a1[4];
            v95 = a1[5];
            objc_msgSend(v108, "topTranscription");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v108, "tokenColumnCount");
            *(_DWORD *)buf = 134220803;
            v110 = a1;
            v111 = 2117;
            v112 = v100;
            v113 = 2048;
            v114 = v96;
            v115 = 2048;
            v116 = v94;
            v117 = 2048;
            v118 = v95;
            v119 = 2117;
            v120 = v97;
            v121 = 2048;
            v122 = v48;
            v123 = 2048;
            v124 = v27;
            v125 = 2112;
            v126 = v29;
            v127 = 2112;
            v128 = v40;
            v129 = 2112;
            v130 = v32;
            v131 = 2112;
            v132 = v38;
            _os_log_debug_impl(&dword_1BE213000, v43, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns, committable range %ld-%ld) TRIMMED by new item with transcription %{sensitive}@ (%ld columns), different strokes in column %ld: %@ [%@] vs  %@ [%@]", buf, 0x7Au);

          }
          v42 = v28;
        }

        if (v105 == v27++)
          v45 = 0;
        else
          v45 = v41;
        v28 = v42;
        v26 = v108;
        if ((v45 & 1) == 0)
          goto LABEL_43;
      }
      v42 = v28;
LABEL_43:
      v25 = v101;
      if (v42 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_44:
        v51 = (_QWORD *)a1[1];
        if (v51)
          v51 = (_QWORD *)v51[2];
        v52 = v51;
        v53 = (_QWORD *)a1[1];
        if (v53)
          v53 = (_QWORD *)v53[2];
        v54 = v53;
        objc_msgSend(v54, "transcriptionPaths");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "firstObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "transcriptionWithPath:columnRange:filterLowConfidence:", v56, v25, v102, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          v77 = (_QWORD *)a1[1];
          if (v77)
            v77 = (_QWORD *)v77[2];
          v106 = v77;
          objc_msgSend(v106, "topTranscription");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (_QWORD *)a1[1];
          if (v79)
            v79 = (_QWORD *)v79[2];
          v80 = v79;
          v81 = objc_msgSend(v80, "tokenColumnCount");
          v83 = a1[4];
          v82 = a1[5];
          objc_msgSend(v108, "topTranscription");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v108, "tokenColumnCount");
          *(_DWORD *)buf = 134219779;
          v110 = a1;
          v111 = 2117;
          v112 = v78;
          v113 = 2048;
          v114 = v81;
          v115 = 2048;
          v116 = v83;
          v117 = 2048;
          v118 = v82;
          v119 = 2112;
          v120 = v57;
          v121 = 2117;
          v122 = (uint64_t)v84;
          v123 = 2048;
          v124 = v85;
          _os_log_debug_impl(&dword_1BE213000, v58, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns, committable range %ld-%ld, committable string %@) CANCELLED by new item with transcription %{sensitive}@ (%ld columns) - no column remains valid", buf, 0x52u);

        }
        *a3 = 1;

      }
      else
      {
        if (v42 < a1[5])
        {
          v59 = (_QWORD *)a1[1];
          if (v59)
            v59 = (_QWORD *)v59[2];
          v60 = v59;
          v61 = (_QWORD *)a1[1];
          if (v61)
            v61 = (_QWORD *)v61[2];
          v62 = v61;
          objc_msgSend(v62, "transcriptionPaths");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "firstObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "transcriptionWithPath:columnRange:filterLowConfidence:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = os_log_create("com.apple.pencilkit", "AutoRefine");
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            v86 = (_QWORD *)a1[1];
            if (v86)
              v86 = (_QWORD *)v86[2];
            v87 = v86;
            objc_msgSend(v87, "topTranscription");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = (_QWORD *)a1[1];
            if (v89)
              v89 = (_QWORD *)v89[2];
            v90 = v89;
            v91 = objc_msgSend(v90, "tokenColumnCount");
            v92 = (void *)a1[4];
            v93 = a1[5];
            *(_DWORD *)buf = 134219779;
            v110 = a1;
            v111 = 2117;
            v112 = v88;
            v113 = 2048;
            v114 = v91;
            v115 = 2048;
            v116 = (uint64_t)v92;
            v117 = 2048;
            v118 = v93;
            v119 = 2048;
            v120 = v92;
            v121 = 2048;
            v122 = v42;
            v123 = 2117;
            v124 = (uint64_t)v65;
            _os_log_debug_impl(&dword_1BE213000, v66, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns, committable range %ld-%ld) TRIMMED to committable range %ld-%ld, new string to refine = %{sensitive}@", buf, 0x52u);

          }
          a1[5] = v42;
          -[PKAutoRefineTask updateCommittableRange](a1);
          v67 = os_log_create("com.apple.pencilkit", "AutoRefine");
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v68 = (void *)a1[9];
            *(_DWORD *)buf = 134218243;
            v110 = a1;
            v111 = 2117;
            v112 = v68;
            _os_log_impl(&dword_1BE213000, v67, OS_LOG_TYPE_DEFAULT, "AutoRefine task %p just trimmed has committable transcription = _%{sensitive}@_", buf, 0x16u);
          }

        }
        *a3 = 0;
      }
    }
    goto LABEL_60;
  }
LABEL_61:

}

- (uint64_t)isInvalidatedGivenDrawing:(void *)a3 autoRefineController:(void *)a4 currentStroke:(void *)a5 inStrokesToReplace:(void *)a6 lineDrawing:(void *)a7 strokeGroup:(_QWORD *)a8 outStrokesToReplace:(_QWORD *)a9 outStrokesToPreserve:
{
  id v16;
  NSObject *v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  _BOOL4 v50;
  _QWORD *v51;
  _QWORD *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v98 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v76 = a3;
  v72 = a4;
  v73 = a5;
  v75 = a6;
  v74 = a7;
  if (!a1)
  {
    v38 = 0;
    goto LABEL_31;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    v17 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v88 = a1;
      v89 = 2048;
      v90 = objc_msgSend(v75, "strokeCount");
      _os_log_debug_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEBUG, "AutoRefine task %p has been canceled, invalid for updating the drawing - %ld strokes generated.", buf, 0x16u);
    }
LABEL_28:

    goto LABEL_29;
  }
  if (!v75 || !objc_msgSend(v75, "strokeCount") || !objc_msgSend(v74, "count"))
  {
    v17 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v88 = a1;
      v89 = 2048;
      v90 = objc_msgSend(v73, "count");
      _os_log_debug_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEBUG, "AutoRefine task %p did not generate any drawing from %ld strokes to replace.", buf, 0x16u);
    }
    goto LABEL_28;
  }
  v71 = a8;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v22 = v74;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
  if (!v23)
  {

LABEL_36:
    v41 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v88 = a1;
      _os_log_debug_impl(&dword_1BE213000, v41, OS_LOG_TYPE_DEBUG, "AutoRefine task %p skips committing synthetic drawing with no refinable strokes.", buf, 0xCu);
    }

    v38 = 0;
    *v71 = MEMORY[0x1E0C9AA60];
    goto LABEL_30;
  }
  v24 = 0;
  v25 = *(_QWORD *)v83;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v83 != v25)
        objc_enumerationMutation(v22);
      objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "strokeUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_visibleStrokeForIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v24 & 1) != 0)
      {
        v24 = 1;
        if (!v28)
          goto LABEL_32;
      }
      else
      {
        v24 = -[PKAutoRefineController isRefinableStroke:]((uint64_t)v76, v28);
        if (!v28)
        {
LABEL_32:
          v40 = os_log_create("com.apple.pencilkit", "AutoRefine");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v88 = a1;
            _os_log_debug_impl(&dword_1BE213000, v40, OS_LOG_TYPE_DEBUG, "AutoRefine task %p cancelled because it can no longer access one of the strokes to replace.", buf, 0xCu);
          }

          goto LABEL_29;
        }
      }
      objc_msgSend(v28, "_bounds");
      v101.origin.x = v29;
      v101.origin.y = v30;
      v101.size.width = v31;
      v101.size.height = v32;
      v99.origin.x = x;
      v99.origin.y = y;
      v99.size.width = width;
      v99.size.height = height;
      v100 = CGRectUnion(v99, v101);
      x = v100.origin.x;
      y = v100.origin.y;
      width = v100.size.width;
      height = v100.size.height;
      -[NSObject addObject:](v17, "addObject:", v28);

    }
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
    if (v23)
      continue;
    break;
  }

  if ((v24 & 1) == 0)
    goto LABEL_36;
  if (!v72
    || (v81 = 0,
        objc_msgSend(v72, "_bounds"),
        -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:]((_QWORD *)a1, &v81, v33, v34, v35, v36),
        !v81))
  {
    v42 = *(_QWORD **)(a1 + 8);
    if (v42)
      v42 = (_QWORD *)v42[2];
    v43 = v42;
    objc_msgSend(v43, "strokeIndexesForColumnsInRange:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = *(_QWORD **)(a1 + 8);
    if (v44)
      v44 = (_QWORD *)v44[4];
    v45 = v44;
    objc_msgSend(v45, "objectsAtIndexes:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v73);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v70);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isSubsetOfSet:", v47);

    v49 = os_log_create("com.apple.pencilkit", "AutoRefine");
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
    if ((v48 & 1) != 0)
    {
      if (v50)
      {
        v61 = objc_msgSend(v73, "count");
        v62 = objc_msgSend(v70, "count");
        v63 = *(_QWORD *)(a1 + 32);
        v64 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134219008;
        v88 = a1;
        v89 = 2048;
        v90 = v61;
        v91 = 2048;
        v92 = v62;
        v93 = 2048;
        v94 = v63;
        v95 = 2048;
        v96 = v64;
        _os_log_debug_impl(&dword_1BE213000, v49, OS_LOG_TYPE_DEBUG, "AutoRefine task %p NOT rejecting new drawing with %ld strokes to replace and %ld strokes in the commitable range [%ld-%ld].", buf, 0x34u);
      }

      if (a9)
      {
        v51 = *(_QWORD **)(a1 + 8);
        if (v51)
          v51 = (_QWORD *)v51[4];
        v52 = v51;
        v68 = (void *)objc_msgSend(v52, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v68, "count"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "removeObjectsInArray:", v70);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v54 = v68;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
        if (v55)
        {
          v56 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v55; ++j)
            {
              if (*(_QWORD *)v78 != v56)
                objc_enumerationMutation(v54);
              objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "strokeUUID", v68);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "_visibleStrokeForIdentifier:", v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v59)
                objc_msgSend(v53, "addObject:", v59);

            }
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
          }
          while (v55);
        }

        v60 = objc_retainAutorelease(v53);
        *a9 = v60;

      }
      if (v71)
        *v71 = objc_retainAutorelease(v17);
    }
    else
    {
      if (v50)
      {
        v65 = objc_msgSend(v75, "strokeCount");
        v66 = *(_QWORD *)(a1 + 32);
        v67 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218752;
        v88 = a1;
        v89 = 2048;
        v90 = v65;
        v91 = 2048;
        v92 = v66;
        v93 = 2048;
        v94 = v67;
        _os_log_debug_impl(&dword_1BE213000, v49, OS_LOG_TYPE_DEBUG, "AutoRefine task %p rejecting new drawing with %ld strokes because some strokes to replace are not in the committable token range [%ld-%ld].", buf, 0x2Au);
      }

    }
    v38 = v48 ^ 1u;
    goto LABEL_30;
  }
  v37 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v88 = a1;
    _os_log_debug_impl(&dword_1BE213000, v37, OS_LOG_TYPE_DEBUG, "AutoRefine task %p cancelled because current stroke is being drawn nearby.", buf, 0xCu);
  }

LABEL_29:
  v38 = 1;
LABEL_30:

LABEL_31:
  return v38;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strokesToReplace, 0);
  objc_storeStrong((id *)&self->_stringToRefine, 0);
  objc_storeStrong((id *)&self->_providerVersion, 0);
  objc_storeStrong((id *)&self->_queryItem, 0);
}

@end
