@implementation HKActivityStatisticsQuery

void __52___HKActivityStatisticsQuery_setQueryUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 192);
  *(_QWORD *)(v3 + 192) = v2;

}

uint64_t __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 152))
    v3 = &OBJC_IVAR____HKActivityStatisticsQuery__queryUpdateHandler;
  else
    v3 = &OBJC_IVAR____HKActivityStatisticsQuery__initialQueryResultsHandler;
  v4 = _Block_copy(*(const void **)(v2 + *v3));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 1;
  v5 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  if (v4)
  {
    v6 = v5;
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke_2;
    v11[3] = &unk_1E37E6710;
    v9 = v4;
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v9;
    v11[4] = v10;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, v6, v11);

  }
}

uint64_t __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end
