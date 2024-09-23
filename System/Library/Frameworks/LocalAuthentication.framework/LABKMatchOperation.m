@implementation LABKMatchOperation

void __70___LABKMatchOperation_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  _LABKMatchResultInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  _LABKMatchResultInfo *v6;
  _QWORD v7[5];
  _LABKMatchResultInfo *v8;
  uint64_t v9;

  v2 = objc_alloc_init(_LABKMatchResultInfo);
  v3 = (void *)objc_opt_new();
  -[_LABKMatchResultInfo setIdentity:](v2, "setIdentity:", v3);

  v9 = 1;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bioLockoutState:forUser:error:", &v9, 0, 0);

  -[_LABKMatchResultInfo setLockoutState:](v2, "setLockoutState:", v9);
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70___LABKMatchOperation_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v7[3] = &unk_1E7079C98;
  v7[4] = v5;
  v8 = v2;
  v6 = v2;
  objc_msgSend(v5, "dispatchDelegateSelector:block:", sel_matchOperation_matchedWithResult_, v7);

}

void __70___LABKMatchOperation_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:matchedWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
