@implementation CNPropertySuggestionAction

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  -[CNPropertySuggestionAction dataSourceWithPropertyItem:](self, "dataSourceWithPropertyItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactSuggestionViewController viewControllerWithDataSource:](CNContactSuggestionViewController, "viewControllerWithDataSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySuggestionAction setSuggestionViewController:](self, "setSuggestionViewController:", v7);

  -[CNContactAction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action:cellForPropertyItem:sender:", self, v5, self);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v13, "setShouldShowTransportButtons:", 1);
  -[CNPropertySuggestionAction suggestionViewController](self, "suggestionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertyCell:", v13);

  -[CNPropertySuggestionAction suggestionViewController](self, "suggestionViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAction:", self);

  -[CNContactAction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySuggestionAction suggestionViewController](self, "suggestionViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "action:pushViewController:sender:", self, v12, self);

}

- (id)dataSourceWithPropertyItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CNContactSuggestionViewControllerSGOriginDataSource *v15;
  CNContactSuggestionViewControllerLabeledValueDataSource *v16;
  void *v17;
  id v19;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactViewCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "labeledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "originForSuggestion:error:", v8, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (v10)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertySuggestionAction.m", 60, 3, CFSTR("Could not get origin for suggested property: %@"), v11, v12, v13, v14, (uint64_t)v10);
  if (v9)
  {
    v15 = -[CNContactSuggestionViewControllerSGOriginDataSource initWithSGOrigin:]([CNContactSuggestionViewControllerSGOriginDataSource alloc], "initWithSGOrigin:", v9);
  }
  else
  {
    v16 = [CNContactSuggestionViewControllerLabeledValueDataSource alloc];
    objc_msgSend(v4, "labeledValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNContactSuggestionViewControllerLabeledValueDataSource initWithLabeledValue:](v16, "initWithLabeledValue:", v17);

  }
  return v15;
}

- (void)setSelectedChoice:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_selectedChoice = a3;
  -[CNContactAction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDidFinish:", self);

  -[CNPropertySuggestionAction suggestionViewController](self, "suggestionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  self->_selectedChoice = 0;
}

- (BOOL)_confirmOrReject:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[CNPropertyAction propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return -[CNPropertySuggestionAction _confirmOrRejectDonation:](self, "_confirmOrRejectDonation:", v3);
  else
    return -[CNPropertySuggestionAction _confirmOrRejectSuggestion:](self, "_confirmOrRejectSuggestion:", v3);
}

- (BOOL)_confirmOrRejectSuggestion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;

  v3 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactViewCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C973F0]);
  -[CNPropertyAction propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labeledValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v8, "confirmSuggestion:", v10);
  else
    objc_msgSend(v8, "rejectSuggestion:", v10);

  v19 = 0;
  v11 = objc_msgSend(v7, "executeSaveRequest:error:", v8, &v19);
  v12 = v19;
  v17 = v12;
  if ((v11 & 1) == 0)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertySuggestionAction.m", 101, 3, CFSTR("Error confirming or rejecting suggestion: %@"), v13, v14, v15, v16, (uint64_t)v12);

  return v11;
}

- (BOOL)_confirmOrRejectDonation:(BOOL)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v4 = objc_alloc_init(MEMORY[0x1E0D136E0]);
  v5 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNPropertyAction propertyItem](self, "propertyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "donationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rejectValueWithDonationIdentifier:completionHandler:", v9, v10);

  objc_msgSend(v5, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = (id)objc_msgSend(v11, "result:", &v19);
  v13 = v19;

  if (v13)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertySuggestionAction.m", 121, 3, CFSTR("Error rejecting suggestion: %@"), v14, v15, v16, v17, (uint64_t)v13);

  return v13 == 0;
}

- (void)confirm
{
  id v3;

  -[CNPropertySuggestionAction _confirmOrReject:](self, "_confirmOrReject:", 1);
  -[CNPropertyAction propertyItem](self, "propertyItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confirmSuggestion");

}

- (void)reject
{
  id v3;

  -[CNPropertySuggestionAction _confirmOrReject:](self, "_confirmOrReject:", 0);
  -[CNPropertyAction propertyItem](self, "propertyItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rejectSuggestion");

}

- (int64_t)selectedChoice
{
  return self->_selectedChoice;
}

- (CNContactSuggestionViewController)suggestionViewController
{
  return self->_suggestionViewController;
}

- (void)setSuggestionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionViewController, 0);
}

@end
