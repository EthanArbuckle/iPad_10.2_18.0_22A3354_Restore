@implementation DKSyncRapportKnowledgeStorage

void __48___DKSyncRapportKnowledgeStorage_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_183;
  sharedInstance_sharedInstance_183 = v0;

  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", objc_msgSend((id)sharedInstance_sharedInstance_183, "transportType"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedInstance_sharedInstance_183, "setPolicy:", v2);

}

void __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:](*(id **)(a1 + 32), a2, a3, a4);
}

void __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:](*(_QWORD *)(a1 + 32), a2, a3, a4);
}

void __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithResponse:options:error:peer:plStartDate:completion:](*(id **)(a1 + 32), a2, a3, a4, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

uint64_t __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithResponse:options:error:peer:plStartDate:completion:](*(id **)(a1 + 32), a2, a3, a4, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

uint64_t __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

@end
