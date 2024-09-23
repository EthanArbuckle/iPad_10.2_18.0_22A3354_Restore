@implementation AXDragManager

- (AXDragManager)initWithMachServiceName:(id)a3
{
  id v4;
  AXDragManager *v5;
  void *v6;
  AXDragEndpointVendor *v7;
  AXDragEndpointVendor *vendor;
  uint64_t v9;
  NSXPCListener *endpointListener;
  uint64_t v11;
  NSMutableArray *activeSessions;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *dragStateQueue;
  uint64_t v16;
  NSString *machServiceName;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AXDragManager;
  v5 = -[AXDragManager init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v4);
    v7 = -[AXDragEndpointVendor initWithXPCListener:]([AXDragEndpointVendor alloc], "initWithXPCListener:", v6);
    vendor = v5->_vendor;
    v5->_vendor = v7;

    -[AXDragEndpointVendor setDelegate:](v5->_vendor, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v9 = objc_claimAutoreleasedReturnValue();
    endpointListener = v5->_endpointListener;
    v5->_endpointListener = (NSXPCListener *)v9;

    -[NSXPCListener setDelegate:](v5->_endpointListener, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    activeSessions = v5->_activeSessions;
    v5->_activeSessions = (NSMutableArray *)v11;

    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-DragStateQueue"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    dragStateQueue = v5->_dragStateQueue;
    v5->_dragStateQueue = (OS_dispatch_queue *)v14;

    v5->_pidForDrag = -1;
    -[AXDragEndpointVendor resume](v5->_vendor, "resume");
    -[NSXPCListener resume](v5->_endpointListener, "resume");
    v16 = objc_msgSend(v4, "copy");
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v16;

  }
  return v5;
}

- (void)sessionWasTerminated:(id)a3
{
  -[NSMutableArray removeObject:](self->_activeSessions, "removeObject:", a3);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  char *v6;
  void *v7;
  AXDragSession *v8;
  NSObject *dragStateQueue;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[5];
  AXDragSession *v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  AXLogDragging();
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
    -[AXDragManager listener:shouldAcceptNewConnection:].cold.1(v5, v6);

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.backboardd.detachTouches"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    v8 = -[AXDragSession initWithDruidConnection:]([AXDragSession alloc], "initWithDruidConnection:", v5);
    -[AXDragSession setManager:](v8, "setManager:", self);
    -[NSMutableArray addObject:](self->_activeSessions, "addObject:", v8);
    dragStateQueue = self->_dragStateQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E76AB410;
    v13[4] = self;
    v14 = v8;
    v10 = v8;
    dispatch_async(dragStateQueue, v13);

    v11 = 1;
  }
  else
  {
    AXLogDragging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = objc_msgSend(v5, "processIdentifier");
      _os_log_impl(&dword_1BD892000, v10, OS_LOG_TYPE_DEFAULT, "Process %d, you are not druid. Go away.", buf, 8u);
    }
    v11 = 0;
  }

  return v11;
}

uint64_t __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);

  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "pidForDrag");
  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == -1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "abort");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_2(v2);

    objc_msgSend(*(id *)(a1 + 32), "setPidForDrag:", 0xFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "dragStartTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "setDragSession:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "resume");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*v2, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didStartDragForDragManager:", *v2);

    }
    objc_msgSend(*v2, "dragStartCompletionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*v2, "dragStartCompletionHandler");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10[2](v10, 1);

    }
  }
  return objc_msgSend(*v2, "setDragStartCompletionHandler:", 0);
}

- (BOOL)_shouldAllowEndpointVendForRequestingConnection:(id)a3
{
  id v4;
  NSObject *dragStateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke;
  block[3] = &unk_1E76AB480;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(dragStateQueue, block);
  LOBYTE(dragStateQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dragStateQueue;
}

void __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  id *v4;
  NSObject *v5;

  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "pidForDrag");
  v4 = (id *)(a1 + 40);
  if (v3 == objc_msgSend(*(id *)(a1 + 40), "processIdentifier"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    AXLogDragging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_1(v2);
  }
  else
  {
    AXLogDragging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_2(v4, v2, v5);
  }

}

- (id)endpointForRequestingConnection:(id)a3 fromEndpointVendor:(id)a4
{
  id v5;
  char *v6;
  void *v7;
  char *v8;

  v5 = a3;
  AXLogDragging();
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
    -[AXDragManager endpointForRequestingConnection:fromEndpointVendor:].cold.2(v5, v6);

  if (-[AXDragManager _shouldAllowEndpointVendForRequestingConnection:](self, "_shouldAllowEndpointVendForRequestingConnection:", v5))
  {
    -[NSXPCListener endpoint](self->_endpointListener, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogDragging();
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      -[AXDragManager endpointForRequestingConnection:fromEndpointVendor:].cold.1(v5, v8);

    v7 = 0;
  }

  return v7;
}

- (void)waitForDragStartFromPid:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *dragStateQueue;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;

  v6 = a4;
  AXLogDragging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AXDragManager waitForDragStartFromPid:completionHandler:].cold.1();

  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke;
  block[3] = &unk_1E76AB4A8;
  v12 = a3;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(dragStateQueue, block);

}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "setPidForDrag:", *(unsigned int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "dragStartCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    AXLogDragging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "dragStartCompletionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setDragStartCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "dragStartTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(a1 + 32), "setDragStartTimer:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "dragStartTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_187;
  v8[3] = &unk_1E76AB330;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "afterDelay:processBlock:", v8, 5.0);

}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_187(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  AXLogDragging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_187_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setPidForDrag:", 0xFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "dragStartCompletionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dragStartCompletionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
}

- (void)setDragSession:(id)a3
{
  AXDragSession *v5;
  AXDragSession *v6;
  AXDragSession **p_dragSession;
  AXDragSession *dragSession;
  AXDragSession *v9;

  v5 = (AXDragSession *)a3;
  dragSession = self->_dragSession;
  p_dragSession = &self->_dragSession;
  v6 = dragSession;
  if (dragSession != v5)
  {
    v9 = v5;
    -[AXDragSession cancel](v6, "cancel");
    objc_storeStrong((id *)p_dragSession, a3);
    v5 = v9;
  }

}

- (BOOL)isDragActive
{
  NSObject *dragStateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dragStateQueue = self->_dragStateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AXDragManager_isDragActive__block_invoke;
  v5[3] = &unk_1E76AB4D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dragStateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__AXDragManager_isDragActive__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "dragSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (void)cancelDrag
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1BD892000, v0, v1, "Cancel drag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __27__AXDragManager_cancelDrag__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dragSession");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");

}

- (void)moveToPoint:(CGPoint)a3
{
  NSObject *dragStateQueue;
  _QWORD block[5];
  CGPoint v5;

  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__AXDragManager_moveToPoint___block_invoke;
  block[3] = &unk_1E76AB520;
  block[4] = self;
  v5 = a3;
  dispatch_async(dragStateQueue, block);
}

void __29__AXDragManager_moveToPoint___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "dragSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__AXDragManager_moveToPoint___block_invoke_2;
  v6[3] = &unk_1E76AB4F8;
  v8 = *(_OWORD *)(a1 + 40);
  v7 = v2;
  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = v2;
  objc_msgSend(v5, "moveToPoint:forRequestor:completion:", 0, v6, v3, v4);

}

void __29__AXDragManager_moveToPoint___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;

  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __29__AXDragManager_moveToPoint___block_invoke_2_cold_1(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __29__AXDragManager_moveToPoint___block_invoke_2_cold_2();
  }

}

- (void)drop
{
  NSObject *dragStateQueue;
  _QWORD block[5];

  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__AXDragManager_drop__block_invoke;
  block[3] = &unk_1E76AB330;
  block[4] = self;
  dispatch_async(dragStateQueue, block);
}

void __21__AXDragManager_drop__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "dragSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "drop");

  AXLogDragging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __21__AXDragManager_drop__block_invoke_cold_1();

}

- (void)moveToAndDropAtPoint:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;
  NSObject *dragStateQueue;
  _QWORD block[7];

  y = a3.y;
  x = a3.x;
  AXLogDragging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AXDragManager moveToAndDropAtPoint:].cold.1(x, y);

  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AXDragManager_moveToAndDropAtPoint___block_invoke;
  block[3] = &unk_1E76AB520;
  block[4] = self;
  *(double *)&block[5] = x;
  *(double *)&block[6] = y;
  dispatch_async(dragStateQueue, block);
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "dragSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2;
  v6[3] = &unk_1E76AB548;
  v8 = *(_OWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = v2;
  objc_msgSend(v5, "moveToPoint:forRequestor:completion:", 0, v6, v3, v4);

}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;

  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_1((CGPoint *)a1);

    v6 = dispatch_time(0, 1000000000);
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__AXDragManager_moveToAndDropAtPoint___block_invoke_189;
    block[3] = &unk_1E76AB330;
    v10 = v7;
    dispatch_after(v6, v8, block);
    v5 = v10;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_2();
  }

}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_189(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "drop");
  AXLogDragging();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __21__AXDragManager_drop__block_invoke_cold_1();

}

- (void)dragSession:(id)a3 movedToPoint:(CGPoint)a4 byRequestor:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  NSObject *dragStateQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  AXDragManager *v13;
  CGFloat v14;
  CGFloat v15;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  dragStateQueue = self->_dragStateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke;
  v11[3] = &unk_1E76AB570;
  v12 = v8;
  v13 = self;
  v14 = x;
  v15 = y;
  v10 = v8;
  dispatch_async(dragStateQueue, v11);

}

void __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dragSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_2();
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_1((CGPoint *)a1);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragManager:didMoveDragToPoint:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
LABEL_8:

  }
}

- (void)dragSessionChanged:(id)a3 toStatus:(id)a4
{
  id v6;
  id v7;
  NSObject *dragStateQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AXDragManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AXDragManager_dragSessionChanged_toStatus___block_invoke;
  block[3] = &unk_1E76AB598;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dragStateQueue, block);

}

void __45__AXDragManager_dragSessionChanged_toStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dragSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_2();
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragManager:didChangeDragToStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_8:

  }
}

- (void)dragSessionEnded:(id)a3 withOperation:(unint64_t)a4
{
  id v6;
  NSObject *dragStateQueue;
  id v8;
  _QWORD block[4];
  id v10;
  AXDragManager *v11;
  unint64_t v12;

  v6 = a3;
  dragStateQueue = self->_dragStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AXDragManager_dragSessionEnded_withOperation___block_invoke;
  block[3] = &unk_1E76AB5C0;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(dragStateQueue, block);

}

void __48__AXDragManager_dragSessionEnded_withOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dragSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_2();
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragManager:didEndDragOperation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_8:

  }
}

- (void)dragSessionWasTerminated:(id)a3
{
  id v4;
  NSObject *dragStateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AXDragManager *v9;

  v4 = a3;
  dragStateQueue = self->_dragStateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AXDragManager_dragSessionWasTerminated___block_invoke;
  v7[3] = &unk_1E76AB410;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dragStateQueue, v7);

}

void __42__AXDragManager_dragSessionWasTerminated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dragSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 != v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_2();
    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "setDragSession:", 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didTerminateDragForDragManager:", *(_QWORD *)(a1 + 40));
LABEL_8:

  }
}

- (AXDragManagerDelegate)delegate
{
  return (AXDragManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (int)pidForDrag
{
  return self->_pidForDrag;
}

- (void)setPidForDrag:(int)a3
{
  self->_pidForDrag = a3;
}

- (id)dragStartCompletionHandler
{
  return self->_dragStartCompletionHandler;
}

- (void)setDragStartCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (AXDispatchTimer)dragStartTimer
{
  return self->_dragStartTimer;
}

- (void)setDragStartTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dragStartTimer, a3);
}

- (AXDragSession)dragSession
{
  return self->_dragSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->_dragStartTimer, 0);
  objc_storeStrong(&self->_dragStartCompletionHandler, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dragStateQueue, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_endpointListener, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14(a1, a2);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_1BD892000, v2, v3, "Got a proposed connection from pid %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

void __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1BD892000, v0, v1, "Drag session became ready, but we hadn't tried to start a drag.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __52__AXDragManager_listener_shouldAcceptNewConnection___block_invoke_cold_2(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_13(a1);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_1BD892000, v1, v2, "Drag session ready for pid: %i", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

void __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_13(a1);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_1BD892000, v1, v2, "Received endpoint request from connection with pid: %i", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

void __65__AXDragManager__shouldAllowEndpointVendForRequestingConnection___block_invoke_cold_2(id *a1, id *a2, NSObject *a3)
{
  int v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a1, "processIdentifier");
  v6 = objc_msgSend(*a2, "pidForDrag");
  v7[0] = 67109376;
  v7[1] = v5;
  v8 = 1024;
  v9 = v6;
  _os_log_error_impl(&dword_1BD892000, a3, OS_LOG_TYPE_ERROR, "Unexpectedly received endpoint request from connection with pid: %i. Expected pid: %i", (uint8_t *)v7, 0xEu);
}

- (void)endpointForRequestingConnection:(void *)a1 fromEndpointVendor:(char *)a2 .cold.1(void *a1, char *a2)
{
  uint8_t v3[8];

  OUTLINED_FUNCTION_14(a1, a2);
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1BD892000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Not giving app with pid %d a drag endpoint.", v3, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)endpointForRequestingConnection:(void *)a1 fromEndpointVendor:(const char *)a2 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14(a1, a2);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_1BD892000, v2, v3, "app with pid %d is asking for a drag endpoint", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)waitForDragStartFromPid:completionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1BD892000, v0, OS_LOG_TYPE_DEBUG, "Wait for drag start from pid: %i", v1, 8u);
  OUTLINED_FUNCTION_6();
}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1BD892000, v0, v1, "Had a drag start completion handler that did not get called before next attempt to wait for a drag start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __59__AXDragManager_waitForDragStartFromPid_completionHandler___block_invoke_187_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1BD892000, v0, v1, "Unable to start drag within allowed time.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__AXDragManager_moveToPoint___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromCGPoint(*(CGPoint *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v2, v3, "Moved to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __29__AXDragManager_moveToPoint___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Unable to move for session %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __21__AXDragManager_drop__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1BD892000, v0, v1, "Dropped dragged item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)moveToAndDropAtPoint:(double)a1 .cold.1(double a1, double a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromCGPoint(*(CGPoint *)&a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v3, v4, "Move to %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_1(CGPoint *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromCGPoint(a1[3]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v2, v3, "Moved to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __38__AXDragManager_moveToAndDropAtPoint___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Unable to move for session %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_1(CGPoint *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromCGPoint(a1[3]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0(&dword_1BD892000, v2, v3, "Drag moved to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __54__AXDragManager_dragSession_movedToPoint_byRequestor___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Received moved to point callback from unknown drag session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD892000, v0, v1, "Drag status changed to %@", v2);
  OUTLINED_FUNCTION_3();
}

void __45__AXDragManager_dragSessionChanged_toStatus___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Received changed callback from unknown drag session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD892000, v0, v1, "Drag session ended with operation %lu", v2);
  OUTLINED_FUNCTION_3();
}

void __48__AXDragManager_dragSessionEnded_withOperation___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Received session ended callback from unknown drag session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1BD892000, v0, v1, "Drag session was terminated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __42__AXDragManager_dragSessionWasTerminated___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, v0, v1, "Received terminated callback from unknown drag session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
