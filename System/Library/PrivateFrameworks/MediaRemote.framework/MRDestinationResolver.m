@implementation MRDestinationResolver

+ (void)resolveDestination:(id)a3 timeout:(double)a4 completion:(id)a5
{
  objc_msgSend(a1, "resolveDestination:level:timeout:completion:", a3, 2, a5, a4);
}

+ (void)resolveDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v10 = a6;
  v11 = a3;
  +[MRDestinationResolverDependencies defaultDependencies](MRDestinationResolverDependencies, "defaultDependencies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__MRDestinationResolver_resolveDestination_level_timeout_completion___block_invoke;
  v14[3] = &unk_1E30C9C28;
  v15 = v10;
  v13 = v10;
  objc_msgSend(a1, "resolvePartialDestination:level:timeout:dependencies:completion:", v11, a4, v12, v14, a5);

}

uint64_t __69__MRDestinationResolver_resolveDestination_level_timeout_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a3)
      a2 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

+ (void)resolvePartialDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a3;
  +[MRDestinationResolverDependencies defaultDependencies](MRDestinationResolverDependencies, "defaultDependencies");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolvePartialDestination:level:timeout:dependencies:completion:", v11, a4, v12, v10, a5);

}

+ (void)resolvePartialDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 dependencies:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  MRBlockGuard *v18;
  id v19;
  MRBlockGuard *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  MRBlockGuard *v26;
  id v27;
  int64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  MRDestinationResolver *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  MRDestinationResolverHelper *v47;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__16;
  v46 = __Block_byref_object_dispose__16;
  v47 = objc_alloc_init(MRDestinationResolverHelper);
  objc_msgSend((id)v43[5], "setLevel:", a4);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__16;
  v40 = __Block_byref_object_dispose__16;
  v41 = -[MRDestinationResolver initWithDestination:label:dependencies:]([MRDestinationResolver alloc], "initWithDestination:label:dependencies:", v11, CFSTR("resolvePartialDestination"), v12);
  objc_msgSend((id)v37[5], "setDelegate:", v43[5]);
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke;
  v31[3] = &unk_1E30C9C50;
  v15 = v11;
  v32 = v15;
  v16 = v13;
  v33 = v16;
  v34 = &v36;
  v35 = &v42;
  v17 = (void *)MEMORY[0x194036C44](v31);
  v18 = [MRBlockGuard alloc];
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_2;
  v29[3] = &unk_1E30C6798;
  v19 = v17;
  v30 = v19;
  v22 = v14;
  v23 = 3221225472;
  v24 = __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_3;
  v25 = &unk_1E30C9C78;
  v28 = a4;
  v20 = -[MRBlockGuard initWithTimeout:reason:handler:](v18, "initWithTimeout:reason:handler:", CFSTR("MRDestinationResolver"), v29, a5);
  v26 = v20;
  v21 = v19;
  v27 = v21;
  objc_msgSend((id)v43[5], "setCallback:", &v22);
  objc_msgSend((id)v37[5], "beginResolving", v22, v23, v24, v25);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

}

void __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a3;
  v14 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v14, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v14, "setClient:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClient:", v7);

  }
  objc_msgSend(v14, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v14, "setPlayer:", v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlayer:", v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCallback:", 0);
}

uint64_t __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == 2)
  {
    objc_msgSend(v11, "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_12;
    v6 = *(_QWORD *)(a1 + 48);
  }
  if (v6 == 1)
  {
    objc_msgSend(v11, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_12;
    v6 = *(_QWORD *)(a1 + 48);
  }
  if (!v6)
  {
    objc_msgSend(v11, "origin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_12:
      if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
      {
        v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_14;
      }
      goto LABEL_15;
    }
  }
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_14:
    v9();
  }
LABEL_15:

}

- (MRDestinationResolver)initWithDestination:(id)a3 label:(id)a4 dependencies:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRDestinationResolver *v11;
  MRDestinationResolver *v12;
  uint64_t v13;
  MRDestination *originalDestination;
  uint64_t v15;
  MRDestination *destination;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *serialQueue;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *delegateQueue;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MRDestinationResolver;
  v11 = -[MRDestinationResolver init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dependencies, a5);
    objc_storeStrong((id *)&v12->_label, a4);
    if (v8)
    {
      v13 = objc_msgSend(v8, "copy");
    }
    else
    {
      +[MRDestination localDestination](MRDestination, "localDestination");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    originalDestination = v12->_originalDestination;
    v12->_originalDestination = (MRDestination *)v13;

    v15 = -[MRDestination copy](v12->_originalDestination, "copy");
    destination = v12->_destination;
    v12->_destination = (MRDestination *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.mediaremote.MRDestinationResolver-serial", v17);
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.mediaremote.MRDestinationResolver-delegate", v20);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v21;

  }
  return v12;
}

- (MRDestinationResolver)initWithDestination:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MRDestinationResolver *v9;

  v6 = a4;
  v7 = a3;
  +[MRDestinationResolverDependencies defaultDependencies](MRDestinationResolverDependencies, "defaultDependencies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MRDestinationResolver initWithDestination:label:dependencies:](self, "initWithDestination:label:dependencies:", v7, v6, v8);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MRDestinationResolver unregisterForPlayerPathInvalidations](self, "unregisterForPlayerPathInvalidations");
  v3.receiver = self;
  v3.super_class = (Class)MRDestinationResolver;
  -[MRDestinationResolver dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRDestinationResolver label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver originalDestination](self, "originalDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p %@ : %@->%@"), v4, self, v5, v6, v7);

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = objc_opt_class();
  -[MRDestinationResolver label](self, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver originalDestination](self, "originalDestination");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver destination](self, "destination");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver endpointObserver](self, "endpointObserver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRDestinationResolver resolving](self, "resolving"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[MSVVariableIntervalTimer remainingIntervals](self->_reconRetryTimer, "remainingIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVVariableIntervalTimer remainingIntervals](self->_connectionRetryTimer, "remainingIntervals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("<%@ %p %@ {\n   originalDestination = %@\n   resolvedDestination = %@\n   endpointObserver = %@\n   playerPathInvalidationHandler = %@\n   resolving = %@\n   reconRetryTimer = %@\n   connectionRetryTimer = %@\n}\n"), v16, self, v14, v13, v3, v4, v5, v6, v8, v10);

  return v11;
}

- (void)beginResolving
{
  NSObject *v3;
  _QWORD block[5];

  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MRDestinationResolver_beginResolving__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __39__MRDestinationResolver_beginResolving__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "resolving");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResolving:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "resolve");
  }
  return result;
}

- (MRDestination)destination
{
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_sync_on_queue();

  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (MRDestination *)v3;
}

void __36__MRDestinationResolver_destination__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)onQueue_setEndpoint:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[MRDestination endpoint](self->_destination, "endpoint");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[MRDestination setEndpoint:](self->_destination, "setEndpoint:", v6);
    objc_msgSend(v6, "origin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDestinationResolver onQueue_setOrigin:](self, "onQueue_setOrigin:", v5);

  }
  -[MRDestinationResolver notifyDelegateOfEndpointChange:](self, "notifyDelegateOfEndpointChange:", v6);

}

- (void)onQueue_setOrigin:(id)a3
{
  id v4;
  char v5;
  id v6;
  MRDestination *destination;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[MRDestination origin](self->_destination, "origin");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v12)
  {

LABEL_7:
    v6 = v12;
    goto LABEL_8;
  }
  v5 = objc_msgSend(v12, "isEqual:", v4);

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    destination = self->_destination;
    if (v12)
    {
      -[MRDestination setOrigin:](destination, "setOrigin:", v12);
      -[MRDestinationResolver originalDestination](self, "originalDestination");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDestination setClient:](self->_destination, "setClient:", v9);

      -[MRDestinationResolver originalDestination](self, "originalDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDestination setPlayer:](self->_destination, "setPlayer:", v11);

    }
    else
    {
      -[MRDestination setPlayerPath:](destination, "setPlayerPath:", 0);
    }
    goto LABEL_7;
  }
LABEL_8:
  -[MRDestinationResolver notifyDelegateOfOriginChange:](self, "notifyDelegateOfOriginChange:", v6);

}

- (void)onQueue_setUnresolvedPlayerPath:(id)a3
{
  id v4;
  char v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[MRDestination playerPath](self->_destination, "playerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {

  }
  else
  {
    v5 = objc_msgSend(v6, "isEqual:", v4);

    if ((v5 & 1) == 0)
      -[MRDestination setPlayerPath:](self->_destination, "setPlayerPath:", v6);
  }

}

- (void)onQueue_setResolvedPlayerPath:(id)a3
{
  id v4;
  char v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[MRDestination playerPath](self->_destination, "playerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {

  }
  else
  {
    v5 = objc_msgSend(v6, "isEqual:", v4);

    if ((v5 & 1) == 0)
      -[MRDestination setPlayerPath:](self->_destination, "setPlayerPath:", v6);
  }
  -[MRDestinationResolver notifyDelegateOfPlayerPathChange:](self, "notifyDelegateOfPlayerPathChange:", v6);

}

- (MRAVEndpointObserver)endpointObserver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MRAVEndpointObserver *v8;
  MRAVEndpointObserver *endpointObserver;

  if (!self->_endpointObserver)
  {
    -[MRDestinationResolver destination](self, "destination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "outputDeviceUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[MRDestinationResolver dependencies](self, "dependencies");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDestinationResolver destination](self, "destination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "outputDeviceUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createEndpointObserverWithUID:", v7);
      v8 = (MRAVEndpointObserver *)objc_claimAutoreleasedReturnValue();
      endpointObserver = self->_endpointObserver;
      self->_endpointObserver = v8;

    }
  }
  return self->_endpointObserver;
}

- (void)resolve
{
  NSObject *v3;
  _QWORD block[5];

  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MRDestinationResolver_resolve__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __32__MRDestinationResolver_resolve__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "resolving"))
  {
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v2, "playerPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isResolved");

    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v2, "playerPath");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resolveForResolvedPlayerPath:", v6);
LABEL_4:

LABEL_13:
      return;
    }
    objc_msgSend(v2, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v2, "endpoint");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "originalDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "originalDestination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resolveForEndpoint:client:player:", v9, v11, v13);
    }
    else
    {
      objc_msgSend(v2, "outputContextUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v2, "outputContextUID");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "originalDestination");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "client");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "originalDestination");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "player");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "resolveForOutputContextUID:client:player:", v9, v11, v13);
      }
      else
      {
        objc_msgSend(v2, "outputDeviceUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(v2, "playerPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "originalDestination");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "playerPath");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              v24 = *(void **)(a1 + 32);
              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 6);
              objc_msgSend(v24, "notifyDelegateOfError:", v25);

              _MRLogForCategory(0);
              v6 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
              {
                v26 = *(_QWORD *)(a1 + 32);
                v27 = 138412802;
                v28 = v26;
                v29 = 2112;
                v30 = v26;
                v31 = 2112;
                v32 = v2;
                _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "%@ <%@> Unable to resolve destination %@", (uint8_t *)&v27, 0x20u);
              }
              goto LABEL_4;
            }
          }
          objc_msgSend(v2, "playerPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v9 = v21;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "originalDestination");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "playerPath");
            v9 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(*(id *)(a1 + 32), "resolveForUnresolvedPlayerPath:", v9);
LABEL_12:

          goto LABEL_13;
        }
        v17 = *(void **)(a1 + 32);
        objc_msgSend(v2, "outputDeviceUID");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "originalDestination");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "client");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "originalDestination");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "player");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resolveForOutputDeviceUID:client:player:", v9, v11, v13);
      }
    }

    goto LABEL_12;
  }
}

- (void)resolveForResolvedPlayerPath:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  MRDestinationResolver *v8;
  __int16 v9;
  MRDestinationResolver *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  _MRLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = self;
    v9 = 2112;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "%@ <%@> Resolved playerPath: %@.", (uint8_t *)&v7, 0x20u);
  }

  -[MRDestinationResolver onQueue_setResolvedPlayerPath:](self, "onQueue_setResolvedPlayerPath:", v4);
}

- (void)resolveForUnresolvedPlayerPath:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  MRDestinationResolver *v12;
  __int16 v13;
  MRDestinationResolver *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  _MRLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for unresolvedPlayerPath=%@", buf, 0x20u);
  }

  objc_storeStrong((id *)&self->_resolvingPlayerPath, a3);
  -[MRDestinationResolver onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:](self, "onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:", v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MRDestinationResolver_resolveForUnresolvedPlayerPath___block_invoke;
  v9[3] = &unk_1E30C9CA0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[MRDestinationResolver resolvePlayerPath:completion:](self, "resolvePlayerPath:completion:", v8, v9);

}

void __56__MRDestinationResolver_resolveForUnresolvedPlayerPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *Error;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v16 = 138412802;
      v17 = v10;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_INFO, "%@ <%@> PlayerPath has changed since we requested to resolve it. Ignoring incoming playerPath: %@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_15;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 128);
  *(_QWORD *)(v7 + 128) = 0;

  if (!-[NSObject isResolved](v5, "isResolved"))
  {
    if (v6)
      Error = v6;
    else
      Error = MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    v9 = Error;
    _MRLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "%@ <%@> Error resolving for unresolvedPlayerPath %@", (uint8_t *)&v16, 0x20u);
    }

    v14 = -[NSObject code](v9, "code");
    v15 = *(void **)(a1 + 32);
    if (v14 == 5)
    {
      objc_msgSend(v15, "unregisterForPlayerPathInvalidations");
      objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForPlayerPath");
    }
    else
    {
      objc_msgSend(v15, "onQueue_setUnresolvedPlayerPath:", v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setUnresolvedPlayerPath:", v5);
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfError:", v9);
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "resolveForResolvedPlayerPath:", v5);
LABEL_16:

}

- (void)resolveForEndpoint:(id)a3 client:(id)a4 player:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  MRDestinationResolver *v19;
  __int16 v20;
  MRDestinationResolver *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a4;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  _MRLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "debugName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = self;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for endpoint=%@", buf, 0x20u);

  }
  objc_storeStrong((id *)&self->_resolvingEndpoint, a3);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke;
  v16[3] = &unk_1E30C9CA0;
  v16[4] = self;
  v17 = v9;
  v15 = v9;
  -[MRDestinationResolver createPlayerPathForEndpoint:client:player:completion:](self, "createPlayerPathForEndpoint:client:player:completion:", v15, v11, v10, v16);

}

void __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id location;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 120);
    *(_QWORD *)(v7 + 120) = 0;

    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "debugName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v41 = v10;
      v42 = 2112;
      v43 = v10;
      v44 = 2112;
      v45 = v5;
      v46 = 2112;
      v47 = v11;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "%@ <%@> Setting unresolved playerPath to: %@ for endpoint=%@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v12);

    objc_msgSend(v5, "origin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 144);
      *(_QWORD *)(v14 + 144) = 0;

      v16 = *(void **)(a1 + 32);
      objc_msgSend(v5, "origin");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "onQueue_setOrigin:", v17);

      objc_msgSend(*(id *)(a1 + 32), "onQueue_registerForEndpointInvalidations:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "resolveForUnresolvedPlayerPath:", v5);
    }
    else
    {
      if (v6)
        v20 = v6;
      else
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 5);
      v21 = v20;
      v22 = *(_QWORD **)(a1 + 32);
      if (v22[18])
      {
        _MRLogForCategory(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(v24 + 144), "timeUntilNextInterval");
          *(_DWORD *)buf = 138412802;
          v41 = v24;
          v42 = 2112;
          v43 = v24;
          v44 = 2048;
          v45 = v25;
          _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "%@ <%@> ConnectionRetryTimer is already scheduled to retry in %lf more seconds", buf, 0x20u);
        }

      }
      else
      {
        objc_initWeak(&location, v22);
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlayingController.connectionRetryTimer<%p>"), *(_QWORD *)(a1 + 32));
        v26 = objc_alloc(MEMORY[0x1E0D4D118]);
        +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "destinationResolverReconRetryIntervals");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke_33;
        v37[3] = &unk_1E30C6A78;
        objc_copyWeak(&v38, &location);
        v37[4] = *(_QWORD *)(a1 + 32);
        v30 = objc_msgSend(v26, "initWithIntervals:name:queue:block:", v28, v36, v29, v37);
        v31 = *(_QWORD *)(a1 + 32);
        v32 = *(void **)(v31 + 144);
        *(_QWORD *)(v31 + 144) = v30;

        _MRLogForCategory(0);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(v34 + 144), "timeUntilNextInterval");
          *(_DWORD *)buf = 138412802;
          v41 = v34;
          v42 = 2112;
          v43 = v34;
          v44 = 2048;
          v45 = v35;
          _os_log_impl(&dword_193827000, v33, OS_LOG_TYPE_DEFAULT, "%@ <%@> Starting ConnectionRetryTimer to fire in %lf seconds", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfError:", v21);
        objc_destroyWeak(&v38);

        objc_destroyWeak(&location);
      }

    }
  }
  else
  {
    _MRLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v41 = v19;
      v42 = 2112;
      v43 = v19;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_INFO, "%@ <%@> Resolved endpoint has changed since we requested a playerPath for it. Ignoring incoming playerPath: %@", buf, 0x20u);
    }

  }
}

void __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke_33(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained[18], "currentInterval");
      v6 = 138412802;
      v7 = v4;
      v8 = 2112;
      v9 = WeakRetained;
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "%@ <%@> ConnectionRetryTimer fired after %lf total seconds", (uint8_t *)&v6, 0x20u);
    }

    objc_msgSend(WeakRetained, "resolve");
  }

}

- (void)resolveForOutputContextUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  MRDestinationResolver *v22;
  __int16 v23;
  MRDestinationResolver *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outputContextUID=%@"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v22 = self;
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for %@", buf, 0x20u);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__MRDestinationResolver_resolveForOutputContextUID_client_player___block_invoke;
  v17[3] = &unk_1E30C9CC8;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v9;
  -[MRDestinationResolver onQueue_retrieveEndpointForContextUID:completion:](self, "onQueue_retrieveEndpointForContextUID:completion:", v8, v17);

}

uint64_t __66__MRDestinationResolver_resolveForOutputContextUID_client_player___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEndpointResolution:client:player:source:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a3);
}

- (void)resolveForOutputDeviceUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  MRDestinationResolver *v22;
  __int16 v23;
  MRDestinationResolver *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outputDeviceUID=%@"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v22 = self;
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for %@", buf, 0x20u);
  }

  -[MRDestinationResolver registerForEndpointChangesForOutputDeviceUID:](self, "registerForEndpointChangesForOutputDeviceUID:", v8);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__MRDestinationResolver_resolveForOutputDeviceUID_client_player___block_invoke;
  v17[3] = &unk_1E30C9CC8;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v9;
  -[MRDestinationResolver onQueue_retrieveEndpointForUID:completion:](self, "onQueue_retrieveEndpointForUID:completion:", v8, v17);

}

uint64_t __65__MRDestinationResolver_resolveForOutputDeviceUID_client_player___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEndpointResolution:client:player:source:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a3);
}

- (void)handleEndpointResolution:(id)a3 client:(id)a4 player:(id)a5 source:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  MSVVariableIntervalTimer *v20;
  id v21;
  void *v22;
  void *v23;
  OS_dispatch_queue *serialQueue;
  MSVVariableIntervalTimer *v25;
  MSVVariableIntervalTimer *reconRetryTimer;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id location;
  uint8_t buf[4];
  MRDestinationResolver *v34;
  __int16 v35;
  MRDestinationResolver *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    _MRLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MRDestinationResolver handleEndpointResolution:client:player:source:error:].cold.1((uint64_t)self, (uint64_t)v16, v17);

    if (self->_reconRetryTimer)
    {
      _MRLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[MSVVariableIntervalTimer timeUntilNextInterval](self->_reconRetryTimer, "timeUntilNextInterval");
        *(_DWORD *)buf = 138412802;
        v34 = self;
        v35 = 2112;
        v36 = self;
        v37 = 2048;
        v38 = v19;
        _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "%@ <%@> ReconRetryTimer is already scheduled to retry in %lf more seconds", buf, 0x20u);
      }

    }
    else
    {
      objc_initWeak(&location, self);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlayingController.reconRetryTimer<%p>"), self);
      v21 = objc_alloc(MEMORY[0x1E0D4D118]);
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "destinationResolverReconRetryIntervals");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      serialQueue = self->_serialQueue;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __77__MRDestinationResolver_handleEndpointResolution_client_player_source_error___block_invoke;
      v30[3] = &unk_1E30C6A78;
      objc_copyWeak(&v31, &location);
      v30[4] = self;
      v25 = (MSVVariableIntervalTimer *)objc_msgSend(v21, "initWithIntervals:name:queue:block:", v23, v29, serialQueue, v30);
      reconRetryTimer = self->_reconRetryTimer;
      self->_reconRetryTimer = v25;

      _MRLogForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[MSVVariableIntervalTimer timeUntilNextInterval](self->_reconRetryTimer, "timeUntilNextInterval");
        *(_DWORD *)buf = 138412802;
        v34 = self;
        v35 = 2112;
        v36 = self;
        v37 = 2048;
        v38 = v28;
        _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "%@ <%@> Starting ReconRetryTimer to fire in %lf seconds", buf, 0x20u);
      }

      -[MRDestinationResolver notifyDelegateOfError:](self, "notifyDelegateOfError:", v16);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    v20 = self->_reconRetryTimer;
    self->_reconRetryTimer = 0;

    -[MRDestinationResolver resolveForEndpoint:client:player:](self, "resolveForEndpoint:client:player:", v12, v13, v14);
  }

}

void __77__MRDestinationResolver_handleEndpointResolution_client_player_source_error___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained[17], "currentInterval");
      v6 = 138412802;
      v7 = v4;
      v8 = 2112;
      v9 = WeakRetained;
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "%@ <%@> ReconRetryTimer fired after %lf total seconds", (uint8_t *)&v6, 0x20u);
    }

    objc_msgSend(WeakRetained, "resolve");
  }

}

- (void)registerForEndpointChangesForOutputDeviceUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;

  v4 = a3;
  if (!-[MRDestinationResolver registeredForEndpointChanges](self, "registeredForEndpointChanges"))
  {
    if (-[MRDestinationResolver isDynamicEndpoint](self, "isDynamicEndpoint"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleActiveSystemEndpointChangedNotification_, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);

    }
    else
    {
      objc_initWeak(&location, self);
      v8 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v9, &location);
      -[MRDestinationResolver endpointObserver](self, "endpointObserver", v8, 3221225472, __70__MRDestinationResolver_registerForEndpointChangesForOutputDeviceUID___block_invoke, &unk_1E30C7D38);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEndpointChangedCallback:", &v8);

      -[MRDestinationResolver endpointObserver](self, "endpointObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "begin");

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    -[MRDestinationResolver setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 1);
  }

}

void __70__MRDestinationResolver_registerForEndpointChangesForOutputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = a2;
    objc_msgSend(WeakRetained, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      _MRLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "destination");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endpoint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138413058;
        v17 = WeakRetained;
        v18 = 2112;
        v19 = WeakRetained;
        v20 = 2112;
        v21 = v12;
        v22 = 2112;
        v23 = v4;
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "%@ <%@> endpoint changed from %@ to %@", (uint8_t *)&v16, 0x2Au);

      }
      objc_msgSend(v4, "outputDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "groupID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setEndpointObserverGroupUID:", v15);

      objc_msgSend(WeakRetained, "handleEndpointChanged");
    }

  }
}

- (void)unregisterForEndpointChanges
{
  void *v3;

  if (-[MRDestinationResolver isDynamicEndpoint](self, "isDynamicEndpoint"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);
  }
  else
  {
    -[MRDestinationResolver endpointObserver](self, "endpointObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
  }

  -[MRDestinationResolver setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 0);
}

- (void)onQueue_registerForEndpointInvalidations:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!-[MRDestinationResolver registeredForEndpointInvalidations](self, "registeredForEndpointInvalidations"))
  {
    -[MRDestinationResolver onQueue_setEndpoint:](self, "onQueue_setEndpoint:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleEndpointDidDisconnectNotification_, CFSTR("MRAVEndpointDidDisconnectNotification"), v5);

    -[MRDestinationResolver setRegisteredForEndpointInvalidations:](self, "setRegisteredForEndpointInvalidations:", 1);
  }

}

- (void)unregisterForEndpointInvalidations
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MRAVEndpointDidDisconnectNotification"), v5);

  -[MRDestinationResolver setRegisteredForEndpointInvalidations:](self, "setRegisteredForEndpointInvalidations:", 0);
}

- (void)onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!-[MRDestinationResolver registeredForPlayerPathInvalidations](self, "registeredForPlayerPathInvalidations"))
  {
    -[MRDestinationResolver onQueue_setUnresolvedPlayerPath:](self, "onQueue_setUnresolvedPlayerPath:", v4);
    objc_initWeak(&location, self);
    -[MRDestinationResolver dependencies](self, "dependencies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDestination playerPath](self->_destination, "playerPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDestinationResolver serialQueue](self, "serialQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __91__MRDestinationResolver_onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke;
    v12 = &unk_1E30C9CF0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "addPlayerPathInvalidationHandler:queue:handler:", v6, v7, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDestinationResolver setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", v8, v9, v10, v11, v12);

    -[MRDestinationResolver setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 1);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __91__MRDestinationResolver_onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id *v8;
  __int16 v9;
  id *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained[2], "playerPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138413058;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "%@ <%@> playerPath invalidated %@ -> %@", (uint8_t *)&v7, 0x2Au);

    }
    objc_msgSend(WeakRetained, "handlePlayerPathInvalidatedWithPlayerPath:", v3);
  }

}

- (void)unregisterForPlayerPathInvalidations
{
  void *v3;
  void *v4;
  void *v5;

  -[MRDestinationResolver playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRDestinationResolver dependencies](self, "dependencies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDestinationResolver playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removePlayerPathInvalidationHandler:", v5);

    -[MRDestinationResolver setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", 0);
  }
  -[MRDestinationResolver setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 0);
}

- (void)handleEndpointChanged
{
  void *v2;

  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_async_on_queue();

}

uint64_t __46__MRDestinationResolver_handleEndpointChanged__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForOutputDeviceUID");
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfInvalidation");
  return objc_msgSend(*(id *)(a1 + 32), "resolve");
}

- (void)handleEndpointInvalidated
{
  void *v2;

  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_async_on_queue();

}

uint64_t __50__MRDestinationResolver_handleEndpointInvalidated__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForEndpoint");
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfInvalidation");
  return objc_msgSend(*(id *)(a1 + 32), "resolve");
}

- (void)handlePlayerPathInvalidatedWithPlayerPath:(id)a3
{
  void *v3;

  -[MRDestinationResolver serialQueue](self, "serialQueue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_async_on_queue();

}

uint64_t __67__MRDestinationResolver_handlePlayerPathInvalidatedWithPlayerPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForPlayerPath");
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfInvalidation");
  return objc_msgSend(*(id *)(a1 + 32), "resolve");
}

- (void)handleActiveSystemEndpointChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  MRDestinationResolver *v9;
  __int16 v10;
  MRDestinationResolver *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteActiveEndpointTypeUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (-[MRDestinationResolver isProactiveEndpoint](self, "isProactiveEndpoint") && v6 == 1
    || -[MRDestinationResolver isUserSelectedEndpoint](self, "isUserSelectedEndpoint") && !v6)
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "%@ <%@> Active system endpoint changed", (uint8_t *)&v8, 0x16u);
    }

    -[MRDestinationResolver handleEndpointChanged](self, "handleEndpointChanged");
  }
}

- (void)_handleEndpointDidDisconnectNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver endpointDidDisconnect:](self, "endpointDidDisconnect:", v4);

}

- (void)endpointDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  MRDestinationResolver *v10;
  __int16 v11;
  MRDestinationResolver *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRDestinationResolver destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "%@ <%@> endpoint invalidated %@", (uint8_t *)&v9, 0x20u);
    }

    -[MRDestinationResolver handleEndpointInvalidated](self, "handleEndpointInvalidated");
  }

}

- (void)notifyDelegateOfEndpointChange:(id)a3
{
  MRAVEndpoint *v4;
  void *v5;
  char v6;
  NSObject *v7;
  MRAVEndpoint *delegateEndpoint;
  _QWORD v9[5];
  MRAVEndpoint *v10;

  v4 = (MRAVEndpoint *)a3;
  if (self->_delegateEndpoint != v4)
  {
    -[MRDestinationResolver delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[MRDestinationResolver delegateQueue](self, "delegateQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __56__MRDestinationResolver_notifyDelegateOfEndpointChange___block_invoke;
      v9[3] = &unk_1E30C5F40;
      v9[4] = self;
      v10 = v4;
      dispatch_async(v7, v9);

    }
  }
  delegateEndpoint = self->_delegateEndpoint;
  self->_delegateEndpoint = v4;

}

void __56__MRDestinationResolver_notifyDelegateOfEndpointChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationResolver:endpointDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notifyDelegateOfOriginChange:(id)a3
{
  MROrigin *v4;
  MROrigin *v5;
  MROrigin *v6;
  BOOL v7;
  void *v8;
  char v9;
  NSObject *v10;
  MROrigin *delegateOrigin;
  _QWORD v12[5];
  MROrigin *v13;

  v4 = (MROrigin *)a3;
  v5 = self->_delegateOrigin;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[MROrigin isEqual:](v4, "isEqual:", v5);

    if (!v7)
    {
      -[MRDestinationResolver delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[MRDestinationResolver delegateQueue](self, "delegateQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __54__MRDestinationResolver_notifyDelegateOfOriginChange___block_invoke;
        v12[3] = &unk_1E30C5F40;
        v12[4] = self;
        v13 = v4;
        dispatch_async(v10, v12);

      }
    }
  }
  delegateOrigin = self->_delegateOrigin;
  self->_delegateOrigin = v4;

}

void __54__MRDestinationResolver_notifyDelegateOfOriginChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationResolver:originDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notifyDelegateOfPlayerPathChange:(id)a3
{
  MRPlayerPath *v4;
  MRPlayerPath *v5;
  MRPlayerPath *v6;
  BOOL v7;
  void *v8;
  char v9;
  NSObject *v10;
  MRPlayerPath *delegatePlayerPath;
  _QWORD v12[5];
  MRPlayerPath *v13;

  v4 = (MRPlayerPath *)a3;
  v5 = self->_delegatePlayerPath;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[MRPlayerPath isEqual:](v4, "isEqual:", v5);

    if (!v7)
    {
      -[MRDestinationResolver delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[MRDestinationResolver delegateQueue](self, "delegateQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __58__MRDestinationResolver_notifyDelegateOfPlayerPathChange___block_invoke;
        v12[3] = &unk_1E30C5F40;
        v12[4] = self;
        v13 = v4;
        dispatch_async(v10, v12);

      }
    }
  }
  delegatePlayerPath = self->_delegatePlayerPath;
  self->_delegatePlayerPath = v4;

}

void __58__MRDestinationResolver_notifyDelegateOfPlayerPathChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationResolver:playerPathDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notifyDelegateOfInvalidation
{
  void *v3;
  char v4;
  NSObject *v5;
  _QWORD block[5];

  -[MRDestinationResolver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MRDestinationResolver delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MRDestinationResolver_notifyDelegateOfInvalidation__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __53__MRDestinationResolver_notifyDelegateOfInvalidation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationResolverDestinationDidInvalidate:", *(_QWORD *)(a1 + 32));

}

- (void)notifyDelegateOfError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MRDestinationResolver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MRDestinationResolver delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__MRDestinationResolver_notifyDelegateOfError___block_invoke;
    v8[3] = &unk_1E30C5F40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

void __47__MRDestinationResolver_notifyDelegateOfError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationResolver:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)onQueue_clearStateForOutputDeviceUID
{
  NSObject *v3;
  MSVVariableIntervalTimer *reconRetryTimer;

  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  reconRetryTimer = self->_reconRetryTimer;
  self->_reconRetryTimer = 0;

  -[MRDestinationResolver unregisterForEndpointChanges](self, "unregisterForEndpointChanges");
  -[MRDestinationResolver onQueue_clearStateForEndpoint](self, "onQueue_clearStateForEndpoint");
}

- (void)onQueue_clearStateForEndpoint
{
  NSObject *v3;
  MRAVEndpoint *resolvingEndpoint;
  MSVVariableIntervalTimer *connectionRetryTimer;

  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  resolvingEndpoint = self->_resolvingEndpoint;
  self->_resolvingEndpoint = 0;

  connectionRetryTimer = self->_connectionRetryTimer;
  self->_connectionRetryTimer = 0;

  -[MRDestinationResolver unregisterForEndpointInvalidations](self, "unregisterForEndpointInvalidations");
  -[MRDestinationResolver unregisterForPlayerPathInvalidations](self, "unregisterForPlayerPathInvalidations");
  -[MRDestinationResolver onQueue_setEndpoint:](self, "onQueue_setEndpoint:", 0);
  -[MRDestinationResolver onQueue_clearStateForPlayerPath](self, "onQueue_clearStateForPlayerPath");
}

- (void)onQueue_clearStateForPlayerPath
{
  NSObject *v3;
  MRPlayerPath *resolvingPlayerPath;

  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  resolvingPlayerPath = self->_resolvingPlayerPath;
  self->_resolvingPlayerPath = 0;

  -[MRDestinationResolver onQueue_setResolvedPlayerPath:](self, "onQueue_setResolvedPlayerPath:", 0);
}

- (void)createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MRDestinationResolver dependencies](self, "dependencies");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createPlayerPathForEndpoint:client:player:queue:completion:", v13, v12, v11, v14, v10);

}

- (void)resolvePlayerPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[MRDestinationResolver dependencies](self, "dependencies");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvePlayerPath:queue:completion:", v7, v8, v6);

}

- (void)onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[MRDestinationResolver dependencies](self, "dependencies");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver endpointObserverGroupUID](self, "endpointObserverGroupUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "retrieveEndpointForUID:endpointGroupUID:queue:completion:", v7, v9, v10, v6);

}

- (void)onQueue_retrieveEndpointForContextUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[MRDestinationResolver dependencies](self, "dependencies");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MRDestinationResolver serialQueue](self, "serialQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "retrieveEndpointForContextUID:queue:completion:", v7, v9, v6);

}

- (BOOL)isProactiveEndpoint
{
  void *v2;
  void *v3;
  char v4;

  -[MRDestinationResolver destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("proactiveEndpoint"));

  return v4;
}

- (BOOL)isUserSelectedEndpoint
{
  void *v2;
  void *v3;
  char v4;

  -[MRDestinationResolver destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("userSelectedEndpoint"));

  return v4;
}

- (BOOL)isDynamicEndpoint
{
  return -[MRDestinationResolver isProactiveEndpoint](self, "isProactiveEndpoint")
      || -[MRDestinationResolver isUserSelectedEndpoint](self, "isUserSelectedEndpoint");
}

- (MRDestinationResolverDelegate)delegate
{
  return (MRDestinationResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)label
{
  return self->_label;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (MRDestinationResolverDependencies)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_dependencies, a3);
}

- (BOOL)resolving
{
  return self->_resolving;
}

- (void)setResolving:(BOOL)a3
{
  self->_resolving = a3;
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  self->_registeredForNotifications = a3;
}

- (BOOL)registeredForEndpointChanges
{
  return self->_registeredForEndpointChanges;
}

- (void)setRegisteredForEndpointChanges:(BOOL)a3
{
  self->_registeredForEndpointChanges = a3;
}

- (BOOL)registeredForEndpointInvalidations
{
  return self->_registeredForEndpointInvalidations;
}

- (void)setRegisteredForEndpointInvalidations:(BOOL)a3
{
  self->_registeredForEndpointInvalidations = a3;
}

- (BOOL)registeredForPlayerPathInvalidations
{
  return self->_registeredForPlayerPathInvalidations;
}

- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3
{
  self->_registeredForPlayerPathInvalidations = a3;
}

- (id)playerPathInvalidationObserver
{
  return self->_playerPathInvalidationObserver;
}

- (void)setPlayerPathInvalidationObserver:(id)a3
{
  objc_storeStrong(&self->_playerPathInvalidationObserver, a3);
}

- (void)setEndpointObserver:(id)a3
{
  objc_storeStrong((id *)&self->_endpointObserver, a3);
}

- (NSString)endpointObserverGroupUID
{
  return self->_endpointObserverGroupUID;
}

- (void)setEndpointObserverGroupUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, a3);
}

- (MRDestination)originalDestination
{
  return self->_originalDestination;
}

- (void)setOriginalDestination:(id)a3
{
  objc_storeStrong((id *)&self->_originalDestination, a3);
}

- (MRAVEndpoint)delegateEndpoint
{
  return self->_delegateEndpoint;
}

- (void)setDelegateEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_delegateEndpoint, a3);
}

- (MROrigin)delegateOrigin
{
  return self->_delegateOrigin;
}

- (void)setDelegateOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_delegateOrigin, a3);
}

- (MRPlayerPath)delegatePlayerPath
{
  return self->_delegatePlayerPath;
}

- (void)setDelegatePlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_delegatePlayerPath, a3);
}

- (MRAVEndpoint)resolvingEndpoint
{
  return self->_resolvingEndpoint;
}

- (void)setResolvingEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_resolvingEndpoint, a3);
}

- (MRPlayerPath)resolvingPlayerPath
{
  return self->_resolvingPlayerPath;
}

- (void)setResolvingPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_resolvingPlayerPath, a3);
}

- (MSVVariableIntervalTimer)reconRetryTimer
{
  return self->_reconRetryTimer;
}

- (void)setReconRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reconRetryTimer, a3);
}

- (MSVVariableIntervalTimer)connectionRetryTimer
{
  return self->_connectionRetryTimer;
}

- (void)setConnectionRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionRetryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionRetryTimer, 0);
  objc_storeStrong((id *)&self->_reconRetryTimer, 0);
  objc_storeStrong((id *)&self->_resolvingPlayerPath, 0);
  objc_storeStrong((id *)&self->_resolvingEndpoint, 0);
  objc_storeStrong((id *)&self->_delegatePlayerPath, 0);
  objc_storeStrong((id *)&self->_delegateOrigin, 0);
  objc_storeStrong((id *)&self->_delegateEndpoint, 0);
  objc_storeStrong((id *)&self->_originalDestination, 0);
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (void)handleEndpointResolution:(os_log_t)log client:player:source:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "%@ <%@> Error resolving for outputDeviceUID %@", (uint8_t *)&v3, 0x20u);
}

@end
