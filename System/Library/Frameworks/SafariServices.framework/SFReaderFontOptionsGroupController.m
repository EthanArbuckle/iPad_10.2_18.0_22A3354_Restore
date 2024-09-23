@implementation SFReaderFontOptionsGroupController

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D8AB70];
  v5 = a2;
  objc_msgSend(v3, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadFont:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v5, "setDownloading:", 1);
}

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_2(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = a1[4];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_3;
  v3[3] = &unk_1E4AC3798;
  objc_copyWeak(&v7, a1 + 7);
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[4];
  objc_msgSend(v2, "isInstalledWithCompletionHandler:", v3);

  objc_destroyWeak(&v7);
}

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_3(id *a1, char a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_4;
  block[3] = &unk_1E4AC3770;
  v8 = a2;
  objc_copyWeak(&v7, a1 + 7);
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  if (*(_BYTE *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v6 = WeakRetained;
      objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
      objc_msgSend(*(id *)(a1 + 40), "setAccessoryView:", 0);
      objc_msgSend(v6, "_attributedStringForReaderFont:", *(_QWORD *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setAttributedTitle:", v3);

      v4 = (void *)v6[5];
      objc_msgSend(*(id *)(a1 + 48), "familyName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activateFont:", v5);

      WeakRetained = v6;
    }

  }
}

@end
