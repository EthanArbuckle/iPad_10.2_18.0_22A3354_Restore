@implementation SODNSSRVQuery

- (SODNSSRVQuery)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SODNSSRVQuery;
  return -[SODNSSRVQuery init](&v3, sel_init);
}

- (id)lookupSRVWithQuery:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5
{
  id v7;
  id v8;
  id v9;
  nw_parameters_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *srv;
  void *evaluator_for_endpoint;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  id v25;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  dispatch_group_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  v38 = (id)objc_opt_new();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v32 = dispatch_group_create();
  v10 = nw_parameters_create();
  if (v8 && (objc_msgSend(v8, "isEqualToString:", &stru_24D3EC758) & 1) == 0)
  {
    SO_LOG_SODNSSRVQuery();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:].cold.3();

    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    nw_parameters_set_source_application_by_bundle_id();
  }
  memset(v26, 0, sizeof(v26));
  if (v9 && objc_msgSend(MEMORY[0x24BE043A0], "auditTokenFromData:auditToken:", v9, v26))
  {
    SO_LOG_SODNSSRVQuery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SONetworkIdentity evaluateVPNPath:].cold.2();

    nw_parameters_set_source_application();
  }
  v13 = objc_retainAutorelease(v7);
  objc_msgSend(v13, "UTF8String");
  srv = (void *)nw_endpoint_create_srv();
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v16 = nw_path_evaluator_copy_path();
  v17 = v16;
  if (v16 && nw_path_get_status(v16) == nw_path_status_satisfied)
  {
    v18 = (void *)nw_resolver_create_with_path();
    dispatch_group_enter((dispatch_group_t)v28[5]);
    dispatch_get_global_queue(0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    nw_resolver_set_update_handler();

  }
  v20 = v28[5];
  v21 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v20, v21) >= 1)
  {
    SO_LOG_SODNSSRVQuery();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:].cold.1();

  }
  v23 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void __68__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (!a2)
    goto LABEL_4;
  if (a2 == 2)
  {
    nw_array_apply();
LABEL_4:
    nw_resolver_cancel();
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v5 = v6;
  }

}

uint64_t __68__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", nw_endpoint_get_hostname(v4), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasSuffix:", CFSTR(".")))
  {
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v5, "setHost:", v6);
  objc_msgSend(v5, "setPort:", nw_endpoint_get_port(v4));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);

  return 1;
}

- (void)lookupSRVWithQuery:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  nw_parameters_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *srv;
  void *evaluator_for_endpoint;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _OWORD v26[2];
  _QWORD v27[5];
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__2;
  v27[4] = __Block_byref_object_dispose__2;
  v28 = (id)objc_opt_new();
  SO_LOG_SODNSSRVQuery();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:].cold.3();

  v14 = nw_parameters_create();
  if (v10 && (objc_msgSend(v10, "isEqualToString:", &stru_24D3EC758) & 1) == 0)
  {
    SO_LOG_SODNSSRVQuery();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:].cold.3();

    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    nw_parameters_set_source_application_by_bundle_id();
  }
  memset(v26, 0, sizeof(v26));
  if (v11 && objc_msgSend(MEMORY[0x24BE043A0], "auditTokenFromData:auditToken:", v11, v26))
  {
    SO_LOG_SODNSSRVQuery();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:].cold.1();

    nw_parameters_set_source_application();
  }
  v17 = objc_retainAutorelease(v9);
  objc_msgSend(v17, "UTF8String");
  srv = (void *)nw_endpoint_create_srv();
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v20 = nw_path_evaluator_copy_path();
  v21 = v20;
  if (v20 && nw_path_get_status(v20) == nw_path_status_satisfied)
  {
    v22 = (void *)nw_resolver_create_with_path();
    dispatch_get_global_queue(0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22;
    v25 = v12;
    nw_resolver_set_update_handler();

  }
  else
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

  _Block_object_dispose(v27, 8);
}

void __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  v5 = a3;
  if (!a2)
  {
    SO_LOG_SODNSSRVQuery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1();

    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    nw_array_apply();
    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
    v6();
  }

}

uint64_t __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", nw_endpoint_get_hostname(v4), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasSuffix:", CFSTR(".")))
  {
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v5, "setHost:", v6);
  objc_msgSend(v5, "setPort:", nw_endpoint_get_port(v4));
  SO_LOG_SODNSSRVQuery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
  return 1;
}

- (void)lookupHost:(id)a3 port:(id)a4 bundleIdentifier:(id)a5 auditTokenData:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  nw_parameters_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  const char *v21;
  id v22;
  nw_endpoint_t host;
  void *evaluator_for_endpoint;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _OWORD v32[2];
  _QWORD v33[5];
  id v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__2;
  v33[4] = __Block_byref_object_dispose__2;
  v34 = (id)objc_opt_new();
  SO_LOG_SODNSSRVQuery();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[SODNSSRVQuery lookupHost:port:bundleIdentifier:auditTokenData:completion:].cold.3();

  v17 = nw_parameters_create();
  if (v13 && (objc_msgSend(v13, "isEqualToString:", &stru_24D3EC758) & 1) == 0)
  {
    SO_LOG_SODNSSRVQuery();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:].cold.3();

    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    nw_parameters_set_source_application_by_bundle_id();
  }
  memset(v32, 0, sizeof(v32));
  if (v14 && objc_msgSend(MEMORY[0x24BE043A0], "auditTokenFromData:auditToken:", v14, v32))
  {
    SO_LOG_SODNSSRVQuery();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:].cold.1();

    nw_parameters_set_source_application();
  }
  v20 = objc_retainAutorelease(v11);
  v21 = (const char *)objc_msgSend(v20, "UTF8String");
  v22 = objc_retainAutorelease(v12);
  host = nw_endpoint_create_host(v21, (const char *)objc_msgSend(v22, "UTF8String"));
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v25 = nw_path_evaluator_copy_path();
  v26 = v25;
  if (v25 && nw_path_get_status(v25) == nw_path_status_satisfied)
  {
    v29 = v14;
    v27 = (void *)nw_resolver_create_with_path();
    dispatch_get_global_queue(0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    v31 = v15;
    nw_resolver_set_update_handler();

    v14 = v29;
  }
  else
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

  _Block_object_dispose(v33, 8);
}

void __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  v5 = a3;
  if (!a2)
  {
    SO_LOG_SODNSSRVQuery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1();

    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    nw_array_apply();
    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
    v6();
  }

}

uint64_t __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;

  objc_msgSend(a3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SODNSSRVQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);
  return 1;
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "timeout waiting for srv data, proceeding", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "Using bundleIdentifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "Using audit token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "Starting SRV query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "error receiving srv data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "adding result: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)lookupHost:port:bundleIdentifier:auditTokenData:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "Starting host query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "error receiving dns data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
