@implementation SFTranslationTargetLocaleAlertController

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "translationAlertController:didSelectLocale:", v5, *(_QWORD *)(a1 + 32));
      v4 = v5[165];
      if (v4)
        (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
    }

    WeakRetained = v5;
  }

}

uint64_t __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "translationAlertControllerShouldDismissAfterSelection:", v2);
    else
      v4 = 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_4;
  v3[3] = &unk_1E4AC08D8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
}

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=INTERNATIONAL"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v4, 0);

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

}

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "translationAlertController:didSelectLocale:", v3, 0);

    WeakRetained = v3;
  }

}

void __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke(uint64_t a1, char a2)
{
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke_2;
  block[3] = &unk_1E4AC29D8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v5);
}

void __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[166], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "setEnabled:", *(unsigned __int8 *)(a1 + 48));

    WeakRetained = v5;
  }

}

void __79___SFTranslationTargetLocaleAlertController__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1304));

  if (v2 == WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_stringForKey:", *MEMORY[0x1E0D8B6C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      objc_msgSend(*(id *)(a1 + 40), "translationAvailabilityDidChange");

  }
}

@end
