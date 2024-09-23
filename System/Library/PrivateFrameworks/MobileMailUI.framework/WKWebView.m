@implementation WKWebView

void __65__WKWebView_MessageContentView__mcv_executeJavaScriptExpression___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v9 = a2;
  v5 = a3;
  v6 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D1ED90] + 16))();
  v7 = v9;
  if (v6)
  {
    if (v5)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null", v9);
      v8 = objc_claimAutoreleasedReturnValue();
      v7 = v9;
    }

    v7 = (void *)v8;
  }
  v10 = v7;
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:");

}

id __78__WKWebView_MessageContentView__mcv_dictionaryFromJavaScriptMethod_arguments___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v3 = v2) != 0)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("An error occured trying to retrieve a dictionary from JS function, please check previous logging for issue!"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithError:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)v7;
  }

  return v5;
}

@end
