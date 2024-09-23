@implementation PKController

- (PKController)init
{
  objc_exception_throw(CFSTR("Init unavailable."));
}

- (id)initWithPixelSize:(char)a3 actualSize:(void *)a4 singleComponent:(double)a5 sixChannelBlending:(double)a6 metalConfig:(double)a7
{
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  dispatch_queue_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  dispatch_semaphore_t v30;
  void *v31;
  PKMetalRendererController *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  PKDrawing *v38;
  void *v39;
  id v40;
  objc_super v42;

  v16 = a4;
  if (a1 && +[PKMetalUtility isMetalAvailable](PKMetalUtility, "isMetalAvailable"))
  {
    v42.receiver = a1;
    v42.super_class = (Class)PKController;
    v17 = objc_msgSendSuper2(&v42, sel_init);
    if (v17)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INTERACTIVE, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)v17 + 3, a4);
      v20 = dispatch_queue_create("com.apple.pencilkit.draw-interact", v19);
      v21 = (void *)*((_QWORD *)v17 + 11);
      *((_QWORD *)v17 + 11) = v20;

      v22 = dispatch_queue_create("com.apple.pencilkit.draw", v19);
      v23 = (void *)*((_QWORD *)v17 + 12);
      *((_QWORD *)v17 + 12) = v22;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)*((_QWORD *)v17 + 5);
      *((_QWORD *)v17 + 5) = v24;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v26 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_UTILITY, 0);
      v27 = objc_claimAutoreleasedReturnValue();

      v28 = dispatch_queue_create("com.apple.pencilkit.draw-background", v27);
      v29 = (void *)*((_QWORD *)v17 + 13);
      *((_QWORD *)v17 + 13) = v28;

      v30 = dispatch_semaphore_create(0);
      v31 = (void *)*((_QWORD *)v17 + 10);
      *((_QWORD *)v17 + 10) = v30;

      *((_BYTE *)v17 + 32) = a3;
      *((_BYTE *)v17 + 49) = 0;
      objc_storeStrong((id *)v17 + 3, a4);
      v32 = [PKMetalRendererController alloc];
      if (a2)
        v33 = 10;
      else
        v33 = 80;
      v34 = -[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlending:metalConfig:](v32, (void *)v33, a3, v16, a5, a6, a7, a8);
      v35 = (void *)*((_QWORD *)v17 + 8);
      *((_QWORD *)v17 + 8) = v34;

      v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v37 = (void *)*((_QWORD *)v17 + 2);
      *((_QWORD *)v17 + 2) = v36;

      v38 = objc_alloc_init(PKDrawing);
      v39 = (void *)*((_QWORD *)v17 + 9);
      *((_QWORD *)v17 + 9) = v38;

      -[PKMetalRendererController setup](*((_QWORD *)v17 + 8));
      -[PKController _didUpdateMutableRenderedStrokes](v17);

    }
    a1 = v17;
    v40 = a1;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)_didUpdateMutableRenderedStrokes
{
  uint64_t v1;
  id v2;
  id *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    v1 = objc_msgSend(obj[2], "copy");
    v2 = obj[1];
    obj[1] = (id)v1;

    objc_sync_exit(obj);
  }
}

- (id)teardown
{
  id *v1;

  if (result)
  {
    v1 = result;
    -[PKMetalRendererController cancelAllRendering]((uint64_t)result[8]);
    -[PKMetalRendererController teardown]((uint64_t)v1[8]);
    return (id *)objc_storeWeak(v1 + 7, 0);
  }
  return result;
}

- (id)renderedStrokes
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_msgSend(v1[1], "copy");
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_QWORD)inputController
{
  _QWORD *v1;

  if (a1)
  {
    v1 = (_QWORD *)a1[8];
    if (v1)
      v1 = (_QWORD *)v1[66];
    a1 = v1;
  }
  return a1;
}

- (void)didStartLiveInteraction
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PKController_didStartLiveInteraction__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

intptr_t __39__PKController_didStartLiveInteraction__block_invoke(uint64_t a1)
{
  intptr_t result;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    *(_BYTE *)(v3 + 48) = 0;
  return result;
}

- (void)setLiveInteractionDrawing:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)objc_msgSend(v3, "copy");

    v6 = *(NSObject **)(a1 + 96);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__PKController_setLiveInteractionDrawing___block_invoke;
    v7[3] = &unk_1E7777440;
    v7[4] = a1;
    v4 = v5;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

void __42__PKController_setLiveInteractionDrawing___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (void)setDrawing:(void *)a3 tiles:(__int128 *)a4 tileTransform:(void *)a5 contentImageTexture:(__int128 *)a6 contentImageTextureTransform:(void *)a7 completionBlock:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id location[2];

  v13 = a2;
  v14 = a3;
  v15 = a5;
  v16 = a7;
  if (a1)
  {
    objc_initWeak(location, a1);
    v17 = (void *)objc_msgSend(v13, "copy");

    v18 = a1[11];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__PKController_setDrawing_tiles_tileTransform_contentImageTexture_contentImageTextureTransform_completionBlock___block_invoke;
    block[3] = &unk_1E7777210;
    objc_copyWeak(&v26, location);
    v13 = v17;
    v22 = v13;
    v23 = v15;
    v19 = a6[1];
    v27 = *a6;
    v28 = v19;
    v29 = a6[2];
    v24 = v14;
    v20 = a4[1];
    v30 = *a4;
    v31 = v20;
    v32 = a4[2];
    v25 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
  }

}

uint64_t __112__PKController_setDrawing_tiles_tileTransform_contentImageTexture_contentImageTextureTransform_completionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v11[3];
  __int128 v12[3];

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  -[PKController _setDrawing:imageTexture:]((uint64_t)WeakRetained, *(void **)(a1 + 32), 0);

  v4 = objc_loadWeakRetained(v2);
  v5 = v4;
  if (v4)
    v4 = (id)*((_QWORD *)v4 + 8);
  v6 = *(_OWORD *)(a1 + 88);
  v12[0] = *(_OWORD *)(a1 + 72);
  v12[1] = v6;
  v12[2] = *(_OWORD *)(a1 + 104);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 136);
  v11[0] = *(_OWORD *)(a1 + 120);
  v11[1] = v9;
  v11[2] = *(_OWORD *)(a1 + 152);
  -[PKMetalRendererController renderImageTexture:imageTextureTransform:withTiles:tileTransform:]((uint64_t)v4, v7, v12, v8, v11);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_setDrawing:(void *)a3 imageTexture:
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "Set async drawing %p", buf, 0xCu);
    }

    v8 = *(NSObject **)(a1 + 96);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__PKController__setDrawing_imageTexture___block_invoke;
    v9[3] = &unk_1E7777440;
    v9[4] = a1;
    v10 = v5;
    dispatch_sync(v8, v9);
    if (v6)
      -[PKMetalRendererController drawTexture:](*(_QWORD *)(a1 + 64), v6);

  }
}

- (void)setDrawing:(void *)a3 imageTexture:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v7;
      _os_log_debug_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEBUG, "Set drawing %p", buf, 0xCu);
    }

    v11 = (void *)objc_msgSend(v7, "copy");
    v12 = *(NSObject **)(a1 + 88);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__PKController_setDrawing_imageTexture_completion___block_invoke;
    v13[3] = &unk_1E77773A0;
    v13[4] = a1;
    v7 = v11;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    dispatch_async(v12, v13);

  }
}

uint64_t __51__PKController_setDrawing_imageTexture_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  -[PKController _setDrawing:imageTexture:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __41__PKController__setDrawing_imageTexture___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "isEqual:", v2);

  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "mergeWithDrawing:", *(_QWORD *)(a1 + 40));
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "strokes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "mutableCopy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

}

- (void)performAsyncInteractBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 88);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__PKController_performAsyncInteractBlock___block_invoke;
    v6[3] = &unk_1E7776F88;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

intptr_t __42__PKController_performAsyncInteractBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  intptr_t (*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __42__PKController_performAsyncInteractBlock___block_invoke_2;
  v7 = &unk_1E7776F38;
  v2 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  (*(void (**)(void))(v2 + 16))();
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __42__PKController_performAsyncInteractBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)hideStrokesWithoutUpdating:(void *)a3 completion:
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke;
    v7[3] = &unk_1E7777238;
    v7[4] = a1;
    v8 = v5;
    v9 = v6;
    -[PKController performAsyncInteractBlock:](a1, v7);

  }
}

void __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void (**v7)(void);
  _QWORD block[5];
  id v9;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke_2;
  block[3] = &unk_1E7777440;
  block[4] = v3;
  v9 = v4;
  dispatch_sync(v5, block);
  -[PKController _didUpdateMutableRenderedStrokes](*(void **)(a1 + 32));
  v7[2]();
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setStrokes:hidden:", *(_QWORD *)(a1 + 40), 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "drawingChanged:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "strokes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (void)updateDrawingWithErasedStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__PKController_updateDrawingWithErasedStrokes___block_invoke;
    v5[3] = &unk_1E7777260;
    v6 = v3;
    v7 = a1;
    -[PKController performAsyncInteractBlock:](a1, v5);

  }
}

void __47__PKController_updateDrawingWithErasedStrokes___block_invoke(uint64_t a1, void *a2)
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  char v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  _OWORD *v32;
  __int128 v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v51 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v12, "_strokeUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        objc_msgSend(v12, "_bounds");
        v55.origin.x = v14;
        v55.origin.y = v15;
        v55.size.width = v16;
        v55.size.height = v17;
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        v53 = CGRectUnion(v52, v55);
        x = v53.origin.x;
        y = v53.origin.y;
        width = v53.size.width;
        height = v53.size.height;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v9);
  }

  v18 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "strokes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "strokes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v25, "_strokeUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v7, "containsObject:", v26);

        if ((v27 & 1) == 0)
        {
          objc_msgSend(v25, "_bounds");
          v56.origin.x = v28;
          v56.origin.y = v29;
          v56.size.width = v30;
          v56.size.height = v31;
          v54.origin.x = x;
          v54.origin.y = y;
          v54.size.width = width;
          v54.size.height = height;
          if (CGRectIntersectsRect(v54, v56))
            objc_msgSend(v20, "addObject:", v25);
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v22);
  }

  v32 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 64);
  if (v32)
  {
    v33 = v32[42];
    v38 = v32[41];
    v39 = v33;
    v40 = v32[43];
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
  }
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __47__PKController_updateDrawingWithErasedStrokes___block_invoke_2;
  v36[3] = &unk_1E77773C8;
  v34 = v35;
  v37 = v34;
  -[PKMetalRendererController drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:completion:]((uint64_t)v32, v20, &v38, 1, v36, x, y, width, height);

}

uint64_t __47__PKController_updateDrawingWithErasedStrokes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addLiveStrokeEarly:(void *)a3 completionBlock:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PKController_addLiveStrokeEarly_completionBlock___block_invoke;
    block[3] = &unk_1E77773F0;
    block[4] = a1;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

void __51__PKController_addLiveStrokeEarly_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 72);
  v5[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoableAddNewStrokes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1[4] + 40), "addObject:", v4);
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)cancelLiveStroke
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PKController_cancelLiveStroke__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __32__PKController_cancelLiveStroke__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "applyToDrawing:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(WeakRetained, "drawingChanged:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  }
}

- (void)addNewRenderedStrokes:(int)a3 wasAddedEarly:(int)a4 hidden:(void *)a5 preDrawingChangedBlock:
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;
  char v17;
  _QWORD block[5];
  id v19;
  id v20;
  char v21;
  char v22;

  v9 = a2;
  v10 = a5;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 50) & 1) != 0)
    {
      -[PKController _addNewStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:](a1, v9, a3, a4, v10);
    }
    else
    {
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v12 = *(NSObject **)(a1 + 96);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke;
        block[3] = &unk_1E7777288;
        block[4] = a1;
        v19 = v9;
        v21 = a3;
        v22 = a4;
        v20 = v10;
        dispatch_sync(v12, block);

        v11 = v19;
      }
      else
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2;
        v13[3] = &unk_1E7777328;
        v13[4] = a1;
        v14 = v9;
        v16 = a3;
        v17 = a4;
        v15 = v10;
        -[PKController performAsyncInteractBlock:](a1, v13);

        v11 = v14;
      }

    }
  }

}

- (void)_addNewStrokes:(int)a3 wasAddedEarly:(int)a4 hidden:(void *)a5 preDrawingChangedBlock:
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id WeakRetained;
  void *v30;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  _QWORD block[5];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v32 = a5;
  if (a1)
  {
    if (!a3)
      goto LABEL_7;
    if (objc_msgSend(v31, "count") == 1)
    {
      v8 = *(void **)(a1 + 72);
      objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateStroke:indexHint:", v9, objc_msgSend(*(id *)(a1 + 72), "_rootStrokesCount") - 1);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
    }
    else
    {
LABEL_7:
      v30 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = v31;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v14, "_strokeUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (!v16)
          {
            objc_msgSend(*(id *)(a1 + 72), "visibleStrokeForInsertingStroke:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v17);
            v18 = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v43 = a1;
              v44 = 2112;
              v45 = v14;
              _os_log_debug_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEBUG, "Drawing %@ add stroke %@", buf, 0x16u);
            }

            objc_msgSend(v14, "ink");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "behavior");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEraser");

            if (v21)
            {
              v22 = *(NSObject **)(a1 + 104);
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke;
              block[3] = &unk_1E77773F0;
              block[4] = a1;
              v36 = v17;
              v37 = v32;
              dispatch_async(v22, block);

            }
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v33, "count"))
    {
      v23 = v30;
      if (!v23)
      {
        objc_msgSend(*(id *)(a1 + 72), "undoableAddNewStrokes:", v33);
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a4)
      {
        objc_msgSend(*(id *)(a1 + 72), "undoableDeleteStrokes:", v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      v25 = *(void **)(a1 + 72);
      v26 = *(_QWORD *)(a1 + 104);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4;
      v34[3] = &unk_1E7777378;
      v34[4] = a1;
      objc_msgSend(v25, "clipStrokesIfNeededOnQueue:completion:", v26, v34);
      v27 = v33;
      if (objc_msgSend(v27, "count"))
      {
        objc_msgSend(*(id *)(a1 + 16), "addObjectsFromArray:", v27);
        -[PKController _didUpdateMutableRenderedStrokes]((void *)a1);
      }

      *(_BYTE *)(a1 + 50) = 1;
      (*((void (**)(id, id, void *, _QWORD))v32 + 2))(v32, v23, v24, 0);
      *(_BYTE *)(a1 + 50) = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "drawingChanged:", *(_QWORD *)(a1 + 72));

  }
}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke(uint64_t a1)
{
  -[PKController _addNewStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(void **)(a1 + 48));
}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  __int16 v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3;
  block[3] = &unk_1E7777300;
  block[4] = v4;
  v9 = v5;
  v12 = *(_WORD *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v7 = v3;
  dispatch_sync(v6, block);

}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(unsigned __int8 *)(a1 + 65);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4;
  v6[3] = &unk_1E77772D8;
  v7 = *(id *)(a1 + 48);
  -[PKController _addNewStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:](v2, v3, v4, v5, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5;
  v12[3] = &unk_1E77772B0;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v13 = v7;
  v16 = a4;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 96);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_16;
  block[3] = &unk_1E7777418;
  block[4] = v2;
  block[5] = &v19;
  dispatch_sync(v3, block);
  objc_msgSend((id)v20[5], "sliceWithEraseStroke:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PencilKitBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Pixel Erase"), CFSTR("Pixel Erase"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionName:", v7);

  v8 = (void *)v20[5];
  v25[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteStrokes:", v9);

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 88);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2;
  v14[3] = &unk_1E7777350;
  v14[4] = v10;
  v17 = &v19;
  v12 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v12;
  v13 = v5;
  dispatch_sync(v11, v14);

  _Block_object_dispose(&v19, 8);
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  id v7;
  __int128 v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3;
  block[3] = &unk_1E7777350;
  block[4] = v2;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v8 = v5;
  v7 = *(id *)(a1 + 40);
  dispatch_sync(v3, block);

}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  objc_msgSend(*(id *)(a1[4] + 72), "mergeWithDrawing:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v2 = a1[4];
  if (v2)
    *(_BYTE *)(v2 + 50) = 1;
  (*(void (**)(void))(a1[6] + 16))();
  v3 = a1[4];
  if (v3)
  {
    *(_BYTE *)(v3 + 50) = 0;
    v3 = a1[4];
  }
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 56));
  objc_msgSend(WeakRetained, "drawingChanged:", *(_QWORD *)(a1[4] + 72));

}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5;
  block[3] = &unk_1E7777440;
  block[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_sync(v5, block);

}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 96);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_6;
  v4[3] = &unk_1E7777440;
  v4[4] = v1;
  v5 = v2;
  dispatch_sync(v3, v4);

}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "mergeWithDrawing:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "drawingChanged:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_drawingQueue, 0);
  objc_storeStrong((id *)&self->_interactQueue, 0);
  objc_storeStrong((id *)&self->_interactSemaphore, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_rendererController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_liveDrawingUndoCommands, 0);
  objc_storeStrong((id *)&self->_metalConfig, 0);
  objc_storeStrong((id *)&self->_mutableRenderedStrokes, 0);
  objc_storeStrong((id *)&self->_renderedStrokes, 0);
}

@end
