@implementation SYMessageTimerTable

uint64_t __31___SYMessageTimerTable_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_15);
}

void __31___SYMessageTimerTable_dealloc__block_invoke_2(int a1, int a2, dispatch_source_t source)
{
  dispatch_source_cancel(source);
}

void __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_fireCallbackForSeqno:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupTimerForSeqno:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_3(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(v5, "identifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

void __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_getAssociatedObject(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), (const void *)kTimerContextKey);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1[4] + 40);
    objc_msgSend(v7, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

void __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

void __53___SYMessageTimerTable_cancelTimerForSequenceNumber___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __49___SYMessageTimerTable_cancelTimerForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __34___SYMessageTimerTable_timerCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
