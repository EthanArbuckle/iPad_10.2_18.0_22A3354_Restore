@implementation BRGetProcessMobileContainerForID

void __BRGetProcessMobileContainerForID_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  void *v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  _BYTE v39[18];
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = *(_OWORD *)(a1 + 48);
  v35 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID_block_invoke", 379);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v37 = (id)v34;
    v38 = 2112;
    *(_QWORD *)v39 = v25;
    *(_WORD *)&v39[8] = 2112;
    *(_QWORD *)&v39[10] = v12;
    v40 = 2112;
    v41 = v13;
    _os_log_debug_impl(&dword_19CBF0000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx container url:'%@' %@%@", buf, 0x2Au);

  }
  if (v10)
  {
    v15 = objc_retainAutorelease(v10);
    objc_msgSend(v15, "bytes");
    if (sandbox_extension_consume() < 0)
    {
      v16 = *__error();
      brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID_block_invoke", 382);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v37 = v15;
        v38 = 1024;
        *(_DWORD *)v39 = v16;
        *(_WORD *)&v39[4] = 2112;
        *(_QWORD *)&v39[6] = v17;
        _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v16;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", v9, v12);
  v19 = *(_QWORD *)(a1 + 72);
  v20 = *(id *)(a1 + 40);
  v21 = v11;
  if (!v19)
  {
    if (BRCurrentProcessIsOwningContainerWithID(v20))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[BRContainer versionOfBundle:changedFromVersion:](BRContainer, "versionOfBundle:changedFromVersion:", v22, v21);

      if (v23)
      {
        if (v20)
        {
          v24 = v20;
        }
        else
        {
          objc_msgSend((id)currentProcessUbiquityContainerEntitlements, "objectAtIndexedSubscript:", 0);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (!v24)
            goto LABEL_23;
        }
        if (_RefreshContainerMetadataIfNecessary_onceToken != -1)
          dispatch_once(&_RefreshContainerMetadataIfNecessary_onceToken, &__block_literal_global_180);
        v26 = (id)_RefreshContainerMetadataIfNecessary_updateContainerMetadataDateByContainerID;
        objc_sync_enter(v26);
        objc_msgSend((id)_RefreshContainerMetadataIfNecessary_updateContainerMetadataDateByContainerID, "objectForKeyedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v27 && (objc_msgSend(v28, "timeIntervalSinceDate:", v27), v30 < 10.0))
        {
          brc_bread_crumbs((uint64_t)"_RefreshContainerMetadataIfNecessary", 328);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            __BRGetProcessMobileContainerForID_block_invoke_cold_1();

          objc_sync_exit(v26);
        }
        else
        {
          objc_msgSend((id)_RefreshContainerMetadataIfNecessary_updateContainerMetadataDateByContainerID, "setObject:forKeyedSubscript:", v29, v24);

          objc_sync_exit(v26);
          +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "remoteObjectProxy");
          v26 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "updateContainerMetadataForID:", v24);
        }

      }
    }
  }
LABEL_23:

  __brc_leave_section((uint64_t)&v34);
}

void __BRGetProcessMobileContainerForID_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] We've refreshed the container metadata in the last 10 seconds, ignoring the request%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
