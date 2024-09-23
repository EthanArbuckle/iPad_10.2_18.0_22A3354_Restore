@implementation WKDataListSuggestionsViewController

- (void)reloadData
{
  uint64_t v3;
  double v4;

  objc_msgSend((id)-[WKDataListSuggestionsViewController tableView](self, "tableView"), "reloadData");
  v3 = -[WKDataListSuggestionsControl suggestionsCount](-[WKDataListSuggestionsViewController control](self, "control"), "suggestionsCount");
  v4 = 242.0;
  if (v3 <= 5)
    v4 = (double)v3 * 44.0;
  -[WKDataListSuggestionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[WKDataListSuggestionsControl suggestionsCount](-[WKDataListSuggestionsViewController control](self, "control", a3, a4), "suggestionsCount");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  WKDataListSuggestionsControl *v8;
  uint64_t v9;
  const __CFString *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v13;

  v6 = (void *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WKDataListSuggestionCell"));
  if (v6)
  {
    v7 = v6;
    CFRetain(v6);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WKDataListSuggestionCell"));
  }
  v8 = -[WKDataListSuggestionsViewController control](self, "control");
  v9 = objc_msgSend(a4, "row");
  if (v8)
  {
    -[WKDataListSuggestionsControl suggestionAtIndex:](v8, "suggestionAtIndex:", v9);
    if (v13)
    {
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
      goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
  }
  v10 = &stru_1E351F1B8;
LABEL_9:
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v10);
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v11);
    else
      *(_DWORD *)v13 -= 2;
  }
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setLineBreakMode:", 4);
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setTextAlignment:", -[WKDataListSuggestionsControl textAlignment](-[WKDataListSuggestionsViewController control](self, "control"), "textAlignment"));
  return (id)(id)CFMakeCollectable(v7);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[WKDataListSuggestionsControl didSelectOptionAtIndex:](-[WKDataListSuggestionsViewController control](self, "control", a3), "didSelectOptionAtIndex:", objc_msgSend(a4, "row"));
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
