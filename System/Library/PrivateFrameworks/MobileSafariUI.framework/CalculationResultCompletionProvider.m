@implementation CalculationResultCompletionProvider

- (CalculationResultCompletionProvider)init
{
  CalculationResultCompletionProvider *v2;
  WBSCalculationResultProvider *v3;
  WBSCalculationResultProvider *calcuationResultProvider;
  CalculationResultCompletionProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalculationResultCompletionProvider;
  v2 = -[CompletionProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = (WBSCalculationResultProvider *)objc_alloc_init(MEMORY[0x1E0D8A810]);
    calcuationResultProvider = v2->_calcuationResultProvider;
    v2->_calcuationResultProvider = v3;

    v5 = v2;
  }

  return v2;
}

- (void)setQueryToComplete:(id)a3
{
  id v4;
  void *v5;
  WBSCalculationResultProvider *calcuationResultProvider;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  calcuationResultProvider = self->_calcuationResultProvider;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CalculationResultCompletionProvider_setQueryToComplete___block_invoke;
  v9[3] = &unk_1E9CF5890;
  objc_copyWeak(&v12, &location);
  v7 = v5;
  v10 = v7;
  v8 = v4;
  v11 = v8;
  -[WBSCalculationResultProvider evaluateQuery:resultHandler:](calcuationResultProvider, "evaluateQuery:resultHandler:", v8, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __58__CalculationResultCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  CalculationResultCompletionItem *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = -[CalculationResultCompletionItem initWithQuery:calculationResult:]([CalculationResultCompletionItem alloc], "initWithQuery:calculationResult:", *(_QWORD *)(a1 + 40), v3);
      v8[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCompletions:forString:", v7, *(_QWORD *)(a1 + 32));

    }
    else
    {
      objc_msgSend(WeakRetained, "setCompletions:forString:", MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calcuationResultProvider, 0);
}

@end
