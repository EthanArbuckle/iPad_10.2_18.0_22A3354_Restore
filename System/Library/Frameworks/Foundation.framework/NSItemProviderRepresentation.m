@implementation NSItemProviderRepresentation

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (NSItemProviderRepresentation)initWithType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  NSItemProviderRepresentation *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSItemProviderRepresentation;
  v8 = -[NSItemProviderRepresentation init](&v10, sel_init);
  if (v8)
  {
    v8->_typeIdentifier = (NSString *)objc_msgSend(a3, "copy");
    v8->_loader = (id)objc_msgSend(a5, "copy");
    v8->_visibility = 0;
    v8->_preferredRepresentation = a4;
  }
  return v8;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (int64_t)preferredRepresentation
{
  return self->_preferredRepresentation;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSItemProviderRepresentation;
  -[NSItemProviderRepresentation dealloc](&v3, sel_dealloc);
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (NSItemProviderRepresentation)initWithType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke;
  v6[3] = &unk_1E0F501B0;
  v6[4] = a5;
  return -[NSItemProviderRepresentation initWithType_v2:preferredRepresentation:loader:](self, "initWithType_v2:preferredRepresentation:loader:", a3, a4, v6);
}

uint64_t __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_1E0F50188;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v8, a4, a5, a6);
}

uint64_t __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", a2, a3, a5, a4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)copyWithDoNothingLoaderBlock
{
  id v3;
  NSString *typeIdentifier;
  int64_t preferredRepresentation;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc((Class)objc_opt_class());
  typeIdentifier = self->_typeIdentifier;
  preferredRepresentation = self->_preferredRepresentation;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke;
  v7[3] = &unk_1E0F52D00;
  v7[4] = self;
  return (id)objc_msgSend(v3, "initWithType_v2:preferredRepresentation:loader:", typeIdentifier, preferredRepresentation, v7);
}

uint64_t __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke_2;
    block[3] = &unk_1E0F4E060;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = a3;
    _NSIPDispatchAsyncCallback(block);
  }
  return 0;
}

uint64_t __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSItemRepresentationLoadResult *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = +[NSItemRepresentationLoadResult resultWithError:](NSItemRepresentationLoadResult, "resultWithError:", _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0));
  return (*(uint64_t (**)(uint64_t, NSItemRepresentationLoadResult *))(v1 + 16))(v1, v2);
}

- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4
{
  NSProgress *v6;
  uint64_t v7;
  NSProgress *v8;
  uint64_t v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[3];
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke;
  v12[3] = &unk_1E0F52D28;
  v12[4] = a4;
  v12[5] = v13;
  -[NSProgress setCancellationHandler:](v6, "setCancellationHandler:", v12);
  v8 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3;
  v11[3] = &unk_1E0F52D78;
  v11[4] = v8;
  v11[5] = v13;
  v9 = (*((uint64_t (**)(id, _QWORD *))a3 + 2))(a3, v11);
  if (v9)
    -[NSProgress addChild:withPendingUnitCount:](v6, "addChild:withPendingUnitCount:", v9, 100);
  else
    -[NSProgress addChild:withPendingUnitCount:](v6, "addChild:withPendingUnitCount:", v8, 100);
  _Block_object_dispose(v13, 8);
  return v6;
}

void __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2;
  block[3] = &unk_1E0F52D28;
  v2 = *(_OWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_4;
  v4[3] = &unk_1E0F52D50;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[5] = a2;
  v4[6] = v3;
  v4[4] = v2;
  _NSIPDispatchAsyncCallback(v4);
}

uint64_t __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_loadWithOptions:(id)a3 completionBlock:(id)a4
{
  id v4;
  _QWORD v6[6];
  _QWORD v7[8];
  _QWORD v8[5];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = __Block_byref_object_copy__25;
  v9[4] = __Block_byref_object_dispose__25;
  v9[5] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke;
  v8[3] = &unk_1E0F52DA0;
  v8[4] = v9;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2;
  v7[3] = &unk_1E0F52E68;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4_68;
  v6[3] = &unk_1E0F52DC8;
  v6[4] = a4;
  v6[5] = v8;
  v4 = -[NSItemProviderRepresentation performProgressTrackingWithLoaderBlock:onCancelCallback:](self, "performProgressTrackingWithLoaderBlock:onCancelCallback:", v7, v6);
  _Block_object_dispose(v9, 8);
  return v4;
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "totalUnitCount"));
  if (a2)
    (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "cleanupHandler");
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4;
  v7[3] = &unk_1E0F52DF0;
  v7[4] = a2;
  v8 = *(_OWORD *)(a1 + 40);
  v9 = v4;
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v5 + 16))(v5, v7);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4(uint64_t a1)
{
  id v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 40))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5;
  v4[3] = &unk_1E0F52DC8;
  v5 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "setCleanupHandler:", v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5(uint64_t a1)
{
  _QWORD block[4];
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6;
  block[3] = &unk_1E0F52DC8;
  v2 = *(_OWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_64(_QWORD *a1)
{
  NSItemRepresentationLoadResult *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if (!a1[5])
    return (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], 0);
  v2 = +[NSItemRepresentationLoadResult resultWithError:](NSItemRepresentationLoadResult, "resultWithError:", _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1[4] + 16), 0));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2_65;
  v4[3] = &unk_1E0F4E870;
  v4[4] = a1[6];
  -[NSItemRepresentationLoadResult setCleanupHandler:](v2, "setCleanupHandler:", v4);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2_65(uint64_t a1)
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3_66;
  v1[3] = &unk_1E0F4E870;
  v1[4] = *(_QWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(v1);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4_68(uint64_t a1)
{
  NSItemRepresentationLoadResult *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  v2 = +[NSItemRepresentationLoadResult resultWithError:](NSItemRepresentationLoadResult, "resultWithError:", _NSIPDataTransferCancelledError(0));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5_69;
  v4[3] = &unk_1E0F4E870;
  v4[4] = *(_QWORD *)(a1 + 40);
  -[NSItemRepresentationLoadResult setCleanupHandler:](v2, "setCleanupHandler:", v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5_69(uint64_t a1)
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6_70;
  v1[3] = &unk_1E0F4E870;
  v1[4] = *(_QWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(v1);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)loadWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke;
  v5[3] = &unk_1E0F52E90;
  v5[4] = a4;
  return -[NSItemProviderRepresentation _loadWithOptions:completionBlock:](self, "_loadWithOptions:completionBlock:", a3, v5);
}

void __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke_2;
    block[3] = &unk_1E0F4E060;
    block[4] = a2;
    block[5] = v2;
    _NSIPDispatchAsyncCallback(block);
  }
}

uint64_t __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)loadWithOptions:(id)a3 completionHandler:(id)a4
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__NSItemProviderRepresentation_loadWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E0F52E90;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadWithOptions_v2:completionHandler:](self, "loadWithOptions_v2:completionHandler:", a3, v5);
}

uint64_t __66__NSItemProviderRepresentation_loadWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(a2, "data"), objc_msgSend(a2, "urlWrapper"), objc_msgSend(a2, "error"), objc_msgSend(a2, "cleanupHandler"));
  return result;
}

- (void)setLoaderBlock_v2:(id)a3
{

  self->_loader = (id)objc_msgSend(a3, "copy");
}

- (void)setLoaderBlock:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke;
  v3[3] = &unk_1E0F501B0;
  v3[4] = a3;
  -[NSItemProviderRepresentation setLoaderBlock_v2:](self, "setLoaderBlock_v2:", v3);
}

uint64_t __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke_2;
  v8[3] = &unk_1E0F52EB8;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v8, a4, a5, a6);
}

uint64_t __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, NSItemRepresentationLoadResult *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", a2, a3, a6, a5));
}

- (id)loadDataWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  NSProgress *v7;
  NSProgress *v8;
  NSProgress *v9;
  NSProgress *v10;
  NSProgress *v11;
  uint64_t v12;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  v7 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation"))
    v8 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  else
    v8 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke;
  v14[3] = &unk_1E0F506C0;
  v14[5] = v8;
  v14[6] = a4;
  v14[4] = self;
  v9 = -[NSItemProviderRepresentation _loadWithOptions:completionBlock:](self, "_loadWithOptions:completionBlock:", a3, v14);
  if (v8)
  {
    if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation") == 2)
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 10);
      v10 = v7;
      v11 = v8;
      v12 = 90;
    }
    else
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 50);
      v10 = v7;
      v11 = v8;
      v12 = 50;
    }
  }
  else
  {
    v10 = v7;
    v11 = v9;
    v12 = 100;
  }
  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v11, v12);
  return v7;
}

void __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSError *v5;
  uint64_t *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSError *v12;
  _QWORD block[9];
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "error");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__25;
  v25 = __Block_byref_object_dispose__25;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__25;
  v19 = __Block_byref_object_dispose__25;
  v20 = 0;
  v20 = (id)objc_msgSend(a2, "error");
  if (v4)
    goto LABEL_5;
  if (objc_msgSend(a2, "data"))
  {
    v5 = (NSError *)(id)objc_msgSend(a2, "data");
    v6 = v22;
LABEL_4:
    v6[5] = (uint64_t)v5;
    goto LABEL_5;
  }
  if (objc_msgSend(a2, "urlWrapper"))
  {
    v11 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_2;
    v14[3] = &unk_1E0F52F08;
    v14[4] = *(_QWORD *)(a1 + 32);
    v14[5] = a2;
    v14[6] = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", _NSIPCoordinatedReadForUploading(v11, (uint64_t)v14), 100);
    goto LABEL_6;
  }
  v12 = _NSIPNoLoaderAvailableError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
  if (v12)
  {

    v5 = _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)v12);
    v6 = v16;
    goto LABEL_4;
  }
LABEL_5:
  v7 = (id)v22[5];
  v8 = (id)v16[5];
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  v9 = objc_msgSend(a2, "cleanupHandler");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_4;
  block[3] = &unk_1E0F52F30;
  v10 = *(_QWORD *)(a1 + 48);
  block[4] = a2;
  block[5] = v10;
  block[7] = &v21;
  block[8] = &v15;
  block[6] = v9;
  _NSIPDispatchAsyncCallback(block);
LABEL_6:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

void __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1, void *a2, NSError *a3)
{
  NSError *RepresentationError;
  uint64_t v5;
  NSError *v6;
  void *v7;
  char *v8;
  NSFileManager *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[9];
  char *v13;
  NSError *v14[2];

  RepresentationError = a3;
  v5 = 0;
  v14[1] = *(NSError **)MEMORY[0x1E0C80C00];
  v14[0] = a3;
  v6 = a3;
  if (a2 && !a3)
  {
    v13 = 0;
    v7 = _NSIPCloneURLToTemporaryFolder(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, &v13, v14);
    v5 = 0;
    v8 = v13;
    if (v13 && !v14[0])
    {
      v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 1, v14);
      v8 = v13;
    }
    if (v8)
    {
      v9 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      -[NSFileManager removeItemAtURL:error:](v9, "removeItemAtURL:error:", v13, 0);
    }
    v6 = v14[0];
  }
  if (v6)
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)v6);
  if (!(v5 | (unint64_t)RepresentationError))
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
  v10 = objc_msgSend(*(id *)(a1 + 40), "cleanupHandler");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_3;
  v12[3] = &unk_1E0F52EE0;
  v11 = *(_QWORD *)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v12[5] = v5;
  v12[6] = RepresentationError;
  v12[7] = v11;
  v12[8] = v10;
  _NSIPDispatchAsyncCallback(v12);
}

uint64_t __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t result;

  if (*(_QWORD *)(a1 + 56))
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copyWithData:urlWrapper:cleanupHandler:error:", *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyWithData:urlWrapper:cleanupHandler:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)loadDataWithOptions:(id)a3 completionHandler:(id)a4
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__NSItemProviderRepresentation_loadDataWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E0F52E90;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadDataWithOptions_v2:completionHandler:](self, "loadDataWithOptions_v2:completionHandler:", a3, v5);
}

uint64_t __70__NSItemProviderRepresentation_loadDataWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(a2, "data"), objc_msgSend(a2, "error"));
  return result;
}

- (id)loadFileCopyWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  NSProgress *v7;
  NSProgress *v8;
  NSProgress *v9;
  NSProgress *v10;
  NSProgress *v11;
  uint64_t v12;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  v7 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation"))
    v8 = +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100);
  else
    v8 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke;
  v14[3] = &unk_1E0F52FA8;
  v14[5] = v8;
  v14[6] = a4;
  v14[4] = self;
  v9 = -[NSItemProviderRepresentation _loadWithOptions:completionBlock:](self, "_loadWithOptions:completionBlock:", a3, v14);
  if (v8)
  {
    if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation") == 2)
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 10);
      v10 = v7;
      v11 = v8;
      v12 = 90;
    }
    else
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 50);
      v10 = v7;
      v11 = v8;
      v12 = 50;
    }
  }
  else
  {
    v10 = v7;
    v11 = v9;
    v12 = 100;
  }
  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v11, v12);
  return v7;
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v4;
  uint64_t v5;
  uint64_t v6;
  NSError *v7;
  char *v8;
  uint64_t v9;
  char *v11;
  id v12;
  uint64_t v13;
  NSProgress *v14;
  NSObject *v15;
  NSError *RepresentationError;
  _QWORD v17[7];
  _QWORD v18[2];
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[8];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)objc_msgSend(a2, "error");
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v19 = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_2;
  v20 = &unk_1E0F52F80;
  v6 = *(_QWORD *)(a1 + 48);
  v21 = a2;
  v22 = v6;
  if (v4)
    goto LABEL_2;
  if (objc_msgSend(a2, "data"))
  {
    v11 = _NSIPCreateTemporaryFolder();
    if (v11)
    {
      v8 = v11;
      v12 = (id)((uint64_t (*)(uint64_t))softLinkUTTypeCopyDescription_0[0])(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      if (!objc_msgSend(v12, "length"))
        v12 = (id)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("Document"), &stru_1E0F56070, CFSTR("Extension"));
      v9 = objc_msgSend(v8, "URLByAppendingPathComponent:", _NSIPFilenameWithProperExtension(v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)));
      objc_msgSend((id)objc_msgSend(a2, "data"), "writeToURL:atomically:", v9, 1);
      v7 = 0;
      goto LABEL_4;
    }
    v15 = _NSOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v15, OS_LOG_TYPE_ERROR, "Cannot create temporary file.", buf, 2u);
    }
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
    goto LABEL_16;
  }
  if (!objc_msgSend(a2, "urlWrapper"))
  {
    RepresentationError = _NSIPNoLoaderAvailableError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
LABEL_16:
    if (!RepresentationError)
    {
      v8 = 0;
      v7 = 0;
      goto LABEL_3;
    }
    v4 = _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)RepresentationError);
LABEL_2:
    v7 = v4;
    v8 = 0;
LABEL_3:
    v9 = 0;
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    return ((uint64_t (*)(_QWORD *, uint64_t, NSError *, char *, uint64_t))v19)(v18, v9, v7, v8, objc_msgSend(a2, "cleanupHandler"));
  }
  v13 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_82;
  v17[3] = &unk_1E0F52F08;
  v17[4] = *(_QWORD *)(a1 + 32);
  v17[5] = a2;
  v17[6] = v18;
  v14 = _NSIPCoordinatedRead(v13, (uint64_t)v17);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 50);
  return objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", v14, 50);
}

void __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD block[11];

  block[10] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_3;
  block[3] = &unk_1E0F52F58;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  block[4] = a2;
  block[5] = v6;
  block[6] = a3;
  block[7] = a4;
  block[8] = v5;
  block[9] = a5;
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_3(uint64_t a1)
{
  NSSecurityScopedURLWrapper *v2;
  void *v3;
  uint64_t result;

  if (*(_QWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 32))
      v2 = -[NSSecurityScopedURLWrapper initWithURL:]([NSSecurityScopedURLWrapper alloc], "initWithURL:", *(_QWORD *)(a1 + 32));
    else
      v2 = 0;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyWithData:urlWrapper:cleanupHandler:error:", 0, v2, 0, *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  if (*(_QWORD *)(a1 + 56))
    -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_82(uint64_t a1, void *a2, NSError *a3)
{
  NSError *RepresentationError;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSError *v9;
  char *v11;
  NSError *v12[2];

  RepresentationError = a3;
  v5 = 0;
  v12[1] = *(NSError **)MEMORY[0x1E0C80C00];
  v11 = 0;
  v12[0] = a3;
  if (a2 && !a3)
  {
    v6 = _NSIPCloneURLToTemporaryFolder(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, &v11, v12);
    if (v6)
      v7 = v12[0] == 0;
    else
      v7 = 0;
    if (v7)
    {
      v5 = v6;
    }
    else
    {
      v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "urlWrapper"), "url");
      v9 = _NSIPCannotCopyFileError(v8, 0, (uint64_t)v12[0]);
      v12[0] = v9;
      if (v9)
      {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)v9);
        v5 = 0;
        return (*(uint64_t (**)(_QWORD, void *, NSError *, char *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, RepresentationError, v11, objc_msgSend(*(id *)(a1 + 40), "cleanupHandler"));
      }
      v5 = 0;
    }
    RepresentationError = 0;
  }
  return (*(uint64_t (**)(_QWORD, void *, NSError *, char *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, RepresentationError, v11, objc_msgSend(*(id *)(a1 + 40), "cleanupHandler"));
}

- (id)loadFileCopyWithOptions:(id)a3 completionHandler:(id)a4
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__NSItemProviderRepresentation_loadFileCopyWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E0F52E90;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadFileCopyWithOptions_v2:completionHandler:](self, "loadFileCopyWithOptions_v2:completionHandler:", a3, v5);
}

uint64_t __74__NSItemProviderRepresentation_loadFileCopyWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), objc_msgSend(a2, "error"));
  return result;
}

- (id)loadOpenInPlaceWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke;
  v5[3] = &unk_1E0F53020;
  v5[4] = self;
  v5[5] = a4;
  return -[NSItemProviderRepresentation _loadWithOptions:completionBlock:](self, "_loadWithOptions:completionBlock:", a3, v5);
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *RepresentationError;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  NSError *v9;
  NSError *TemporaryFileError;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[9];
  char v15;
  _QWORD v16[8];
  NSError *v17[2];

  v17[1] = *(NSError **)MEMORY[0x1E0C80C00];
  RepresentationError = (NSError *)objc_msgSend(a2, "error");
  v5 = objc_msgSend(a2, "cleanupHandler");
  if (RepresentationError)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_19;
  }
  v17[0] = 0;
  if (objc_msgSend(a2, "data"))
  {
    v7 = _NSIPTemporaryFileName(*(const __CFString **)(*(_QWORD *)(a1 + 32) + 16), v17);
    if (!v7)
    {
      TemporaryFileError = _NSIPCannotCreateTemporaryFileError(0, (uint64_t)v17[0]);
      v9 = TemporaryFileError;
LABEL_14:
      v17[0] = TemporaryFileError;
      goto LABEL_15;
    }
    v8 = objc_msgSend((id)objc_msgSend(a2, "data"), "writeToURL:options:error:", v7, 1, v17);
    v9 = v17[0];
    if ((v8 & 1) != 0)
    {
LABEL_15:
      if (v9)
        RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (uint64_t)v9);
      else
        RepresentationError = 0;
      v6 = 0;
      goto LABEL_19;
    }
    TemporaryFileError = _NSIPCannotCopyFileError(0, 0, (uint64_t)v17[0]);
LABEL_13:
    v9 = TemporaryFileError;
    v7 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(a2, "urlWrapper"))
  {
    TemporaryFileError = _NSIPNoLoaderAvailableError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
    goto LABEL_13;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "isReadonly") & 1) != 0
    || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == 1)
  {
    v11 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_2;
    v16[3] = &unk_1E0F52FD0;
    v12 = *(_QWORD *)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v16[5] = a2;
    v16[6] = v12;
    v16[7] = v5;
    _NSIPCoordinatedRead(v11, (uint64_t)v16);
    return;
  }
  v7 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  RepresentationError = 0;
  v6 = 1;
LABEL_19:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_5;
  v14[3] = &unk_1E0F52FF8;
  v13 = *(_QWORD *)(a1 + 40);
  v14[4] = v7;
  v14[5] = a2;
  v14[6] = RepresentationError;
  v14[7] = v13;
  v15 = v6;
  v14[8] = v5;
  _NSIPDispatchAsyncCallback(v14);
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  BOOL v5;
  int v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[7];
  __int128 v11;
  NSError *v12;
  char *v13[2];

  v13[1] = *(char **)MEMORY[0x1E0C80C00];
  v13[0] = 0;
  if (a2 && !a3)
  {
    v12 = 0;
    v4 = _NSIPCloneURLToTemporaryFolder(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, v13, &v12);
    if (v4)
      v5 = v12 == 0;
    else
      v5 = 0;
    v6 = !v5;
    if (v5)
      v7 = v4;
    else
      v7 = 0;
    if (v6 == 1 && v12 == 0)
      v12 = _NSIPCannotCopyFileError(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "urlWrapper"), "url"), 0, 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_3;
    v10[3] = &unk_1E0F52EE0;
    v9 = *(_QWORD *)(a1 + 40);
    v10[4] = v7;
    v10[5] = v9;
    v10[6] = 0;
    v11 = *(_OWORD *)(a1 + 48);
    _NSIPDispatchAsyncCallback(v10);
  }
}

uint64_t __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSSecurityScopedURLWrapper *v3;
  _QWORD *v4;
  void *v5;
  uint64_t result;
  _QWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4;
      v7[3] = &unk_1E0F4D2D8;
      v7[4] = v2;
      v3 = -[NSSecurityScopedURLWrapper initWithURL:]([NSSecurityScopedURLWrapper alloc], "initWithURL:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C809B0], 3221225472, __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4, &unk_1E0F4D2D8, v2, v8);
      v4 = v7;
    }
    else
    {
      v4 = 0;
      v3 = 0;
    }
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyWithData:urlWrapper:cleanupHandler:error:", 0, v3, v4, *(_QWORD *)(a1 + 48));
    objc_msgSend(v5, "setWasOpenedInPlace:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

BOOL __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4(uint64_t a1)
{
  return -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);
}

NSProgress *__80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_5(uint64_t a1)
{
  NSSecurityScopedURLWrapper *v2;
  void *v3;
  NSProgress *result;

  if (*(_QWORD *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 32))
      v2 = -[NSSecurityScopedURLWrapper initWithURL:]([NSSecurityScopedURLWrapper alloc], "initWithURL:", *(_QWORD *)(a1 + 32));
    else
      v2 = 0;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyWithData:urlWrapper:cleanupHandler:error:", 0, v2, 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setWasOpenedInPlace:", *(unsigned __int8 *)(a1 + 72));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  result = *(NSProgress **)(a1 + 64);
  if (result)
    result = (NSProgress *)((uint64_t (*)(void))result->_values)();
  if (!*(_QWORD *)(a1 + 48) && !*(_BYTE *)(a1 + 72))
    return _NSIPCoordinatedDelete(*(_QWORD *)(a1 + 32), (uint64_t)&__block_literal_global_74);
  return result;
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
      -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", a2, 0);
  }
}

- (id)loadOpenInPlaceWithOptions:(id)a3 completionHandler:(id)a4
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_1E0F52E90;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadOpenInPlaceWithOptions_v2:completionHandler:](self, "loadOpenInPlaceWithOptions_v2:completionHandler:", a3, v5);
}

uint64_t __77__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), objc_msgSend(a2, "wasOpenedInPlace"), objc_msgSend(a2, "error"));
  return result;
}

- (void)setPreferredRepresentation:(int64_t)a3
{
  self->_preferredRepresentation = a3;
}

@end
