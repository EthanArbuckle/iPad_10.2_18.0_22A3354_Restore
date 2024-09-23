@implementation CNContactSuggestionViewControllerLabeledValueDataSource

- (CNContactSuggestionViewControllerLabeledValueDataSource)initWithLabeledValue:(id)a3
{
  id v5;
  CNContactSuggestionViewControllerLabeledValueDataSource *v6;
  CNContactSuggestionViewControllerLabeledValueDataSource *v7;
  CNContactSuggestionViewControllerLabeledValueDataSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactSuggestionViewControllerLabeledValueDataSource;
  v6 = -[CNContactSuggestionViewControllerLabeledValueDataSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_labeledValue, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)type
{
  return 0;
}

- (NSString)appName
{
  void *v2;
  void *v3;
  void *v4;

  -[CNContactSuggestionViewControllerLabeledValueDataSource labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueOrigin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedApplicationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSAttributedString)formattedSnippet
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (NSString)date
{
  return 0;
}

- (NSString)with
{
  return 0;
}

- (NSURL)url
{
  return 0;
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (void)setLabeledValue:(id)a3
{
  objc_storeStrong((id *)&self->_labeledValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

@end
