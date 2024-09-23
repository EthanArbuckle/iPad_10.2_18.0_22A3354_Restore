@implementation EMListUnsubscribeSuggestion

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EMListUnsubscribeSuggestion listUnsubscribeCommand](self, "listUnsubscribeCommand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listUnsubscribeCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EMListUnsubscribeSuggestion listUnsubscribeCommand](self, "listUnsubscribeCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (NSString)suggestionPrimaryActionString
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)suggestionDismissActionTitle
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)unsubscribeTitleAlertString
{
  return (NSString *)_EFLocalizedString();
}

- (NSString)unsubscribeMessageAlertString
{
  void *v2;

  -[EMListUnsubscribeSuggestion listUnsubscribeCommand](self, "listUnsubscribeCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isMailtoOperation");

  _EFLocalizedString();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)suggestionPrimaryAction
{
  -[EMListUnsubscribeSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMListUnsubscribeSuggestion suggestionPrimaryAction]", "EMListUnsubscribeSuggestion.m", 69, "0");
}

- (id)suggestionDismissAction
{
  -[EMListUnsubscribeSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMListUnsubscribeSuggestion suggestionDismissAction]", "EMListUnsubscribeSuggestion.m", 73, "0");
}

- (id)suggestionTitle
{
  return (id)_EFLocalizedString();
}

- (id)suggestionCategoryImage
{
  -[EMListUnsubscribeSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMListUnsubscribeSuggestion suggestionCategoryImage]", "EMListUnsubscribeSuggestion.m", 87, "0");
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)MEMORY[0x1E0CB3940];
  _EFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37F0], "ef_formatInteger:withGrouping:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  return &stru_1E70F6E90;
}

- (id)suggestionCategoryTitle
{
  return (id)_EFLocalizedString();
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  -[EMListUnsubscribeSuggestion suggestionTitle](self, "suggestionTitle", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)suggestionComparator
{
  return (id)objc_msgSend((id)objc_opt_class(), "unsubscribeSuggestionComparator");
}

- (void)unsubscribe
{
  void *v3;
  void *v4;

  -[EMListUnsubscribeSuggestion suggestionPresenter](self, "suggestionPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMListUnsubscribeSuggestion suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSuggestion:", v4);

  -[EMListUnsubscribeSuggestion _sendAnalyticsForUnsubscribe:](self, "_sendAnalyticsForUnsubscribe:", 1);
}

- (void)ignore
{
  void *v3;
  void *v4;

  -[EMListUnsubscribeSuggestion suggestionPresenter](self, "suggestionPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMListUnsubscribeSuggestion suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSuggestion:", v4);

  -[EMListUnsubscribeSuggestion _sendAnalyticsForUnsubscribe:](self, "_sendAnalyticsForUnsubscribe:", 0);
}

+ (id)unsubscribeSuggestionComparator
{
  return &__block_literal_global_21;
}

uint64_t __62__EMListUnsubscribeSuggestion_unsubscribeSuggestionComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int isKindOfClass;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();
  if (((isKindOfClass ^ 1 | v7) & 1) != 0)
    v8 = (uint64_t)((unint64_t)(v7 & (isKindOfClass ^ 1u)) << 63) >> 63;
  else
    v8 = 1;

  return v8;
}

- (void)_sendAnalyticsForUnsubscribe:(int64_t)a3
{
  void *v3;

  -[EMListUnsubscribeSuggestion listUnsubscribeCommand](self, "listUnsubscribeCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerUnsubscribeTypes");

  AnalyticsSendEventLazy();
}

id __60__EMListUnsubscribeSuggestion__sendAnalyticsForUnsubscribe___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C9AAB0];
  v3 = (void *)MEMORY[0x1E0C9AAA0];
  if ((*(_QWORD *)(a1 + 32) & 1) != 0)
    v4 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v4 = (void *)MEMORY[0x1E0C9AAA0];
  v5 = v4;
  if ((*(_QWORD *)(a1 + 32) & 2) != 0)
    v6 = v2;
  else
    v6 = v3;
  v7 = v6;
  if ((*(_QWORD *)(a1 + 32) & 4) != 0)
    v8 = v2;
  else
    v8 = v3;
  v9 = v8;
  v13[0] = CFSTR("unsubscribeReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = v5;
  v13[1] = CFSTR("mailto");
  v13[2] = CFSTR("https");
  v13[3] = CFSTR("post");
  v14[2] = v7;
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SGSuggestionDelegate)suggestionDelegate
{
  return (SGSuggestionDelegate *)objc_loadWeakRetained((id *)&self->suggestionDelegate);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->suggestionDelegate, a3);
}

- (EMListUnsubscribeCommand)listUnsubscribeCommand
{
  return self->_listUnsubscribeCommand;
}

- (void)setListUnsubscribeCommand:(id)a3
{
  objc_storeStrong((id *)&self->_listUnsubscribeCommand, a3);
}

- (SGSuggestionPresenter)suggestionPresenter
{
  return (SGSuggestionPresenter *)objc_loadWeakRetained((id *)&self->_suggestionPresenter);
}

- (void)setSuggestionPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionPresenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionPresenter);
  objc_storeStrong((id *)&self->_listUnsubscribeCommand, 0);
  objc_destroyWeak((id *)&self->suggestionDelegate);
}

@end
