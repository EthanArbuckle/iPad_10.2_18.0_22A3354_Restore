@implementation CCDataResourceWriteAccess

+ (CCDataResourceWriteAccess)defaultInstance
{
  void *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;

  CCSetsRootDirectoryURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "cStringUsingEncoding:", 4);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(v5, v6);

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRootDirectoryURL:queue:", v2, v7);
  return (CCDataResourceWriteAccess *)v8;
}

- (CCDataResourceWriteAccess)initWithRootDirectoryURL:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  CCDataResourceWriteAccess *v9;
  CCDataResourceWriteAccess *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCDataResourceWriteAccess;
  v9 = -[CCDataResourceWriteAccess init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootDirectoryURL, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (id)setWriterForSet:(id)a3 accessAssertion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__CCDataResourceWriteAccess_setWriterForSet_accessAssertion___block_invoke;
  v13[3] = &unk_250990E28;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __61__CCDataResourceWriteAccess_setWriterForSet_accessAssertion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  CCDataResourceWriter *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v2 = (void *)a1[4];
  v18 = 0;
  objc_msgSend(v2, "_defaultDataSiteWithError:", &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v8 = (uint64_t)(a1 + 5);
    objc_msgSend(v3, "dataResourceForSet:", a1[5]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = -[CCDataResourceWriter initWithDataResource:accessAssertion:]([CCDataResourceWriter alloc], "initWithDataResource:accessAssertion:", v7, a1[6]);
      v10 = *(_QWORD *)(a1[7] + 8);
      v11 = *(NSObject **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;
    }
    else
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __61__CCDataResourceWriteAccess_setWriterForSet_accessAssertion___block_invoke_cold_2(v8, v11, v12, v13, v14, v15, v16, v17);
    }

  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__CCDataResourceWriteAccess_setWriterForSet_accessAssertion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v7);
  }

}

- (BOOL)performMaintenanceActivity:(id)a3 accessAssertion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__CCDataResourceWriteAccess_performMaintenanceActivity_accessAssertion___block_invoke;
  v12[3] = &unk_250991110;
  v14 = v6;
  v15 = &v16;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

uint64_t __72__CCDataResourceWriteAccess_performMaintenanceActivity_accessAssertion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_didRunMaintenance:accessAssertion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)_defaultDataSiteWithError:(id *)a3
{
  CCDataSite *dataSite;
  CCDataSite *v6;
  CCDataSite *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dataSite = self->_dataSite;
  if (!dataSite)
  {
    +[CCDataSite defaultDataSiteWithRootDirectoryURL:create:error:](CCDataSite, "defaultDataSiteWithRootDirectoryURL:create:error:", self->_rootDirectoryURL, 0, a3);
    v6 = (CCDataSite *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dataSite;
    self->_dataSite = v6;

    dataSite = self->_dataSite;
  }
  return dataSite;
}

- (BOOL)_didRunMaintenance:(id)a3 accessAssertion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint8_t *v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  id v54;
  uint8_t v55[4];
  const __CFString *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "Starting maintenance at default data site", buf, 2u);
  }

  v54 = 0;
  -[CCDataResourceWriteAccess _defaultDataSiteWithError:](self, "_defaultDataSiteWithError:", &v54);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v54;
  v11 = v10;
  if (!v9 || v10)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriteAccess _didRunMaintenance:accessAssertion:].cold.1((uint64_t)v11, v13, v20, v21, v22, v23, v24, v25);

    LOBYTE(v13) = 0;
  }
  else
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__8;
    v48 = __Block_byref_object_dispose__8;
    v49 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__8;
    v42 = __Block_byref_object_dispose__8;
    v43 = (id)objc_opt_new();
    v37 = 0;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __64__CCDataResourceWriteAccess__didRunMaintenance_accessAssertion___block_invoke;
    v31[3] = &unk_250991138;
    v34 = &v38;
    v32 = v7;
    v12 = v6;
    v33 = v12;
    v35 = &v50;
    v36 = buf;
    LODWORD(v13) = objc_msgSend(v9, "enumerateDataResources:setIdentifier:descriptors:includingTombstoned:usingBlock:", &v37, 0, 0, 1, v31);
    v11 = v37;
    if ((_DWORD)v13)
      LODWORD(v13) = *((_BYTE *)v51 + 24) == 0;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = (id)v39[5];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v59, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v14);
          LODWORD(v13) = v13 & objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "removeResource:", 0, (_QWORD)v27);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v59, 16);
      }
      while (v15);
    }

    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("aborted");
      if ((_DWORD)v13)
        v19 = CFSTR("completed");
      *(_DWORD *)v55 = 138412546;
      v56 = v19;
      v57 = 2112;
      v58 = v11;
      _os_log_impl(&dword_237B25000, v18, OS_LOG_TYPE_DEFAULT, "Maintenance for all resources finished with status: %@, error: %@", v55, 0x16u);
    }

    if ((_DWORD)v13)
      +[CCSetMetrics computeAndReportMetricsForAllSets:shouldDefer:](CCSetMetrics, "computeAndReportMetricsForAllSets:shouldDefer:", *((_QWORD *)v45 + 5), v12);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v50, 8);
  }

  return v13;
}

void __64__CCDataResourceWriteAccess__didRunMaintenance_accessAssertion___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  CCDataResourceWriter *v5;
  unint64_t v6;
  CCDataResourceWriter *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  CCDataResourceWriter *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = -[CCDataResourceWriter resourceStatus](v5, "resourceStatus");
  switch(v6)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
      __biome_log_for_category();
      v7 = (CCDataResourceWriter *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
      {
        CCDataResourceStatusToString(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v5;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_237B25000, &v7->super, OS_LOG_TYPE_DEFAULT, "Skipping maintenance for resource: %@ with status: %@", buf, 0x16u);

      }
      goto LABEL_15;
    case 1uLL:
      v7 = -[CCDataResourceWriter initWithDataResource:accessAssertion:]([CCDataResourceWriter alloc], "initWithDataResource:accessAssertion:", v5, a1[4]);
      v19 = 0;
      v9 = -[CCDataResourceWriter performMaintenance:shouldDefer:](v7, "performMaintenance:shouldDefer:", &v19, a1[5]);
      v10 = v19;
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v9)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v7;
          _os_log_impl(&dword_237B25000, v12, OS_LOG_TYPE_DEFAULT, "Completed maintenance for resource (%@)", buf, 0xCu);
        }

        if (v10)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v10);
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __64__CCDataResourceWriteAccess__didRunMaintenance_accessAssertion___block_invoke_cold_1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);

        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
        *a3 = 1;
      }

      goto LABEL_15;
    case 4uLL:
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v5);
      __biome_log_for_category();
      v7 = (CCDataResourceWriter *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v5;
        _os_log_impl(&dword_237B25000, &v7->super, OS_LOG_TYPE_DEFAULT, "Resource: %@ is in state deleting, will purge", buf, 0xCu);
      }
LABEL_15:

      break;
    default:
      break;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
  objc_storeStrong((id *)&self->_dataSite, 0);
}

void __61__CCDataResourceWriteAccess_setWriterForSet_accessAssertion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Failed to resolve default dataSite for set (%@) error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __61__CCDataResourceWriteAccess_setWriterForSet_accessAssertion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "Failed to obtain data resource for set (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_didRunMaintenance:(uint64_t)a3 accessAssertion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "Could not resolve default data site with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __64__CCDataResourceWriteAccess__didRunMaintenance_accessAssertion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "Aborted maintenance for resource: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
