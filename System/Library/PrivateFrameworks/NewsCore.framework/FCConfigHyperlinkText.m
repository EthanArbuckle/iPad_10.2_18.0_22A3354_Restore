@implementation FCConfigHyperlinkText

FCConfigHyperlinkTextLink *__50__FCConfigHyperlinkText_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCConfigHyperlinkTextLink *v3;

  v2 = a2;
  v3 = -[FCConfigHyperlinkTextLink initWithConfigDictionary:]([FCConfigHyperlinkTextLink alloc], "initWithConfigDictionary:", v2);

  return v3;
}

- (FCConfigHyperlinkText)initWithConfigDictionary:(id)a3
{
  id v4;
  FCConfigHyperlinkText *v5;
  uint64_t v6;
  NSString *text;
  void *v8;
  uint64_t v9;
  NSArray *links;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCConfigHyperlinkText;
  v5 = -[FCConfigHyperlinkText init](&v12, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("text"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("links"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_176);
    v9 = objc_claimAutoreleasedReturnValue();
    links = v5->_links;
    v5->_links = (NSArray *)v9;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (FCConfigHyperlinkText)initWithText:(id)a3 links:(id)a4
{
  id v7;
  id v8;
  FCConfigHyperlinkText *v9;
  FCConfigHyperlinkText *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCConfigHyperlinkText;
  v9 = -[FCConfigHyperlinkText init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_links, a4);
  }

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)links
{
  return self->_links;
}

@end
