@implementation GEONavigationListener

- (GEONavigationListener)init
{
  GEONavigationListener *result;

  result = (GEONavigationListener *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEONavigationListener)initWithQueue:(id)a3
{
  NSObject *v5;
  GEONavigationListener *v6;
  GEONavigationListener *v7;
  NSObject *v8;
  uint64_t v9;
  uint32_t state;
  NSObject *p_super;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  GEONavigationListener *v17;
  _QWORD v19[4];
  GEONavigationListener *v20;
  uint64_t state64;
  _QWORD handler[4];
  id v23;
  id location;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GEONavigationListener;
  v6 = -[GEONavigationListener init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_navigationState = 0;
    v7->_transportType = 4;
    objc_initWeak(&location, v7);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEFAULT, "Initializing navigation listener", buf, 2u);
    }

    if (qword_1ECDBC0E0 != -1)
      dispatch_once(&qword_1ECDBC0E0, &__block_literal_global_97);
    if (!_MergedGlobals_244)
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "processName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = (uint64_t)v15;
        _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Process '%@' is trying to use the MNNavigationService SPI without the proper entitlement.", buf, 0xCu);

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [self _hasNavigationListenerEntitlement]", buf, 2u);
      }
      goto LABEL_20;
    }
    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __39__GEONavigationListener_initWithQueue___block_invoke;
    handler[3] = &unk_1E1C05280;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch("com.apple.GeoServices.navigation.openListenerConnection", &v7->_navigationStartedToken, v5, handler);
    state64 = 0;
    state = notify_get_state(v7->_navigationStartedToken, &state64);
    if (state)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = state;
        _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_ERROR, "Error getting navigation started state (%u)", buf, 8u);
      }
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v27 = state64;
        _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEFAULT, "Navigation started state: %llu", buf, 0xCu);
      }

      if (!state64)
        goto LABEL_19;
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __39__GEONavigationListener_initWithQueue___block_invoke_7;
      v19[3] = &unk_1E1BFF6F8;
      v20 = v7;
      dispatch_async(v5, v19);
      p_super = &v20->super;
    }

LABEL_19:
    objc_destroyWeak(&v23);
LABEL_20:
    v17 = v7;
    objc_destroyWeak(&location);
  }

  return v7;
}

void __39__GEONavigationListener_initWithQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "Received started navigation notification", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    -[GEONavigationListener _connectToDaemonIfNeeded]((uint64_t)WeakRetained);

}

void __39__GEONavigationListener_initWithQueue___block_invoke_7(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    -[GEONavigationListener _connectToDaemonIfNeeded](v1);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating navigation listener", buf, 2u);
  }

  notify_cancel(self->_navigationStartedToken);
  notify_cancel(self->_navigationStoppedToken);
  -[GEONavigationListener _close]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)GEONavigationListener;
  -[GEONavigationListener dealloc](&v4, sel_dealloc);
}

- (void)_close
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (a1)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Closing a connection", v4, 2u);
    }

    objc_msgSend(*(id *)(a1 + 8), "invalidate");
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

  }
}

- (void)requestRouteSummary
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GEONavigationListener_requestRouteSummary__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__GEONavigationListener_requestRouteSummary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestRouteSummary");

  }
  else
  {
    -[GEONavigationListener _notifyWithRouteSummary:](v1, 0);
  }
}

- (void)_notifyWithRouteSummary:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "navigationListener:didUpdateRouteSummary:", a1, v7);

    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

- (void)requestTransitSummary
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GEONavigationListener_requestTransitSummary__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__GEONavigationListener_requestTransitSummary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestTransitSummary");

  }
  else
  {
    -[GEONavigationListener _notifyWithTransitSummary:](v1, 0);
  }
}

- (void)_notifyWithTransitSummary:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "navigationListener:didUpdateTransitSummary:", a1, v7);

    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

- (void)requestGuidanceState
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__GEONavigationListener_requestGuidanceState__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__GEONavigationListener_requestGuidanceState__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestGuidanceState");

  }
  else
  {
    -[GEONavigationListener _notifyWithGuidanceState:](v1, 0);
  }
}

- (void)_notifyWithGuidanceState:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "navigationListener:didUpdateGuidanceState:", a1, v7);

    }
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

- (void)requestActiveRouteDetailsData
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__GEONavigationListener_requestActiveRouteDetailsData__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__GEONavigationListener_requestActiveRouteDetailsData__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestActiveRouteDetailsData");

  }
  else
  {
    -[GEONavigationListener _notifyWithActiveRouteDetailsData:](v1, 0);
  }
}

- (void)_notifyWithActiveRouteDetailsData:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "navigationListener:didUpdateActiveRouteData:", a1, v7);

    }
    v6 = *(_QWORD *)(a1 + 72);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

- (void)requestStepIndex
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEONavigationListener_requestStepIndex__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__GEONavigationListener_requestStepIndex__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    objc_msgSend(*(id *)(v2 + 8), "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestStepIndex");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestStepNameInfo");

  }
  else
  {
    -[GEONavigationListener _notifyWithStepIndex:](v2, 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (uint64_t)_notifyWithStepIndex:(uint64_t)result
{
  uint64_t v3;
  id *v4;
  id WeakRetained;
  char v6;
  id v7;

  if (result)
  {
    v3 = result;
    v4 = (id *)(result + 40);
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(v4);
      objc_msgSend(v7, "navigationListener:didUpdateStepIndex:", v3, a2);

    }
    result = *(_QWORD *)(v3 + 80);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)requestStepNameInfo
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GEONavigationListener_requestStepNameInfo__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__GEONavigationListener_requestStepNameInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestStepNameInfo");

  }
  else
  {
    -[GEONavigationListener _notifyWithStepNameInfo:](v1, 0);
  }
}

- (void)_notifyWithStepNameInfo:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "navigationListener:didUpdateStepNameInfo:", a1, v6);

    }
  }

}

- (void)requestRideSelections
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GEONavigationListener_requestRideSelections__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__GEONavigationListener_requestRideSelections__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestRideSelections");

  }
  else
  {
    -[GEONavigationListener _notifyWithRideSelections:](v1, 0);
  }
}

- (void)_notifyWithRideSelections:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "navigationListener:didUpdateRideSelections:", a1, v7);

    }
    v6 = *(_QWORD *)(a1 + 88);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

- (void)requestPositionFromSign
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GEONavigationListener_requestPositionFromSign__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__GEONavigationListener_requestPositionFromSign__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestPositionFromSign");

  }
  else
  {
    -[GEONavigationListener _notifyWithPositionFromSign:](v1, -1.0, -1.0);
  }
}

- (uint64_t)_notifyWithPositionFromSign:(double)a3
{
  uint64_t v5;
  id *v6;
  id WeakRetained;
  char v8;
  id v9;

  if (result)
  {
    v5 = result;
    v6 = (id *)(result + 40);
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained(v6);
      objc_msgSend(v9, "navigationListener:didUpdatePositionFromSign:", v5, a2, a3);

    }
    result = *(_QWORD *)(v5 + 96);
    if (result)
      return (*(uint64_t (**)(double, double))(result + 16))(a2, a3);
  }
  return result;
}

- (void)requestPositionFromManeuver
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__GEONavigationListener_requestPositionFromManeuver__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__GEONavigationListener_requestPositionFromManeuver__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestPositionFromManeuver");

  }
  else
  {
    -[GEONavigationListener _notifyWithPositionFromManeuver:](v1, -1.0, -1.0);
  }
}

- (uint64_t)_notifyWithPositionFromManeuver:(double)a3
{
  uint64_t v5;
  id *v6;
  id WeakRetained;
  char v8;
  id v9;

  if (result)
  {
    v5 = result;
    v6 = (id *)(result + 40);
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained(v6);
      objc_msgSend(v9, "navigationListener:didUpdatePositionFromManeuver:", v5, a2, a3);

    }
    result = *(_QWORD *)(v5 + 104);
    if (result)
      return (*(uint64_t (**)(double, double))(result + 16))(a2, a3);
  }
  return result;
}

- (void)requestPositionFromDestination
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GEONavigationListener_requestPositionFromDestination__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __55__GEONavigationListener_requestPositionFromDestination__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestPositionFromDestination");

  }
  else
  {
    -[GEONavigationListener _notifyWithPositionFromDestination:](v1, -1.0, -1.0);
  }
}

- (uint64_t)_notifyWithPositionFromDestination:(double)a3
{
  uint64_t v5;
  id *v6;
  id WeakRetained;
  char v8;
  id v9;

  if (result)
  {
    v5 = result;
    v6 = (id *)(result + 40);
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained(v6);
      objc_msgSend(v9, "navigationListener:didUpdatePositionFromDestination:", v5, a2, a3);

    }
    result = *(_QWORD *)(v5 + 112);
    if (result)
      return (*(uint64_t (**)(double, double))(result + 16))(a2, a3);
  }
  return result;
}

- (void)requestNavigationVoiceVolume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__GEONavigationListener_requestNavigationVoiceVolume__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__GEONavigationListener_requestNavigationVoiceVolume__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 8), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestNavigationVoiceVolume");

  }
  else
  {
    -[GEONavigationListener _notifyWithNavigationVoiceVolume:](v1, 0);
  }
}

- (uint64_t)_notifyWithNavigationVoiceVolume:(uint64_t)result
{
  uint64_t v3;
  id *v4;
  id WeakRetained;
  char v6;
  id v7;

  if (result)
  {
    v3 = result;
    v4 = (id *)(result + 40);
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(v4);
      objc_msgSend(v7, "navigationListener:didUpdateNavigationVoiceVolume:", v3, a2);

    }
    result = *(_QWORD *)(v3 + 120);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)_connectToDaemonIfNeeded
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id buf[2];

  if (qword_1ECDBC0E0 != -1)
    dispatch_once(&qword_1ECDBC0E0, &__block_literal_global_97);
  if (_MergedGlobals_244)
  {
    if (!*(_QWORD *)(a1 + 8))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Opening a connection", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, (id)a1);
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.navigationListener"), 0);
      v4 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v3;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01F0B8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 8), "setRemoteObjectInterface:", v5);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFC98D8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 8), "setExportedInterface:", v6);

      objc_msgSend(*(id *)(a1 + 8), "setExportedObject:", a1);
      v7 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke;
      v15[3] = &unk_1E1BFF8B0;
      objc_copyWeak(&v16, buf);
      objc_msgSend(*(id *)(a1 + 8), "setInterruptionHandler:", v15);
      v10 = v7;
      v11 = 3221225472;
      v12 = __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_102;
      v13 = &unk_1E1BFF8B0;
      objc_copyWeak(&v14, buf);
      objc_msgSend(*(id *)(a1 + 8), "setInvalidationHandler:", &v10);
      objc_msgSend(*(id *)(a1 + 8), "resume", v10, v11, v12, v13);
      objc_msgSend(*(id *)(a1 + 8), "remoteObjectProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWantsRoutes:", *(unsigned __int8 *)(a1 + 36));

      objc_msgSend(*(id *)(a1 + 8), "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestUpdates");

      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [self _hasNavigationListenerEntitlement]", (uint8_t *)buf, 2u);
  }
}

void __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BYTE *WeakRetained;
  _BYTE *v4;
  uint8_t v5[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "requestGuidanceState");
    objc_msgSend(v4, "requestTransitSummary");
    objc_msgSend(v4, "requestRouteSummary");
    objc_msgSend(v4, "requestActiveRouteDetailsData");
    objc_msgSend(v4, "requestStepIndex");
    objc_msgSend(v4, "requestRideSelections");
    objc_msgSend(v4, "requestPositionFromSign");
    objc_msgSend(v4, "requestPositionFromManeuver");
    objc_msgSend(v4, "requestPositionFromDestination");
    objc_msgSend(v4, "requestNavigationVoiceVolume");
    v4[169] = 1;
  }

}

void __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_102(uint64_t a1)
{
  NSObject *v2;
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", buf, 2u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_103;
    block[3] = &unk_1E1BFF6F8;
    block[4] = v4;
    dispatch_async(v5, block);
  }

}

void __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_103(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)navigationStateChanged:(unint64_t)a3 transportType:(int)a4 isResumingMultipointRoute:(BOOL)a5
{
  NSObject *queue;
  _QWORD block[6];
  int v7;
  BOOL v8;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__GEONavigationListener_navigationStateChanged_transportType_isResumingMultipointRoute___block_invoke;
  block[3] = &unk_1E1C0CA58;
  block[4] = self;
  block[5] = a3;
  v7 = a4;
  v8 = a5;
  dispatch_async(queue, block);
}

void __88__GEONavigationListener_navigationStateChanged_transportType_isResumingMultipointRoute___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  int v9;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 169))
  {
    *(_BYTE *)(v1 + 169) = 0;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 == 2)
      v4 = 2;
    else
      v4 = v3 == 1;
    if (*(_QWORD *)(v1 + 128) != v4 || *(_DWORD *)(v1 + 136) != *(_DWORD *)(a1 + 48))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        v13 = 67109376;
        v14 = v6;
        v15 = 1024;
        v16 = v4;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Changing navigation state from %d to %d", (uint8_t *)&v13, 0xEu);
      }

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = v4;
      if (*(_QWORD *)(a1 + 40) == 2)
      {
        v7 = *(_BYTE *)(a1 + 52);
        if (v7)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v9 = *(unsigned __int8 *)(a1 + 52);
            v13 = 67109120;
            v14 = v9;
            _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Resuming multipoint route: %d", (uint8_t *)&v13, 8u);
          }

          v7 = *(_BYTE *)(a1 + 52);
        }
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = v7;
      }
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
        objc_msgSend(v12, "navigationListener:didChangeNavigationState:transportType:", *(_QWORD *)(a1 + 32), v4, *(unsigned int *)(a1 + 48));

      }
    }
    if (!*(_QWORD *)(a1 + 40))
      -[GEONavigationListener _close](*(_QWORD *)(a1 + 32));
  }
}

- (void)didUpdateLocation:(id)a3 routeMatchedCoordinate:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  $212C09783140BCCD23384160D545CE0D v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GEONavigationListener_didUpdateLocation_routeMatchedCoordinate___block_invoke;
  block[3] = &unk_1E1C01420;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __66__GEONavigationListener_didUpdateLocation_routeMatchedCoordinate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  double v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;
  char v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = *(_QWORD *)(a1 + 48);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_DWORD *)(a1 + 48);
    v5 = *(float *)(a1 + 52);
    v11 = 138478339;
    v12 = v3;
    v13 = 1025;
    v14 = v4;
    v15 = 2049;
    v16 = v5;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "Received location: %{private}@\nReceived Route matched coordinate: [%{private}u, %{private}f]", (uint8_t *)&v11, 0x1Cu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v7 = objc_opt_respondsToSelector();

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "navigationListener:didUpdateLocation:routeMatchedCoordinate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      return;
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v9, "navigationListener:didUpdateLocation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (void)didUpdateRoute:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  GEONavigationListener *v9;

  v4 = a3;
  v5 = v4;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__GEONavigationListener_didUpdateRoute___block_invoke;
    v7[3] = &unk_1E1C00738;
    v8 = v4;
    v9 = self;
    dispatch_async(queue, v7);

  }
}

void __40__GEONavigationListener_didUpdateRoute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138477827;
    v8 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "Received route: %{private}@", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(v6, "navigationListener:didUpdateRoute:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (void)didUpdateTrafficForCurrentRoute:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  GEONavigationListener *v9;

  v4 = a3;
  v5 = v4;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__GEONavigationListener_didUpdateTrafficForCurrentRoute___block_invoke;
    v7[3] = &unk_1E1C00738;
    v8 = v4;
    v9 = self;
    dispatch_async(queue, v7);

  }
}

void __57__GEONavigationListener_didUpdateTrafficForCurrentRoute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138477827;
    v8 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Received traffic update: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(v6, "navigationListener:didUpdateTrafficForCurrentRoute:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (void)didArriveAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD block[4];
  id v10;
  GEONavigationListener *v11;
  unint64_t v12;

  v6 = a3;
  v7 = v6;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__GEONavigationListener_didArriveAtWaypoint_endOfLegIndex___block_invoke;
    block[3] = &unk_1E1C01420;
    v11 = self;
    v12 = a4;
    v10 = v6;
    dispatch_async(queue, block);

  }
}

void __59__GEONavigationListener_didArriveAtWaypoint_endOfLegIndex___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    v4 = a1[6];
    v8 = 138478083;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Received arrival at waypoint: %{private}@ endOfLegIndex: %lu", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 40));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1[5] + 40));
    objc_msgSend(v7, "navigationListener:didArriveAtWaypoint:endOfLegIndex:", a1[5], a1[4], a1[6]);

  }
}

- (void)didResumeNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD block[4];
  id v10;
  GEONavigationListener *v11;
  unint64_t v12;

  v6 = a3;
  v7 = v6;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__GEONavigationListener_didResumeNavigatingFromWaypoint_endOfLegIndex___block_invoke;
    block[3] = &unk_1E1C01420;
    v11 = self;
    v12 = a4;
    v10 = v6;
    dispatch_async(queue, block);

  }
}

void __71__GEONavigationListener_didResumeNavigatingFromWaypoint_endOfLegIndex___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    v4 = a1[6];
    v8 = 138478083;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Received resume navigating from waypoint: %{private}@ endOfLegIndex: %lu", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 40));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1[5] + 40));
    objc_msgSend(v7, "navigationListener:didResumeNavigatingFromWaypoint:endOfLegIndex:", a1[5], a1[4], a1[6]);

  }
}

- (void)didUpdateETA:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__GEONavigationListener_didUpdateETA___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __38__GEONavigationListener_didUpdateETA___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  uint8_t v6[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Received ETA update", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v5, "navigationListener:didUpdateETA:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)routeSummaryUpdatedWithNavigationRouteSummaryData:(id)a3
{
  id v4;
  GEONavigationRouteSummary *v5;
  NSObject *v6;
  NSObject *queue;
  GEONavigationRouteSummary *v8;
  _QWORD v9[5];
  GEONavigationRouteSummary *v10;
  uint8_t buf[4];
  GEONavigationRouteSummary *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = -[GEONavigationRouteSummary initWithData:]([GEONavigationRouteSummary alloc], "initWithData:", v4);
  else
    v5 = 0;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v12 = v5;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "received navigation route summary:%{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__GEONavigationListener_routeSummaryUpdatedWithNavigationRouteSummaryData___block_invoke;
  v9[3] = &unk_1E1C00738;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

void __75__GEONavigationListener_routeSummaryUpdatedWithNavigationRouteSummaryData___block_invoke(uint64_t a1)
{
  -[GEONavigationListener _notifyWithRouteSummary:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)routeSummaryUpdatedWithTransitSummaryData:(id)a3
{
  id v4;
  GEONavigationRouteTransitSummary *v5;
  NSObject *v6;
  NSObject *queue;
  GEONavigationRouteTransitSummary *v8;
  _QWORD v9[5];
  GEONavigationRouteTransitSummary *v10;
  uint8_t buf[4];
  GEONavigationRouteTransitSummary *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = -[GEONavigationRouteTransitSummary initWithData:]([GEONavigationRouteTransitSummary alloc], "initWithData:", v4);
  else
    v5 = 0;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v12 = v5;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "received transit summary:%{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__GEONavigationListener_routeSummaryUpdatedWithTransitSummaryData___block_invoke;
  v9[3] = &unk_1E1C00738;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

void __67__GEONavigationListener_routeSummaryUpdatedWithTransitSummaryData___block_invoke(uint64_t a1)
{
  -[GEONavigationListener _notifyWithTransitSummary:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)routeSummaryUpdatedWithGuidanceStateData:(id)a3
{
  id v4;
  GEONavigationGuidanceState *v5;
  NSObject *v6;
  NSObject *queue;
  GEONavigationGuidanceState *v8;
  _QWORD v9[5];
  GEONavigationGuidanceState *v10;
  uint8_t buf[4];
  GEONavigationGuidanceState *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = -[GEONavigationGuidanceState initWithData:]([GEONavigationGuidanceState alloc], "initWithData:", v4);
  else
    v5 = 0;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v12 = v5;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "received guidance state:%{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__GEONavigationListener_routeSummaryUpdatedWithGuidanceStateData___block_invoke;
  v9[3] = &unk_1E1C00738;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

void __66__GEONavigationListener_routeSummaryUpdatedWithGuidanceStateData___block_invoke(uint64_t a1)
{
  -[GEONavigationListener _notifyWithGuidanceState:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)routeSummaryUpdatedWithActiveRouteDetailsData:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "received active route details data", buf, 2u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__GEONavigationListener_routeSummaryUpdatedWithActiveRouteDetailsData___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __71__GEONavigationListener_routeSummaryUpdatedWithActiveRouteDetailsData___block_invoke(uint64_t a1)
{
  -[GEONavigationListener _notifyWithActiveRouteDetailsData:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)routeSummaryUpdatedWithStepIndexData:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[6];
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(a3, "getBytes:length:", &v7, 8);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v7;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "received step index: %lu", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__GEONavigationListener_routeSummaryUpdatedWithStepIndexData___block_invoke;
  block[3] = &unk_1E1BFF6D0;
  block[4] = self;
  block[5] = v7;
  dispatch_async(queue, block);
}

uint64_t __62__GEONavigationListener_routeSummaryUpdatedWithStepIndexData___block_invoke(uint64_t a1)
{
  return -[GEONavigationListener _notifyWithStepIndex:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)routeSummaryUpdatedWithStepNameInfoData:(id)a3
{
  id v4;
  GEONameInfo *v5;
  NSObject *v6;
  NSObject *queue;
  GEONameInfo *v8;
  _QWORD v9[5];
  GEONameInfo *v10;
  uint8_t buf[4];
  GEONameInfo *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = -[GEONameInfo initWithData:]([GEONameInfo alloc], "initWithData:", v4);
  else
    v5 = 0;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v12 = v5;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "received step name info:%{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__GEONavigationListener_routeSummaryUpdatedWithStepNameInfoData___block_invoke;
  v9[3] = &unk_1E1C00738;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

void __65__GEONavigationListener_routeSummaryUpdatedWithStepNameInfoData___block_invoke(uint64_t a1)
{
  -[GEONavigationListener _notifyWithStepNameInfo:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)routeSummaryUpdatedWithPositionFromSignData:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0uLL;
  objc_msgSend(a3, "getBytes:length:", &v9, 16);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.3f meters, %.3f seconds}"), *((_QWORD *)&v9 + 1), (_QWORD)v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v11 = v5;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "received position from sign: %{private}@", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__GEONavigationListener_routeSummaryUpdatedWithPositionFromSignData___block_invoke;
  block[3] = &unk_1E1BFFD08;
  block[4] = self;
  v8 = v9;
  dispatch_async(queue, block);
}

uint64_t __69__GEONavigationListener_routeSummaryUpdatedWithPositionFromSignData___block_invoke(uint64_t a1)
{
  return -[GEONavigationListener _notifyWithPositionFromSign:](*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)routeSummaryUpdatedWithPositionFromManeuverData:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0uLL;
  objc_msgSend(a3, "getBytes:length:", &v9, 16);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.3f meters, %.3f seconds}"), *((_QWORD *)&v9 + 1), (_QWORD)v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v11 = v5;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "received position from maneuver: %{private}@", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__GEONavigationListener_routeSummaryUpdatedWithPositionFromManeuverData___block_invoke;
  block[3] = &unk_1E1BFFD08;
  block[4] = self;
  v8 = v9;
  dispatch_async(queue, block);
}

uint64_t __73__GEONavigationListener_routeSummaryUpdatedWithPositionFromManeuverData___block_invoke(uint64_t a1)
{
  return -[GEONavigationListener _notifyWithPositionFromManeuver:](*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)routeSummaryUpdatedWithPositionFromDestinationData:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0uLL;
  objc_msgSend(a3, "getBytes:length:", &v9, 16);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.3f meters, %.3f seconds}"), *((_QWORD *)&v9 + 1), (_QWORD)v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v11 = v5;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "received position from destination: %{private}@", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__GEONavigationListener_routeSummaryUpdatedWithPositionFromDestinationData___block_invoke;
  block[3] = &unk_1E1BFFD08;
  block[4] = self;
  v8 = v9;
  dispatch_async(queue, block);
}

uint64_t __76__GEONavigationListener_routeSummaryUpdatedWithPositionFromDestinationData___block_invoke(uint64_t a1)
{
  return -[GEONavigationListener _notifyWithPositionFromDestination:](*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)routeSummaryUpdatedWithRideSelectionData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v8, v6, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v17;
  if (v10)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v19 = v10;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Error decoding ride options: %{private}@", buf, 0xCu);
    }

  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v19 = v9;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "received ride options %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GEONavigationListener_routeSummaryUpdatedWithRideSelectionData___block_invoke;
  block[3] = &unk_1E1C00738;
  block[4] = self;
  v16 = v9;
  v14 = v9;
  dispatch_async(queue, block);

}

void __66__GEONavigationListener_routeSummaryUpdatedWithRideSelectionData___block_invoke(uint64_t a1)
{
  -[GEONavigationListener _notifyWithRideSelections:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)navigationUpdatedWithVoiceVolumeData:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD v6[5];
  int v7;
  int v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(a3, "getBytes:length:", &v8, 4);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v8;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "received navigation voice volume: %d", buf, 8u);
  }

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__GEONavigationListener_navigationUpdatedWithVoiceVolumeData___block_invoke;
  v6[3] = &unk_1E1BFFBC8;
  v6[4] = self;
  v7 = v8;
  dispatch_async(queue, v6);
}

uint64_t __62__GEONavigationListener_navigationUpdatedWithVoiceVolumeData___block_invoke(uint64_t a1)
{
  return -[GEONavigationListener _notifyWithNavigationVoiceVolume:](*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)currentRoadNameUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "received current road name: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__GEONavigationListener_currentRoadNameUpdated___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __48__GEONavigationListener_currentRoadNameUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  char v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v2;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v7, "navigationListener:didUpdateCurrentRoadName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __58__GEONavigationListener__hasNavigationListenerEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.geoservices.navigation_info"), &error);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      _MergedGlobals_244 = v5;
      CFRelease(v3);
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task", buf, 2u);
      }

    }
    if (error)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = error;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    CFRelease(v1);
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Error creating security task", buf, 2u);
    }

  }
}

- (GEONavigationListenerDelegate)delegate
{
  return (GEONavigationListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (NSString)currentRoadName
{
  return self->_currentRoadName;
}

- (id)routeSummaryUpdatedHandler
{
  return self->_routeSummaryUpdatedHandler;
}

- (void)setRouteSummaryUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)transitSummaryUpdatedHandler
{
  return self->_transitSummaryUpdatedHandler;
}

- (void)setTransitSummaryUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)guidanceStateUpdatedHandler
{
  return self->_guidanceStateUpdatedHandler;
}

- (void)setGuidanceStateUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)activeRouteDetailsDataUpdatedHandler
{
  return self->_activeRouteDetailsDataUpdatedHandler;
}

- (void)setActiveRouteDetailsDataUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)stepIndexUpdatedHandler
{
  return self->_stepIndexUpdatedHandler;
}

- (void)setStepIndexUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)rideSelectionsUpdatedHandler
{
  return self->_rideSelectionsUpdatedHandler;
}

- (void)setRideSelectionsUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)positionFromSignUpdatedHandler
{
  return self->_positionFromSignUpdatedHandler;
}

- (void)setPositionFromSignUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)positionFromManeuverUpdatedHandler
{
  return self->_positionFromManeuverUpdatedHandler;
}

- (void)setPositionFromManeuverUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)positionFromDestinationUpdatedHandler
{
  return self->_positionFromDestinationUpdatedHandler;
}

- (void)setPositionFromDestinationUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)navigationVoiceVolumeUpdatedHandler
{
  return self->_navigationVoiceVolumeUpdatedHandler;
}

- (void)setNavigationVoiceVolumeUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong(&self->_navigationVoiceVolumeUpdatedHandler, 0);
  objc_storeStrong(&self->_positionFromDestinationUpdatedHandler, 0);
  objc_storeStrong(&self->_positionFromManeuverUpdatedHandler, 0);
  objc_storeStrong(&self->_positionFromSignUpdatedHandler, 0);
  objc_storeStrong(&self->_rideSelectionsUpdatedHandler, 0);
  objc_storeStrong(&self->_stepIndexUpdatedHandler, 0);
  objc_storeStrong(&self->_activeRouteDetailsDataUpdatedHandler, 0);
  objc_storeStrong(&self->_guidanceStateUpdatedHandler, 0);
  objc_storeStrong(&self->_transitSummaryUpdatedHandler, 0);
  objc_storeStrong(&self->_routeSummaryUpdatedHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (GEONavigationListener)initWithQueue:(id)a3 wantsRoutes:(BOOL)a4
{
  GEONavigationListener *v5;
  GEONavigationListener *v6;
  GEONavigationListener *v7;

  v5 = -[GEONavigationListener initWithQueue:](self, "initWithQueue:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_wantsRoutes = a4;
    v7 = v5;
  }

  return v6;
}

- (void)requestRoute
{
  NSObject *queue;
  _QWORD block[5];

  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__GEONavigationListener_Private__requestRoute__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __46__GEONavigationListener_Private__requestRoute__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    objc_msgSend(v3, "remoteObjectProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestRoute");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v6, "navigationListener:didUpdateRoute:", *(_QWORD *)(a1 + 32), 0);
  }

}

- (void)requestETAUpdate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__GEONavigationListener_Private__requestETAUpdate__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__GEONavigationListener_Private__requestETAUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    objc_msgSend(v3, "remoteObjectProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestETAUpdate");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v6, "navigationListener:didUpdateETA:", *(_QWORD *)(a1 + 32), 0);
  }

}

- (GEOLocation)lastLocation
{
  return self->_lastLocation;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

@end
