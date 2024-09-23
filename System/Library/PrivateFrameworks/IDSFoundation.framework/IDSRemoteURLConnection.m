@implementation IDSRemoteURLConnection

- (void)_disconnected
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OS_xpc_object *connection;
  uint8_t v9[16];

  if (self->_connection)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEBUG, "Clearing out _connection, we're disconnected", v9, 2u);
    }

    v4 = os_log_shim_legacy_logging_enabled();
    if ((_DWORD)v4)
    {
      sub_19BA9647C(v4, v5, CFSTR("Clearing out _connection, we're disconnected"));
      sub_19BA964EC(v6, v7, CFSTR("Clearing out _connection, we're disconnected"));
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;

  }
  self->_loading = 0;
}

- (BOOL)_disconnect
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OS_xpc_object *connection;
  uint8_t v10[16];

  self->_loading = 0;
  if (self->_connection)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEBUG, "Forcing a disconnect, terminating connection", v10, 2u);
    }

    v4 = os_log_shim_legacy_logging_enabled();
    if ((_DWORD)v4)
    {
      sub_19BA9647C(v4, v5, CFSTR("Forcing a disconnect, terminating connection"));
      sub_19BA964EC(v6, v7, CFSTR("Forcing a disconnect, terminating connection"));
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;

  }
  return 1;
}

- (BOOL)_connect
{
  OS_xpc_object *connection;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  OS_xpc_object *v12;
  OS_xpc_object *v13;
  uint8_t buf[16];

  connection = self->_connection;
  if (!connection)
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to URLLoading agent", buf, 2u);
    }

    v5 = os_log_shim_legacy_logging_enabled();
    if ((_DWORD)v5)
    {
      sub_19BA9647C(v5, (uint64_t)v6, CFSTR("Connecting to URLLoading agent"));
      sub_19BA964EC(v9, v10, CFSTR("Connecting to URLLoading agent"));
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
    }
    objc_msgSend_UTF8String(CFSTR("com.apple.idsremoteurlconnectionagent.embedded.auth"), v6, v7, v8);
    im_primary_queue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (OS_xpc_object *)IMXPCCreateConnectionForServiceWithQueue();
    v13 = self->_connection;
    self->_connection = v12;

    IMXPCConfigureConnection();
    connection = self->_connection;
  }
  return connection != 0;
}

+ (id)alloc
{
  return objc_alloc(MEMORY[0x1E0D36AC0]);
}

- (IDSRemoteURLConnection)initWithURLRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  IDSRemoteURLConnection *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19BA9693C;
  v12[3] = &unk_1E3C21CA8;
  v13 = v6;
  v7 = v6;
  v10 = (IDSRemoteURLConnection *)objc_msgSend_initWithURLRequest_completionBlockWithTimingData_(self, v8, (uint64_t)a3, v9, v12);

  return v10;
}

- (IDSRemoteURLConnection)initWithURLRequest:(id)a3 completionBlockWithTimingData:(id)a4
{
  id v7;
  id v8;
  IDSRemoteURLConnection *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  id block;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  IDSRemoteURLConnection *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IDSRemoteURLConnection;
  v9 = -[IDSRemoteURLConnection init](&v21, sel_init);
  if (v9)
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v7;
      v24 = 2048;
      v25 = v9;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "Init with URL request: %@  (%p)", buf, 0x16u);
    }

    v11 = os_log_shim_legacy_logging_enabled();
    if ((_DWORD)v11)
    {
      sub_19BA9647C(v11, v12, CFSTR("Init with URL request: %@  (%p)"));
      sub_19BA964EC(v13, v14, CFSTR("Init with URL request: %@  (%p)"));
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
    }
    objc_storeStrong((id *)&v9->_request, a3);
    v18 = objc_msgSend_copy(v8, v15, v16, v17);
    block = v9->_block;
    v9->_block = (id)v18;

  }
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  NSURLRequest *request;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSURLRequest *v11;
  IDSRemoteURLConnection *v12;
  objc_super v13;
  uint8_t buf[4];
  NSURLRequest *v15;
  __int16 v16;
  IDSRemoteURLConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    v15 = request;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "Released URL request: %@  (%p)", buf, 0x16u);
  }

  v5 = os_log_shim_legacy_logging_enabled();
  if ((_DWORD)v5)
  {
    sub_19BA9647C(v5, (uint64_t)v6, CFSTR("Released URL request: %@  (%p)"));
    v11 = self->_request;
    v12 = self;
    sub_19BA964EC(v9, v10, CFSTR("Released URL request: %@  (%p)"));
    if ((_IMWillLog() & 1) != 0)
    {
      v11 = self->_request;
      v12 = self;
      _IMAlwaysLog();
    }
  }
  objc_msgSend__disconnect(self, v6, v7, v8, v11, v12);
  v13.receiver = self;
  v13.super_class = (Class)IDSRemoteURLConnection;
  -[IDSRemoteURLConnection dealloc](&v13, sel_dealloc);
}

- (void)load
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  NSURLRequest *request;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSURLRequest *v14;
  uint64_t v15;
  NSURLRequest *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  xpc_object_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  OS_xpc_object *connection;
  NSObject *v53;
  NSURLRequest *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t shouldUsePipelining;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD handler[5];
  uint8_t buf[4];
  NSURLRequest *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  IDSRemoteURLConnection *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (!self->_loading)
  {
    self->_cancelled = 0;
    if (objc_msgSend__connect(self, a2, v2, v3))
    {
      OSLogHandleForIDSCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        request = self->_request;
        objc_msgSend_bundleIdentifierForDataUsage(self, v6, v7, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v68 = request;
        v69 = 2112;
        v70 = v10;
        v71 = 2048;
        v72 = self;
        _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Sending URL request: %@ (Data usage identifier: %@)  (%p)", buf, 0x20u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v14 = self->_request;
        objc_msgSend_bundleIdentifierForDataUsage(self, v11, v12, v13);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        sub_19BA9647C((uint64_t)v63, v15, CFSTR("Sending URL request: %@ (Data usage identifier: %@)  (%p)"));

        v16 = self->_request;
        objc_msgSend_bundleIdentifierForDataUsage(self, v17, v18, v19, v14, v63, self);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        sub_19BA964EC((uint64_t)v64, v20, CFSTR("Sending URL request: %@ (Data usage identifier: %@)  (%p)"));

        if ((_IMWillLog() & 1) != 0)
        {
          objc_msgSend_bundleIdentifierForDataUsage(self, v21, v22, v23, v16, v64, self);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          _IMAlwaysLog();

        }
      }
      self->_loading = 1;
      v24 = xpc_dictionary_create(0, 0, 0);
      v54 = self->_request;
      IMInsertKeyedCodableObjectsToXPCDictionary();
      v55 = objc_msgSend_forceCellularIfPossible(self, v25, v26, v27, v54, 0);
      IMInsertBoolsToXPCDictionary();
      v56 = objc_msgSend_requireIDSHost(self, v28, v29, v30, v55, 0);
      IMInsertBoolsToXPCDictionary();
      objc_msgSend_bundleIdentifierForDataUsage(self, v31, v32, v33, v56, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      IMInsertNSStringsToXPCDictionary();

      shouldUsePipelining = objc_msgSend_shouldUsePipelining(self, v34, v35, v36, v57, 0);
      IMInsertBoolsToXPCDictionary();
      v59 = objc_msgSend_concurrentConnections(self, v37, v38, v39, shouldUsePipelining, 0);
      IMInsertIntsToXPCDictionary();
      v60 = objc_msgSend_disableKeepAlive(self, v40, v41, v42, v59, 0);
      IMInsertBoolsToXPCDictionary();
      v61 = objc_msgSend_keepAliveWifi(self, v43, v44, v45, v60, 0);
      IMInsertIntsToXPCDictionary();
      v62 = objc_msgSend_keepAliveCell(self, v46, v47, v48, v61, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend_shouldReturnTimingData(self, v49, v50, v51, v62, 0);
      IMInsertBoolsToXPCDictionary();
      connection = self->_connection;
      im_primary_queue();
      v53 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = sub_19BA96FE8;
      handler[3] = &unk_1E3C21CD0;
      handler[4] = self;
      xpc_connection_send_message_with_reply(connection, v24, v53, handler);

    }
  }
}

- (void)cancel
{
  NSObject *v3;
  NSURLRequest *request;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id block;
  NSURLRequest *v12;
  IDSRemoteURLConnection *v13;
  uint8_t buf[4];
  NSURLRequest *v15;
  __int16 v16;
  IDSRemoteURLConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    v15 = request;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling URL request: %@  (%p)", buf, 0x16u);
  }

  v5 = os_log_shim_legacy_logging_enabled();
  if ((_DWORD)v5)
  {
    sub_19BA9647C(v5, (uint64_t)v6, CFSTR("Cancelling URL request: %@  (%p)"));
    v12 = self->_request;
    v13 = self;
    sub_19BA964EC(v9, v10, CFSTR("Cancelling URL request: %@  (%p)"));
    if ((_IMWillLog() & 1) != 0)
    {
      v12 = self->_request;
      v13 = self;
      _IMAlwaysLog();
    }
  }
  self->_cancelled = 1;
  block = self->_block;
  if (block)
  {
    self->_block = 0;

  }
  objc_msgSend__disconnect(self, v6, v7, v8, v12, v13);
}

- (BOOL)forceCellularIfPossible
{
  return self->_forceCellularIfPossible;
}

- (void)setForceCellularIfPossible:(BOOL)a3
{
  self->_forceCellularIfPossible = a3;
}

- (NSString)bundleIdentifierForDataUsage
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifierForDataUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)requireIDSHost
{
  return self->_requireIDSHost;
}

- (void)setRequireIDSHost:(BOOL)a3
{
  self->_requireIDSHost = a3;
}

- (BOOL)shouldUsePipelining
{
  return self->_shouldUsePipelining;
}

- (void)setShouldUsePipelining:(BOOL)a3
{
  self->_shouldUsePipelining = a3;
}

- (int)concurrentConnections
{
  return self->_concurrentConnections;
}

- (void)setConcurrentConnections:(int)a3
{
  self->_concurrentConnections = a3;
}

- (BOOL)disableKeepAlive
{
  return self->_disableKeepAlive;
}

- (void)setDisableKeepAlive:(BOOL)a3
{
  self->_disableKeepAlive = a3;
}

- (int)keepAliveWifi
{
  return self->_keepAliveWifi;
}

- (void)setKeepAliveWifi:(int)a3
{
  self->_keepAliveWifi = a3;
}

- (int)keepAliveCell
{
  return self->_keepAliveCell;
}

- (void)setKeepAliveCell:(int)a3
{
  self->_keepAliveCell = a3;
}

- (BOOL)shouldReturnTimingData
{
  return self->_shouldReturnTimingData;
}

- (void)setShouldReturnTimingData:(BOOL)a3
{
  self->_shouldReturnTimingData = a3;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)block
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDataUsage, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
