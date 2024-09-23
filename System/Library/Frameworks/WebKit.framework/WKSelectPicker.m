@implementation WKSelectPicker

- (WKSelectPicker)initWithView:(id)a3
{
  WKSelectPicker *v4;
  WKSelectPicker *v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKSelectPicker;
  v4 = -[WKSelectPicker init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    objc_msgSend(objc_loadWeak((id *)&v5->_view), "lastInteractionLocation");
    v5->_interactionPoint.x = v6;
    v5->_interactionPoint.y = v7;
  }
  return v5;
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  WKContentView **p_view;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  void *v17;
  void *m_ptr;
  CGRect v19;
  CGRect v20;

  p_view = &self->_view;
  objc_msgSend(objc_loadWeak((id *)&self->_view), "focusedElementInformation");
  WebCore::IntRect::operator CGRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(objc_loadWeak((id *)p_view), "bounds");
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (CGRectIntersectsRect(v19, v20))
  {
    objc_msgSend(objc_loadWeak((id *)p_view), "startRelinquishingFirstResponderToFocusedElement");
    v16 = -[WKSelectPicker createMenu](self, "createMenu");
    v17 = v16;
    if (v16)
      CFRetain(v16);
    m_ptr = self->_selectMenu.m_ptr;
    self->_selectMenu.m_ptr = v17;
    if (m_ptr)
      CFRelease(m_ptr);
    -[WKSelectPicker showSelectPicker](self, "showSelectPicker");
  }
}

- (void)controlUpdateEditing
{
  id v3;
  void *v4;
  void *m_ptr;
  CompactContextMenuPresenter *value;
  _QWORD v7[5];

  if (self->_selectContextMenuPresenter.__ptr_.__value_)
  {
    v3 = -[WKSelectPicker createMenu](self, "createMenu");
    v4 = v3;
    if (v3)
      CFRetain(v3);
    m_ptr = self->_selectMenu.m_ptr;
    self->_selectMenu.m_ptr = v4;
    if (m_ptr)
      CFRelease(m_ptr);
    value = self->_selectContextMenuPresenter.__ptr_.__value_;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__WKSelectPicker_controlUpdateEditing__block_invoke;
    v7[3] = &unk_1E34CE390;
    v7[4] = self;
    objc_msgSend((id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction"), "updateVisibleMenuWithBlock:", v7);
  }
}

uint64_t __38__WKSelectPicker_controlUpdateEditing__block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
}

- (void)controlEndEditing
{
  objc_msgSend(objc_loadWeak((id *)&self->_view), "stopRelinquishingFirstResponderToFocusedElement");
  -[WKSelectPicker resetContextMenuPresenter](self, "resetContextMenuPresenter");
}

- (void)dealloc
{
  objc_super v3;

  -[WKSelectPicker resetContextMenuPresenter](self, "resetContextMenuPresenter");
  v3.receiver = self;
  v3.super_class = (Class)WKSelectPicker;
  -[WKSelectPicker dealloc](&v3, sel_dealloc);
}

- (void)didSelectOptionIndex:(int64_t)a3
{
  WKContentView **p_view;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL *v9;

  p_view = &self->_view;
  v5 = objc_msgSend(objc_loadWeak((id *)&self->_view), "focusedSelectElementOptions");
  v6 = *(unsigned int *)(v5 + 12);
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = 16 * v6;
    v9 = (BOOL *)(*(_QWORD *)v5 + 9);
    do
    {
      if (!*(v9 - 1))
        *v9 = v7++ == a3;
      v9 += 16;
      v8 -= 16;
    }
    while (v8);
  }
  objc_msgSend(objc_loadWeak((id *)p_view), "updateFocusedElementSelectedIndex:allowsMultipleSelection:", a3, 0);
}

- (id)createMenu
{
  WKContentView **p_view;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  BOOL v19;
  void *v21;
  const __CFString *v22;
  WTF::StringImpl *v23;
  void *v24;
  WTF::StringImpl *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  p_view = &self->_view;
  if (*(_DWORD *)(objc_msgSend(objc_loadWeak((id *)&self->_view), "focusedSelectElementOptions") + 12))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (*(_DWORD *)(objc_msgSend(objc_loadWeak((id *)p_view), "focusedSelectElementOptions") + 12))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = objc_msgSend(objc_loadWeak((id *)p_view), "focusedSelectElementOptions");
        if (v7 >= *(unsigned int *)(v8 + 12))
          goto LABEL_31;
        v9 = *(_QWORD *)v8 + 16 * v7;
        if (*(_BYTE *)(v9 + 8))
        {
          v10 = *(_DWORD *)(v9 + 12);
          if (*(_QWORD *)v9)
            v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
          else
            v11 = &stru_1E351F1B8;
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = v7 + 1;
          if (v7 + 1 < *(unsigned int *)(objc_msgSend(objc_loadWeak((id *)p_view), "focusedSelectElementOptions") + 12))
          {
            v14 = 16 * v7;
            while (1)
            {
              v15 = objc_msgSend(objc_loadWeak((id *)p_view), "focusedSelectElementOptions");
              if (v13 >= *(unsigned int *)(v15 + 12))
                break;
              v16 = *(_QWORD *)v15 + v14;
              v17 = *(unsigned __int8 *)(v16 + 24);
              v18 = *(_DWORD *)(v16 + 28);
              if (v17)
                v19 = 0;
              else
                v19 = v18 == v10;
              if (v19)
              {
                v14 += 16;
                objc_msgSend(v12, "addObject:", -[WKSelectPicker actionForOptionItem:withIndex:](self, "actionForOptionItem:withIndex:", v14 + *(_QWORD *)v15, v6++));
                if (++v13 < *(unsigned int *)(objc_msgSend(objc_loadWeak((id *)p_view), "focusedSelectElementOptions")
                                             + 12))
                  continue;
              }
              goto LABEL_17;
            }
LABEL_31:
            __break(0xC471u);
            JUMPOUT(0x1972B9840);
          }
LABEL_17:
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", v11, 0, 0, 65, v12));
        }
        else
        {
          objc_msgSend(v5, "addObject:", -[WKSelectPicker actionForOptionItem:withIndex:](self, "actionForOptionItem:withIndex:"));
          ++v6;
          v13 = v7 + 1;
        }
        v7 = v13;
      }
      while (v13 < *(unsigned int *)(objc_msgSend(objc_loadWeak((id *)p_view), "focusedSelectElementOptions") + 12));
    }
    return (id)objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E351F1B8, 0, 0, 96, v5);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CEA2A8];
    WebCore::localizedString((WebCore *)CFSTR("No Options Select Popover"), v4);
    if (v25)
      v22 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v22 = &stru_1E351F1B8;
    v24 = (void *)objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v22, 0, 0, &__block_literal_global_30);
    if (v25)
    {
      if (*(_DWORD *)v25 == 2)
        WTF::StringImpl::destroy(v25, v23);
      else
        *(_DWORD *)v25 -= 2;
    }
    objc_msgSend(v24, "setAttributes:", 1);
    v26[0] = v24;
    return (id)objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E351F1B8, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1));
  }
}

- (id)actionForOptionItem:(const void *)a3 withIndex:(int64_t)a4
{
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v7 = (void *)MEMORY[0x1E0CEA2A8];
  if (*(_QWORD *)a3)
    v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v8 = &stru_1E351F1B8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__WKSelectPicker_actionForOptionItem_withIndex___block_invoke;
  v12[3] = &unk_1E34CF010;
  v12[4] = self;
  v12[5] = a4;
  v9 = (void *)objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v12);
  v10 = v9;
  if (*((_BYTE *)a3 + 10))
    objc_msgSend(v9, "setAttributes:", 1);
  if (*((_BYTE *)a3 + 9))
    objc_msgSend(v10, "setState:", 1);
  return v10;
}

uint64_t __48__WKSelectPicker_actionForOptionItem_withIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSelectOptionIndex:", *(_QWORD *)(a1 + 40));
}

- (id)actionForOptionIndex:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(self->_selectMenu.m_ptr, "children");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v7 == a3)
            return v10;
          ++v7;
        }
        else
        {
          v7 += objc_msgSend((id)objc_msgSend(v10, "children"), "count");
          if (a3 < v7)
            return (id)objc_msgSend((id)objc_msgSend(v10, "children"), "objectAtIndex:", a3 - v7 + objc_msgSend((id)objc_msgSend(v10, "children"), "count"));
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  return (id)objc_msgSend(objc_loadWeak((id *)&self->_view), "_createTargetedContextMenuHintPreviewForFocusedElement:", 0);
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
  v7[2] = __72__WKSelectPicker_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c85_ZTSKZ72__WKSelectPicker_contextMenuInteraction_configurationForMenuAtLocation__E3__0_e25___UIMenu_16__0__NSArray_8l;
  objc_initWeak(&v6, self);
  v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_destroyWeak(&v6);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CEA4B0], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v7);
  objc_destroyWeak(&v8);
  return v4;
}

uint64_t __72__WKSelectPicker_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    return 0;
  v2 = WeakRetained[4];
  CFRelease(WeakRetained);
  return v2;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __82__WKSelectPicker_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c95_ZTSKZ82__WKSelectPicker_contextMenuInteraction_willDisplayMenuForConfiguration_animator__E3__1_e5_v8__0l;
  objc_initWeak(&v6, self);
  v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_msgSend(a5, "addCompletion:", v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __82__WKSelectPicker_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend((id)objc_msgSend(objc_loadWeak(WeakRetained + 1), "webView"), "_didShowContextMenu");
    CFRelease(v2);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;

  self->_isAnimatingContextMenuDismissal = 1;
  v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __74__WKSelectPicker_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c87_ZTSKZ74__WKSelectPicker_contextMenuInteraction_willEndForConfiguration_animator__E3__2_e5_v8__0l;
  objc_initWeak(&v6, self);
  v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_msgSend(a5, "addCompletion:", v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __74__WKSelectPicker_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  _BYTE *v2;
  id *v3;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = (id *)(WeakRetained + 8);
    objc_msgSend(objc_loadWeak((id *)WeakRetained + 1), "accessoryDone");
    objc_msgSend((id)objc_msgSend(objc_loadWeak(v3), "webView"), "_didDismissContextMenu");
    v2[48] = 0;
    CFRelease(v2);
  }
}

- (void)resetContextMenuPresenter
{
  id **p_selectContextMenuPresenter;
  CompactContextMenuPresenter *value;

  value = self->_selectContextMenuPresenter.__ptr_.__value_;
  p_selectContextMenuPresenter = (id **)&self->_selectContextMenuPresenter;
  if (value)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_selectContextMenuPresenter, 0);
    objc_msgSend(objc_loadWeak((id *)&self->_view), "_removeContextMenuHintContainerIfPossible");
    if (!self->_isAnimatingContextMenuDismissal)
      objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_view), "webView"), "_didDismissContextMenu");
  }
}

- (void)showSelectPicker
{
  id *value;
  id **p_selectContextMenuPresenter;
  id *v5;
  id Weak;
  CGRect v7;

  p_selectContextMenuPresenter = (id **)&self->_selectContextMenuPresenter;
  value = (id *)self->_selectContextMenuPresenter.__ptr_.__value_;
  if (!value)
  {
    v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    Weak = objc_loadWeak((id *)&self->_view);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, Weak, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_selectContextMenuPresenter, v5);
    value = *p_selectContextMenuPresenter;
  }
  v7.origin.x = self->_interactionPoint.x;
  v7.origin.y = self->_interactionPoint.y;
  v7.size.width = *(CGFloat *)MEMORY[0x1E0C9D820];
  v7.size.height = *(CGFloat *)(MEMORY[0x1E0C9D820] + 8);
  WebKit::CompactContextMenuPresenter::present(value, v7);
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  id v6;

  v6 = -[WKSelectPicker actionForOptionIndex:](self, "actionForOptionIndex:", a3, a4, a5);
  if (v6)
  {
    objc_msgSend(v6, "performWithSender:target:", 0, 0);
    objc_msgSend(objc_loadWeak((id *)&self->_view), "accessoryDone");
  }
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  id v3;

  v3 = -[WKSelectPicker actionForOptionIndex:](self, "actionForOptionIndex:", a3);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "state") == 1;
  return (char)v3;
}

- (id)menuItemTitles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_msgSend(self->_selectMenu.m_ptr, "children");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "title"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v9)
            {
              v18 = 0u;
              v19 = 0u;
              v16 = 0u;
              v17 = 0u;
              v10 = (void *)objc_msgSend(v9, "children", 0);
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v17;
                do
                {
                  v14 = 0;
                  do
                  {
                    if (*(_QWORD *)v17 != v13)
                      objc_enumerationMutation(v10);
                    objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "title"));
                  }
                  while (v12 != v14);
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
                }
                while (v12);
              }
            }
          }
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  return v3;
}

- (void).cxx_destruct
{
  void *m_ptr;

  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_selectContextMenuPresenter, 0);
  m_ptr = self->_selectMenu.m_ptr;
  self->_selectMenu.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak((id *)&self->_view);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
