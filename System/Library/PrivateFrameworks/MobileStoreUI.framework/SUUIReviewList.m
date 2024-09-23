@implementation SUUIReviewList

- (SUUIReviewList)initWithReviewListDictionary:(id)a3
{
  id v4;
  SUUIReviewList *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SUUIReview *v16;
  uint64_t v17;
  NSMutableArray *reviews;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUIReviewList;
  v5 = -[SUUIReviewList init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("review_list"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v20 = v8;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[SUUIReview initWithReviewDictionary:]([SUUIReview alloc], "initWithReviewDictionary:", v15);
              if (v16)
                objc_msgSend(v9, "addObject:", v16);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v12);
      }

      v17 = objc_msgSend(v9, "mutableCopy");
      reviews = v5->_reviews;
      v5->_reviews = (NSMutableArray *)v17;

      v8 = v20;
    }

  }
  return v5;
}

- (void)addReviews:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_reviews, "addObjectsFromArray:", a3);
}

- (int64_t)fiveStarRatingCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rating_count_5stars"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)fourStarRatingCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rating_count_4stars"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)numberOfPages
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("total_num_pages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)oneStarRatingCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rating_count_1star"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)ratingCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rating_count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)threeStarRatingCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rating_count_3stars"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)twoStarRatingCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rating_count_2stars"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (float)userRating
{
  void *v2;
  float v3;
  float v4;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rating_average"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "floatValue");
    v3 = v4;
  }

  return v3;
}

- (NSURL)writeReviewURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("writeReviewUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (SUUIReviewList)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIReviewList *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SUUIReview *v16;
  SUUIReview *v17;
  uint64_t v18;
  NSMutableArray *reviews;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)SUUIReviewList;
    v5 = -[SUUIReviewList init](&v25, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v6;

      objc_msgSend(v4, "objectForKey:", CFSTR("reviews"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
              v16 = [SUUIReview alloc];
              v17 = -[SUUIReview initWithCacheRepresentation:](v16, "initWithCacheRepresentation:", v15, (_QWORD)v21);
              if (v17)
                objc_msgSend(v9, "addObject:", v17);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v12);
        }

        v18 = objc_msgSend(v9, "copy");
        reviews = v5->_reviews;
        v5->_reviews = (NSMutableArray *)v18;

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
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSDictionary mutableCopy](self->_dictionary, "mutableCopy");
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_reviews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "cacheRepresentation", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("reviews"));
  return (NSMutableDictionary *)v3;
}

- (NSArray)reviews
{
  return &self->_reviews->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviews, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
