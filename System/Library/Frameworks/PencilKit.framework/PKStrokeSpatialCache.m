@implementation PKStrokeSpatialCache

- (PKStrokeSpatialCache)init
{
  PKStrokeSpatialCache *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *onscreenVisibleStrokesQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKStrokeSpatialCache;
  v2 = -[PKStrokeSpatialCache init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.pencilkit.onscreen-visible-strokes", v4);
    onscreenVisibleStrokesQueue = v2->_onscreenVisibleStrokesQueue;
    v2->_onscreenVisibleStrokesQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  id generateOnscreenVisibleStrokesBlock;
  SEL v4;
  objc_super v5;

  if (self)
  {
    generateOnscreenVisibleStrokesBlock = self->_generateOnscreenVisibleStrokesBlock;
    if (generateOnscreenVisibleStrokesBlock)
    {
      dispatch_block_cancel(generateOnscreenVisibleStrokesBlock);
      objc_setProperty_nonatomic_copy(self, v4, 0, 32);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)PKStrokeSpatialCache;
  -[PKStrokeSpatialCache dealloc](&v5, sel_dealloc);
}

- (void)_invalidateCacheForBounds:(int)a3 inDrawing:(CGFloat)a4 force:(CGFloat)a5
{
  _BOOL4 v13;
  int v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v16 = a2;
  if (a1)
  {
    v17.origin.x = a4;
    v17.origin.y = a5;
    v17.size.width = a6;
    v17.size.height = a7;
    v13 = !CGRectIsNull(v17);
    v18.origin.x = a4;
    v18.origin.y = a5;
    v18.size.width = a6;
    v18.size.height = a7;
    if (CGRectEqualToRect(v18, *(CGRect *)(a1 + 64)))
      v14 = objc_msgSend(v16, "isEqual:", *(_QWORD *)(a1 + 56)) ^ 1;
    else
      v14 = 1;
    v19.origin.x = a4;
    v19.origin.y = a5;
    v19.size.width = a6;
    v19.size.height = a7;
    if (CGRectIsNull(v19))
    {
      -[PKStrokeSpatialCache _cancelGenerateVisibleStrokesBlockIfNecessary]((_QWORD *)a1);
      *(_BYTE *)(a1 + 8) = 1;
      v15 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = MEMORY[0x1E0C9AA60];

    }
    else if ((v13 & (v14 | a3)) == 1)
    {
      -[PKStrokeSpatialCache _generateStrokesOnCanvasForVisibleFrame:inDrawing:](a1, v16, a4, a5, a6, a7);
    }
  }

}

- (void)_cancelGenerateVisibleStrokesBlockIfNecessary
{
  void *v2;
  SEL v3;

  if (a1)
  {
    v2 = (void *)a1[4];
    if (v2)
    {
      ++a1[6];
      dispatch_block_cancel(v2);
      objc_setProperty_nonatomic_copy(a1, v3, 0, 32);
    }
  }
}

- (void)_generateStrokesOnCanvasForVisibleFrame:(double)a3 inDrawing:(double)a4
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  dispatch_block_t v16;
  SEL v17;
  _QWORD block[5];
  id v19;
  id v20[6];
  id location;

  v12 = a2;
  if (a1)
  {
    -[PKStrokeSpatialCache _cancelGenerateVisibleStrokesBlockIfNecessary]((_QWORD *)a1);
    objc_storeStrong((id *)(a1 + 56), a2);
    *(double *)(a1 + 64) = a3;
    *(double *)(a1 + 72) = a4;
    *(double *)(a1 + 80) = a5;
    *(double *)(a1 + 88) = a6;
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_initWeak(&location, (id)a1);
    v14 = (void *)(*(_QWORD *)(a1 + 48) + 1);
    *(_QWORD *)(a1 + 48) = v14;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke;
    block[3] = &unk_1E777B308;
    block[4] = a1;
    v20[1] = *(id *)&a3;
    v20[2] = *(id *)&a4;
    v20[3] = *(id *)&a5;
    v20[4] = *(id *)&a6;
    v15 = v13;
    v19 = v15;
    objc_copyWeak(v20, &location);
    v20[5] = v14;
    v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
    objc_setProperty_nonatomic_copy((id)a1, v17, v16, 32);

    *(_BYTE *)(a1 + 8) = 0;
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 32));
    objc_destroyWeak(v20);

    objc_destroyWeak(&location);
  }

}

void __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;
  id *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  _QWORD v25[2];
  void (*v26)(id *, void *);
  void *v27;
  id v28;
  id v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1 + 40;
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v26 = __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_2;
  v27 = &unk_1E777B2E0;
  objc_copyWeak(v29, (id *)(a1 + 48));
  v29[1] = *(id *)(a1 + 88);
  v28 = *(id *)v3;
  v5 = *(double *)(v3 + 16);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v9 = v2;
  v10 = v25;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_eraserStrokeBounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v9, "strokes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v24, "_bounds");
          v38.origin.x = v5;
          v38.origin.y = v6;
          v38.size.width = v7;
          v38.size.height = v8;
          if (CGRectIntersectsRect(v36, v38))
          {
            objc_msgSend(v24, "_bounds");
            v39.origin.x = v13;
            v39.origin.y = v15;
            v39.size.width = v17;
            v39.size.height = v19;
            if (!CGRectIntersectsRect(v37, v39))
              objc_msgSend(v11, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v21);
    }

    v26(v10, v11);
  }

  objc_destroyWeak(v29);
}

void __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8[2];

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_3;
  v5[3] = &unk_1E777B2B8;
  objc_copyWeak(v8, a1 + 5);
  v8[1] = a1[6];
  v6 = v3;
  v7 = a1[4];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(v8);
}

void __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  const char *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 56) == WeakRetained[6])
  {
    v4 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 40), "strokes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218240;
      v12 = v9;
      v13 = 2048;
      v14 = objc_msgSend(v10, "count");
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Found %lu visible onscreen strokes with a drawing of %lu visible strokes", (uint8_t *)&v11, 0x16u);

    }
    *((_BYTE *)v3 + 8) = 1;
    objc_storeStrong((id *)v3 + 3, *(id *)(a1 + 32));
    v5 = objc_loadWeakRetained((id *)v3 + 2);

    if (v5)
    {
      v7 = objc_loadWeakRetained((id *)v3 + 2);
      objc_msgSend(v7, "didFinishCalculatingVisibleOnscreenStrokes:drawing:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    objc_setProperty_nonatomic_copy(v3, v6, 0, 32);
  }
  else
  {
    v8 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "Did not used cached strokes since another block started running while another one was being processed", (uint8_t *)&v11, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDrawing, 0);
  objc_storeStrong((id *)&self->_onscreenVisibleStrokesQueue, 0);
  objc_storeStrong(&self->_generateOnscreenVisibleStrokesBlock, 0);
  objc_storeStrong((id *)&self->_onscreenVisibleStrokes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
