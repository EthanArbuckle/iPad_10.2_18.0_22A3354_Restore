@implementation BEAutoFillTextSuggestion

- (id)_initWithUIKitTextSuggestion:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BEAutoFillTextSuggestion;
  v6 = -[BETextSuggestion _initWithUIKitTextSuggestion:](&v9, sel__initWithUIKitTextSuggestion_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

- (NSDictionary)contents
{
  return (NSDictionary *)-[UIAutoFillTextSuggestion contents](self->_backingSuggestion, "contents");
}

- (id)_uikitAutoFillTextSuggestion
{
  return self->_backingSuggestion;
}

- (UIAutoFillTextSuggestion)backingSuggestion
{
  return self->_backingSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingSuggestion, 0);
}

@end
