@implementation NSError

BOOL __47__NSError_FCCKAdditions__fc_isCKErrorWithCode___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

BOOL __60__NSError_FCCKAdditions__fc_isTemporaryNetworkOrServerError__block_invoke(uint64_t a1, unint64_t a2)
{
  _BOOL8 result;

  result = 1;
  if (a2 > 0x17 || ((1 << a2) & 0x8000D8) == 0)
    return a2 == 111;
  return result;
}

BOOL __57__NSError_FCCKAdditions__fc_hasIdentityStillSyncingError__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 111;
}

BOOL __49__NSError_FCCKAdditions__fc_hasIdentityLostError__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 112;
}

BOOL __60__NSError_FCCKAdditions__fc_hasXPCInterruptedOrInvalidError__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v4)
    v5 = ((objc_msgSend(v2, "code") - 4097) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  else
    v5 = 0;

  return v5;
}

id __66__NSError_FCErrorAdditions__fc_missingAssetErrorWithAssetHandles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "remoteURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __66__NSError_FCErrorAdditions__fc_missingAssetErrorWithAssetHandles___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "downloadError");
}

uint64_t __46__NSError_FCAdditions__fc_isCancellationError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_isCancellationError");
}

uint64_t __55__NSError_FCAdditions__fc_isOfflineErrorOfflineReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_isOfflineErrorOfflineReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

__CFString *__54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_2(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("FCErrorRetryAfter");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCErrorRetryAfter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (objc_msgSend(*(id *)(a1 + 32), "userInfo"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = (__CFString *)*MEMORY[0x1E0C94808],
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __53__NSError_FCAdditions__fc_failedDueToTaskConstraints__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_failedDueToTaskConstraints");
}

@end
