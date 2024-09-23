@implementation SFPrintController

void __89___SFPrintController__preparePrintInteractionControllerForUsage_onlyIfLoaded_completion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  id v4;

  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_preparePrintInteractionControllerForUsage:onlyIfLoaded:completion:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
      WeakRetained = v4;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __89___SFPrintController__preparePrintInteractionControllerForUsage_onlyIfLoaded_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *WeakRetained;
  void *v4;
  void *v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setURLString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  if (!objc_msgSend(*(id *)(a1 + 48), "_isDisplayingPDF"))
  {
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 56), "readerWebView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_webViewPrintFormatter");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      if (WeakRetained)
      {
LABEL_5:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setDelegate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setPrintPageRenderer:", *(_QWORD *)(a1 + 32));
        objc_msgSend(WeakRetained, "setFrameToPrint:", v7);
        objc_msgSend(*(id *)(a1 + 32), "setContentFormatter:", WeakRetained);
        objc_msgSend(WeakRetained, "setSnapshotFirstPage:", *(_QWORD *)(a1 + 72) == 2);
        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_webViewPrintFormatter");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      if (WeakRetained)
        goto LABEL_5;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setPrintPageRenderer:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
  objc_msgSend(WeakRetained, "_dataForDisplayedPDF");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setPrintingItem:", v4);

LABEL_6:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setShowsPaperSelectionForLoadedPapers:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setIsContentManaged:", objc_msgSend(*(id *)(a1 + 40), "_isContentManaged"));
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_9:
  v6();

}

void __39___SFPrintController__printCurrentItem__block_invoke(uint64_t a1, char a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = (void *)v3[13];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39___SFPrintController__printCurrentItem__block_invoke_2;
    v5[3] = &unk_1E4AC1968;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    if (objc_msgSend(v4, "presentAnimated:completionHandler:", 1, v5))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    objc_destroyWeak(&v6);
  }
  else
  {
    objc_msgSend(v3, "_didFinishPrintingCurrentItemWithResult:fromPrintInteractionControllerCompletion:", 2, 0);
  }
}

void __39___SFPrintController__printCurrentItem__block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *WeakRetained;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[64] = 0;
    v7 = 1;
    if (!a4)
      v7 = 2;
    if (a3)
      v8 = 0;
    else
      v8 = v7;
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "_didFinishPrintingCurrentItemWithResult:fromPrintInteractionControllerCompletion:", v8, 1);
    WeakRetained = v9;
  }

}

void __103___SFPrintController__didFinishPrintingCurrentItemWithResult_fromPrintInteractionControllerCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleNextPrintRequest");

}

uint64_t __103___SFPrintController__didFinishPrintingCurrentItemWithResult_fromPrintInteractionControllerCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeWithResult:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "handleNextPrintRequest");
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v4 + 24))
  {
    *(_BYTE *)(v4 + 24) = 1;
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 32), "printInteractionControllerDidFinish");
    v5 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = 134217984;
      v8 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Finished generating PDF data of length %zu", (uint8_t *)&v7, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_23(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "_setupPrintPanel:", 0);
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_24;
    v7[3] = &unk_1E4AC1A30;
    v5 = v3;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v4, "_generatePrintPreview:", v7);

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Printing isn't currently allowed, so returning nil PDF data", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_2;
  block[3] = &unk_1E4AC1A08;
  v7 = v3;
  v4 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  v3 = a1[4];
  v16 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfURL:options:error:", v3, 1, &v16);
  v5 = v16;
  v6 = WBS_LOG_CHANNEL_PREFIXPrinting();
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v4 == 0;
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "length");
      v12 = a1[4];
      *(_DWORD *)buf = 138543875;
      v18 = (uint64_t)v10;
      v19 = 2048;
      v20 = v11;
      v21 = 2113;
      v22 = v12;
      _os_log_error_impl(&dword_1A3B2D000, v9, OS_LOG_TYPE_ERROR, "Failed to generate PDF data: %{public}@; PDF data length: %zu; PDF URL: %{private}@",
        buf,
        0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14 = v7;
    v15 = objc_msgSend(v4, "length");
    *(_DWORD *)buf = 134217984;
    v18 = v15;
    _os_log_impl(&dword_1A3B2D000, v14, OS_LOG_TYPE_INFO, "Successfully generated PDF data of length %zu", buf, 0xCu);

  }
  (*(void (**)(void))(a1[6] + 16))();
  objc_msgSend(*(id *)(a1[5] + 104), "_cleanPrintState");

}

uint64_t __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_27_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44___SFPrintController_handleNextPrintRequest__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (a2)
      objc_msgSend(WeakRetained, "_printCurrentItem");
    else
      objc_msgSend(WeakRetained, "_didFinishPrintingCurrentItemWithResult:fromPrintInteractionControllerCompletion:", 2, 0);
    WeakRetained = v4;
  }

}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_27_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "PDF generation took too long, early returning with nil data", a5, a6, a7, a8, 0);
}

@end
