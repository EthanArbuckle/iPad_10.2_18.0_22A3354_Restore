@implementation SOLDAPHelper

- (SOLDAPHelper)init
{
  SOLDAPHelper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SOLDAPHelper;
  result = -[SOLDAPHelper init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_isConnected = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SOLDAPHelper isConnected](self, "isConnected"))
    -[SOLDAPHelper disconnect](self, "disconnect");
  v3.receiver = self;
  v3.super_class = (Class)SOLDAPHelper;
  -[SOLDAPHelper dealloc](&v3, sel_dealloc);
}

- (void)setupLDAPconnection:(id)a3 andPort:(unsigned __int16)a4 andRequireTLSForLDAP:(BOOL)a5 andBundleIdentifier:(id)a6
{
  _BOOL4 v7;
  int v8;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v7 = a5;
  v8 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[SOLDAPHelper ldap](self, "ldap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    SO_LOG_SOLDAPHelper();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v10;
      v18 = 1024;
      v19 = v8;
      v20 = 2114;
      v21 = v11;
      _os_log_debug_impl(&dword_215A1B000, v13, OS_LOG_TYPE_DEBUG, "setting up ldap connection: %@, %d, %{public}@", buf, 0x1Cu);
    }

    v14 = (void *)ldap_connection_create_with_hostname();
    if (v7)
    {
      SO_LOG_SOLDAPHelper();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[SOLDAPHelper setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:].cold.1();

      ldap_connection_set_tls();
    }
    if (v11 && (objc_msgSend(v11, "isEqualToString:", &stru_24D3EC758) & 1) == 0)
    {
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      ldap_connection_set_source_application_by_bundle();
    }
    ldap_connection_set_disconnect_handler();
    -[SOLDAPHelper setLdap:](self, "setLdap:", v14);

  }
}

uint64_t __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;

  SO_LOG_SOLDAPHelper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 0);
}

- (void)connectToLDAPServer:(id)a3 andPort:(unsigned __int16)a4 andBundleIdentifier:(id)a5 andRequireTLSForLDAP:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  uint64_t v10;
  id v12;
  void (**v13)(id, uint64_t, const __CFString *);
  void *v14;
  id v15;

  v8 = a6;
  v10 = a4;
  v15 = a3;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, const __CFString *))a7;
  -[SOLDAPHelper ldap](self, "ldap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v13[2](v13, 1, CFSTR("Already connected to server"));
  }
  else
  {
    -[SOLDAPHelper setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:](self, "setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:", v15, v10, v8, v12);
    -[SOLDAPHelper connectToLDAPWithCompletion:](self, "connectToLDAPWithCompletion:", v13);
  }

}

- (void)connectToLDAPService:(id)a3 requireTLSForLDAP:(BOOL)a4 bundleIdentifier:(id)a5 inBackground:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, const __CFString *);
  void *v15;
  NSObject *v16;
  NSObject *srv;
  NSObject *legacy_tcp_socket;
  nw_connection_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, unsigned int, void *);
  void *v27;
  SOLDAPHelper *v28;
  id v29;
  void (**v30)(id, _QWORD, const __CFString *);
  BOOL v31;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, const __CFString *))a7;
  -[SOLDAPHelper setCompletionCalled:](self, "setCompletionCalled:", 0);
  -[SOLDAPHelper ldap](self, "ldap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v14[2](v14, 0, CFSTR("There is already an ldap connection"));
  }
  else
  {
    SO_LOG_SOLDAPHelper();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SOLDAPHelper connectToLDAPService:requireTLSForLDAP:bundleIdentifier:inBackground:completion:].cold.1((uint64_t)v12, (uint64_t)v13, v16);

    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    srv = nw_endpoint_create_srv();
    legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
    if (v8)
      nw_parameters_set_traffic_class();
    if (v13 && (objc_msgSend(v13, "isEqualToString:", &stru_24D3EC758) & 1) == 0)
    {
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      nw_parameters_set_source_application_by_bundle_id();
    }
    v19 = nw_connection_create(srv, legacy_tcp_socket);
    -[SOLDAPHelper setConnection:](self, "setConnection:", v19);

    -[SOLDAPHelper connection](self, "connection");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_queue(v20, v21);

    -[SOLDAPHelper connection](self, "connection");
    v22 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke;
    v27 = &unk_24D3EC028;
    v28 = self;
    v30 = v14;
    v31 = a4;
    v29 = v13;
    nw_connection_set_state_changed_handler(v22, &v24);

    -[SOLDAPHelper connection](self, "connection", v24, v25, v26, v27, v28);
    v23 = objc_claimAutoreleasedReturnValue();
    nw_connection_start(v23);

  }
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  nw_endpoint_type_t type;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int connected_socket;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;

  v5 = a3;
  SO_LOG_SOLDAPHelper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_4(a2, v6);

  if (a2 > 1)
  {
    switch(a2)
    {
      case 3u:
        objc_msgSend(*(id *)(a1 + 32), "connection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = nw_connection_copy_connected_remote_endpoint();

        v15 = nw_endpoint_copy_parent_endpoint();
        type = nw_endpoint_get_type(v15);
        if (v15)
        {
          while (type != (nw_endpoint_type_url|nw_endpoint_type_address))
          {
            v17 = v10;
            v10 = v15;

            v15 = nw_endpoint_copy_parent_endpoint();
            if (!v15)
              break;
            type = nw_endpoint_get_type(v15);
          }
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", nw_endpoint_get_hostname(v10), 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "connection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        connected_socket = nw_connection_get_connected_socket();

        if (connected_socket == -1
          || (!*(_BYTE *)(a1 + 56)
            ? (v22 = ldap_connection_create_with_socket())
            : (v22 = ldap_connection_create_with_socket_and_hostname()),
              (v23 = (void *)v22) == 0))
        {
          nw_endpoint_get_port(v10);
          v23 = (void *)ldap_connection_create_with_hostname();
        }
        if (*(_BYTE *)(a1 + 56))
        {
          SO_LOG_SOLDAPHelper();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[SOLDAPHelper setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:].cold.1();

          ldap_connection_set_tls();
        }
        v25 = *(void **)(a1 + 40);
        if (v25 && (objc_msgSend(v25, "isEqualToString:", &stru_24D3EC758) & 1) == 0)
        {
          objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
          ldap_connection_set_source_application_by_bundle();
        }
        ldap_connection_set_disconnect_handler();
        objc_msgSend(*(id *)(a1 + 32), "setLdap:", v23);
        objc_msgSend(*(id *)(a1 + 32), "startLDAPWithCompletion:", *(_QWORD *)(a1 + 48));

        goto LABEL_40;
      case 5u:
        objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
        SO_LOG_SOLDAPHelper();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_3();

        if ((objc_msgSend(*(id *)(a1 + 32), "completionCalled") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setCompletionCalled:", 1);
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }
        break;
      case 4u:
        SO_LOG_SOLDAPHelper();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_1((uint64_t)v5, v11);

        objc_msgSend(*(id *)(a1 + 32), "connection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 32), "connection");
          v13 = objc_claimAutoreleasedReturnValue();
          nw_connection_cancel(v13);

          objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
        }
        if ((objc_msgSend(*(id *)(a1 + 32), "completionCalled") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setCompletionCalled:", 1);
          v9 = *(_QWORD *)(a1 + 48);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to connect to server: %@"), v5);
          goto LABEL_8;
        }
        break;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "connection");
      v8 = objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v8);

      objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "completionCalled") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCompletionCalled:", 1);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Waiting for connection: %@"), v5);
LABEL_8:
      v10 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, NSObject *))(v9 + 16))(v9, 0, v10);
LABEL_40:

    }
  }

}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;

  SO_LOG_SOLDAPHelper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 0);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_connection_cancel(v4);

    objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  }
}

- (void)startLDAPWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  SO_LOG_SOLDAPHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOLDAPHelper startLDAPWithCompletion:].cold.1();

  -[SOLDAPHelper ldap](self, "ldap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  ldap_connection_start();

}

void __40__SOLDAPHelper_startLDAPWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  if ((_DWORD)a4 == 10003)
  {
    SO_LOG_SOLDAPHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __40__SOLDAPHelper_startLDAPWithCompletion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to connect to server: %d"), 10003);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    goto LABEL_8;
  }
  if ((_DWORD)a4)
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to connect to server: %d"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCompletionCalled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setLdap:", 0);
    goto LABEL_9;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCompletionCalled:", 1);
LABEL_9:

}

- (void)queryforBaseDN:(id)a3 andScope:(int)a4 andAttributes:(id)a5 withFilter:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  -[SOLDAPHelper ldap](self, "ldap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v16 = v19;
  v17 = (void *)ldap_connection_query_create();

  if (!v17)
  {
    SO_LOG_SOLDAPHelper();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SOLDAPHelper queryforBaseDN:andScope:andAttributes:withFilter:completion:].cold.1();

    (*((void (**)(id, _QWORD, const __CFString *, _QWORD))v16 + 2))(v16, 0, CFSTR("LDAP Failed to create query"), 0);
  }

}

void __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;

  SO_LOG_SOLDAPHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke_cold_1();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_msgSend(a3, "copy");
  (*(void (**)(uint64_t, uint64_t, const __CFString *, void *))(v6 + 16))(v6, 1, &stru_24D3EC758, v7);

}

void __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke_22(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = (id)ldap_operation_copy_error_string();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LDAP Connection Error: %@"), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)disconnect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "LDAP disconnecting received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)useDigestMD5Auth:(id)a3 andPassword:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v8, *MEMORY[0x24BE07990]);

  objc_msgSend(v10, "setValue:forKey:", v7, *MEMORY[0x24BE07988]);
  -[SOLDAPHelper ldap](self, "ldap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ldap_connection_add_credential();

}

- (void)useKerberosAuth:(gss_cred_id_t_desc_struct *)a3 forSPN:(id)a4
{
  gss_name_t v6;
  void *v7;
  void *v8;
  CFErrorRef error;

  error = 0;
  v6 = GSSCreateName(a4, MEMORY[0x24BDD1A60], &error);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", a3, *MEMORY[0x24BE07978]);
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x24BE07980]);
  -[SOLDAPHelper ldap](self, "ldap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ldap_connection_add_credential();

}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (OS_ldap_connection)ldap
{
  return self->_ldap;
}

- (void)setLdap:(id)a3
{
  objc_storeStrong((id *)&self->_ldap, a3);
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)completionCalled
{
  return self->_completionCalled;
}

- (void)setCompletionCalled:(BOOL)a3
{
  self->_completionCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_ldap, 0);
}

- (void)setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "LDAP TLS support is enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "LDAP closed connection to server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)connectToLDAPService:(os_log_t)log requireTLSForLDAP:bundleIdentifier:inBackground:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_215A1B000, log, OS_LOG_TYPE_DEBUG, "setting up ldap connection: %@, %{public}@", (uint8_t *)&v3, 0x16u);
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215A1B000, a2, OS_LOG_TYPE_ERROR, "tcp error: %@", (uint8_t *)&v2, 0xCu);
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "connection closed or cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_215A1B000, a2, OS_LOG_TYPE_DEBUG, "tcp state: %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)startLDAPWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "Connecting to server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__SOLDAPHelper_startLDAPWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "Failed to negotiate a TLS connection with the LDAP server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)queryforBaseDN:andScope:andAttributes:withFilter:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "Failed to create LDAP query", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "Query Response received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
