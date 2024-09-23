@implementation LTMultiParagraphTranslationRequest

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  _LTCombinedRouteParagraphTranslationRequest *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11[2];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = -[_LTTranslationRequest initWithLocalePair:]([_LTCombinedRouteParagraphTranslationRequest alloc], "initWithLocalePair:", WeakRetained[1]);
    objc_msgSend(v5, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTParagraphTranslationRequest setText:](v7, "setText:", v8);

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_2;
    v9[3] = &unk_250693C90;
    objc_copyWeak(v11, (id *)(a1 + 48));
    v10 = *(id *)(a1 + 32);
    v11[1] = a3;
    -[_LTParagraphTranslationRequest setCompletionHandler:](v7, "setCompletionHandler:", v9);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

    objc_destroyWeak(v11);
  }

}

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  NSObject **v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[5];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_3;
    block[3] = &unk_250693C68;
    v13 = v6;
    v14 = v8;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    v15 = v10;
    v17 = v11;
    v16 = v5;
    dispatch_async(v9, block);

  }
}

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v7);

    goto LABEL_5;
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

    objc_msgSend(*(id *)(a1 + 40), "_cleanUp");
LABEL_5:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    return;
  }
  v8 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_INFO, "Completion was already nil-ed out since we've already called it, early returning", v9, 2u);
  }
}

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_9(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  void (**v2)(void *, _LTCombinedTranslationResult *, _QWORD);
  uint64_t v3;
  void *v4;
  uint64_t i;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  _LTCombinedTranslationResult *v9;
  dispatch_queue_t v10;
  dispatch_queue_t *v11;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[5]);
    v2 = (void (**)(void *, _LTCombinedTranslationResult *, _QWORD))_Block_copy(v11[4]);
    if (v2)
    {
      v3 = -[NSObject count](v11[2], "count");
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        for (i = 0; i != v3; ++i)
        {
          v6 = v11[3];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            objc_msgSend(v4, "addObject:", v8);

        }
      }
      v9 = -[_LTCombinedTranslationResult initWithParagraphResults:localePair:]([_LTCombinedTranslationResult alloc], "initWithParagraphResults:localePair:", v4, v11[1]);
      v2[2](v2, v9, 0);
      v10 = v11[4];
      v11[4] = 0;

      -[dispatch_queue_t _cleanUp](v11, "_cleanUp");
    }

    WeakRetained = v11;
  }

}

@end
