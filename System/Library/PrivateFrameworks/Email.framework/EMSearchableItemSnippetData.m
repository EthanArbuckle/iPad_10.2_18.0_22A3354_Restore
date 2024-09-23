@implementation EMSearchableItemSnippetData

- (EMSearchableItemSnippetData)initWithSearchableItemIdentifier:(id)a3 snippetHints:(id)a4
{
  id v6;
  id v7;
  EMSearchableItemSnippetData *v8;
  uint64_t v9;
  NSString *searchableItemIdentifier;
  uint64_t v11;
  NSDictionary *snippetHints;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMSearchableItemSnippetData;
  v8 = -[EMSearchableItemSnippetData init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    searchableItemIdentifier = v8->_searchableItemIdentifier;
    v8->_searchableItemIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    snippetHints = v8->_snippetHints;
    v8->_snippetHints = (NSDictionary *)v11;

  }
  return v8;
}

- (NSString)searchableItemIdentifier
{
  return self->_searchableItemIdentifier;
}

- (void)setSearchableItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)snippetHints
{
  return self->_snippetHints;
}

- (void)setSnippetHints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetHints, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifier, 0);
}

@end
