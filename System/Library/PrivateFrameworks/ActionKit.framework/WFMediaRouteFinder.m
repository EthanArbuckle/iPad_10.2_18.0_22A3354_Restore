@implementation WFMediaRouteFinder

- (WFMediaRouteFinder)initWithPicker:(id)a3 routeDescriptor:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  WFMediaRouteFinder *v13;
  WFMediaRouteFinder *v14;
  uint64_t v15;
  id completionHandler;
  WFMediaRouteFinder *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFMediaRouteFinder;
  v13 = -[WFMediaRouteFinder init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_picker, v10);
    objc_storeStrong((id *)&v14->_routeDescriptor, a4);
    v15 = objc_msgSend(v12, "copy");
    completionHandler = v14->_completionHandler;
    v14->_completionHandler = (id)v15;

    v14->_timeout = a5;
    v17 = v14;
  }

  return v14;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  WFDispatchSourceTimer *v18;
  WFDispatchSourceTimer *timer;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  WFMediaRouteFinder *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[WFMediaRouteFinder routeDescriptor](self, "routeDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v27 = "-[WFMediaRouteFinder start]";
    v28 = 2112;
    v29 = v4;
    v30 = 2112;
    v31 = self;
    _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_INFO, "%s Finding route matching %@ for %@", buf, 0x20u);

  }
  -[WFMediaRouteFinder routeDescriptor](self, "routeDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMediaRouteFinder routeDescriptor](self, "routeDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFMediaRouteFinder start]";
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_INFO, "%s Requested route has a route UID... Attempting to connect via Bluetooth (if applicable)", buf, 0xCu);
    }

    -[WFMediaRouteFinder picker](self, "picker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMediaRouteFinder routeDescriptor](self, "routeDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __27__WFMediaRouteFinder_start__block_invoke;
    v23[3] = &unk_24F8BA068;
    v24 = v6;
    v25 = v8;
    objc_msgSend(v11, "getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:", v12, v23);

  }
  objc_initWeak((id *)buf, self);
  v13 = objc_alloc(MEMORY[0x24BEC1478]);
  -[WFMediaRouteFinder timeout](self, "timeout");
  v15 = v14;
  -[WFMediaRouteFinder picker](self, "picker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __27__WFMediaRouteFinder_start__block_invoke_160;
  v21[3] = &unk_24F8B76C8;
  objc_copyWeak(&v22, (id *)buf);
  v18 = (WFDispatchSourceTimer *)objc_msgSend(v13, "initWithInterval:queue:handler:", v17, v21, v15);
  timer = self->_timer;
  self->_timer = v18;

  -[WFDispatchSourceTimer start](self->_timer, "start");
  -[WFMediaRouteFinder picker](self, "picker");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAvailableRoutesObserver:", self);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

- (void)finishWithMatchingRoute:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**completionHandler)(id, id, id);
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[WFMediaRouteFinder timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[WFMediaRouteFinder picker](self, "picker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAvailableRoutesObserver:", self);

  completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v11, v6);
    v10 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)routePickerDidUpdateAvailableRoutes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFMediaRouteFinder routeDescriptor](self, "routeDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableRoutes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "findMatchingRoute:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && self->_completionHandler)
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[WFMediaRouteFinder routePickerDidUpdateAvailableRoutes:]";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Found route %@", (uint8_t *)&v9, 0x16u);
    }

    -[WFMediaRouteFinder finishWithMatchingRoute:error:](self, "finishWithMatchingRoute:error:", v7, 0);
  }

}

- (WFMediaRoutePicker)picker
{
  return (WFMediaRoutePicker *)objc_loadWeakRetained((id *)&self->_picker);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (WFMediaRouteDescriptor)routeDescriptor
{
  return self->_routeDescriptor;
}

- (double)timeout
{
  return self->_timeout;
}

- (WFDispatchSourceTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_routeDescriptor, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_picker);
}

void __27__WFMediaRouteFinder_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  getWFActionsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v21 = "-[WFMediaRouteFinder start]_block_invoke";
      v22 = 2113;
      v23 = v3;
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_INFO, "%s Found bluetooth devices %{private}@", buf, 0x16u);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          getWFActionsLogObject();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315395;
            v21 = "-[WFMediaRouteFinder start]_block_invoke";
            v22 = 2113;
            v23 = v11;
            _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_INFO, "%s Attempting to connect to %{private}@", buf, 0x16u);
          }

          if ((objc_msgSend(v11, "connected") & 1) == 0)
            objc_msgSend(v11, "connect");
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315651;
    v21 = "-[WFMediaRouteFinder start]_block_invoke";
    v22 = 2113;
    v23 = v13;
    v24 = 2113;
    v25 = v14;
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_ERROR, "%s Could not find bluetooth device (%{private}@) matching UID: %{private}@", buf, 0x20u);
  }

}

void __27__WFMediaRouteFinder_start__block_invoke_160(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "timer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isCancelled");

    if ((v4 & 1) == 0)
    {
      getWFActionsLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v2, "timeout");
        v12 = 136315394;
        v13 = "-[WFMediaRouteFinder start]_block_invoke";
        v14 = 2048;
        v15 = v6;
        _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_ERROR, "%s Finding route timed out after %f seconds", (uint8_t *)&v12, 0x16u);
      }

      v7 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v2, "routeDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "routeName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WFMediaRoutePickerInjectRouteNameInUserInfoIfPossible(v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WFMediaRoutePickerErrorDomain"), 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "finishWithMatchingRoute:error:", 0, v11);
    }
  }

}

@end
