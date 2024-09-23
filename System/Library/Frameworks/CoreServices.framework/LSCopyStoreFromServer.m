@implementation LSCopyStoreFromServer

void ___LSCopyStoreFromServer_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = *(_QWORD *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v11;
  v27 = v11;

  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v12;
  v19 = v12;

  v20 = *(_QWORD *)(a1[6] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v13;
  v22 = v13;

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a5;
  v23 = *(_QWORD *)(a1[8] + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v14;
  v25 = v14;

  v26 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  if (v26)
    LOBYTE(v26) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = v26;

}

uint64_t ___LSCopyStoreFromServer_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___LSCopyStoreFromServer_block_invoke_53(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    ___LSCopyStoreFromServer_block_invoke_53_cold_1((uint64_t)v2, v3);

}

uint64_t ___LSCopyStoreFromServer_block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___LSCopyStoreFromServer_block_invoke_2_56()
{
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LAUNCH_SERVICES_IS_WAITING_ON_THE_MAIN_QUEUE_DUE_TO_A_MANUAL_REBUILD__);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LAUNCH_SERVICES_WAS_ASKED_TO_PERFORM_BLOCKING_IO_ON_THE_MAIN_QUEUE__);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LAUNCH_SERVICES_IS_RESEEDING_ITS_DATABASE_DUE_TO_A_MANUAL_REBUILD_AND_MAY_BLOCK__);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)__LAUNCH_SERVICES_IS_RESEEDING_ITS_DATABASE_AND_MAY_BLOCK__);
}

void ___LSCopyStoreFromServer_block_invoke_53_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "error on blocking retry to fetch database: %@", (uint8_t *)&v2, 0xCu);
}

@end
