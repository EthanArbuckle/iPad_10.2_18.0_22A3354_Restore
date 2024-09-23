@implementation PKRendererTileController

- (PKRendererTileController)init
{
  PKRendererTileController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *tileQueue;
  uint64_t v7;
  NSMutableDictionary *tileFramebuffers;
  uint64_t v9;
  NSMutableDictionary *tileMultiplyFramebuffers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKRendererTileController;
  v2 = -[PKRendererTileController init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.pencilkit.tiles", v4);
    tileQueue = v2->_tileQueue;
    v2->_tileQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    tileFramebuffers = v2->_tileFramebuffers;
    v2->_tileFramebuffers = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    tileMultiplyFramebuffers = v2->_tileMultiplyFramebuffers;
    v2->_tileMultiplyFramebuffers = (NSMutableDictionary *)v9;

  }
  return v2;
}

+ (id)sharedController
{
  objc_opt_self();
  if (_MergedGlobals_111 != -1)
    dispatch_once(&_MergedGlobals_111, &__block_literal_global_3);
  return (id)qword_1ECEE6090;
}

void __44__PKRendererTileController_sharedController__block_invoke()
{
  PKRendererTileController *v0;
  void *v1;

  v0 = objc_alloc_init(PKRendererTileController);
  v1 = (void *)qword_1ECEE6090;
  qword_1ECEE6090 = (uint64_t)v0;

}

- (id)_framebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 tileFramebuffersDictionary:(void *)a7 clearColor:(double)a8 clearFramebufferBlock:(double)a9
{
  char *v21;
  id v22;
  id v23;
  void (**v24)(id, _QWORD);
  uint64_t v25;
  void *v26;
  float64x2_t v27;
  double v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  float64x2_t v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  float64x2_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v21 = a2;
  v22 = a4;
  v23 = a6;
  v24 = a7;
  if (a1)
  {
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__2;
    v57 = __Block_byref_object_dispose__2;
    v58 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v25 = a5;
    v26 = v22;
    if (v21)
    {
      v27 = *(float64x2_t *)(v21 + 200);
      v28 = COERCE_DOUBLE(atomic_load((unint64_t *)v21 + 1));
      v35 = vrndaq_f64(vmulq_n_f64(v27, v28));
      v29 = (void *)*((_QWORD *)v21 + 15);
    }
    else
    {
      v29 = 0;
      v35 = 0u;
    }
    v30 = v29;
    v31 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __142__PKRendererTileController__framebufferForTile_createIfNeeded_device_pixelFormat_tileFramebuffersDictionary_clearColor_clearFramebufferBlock___block_invoke;
    block[3] = &unk_1E7777BD0;
    v40 = &v53;
    v37 = v23;
    v32 = v30;
    v38 = v32;
    v48 = a3;
    v42 = v35;
    v43 = v25;
    v22 = v26;
    v44 = a8;
    v45 = a9;
    v46 = a10;
    v47 = a11;
    v39 = v26;
    v41 = &v49;
    dispatch_sync(v31, block);
    if (*((_BYTE *)v50 + 24))
      v24[2](v24, v54[5]);
    v33 = (id)v54[5];

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __142__PKRendererTileController__framebufferForTile_createIfNeeded_device_pixelFormat_tileFramebuffersDictionary_clearColor_clearFramebufferBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) && *(_BYTE *)(a1 + 128))
  {
    v5 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)[PKMetalFramebuffer alloc], *(void **)(a1 + 88), *(void **)(a1 + 48), 0, 1, (void *)1, 1, *(double *)(a1 + 72), *(double *)(a1 + 80));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      v9 = *(_OWORD *)(a1 + 112);
      *(_OWORD *)(v8 + 88) = *(_OWORD *)(a1 + 96);
      *(_OWORD *)(v8 + 104) = v9;
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (id)framebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 clearFramebufferBlock:
{
  _BYTE *v11;
  id v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _BYTE *v19;
  id v20;

  v11 = a2;
  v12 = a6;
  if (a1)
  {
    v13 = a4;
    if (v11)
    {
      if (v11[82])
        v14 = 1.0;
      else
        v14 = 0.0;
    }
    else
    {
      v14 = 0.0;
    }
    v15 = *(void **)(a1 + 16);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __103__PKRendererTileController_framebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke;
    v18[3] = &unk_1E7777BF8;
    v20 = v12;
    v19 = v11;
    -[PKRendererTileController _framebufferForTile:createIfNeeded:device:pixelFormat:tileFramebuffersDictionary:clearColor:clearFramebufferBlock:](a1, v19, a3, v13, a5, v15, v18, 0.0, 0.0, 0.0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __103__PKRendererTileController_framebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  -[PKRendererTile lockAndSetFramebufferThreadSafe:](*(_QWORD *)(a1 + 32), v5);

}

- (id)multiplyFramebufferForTile:(char)a3 createIfNeeded:(void *)a4 device:(uint64_t)a5 pixelFormat:(void *)a6 clearFramebufferBlock:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v11 = a2;
  v12 = a6;
  v13 = v12;
  if (a1)
  {
    v14 = *(void **)(a1 + 24);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __111__PKRendererTileController_multiplyFramebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke;
    v17[3] = &unk_1E7777BF8;
    v19 = v12;
    v18 = v11;
    -[PKRendererTileController _framebufferForTile:createIfNeeded:device:pixelFormat:tileFramebuffersDictionary:clearColor:clearFramebufferBlock:](a1, v18, a3, a4, a5, v14, v17, 1.0, 1.0, 1.0, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __111__PKRendererTileController_multiplyFramebufferForTile_createIfNeeded_device_pixelFormat_clearFramebufferBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  -[PKRendererTile lockAndSetMultiplyFramebufferThreadSafe:](*(_QWORD *)(a1 + 32), v5);

}

- (void)didTeardownTile:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  if (a1)
  {
    if (a2)
    {
      v3 = *(id *)(a2 + 120);
      if (v3)
      {
        v4 = *(NSObject **)(a1 + 8);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__PKRendererTileController_didTeardownTile___block_invoke;
        block[3] = &unk_1E7777C20;
        block[4] = a1;
        v5 = v3;
        v7 = v5;
        dispatch_sync(v4, block);

        v3 = v5;
      }

    }
    else
    {

    }
  }
}

uint64_t __44__PKRendererTileController_didTeardownTile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileMultiplyFramebuffers, 0);
  objc_storeStrong((id *)&self->_tileFramebuffers, 0);
  objc_storeStrong((id *)&self->_tileQueue, 0);
}

@end
