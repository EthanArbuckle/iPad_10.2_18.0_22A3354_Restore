@implementation HKDatabaseChangesQuery

uint64_t __46___HKDatabaseChangesQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

void __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 168));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke_2;
    v8[3] = &unk_1E37F3128;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);

  }
}

uint64_t __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

@end
