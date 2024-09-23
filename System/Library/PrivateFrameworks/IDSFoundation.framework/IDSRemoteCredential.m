@implementation IDSRemoteCredential

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
      sub_19BAE7798(v4, v5, CFSTR("Clearing out _connection, we're disconnected"));
      sub_19BAE7808(v6, v7, CFSTR("Clearing out _connection, we're disconnected"));
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;

  }
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
      sub_19BAE7798(v4, v5, CFSTR("Forcing a disconnect, terminating connection"));
      sub_19BAE7808(v6, v7, CFSTR("Forcing a disconnect, terminating connection"));
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
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to credential agent", buf, 2u);
    }

    v5 = os_log_shim_legacy_logging_enabled();
    if ((_DWORD)v5)
    {
      sub_19BAE7798(v5, (uint64_t)v6, CFSTR("Connecting to credential agent"));
      sub_19BAE7808(v9, v10, CFSTR("Connecting to credential agent"));
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
    }
    objc_msgSend_UTF8String(CFSTR("com.apple.idscredentialsagent.embedded.auth"), v6, v7, v8);
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

- (void)dealloc
{
  uint64_t v2;
  double v3;
  objc_super v5;

  objc_msgSend__disconnect(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IDSRemoteCredential;
  -[IDSRemoteCredential dealloc](&v5, sel_dealloc);
}

- (void)fetchRemoteiMessageAndFaceTimeAccountInfoWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  double v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "** SENDING remote fetch iMessage account info request:", buf, 2u);
  }

  v6 = os_log_shim_legacy_logging_enabled();
  if ((_DWORD)v6)
  {
    sub_19BAE7798(v6, v7, CFSTR("** SENDING remote fetch iMessage account info request:"));
    sub_19BAE7808(v8, v9, CFSTR("** SENDING remote fetch iMessage account info request:"));
    if ((_IMWillLog() & 1) != 0)
      _IMAlwaysLog();
  }
  v10 = xpc_dictionary_create(0, 0, 0);
  IMInsertIntsToXPCDictionary();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19BAE7D5C;
  v14[3] = &unk_1E3C22250;
  v15 = v4;
  v11 = v4;
  objc_msgSend__sendMessage_withCompletionBlock_(self, v12, (uint64_t)v10, v13, v14, 9, 0);

}

- (void)fetchRemoteAccountsOfServiceTypes:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  xpc_object_t v13;
  id v14;
  const char *v15;
  double v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "** SENDING remote fetch remote accounts of Service Types info request:", buf, 2u);
  }

  v9 = os_log_shim_legacy_logging_enabled();
  if ((_DWORD)v9)
  {
    sub_19BAE7798(v9, v10, CFSTR("** SENDING remote fetch remote accounts of Service Types info request:"));
    sub_19BAE7808(v11, v12, CFSTR("** SENDING remote fetch remote accounts of Service Types info request:"));
    if ((_IMWillLog() & 1) != 0)
      _IMAlwaysLog();
  }
  v13 = xpc_dictionary_create(0, 0, 0);
  IMInsertIntsToXPCDictionary();
  IMInsertArraysToXPCDictionary();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_19BAE80DC;
  v17[3] = &unk_1E3C22250;
  v18 = v7;
  v14 = v7;
  objc_msgSend__sendMessage_withCompletionBlock_(self, v15, (uint64_t)v13, v16, v17, v6, 0);

}

- (void)sendIDSLocalDeviceInfoRequestWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  xpc_object_t v9;
  const char *v10;
  double v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "Sending local device info request through credentials agent", buf, 2u);
  }

  v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    IMInsertIntsToXPCDictionary();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19BAE83D8;
    v12[3] = &unk_1E3C22250;
    v13 = v4;
    objc_msgSend__sendMessage_withCompletionBlock_(self, v10, (uint64_t)v9, v11, v12, 11, 0);

  }
}

- (void)requestIDStatusForURIs:(id)a3 service:(id)a4 lightQuery:(BOOL)a5 allowQuery:(BOOL)a6 completionBlock:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  xpc_object_t v21;
  id v22;
  id v23;
  const char *v24;
  double v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[16];

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  OSLogHandleForIDSCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "** SENDING remote ID Query request V2 (New and Improved!!!) :", buf, 2u);
  }

  v15 = os_log_shim_legacy_logging_enabled();
  if ((_DWORD)v15)
  {
    sub_19BAE7798(v15, (uint64_t)v16, CFSTR("** SENDING remote ID Query request V2 (New and Improved!!!) :"));
    sub_19BAE7808(v18, v19, CFSTR("** SENDING remote ID Query request V2 (New and Improved!!!) :"));
    if ((_IMWillLog() & 1) != 0)
      _IMAlwaysLog();
  }
  objc_msgSend___imArrayByApplyingBlock_(v11, v16, (uint64_t)&unk_1E3C1BA70, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = xpc_dictionary_create(0, 0, 0);
  IMInsertIntsToXPCDictionary();
  IMInsertArraysToXPCDictionary();
  IMInsertNSStringsToXPCDictionary();
  IMInsertBoolsToXPCDictionary();
  IMInsertBoolsToXPCDictionary();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_19BAE86EC;
  v26[3] = &unk_1E3C22370;
  v27 = v12;
  v28 = v13;
  v22 = v13;
  v23 = v12;
  objc_msgSend__sendMessage_withCompletionBlock_(self, v24, (uint64_t)v21, v25, v26, v8, 0);

}

- (void)sendAccountSyncMessage:(id)a3 messageID:(id)a4 queueOneIdentifier:(id)a5 allowCloudFallback:(BOOL)a6 completionBlock:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  xpc_object_t v20;
  const char *v21;
  double v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[16];

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend_accountSync(MEMORY[0x1E0D36AA8], v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "Sending account sync message to credentials agent", buf, 2u);
  }

  v20 = xpc_dictionary_create(0, 0, 0);
  if (v20)
  {
    IMInsertIntsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_19BAE8F58;
    v23[3] = &unk_1E3C22398;
    v25 = v15;
    v24 = v13;
    objc_msgSend__sendMessage_withCompletionBlock_(self, v21, (uint64_t)v20, v22, v23, v8, 0);

  }
}

- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OS_xpc_object *connection;
  NSObject *v18;
  _QWORD handler[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend__connect(self, v8, v9, v10))
  {
    v11 = (void *)MEMORY[0x1A1AC8A78](v6);
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = v11;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "Sending remote credential request %s", buf, 0xCu);
    }

    v13 = os_log_shim_legacy_logging_enabled();
    if ((_DWORD)v13)
    {
      sub_19BAE7798(v13, v14, CFSTR("Sending remote credential request %s"));
      sub_19BAE7808(v15, v16, CFSTR("Sending remote credential request %s"));
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
    }
    free(v11);
    connection = self->_connection;
    im_primary_queue();
    v18 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_19BAE9234;
    handler[3] = &unk_1E3C223E8;
    v21 = v7;
    handler[4] = self;
    v20 = v6;
    xpc_connection_send_message_with_reply(connection, v20, v18, handler);

  }
}

- (BOOL)wantsRetries
{
  return self->_wantsRetries;
}

- (void)setWantsRetries:(BOOL)a3
{
  self->_wantsRetries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
