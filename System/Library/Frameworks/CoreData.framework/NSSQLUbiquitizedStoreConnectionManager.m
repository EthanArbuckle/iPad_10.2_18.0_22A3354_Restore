@implementation NSSQLUbiquitizedStoreConnectionManager

- (NSSQLUbiquitizedStoreConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5
{
  NSSQLUbiquitizedStoreConnectionManager *v7;
  NSSQLiteConnection *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSQLUbiquitizedStoreConnectionManager;
  v7 = -[NSSQLConnectionManager initWithSQLCore:priority:seedConnection:](&v10, sel_initWithSQLCore_priority_seedConnection_, a3, a4);
  if (v7)
  {
    if (a5)
      v8 = (NSSQLiteConnection *)a5;
    else
      v8 = -[NSSQLiteConnection initForSQLCore:]([NSSQLiteConnection alloc], "initForSQLCore:", a3);
    v7->_connection = v8;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_connection = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLUbiquitizedStoreConnectionManager;
  -[NSSQLConnectionManager dealloc](&v3, sel_dealloc);
}

- (void)disconnectAllConnections
{
  NSSQLiteConnection *connection;
  _QWORD v3[5];

  connection = self->_connection;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__NSSQLUbiquitizedStoreConnectionManager_disconnectAllConnections__block_invoke;
  v3[3] = &unk_1E1EDD520;
  v3[4] = self;
  -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v3);
}

void __66__NSSQLUbiquitizedStoreConnectionManager_disconnectAllConnections__block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  NSSQLiteConnection *connection;
  _QWORD v4[5];
  BOOL v5;

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__NSSQLUbiquitizedStoreConnectionManager_setExclusiveLockingMode___block_invoke;
  v4[3] = &unk_1E1EDE5B8;
  v4[4] = self;
  v5 = a3;
  -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v4);
}

uint64_t __66__NSSQLUbiquitizedStoreConnectionManager_setExclusiveLockingMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setExclusiveLockingMode:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)handleStoreRequest:(id)a3
{
  NSObject *current_queue;
  NSSQLiteConnection *context;
  NSSQLiteConnection *connection;
  char v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  current_queue = dispatch_get_current_queue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  context = (NSSQLiteConnection *)dispatch_get_context(current_queue);
  connection = self->_connection;
  if (context == connection)
  {
    -[NSSQLiteConnection connect]((uint64_t)context);
    v8 = objc_msgSend(a3, "executeRequestUsingConnection:", self->_connection);
    *((_BYTE *)v12 + 24) = v8;
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__NSSQLUbiquitizedStoreConnectionManager_handleStoreRequest___block_invoke;
    v10[3] = &unk_1E1EDE1C8;
    v10[5] = a3;
    v10[6] = &v11;
    v10[4] = self;
    -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v10);
    v8 = *((_BYTE *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __61__NSSQLUbiquitizedStoreConnectionManager_handleStoreRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  -[NSSQLiteConnection connect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  result = objc_msgSend(*(id *)(a1 + 40), "executeRequestUsingConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)scheduleBarrierBlock:(id)a3
{
  NSSQLiteConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__NSSQLUbiquitizedStoreConnectionManager_scheduleBarrierBlock___block_invoke;
  v4[3] = &unk_1E1EDFF40;
  v4[4] = a3;
  -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v4);
}

uint64_t __63__NSSQLUbiquitizedStoreConnectionManager_scheduleBarrierBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scheduleConnectionsBarrier:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__NSSQLUbiquitizedStoreConnectionManager_scheduleConnectionsBarrier___block_invoke;
  v3[3] = &unk_1E1EDE8A0;
  v3[4] = self;
  v3[5] = a3;
  -[NSSQLUbiquitizedStoreConnectionManager scheduleBarrierBlock:](self, "scheduleBarrierBlock:", v3);
}

uint64_t __69__NSSQLUbiquitizedStoreConnectionManager_scheduleConnectionsBarrier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

@end
