@implementation _MKMapItemReviewsAttribution

- (_MKMapItemReviewsAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5;
  _MKMapItemReviewsAttribution *v6;
  _MKMapItemReviewsAttribution *v7;
  _MKMapItemReviewsAttribution *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemReviewsAttribution;
  v6 = -[_MKMapItemAttribution initWithGEOMapItemAttribution:](&v10, sel_initWithGEOMapItemAttribution_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoReviewsAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)addReviewURLs
{
  return (NSArray *)-[GEOMapItemReviewsAttribution addReviewURLs](self->_geoReviewsAttribution, "addReviewURLs");
}

- (id)urlsForReview:(id)a3
{
  GEOMapItemReviewsAttribution *geoReviewsAttribution;
  void *v4;
  void *v5;

  geoReviewsAttribution = self->_geoReviewsAttribution;
  objc_msgSend(a3, "_geoReview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemReviewsAttribution urlsForReview:](geoReviewsAttribution, "urlsForReview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)urlsForSelectedItemWithItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "_geoMapItem", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[GEOMapItemReviewsAttribution urlsForSelectedItemWithItems:](self->_geoReviewsAttribution, "urlsForSelectedItemWithItems:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoReviewsAttribution, 0);
}

@end
