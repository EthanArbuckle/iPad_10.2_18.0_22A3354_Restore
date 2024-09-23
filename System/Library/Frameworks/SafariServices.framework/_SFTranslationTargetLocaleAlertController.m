@implementation _SFTranslationTargetLocaleAlertController

+ (id)translationAlertControllerWithDelegate:(id)a3 localeIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v7);

  objc_msgSend(v8, "_setUpWithLocaleIdentifiers:", v6);
  return v8;
}

- (void)_setUpWithLocaleIdentifiers:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *localeIdentifierToAlertActionMap;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _SFTranslationTargetLocaleAlertActionContentViewController *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id location;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  localeIdentifierToAlertActionMap = self->_localeIdentifierToAlertActionMap;
  self->_localeIdentifierToAlertActionMap = v5;

  objc_initWeak(&location, self);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v22 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      v23 = v7;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v8);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke;
        v31[3] = &unk_1E4AC0888;
        objc_copyWeak(&v32, &location);
        v31[4] = v9;
        v10 = (void *)MEMORY[0x1A8598C40](v31);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_2;
        v29[3] = &unk_1E4AC29B0;
        objc_copyWeak(&v30, &location);
        v11 = (void *)MEMORY[0x1A8598C40](v29);
        v12 = -[_SFTranslationTargetLocaleAlertActionContentViewController initWithLocaleIdentifier:]([_SFTranslationTargetLocaleAlertActionContentViewController alloc], "initWithLocaleIdentifier:", v9);
        objc_msgSend(MEMORY[0x1E0DC3448], "sf_actionWithContentViewController:style:handler:shouldDismissHandler:", v12, 0, v10, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEnabled:", 0);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localeIdentifierToAlertActionMap, "setObject:forKeyedSubscript:", v13, v9);
        -[_SFTranslationTargetLocaleAlertController addAction:](self, "addAction:", v13);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_3;
          v27[3] = &unk_1E4AC05E0;
          v28 = v13;
          objc_msgSend(WeakRetained, "translationAlertController:validateTargetLocale:completionHandler:", self, v9, v27);

        }
        objc_destroyWeak(&v30);

        objc_destroyWeak(&v32);
        ++v8;
      }
      while (v23 != v8);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }

  v15 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_5;
  v26[3] = &unk_1E4AC0010;
  v26[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFTranslationTargetLocaleAlertController addAction:](self, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_6;
  v24[3] = &unk_1E4AC0A90;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFTranslationTargetLocaleAlertController addAction:](self, "addAction:", v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (_SFTranslationTargetLocaleAlertController)initWithTranslationContext:(id)a3
{
  id v4;
  _SFTranslationTargetLocaleAlertController *v5;
  void *v6;
  void *v7;
  _SFTranslationTargetLocaleAlertController *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (_SFTranslationTargetLocaleAlertController *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIAlertController setImageIfNecessaryWithName:](v5, "setImageIfNecessaryWithName:", CFSTR("alert-translation"));
    objc_storeWeak((id *)&v5->_translationContext, v4);
    objc_storeWeak((id *)&v5->_delegate, v5);
    objc_msgSend(v4, "availableTargetLocaleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFTranslationTargetLocaleAlertController _setUpWithLocaleIdentifiers:](v5, "_setUpWithLocaleIdentifiers:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__translationAvailabilityDidChange_, *MEMORY[0x1E0D8B6B8], v4);

    v8 = v5;
  }

  return v5;
}

- (void)configurePopoverWithSourceInfo:(id)a3
{
  id v4;
  void *v5;
  _SFPopoverPresentationDelegate *v6;

  v4 = a3;
  v6 = -[_SFPopoverPresentationDelegate initWithSourceInfo:]([_SFPopoverPresentationDelegate alloc], "initWithSourceInfo:", v4);

  -[_SFTranslationTargetLocaleAlertController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
  -[_SFTranslationTargetLocaleAlertController popoverPresentationController](self, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPopoverPresentationDelegate attachToPopoverPresentationController:](v6, "attachToPopoverPresentationController:", v5);

}

- (void)translationAvailabilityDidChange
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id location;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSMutableDictionary allKeys](self->_localeIdentifierToAlertActionMap, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke;
          v9[3] = &unk_1E4AC1EB8;
          objc_copyWeak(&v10, &location);
          v9[4] = v8;
          objc_msgSend(WeakRetained, "translationAlertController:validateTargetLocale:completionHandler:", self, v8, v9);
          objc_destroyWeak(&v10);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v5);
    }

    objc_destroyWeak(&location);
  }

}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _SFTranslationTargetLocaleAlertController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79___SFTranslationTargetLocaleAlertController__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E4ABFB20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)translationAlertController:(id)a3 didSelectLocale:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_translationContext);
    objc_msgSend(WeakRetained, "requestTranslatingWebpageToLocale:completionHandler:", v6, 0);

  }
}

- (void)translationAlertController:(id)a3 validateTargetLocale:(id)a4 completionHandler:(id)a5
{
  WBSTranslationContext **p_translationContext;
  id v7;
  id v8;
  id WeakRetained;

  p_translationContext = &self->_translationContext;
  v7 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_translationContext);
  objc_msgSend(WeakRetained, "validateTargetLocale:completionHandler:", v8, v7);

}

- (_SFTranslationTargetLocaleAlertControllerDelegate)delegate
{
  return (_SFTranslationTargetLocaleAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)analyticsHandler
{
  return self->_analyticsHandler;
}

- (void)setAnalyticsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (NSMutableDictionary)localeIdentifierToAlertActionMap
{
  return self->_localeIdentifierToAlertActionMap;
}

- (void)setLocaleIdentifierToAlertActionMap:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifierToAlertActionMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifierToAlertActionMap, 0);
  objc_storeStrong(&self->_analyticsHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_translationContext);
}

@end
