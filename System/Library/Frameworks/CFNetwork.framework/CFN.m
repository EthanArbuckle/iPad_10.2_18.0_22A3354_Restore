@implementation CFN

void __50____CFN_ConnectionContextManager_registerSession___block_invoke_2(uint64_t a1)
{
  nw_release(*(void **)(a1 + 32));
}

void __34____CFN_ConnectionMetrics_tcpInfo__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

__CFN_ConnectionContextManager *__47____CFN_ConnectionContextManager_sharedManager__block_invoke()
{
  __CFN_ConnectionContextManager *result;

  result = objc_alloc_init(__CFN_ConnectionContextManager);
  _sharedManager = (uint64_t)result;
  return result;
}

void __53____CFN_ConnectionMetrics_collectDataTransferReport___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __36____CFN_ConnectionMetrics_establish__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), a2);
  return 1;
}

uint64_t __41____CFN_ConnectionMetrics__subflowCounts__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_uint64_get_value(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  return 1;
}

void __40____CFN_ConnectionMetrics_subflowCounts__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
