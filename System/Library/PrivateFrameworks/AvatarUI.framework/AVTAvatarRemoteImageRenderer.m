@implementation AVTAvatarRemoteImageRenderer

- (AVTAvatarRemoteImageRenderer)init
{
  void *v3;
  AVTAvatarRemoteImageRenderer *v4;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTAvatarRemoteImageRenderer initWithEnvironment:](self, "initWithEnvironment:", v3);

  return v4;
}

- (AVTAvatarRemoteImageRenderer)initWithEnvironment:(id)a3
{
  id v4;
  AVTAvatarRemoteImageRenderer *v5;
  uint64_t v6;
  AVTUILogger *logger;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarRemoteImageRenderer;
  v5 = -[AVTAvatarRemoteImageRenderer init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    logger = v5->_logger;
    v5->_logger = (AVTUILogger *)v6;

  }
  return v5;
}

- (id)_setupConnection
{
  AVTAvatarRemoteImageRenderer *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MemojiImageRenderService"));
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F03F3DA8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    objc_initWeak(&location, v2);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2050000000;
    v10[3] = v2->_connection;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__AVTAvatarRemoteImageRenderer__setupConnection__block_invoke;
    v8[3] = &unk_1EA51E730;
    objc_copyWeak(&v9, &location);
    v8[4] = v10;
    v6 = (void *)MEMORY[0x1DF0D0754](v8);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v6);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v6);
    -[NSXPCConnection resume](v2->_connection, "resume");

    objc_destroyWeak(&v9);
    _Block_object_dispose(v10, 8);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v2->_connection;
}

void __48__AVTAvatarRemoteImageRenderer__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = (void *)v3[1];
    if (v4 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v3[1] = 0;

    }
    objc_sync_exit(v3);

    WeakRetained = v5;
  }

}

- (void)_tearDownService
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)_startRequestWithRetryCount:(unint64_t)a3 withReply:(id)a4 connectionRequestHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD *v18;
  id v19[2];
  id location;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v8 = a4;
  v9 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2050000000;
  v25[3] = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v24 = 0;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__AVTAvatarRemoteImageRenderer__startRequestWithRetryCount_withReply_connectionRequestHandler___block_invoke;
  v13[3] = &unk_1EA51E758;
  objc_copyWeak(v19, &location);
  v16 = &v21;
  v10 = v8;
  v13[4] = self;
  v14 = v10;
  v17 = v25;
  v18 = v26;
  v19[1] = (id)a3;
  v11 = v9;
  v15 = v11;
  v12 = (void (**)(_QWORD, _QWORD))objc_msgSend(v13, "copy");
  v22[3] = (uint64_t)v12;
  v12[2](v12, 0);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);

}

void __95__AVTAvatarRemoteImageRenderer__startRequestWithRetryCount_withReply_connectionRequestHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = (void *)MEMORY[0x1DF0D0754](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  if (!WeakRetained)
    goto LABEL_6;
  if (!v8)
    goto LABEL_7;
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  v6 = (void *)*((_QWORD *)WeakRetained + 1);
  if (v6 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *((_QWORD *)WeakRetained + 1) = 0;

  }
  objc_sync_exit(v5);

  objc_msgSend(*((id *)WeakRetained + 2), "logImageRenderServiceConnectionError:", v8);
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) <= *(_QWORD *)(a1 + 88))
  {
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (id)objc_msgSend(WeakRetained, "_setupConnection");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)getSnapshotForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSXPCConnection *connection;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[AVTAvatarRemoteImageRenderer _setupConnection](self, "_setupConnection");
  v12 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke;
  v18[3] = &unk_1EA51E780;
  v18[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke_2;
  v16[3] = &unk_1EA51E7A8;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "requestImageForAvatar:scope:withReply:", v10, v9, v16);

}

uint64_t __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logImageRenderServiceConnectionError:", a2);
}

uint64_t __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSnapshotForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSXPCConnection *connection;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[AVTAvatarRemoteImageRenderer _setupConnection](self, "_setupConnection");
  v15 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke;
  v21[3] = &unk_1EA51E780;
  v21[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke_2;
  v19[3] = &unk_1EA51E7A8;
  v20 = v10;
  v18 = v10;
  objc_msgSend(v17, "requestImageForAvatar:scope:withModifications:withReply:", v13, v12, v11, v19);

}

uint64_t __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logImageRenderServiceConnectionError:", a2);
}

uint64_t __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSnapshotAndCacheForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSXPCConnection *connection;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[AVTAvatarRemoteImageRenderer _setupConnection](self, "_setupConnection");
  v12 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke;
  v18[3] = &unk_1EA51E780;
  v18[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke_2;
  v16[3] = &unk_1EA51E7D0;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "generateAndCacheImageForAvatarRecord:scope:withReply:", v10, v9, v16);

}

uint64_t __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logImageRenderServiceConnectionError:", a2);
}

void __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logRetrievingSnapshotInServiceForPath:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(v7, "initWithData:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_requestStickerAndCacheWithProxy:(id)a3 avatarRecord:(id)a4 stickerPackName:(id)a5 stickerConfigurationName:(id)a6 resource:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVTUILogger logRequestedAnimojiSticker:](self->_logger, "logRequestedAnimojiSticker:", v17);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke;
    v25[3] = &unk_1EA51E330;
    v20 = &v26;
    v26 = v19;
    v21 = v19;
    objc_msgSend(v14, "requestAnimojiStickerImageForAvatarRecord:withStickerPackName:stickerConfigurationName:resource:withReply:", v15, v16, v17, v18, v25);
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke_2;
    v23[3] = &unk_1EA51E330;
    v20 = &v24;
    v24 = v19;
    v22 = v19;
    objc_msgSend(v14, "requestStickerImageForAvatarRecord:withStickerPackName:stickerConfigurationName:resource:withReply:", v15, v16, v17, v18, v23);
  }

}

uint64_t __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getStickerAndCacheForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __130__AVTAvatarRemoteImageRenderer_getStickerAndCacheForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v22[3] = &unk_1EA51E7F8;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[AVTAvatarRemoteImageRenderer _startRequestWithRetryCount:withReply:connectionRequestHandler:](self, "_startRequestWithRetryCount:withReply:connectionRequestHandler:", 10, v17, v22);

}

uint64_t __130__AVTAvatarRemoteImageRenderer_getStickerAndCacheForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestStickerAndCacheWithProxy:avatarRecord:stickerPackName:stickerConfigurationName:resource:reply:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
