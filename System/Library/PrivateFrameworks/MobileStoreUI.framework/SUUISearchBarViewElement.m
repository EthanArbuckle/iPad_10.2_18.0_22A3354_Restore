@implementation SUUISearchBarViewElement

- (SUUISearchBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUISearchBarViewElement *v9;
  uint64_t v10;
  NSString *accessoryText;
  uint64_t v12;
  SUUIViewElementText *defaultText;
  uint64_t v14;
  NSString *placeholderString;
  uint64_t v16;
  NSString *searchHintsURLString;
  uint64_t v18;
  NSString *trendingSearchURLString;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUUISearchBarViewElement;
  v9 = -[SUUIInputViewElement initWithDOMElement:parent:elementFactory:](&v21, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("accessoryText"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryText = v9->_accessoryText;
    v9->_accessoryText = (NSString *)v10;

    +[IKTextParser textWithDOMElement:usingParseBlock:](SUUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    defaultText = v9->_defaultText;
    v9->_defaultText = (SUUIViewElementText *)v12;

    objc_msgSend(v8, "getAttribute:", CFSTR("placeholder"));
    v14 = objc_claimAutoreleasedReturnValue();
    placeholderString = v9->_placeholderString;
    v9->_placeholderString = (NSString *)v14;

    objc_msgSend(v8, "getAttribute:", CFSTR("searchHints"));
    v16 = objc_claimAutoreleasedReturnValue();
    searchHintsURLString = v9->_searchHintsURLString;
    v9->_searchHintsURLString = (NSString *)v16;

    objc_msgSend(v8, "getAttribute:", CFSTR("trendingSearch"));
    v18 = objc_claimAutoreleasedReturnValue();
    trendingSearchURLString = v9->_trendingSearchURLString;
    v9->_trendingSearchURLString = (NSString *)v18;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUISearchBarViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *accessoryText;
  SUUIViewElementText *v9;
  SUUIViewElementText *defaultText;
  NSString *v11;
  NSString *placeholderString;
  NSString *v13;
  NSString *searchHintsURLString;
  NSString *v15;
  NSString *trendingSearchURLString;
  objc_super v18;

  v4 = (SUUISearchBarViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUISearchBarViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v18, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUISearchBarViewElement accessoryText](v4, "accessoryText");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    accessoryText = self->_accessoryText;
    self->_accessoryText = v7;

    -[SUUISearchBarViewElement defaultText](v4, "defaultText");
    v9 = (SUUIViewElementText *)objc_claimAutoreleasedReturnValue();
    defaultText = self->_defaultText;
    self->_defaultText = v9;

    -[SUUISearchBarViewElement placeholderString](v4, "placeholderString");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    placeholderString = self->_placeholderString;
    self->_placeholderString = v11;

    -[SUUISearchBarViewElement searchHintsURLString](v4, "searchHintsURLString");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    searchHintsURLString = self->_searchHintsURLString;
    self->_searchHintsURLString = v13;

    -[SUUISearchBarViewElement trendingSearchURLString](v4, "trendingSearchURLString");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    trendingSearchURLString = self->_trendingSearchURLString;
    self->_trendingSearchURLString = v15;

  }
  return v6;
}

- (unint64_t)elementType
{
  return 106;
}

- (int64_t)pageComponentType
{
  return 25;
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (SUUIViewElementText)defaultText
{
  return self->_defaultText;
}

- (NSString)placeholderString
{
  return self->_placeholderString;
}

- (NSString)searchHintsURLString
{
  return self->_searchHintsURLString;
}

- (NSString)trendingSearchURLString
{
  return self->_trendingSearchURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchURLString, 0);
  objc_storeStrong((id *)&self->_searchHintsURLString, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_defaultText, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
}

@end
