@implementation MKDirections

- (MKDirections)init
{
  return -[MKDirections initWithRequest:](self, "initWithRequest:", 0);
}

- (MKDirections)initWithRequest:(MKDirectionsRequest *)request
{
  MKDirectionsRequest *v4;
  MKDirections *v5;
  uint64_t v6;
  MKDirectionsRequest *v7;
  MKDirections *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v14;

  v4 = request;
  v14.receiver = self;
  v14.super_class = (Class)MKDirections;
  v5 = -[MKDirections init](&v14, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot initialize %@ with nil request"), objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v13);
    }
    v6 = -[MKDirectionsRequest copy](v4, "copy");
    v7 = v5->_request;
    v5->_request = (MKDirectionsRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)_cleanupLocationOperation
{
  MKLocationManagerOperation *locationOperation;

  -[MKLocationManagerOperation cancel](self->_locationOperation, "cancel");
  locationOperation = self->_locationOperation;
  self->_locationOperation = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MKDirections _cleanupLocationOperation](self, "_cleanupLocationOperation");
  v3.receiver = self;
  v3.super_class = (Class)MKDirections;
  -[MKDirections dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MKDirections_cancel__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    __22__MKDirections_cancel__block_invoke((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void *__22__MKDirections_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupLocationOperation");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
  {
    objc_msgSend(MEMORY[0x1E0D27038], "sharedRequester");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(void **)(v2 + 32);
  if (result)
    return (void *)objc_msgSend(result, "cancel");
  return result;
}

- (BOOL)isCalculating
{
  if (self->_geoRequest || self->_locationOperation || self->_waypointsDispatchGroup)
    return 1;
  if (self->_etaRequester)
    return self->_etaRequest != 0;
  return 0;
}

- (void)_establishCurrentLocationAndThen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  MKDirections *v9;
  id v10;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = self;
  v10 = v4;
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v8, 3221225472, __49__MKDirections__establishCurrentLocationAndThen___block_invoke, &unk_1E20D8238, v9))
  {
    __49__MKDirections__establishCurrentLocationAndThen___block_invoke((uint64_t)&v8);
    v7 = v6;
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], &v8);
    v7 = v10;
  }

}

void __49__MKDirections__establishCurrentLocationAndThen___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isCurrentLocation"))
  {

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "_cleanupLocationOperation");
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __49__MKDirections__establishCurrentLocationAndThen___block_invoke_2;
    v13 = &unk_1E20DECA8;
    v6 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v6;
    objc_msgSend(v5, "singleLocationUpdateWithHandler:", &v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "start", v10, v11, v12, v13, v14);
    return;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentLocation");

  if (v4)
    goto LABEL_4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __49__MKDirections__establishCurrentLocationAndThen___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if (!(a2 | v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v5;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_performWithValidCurrentLocationAndWaypointsForQuickETA:(BOOL)a3 traits:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  _QWORD block[4];
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  if (-[MKDirections isCalculating](self, "isCalculating"))
  {
    NSLog(CFSTR("Cannot calculate directions on a MKDirections that is already calculating"));
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke;
    block[3] = &unk_1E20D7F70;
    v19 = v11;
    v20 = v9;
    v12 = v9;
    v13 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2;
    v14[3] = &unk_1E20DED20;
    v16 = v9;
    v14[4] = self;
    v17 = a3;
    v15 = v8;
    v13 = v9;
    -[MKDirections _establishCurrentLocationAndThen:](self, "_establishCurrentLocationAndThen:", v14);

    v12 = v16;
  }

}

uint64_t __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  dispatch_group_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = dispatch_group_create();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__19;
    v29[4] = __Block_byref_object_dispose__19;
    v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__19;
    v27[4] = __Block_byref_object_dispose__19;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__19;
    v25[4] = __Block_byref_object_dispose__19;
    v26 = 0;
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
    v7 = (void *)MEMORY[0x1E0D26FF8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 56);
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_19;
    v24[3] = &unk_1E20DECD0;
    v24[5] = v27;
    v24[6] = v29;
    v11 = *(_QWORD *)(a1 + 40);
    v24[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "composedWaypointForMapItem:useAsLocation:forQuickETA:traits:completionHandler:networkActivityHandler:", v8, 0, v9, v11, v24, 0);

    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
    v12 = (void *)MEMORY[0x1E0D26FF8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(unsigned __int8 *)(a1 + 56);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2_21;
    v23[3] = &unk_1E20DECD0;
    v23[5] = v25;
    v23[6] = v29;
    v15 = *(_QWORD *)(a1 + 40);
    v23[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "composedWaypointForMapItem:useAsLocation:forQuickETA:traits:completionHandler:networkActivityHandler:", v13, 0, v14, v15, v23, 0);

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 48);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_3;
    block[3] = &unk_1E20DECF8;
    block[4] = v16;
    v19 = *(id *)(a1 + 48);
    v20 = v27;
    v21 = v25;
    v22 = v29;
    dispatch_group_notify(v17, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);

    _Block_object_dispose(v29, 8);
  }

}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_19(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  v12 = v7;
  v8 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v7 = v10;
  objc_storeStrong(v9, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 48));

}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2_21(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  v12 = v7;
  v8 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v7 = v10;
  objc_storeStrong(v9, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 48));

}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = a1[4];
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = a1[5];
  v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v6 = a1[8];
  v7 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(v6 + 8) + 40), "_mapkit_errorWithDirectionsError:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v7, v8);

}

- (void)calculateDirectionsWithCompletionHandler:(MKDirectionsHandler)completionHandler
{
  MKDirectionsHandler v4;
  void *v5;
  id v6;

  v4 = completionHandler;
  +[MKMapService sharedService](MKMapService, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultTraitsWithTransportType:", -[MKDirectionsRequest transportType](self->_request, "transportType"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MKDirections _calculateDirectionsWithTraits:completionHandler:](self, "_calculateDirectionsWithTraits:completionHandler:", v6, v4);
}

- (void)_calculateDirectionsWithTraits:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;

  v6 = a3;
  v7 = a4;
  if (-[MKDirectionsRequest transportType](self->_request, "transportType") == 4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke;
    block[3] = &unk_1E20D7EF8;
    v8 = &v15;
    v15 = v7;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke_2;
    v11[3] = &unk_1E20DED48;
    v8 = &v13;
    v13 = v7;
    v11[4] = self;
    v12 = v6;
    v10 = v7;
    -[MKDirections _performWithValidCurrentLocationAndWaypointsForQuickETA:traits:handler:](self, "_performWithValidCurrentLocationAndWaypointsForQuickETA:traits:handler:", 0, v12, v11);

  }
}

void __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKErrorDomain, 5, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0D27030]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithPurpose:andSource:andIdentifier:", 4, 4, v11);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27028]), "initWithDirectionsRequest:origin:destination:withFeedback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v7, v8, v12);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 16);
    *(_QWORD *)(v14 + 16) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setIsFromAPI:", 1);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_resolveExtraAutomobileOptions"))
    {
      v16 = objc_alloc(MEMORY[0x1E0D51930]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "routeAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      v25[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "initWithAttributes:waypoints:", v17, v18);
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 56);
      *(_QWORD *)(v20 + 56) = v19;

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "routeAttributes");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(v23 + 56);
      *(_QWORD *)(v23 + 56) = v22;

    }
    objc_msgSend(*(id *)(a1 + 32), "_issueDirectionsRequestForOrigin:destination:traits:completionHandler:", v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)_issueDirectionsRequestForOrigin:(id)a3 destination:(id)a4 traits:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEORouteAttributes *routeAttributes;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  routeAttributes = self->_routeAttributes;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke;
  v19[3] = &unk_1E20DEDC0;
  v22 = v12;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  -[GEORouteAttributes buildRouteAttributes:result:](routeAttributes, "buildRouteAttributes:result:", MEMORY[0x1E0C80D38], v19);

}

void __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRouteAttributes:", a2);
    v3 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_2;
    v18[3] = &unk_1E20DED70;
    v4 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v4;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 64);
    v5 = (void *)MEMORY[0x18D778DB8](v18);
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_3;
    v13[3] = &unk_1E20DED98;
    v6 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v6;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    v7 = (void *)MEMORY[0x18D778DB8](v13);
    objc_msgSend(MEMORY[0x1E0D27038], "sharedRequester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(v9 + 16);
    v12 = objc_msgSend(*(id *)(v9 + 8), "_useBackgroundURL");
    objc_msgSend(v8, "startRequest:traits:auditToken:useBackgroundURL:callbackQueue:finished:networkActivity:error:", v11, v10, 0, v12, MEMORY[0x1E0C80D38], v5, 0, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  if (a2)
  {
    v4 = a1[4];
    v3 = a1[5];
    v6 = *(_QWORD *)(v4 + 8);
    v5 = *(_QWORD *)(v4 + 16);
    v7 = a1[6];
    v16 = 0;
    +[MKDirectionsResponse _responseWithGEODirectionsRouteResponse:routeRequest:request:origin:destination:error:](MKDirectionsResponse, "_responseWithGEODirectionsRouteResponse:routeRequest:request:origin:destination:error:", a2, v5, v6, v3, v7, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v9)
    {
      v10 = 0;
      v11 = v9;
    }
    else
    {
      v10 = v8;
      v11 = 0;
    }
    (*(void (**)(_QWORD, void *, id))(a1[7] + 16))(a1[7], v10, v11);

  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  v14 = a1[4];
  v15 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = 0;

}

void __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6
    && (v8 = *(_QWORD *)(a1 + 32), v10 = *(_QWORD *)(v8 + 64), v9 = (id *)(v8 + 64), !v10)
    && (objc_storeStrong(v9, a2),
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "shouldRetryForError:", v6)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_issueDirectionsRequestForOrigin:destination:traits:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    if (objc_msgSend(v6, "code") != -2
      || (objc_msgSend(v6, "domain"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "isEqualToString:", v12),
          v12,
          v11,
          (v13 & 1) == 0))
    {
      if (*(_QWORD *)(a1 + 40) && (v14 = *(_QWORD *)(a1 + 48)) != 0)
      {
        v15 = (void *)MEMORY[0x1E0C99D80];
        v21[0] = *(_QWORD *)(a1 + 40);
        v21[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_navigation_stringTokensForDirectionsError:waypoints:", v7, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(v6, "_mapkit_errorWithDirectionsError:stringTokens:", v7, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 16);
    *(_QWORD *)(v19 + 16) = 0;

  }
}

- (void)_calculateETAWithTraits:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__MKDirections__calculateETAWithTraits_completionHandler___block_invoke;
    v8[3] = &unk_1E20DEDE8;
    v8[4] = self;
    v9 = v6;
    -[MKDirections _performWithValidCurrentLocationAndWaypointsForQuickETA:traits:handler:](self, "_performWithValidCurrentLocationAndWaypointsForQuickETA:traits:handler:", 1, a3, v8);

  }
}

void __58__MKDirections__calculateETAWithTraits_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _routeAttributesForMKDirectionsRequest(*(void **)(*(_QWORD *)(a1 + 32) + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_resolveExtraAutomobileOptions"))
    {
      v10 = objc_alloc(MEMORY[0x1E0D51930]);
      v15[0] = v7;
      v15[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithAttributes:waypoints:", v9, v11);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 56);
      *(_QWORD *)(v13 + 56) = v12;

    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v9);
    }
    objc_msgSend(*(id *)(a1 + 32), "_issueETARequestForOrigin:destination:completionHandler:", v7, v8, *(_QWORD *)(a1 + 40));

  }
}

- (void)_issueETARequestForOrigin:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEORouteAttributes *routeAttributes;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  routeAttributes = self->_routeAttributes;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke;
  v15[3] = &unk_1E20DEE38;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[GEORouteAttributes buildRouteAttributes:result:](routeAttributes, "buildRouteAttributes:result:", MEMORY[0x1E0C80D38], v15);

}

void __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  objc_msgSend(v3, "cancel");
  v5 = objc_alloc(MEMORY[0x1E0D27390]);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "automobileOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "initWithDirectionsRequest:origin:destination:automobileOptions:", v7, v6, v8, v9);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v10;

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27398]), "initWithRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  *(_QWORD *)(v14 + 32) = v13;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v18 = *(void **)(v16 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke_2;
  v19[3] = &unk_1E20DEE10;
  v19[4] = v16;
  v20 = v17;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  objc_msgSend(v18, "calculateETAFromAPI:WithResponseHandler:", 1, v19);

}

void __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id *v7;
  id *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  MKMapItem *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;

  v35 = a2;
  v5 = a3;
  v6 = (id *)a1[4];
  v7 = v6;
  if (v5
    && (v9 = v6[8], v8 = v6 + 8, !v9)
    && (objc_storeStrong(v8, a3),
        v10 = objc_msgSend(*(id *)(a1[4] + 56), "shouldRetryForError:", v5),
        v7 = (id *)a1[4],
        v10))
  {
    objc_msgSend(v7, "_issueETARequestForOrigin:destination:completionHandler:", a1[5], a1[6], a1[7]);
  }
  else
  {
    objc_msgSend(v7[1], "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isCurrentLocation"))
    {
      objc_msgSend(v35, "sourceLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "latLng");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v34, "lat");
      v15 = v14;
      objc_msgSend(v34, "lng");
      v17 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v15, v16);
      v18 = -[MKMapItem initWithCLLocation:]([MKMapItem alloc], "initWithCLLocation:", v17);

      v19 = a1[7];
      objc_msgSend(*(id *)(a1[4] + 8), "destination");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v35, "responseETASeconds");
      v22 = objc_msgSend(v35, "responseETASeconds");
      objc_msgSend(v35, "distance");
      v24 = v23;
      objc_msgSend(v35, "sortedETAs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_mapkit_errorWithDirectionsError:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v24;
      v28 = v34;
      (*(void (**)(uint64_t, MKMapItem *, void *, uint64_t, uint64_t, uint64_t, void *, void *))(v19 + 16))(v19, v18, v20, v21, v22, v27, v25, v26);

      v11 = v18;
    }
    else
    {
      v29 = a1[7];
      objc_msgSend(*(id *)(a1[4] + 8), "source");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[4] + 8), "destination");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v35, "responseETASeconds");
      v31 = objc_msgSend(v35, "responseETASeconds");
      objc_msgSend(v35, "distance");
      v33 = v32;
      objc_msgSend(v35, "sortedETAs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_mapkit_errorWithDirectionsError:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, uint64_t, uint64_t, uint64_t, void *, void *))(v29 + 16))(v29, v28, v17, v30, v31, v33, v20, v25);
    }

  }
}

- (void)calculateETAWithCompletionHandler:(MKETAHandler)completionHandler
{
  MKETAHandler v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = completionHandler;
  if (v4)
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultTraitsWithTransportType:", -[MKDirectionsRequest transportType](self->_request, "transportType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__MKDirections_calculateETAWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E20DEE60;
    v7[4] = self;
    v8 = v4;
    -[MKDirections _calculateETAWithTraits:completionHandler:](self, "_calculateETAWithTraits:completionHandler:", v6, v7);

  }
}

void __50__MKDirections_calculateETAWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, uint64_t a8)
{
  id v14;
  id v15;
  double v16;
  MKETAResponse *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;

  v35 = a2;
  v14 = a3;
  v15 = a7;
  if (!a8)
  {
    v16 = (double)a4;
    v17 = -[MKETAResponse initWithSource:destination:expectedTravelTime:distance:sortedETAs:]([MKETAResponse alloc], "initWithSource:destination:expectedTravelTime:distance:sortedETAs:", v35, v14, v15, (double)a4, (double)a6);
    -[MKETAResponse expectedDepartureDate](v17, "expectedDepartureDate");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[MKETAResponse expectedArrivalDate](v17, "expectedArrivalDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_11;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "departureDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v21)
    {
      objc_msgSend(v22, "departureDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKETAResponse setExpectedDepartureDate:](v17, "setExpectedDepartureDate:", v23);

      v24 = (void *)MEMORY[0x1E0C99D68];
      -[MKETAResponse expectedTravelTime](v17, "expectedTravelTime");
      v16 = v25;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "departureDate");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v22, "arrivalDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "arrivalDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKETAResponse setExpectedArrivalDate:](v17, "setExpectedArrivalDate:", v30);

        v31 = (void *)MEMORY[0x1E0C99D68];
        -[MKETAResponse expectedTravelTime](v17, "expectedTravelTime");
        v33 = -v32;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "arrivalDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "dateWithTimeInterval:sinceDate:", v27, v33);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKETAResponse setExpectedDepartureDate:](v17, "setExpectedDepartureDate:", v28);
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKETAResponse setExpectedDepartureDate:](v17, "setExpectedDepartureDate:", v34);

      v24 = (void *)MEMORY[0x1E0C99D68];
      -[MKETAResponse expectedDepartureDate](v17, "expectedDepartureDate");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v26;
    objc_msgSend(v24, "dateWithTimeInterval:sinceDate:", v26, v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAResponse setExpectedArrivalDate:](v17, "setExpectedArrivalDate:", v28);
LABEL_10:

LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    goto LABEL_12;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousError, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_waypointsDispatchGroup, 0);
  objc_storeStrong((id *)&self->_locationOperation, 0);
  objc_storeStrong((id *)&self->_etaRequester, 0);
  objc_storeStrong((id *)&self->_etaRequest, 0);
  objc_storeStrong((id *)&self->_geoRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
