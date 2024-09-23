@implementation HKObjectTypeAnchorQuery

void __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke_2;
  v6[3] = &unk_1E37E6710;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = v2;
  v6[4] = v4;
  v7 = *(id *)(a1 + 48);
  v5 = v2;
  objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, 0, v6);

}

uint64_t __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end
