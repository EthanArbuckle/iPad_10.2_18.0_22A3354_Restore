@implementation UniversalSearchCompletionProvider

- (UniversalSearchCompletionProvider)initWithFrequentlyVisitedSitesController:(id)a3
{
  id v5;
  UniversalSearchCompletionProvider *v6;
  UniversalSearchCompletionProvider *v7;
  void *v8;
  UniversalSearchCompletionProvider *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UniversalSearchCompletionProvider;
  v6 = -[CompletionProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_frequentlyVisitedSitesController, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__updateInputMode_, *MEMORY[0x1E0DC5528], 0);

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)UniversalSearchCompletionProvider;
  -[UniversalSearchCompletionProvider dealloc](&v4, sel_dealloc);
}

- (void)_updateInputMode:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *keyboardInputMode;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifierWithLayouts");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyboardInputMode = self->_keyboardInputMode;
  self->_keyboardInputMode = v5;

}

- (void)setParsecSearchSession:(id)a3
{
  UniversalSearchSession **p_parsecSearchSession;
  void *v6;
  void *v7;
  void *v8;
  UniversalSearchSession *v9;

  p_parsecSearchSession = &self->_parsecSearchSession;
  v9 = (UniversalSearchSession *)a3;
  if (*p_parsecSearchSession != v9)
  {
    -[CompletionProvider clearCachedCompletions](self, "clearCachedCompletions");
    -[WBSParsecDSession setDelegate:](*p_parsecSearchSession, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_parsecSearchSession, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);
    -[WBSParsecDSession parsecdSession](*p_parsecSearchSession, "parsecdSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UniversalSearchCompletionProvider _updateStateFromBag:](self, "_updateStateFromBag:", v8);

    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__parsecBagDidLoad_, CFSTR("UniversalSearchDidLoadBagNotification"), v9);
    -[WBSParsecDSession setDelegate:](v9, "setDelegate:", self);

  }
}

- (id)completionsForQuery:(id)a3
{
  id v5;
  void *v6;
  objc_super v8;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentQuery, a3);
  if (self->_enabledByBag)
  {
    v8.receiver = self;
    v8.super_class = (Class)UniversalSearchCompletionProvider;
    -[CompletionProvider completionsForQuery:](&v8, sel_completionsForQuery_, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)setQueryToComplete:(id)a3
{
  id v4;
  NSString *currentQueryString;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  id v10;

  v4 = a3;
  currentQueryString = self->_currentQueryString;
  v10 = v4;
  objc_msgSend(v4, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(currentQueryString) = -[NSString isEqualToString:](currentQueryString, "isEqualToString:", v6);

  if ((currentQueryString & 1) == 0)
  {
    objc_msgSend(v10, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    v9 = self->_currentQueryString;
    self->_currentQueryString = v8;

    -[WBSParsecDSession setCurrentQuery:](self->_parsecSearchSession, "setCurrentQuery:", self->_currentQuery);
  }

}

- (BOOL)shouldHideParsecResult:(id)a3 basedOnHideRankGivenTopHit:(id)a4 indexOfTopHitInFrequentlyVisitedSites:(unint64_t *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t *v21;

  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_13;
  v10 = objc_msgSend(v8, "minimumRankOfTopHitToSuppressResult");
  v11 = 0;
  if (!v9)
    goto LABEL_14;
  v12 = v10;
  if (!v10)
    goto LABEL_14;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v21 = a5;
  -[FrequentlyVisitedSitesController frequentlyVisitedSites](self->_frequentlyVisitedSitesController, "frequentlyVisitedSites");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") < v12)
    v12 = objc_msgSend(v13, "count");
  objc_msgSend(v9, "originalURLString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 15, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = 0;
    v11 = 1;
    while (1)
    {
      objc_msgSend(v13, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 15, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "safari_hasCaseInsensitivePrefix:", v19))
        break;

      v11 = ++v16 < v12;
      if (v12 == v16)
        goto LABEL_11;
    }
    if (v21)
      *v21 = v16;

  }
  else
  {
LABEL_11:
    v11 = 0;
    if (v21)
      *v21 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_14:
  return v11;
}

- (id)currentInputTypeForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  -[CompletionProvider delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowHostingCompletionProvider:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("dictation")))
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v8, "extension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v10 = CFSTR("custom");
      }
      else
      {
        objc_msgSend(v8, "normalizedIdentifierLevels");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "firstObject");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)currentKeyboardIdentifierWithLayoutsForSession:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__UniversalSearchCompletionProvider_currentKeyboardIdentifierWithLayoutsForSession_completionHandler___block_invoke;
  v7[3] = &unk_1E9CF26B8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __102__UniversalSearchCompletionProvider_currentKeyboardIdentifierWithLayoutsForSession_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[9])
    objc_msgSend(v2, "_updateInputMode:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 didReceiveResults:(id)a4 forQuery:(id)a5
{
  id v7;
  id v8;
  id v9;

  if (a4)
    v7 = a4;
  else
    v7 = (id)MEMORY[0x1E0C9AA60];
  v8 = a4;
  objc_msgSend(a5, "queryString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CompletionProvider setCompletions:forString:](self, "setCompletions:forString:", v7, v9);

}

- (void)_updateStateFromBag:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *searchRenderTimeout;
  NSNumber *v7;
  NSNumber *otherRenderTimeout;
  NSNumber *v9;
  NSNumber *minRenderTimeout;
  char v11;

  v4 = a3;
  objc_msgSend(v4, "searchRenderTimeout");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  searchRenderTimeout = self->_searchRenderTimeout;
  self->_searchRenderTimeout = v5;

  objc_msgSend(v4, "otherRenderTimeout");
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  otherRenderTimeout = self->_otherRenderTimeout;
  self->_otherRenderTimeout = v7;

  objc_msgSend(v4, "minSearchRenderTimeout");
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  minRenderTimeout = self->_minRenderTimeout;
  self->_minRenderTimeout = v9;

  v11 = objc_msgSend(v4, "isEnabled");
  self->_enabledByBag = v11;
}

- (void)_parsecBagDidLoad:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UniversalSearchBagUserInfoDictionaryKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UniversalSearchCompletionProvider _updateStateFromBag:](self, "_updateStateFromBag:", v4);

}

- (unint64_t)maximumCachedCompletionCount
{
  return 1;
}

- (FrequentlyVisitedSitesController)frequentlyVisitedSitesController
{
  return self->_frequentlyVisitedSitesController;
}

- (NSNumber)searchRenderTimeout
{
  return self->_searchRenderTimeout;
}

- (void)setSearchRenderTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_searchRenderTimeout, a3);
}

- (NSNumber)otherRenderTimeout
{
  return self->_otherRenderTimeout;
}

- (NSNumber)minRenderTimeout
{
  return self->_minRenderTimeout;
}

- (UniversalSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_storeStrong((id *)&self->_minRenderTimeout, 0);
  objc_storeStrong((id *)&self->_otherRenderTimeout, 0);
  objc_storeStrong((id *)&self->_searchRenderTimeout, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesController, 0);
  objc_storeStrong((id *)&self->_keyboardInputMode, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_currentQueryString, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
