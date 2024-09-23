@implementation WKWebView(MessageContentView)

- (id)_mcv_executeJavaScriptMethod:()MessageContentView arguments:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    if (v7)
      v8 = v7;
    else
      v8 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);

  }
  else
  {
    v10 = CFSTR("[]");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_try_catch_wrap(%@).apply(null, %@);"), v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mcv_executeJavaScriptExpression:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)mcv_executeJavaScriptExpression:()MessageContentView
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__WKWebView_MessageContentView__mcv_executeJavaScriptExpression___block_invoke;
  v9[3] = &unk_1E9A04098;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "evaluateJavaScript:completionHandler:", v4, v9);
  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mcv_stringFromJavaScriptMethod:()MessageContentView arguments:
{
  objc_msgSend(a1, "_mcv_executeJavaScriptMethod:arguments:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mcv_dictionaryFromJavaScriptMethod:()MessageContentView arguments:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_mcv_executeJavaScriptMethod:arguments:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "then:", &__block_literal_global_13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
