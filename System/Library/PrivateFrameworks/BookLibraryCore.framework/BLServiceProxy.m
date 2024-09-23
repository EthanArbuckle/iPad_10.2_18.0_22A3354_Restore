@implementation BLServiceProxy

- (void)reloadFromServerWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] reloadFromServerWithReply", v7, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadFromServerWithReply:", v4);

}

- (void)monitorProgressWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] monitorProgressWithReply", v7, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "monitorProgressWithReply:", v4);

}

- (BLServiceProxy)initWithProgressReceiver:(id)a3 error:(id *)a4
{
  id v6;
  BLServiceProxy *v7;
  BLServiceProxy *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLServiceProxy;
  v7 = -[BLServiceProxy init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_progressReceiver, a3);
    v8->_connectionLock._os_unfair_lock_opaque = 0;
    v8->_state = 0;
    -[BLServiceProxy _createAndStartConnection](v8, "_createAndStartConnection");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("BLService Notify Queue", v9);

    objc_initWeak(&location, v8);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_212C901FC;
    v12[3] = &unk_24CE8B498;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.BLService.DownloadQueue.Server.Restarted", &v8->_notifyToken, v10, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  return v8;
}

- (void)fetchDownloadListWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] fetchDownloadListWithReply", buf, 2u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212C90860;
  v8[3] = &unk_24CE8B510;
  v9 = v4;
  v6 = v4;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchDownloadListWithReply:", v6);

}

- (id)_remoteObjectWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[BLServiceProxy _createAndStartConnection](self, "_createAndStartConnection");
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212C9061C;
  v9[3] = &unk_24CE8B510;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_createAndStartConnection
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD *v4;
  void *v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  BLServiceProxy *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_connectionLock = &self->_connectionLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = sub_212C7CF4C;
  v8 = &unk_24CE8B4E8;
  v9 = self;
  v10 = &v11;
  v4 = v6;
  os_unfair_lock_lock(p_connectionLock);
  v7((uint64_t)v4);
  os_unfair_lock_unlock(p_connectionLock);

  if (*((_BYTE *)v12 + 24))
  {
    -[BLServiceProxy connectionMonitor](self, "connectionMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reconnectingToServiceForProxy:", self);

  }
  _Block_object_dispose(&v11, 8);
}

- (int64_t)state
{
  return self->_state;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BLProgressReceiving)progressReceiver
{
  return self->_progressReceiver;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setConnectionMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_connectionMonitor, a3);
}

- (BLServiceProxy)initWithError:(id *)a3
{
  return -[BLServiceProxy initWithProgressReceiver:error:](self, "initWithProgressReceiver:error:", 0, a3);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  -[BLServiceProxy shutdown](self, "shutdown");
  v3.receiver = self;
  v3.super_class = (Class)BLServiceProxy;
  -[BLServiceProxy dealloc](&v3, sel_dealloc);
}

- (void)shutdown
{
  os_unfair_lock_s *p_connectionLock;
  NSObject *v4;
  NSXPCConnection *connection;
  uint8_t v6[16];

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_connection)
  {
    BLServiceProxyLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_INFO, "[BLServiceProxy] Shutting down service proxy.", v6, 2u);
    }

    self->_state = 1;
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

  }
  os_unfair_lock_unlock(p_connectionLock);
}

- (id)_synchronousRemoteObjectWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[BLServiceProxy _createAndStartConnection](self, "_createAndStartConnection");
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212C90788;
  v9[3] = &unk_24CE8B510;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchDownloadFromDownloadID:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] fetchDownloadFromDownloadID", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C909A8;
  v11[3] = &unk_24CE8B510;
  v12 = v6;
  v9 = v6;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchDownloadFromDownloadID:withReply:", v7, v9);

}

- (void)pauseDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] pauseDownloadWithID", v10, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pauseDownloadWithID:withReply:", v7, v6);

}

- (void)resumeDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] resumeDownloadWithID", v10, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeDownloadWithID:withReply:", v7, v6);

}

- (void)restartDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] restartDownloadWithID", v10, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "restartDownloadWithID:withReply:", v7, v6);

}

- (void)cancelDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] cancelDownloadWithID", v10, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelDownloadWithID:withReply:", v7, v6);

}

- (void)cancelAllActiveDownloadsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] cancelAllActiveDownloadsWithReply", v7, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllActiveDownloadsWithReply:", v4);

}

- (void)purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  BLServiceProxyLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] purchaseWithRequest:uiHostProxy:reply:", buf, 2u);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_212C90E68;
  v14[3] = &unk_24CE8B510;
  v15 = v8;
  v12 = v8;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "purchaseWithRequest:uiHostProxy:reply:", v10, v9, v12);

}

- (void)downloadWithPermlink:(id)a3 title:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  BLServiceProxyLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] downloadWithPermlink", buf, 2u);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_212C90FD0;
  v14[3] = &unk_24CE8B510;
  v15 = v8;
  v12 = v8;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "downloadWithPermlink:title:reply:", v10, v9, v12);

}

- (void)requestDownloadWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadWithParameters", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C91118;
  v11[3] = &unk_24CE8B510;
  v12 = v6;
  v9 = v6;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestDownloadWithParameters:reply:", v7, v9);

}

- (void)requestDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v5 = a4;
  v8 = a5;
  v9 = a3;
  BLServiceProxyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadWithMetadata:isRestore", buf, 2u);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212C91270;
  v13[3] = &unk_24CE8B510;
  v14 = v8;
  v11 = v8;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestDownloadWithMetadata:isRestore:reply:", v9, v5, v11);

}

- (void)requestDownloadsWithMetadata:(id)a3 areRestore:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v5 = a4;
  v8 = a5;
  v9 = a3;
  BLServiceProxyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadsWithMetadata:areRestore", buf, 2u);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212C913C8;
  v13[3] = &unk_24CE8B510;
  v14 = v8;
  v11 = v8;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestDownloadsWithMetadata:areRestore:reply:", v9, v5, v11);

}

- (void)requestDownloadsWithRestoreContentRequestItems:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadsWithRestoreContentRequestDictionary", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C91510;
  v11[3] = &unk_24CE8B510;
  v12 = v6;
  v9 = v6;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestDownloadsWithRestoreContentRequestItems:reply:", v7, v9);

}

- (void)requestDownloadsWithManifestRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  BLServiceProxyLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadsWithManifestRequest", buf, 2u);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_212C91674;
  v14[3] = &unk_24CE8B510;
  v15 = v8;
  v12 = v8;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestDownloadsWithManifestRequest:uiHostProxy:reply:", v10, v9, v12);

}

- (void)processAutomaticDownloadsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] performAutomaticDownloads", buf, 2u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212C917A8;
  v8[3] = &unk_24CE8B510;
  v9 = v4;
  v6 = v4;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processAutomaticDownloadsWithReply:", v6);

}

- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v8 = a5;
  v9 = a4;
  BLServiceProxyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] setAutomaticDownloadEnabled", buf, 2u);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212C91904;
  v13[3] = &unk_24CE8B510;
  v14 = v8;
  v11 = v8;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAutomaticDownloadEnabled:uiHostProxy:reply:", v6, v9, v11);

}

- (void)setRacGUID:(id)a3 forStoreID:(int64_t)a4 withReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v8 = a5;
  v9 = a3;
  BLServiceProxyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] setRacGUID:forStoreID:", v12, 2u);
  }

  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRacGUID:forStoreID:withReply:", v9, a4, v8);

}

- (void)racGUIDForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] racGUIDforStoreID:", buf, 2u);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212C91AFC;
  v10[3] = &unk_24CE8B510;
  v11 = v6;
  v8 = v6;
  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "racGUIDForStoreID:withReply:", a3, v8);

}

- (void)removeRacGUIDForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] removeRacGUIDForStoreID:", v9, 2u);
  }

  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeRacGUIDForStoreID:withReply:", a3, v6);

}

- (void)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v8 = a5;
  v9 = a4;
  BLServiceProxyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] setMigrationState:forStoreIDs:", v12, 2u);
  }

  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMigrationState:forStoreIDs:withReply:", a3, v9, v8);

}

- (void)migrationInfoWithStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] migrationInfoWithStoreID:", buf, 2u);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212C91D9C;
  v10[3] = &unk_24CE8B510;
  v11 = v6;
  v8 = v6;
  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "migrationInfoWithStoreID:withReply:", a3, v8);

}

- (void)migrationInfosWithStoreIDs:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] migrationInfosWithStoreIDs:", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C91EE4;
  v11[3] = &unk_24CE8B510;
  v12 = v6;
  v9 = v6;
  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "migrationInfosWithStoreIDs:withReply:", v7, v9);

}

- (void)migrationInfosWithStates:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] migrationInfosWithStates:", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C9202C;
  v11[3] = &unk_24CE8B510;
  v12 = v6;
  v9 = v6;
  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "migrationInfosWithStates:withReply:", v7, v9);

}

- (void)removeMigrationInfoForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] removeMigrationInfoForStoreID:", v9, 2u);
  }

  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeMigrationInfoForStoreID:withReply:", a3, v6);

}

- (void)removeAllMigrationInfosExcludingStates:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  BLServiceProxyLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] removeAllMigrationInfosExcludingStates:", v10, 2u);
  }

  -[BLServiceProxy _synchronousRemoteObjectWithErrorHandler:](self, "_synchronousRemoteObjectWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllMigrationInfosExcludingStates:withReply:", v7, v6);

}

- (void)prepareForRemoveAppWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] prepareForRemoveAppWithReply", v7, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareForRemoveAppWithReply:", v4);

}

- (void)setValueSimulateCrashAtInstallStart:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallStart:withReply:", v9, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValueSimulateCrashAtInstallStart:withReply:", v4, v6);

}

- (void)setValueSimulateCrashAtInstallDuringDecrypt:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallDuringDecrypt:withReply:", v9, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValueSimulateCrashAtInstallDuringDecrypt:withReply:", v4, v6);

}

- (void)setValueSimulateCrashAtInstallDuringUnzip:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallDuringUnzip:withReply:", v9, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValueSimulateCrashAtInstallDuringUnzip:withReply:", v4, v6);

}

- (void)setValueSimulateCrashAtInstallDuringFinish:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallDuringFinish:withReply:", v9, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValueSimulateCrashAtInstallDuringFinish:withReply:", v4, v6);

}

- (void)getCrashSimulationOverrideValuesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] getValueSimulateCrashAtInstallDuringFinishWithReply:", buf, 2u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212C925E0;
  v8[3] = &unk_24CE8B510;
  v9 = v4;
  v6 = v4;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCrashSimulationOverrideValuesWithReply:", v6);

}

- (void)resetAllCrashSimulationOverridesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] resetAllCrashSimulationOverridesWithReply:", v7, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetAllCrashSimulationOverridesWithReply:", v4);

}

- (void)setValueSimulateDeviceOutOfSpace:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  BLServiceProxyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateDeviceOutOfSpace:", v9, 2u);
  }

  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValueSimulateDeviceOutOfSpace:withReply:", v4, v6);

}

- (void)getValueSimulateDeviceOutOfSpaceWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  BLServiceProxyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] getValueSimulateDeviceOutOfSpaceWithReply:", buf, 2u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212C92860;
  v8[3] = &unk_24CE8B510;
  v9 = v4;
  v6 = v4;
  -[BLServiceProxy _remoteObjectWithErrorHandler:](self, "_remoteObjectWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getValueSimulateDeviceOutOfSpaceWithReply:", v6);

}

- (BLServiceProxyConnectionMonitoring)connectionMonitor
{
  return (BLServiceProxyConnectionMonitoring *)objc_loadWeakRetained((id *)&self->_connectionMonitor);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReceiver, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_connectionMonitor);
}

@end
