@implementation AXSpringBoardServerAlertManager

- (void)showAXUIViewService:(id)a3 withData:(id)a4 withPreviousViewDismissal:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v5
    && (-[AXSpringBoardServerAlertManager handlesByService](self, "handlesByService"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[AXSpringBoardServerAlertManager handlesByService](self, "handlesByService", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
          -[AXSpringBoardServerAlertManager handlesByService](self, "handlesByService");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "invalidate");
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    -[AXSpringBoardServerAlertManager scheduleShowAXUIViewService:withData:](self, "scheduleShowAXUIViewService:withData:", v8, v9);
  }
  else
  {
    -[AXSpringBoardServerAlertManager showAXUIViewService:withData:](self, "showAXUIViewService:withData:", v8, v9);
  }

}

- (void)scheduleShowAXUIViewService:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = dispatch_time(0, 250000000);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__AXSpringBoardServerAlertManager_scheduleShowAXUIViewService_withData___block_invoke;
  v11[3] = &unk_24DDE68E8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__AXSpringBoardServerAlertManager_scheduleShowAXUIViewService_withData___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "handlesByService", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_loadWeakRetained(v2);
        objc_msgSend(v11, "handlesByService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v13, "isValid"))
        {
          v14 = objc_loadWeakRetained(v2);
          objc_msgSend(v14, "showAXUIViewService:withData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

          goto LABEL_11;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "scheduleShowAXUIViewService:withData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_11:

}

- (void)showAXUIViewService:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sb_alertDefinition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
  objc_msgSend(v9, "setUserInfo:", v6);
  AXLogUIViewService();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "serviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerClassName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_21AC77000, v10, OS_LOG_TYPE_INFO, "Activating remote alert service: %@, class: %@", (uint8_t *)&v19, 0x16u);

  }
  AXLogUIViewService();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[AXSpringBoardServerAlertManager showAXUIViewService:withData:].cold.1((uint64_t)v6, v13);

  v14 = (void *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v8, v9);
  objc_msgSend(v14, "registerObserver:", self);
  objc_msgSend(v14, "activateWithContext:", 0);
  -[AXSpringBoardServerAlertManager handlesByService](self, "handlesByService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServerAlertManager setHandlesByService:](self, "setHandlesByService:", v16);

  }
  -[AXSpringBoardServerAlertManager handlesByService](self, "handlesByService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v18);
}

- (void)hideAXUIViewService:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUIViewService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_INFO, "Hiding remote alert service: %@", (uint8_t *)&v9, 0xCu);
  }

  -[AXSpringBoardServerAlertManager handlesByService](self, "handlesByService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

}

- (BOOL)isShowingAXUIViewService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[AXSpringBoardServerAlertManager handlesByService](self, "handlesByService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  return v8;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogUIViewService();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21AC77000, v4, OS_LOG_TYPE_INFO, "Remote alert handle did activate: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogUIViewService();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21AC77000, v4, OS_LOG_TYPE_INFO, "Remote alert handle did deactivate: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  AXLogUIViewService();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_21AC77000, v7, OS_LOG_TYPE_INFO, "Remote alert handle did invalidate: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v6)
  {
    AXLogUIViewService();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSpringBoardServerAlertManager remoteAlertHandle:didInvalidateWithError:].cold.1((uint64_t)v6, v8);

  }
}

- (NSMutableDictionary)handlesByService
{
  return self->_handlesByService;
}

- (void)setHandlesByService:(id)a3
{
  objc_storeStrong((id *)&self->_handlesByService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlesByService, 0);
}

- (void)showAXUIViewService:(uint64_t)a1 withData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21AC77000, a2, OS_LOG_TYPE_DEBUG, "withData: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteAlertHandle:(uint64_t)a1 didInvalidateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21AC77000, a2, OS_LOG_TYPE_ERROR, "Remote alert handle did invalidate with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
