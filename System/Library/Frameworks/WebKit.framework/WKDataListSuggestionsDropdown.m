@implementation WKDataListSuggestionsDropdown

- (WKDataListSuggestionsDropdown)initWithInformation:(void *)a3 inView:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsDropdown;
  return -[WKDataListSuggestionsControl initWithInformation:inView:](&v5, sel_initWithInformation_inView_, a3, a4);
}

- (void)updateWithInformation:(void *)a3
{
  uint64_t v4;
  objc_super v5;

  v4 = *(unsigned __int8 *)a3;
  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsDropdown;
  -[WKDataListSuggestionsControl updateWithInformation:](&v5, sel_updateWithInformation_);
  -[WKDataListSuggestionsDropdown _displayWithActivationType:](self, "_displayWithActivationType:", v4);
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  uint64_t v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)WKDataListSuggestionsDropdown;
  -[WKDataListSuggestionsControl showSuggestionsDropdown:activationType:](&v6, sel_showSuggestionsDropdown_activationType_, a3);
  -[WKDataListSuggestionsDropdown _displayWithActivationType:](self, "_displayWithActivationType:", v4);
}

- (void)didSelectOptionAtIndex:(int64_t)a3
{
  objc_super v5;

  -[WKContentView updateFocusedElementFocusedWithDataListDropdown:](-[WKDataListSuggestionsControl view](self, "view"), "updateFocusedElementFocusedWithDataListDropdown:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsDropdown;
  -[WKDataListSuggestionsControl didSelectOptionAtIndex:](&v5, sel_didSelectOptionAtIndex_, a3);
}

- (void)_displayWithActivationType:(unsigned __int8)a3
{
  char v4;
  uint64_t v5;

  v4 = a3 - 1;
  if (a3 == 1)
  {
    v5 = 1;
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = 0;
LABEL_5:
    -[WKContentView updateFocusedElementFocusedWithDataListDropdown:](-[WKDataListSuggestionsControl view](self, "view"), "updateFocusedElementFocusedWithDataListDropdown:", v5);
  }
  -[WKDataListSuggestionsDropdown _updateTextSuggestions](self, "_updateTextSuggestions");
  if (self->_suggestionsContextMenuPresenter.__ptr_.__value_
    || (objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode") & 1) != 0
    || (v4 & 0xFD) == 0)
  {
    -[WKDataListSuggestionsDropdown _showSuggestions](self, "_showSuggestions");
  }
}

- (void)_showSuggestions
{
  CompactContextMenuPresenter *value;
  WKContentView *v4;
  id *v5;
  WKContentView *v6;
  _QWORD v7[5];
  id location;
  _QWORD v9[4];
  id v10;

  -[WKDataListSuggestionsDropdown _updateSuggestionsMenuElements](self, "_updateSuggestionsMenuElements");
  value = self->_suggestionsContextMenuPresenter.__ptr_.__value_;
  if (value)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke_243;
    v7[3] = &unk_1E34CE390;
    v7[4] = self;
    objc_msgSend((id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction"), "updateVisibleMenuWithBlock:", v7);
  }
  else
  {
    v4 = -[WKDataListSuggestionsControl view](self, "view");
    v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, v4, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_suggestionsContextMenuPresenter, v5);
    v6 = -[WKDataListSuggestionsControl view](self, "view");
    location = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3321888768;
    v9[2] = __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke;
    v9[3] = &__block_descriptor_40_e8_32c62_ZTSKZ49__WKDataListSuggestionsDropdown__showSuggestions_E3__5_e5_v8__0l;
    objc_initWeak(&location, self);
    v10 = 0;
    objc_copyWeak(&v10, &location);
    -[WKContentView doAfterEditorStateUpdateAfterFocusingElement:](v6, "doAfterEditorStateUpdateAfterFocusingElement:", v9);
    objc_destroyWeak(&location);
    objc_destroyWeak(&v10);
  }
}

void __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  const void *v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CGFloat v8;
  CGFloat v9;
  CGPoint v10;
  uint64_t v11;
  CGRect v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = (id *)WeakRetained[7];
    if (!v3)
    {
LABEL_13:
      CFRelease(v2);
      return;
    }
    v4 = (void *)objc_msgSend(WeakRetained, "view");
    v5 = v4;
    if (v4)
      CFRetain(v4);
    v6 = *(_QWORD *)(objc_msgSend(v5, "focusedElementInformation") + 8);
    if ((int)v6 < 1 || SHIDWORD(v6) <= 0)
    {
      objc_msgSend(v5, "lastInteractionLocation");
      v10.x = v8;
      v10.y = v9;
      WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v11, &v10);
      if (!v5)
      {
LABEL_12:
        WebCore::IntRect::operator CGRect();
        WebKit::CompactContextMenuPresenter::present(v3, v12);
        goto LABEL_13;
      }
    }
    else if (!v5)
    {
      goto LABEL_12;
    }
    CFRelease(v5);
    goto LABEL_12;
  }
}

uint64_t __49__WKDataListSuggestionsDropdown__showSuggestions__block_invoke_243(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "menuByReplacingChildren:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_updateTextSuggestions
{
  -[WKContentView setDataListTextSuggestions:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestions:", -[WKDataListSuggestionsControl textSuggestions](self, "textSuggestions"));
}

- (void)_updateSuggestionsMenuElements
{
  void *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  void *v11;
  void *m_ptr;
  id location;
  char *v14;
  _QWORD v15[4];
  id v16[2];
  WTF::StringImpl *v17;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[WKDataListSuggestionsControl suggestionsCount](self, "suggestionsCount"));
  if (-[WKDataListSuggestionsControl suggestionsCount](self, "suggestionsCount") >= 1)
  {
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    while (1)
    {
      v6 = (void *)MEMORY[0x1E0CEA2A8];
      if (!self)
        break;
      -[WKDataListSuggestionsControl suggestionAtIndex:](self, "suggestionAtIndex:", v4);
      if (!v17)
        goto LABEL_7;
      v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_8:
      v15[0] = v5;
      v15[1] = 3321888768;
      v15[2] = __63__WKDataListSuggestionsDropdown__updateSuggestionsMenuElements__block_invoke;
      v15[3] = &__block_descriptor_48_e8_32c76_ZTSKZ63__WKDataListSuggestionsDropdown__updateSuggestionsMenuElements_E3__6_e18_v16__0__UIAction_8l;
      location = 0;
      objc_initWeak(&location, self);
      v14 = v4;
      v16[0] = 0;
      objc_copyWeak(v16, &location);
      v16[1] = v14;
      v8 = objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v15);
      objc_destroyWeak(&location);
      v10 = v17;
      v17 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v9);
        else
          *(_DWORD *)v10 -= 2;
      }
      objc_msgSend(v3, "addObject:", v8);
      objc_destroyWeak(v16);
      if ((uint64_t)++v4 >= -[WKDataListSuggestionsControl suggestionsCount](self, "suggestionsCount"))
        goto LABEL_13;
    }
    v17 = 0;
LABEL_7:
    v7 = &stru_1E351F1B8;
    goto LABEL_8;
  }
LABEL_13:
  v11 = (void *)objc_msgSend(v3, "copy");
  m_ptr = self->_suggestionsMenuElements.m_ptr;
  self->_suggestionsMenuElements.m_ptr = v11;
  if (m_ptr)
    CFRelease(m_ptr);
}

void __63__WKDataListSuggestionsDropdown__updateSuggestionsMenuElements__block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "didSelectOptionAtIndex:", *(_QWORD *)(a1 + 40));
    CFRelease(v3);
  }
}

- (void)_removeContextMenuInteraction
{
  id **p_suggestionsContextMenuPresenter;
  CompactContextMenuPresenter *value;

  p_suggestionsContextMenuPresenter = (id **)&self->_suggestionsContextMenuPresenter;
  value = self->_suggestionsContextMenuPresenter.__ptr_.__value_;
  if (value)
  {
    objc_msgSend((id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction"), "dismissMenu");
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_suggestionsContextMenuPresenter, 0);
    -[WKContentView _removeContextMenuHintContainerIfPossible](-[WKDataListSuggestionsControl view](self, "view"), "_removeContextMenuHintContainerIfPossible");
    objc_msgSend(-[WKContentView webView](-[WKDataListSuggestionsControl view](self, "view"), "webView"), "_didDismissContextMenu");
  }
}

- (void)_suggestionsMenuDidPresent
{
  -[WKDataListSuggestionsControl setIsShowingSuggestions:](self, "setIsShowingSuggestions:", 1);
  objc_msgSend(-[WKContentView webView](-[WKDataListSuggestionsControl view](self, "view"), "webView"), "_didShowContextMenu");
}

- (void)_suggestionsMenuDidDismiss
{
  -[WKDataListSuggestionsControl setIsShowingSuggestions:](self, "setIsShowingSuggestions:", 0);
  -[WKContentView updateFocusedElementFocusedWithDataListDropdown:](-[WKDataListSuggestionsControl view](self, "view"), "updateFocusedElementFocusedWithDataListDropdown:", 0);
  -[WKDataListSuggestionsDropdown _updateTextSuggestions](self, "_updateTextSuggestions");
  -[WKDataListSuggestionsDropdown _removeContextMenuInteraction](self, "_removeContextMenuInteraction");
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  return -[WKContentView _createTargetedContextMenuHintPreviewForFocusedElement:](-[WKDataListSuggestionsControl view](self, "view", a3, a4, a5), "_createTargetedContextMenuHintPreviewForFocusedElement:", 1);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __87__WKDataListSuggestionsDropdown_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c100_ZTSKZ87__WKDataListSuggestionsDropdown_contextMenuInteraction_configurationForMenuAtLocation__E3__7_e25___UIMenu_16__0__NSArray_8l;
  objc_initWeak(&v6, self);
  v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_destroyWeak(&v6);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CEA4B0], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v7);
  objc_destroyWeak(&v8);
  return v4;
}

uint64_t __87__WKDataListSuggestionsDropdown_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    return 0;
  v2 = WeakRetained;
  v3 = objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E351F1B8, *((_QWORD *)WeakRetained + 6));
  CFRelease(v2);
  return v3;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __97__WKDataListSuggestionsDropdown_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c110_ZTSKZ97__WKDataListSuggestionsDropdown_contextMenuInteraction_willDisplayMenuForConfiguration_animator__E3__8_e5_v8__0l;
  objc_initWeak(&v6, self);
  v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_msgSend(a5, "addCompletion:", v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __97__WKDataListSuggestionsDropdown_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_suggestionsMenuDidPresent");
    CFRelease(v2);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __89__WKDataListSuggestionsDropdown_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c102_ZTSKZ89__WKDataListSuggestionsDropdown_contextMenuInteraction_willEndForConfiguration_animator__E3__9_e5_v8__0l;
  objc_initWeak(&v6, self);
  v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_msgSend(a5, "addCompletion:", v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __89__WKDataListSuggestionsDropdown_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_suggestionsMenuDidDismiss");
    CFRelease(v2);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;

  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_suggestionsContextMenuPresenter, 0);
  m_ptr = self->_suggestionsMenuElements.m_ptr;
  self->_suggestionsMenuElements.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
