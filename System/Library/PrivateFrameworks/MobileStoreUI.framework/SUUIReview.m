@implementation SUUIReview

- (SUUIReview)initWithReviewDictionary:(id)a3
{
  id v4;
  SUUIReview *v5;
  void *v6;
  uint64_t v7;
  NSString *body;
  void *v9;
  uint64_t v10;
  NSString *dateString;
  void *v12;
  float v13;
  void *v14;
  uint64_t v15;
  NSString *reviewer;
  void *v17;
  uint64_t v18;
  NSString *title;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUUIReview;
  v5 = -[SUUIReview init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("review_body"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<br/>"), CFSTR("\n"));
      v7 = objc_claimAutoreleasedReturnValue();
      body = v5->_body;
      v5->_body = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("review_date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      dateString = v5->_dateString;
      v5->_dateString = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("review_star_count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      v5->_rating = v13;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("review_name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      reviewer = v5->_reviewer;
      v5->_reviewer = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("review_title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v18;

    }
  }

  return v5;
}

- (id)formattedBylineWithClientContext:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_dateString)
    goto LABEL_26;
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v6 = 1;
  objc_msgSend(v5, "setLenient:", 1);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v7);

  v8 = 0;
  v19 = xmmword_2511F7DF8;
  do
  {
    v9 = v6;
    objc_msgSend(v5, "setDateFormat:", *((_QWORD *)&v19 + v8));
    objc_msgSend(v5, "dateFromString:", self->_dateString);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      break;
    v6 = 0;
    v8 = 1;
  }
  while ((v9 & 1) != 0);
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v12, "setDateStyle:", 2);
    objc_msgSend(v12, "setTimeStyle:", 0);
    objc_msgSend(v12, "stringFromDate:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  for (i = 8; i != -8; i -= 8)
  if (v13)
  {
    if (self->_reviewer)
    {
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("REVIEW_BYLINE_WITH_DATE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEW_BYLINE_WITH_DATE"), 0, CFSTR("ProductPage"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@%@"), 0, self->_reviewer, v13, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = v13;
      v15 = v13;
    }
  }
  else
  {
LABEL_26:
    if (self->_reviewer)
    {
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("REVIEW_BYLINE_NO_DATE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEW_BYLINE_NO_DATE"), 0, CFSTR("ProductPage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, self->_reviewer);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
    }
    else
    {
      v13 = 0;
      v15 = 0;
    }
  }

  return v15;
}

- (SUUIReview)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIReview *v5;
  void *v6;
  uint64_t v7;
  NSString *body;
  void *v9;
  uint64_t v10;
  NSString *dateString;
  void *v12;
  float v13;
  void *v14;
  uint64_t v15;
  NSString *reviewer;
  void *v17;
  uint64_t v18;
  NSString *title;
  objc_super v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)SUUIReview;
    v5 = -[SUUIReview init](&v21, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("review_body"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "copy");
        body = v5->_body;
        v5->_body = (NSString *)v7;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("review_date"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        dateString = v5->_dateString;
        v5->_dateString = (NSString *)v10;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("review_star_count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "floatValue");
        v5->_rating = v13;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("review_name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = objc_msgSend(v14, "copy");
        reviewer = v5->_reviewer;
        v5->_reviewer = (NSString *)v15;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("review_title"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = objc_msgSend(v17, "copy");
        title = v5->_title;
        v5->_title = (NSString *)v18;

      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *body;
  NSString *dateString;
  NSString *reviewer;
  NSString *title;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_rating;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("review_star_count"));

  body = self->_body;
  if (body)
    objc_msgSend(v3, "setObject:forKey:", body, CFSTR("review_body"));
  dateString = self->_dateString;
  if (dateString)
    objc_msgSend(v3, "setObject:forKey:", dateString, CFSTR("review_date"));
  reviewer = self->_reviewer;
  if (reviewer)
    objc_msgSend(v3, "setObject:forKey:", reviewer, CFSTR("review_name"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("review_title"));
  return (NSMutableDictionary *)v3;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (float)rating
{
  return self->_rating;
}

- (NSString)reviewer
{
  return self->_reviewer;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reviewer, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
