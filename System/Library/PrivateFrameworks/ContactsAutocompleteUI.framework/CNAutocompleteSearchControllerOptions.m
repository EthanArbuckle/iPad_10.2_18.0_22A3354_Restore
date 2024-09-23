@implementation CNAutocompleteSearchControllerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CNAutocompleteSearchControllerOptions trailingButtonMidlineInsetFromLayoutMargin](self, "trailingButtonMidlineInsetFromLayoutMargin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingButtonMidlineInsetFromLayoutMargin:", v5);

  -[CNAutocompleteSearchControllerOptions labelTopPadding](self, "labelTopPadding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabelTopPadding:", v6);

  -[CNAutocompleteSearchControllerOptions labelLeadingPadding](self, "labelLeadingPadding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabelLeadingPadding:", v7);

  -[CNAutocompleteSearchControllerOptions shouldHideSeparator](self, "shouldHideSeparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldHideSeparator:", v8);

  -[CNAutocompleteSearchControllerOptions shouldAlwaysShowAddContactsButton](self, "shouldAlwaysShowAddContactsButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldAlwaysShowAddContactsButton:", v9);

  objc_msgSend(v4, "setAddressableGroupResultStyle:", -[CNAutocompleteSearchControllerOptions addressableGroupResultStyle](self, "addressableGroupResultStyle"));
  return v4;
}

- (NSNumber)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButtonMidlineInsetFromLayoutMargin, a3);
}

- (NSNumber)labelTopPadding
{
  return self->_labelTopPadding;
}

- (void)setLabelTopPadding:(id)a3
{
  objc_storeStrong((id *)&self->_labelTopPadding, a3);
}

- (NSNumber)labelLeadingPadding
{
  return self->_labelLeadingPadding;
}

- (void)setLabelLeadingPadding:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeadingPadding, a3);
}

- (NSNumber)shouldHideSeparator
{
  return self->_shouldHideSeparator;
}

- (void)setShouldHideSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_shouldHideSeparator, a3);
}

- (NSNumber)shouldAlwaysShowAddContactsButton
{
  return self->_shouldAlwaysShowAddContactsButton;
}

- (void)setShouldAlwaysShowAddContactsButton:(id)a3
{
  objc_storeStrong((id *)&self->_shouldAlwaysShowAddContactsButton, a3);
}

- (int64_t)addressableGroupResultStyle
{
  return self->_addressableGroupResultStyle;
}

- (void)setAddressableGroupResultStyle:(int64_t)a3
{
  self->_addressableGroupResultStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldAlwaysShowAddContactsButton, 0);
  objc_storeStrong((id *)&self->_shouldHideSeparator, 0);
  objc_storeStrong((id *)&self->_labelLeadingPadding, 0);
  objc_storeStrong((id *)&self->_labelTopPadding, 0);
  objc_storeStrong((id *)&self->_trailingButtonMidlineInsetFromLayoutMargin, 0);
}

@end
