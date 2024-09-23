@implementation MOSuggestionsSheetClientProxyTarget

- (MOSuggestionsSheetClientProxyTarget)initWithController:(id)a3
{
  id v5;
  MOSuggestionsSheetClientProxyTarget *v6;
  MOSuggestionsSheetClientProxyTarget *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOSuggestionsSheetClientProxyTarget;
  v6 = -[MOSuggestionsSheetClientProxyTarget init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (void)sheetCancelled
{
  void *v3;
  char v4;
  id v5;

  -[MOSuggestionSheetController delegate](self->_controller, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MOSuggestionSheetController delegate](self->_controller, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionSheetControllerDidCancel:", self->_controller);

  }
}

- (void)showBlankComposeView
{
  void *v3;
  char v4;
  id v5;

  -[MOSuggestionSheetController delegate](self->_controller, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MOSuggestionSheetController delegate](self->_controller, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionSheetControllerShouldShowBlankComposeView:", self->_controller);

  }
}

- (void)didReceiveStateUpdateRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = objc_msgSend(v4, "intValue");
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "client proxy callback, transitioned to state=%d", (uint8_t *)v10, 8u);
  }

  -[MOSuggestionSheetController delegate](self->_controller, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if ((objc_msgSend(v4, "intValue") & 0x80000000) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "unsignedIntValue");
    -[MOSuggestionSheetController delegate](self->_controller, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suggestionSheetController:didTransitionTo:", self->_controller, v8);

  }
}

- (void)performTask:(id)a3 suggestion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = objc_msgSend(v6, "intValue");
    _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "client proxy callback, requested task=%d", (uint8_t *)v13, 8u);
  }

  -[MOSuggestionSheetController delegate](self->_controller, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_msgSend(v6, "unsignedIntValue");
    -[MOSuggestionSheetController delegate](self->_controller, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "suggestionSheetController:shouldPerformTask:forSuggestion:", self->_controller, v11, v7);

  }
}

- (void)didGrantSandboxAccessFor:(id)a3
{
  uint64_t v4;
  MOSuggestionSheetController *controller;
  id v6;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = sandbox_extension_consume();
  if (v4 != -1)
  {
    controller = self->_controller;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MOSuggestionSheetController addSandboxHandle:](controller, "addSandboxHandle:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
