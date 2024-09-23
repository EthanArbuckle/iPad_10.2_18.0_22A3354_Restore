@implementation HSAAuthenticationServer

+ (id)sharedInstance
{
  if (qword_253E79B18 != -1)
    dispatch_once(&qword_253E79B18, &unk_24C304690);
  return (id)qword_253E79B20;
}

- (HSAAuthenticationServer)init
{
  HSAAuthenticationServer *v2;
  HSAAuthenticationServer *v3;
  HSAAuthenticationServer *v4;
  void *v5;
  uint64_t v6;
  OS_xpc_object *connection;
  _xpc_connection_s *v8;
  _QWORD v10[4];
  HSAAuthenticationServer *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HSAAuthenticationServer;
  v2 = -[HSAAuthenticationServer init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_20A373794;
    v10[3] = &unk_24C3047A0;
    v4 = v2;
    v11 = v4;
    v5 = (void *)MEMORY[0x20BD23FA4](v10);
    v6 = IMXPCCreateServerConnection();
    connection = v4->_connection;
    v4->_connection = (OS_xpc_object *)v6;

    v8 = v4->_connection;
    if (v8)
      xpc_connection_resume(v8);
    else
      _IMWarn();
    if (_IMWillLog())
      _IMAlwaysLog();

  }
  return v3;
}

- (void)parseIncomingMessageFromNumber:(id)a3 forService:(id)a4 messageBody:(id)a5
{
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _xpc_connection_s *v22;
  xpc_object_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  __CFString *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  xpc_object_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v38 = a4;
  v8 = a5;
  if (_IMWillLog())
  {
    v30 = v38;
    v31 = v8;
    v28 = v39;
    _IMAlwaysLog();
  }
  if (-[NSMutableArray count](self->_clients, "count", v28, v30, v31))
  {
    v37 = v8;
    sub_20A37420C(CFSTR("HSAOriginatingAddressList"));
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    sub_20A37420C(CFSTR("HSAVerificationCodePattern"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("([0-9]+)");
    if (v9)
      v10 = (const __CFString *)v9;
    v36 = (__CFString *)v10;
    if (_IMWillLog())
    {
      v29 = v35;
      _IMAlwaysLog();
    }
    if (_IMWillLog())
    {
      v29 = v36;
      _IMAlwaysLog();
    }
    if (-[__CFString length](v36, "length", v29))
    {
      if (!-[__CFString count](v35, "count")
        || (objc_msgSend(v39, "lowercaseString"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = -[__CFString containsObject:](v35, "containsObject:", v11),
            v11,
            (v12 & 1) != 0))
      {
        v44 = 0;
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v36, 1, &v44);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v44;
        v33 = v13;
        if (!v34 || v13)
        {
          _IMWarn();
        }
        else
        {
          objc_msgSend(v34, "firstMatchInString:options:range:", v37, 1, 0, objc_msgSend(v37, "length"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v32 = v14;
            v15 = objc_msgSend(v14, "rangeAtIndex:", 0);
            objc_msgSend(v37, "substringWithRange:", v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              if ((_IMWillLog() & 1) != 0)
                _IMAlwaysLog();
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              v18 = self->_clients;
              v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
              if (v19)
              {
                v20 = *(_QWORD *)v41;
                do
                {
                  v21 = 0;
                  do
                  {
                    if (*(_QWORD *)v41 != v20)
                      objc_enumerationMutation(v18);
                    v22 = *(_xpc_connection_s **)(*((_QWORD *)&v40 + 1) + 8 * v21);
                    v23 = xpc_dictionary_create(0, 0, 0);
                    if (v23)
                    {
                      IMInsertNSStringsToXPCDictionary();
                      IMInsertNSStringsToXPCDictionary();
                      objc_msgSend(v17, "trimmedString", v38, 0);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      IMInsertNSStringsToXPCDictionary();

                      IMInsertNSStringsToXPCDictionary();
                      xpc_connection_send_message(v22, v23);
                      if (qword_2545F9278 != -1)
                        dispatch_once(&qword_2545F9278, &unk_24C3047E0);
                      v25 = (void *)qword_2545F9280;
                      if (os_log_type_enabled((os_log_t)qword_2545F9280, OS_LOG_TYPE_DEFAULT))
                      {
                        v26 = v25;
                        -[_xpc_connection_s debugDescription](v22, "debugDescription", v37, 0);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v46 = v27;
                        v47 = 2112;
                        v48 = v23;
                        _os_log_impl(&dword_20A371000, v26, OS_LOG_TYPE_DEFAULT, "  => Notifying client: %@  (message: %@)", buf, 0x16u);

                      }
                    }

                    ++v21;
                  }
                  while (v19 != v21);
                  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
                }
                while (v19);
              }

              if (_IMWillLog())
                _IMAlwaysLog();
            }

          }
          else if ((_IMWillLog() & 1) != 0)
          {
            _IMAlwaysLog();
          }
        }

        goto LABEL_42;
      }
      if (_IMWillLog())
        goto LABEL_41;
    }
    else if (_IMWillLog())
    {
LABEL_41:
      _IMAlwaysLog();
    }
LABEL_42:

    v8 = v37;
    goto LABEL_43;
  }
  if (_IMWillLog())
    _IMAlwaysLog();
LABEL_43:

}

- (void)_clientConnected
{
  if (!self->_hasRegistered)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    self->_hasRegistered = 1;
  }
}

- (void)_cleanup
{
  if (self->_hasRegistered)
  {
    self->_hasRegistered = 0;
    if (_IMWillLog())
      _IMAlwaysLog();
  }
}

- (void)_cleanupClient:(id)a3
{
  NSMutableArray *clients;
  uint64_t pid;
  uint64_t v6;
  _xpc_connection_s *connection;

  connection = (_xpc_connection_s *)a3;
  if (connection)
  {
    if (_IMWillLog())
    {
      pid = xpc_connection_get_pid(connection);
      _IMAlwaysLog();
    }
    -[NSMutableArray removeObject:](self->_clients, "removeObject:", connection, pid);
    if (_IMWillLog())
    {
      v6 = -[NSMutableArray count](self->_clients, "count");
      _IMAlwaysLog();
    }
    if (!-[NSMutableArray count](self->_clients, "count", v6))
    {
      -[HSAAuthenticationServer _cleanup](self, "_cleanup");
      clients = self->_clients;
      self->_clients = 0;

    }
  }

}

- (void)_configureWithClient:(id)a3
{
  _xpc_connection_s *v4;
  char v5;
  NSMutableArray *v6;
  NSMutableArray *clients;
  _xpc_connection_s *pid;
  _xpc_connection_s *connection;

  connection = (_xpc_connection_s *)a3;
  if (_IMWillLog())
  {
    pid = connection;
    _IMAlwaysLog();
  }
  v4 = connection;
  if (connection)
  {
    v5 = -[NSMutableArray containsObject:](self->_clients, "containsObject:", connection);
    v4 = connection;
    if ((v5 & 1) == 0)
    {
      if (!self->_clients)
      {
        v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        clients = self->_clients;
        self->_clients = v6;

      }
      if (_IMWillLog())
      {
        pid = (_xpc_connection_s *)xpc_connection_get_pid(connection);
        _IMAlwaysLog();
      }
      -[NSMutableArray addObject:](self->_clients, "addObject:", connection, pid);
      -[HSAAuthenticationServer _clientConnected](self, "_clientConnected");
      v4 = connection;
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  if (_IMWillLog())
    _IMAlwaysLog();
  -[HSAAuthenticationServer _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)HSAAuthenticationServer;
  -[HSAAuthenticationServer dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
