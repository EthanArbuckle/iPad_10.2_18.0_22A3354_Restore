@implementation DKSyncRapportContextStorage

void __46___DKSyncRapportContextStorage_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_292;
  sharedInstance_sharedInstance_292 = v0;

}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:](*(_QWORD **)(a1 + 32), a2, a3, a4);
}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:](*(id **)(a1 + 32), a2, a3, a4);
}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:](*(id **)(a1 + 32), a2, a3, a4);
}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:](*(id **)(a1 + 32), a2, a3, a4);
}

void __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleFetchContextValuesWithResponse:options:error:peer:plStartDate:completion:](a1[4], a2, a3, a4, a1[5], a1[6], a1[7]);
}

uint64_t __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleSendContextValuesWithResponse:options:error:peer:plStartDate:completion:](a1[4], a2, a3, a4, a1[5], a1[6], a1[7]);
}

uint64_t __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:](a1[4], a2, a3, a4, a1[5], a1[6], a1[7]);
}

uint64_t __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:](a1[4], a2, a3, a4, a1[5], a1[6], a1[7]);
}

uint64_t __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
