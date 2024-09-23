@implementation LABKOperation

uint64_t __49___LABKOperation_dispatchDelegateSelector_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operation:presenceStateChanged:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isUserPresent"));

}

void __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operation:stateChanged:", *(_QWORD *)(a1 + 32), 4);

}

void __33___LABKOperation_startWithReply___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;

  v7 = a3;
  v5 = objc_opt_class();
  v6 = CFSTR("YES");
  if (!a2)
    v6 = v7;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", v5, *(_QWORD *)(a1 + 48), CFSTR("started: %@"), v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
