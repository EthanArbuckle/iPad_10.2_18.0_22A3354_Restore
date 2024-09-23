@implementation SUUITemplateDefinitionViewElement

- (SUUIViewElement)contentViewElement
{
  return (SUUIViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 26);
}

- (NSString)definitionMode
{
  void *v2;
  void *v3;

  -[SUUITemplateDefinitionViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)definitionType
{
  void *v2;
  void *v3;

  -[SUUITemplateDefinitionViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SUUIPredicateListViewElement)predicateListViewElement
{
  return (SUUIPredicateListViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 89);
}

@end
