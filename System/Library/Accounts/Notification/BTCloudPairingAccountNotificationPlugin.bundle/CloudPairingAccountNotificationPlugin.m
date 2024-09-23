@implementation CloudPairingAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  CloudPairingAccountNotificationPlugin *v22;
  int v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v25 = a4;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_230EEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] changeType: %d oldAccount: %@ account: %@", buf, 0x1Cu);
  }
  if (v10)
    v13 = v10;
  else
    v13 = v12;
  v14 = v13;
  objc_msgSend(v14, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  if ((v17 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230EEBC70;
    block[3] = &unk_24FFA6E68;
    v23 = a4;
    v19 = v10;
    v20 = v14;
    v21 = v12;
    v22 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] No Apple Account Identifier Found", buf, 2u);
  }

}

- (void)account:(id)a3 didPerformActionsForDataclasses:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_230EEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] didPerformActionsForDataclasses: %@ for account: %@", (uint8_t *)&v8, 0x16u);
  }
  if (((objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDB3DB8]) & 1) != 0
     || (objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDB3E80]) & 1) != 0
     || (objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDB3DC0]) & 1) != 0
     || (objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDB3EC8]) & 1) != 0
     || objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDB3E30]))
    && objc_msgSend(v6, "isActive")
    && objc_msgSend(v6, "isAuthenticated"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_230EEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] interested account properties changed: %@ for account: %@", (uint8_t *)&v8, 0x16u);
    }
    -[CloudPairingAccountNotificationPlugin accountModified](self, "accountModified");
  }

}

- (id)daemonConection
{
  void *v3;
  NSObject *v4;
  xpc_connection_t mach_service;
  void *v6;
  _BOOL4 v7;
  _xpc_connection_s *v8;
  _xpc_connection_s *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  -[CloudPairingAccountNotificationPlugin cloudKitConnection](self, "cloudKitConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
LABEL_6:
    -[CloudPairingAccountNotificationPlugin cloudKitConnection](self, "cloudKitConnection");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v4, 2uLL);
  -[CloudPairingAccountNotificationPlugin setCloudKitConnection:](self, "setCloudKitConnection:", mach_service);

  -[CloudPairingAccountNotificationPlugin cloudKitConnection](self, "cloudKitConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_230EEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] Got to connect to cloudpaird", v11, 2u);
    }
    -[CloudPairingAccountNotificationPlugin cloudKitConnection](self, "cloudKitConnection");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_event_handler(v8, &unk_24FFA6EA8);

    -[CloudPairingAccountNotificationPlugin cloudKitConnection](self, "cloudKitConnection");
    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_resume(v9);

    goto LABEL_6;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] Failed to connect to cloudpaird", buf, 2u);
  }
  return 0;
}

- (void)accountModified
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230EEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[BluetoothUserAccountPlugin] primaryAccountModified", v6, 2u);
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "kMsgId", (const char *)objc_msgSend(CFSTR("SignInStatusChanged"), "UTF8String"));
  -[CloudPairingAccountNotificationPlugin daemonConection](self, "daemonConection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CloudPairingAccountNotificationPlugin daemonConection](self, "daemonConection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v5, v3);

  }
}

- (OS_xpc_object)cloudKitConnection
{
  return self->_cloudKitConnection;
}

- (void)setCloudKitConnection:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitConnection, 0);
}

@end
