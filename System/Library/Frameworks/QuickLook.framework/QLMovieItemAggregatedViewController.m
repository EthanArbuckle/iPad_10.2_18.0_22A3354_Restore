@implementation QLMovieItemAggregatedViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDB2378];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v15[3] = &unk_24C7263D8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "assetIsAutoloopMedia:completionHandler:", v14, v15);

}

void __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  QLRunInMainThread();

}

void __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  v2 = (void *)objc_opt_new();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1136), v2);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
  v6[3] = &unk_24C726388;
  objc_copyWeak(&v9, &location);
  v5 = v2;
  v7 = v5;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v5, "loadPreviewControllerIfNeededWithContents:context:completionHandler:", v3, v4, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  objc_copyWeak(&v7, a1 + 6);
  v4 = a1[4];
  v6 = a1[5];
  v5 = v3;
  QLRunInMainThread();

  objc_destroyWeak(&v7);
}

uint64_t __99__QLMovieItemAggregatedViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "showPreviewViewController:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
}

@end
