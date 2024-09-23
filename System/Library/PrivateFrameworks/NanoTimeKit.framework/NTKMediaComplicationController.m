@implementation NTKMediaComplicationController

- (void)resume
{
  MPRequestResponseController *requestResponseController;
  MPRequestResponseController *v4;
  MPRequestResponseController *v5;
  void *v6;

  requestResponseController = self->_requestResponseController;
  if (!requestResponseController)
  {
    v4 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x1E0CC24E0]);
    v5 = self->_requestResponseController;
    self->_requestResponseController = v4;

    -[MPRequestResponseController setDelegate:](self->_requestResponseController, "setDelegate:", self);
    requestResponseController = self->_requestResponseController;
  }
  -[MPRequestResponseController beginAutomaticResponseLoading](requestResponseController, "beginAutomaticResponseLoading");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleRoutingControllerActiveSystemRouteDidChange_, *MEMORY[0x1E0CC1CE0], 0);

  -[NTKMediaComplicationController _updateActiveRoute](self, "_updateActiveRoute");
}

- (void)pause
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CC1CE0], 0);

  -[MPRequestResponseController endAutomaticResponseLoading](self->_requestResponseController, "endAutomaticResponseLoading");
}

- (id)launchURLWithScheme:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setScheme:", v5);

  -[MPRequestResponseController response](self->_requestResponseController, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tracklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "setHost:", CFSTR("now-playing"));
    -[MPRequestResponseController response](self->_requestResponseController, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v12, "route");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "designatedGroupLeaderRouteUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryItemWithName:value:", CFSTR("routeUID"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v12, "bundleID", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "queryItemWithName:value:", CFSTR("bundleID"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v19;
    v20 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v12, "playerID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "queryItemWithName:value:", CFSTR("playerID"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQueryItems:", v23);

  }
  objc_msgSend(v6, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__NTKMediaComplicationController_controller_defersResponseReplacement___block_invoke;
  v7[3] = &unk_1E6BCE3C8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __71__NTKMediaComplicationController_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v2 + 8), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "controller:didReplaceResponse:", v2, v3);

}

- (void)_updateActiveRoute
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__NTKMediaComplicationController__updateActiveRoute__block_invoke;
  v2[3] = &unk_1E6BD5968;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CC2318], "getProactiveRouteWithCompletion:", v2);
}

void __52__NTKMediaComplicationController__updateActiveRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NTKMediaComplicationController__updateActiveRoute__block_invoke_2;
  v5[3] = &unk_1E6BCD778;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __52__NTKMediaComplicationController__updateActiveRoute__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "controller:requestPlayerPathWithRoute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0D4B380]);
    objc_msgSend(v23, "setPlayerPath:", v3);
    v24 = objc_alloc(MEMORY[0x1E0CC24C0]);
    v34 = *MEMORY[0x1E0CC2188];
    v22 = objc_alloc(MEMORY[0x1E0CC24C0]);
    v33 = *MEMORY[0x1E0CC2168];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x1E0CC21B0];
    v4 = (void *)MEMORY[0x1E0CC24C0];
    v30 = *MEMORY[0x1E0CC2058];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertySetWithProperties:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v6;
    v31[1] = *MEMORY[0x1E0CC21A8];
    v7 = (void *)MEMORY[0x1E0CC24C0];
    v29 = *MEMORY[0x1E0CC2050];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertySetWithProperties:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v22, "initWithProperties:relationships:", v21, v10);
    v35[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v24, "initWithProperties:relationships:", 0, v12);
    v25 = v3;
    v14 = (void *)v13;
    objc_msgSend(v23, "setPlayingItemProperties:", v13);

    v15 = objc_alloc(MEMORY[0x1E0CC24C0]);
    v27 = *MEMORY[0x1E0CC2180];
    v16 = (void *)MEMORY[0x1E0CC24C0];
    v26 = *MEMORY[0x1E0CC2138];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "propertySetWithProperties:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v15, "initWithProperties:relationships:", 0, v19);
    objc_msgSend(v23, "setQueueSectionProperties:", v20);

    v3 = v25;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRequest:", v23);

  }
}

- (NTKMediaComplicationControllerDelegate)delegate
{
  return (NTKMediaComplicationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestResponseController, 0);
}

@end
