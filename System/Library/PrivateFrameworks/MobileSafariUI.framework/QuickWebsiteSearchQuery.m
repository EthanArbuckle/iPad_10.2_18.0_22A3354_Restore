@implementation QuickWebsiteSearchQuery

- (QuickWebsiteSearchQuery)initWithUserEnteredQuery:(id)a3
{
  id v5;
  QuickWebsiteSearchQuery *v6;
  QuickWebsiteSearchQuery *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *websiteNamePrefix;
  uint64_t v16;
  NSString *searchTerms;
  NSString *v18;
  QuickWebsiteSearchQuery *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)QuickWebsiteSearchQuery;
  v6 = -[QuickWebsiteSearchQuery init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_completionQuery, a3);
    objc_msgSend(v5, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringByTrimmingWhitespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR(" "));
    if (v11)
    {
      v12 = v10;
      v13 = v11;
      objc_msgSend(v9, "substringToIndex:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
      websiteNamePrefix = v7->_websiteNamePrefix;
      v7->_websiteNamePrefix = (NSString *)v14;

      if (objc_msgSend(v9, "length") <= (unint64_t)(v12 + v13))
      {
LABEL_7:
        v19 = v7;

        goto LABEL_8;
      }
      objc_msgSend(v9, "substringFromIndex:");
      v16 = objc_claimAutoreleasedReturnValue();
      searchTerms = v7->_searchTerms;
      v7->_searchTerms = (NSString *)v16;
    }
    else
    {
      v18 = v9;
      searchTerms = v7->_websiteNamePrefix;
      v7->_websiteNamePrefix = v18;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (NSString)websiteNamePrefix
{
  return self->_websiteNamePrefix;
}

- (NSString)searchTerms
{
  return self->_searchTerms;
}

- (WBSCompletionQuery)completionQuery
{
  return self->_completionQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQuery, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_websiteNamePrefix, 0);
}

@end
