@implementation WKDataListSuggestionsPicker

- (WKDataListSuggestionsPicker)initWithInformation:(void *)a3 inView:(id)a4
{
  WKDataListSuggestionsPicker *v5;
  WKDataListSuggestionsPickerView *v6;
  WKDataListSuggestionsPickerView *v7;
  void *m_ptr;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WKDataListSuggestionsPicker;
  v5 = -[WKDataListSuggestionsControl initWithInformation:inView:](&v16, sel_initWithInformation_inView_, a3);
  if (v5)
  {
    v6 = [WKDataListSuggestionsPickerView alloc];
    v7 = -[WKDataListSuggestionsPickerView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    m_ptr = v5->_pickerView.m_ptr;
    v5->_pickerView.m_ptr = v7;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v7 = (WKDataListSuggestionsPickerView *)v5->_pickerView.m_ptr;
    }
    -[WKDataListSuggestionsPickerView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    objc_msgSend(v5->_pickerView.m_ptr, "setDataSource:", v5);
    objc_msgSend(v5->_pickerView.m_ptr, "setDelegate:", v5);
    objc_msgSend(v5->_pickerView.m_ptr, "setControl:", v5);
    objc_msgSend(v5->_pickerView.m_ptr, "frame");
    v10 = v9;
    v12 = v11;
    objc_msgSend(a4, "sizeForLegacyFormControlPickerViews");
    objc_msgSend(v5->_pickerView.m_ptr, "setFrame:", v10, v12, v13, v14);
  }
  return v5;
}

- (void)updateWithInformation:(void *)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKDataListSuggestionsPicker;
  -[WKDataListSuggestionsControl updateWithInformation:](&v5, sel_updateWithInformation_);
  if (*(_BYTE *)a3 == 1)
  {
    -[WKContentView setDataListTextSuggestionsInputView:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestionsInputView:", self->_pickerView.m_ptr);
    objc_msgSend(self->_pickerView.m_ptr, "reloadAllComponents");
    objc_msgSend(self->_pickerView.m_ptr, "selectRow:inComponent:animated:", 0, 0, 0);
  }
  else
  {
    -[WKContentView setDataListTextSuggestionsInputView:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestionsInputView:", 0);
    -[WKContentView setDataListTextSuggestions:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestions:", -[WKDataListSuggestionsControl textSuggestions](self, "textSuggestions"));
  }
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  int v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)WKDataListSuggestionsPicker;
  -[WKDataListSuggestionsControl showSuggestionsDropdown:activationType:](&v6, sel_showSuggestionsDropdown_activationType_, a3);
  if (v4 == 1)
  {
    -[WKContentView setDataListTextSuggestionsInputView:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestionsInputView:", self->_pickerView.m_ptr);
    objc_msgSend(self->_pickerView.m_ptr, "selectRow:inComponent:animated:", 0, 0, 0);
  }
  else
  {
    -[WKContentView setDataListTextSuggestions:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestions:", -[WKDataListSuggestionsControl textSuggestions](self, "textSuggestions"));
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  WTF::StringImpl *v5;
  void *v6;
  WTF::StringImpl *v8;

  if (!self)
    return &stru_1E351F1B8;
  -[WKDataListSuggestionsControl suggestionAtIndex:](self, "suggestionAtIndex:", a4);
  if (!v8)
    return &stru_1E351F1B8;
  v6 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v8 == 2)
    WTF::StringImpl::destroy(v8, v5);
  else
    *(_DWORD *)v8 -= 2;
  return v6;
}

- (void)invalidate
{
  WKFormControl *v3;
  WKFormControl *m_ptr;

  v3 = -[WKContentView dataListTextSuggestionsInputView](-[WKDataListSuggestionsControl view](self, "view"), "dataListTextSuggestionsInputView");
  m_ptr = (WKFormControl *)self->_pickerView.m_ptr;
  if (v3 == m_ptr)
  {
    -[WKContentView setDataListTextSuggestionsInputView:](-[WKDataListSuggestionsControl view](self, "view"), "setDataListTextSuggestionsInputView:", 0);
    m_ptr = (WKFormControl *)self->_pickerView.m_ptr;
  }
  -[WKFormControl setDelegate:](m_ptr, "setDelegate:", 0);
  objc_msgSend(self->_pickerView.m_ptr, "setDataSource:", 0);
  objc_msgSend(self->_pickerView.m_ptr, "setControl:", 0);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_pickerView.m_ptr;
  self->_pickerView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
