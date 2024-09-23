@implementation _GEOProgressForSendingOverXPC

- (_GEOProgressForSendingOverXPC)initWithMirroredProgress:(id)a3
{
  id v4;
  void *v5;
  OS_xpc_object *v6;
  OS_xpc_object *connection;
  NSMutableArray *v8;
  NSMutableArray *remoteConnections;
  _GEOProgressForSendingOverXPC *v10;
  OS_xpc_object *v11;
  xpc_endpoint_t v12;
  OS_xpc_object *endpoint;
  _GEOProgressForSendingOverXPC *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  _GEOProgressForSendingOverXPC *v27;
  objc_super v28;

  v4 = a3;
  if (v4
    && (v28.receiver = self,
        v28.super_class = (Class)_GEOProgressForSendingOverXPC,
        (self = -[_GEOMirroredProgress _initWithMirroredProgressForSubclasses:](&v28, sel__initWithMirroredProgressForSubclasses_, v4)) != 0))
  {
    geo_dispatch_queue_create_with_workloop_qos();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_queue, v5);
    v6 = xpc_connection_create(0, (dispatch_queue_t)self->_queue);
    connection = self->_connection;
    self->_connection = v6;

    if (self->_connection)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      remoteConnections = self->_remoteConnections;
      self->_remoteConnections = v8;

      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__48;
      v26 = __Block_byref_object_dispose__48;
      v10 = self;
      v27 = v10;
      v11 = self->_connection;
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke;
      v19 = &unk_1E1C0C920;
      v21 = &v22;
      v20 = v5;
      xpc_connection_set_event_handler(v11, &v16);
      v12 = xpc_endpoint_create(self->_connection);
      endpoint = v10->_endpoint;
      v10->_endpoint = v12;

      xpc_connection_activate(self->_connection);
      objc_msgSend((id)v23[5], "_registerForKVO", v16, v17, v18, v19);
      objc_msgSend((id)v23[5], "_update");
      v14 = v10;

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_GEOProgressForSendingOverXPC)initWithMirroredProgress:(id)a3 endpoint:(id)a4
{
  id v6;
  _xpc_endpoint_s *v7;
  _xpc_endpoint_s *v8;
  _GEOProgressForSendingOverXPC *v9;
  void *v10;
  OS_xpc_object *v11;
  OS_xpc_object *connection;
  OS_xpc_object *v13;
  NSMutableArray *v14;
  NSMutableArray *remoteConnections;
  _GEOProgressForSendingOverXPC *v16;
  OS_xpc_object *v17;
  _QWORD handler[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  _GEOProgressForSendingOverXPC *v25;
  objc_super v26;

  v6 = a3;
  v7 = (_xpc_endpoint_s *)a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v26.receiver = self;
    v26.super_class = (Class)_GEOProgressForSendingOverXPC;
    self = -[_GEOMirroredProgress _initWithMirroredProgressForSubclasses:](&v26, sel__initWithMirroredProgressForSubclasses_, v6);
    if (self)
    {
      geo_dispatch_queue_create_with_workloop_qos();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_queue, v10);
      objc_storeStrong((id *)&self->_endpoint, a4);
      v11 = xpc_connection_create_from_endpoint(v8);
      connection = self->_connection;
      self->_connection = v11;

      v13 = self->_connection;
      if (v13)
      {
        xpc_connection_set_target_queue(v13, (dispatch_queue_t)self->_queue);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        remoteConnections = self->_remoteConnections;
        self->_remoteConnections = v14;

        -[NSMutableArray addObject:](self->_remoteConnections, "addObject:", self->_connection);
        v20 = 0;
        v21 = &v20;
        v22 = 0x3032000000;
        v23 = __Block_byref_object_copy__48;
        v24 = __Block_byref_object_dispose__48;
        v16 = self;
        v25 = v16;
        v17 = self->_connection;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __67___GEOProgressForSendingOverXPC_initWithMirroredProgress_endpoint___block_invoke;
        handler[3] = &unk_1E1C0C8F8;
        handler[4] = &v20;
        xpc_connection_set_event_handler(v17, handler);
        xpc_connection_activate(self->_connection);
        objc_msgSend((id)v21[5], "_registerForKVO");
        objc_msgSend((id)v21[5], "_update");
        v9 = v16;
        _Block_object_dispose(&v20, 8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    xpc_connection_cancel(connection);
  v4.receiver = self;
  v4.super_class = (Class)_GEOProgressForSendingOverXPC;
  -[_GEOMirroredProgress dealloc](&v4, sel_dealloc);
}

- (void)_update
{
  NSObject *queue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GEOProgressForSendingOverXPC;
  -[_GEOMirroredProgress _update](&v11, sel__update);
  queue = self->_queue;
  if (queue)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__48;
    v9 = __Block_byref_object_dispose__48;
    v10 = 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40___GEOProgressForSendingOverXPC__update__block_invoke;
    v4[3] = &unk_1E1C00760;
    v4[4] = self;
    v4[5] = &v5;
    dispatch_async_and_wait(queue, v4);
    -[_GEOProgressForSendingOverXPC _broadcastOverXPCConnections:](self, "_broadcastOverXPCConnections:", v6[5]);
    _Block_object_dispose(&v5, 8);

  }
}

- (void)_broadcastOverXPCConnections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[NSProgress _geo_mirroredProgressXPCDictionary](self, "_geo_mirroredProgressXPCDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          xpc_connection_send_message(*(xpc_connection_t *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)cancel
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39___GEOProgressForSendingOverXPC_cancel__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(queue, block);
    v4.receiver = self;
    v4.super_class = (Class)_GEOProgressForSendingOverXPC;
    -[_GEOProgressForSendingOverXPC cancel](&v4, sel_cancel);
  }
}

- (void)_connectionDidInvalidate
{
  OS_xpc_object *v3;
  void *v4;
  OS_xpc_object *connection;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_queue)
  {
    v3 = self->_connection;
    v4 = (void *)-[NSMutableArray copy](self->_remoteConnections, "copy");
    connection = self->_connection;
    self->_connection = 0;

    -[NSMutableArray removeAllObjects](self->_remoteConnections, "removeAllObjects");
    if (v3)
      xpc_connection_cancel(v3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          xpc_connection_cancel(*(xpc_connection_t *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    if ((-[_GEOProgressForSendingOverXPC isFinished](self, "isFinished") & 1) == 0)
      geo_dispatch_async_qos();

  }
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
