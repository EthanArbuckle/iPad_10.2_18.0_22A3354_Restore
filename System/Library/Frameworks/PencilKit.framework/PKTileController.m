@implementation PKTileController

- (id)initWithPixelSize:(char)a3 actualSize:(void *)a4 pixelFormat:(double)a5 sixChannelBlending:(double)a6 metalConfig:(double)a7
{
  id v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  objc_super v29;

  v15 = a4;
  if (a1 && +[PKMetalUtility isMetalAvailable](PKMetalUtility, "isMetalAvailable"))
  {
    v29.receiver = a1;
    v29.super_class = (Class)PKTileController;
    v16 = objc_msgSendSuper2(&v29, sel_init);
    if (v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = (void *)v16[4];
      v16[4] = v17;

      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = (void *)v16[5];
      v16[5] = v19;

      *((_BYTE *)v16 + 9) = a3;
      v16[2] = 0x3FF0000000000000;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INTERACTIVE, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v23 = dispatch_queue_create("com.apple.pencilkit.draw-previews", v22);
      v24 = (void *)v16[6];
      v16[6] = v23;

      v25 = -[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlending:metalConfig:]([PKMetalRendererController alloc], a2, a3, v15, a5, a6, a7, a8);
      v26 = (void *)v16[3];
      v16[3] = v25;

      -[PKMetalRendererController setup](v16[3]);
    }
    a1 = v16;
    v27 = a1;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)teardown
{
  if (a1)
  {
    -[PKMetalRendererController cancelAllRendering](*(_QWORD *)(a1 + 24));
    -[PKTileController resumePreviews](a1);
    -[PKMetalRendererController teardown](*(_QWORD *)(a1 + 24));
  }
}

- (void)resumePreviews
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "resume tile previews", v3, 2u);
    }

    if (*(_BYTE *)(a1 + 10))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 48));
      *(_BYTE *)(a1 + 10) = 0;
    }
  }
}

- (void)suspendPreviews
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "suspend tile previews", v3, 2u);
    }

    if (!*(_BYTE *)(a1 + 10))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 48));
      *(_BYTE *)(a1 + 10) = 1;
    }
  }
}

- (void)setSixChannelBlending:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 9) != a2)
    {
      *(_BYTE *)(a1 + 9) = a2;
      -[PKMetalRendererController setSixChannelBlending:](*(_QWORD *)(a1 + 24), a2);
    }
  }
}

- (void)setContentZoomScale:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 16) != a2)
    {
      *(double *)(a1 + 16) = a2;
      -[PKMetalRendererController setContentZoomScale:](*(_QWORD *)(a1 + 24), a2);
    }
  }
}

- (void)renderTilesIntoTiles:(void *)a3 completion:
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
    v7 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PKTileController_renderTilesIntoTiles_completion___block_invoke;
    block[3] = &unk_1E7778880;
    block[4] = a1;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __52__PKTileController_renderTilesIntoTiles_completion___block_invoke(uint64_t a1)
{
  -[PKMetalRendererController renderTilesIntoTiles:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)callbackAfterTileGeneration:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t v7[16];

  if (a1)
  {
    v3 = a2;
    v4 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "queue tile completion", v7, 2u);
    }

    v5 = *(id *)(a1 + 40);
    v6 = _Block_copy(v3);

    objc_msgSend(v5, "addObject:", v6);
    -[PKTileController runTasks](a1);
  }
}

- (void)runTasks
{
  NSObject *v1;
  _QWORD v2[5];
  char v3;

  v1 = *(NSObject **)(a1 + 48);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__PKTileController_runTasks__block_invoke;
  v2[3] = &unk_1E777A028;
  v2[4] = a1;
  v3 = 0;
  dispatch_async(v1, v2);
}

- (void)renderStrokes:(void *)a3 additionalStrokes:(void *)a4 intoTile:(void *)a5 completionBlock:
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKTileTask *v13;
  NSObject *v14;
  int v15;
  PKTileTask *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = a5;
    v10 = a4;
    v11 = a3;
    v12 = a2;
    v13 = -[PKTileTask initWithStrokes:additionalStrokes:intoTile:completionBlock:]([PKTileTask alloc], "initWithStrokes:additionalStrokes:intoTile:completionBlock:", v12, v11, v10, v9);

    v14 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = v13;
      _os_log_debug_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEBUG, "queue %@", (uint8_t *)&v15, 0xCu);
    }

    os_unfair_lock_lock(&tasks_lock);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
    os_unfair_lock_unlock(&tasks_lock);
    -[PKTileController runTasks](a1);

  }
}

void __28__PKTileController_runTasks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  CGFloat *v10;
  unint64_t v11;
  const char *v12;
  os_log_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  uint64_t v39;
  id Property;
  id v41;
  int v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  BOOL v60;
  void (*v61)(void);
  const char *v62;
  NSObject *v63;
  uint64_t v64;
  CGFloat *v65;
  uint64_t v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint8_t v81[128];
  __int128 buf;
  void (*v83)(uint64_t);
  void *v84;
  uint64_t v85;
  uint64_t v86;
  CGRect v87;
  CGRect v88;

  v86 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&tasks_lock);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v4 = (_QWORD *)v4[4];
    v5 = v4;
    objc_msgSend(v5, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 32);
    else
      v8 = 0;
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(&tasks_lock);
    if (v6)
    {
      v9 = *(id *)(v6 + 24);
      v10 = (CGFloat *)v9;
      if (v9)
        v11 = atomic_load(v9 + 2);
      else
        v11 = 0;
      if (*(_QWORD *)(v6 + 32) == v11)
      {
        v13 = (os_log_t)*(id *)(v6 + 8);
        v14 = *(void **)(v6 + 16);
        if (v14)
        {
          v66 = v6;
          v64 = a1;
          v15 = *(_QWORD *)(a1 + 32);
          v16 = v14;
          v17 = v13;
          v67 = v16;
          v65 = v10;
          if (v15)
          {
            v13 = -[NSObject mutableCopy](v17, "mutableCopy");
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSObject count](v17, "count"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v63 = v17;
            v19 = v17;
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, &buf, 16);
            if (v20)
            {
              v21 = v20;
              v22 = 0;
              v23 = *(_QWORD *)v77;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v77 != v23)
                    objc_enumerationMutation(v19);
                  v25 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22 + i);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "_strokeUUID");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v27);

                }
                v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, &buf, 16);
                v22 += i;
              }
              while (v21);
            }

            v28 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v29 = v67;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v73;
              do
              {
                for (j = 0; j != v31; ++j)
                {
                  if (*(_QWORD *)v73 != v32)
                    objc_enumerationMutation(v29);
                  v34 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                  objc_msgSend(v34, "_strokeUUID");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "objectForKeyedSubscript:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  v37 = objc_msgSend(v34, "_isHidden");
                  v38 = v37;
                  if (v36)
                  {
                    v39 = objc_msgSend(v36, "integerValue");
                    if (v38)
                      objc_msgSend(v28, "addIndex:", v39);
                    else
                      -[NSObject setObject:atIndexedSubscript:](v13, "setObject:atIndexedSubscript:", v34, v39);
                  }
                  else if ((v37 & 1) == 0)
                  {
                    -[NSObject addObject:](v13, "addObject:", v34);
                  }

                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
              }
              while (v31);
            }

            -[NSObject removeObjectsAtIndexes:](v13, "removeObjectsAtIndexes:", v28);
            v6 = v66;
            v17 = v63;
          }
          else
          {
            v13 = 0;
          }

          a1 = v64;
          v10 = v65;
        }
        if (v10)
          Property = objc_getProperty(v10, v12, 136, 1);
        else
          Property = 0;
        v41 = Property;
        v42 = objc_msgSend(v41, "isEqualToArray:", v13);

        if (v42)
        {
          (*(void (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
          v43 = os_log_create("com.apple.pencilkit", "Tiles");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v6;
            _os_log_debug_impl(&dword_1BE213000, v43, OS_LOG_TYPE_DEBUG, "nothing to do %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v45 = os_log_create("com.apple.pencilkit", "Tiles");
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v6;
            _os_log_debug_impl(&dword_1BE213000, v45, OS_LOG_TYPE_DEBUG, "render %@", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSObject count](v13, "count"));
          v43 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v47 = v10[23];
            v46 = v10[24];
            v48 = v10[25];
            v49 = v10[26];
          }
          else
          {
            v46 = 0.0;
            v48 = 0.0;
            v49 = 0.0;
            v47 = 0.0;
          }
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v50 = v13;
          v51 = -[NSObject countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v69;
            do
            {
              for (k = 0; k != v52; ++k)
              {
                if (*(_QWORD *)v69 != v53)
                  objc_enumerationMutation(v50);
                v55 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
                objc_msgSend(v55, "_bounds");
                v88.origin.x = v56;
                v88.origin.y = v57;
                v88.size.width = v58;
                v88.size.height = v59;
                v87.origin.x = v47;
                v87.origin.y = v46;
                v87.size.width = v48;
                v87.size.height = v49;
                if (CGRectIntersectsRect(v87, v88))
                  -[NSObject addObject:](v43, "addObject:", v55);
              }
              v52 = -[NSObject countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
            }
            while (v52);
          }

          v60 = -[PKMetalRendererController drawStrokes:intoTile:renderCount:offscreen:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v43, v10, *(_QWORD *)(v6 + 32), *(_BYTE *)(a1 + 40));
          v61 = *(void (**)(void))(*(_QWORD *)(v6 + 40) + 16);
          if (v60)
          {
            v61();
            if (v10)
              objc_setProperty_atomic_copy(v10, v62, v50, 136);
          }
          else
          {
            v61();
          }
        }

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
        v13 = os_log_create("com.apple.pencilkit", "Tiles");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v6;
          _os_log_debug_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEBUG, "skip %@", (uint8_t *)&buf, 0xCu);
        }
      }

      return;
    }
  }
  else
  {
    os_unfair_lock_unlock(&tasks_lock);
  }
  v44 = *(_QWORD *)(a1 + 32);
  if (v44)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v83 = __31__PKTileController_didComplete__block_invoke;
    v84 = &unk_1E7778020;
    v85 = v44;
    dispatch_sync(MEMORY[0x1E0C80D38], &buf);
  }
}

void __31__PKTileController_didComplete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 40);
  else
    v3 = 0;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = *(void **)(v4 + 40);
    else
      v5 = 0;
    v6 = (void *)objc_msgSend(v5, "copy");
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 40);
    else
      v8 = 0;
    objc_msgSend(v8, "removeAllObjects");
    v9 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v21 = objc_msgSend(v6, "count");
      _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "did complete %ld", buf, 0xCu);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewQueue, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_rendererController, 0);
}

@end
