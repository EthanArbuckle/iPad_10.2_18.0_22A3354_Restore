@implementation FEFocusSystem

void __47___FEFocusSystem__tickHasSeenFocusedItemTimer___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hasSeenFocusedItemDidExpire");

}

void __38___FEFocusSystem__requestFocusUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

uint64_t __55___FEFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_focusSystemIsValid");
  if ((_DWORD)result)
  {
    result = _FEFocusEnvironmentIsEligibleForFocusOcclusion(*(void **)(a1 + 40), 0);
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "_focusEnvironmentWillDisappear:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __49___FEFocusSystem__focusEnvironmentWillDisappear___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _FEFocusUpdateRequest *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (objc_msgSend(v5, sel_allowsWeakReference))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v5 && !v7)
  {
    logger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_fault_impl(&dword_23C48C000, v13, OS_LOG_TYPE_FAULT, "Focus system attempting to use a deallocating focus environment. Offending object: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  else if (v7 && v7 != *(id *)(a1 + 32))
  {
    v9 = -[_FEFocusUpdateRequest initWithEnvironment:]([_FEFocusUpdateRequest alloc], "initWithEnvironment:", v7);
    -[_FEFocusUpdateRequest setAllowsFocusingCurrentItem:](v9, "setAllowsFocusingCurrentItem:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_requestFocusUpdate:", v9);
    v10 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "environment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v8)
        *a3 = 1;
    }

  }
}

void __45___FEFocusSystem__focusEnvironmentDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

void __61___FEFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_willUpdateFocusInContext:", *(_QWORD *)(a1 + 32));

}

uint64_t __60___FEFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyEnvironment:didUpdateFocusInContext:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 32) != a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  *a3 = 1;
  return result;
}

uint64_t __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __105___FEFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 40))
  {
    result = objc_msgSend(*(id *)(result + 32), "_effectiveFocusDeferralBehavior");
    if (result)
      result = objc_msgSend(*(id *)(v1 + 32), "_resetFocusDeferral");
  }
  if (!*(_BYTE *)(v1 + 41))
    return objc_msgSend(*(id *)(v1 + 32), "requestFocusUpdateToEnvironment:", *(_QWORD *)(v1 + 32));
  return result;
}

uint64_t __57___FEFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __47___FEFocusSystem__reevaluateLockedEnvironments__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

void __44___FEFocusSystem__updateFocusUpdateThrottle__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFocusIfNeeded");

}

@end
