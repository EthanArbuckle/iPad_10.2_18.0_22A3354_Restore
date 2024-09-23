@implementation JavascriptOperation

void __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke_2;
  v10[3] = &unk_1E9C40210;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v5 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

@end
