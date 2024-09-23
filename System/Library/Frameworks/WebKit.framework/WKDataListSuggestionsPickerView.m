@implementation WKDataListSuggestionsPickerView

- (void)controlEndEditing
{
  -[WKDataListSuggestionsControl didSelectOptionAtIndex:](-[WKDataListSuggestionsPickerView control](self, "control"), "didSelectOptionAtIndex:", -[WKDataListSuggestionsPickerView selectedRowInComponent:](self, "selectedRowInComponent:", 0));
}

- (WKDataListSuggestionsControl)control
{
  return (WKDataListSuggestionsControl *)objc_loadWeak((id *)&self->_control);
}

- (void)setControl:(id)a3
{
  objc_storeWeak((id *)&self->_control, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_control);
}

@end
