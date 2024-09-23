@implementation APEndpointManagerCarPlayDelegate

- (APEndpointManagerCarPlayDelegate)initWithEndpointManager:(OpaqueFigEndpointManager *)a3
{
  APEndpointManagerCarPlayDelegate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APEndpointManagerCarPlayDelegate;
  v3 = -[APEndpointManagerCarPlayDelegate init](&v5, sel_init);
  if (v3)
    v3->_weakManager = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
  return v3;
}

- (void)dealloc
{
  OpaqueFigCFWeakReferenceHolder *weakManager;
  objc_super v4;

  weakManager = self->_weakManager;
  if (weakManager)
    CFRelease(weakManager);
  v4.receiver = self;
  v4.super_class = (Class)APEndpointManagerCarPlayDelegate;
  -[APEndpointManagerCarPlayDelegate dealloc](&v4, sel_dealloc);
}

- (void)setEndpoint:(OpaqueFigEndpoint *)a3 isAllowed:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[6];
  BOOL v10;

  v6 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v6)
  {
    v7 = v6;
    v8 = *(NSObject **)(CMBaseObjectGetDerivedStorage() + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__APEndpointManagerCarPlayDelegate_setEndpoint_isAllowed___block_invoke;
    block[3] = &__block_descriptor_49_e5_v8__0l;
    block[4] = v7;
    block[5] = a3;
    v10 = a4;
    dispatch_sync(v8, block);
  }
}

void __58__APEndpointManagerCarPlayDelegate_setEndpoint_isAllowed___block_invoke(uint64_t a1)
{
  uint64_t BrowserContextForEndpoint;

  BrowserContextForEndpoint = carManager_getBrowserContextForEndpoint(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (BrowserContextForEndpoint)
    carManager_updateBrowserContext(*(const void **)(a1 + 32), BrowserContextForEndpoint, *(const void **)(a1 + 40), 0, 0, -1, -1, *(unsigned __int8 *)(a1 + 48) ^ 1);
}

- (void)setCarPlayEnabled:(BOOL)a3
{
  uint64_t v4;
  const void *v5;
  uint64_t DerivedStorage;
  NSObject *v7;
  _QWORD v8[7];
  BOOL v9;
  _QWORD v10[3];
  int v11;

  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    APSPowerAssertionRaise();
    CFRetain(v5);
    v7 = *(NSObject **)(DerivedStorage + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__APEndpointManagerCarPlayDelegate_setCarPlayEnabled___block_invoke;
    v8[3] = &unk_1E82699A8;
    v8[4] = v10;
    v8[5] = DerivedStorage;
    v9 = a3;
    v8[6] = v5;
    dispatch_async(v7, v8);
    _Block_object_dispose(v10, 8);
  }
}

void __54__APEndpointManagerCarPlayDelegate_setCarPlayEnabled___block_invoke(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 40))
  {
    APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -16712;
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = carManager_startDiscovery();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      APSLogErrorAt();
  }
  else
  {
    carManager_stopDiscovery();
  }
  APSPowerAssertionRelease();
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end
