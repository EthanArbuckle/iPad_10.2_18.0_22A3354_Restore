@implementation SUUIReviewConfiguration

- (SUUIReviewConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4;
  SUUIReviewConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *allVersionsURLString;
  void *v9;
  uint64_t v10;
  NSString *currentVersionURLString;
  void *v12;
  uint64_t v13;
  NSString *ratingURLString;
  void *v15;
  uint64_t v16;
  NSString *pageNumberQueryParameter;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIReviewConfiguration;
  v5 = -[SUUIReviewConfiguration init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("allVersionsUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      allVersionsURLString = v5->_allVersionsURLString;
      v5->_allVersionsURLString = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("currentVersionUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      currentVersionURLString = v5->_currentVersionURLString;
      v5->_currentVersionURLString = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("inlineRatingUrl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      ratingURLString = v5->_ratingURLString;
      v5->_ratingURLString = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("pageNumberQueryParam"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      pageNumberQueryParameter = v5->_pageNumberQueryParameter;
      v5->_pageNumberQueryParameter = (NSString *)v16;

    }
  }

  return v5;
}

- (NSString)allVersionsURLString
{
  return self->_allVersionsURLString;
}

- (NSString)currentVersionURLString
{
  return self->_currentVersionURLString;
}

- (NSString)pageNumberQueryParameter
{
  return self->_pageNumberQueryParameter;
}

- (NSString)ratingURLString
{
  return self->_ratingURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingURLString, 0);
  objc_storeStrong((id *)&self->_pageNumberQueryParameter, 0);
  objc_storeStrong((id *)&self->_currentVersionURLString, 0);
  objc_storeStrong((id *)&self->_allVersionsURLString, 0);
}

@end
