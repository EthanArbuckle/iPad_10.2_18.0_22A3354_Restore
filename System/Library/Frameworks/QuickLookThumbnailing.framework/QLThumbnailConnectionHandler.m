@implementation QLThumbnailConnectionHandler

+ (id)serviceXPCInterface
{
  if (serviceXPCInterface_onceToken != -1)
    dispatch_once(&serviceXPCInterface_onceToken, &__block_literal_global_6);
  return (id)serviceXPCInterface___interface;
}

void __51__QLThumbnailConnectionHandler_serviceXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED929F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceXPCInterface___interface;
  serviceXPCInterface___interface = v0;

  v2 = (void *)serviceXPCInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_generateThumbnailForRequest_completionHandler_, 0, 0);

  v4 = (void *)serviceXPCInterface___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_generateThumbnailForRequest_completionHandler_, 0, 1);

}

+ (id)hostXPCInterface
{
  if (hostXPCInterface_onceToken != -1)
    dispatch_once(&hostXPCInterface_onceToken, &__block_literal_global_48);
  return (id)hostXPCInterface___interface;
}

void __48__QLThumbnailConnectionHandler_hostXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED97420);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hostXPCInterface___interface;
  hostXPCInterface___interface = v0;

}

- (QLThumbnailConnectionHandler)initWithPrincipalObject:(id)a3
{
  id v5;
  QLThumbnailConnectionHandler *v6;
  QLThumbnailConnectionHandler *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *generationQueue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *replyQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QLThumbnailConnectionHandler;
  v6 = -[QLThumbnailConnectionHandler init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_principalObject, a3);
    v8 = MEMORY[0x1E0C80D50];
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.quicklook.thumbnail.connectionhandler.generation", v9);
    generationQueue = v7->_generationQueue;
    v7->_generationQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.quicklook.thumbnail.connectionhandler.reply", v12);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v13;

  }
  return v7;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[QLThumbnailConnectionHandler serviceXPCInterface](QLThumbnailConnectionHandler, "serviceXPCInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);

  objc_msgSend(v4, "setExportedObject:", self);
  +[QLThumbnailConnectionHandler hostXPCInterface](QLThumbnailConnectionHandler, "hostXPCInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v6);

  objc_msgSend(v4, "activate");
  return 1;
}

- (void)generateThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  QLThumbnailConnectionHandler *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailConnectionHandler generationQueue](self, "generationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E5D7C770;
  v14 = v6;
  v15 = self;
  v16 = v8;
  v17 = v7;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAccessingIfNeeded");

  objc_msgSend(a1[5], "principalObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5D7C748;
  v5 = *((int8x16_t *)a1 + 2);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v9 = a1[7];
  v8 = a1[6];
  objc_msgSend(v3, "provideThumbnailForFileRequest:completionHandler:", v4, v6);

}

void __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E5D7C720;
  v11 = v6;
  v12 = a1[5];
  v15 = a1[7];
  v13 = v5;
  v14 = a1[6];
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  QLServiceThumbnailRenderer *v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "item");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cleanup");

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = -[QLServiceThumbnailRenderer initWithRequest:reply:connection:completionHandler:]([QLServiceThumbnailRenderer alloc], "initWithRequest:reply:connection:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    -[QLServiceThumbnailRenderer generateThumbnailAndPerformCompletionHandler](v3, "generateThumbnailAndPerformCompletionHandler");

  }
}

- (id)principalObject
{
  return self->_principalObject;
}

- (void)setPrincipalObject:(id)a3
{
  objc_storeStrong(&self->_principalObject, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (void)setGenerationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_generationQueue, a3);
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_replyQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_principalObject, 0);
}

@end
