@implementation SFReaderController

void __65___SFReaderController_prepareReaderPrintingIFrameWithCompletion___block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "readerControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareReaderContentForPrinting");

  }
  else
  {
    if (WeakRetained)
    {
      v6 = (void *)WeakRetained[6];
      WeakRetained[6] = 0;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __65___SFReaderController_setUpReaderWebViewIfNeededAndPerformBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __65___SFReaderController_collectReaderContentForMailWithCompletion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_collectReaderContentForMailWithCompletion:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __66___SFReaderController__collectReaderContentForMailWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __44___SFReaderController_setReaderLanguageTag___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "possibleFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = (id *)(a1 + 40);
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __44___SFReaderController_setReaderLanguageTag___block_invoke_2;
        v10[3] = &unk_1E4AC1EB8;
        objc_copyWeak(&v11, v6);
        v10[4] = v9;
        objc_msgSend(v9, "isInstalledWithCompletionHandler:", v10);
        objc_destroyWeak(&v11);
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __44___SFReaderController_setReaderLanguageTag___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD v3[5];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __44___SFReaderController_setReaderLanguageTag___block_invoke_3;
    v3[3] = &unk_1E4ABFF70;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    v3[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(&v4);
  }
}

void __44___SFReaderController_setReaderLanguageTag___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "familyName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "activateFont:", v2);

}

uint64_t __70___SFReaderController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D4F530]);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_updateJavaScriptEnabled");
  return result;
}

@end
