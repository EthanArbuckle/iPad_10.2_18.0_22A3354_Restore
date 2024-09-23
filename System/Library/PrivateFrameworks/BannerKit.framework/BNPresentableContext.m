@implementation BNPresentableContext

void __61___BNPresentableContext___setBannerAppearState_reason_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setBannerAppearState:reason:", objc_msgSend(*(id *)(a1 + 32), "intValue"), *(_QWORD *)(a1 + 40));

}

void __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  _QWORD v4[5];
  id v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3[6], "presentableWillNotAppearAsBanner:withReason:", v3[6], *(_QWORD *)(a1 + 32));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke_2;
    v4[3] = &unk_1E7044580;
    v4[4] = v3;
    v5 = *(id *)(a1 + 32);
    objc_msgSend(v3, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillNotAppearAsBanner_withReason_, v4);

    WeakRetained = v3;
  }

}

uint64_t __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillNotAppearAsBanner:withReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40));
}

void __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  char *v4;
  id *v5;
  _QWORD *v6;
  char v7;
  id *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
    {
      v4 = sel_userInteractionWillBeginForBannerForPresentable_;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8[6], "userInteractionWillBeginForBannerForPresentable:", v8[6]);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_2;
      v10[3] = &unk_1E70445D0;
      v5 = v8;
      v10[4] = v8;
      v6 = v10;
LABEL_10:
      objc_msgSend(v5, "_enumerateObserversRespondingToSelector:usingBlock:", v4, v6);
      v3 = v8;
      goto LABEL_11;
    }
    v7 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
    v3 = v8;
    if ((v7 & 1) == 0)
    {
      v4 = sel_userInteractionDidEndForBannerForPresentable_;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8[6], "userInteractionDidEndForBannerForPresentable:", v8[6]);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_3;
      v9[3] = &unk_1E70445D0;
      v5 = v8;
      v9[4] = v8;
      v6 = v9;
      goto LABEL_10;
    }
  }
LABEL_11:

}

uint64_t __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionWillBeginForBannerForPresentable:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionDidEndForBannerForPresentable:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __60___BNPresentableContext___handleTemplateContentEvent_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "handleTemplateContentEvent:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  return result;
}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = a2;
  +[BNPresentableContextSessionSpecification serviceQuality](BNPresentableContextSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[BNPresentableContextSessionSpecification interface](BNPresentableContextSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke_2;
  v11[3] = &unk_1E70442C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setActivationHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke_38;
  v9[3] = &unk_1E70442C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke_39;
  v7[3] = &unk_1E70442C0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BYTE *v3;
  NSObject *v4;
  int v5;
  _BYTE *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1B9628000, v4, OS_LOG_TYPE_DEFAULT, "BNPresentableContext (service-side) connection activated: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    v3[45] = 1;
    objc_sync_exit(v3);

  }
}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)BNLogContextService;
  if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 138543362;
    v8 = WeakRetained;
    _os_log_impl(&dword_1B9628000, v5, OS_LOG_TYPE_DEFAULT, "BNPresentableContext (service-side) connection interrupted: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v3, "activate");

}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_sync_enter(v6);
    v7 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1B9628000, v7, OS_LOG_TYPE_DEFAULT, "BNPresentableContext (service-side) connection invalidated: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    v8 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = 0;

    if (*((_BYTE *)v6 + 45))
      objc_msgSend(v6, "_runPostConnectionInvalidation");
    objc_sync_exit(v6);

  }
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillAppearAsBanner:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_49(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidAppearAsBanner:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_52(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillDisappearAsBanner:withReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_55(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidDisappearAsBanner:withReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40));
}

void __55___BNPresentableContext__runPostConnectionInvalidation__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[10])
  {
    v3 = (void *)BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)v2[6];
      v5 = v3;
      BNEffectivePresentableDescription(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1B9628000, v5, OS_LOG_TYPE_DEFAULT, "Connection invalidated, updating banner appear state: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    if (*((_DWORD *)v2 + 10) != 3)
      objc_msgSend(v2, "_setBannerAppearState:reason:", 3, CFSTR("BNPresentableContext (service-side) connection invalidated."));
    objc_msgSend(v2, "_setBannerAppearState:reason:", 0, CFSTR("BNPresentableContext (service-side) connection invalidated."));
  }

}

@end
