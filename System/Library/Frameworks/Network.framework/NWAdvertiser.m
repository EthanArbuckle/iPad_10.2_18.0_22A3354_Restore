@implementation NWAdvertiser

void __22___NWAdvertiser_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void **WeakRetained;
  void **v5;
  uint64_t v6;
  NSObject *v7;
  const char *id_string;
  id v9;
  _DWORD *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *((_QWORD *)WeakRetained[1] + 2);
    if (v6 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v6 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v7 = (id)glistenerLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id_string = nw_listener_get_id_string(v5[1]);
        v11 = 136446466;
        v12 = "-[_NWAdvertiser start]_block_invoke";
        v13 = 2082;
        v14 = id_string;
        _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Advertiser path update", (uint8_t *)&v11, 0x16u);
      }

    }
    v9 = v3;
    nw_context_assert_queue(*((void **)v5[1] + 3));
    v10 = v5[1];
    if ((v10[32] - 1) <= 1 && (*((_BYTE *)v10 + 302) & 1) == 0)
    {
      -[_NWAdvertiser updateFlows:]((uint64_t)v5, v9);
      -[_NWAdvertiser reconcileChildren:]((uint64_t)v5, v9);
    }

  }
}

void __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 280), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64));
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 120));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
                                                           + 16))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

void __21___NWAdvertiser_stop__block_invoke(uint64_t a1)
{
  DNSServiceRefDeallocate(*(DNSServiceRef *)(a1 + 40));
}

void __21___NWAdvertiser_stop__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(*(_QWORD *)(a1[4] + 8) + 64));
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1[4] + 8) + 120));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(*(_QWORD *)(a1[4] + 8) + 280));
}

uint64_t __21___NWAdvertiser_stop__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

uint64_t __29___NWAdvertiser_updateFlows___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  NWConcrete_nw_path_flow_registration *v5;
  _BYTE *v6;
  char v7;

  v5 = a3;
  v6 = nw_path_copy_flow_for_registration(*(NWConcrete_nw_path **)(a1 + 32), v5);
  if (v6)
  {
    v7 = v6[186];

    if ((v7 & 4) != 0)
      nw_dictionary_set_value(*(_QWORD *)(a1 + 40), a2, v5);
  }

  return 1;
}

uint64_t __29___NWAdvertiser_updateFlows___block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *id_string;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  if (v6 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v6 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v7 = (id)glistenerLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id_string = nw_listener_get_id_string(*(void **)(*(_QWORD *)(a1 + 32) + 8));
      v10 = 136446722;
      v11 = "-[_NWAdvertiser updateFlows:]_block_invoke_2";
      v12 = 2082;
      v13 = id_string;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] Removing defunct flow registration %{public}@", (uint8_t *)&v10, 0x20u);
    }

  }
  nw_path_flow_registration_close(v5);
  nw_dictionary_set_value(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), a2, 0);

  return 1;
}

void __29___NWAdvertiser_updateFlows___block_invoke_6(uint64_t a1, unsigned __int8 *uu)
{
  uint64_t v4;
  uint64_t v5;
  void *flow_inner;
  char out[40];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 56);
  if (!v5)
    goto LABEL_4;
  flow_inner = nw_dictionary_copy_value(v5, (uint64_t)out);
  if (!flow_inner)
  {
    v4 = *(_QWORD *)(a1 + 32);
LABEL_4:
    flow_inner = nw_path_evaluator_create_flow_inner(*(void **)(v4 + 32), 0, 0, 1, 0, uu, 0, 0, 0);
  }
  nw_dictionary_set_value(*(_QWORD *)(a1 + 40), out, flow_inner);

}

@end
