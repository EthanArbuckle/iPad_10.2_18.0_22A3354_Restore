@implementation _MFMailRecipientTextField

- (id)insertDictationResultPlaceholder
{
  objc_super v3;

  self->_isShowingDictationPlaceholder = 1;
  v3.receiver = self;
  v3.super_class = (Class)_MFMailRecipientTextField;
  -[_MFMailRecipientTextField insertDictationResultPlaceholder](&v3, sel_insertDictationResultPlaceholder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  objc_super v4;

  self->_isShowingDictationPlaceholder = 0;
  v4.receiver = self;
  v4.super_class = (Class)_MFMailRecipientTextField;
  -[_MFMailRecipientTextField removeDictationResultPlaceholder:willInsertResult:](&v4, sel_removeDictationResultPlaceholder_willInsertResult_, a3, a4);
}

- (id)_previousKeyResponder
{
  void *v2;
  objc_super v4;

  MFComposeRecipientTextViewIsCollectingPreviousKeyResponder = 1;
  v4.receiver = self;
  v4.super_class = (Class)_MFMailRecipientTextField;
  -[_MFMailRecipientTextField _previousKeyResponder](&v4, sel__previousKeyResponder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MFComposeRecipientTextViewIsCollectingPreviousKeyResponder = 0;
  return v2;
}

- (id)customOverlayContainer
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3DB0], "sharedTextEffectsWindow");
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v10;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "type") != 4)
    goto LABEL_20;
  -[_MFMailRecipientTextField delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_modifiedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (void *)*MEMORY[0x1E0DC4D90];
  if (v6 == (void *)*MEMORY[0x1E0DC4D90] || v6 == (void *)*MEMORY[0x1E0DC4E30])
  {
    if (objc_msgSend(v5, "mf_textFieldShowingSearchResults:", self))
    {
      if ((objc_msgSend(v4, "_isKeyDown") & 1) == 0)
      {
        if (v7 == v8)
          objc_msgSend(v5, "mf_selectNextSearchResultForTextField:", self);
        else
          objc_msgSend(v5, "mf_selectPreviousSearchResultForTextField:", self);
      }
      goto LABEL_23;
    }
    if (v7 != v8 || !objc_msgSend(v4, "_isKeyDown"))
      goto LABEL_19;
    v10 = objc_msgSend(v5, "mf_presentSearchResultsForTextField:", self);
  }
  else
  {
    if (objc_msgSend(v6, "length") != 1
      || objc_msgSend(v7, "characterAtIndex:", 0) != 13
      || !objc_msgSend(v5, "mf_textFieldShowingSearchResults:", self))
    {
      goto LABEL_19;
    }
    v10 = objc_msgSend(v5, "mf_chooseSelectedSearchResultForTextField:", self);
  }
  if ((v10 & 1) != 0)
  {
LABEL_23:

    goto LABEL_21;
  }
LABEL_19:

LABEL_20:
  v11.receiver = self;
  v11.super_class = (Class)_MFMailRecipientTextField;
  -[_MFMailRecipientTextField _handleKeyUIEvent:](&v11, sel__handleKeyUIEvent_, v4);
LABEL_21:

}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t j;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 1;
  do
  {
    objc_msgSend(v5, "valueForPasteboardType:", *(&v25 + v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (v8 == 0) & v7;
    v6 = 1;
    v7 = 0;
  }
  while ((v9 & 1) != 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_MFMailRecipientTextField delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D460C8], "addressListFromEncodedString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "count") > 1)
    {
      objc_msgSend(v10, "mf_dismissSearchResults:", self);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(v10, "mf_recipientTextField:didAddRecipientAddress:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v14);
      }

    }
    else
    {
      v23.receiver = self;
      v23.super_class = (Class)_MFMailRecipientTextField;
      -[_MFMailRecipientTextField paste:](&v23, sel_paste_, v4);
    }

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_MFMailRecipientTextField;
    -[_MFMailRecipientTextField paste:](&v18, sel_paste_, v4);
    v11 = v8;
  }

  for (j = 8; j != -8; j -= 8)
}

- (BOOL)isShowingDictationPlaceholder
{
  return self->_isShowingDictationPlaceholder;
}

@end
