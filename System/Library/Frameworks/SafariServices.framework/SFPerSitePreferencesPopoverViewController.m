@implementation SFPerSitePreferencesPopoverViewController

SFPerSiteSetting *__61___SFPerSitePreferencesPopoverViewController_pageMenuSection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SFPerSiteSetting *v4;
  void *v5;
  SFPerSiteSetting *v6;

  v3 = a2;
  v4 = [SFPerSiteSetting alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "managerForPreference:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFPerSiteSetting initWithPreference:manager:domain:](v4, "initWithPreference:manager:domain:", v3, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));

  return v6;
}

void __80___SFPerSitePreferencesPopoverViewController__setPreferenceValue_forPreference___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    v6 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_38);

    WeakRetained = v6;
  }

}

uint64_t __80___SFPerSitePreferencesPopoverViewController__setPreferenceValue_forPreference___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
}

void __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    block[3] = &unk_1E4ABFC38;
    block[4] = WeakRetained;
    v7 = v3;
    v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didRetrieveValue:forPreference:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __80___SFPerSitePreferencesPopoverViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginUpdates");
  objc_msgSend(*(id *)(a1 + 32), "reloadRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 40), 5);
  return objc_msgSend(*(id *)(a1 + 32), "endUpdates");
}

uint64_t __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSwitchOn:", 1);
}

void __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(id **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3[128], "managerForPreference:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[_SFPerSitePreferencesUtilities preferenceValueForBoolValue:preference:preferenceManager:](_SFPerSitePreferencesUtilities, "preferenceValueForBoolValue:preference:preferenceManager:", v2, v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setPreferenceValue:forPreference:", v5, *(_QWORD *)(a1 + 40));

}

@end
