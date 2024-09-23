@implementation DUXPCServerHelper

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 requestHandler:(id)a6 validateConnection:(id)a7 setupClientProxy:(id)a8 interruptionHandler:(id)a9 invalidationHandler:(id)a10
{
  id v15;
  id v16;
  uint64_t (**v17)(id, id, void *);
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  BOOL v22;
  _BOOL4 v23;
  int v24;
  char *v25;
  NSObject *v26;
  uint32_t v27;
  int v28;
  uint64_t v29;
  id v30;
  id v31;
  int v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  int v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v35 = a5;
  v36 = a6;
  v17 = (uint64_t (**)(id, id, void *))a7;
  v34 = a8;
  v38 = a9;
  v37 = a10;
  v49 = 0;
  procNameForPid(objc_msgSend(v15, "processIdentifier"), &v49);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    du_xpc_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v20 = objc_msgSend(v15, "processIdentifier", v34);
    *(_DWORD *)buf = 138412802;
    v51 = v16;
    v52 = 2112;
    v53 = v18;
    v54 = 2048;
    v55 = (char *)v20;
    v21 = "New connection to %@ from %@ (%lu).";
LABEL_7:
    v26 = v19;
    v27 = 32;
LABEL_8:
    _os_log_impl(&dword_2282CC000, v26, OS_LOG_TYPE_DEFAULT, v21, buf, v27);
    goto LABEL_9;
  }
  v22 = v49 == 0;
  du_xpc_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (!v23)
      goto LABEL_9;
    v24 = objc_msgSend(v15, "processIdentifier", v34);
    v25 = strerror(v49);
    *(_DWORD *)buf = 138412802;
    v51 = v16;
    v52 = 2048;
    v53 = (void *)v24;
    v54 = 2080;
    v55 = v25;
    v21 = "New connection to %@ from unknown process (%lu) (proc_name error: %s).";
    goto LABEL_7;
  }
  if (v23)
  {
    v33 = objc_msgSend(v15, "processIdentifier", v34);
    *(_DWORD *)buf = 138412546;
    v51 = v16;
    v52 = 2048;
    v53 = (void *)v33;
    v21 = "New connection to %@ from unknown process (%lu).";
    v26 = v19;
    v27 = 22;
    goto LABEL_8;
  }
LABEL_9:

  v28 = v17[2](v17, v15, v18);
  if (v28)
  {
    objc_msgSend(v15, "setExportedInterface:", v35);
    objc_msgSend(v15, "setExportedObject:", v36);
    objc_initWeak((id *)buf, v15);
    v29 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __174__DUXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke;
    v44[3] = &unk_24F0F3E78;
    objc_copyWeak(&v48, (id *)buf);
    v30 = v16;
    v45 = v30;
    v31 = v18;
    v46 = v31;
    v47 = v38;
    objc_msgSend(v15, "setInterruptionHandler:", v44);
    v39[0] = v29;
    v39[1] = 3221225472;
    v39[2] = __174__DUXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_4;
    v39[3] = &unk_24F0F3E78;
    objc_copyWeak(&v43, (id *)buf);
    v40 = v30;
    v41 = v31;
    v42 = v37;
    objc_msgSend(v15, "setInvalidationHandler:", v39);
    objc_msgSend(v15, "resume");

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v48);
    objc_destroyWeak((id *)buf);
  }

  return v28;
}

void __174__DUXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    du_xpc_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412802;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2048;
      v12 = (int)objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_2282CC000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was interrupted.", (uint8_t *)&v7, 0x20u);
    }

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __174__DUXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    du_xpc_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412802;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2048;
      v12 = (int)objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_2282CC000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was invalidated.", (uint8_t *)&v7, 0x20u);
    }

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  NSObject *v13;
  int v15;
  char *v16;
  int __errnum;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(MEMORY[0x24BE7A660], "hasTrueBooleanEntitlement:connection:logHandle:", v8, v9, MEMORY[0x24BDACB70]);
  if ((v11 & 1) == 0)
  {
    __errnum = 0;
    procNameForPid(objc_msgSend(v9, "processIdentifier"), &__errnum);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (__errnum)
    {
      du_xpc_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_msgSend(v9, "processIdentifier");
        v16 = strerror(__errnum);
        *(_DWORD *)buf = 67109634;
        v19 = v15;
        v20 = 2112;
        v21 = v10;
        v22 = 2080;
        v23 = v16;
        _os_log_error_impl(&dword_2282CC000, v13, OS_LOG_TYPE_ERROR, "Connection from %d to %@ failed entitlement check (proc_name error: %s).", buf, 0x1Cu);
      }

    }
    else
    {
      objc_msgSend(a1, "logFalseEntitlement:serviceName:processName:", v8, v10, v12);
    }

  }
  return v11;
}

+ (BOOL)checkForAndLogTrueCStringEntitlement:(const char *)a3 connection:(id)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)xpc_connection_copy_entitlement_value();
  v7 = v6;
  if (v6 && xpc_BOOL_get_value(v6))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a3, 4);
    objc_msgSend(a1, "logFalseEntitlement:serviceName:processName:", v11, v11, v10);

    v8 = 0;
  }

  return v8;
}

+ (void)logFalseEntitlement:(id)a3 serviceName:(id)a4 processName:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "length");
  du_xpc_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v12)
    {
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_2282CC000, v11, OS_LOG_TYPE_ERROR, "Connection from %@ to %@ is missing entitlement: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (v12)
  {
    +[DUXPCServerHelper logFalseEntitlement:serviceName:processName:].cold.1((uint64_t)v8, (uint64_t)v7, v11);
  }

}

+ (void)logFalseEntitlement:(uint64_t)a1 serviceName:(uint64_t)a2 processName:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109634;
  v7[1] = objc_msgSend(v6, "processIdentifier");
  v8 = 2112;
  v9 = a1;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_2282CC000, a3, OS_LOG_TYPE_ERROR, "Connection from %d to %@ failed entitlement check %@.", (uint8_t *)v7, 0x1Cu);

}

@end
