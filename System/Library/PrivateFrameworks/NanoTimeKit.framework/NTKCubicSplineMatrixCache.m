@implementation NTKCubicSplineMatrixCache

- (NTKCubicSplineMatrixCache)init
{
  NTKCubicSplineMatrixCache *v2;
  uint64_t v3;
  NSMutableDictionary *openMatrixCache;
  uint64_t v5;
  NSMutableDictionary *closedMatrixCache;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCubicSplineMatrixCache;
  v2 = -[NTKCubicSplineMatrixCache init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    openMatrixCache = v2->_openMatrixCache;
    v2->_openMatrixCache = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    closedMatrixCache = v2->_closedMatrixCache;
    v2->_closedMatrixCache = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("NTKCubic Spline Matrix Cache Queue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_17);
  return (id)sharedInstance___sharedInstance;
}

void __43__NTKCubicSplineMatrixCache_sharedInstance__block_invoke()
{
  NTKCubicSplineMatrixCache *v0;
  void *v1;

  v0 = objc_alloc_init(NTKCubicSplineMatrixCache);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- ($6F5639B62F6C861EB4A71773F5DCFA27)splineMatrixWithDimension:(int)a3 cache:(id)a4 matrixGenerator:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  $6F5639B62F6C861EB4A71773F5DCFA27 *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a4;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__NTKCubicSplineMatrixCache_splineMatrixWithDimension_cache_matrixGenerator___block_invoke;
  v15[3] = &unk_1E6BCF0D8;
  v19 = a3;
  v17 = v9;
  v18 = &v20;
  v16 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_sync(internalQueue, v15);
  v13 = ($6F5639B62F6C861EB4A71773F5DCFA27 *)v21[3];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __77__NTKCubicSplineMatrixCache_splineMatrixWithDimension_cache_matrixGenerator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "pointerValue");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void **)NTKSplineMatrixInversionWorkspace_new(*(_DWORD *)(a1 + 56));
    NTKSplineMatrix_invert(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (uint64_t)v4);
    NTKSplineMatrixInversionWorkspace_destroy(v4);
    NTKSplineMatrix_convert_to_single_precision(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    NTKSplineMatrix_discard_double_precision(*(void ***)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- ($6F5639B62F6C861EB4A71773F5DCFA27)openSplineMatrixWithDimension:(int)a3
{
  NSMutableDictionary *openMatrixCache;
  _QWORD v5[4];
  int v6;

  openMatrixCache = self->_openMatrixCache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__NTKCubicSplineMatrixCache_openSplineMatrixWithDimension___block_invoke;
  v5[3] = &__block_descriptor_36_e14______d_fi_8__0l;
  v6 = a3;
  return -[NTKCubicSplineMatrixCache splineMatrixWithDimension:cache:matrixGenerator:](self, "splineMatrixWithDimension:cache:matrixGenerator:", *(_QWORD *)&a3, openMatrixCache, v5);
}

_QWORD *__59__NTKCubicSplineMatrixCache_openSplineMatrixWithDimension___block_invoke(uint64_t a1)
{
  return generateOpenSplineMatrix(*(_DWORD *)(a1 + 32));
}

- ($6F5639B62F6C861EB4A71773F5DCFA27)closedSplineMatrixWithDimension:(int)a3
{
  NSMutableDictionary *closedMatrixCache;
  _QWORD v5[4];
  int v6;

  closedMatrixCache = self->_closedMatrixCache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__NTKCubicSplineMatrixCache_closedSplineMatrixWithDimension___block_invoke;
  v5[3] = &__block_descriptor_36_e14______d_fi_8__0l;
  v6 = a3;
  return -[NTKCubicSplineMatrixCache splineMatrixWithDimension:cache:matrixGenerator:](self, "splineMatrixWithDimension:cache:matrixGenerator:", *(_QWORD *)&a3, closedMatrixCache, v5);
}

_QWORD *__61__NTKCubicSplineMatrixCache_closedSplineMatrixWithDimension___block_invoke(uint64_t a1)
{
  return generateClosedSplineMatrix(*(_DWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_closedMatrixCache, 0);
  objc_storeStrong((id *)&self->_openMatrixCache, 0);
}

@end
