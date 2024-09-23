@implementation _INVocabularyConnection

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (id)settingsService
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__66162;
  v10 = __Block_byref_object_dispose__66163;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___INVocabularyConnection_settingsService__block_invoke;
  v5[3] = &unk_1E228F138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_connect
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id from;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.vocabularyupdates"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0B8530);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    objc_initWeak(&from, self->_connection);
    v8 = self->_connection;
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __35___INVocabularyConnection__connect__block_invoke;
    v18[3] = &unk_1E228F110;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(&v20, &from);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v18);
    v10 = self->_connection;
    v12 = v9;
    v13 = 3221225472;
    v14 = __35___INVocabularyConnection__connect__block_invoke_69;
    v15 = &unk_1E228F110;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    self->_connectionValid = 1;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (_INVocabularyConnection)init
{
  _INVocabularyConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_INVocabularyConnection;
  v2 = -[_INVocabularyConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("INVocabularyConnectionQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_connectionValid = 0;
  }
  return v2;
}

- (void)_clearConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___INVocabularyConnection__clearConnection__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  objc_super v3;

  -[_INVocabularyConnection _clearConnection](self, "_clearConnection");
  v3.receiver = self;
  v3.super_class = (Class)_INVocabularyConnection;
  -[_INVocabularyConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
