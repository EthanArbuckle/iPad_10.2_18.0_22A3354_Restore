@implementation SUUIAbstractEntityProviderViewElement

- (SUUIAbstractEntityProviderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIAbstractEntityProviderViewElement *v9;
  void *v10;
  uint64_t v11;
  NSString *entityTypeString;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *prefetchedProperties;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIAbstractEntityProviderViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v19, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("entityType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(v10, "copy");
      entityTypeString = v9->_entityTypeString;
      v9->_entityTypeString = (NSString *)v11;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("prefetchedProperties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_2511FF0C8, 1, 0, objc_msgSend(v14, "length"));
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(","));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    if (objc_msgSend(v15, "count"))
    {
      v16 = objc_msgSend(v15, "copy");
      prefetchedProperties = v9->_prefetchedProperties;
      v9->_prefetchedProperties = (NSArray *)v16;

    }
  }

  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIAbstractEntityProviderViewElement *v4;
  SUUIAbstractEntityProviderViewElement *v5;
  SUUIAbstractEntityProviderViewElement *v6;
  void *v7;
  NSString *v8;
  NSString *entityTypeString;
  void *v10;
  NSArray *v11;
  NSArray *prefetchedProperties;
  objc_super v14;

  v4 = (SUUIAbstractEntityProviderViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIAbstractEntityProviderViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v14, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIAbstractEntityProviderViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SUUIAbstractEntityProviderViewElement entityTypeString](v4, "entityTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    entityTypeString = self->_entityTypeString;
    self->_entityTypeString = v8;

    -[SUUIAbstractEntityProviderViewElement prefetchedProperties](v4, "prefetchedProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSArray *)objc_msgSend(v10, "copy");
    prefetchedProperties = self->_prefetchedProperties;
    self->_prefetchedProperties = v11;

  }
  return v6;
}

- (SUUILimitListViewElement)limitListViewElement
{
  return (SUUILimitListViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 61);
}

- (SUUIPredicateListViewElement)predicateListViewElement
{
  return (SUUIPredicateListViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 89);
}

- (SUUISortDescriptorListViewElement)sortDescriptorListViewElement
{
  return (SUUISortDescriptorListViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 126);
}

- (NSString)entityTypeString
{
  return self->_entityTypeString;
}

- (NSArray)prefetchedProperties
{
  return self->_prefetchedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedProperties, 0);
  objc_storeStrong((id *)&self->_entityTypeString, 0);
}

@end
