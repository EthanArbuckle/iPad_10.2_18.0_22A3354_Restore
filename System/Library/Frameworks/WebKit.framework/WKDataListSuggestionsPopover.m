@implementation WKDataListSuggestionsPopover

- (WKDataListSuggestionsPopover)initWithInformation:(void *)a3 inView:(id)a4
{
  WKDataListSuggestionsPopover *v5;
  WKFormRotatingAccessoryPopover *v6;
  void *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKDataListSuggestionsPopover;
  v5 = -[WKDataListSuggestionsControl initWithInformation:inView:](&v9, sel_initWithInformation_inView_, a3);
  if (v5)
  {
    v6 = -[WKFormRotatingAccessoryPopover initWithView:]([WKFormRotatingAccessoryPopover alloc], "initWithView:", a4);
    m_ptr = v5->_popover.m_ptr;
    v5->_popover.m_ptr = v6;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v5;
}

- (void)updateWithInformation:(void *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKDataListSuggestionsPopover;
  -[WKDataListSuggestionsControl updateWithInformation:](&v4, sel_updateWithInformation_, a3);
  objc_msgSend(self->_suggestionsViewController.m_ptr, "reloadData");
  -[WKContentView setDataListTextSuggestions:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestions:", -[WKDataListSuggestionsControl textSuggestions](self, "textSuggestions"));
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  WKDataListSuggestionsViewController *v5;
  void *m_ptr;
  void *v7;
  const void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKDataListSuggestionsPopover;
  -[WKDataListSuggestionsControl showSuggestionsDropdown:activationType:](&v9, sel_showSuggestionsDropdown_activationType_, a3, a4);
  v5 = -[WKDataListSuggestionsViewController initWithStyle:]([WKDataListSuggestionsViewController alloc], "initWithStyle:", 0);
  m_ptr = self->_suggestionsViewController.m_ptr;
  self->_suggestionsViewController.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v5 = (WKDataListSuggestionsViewController *)self->_suggestionsViewController.m_ptr;
  }
  -[WKDataListSuggestionsViewController setControl:](v5, "setControl:", self);
  objc_msgSend(self->_suggestionsViewController.m_ptr, "reloadData");
  -[WKContentView setDataListTextSuggestions:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestions:", -[WKDataListSuggestionsControl textSuggestions](self, "textSuggestions"));
  v7 = self->_popover.m_ptr;
  v8 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA888]), "initWithContentViewController:", self->_suggestionsViewController.m_ptr);
  objc_msgSend(v7, "setPopoverController:", v8);
  if (v8)
    CFRelease(v8);
  objc_msgSend(self->_popover.m_ptr, "presentPopoverAnimated:", 0);
}

- (void)invalidate
{
  objc_msgSend(self->_suggestionsViewController.m_ptr, "setControl:", 0);
}

- (void)didSelectOptionAtIndex:(int64_t)a3
{
  const __CFString *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)WKDataListSuggestionsPopover;
  -[WKDataListSuggestionsControl didSelectOptionAtIndex:](&v8, sel_didSelectOptionAtIndex_);
  objc_msgSend((id)objc_msgSend(self->_popover.m_ptr, "popoverController"), "dismissPopoverAnimated:", 1);
  -[WKDataListSuggestionsControl suggestionAtIndex:](self, "suggestionAtIndex:", a3);
  if (v7)
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E351F1B8;
  v9[0] = +[WKDataListTextSuggestion textSuggestionWithInputText:](WKDataListTextSuggestion, "textSuggestionWithInputText:", v5);
  -[WKContentView setDataListTextSuggestions:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_suggestionsViewController.m_ptr;
  self->_suggestionsViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_popover.m_ptr;
  self->_popover.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
