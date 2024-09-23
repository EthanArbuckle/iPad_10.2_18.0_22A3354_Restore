@implementation AVBorealisServerHysteresisNotifier

- (AVBorealisServerHysteresisNotifier)initWithSerialQueue:(id)a3
{
  id v5;
  AVBorealisServerHysteresisNotifier *v6;
  AVBorealisServerHysteresisNotifier *v7;
  NSMutableArray *v8;
  NSMutableArray *portsToMonitor;
  NSMutableArray *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  NSMutableArray *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVBorealisServerHysteresisNotifier;
  v6 = -[AVBorealisServerHysteresisNotifier init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    portsToMonitor = v7->_portsToMonitor;
    v7->_portsToMonitor = v8;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v7->_portsToMonitor;
      *(_DWORD *)buf = 136315650;
      v14 = "AVBorealisServer.mm";
      v15 = 1024;
      v16 = 345;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d portMontior list: %p", buf, 0x1Cu);
    }
  }

  return v7;
}

- (void)dealloc
{
  NSMutableArray *portsToMonitor;
  OS_dispatch_queue *queue;
  objc_super v5;

  -[NSMutableArray removeAllObjects](self->_portsToMonitor, "removeAllObjects");
  portsToMonitor = self->_portsToMonitor;
  self->_portsToMonitor = 0;

  queue = self->_queue;
  self->_queue = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVBorealisServerHysteresisNotifier;
  -[AVBorealisServerHysteresisNotifier dealloc](&v5, sel_dealloc);
}

- (void)stateChanged:(BOOL)a3 forPort:(id)a4
{
  objc_msgSend(a4, "notifyStateChanged:onQueue:", a3, self->_queue);
}

- (void)stateChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AVBorealisServerHysteresisNotifier getPortManagerForType:](self, "getPortManagerForType:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVBorealisServerHysteresisNotifier stateChanged:forPort:](self, "stateChanged:forPort:", v3);

}

- (void)sendState:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVBorealisServerHysteresisNotifier_sendState___block_invoke;
  block[3] = &unk_1E4516D60;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (id)getPortManagerForType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AVBorealisServerHysteresisNotifier portsToMonitor](self, "portsToMonitor", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "portType") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)isPortActive:(unint64_t)a3 activePortsToken:(unint64_t)a4
{
  unint64_t v4;

  v4 = (a4 >> 1) & 1;
  if (a3 != 1)
    LOBYTE(v4) = 0;
  if (a3 == 2)
    return (a4 & 0xC) != 0;
  else
    return v4;
}

- (void)processState:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  __int128 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  _BOOL4 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AVBorealisServerHysteresisNotifier portsToMonitor](self, "portsToMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v6)
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 136315906;
    v14 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = -[AVBorealisServerHysteresisNotifier isPortActive:activePortsToken:](self, "isPortActive:activePortsToken:", objc_msgSend(v11, "portType", v14), a3);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v13 = objc_msgSend(v11, "portType");
          *(_DWORD *)buf = v14;
          v20 = "AVBorealisServer.mm";
          v21 = 1024;
          v22 = 415;
          v23 = 2048;
          v24 = v13;
          v25 = 1024;
          v26 = v12;
          _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d State may have changed for port: %lu current state: %d", buf, 0x22u);
        }
        -[AVBorealisServerHysteresisNotifier stateChanged:forPort:](self, "stateChanged:forPort:", v12, v11);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v6);
  }

}

- (id)addPortToMonitor:(unint64_t)a3 hysteresisDurationSeconds:(float)a4 notificationBlock:(id)a5
{
  id v8;
  AVBorealisServerPortManager *v9;
  AVBorealisServerPortManager *v10;
  double v11;

  v8 = a5;
  -[AVBorealisServerHysteresisNotifier getPortManagerForType:](self, "getPortManagerForType:", a3);
  v9 = (AVBorealisServerPortManager *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = [AVBorealisServerPortManager alloc];
    *(float *)&v11 = a4;
    v9 = -[AVBorealisServerPortManager initWithPortType:hysteresisDurationSeconds:notificationBlock:](v10, "initWithPortType:hysteresisDurationSeconds:notificationBlock:", a3, v8, v11);
    -[NSMutableArray addObject:](self->_portsToMonitor, "addObject:", v9);
  }

  return v9;
}

- (void)removePortToMonitor:(unint64_t)a3
{
  id v4;

  -[AVBorealisServerHysteresisNotifier getPortManagerForType:](self, "getPortManagerForType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray removeObject:](self->_portsToMonitor, "removeObject:", v4);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)portsToMonitor
{
  return self->_portsToMonitor;
}

- (void)setPortsToMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_portsToMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portsToMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __48__AVBorealisServerHysteresisNotifier_sendState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callNotificationBlock:", objc_msgSend(*(id *)(a1 + 32), "lastStateSent"));
}

@end
