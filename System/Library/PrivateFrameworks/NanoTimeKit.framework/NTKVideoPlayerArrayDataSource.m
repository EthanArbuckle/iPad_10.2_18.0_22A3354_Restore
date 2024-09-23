@implementation NTKVideoPlayerArrayDataSource

+ (id)dataSourceForDevice:(id)a3 withFilenames:(id)a4
{
  return +[NTKVideoPlayerArrayDataSource dataSourceForDevice:withPosterImage:andFilenames:](NTKVideoPlayerArrayDataSource, "dataSourceForDevice:withPosterImage:andFilenames:", a3, 0, a4);
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 andFilenames:(id)a5
{
  return +[NTKVideoPlayerArrayDataSource dataSourceForDevice:withPosterImage:order:andFilenames:](NTKVideoPlayerArrayDataSource, "dataSourceForDevice:withPosterImage:order:andFilenames:", a3, a4, 0, a5);
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 andFilenames:(id)a6
{
  return +[NTKVideoPlayerArrayDataSource dataSourceForDevice:withPosterImage:order:endBehavior:andFilenames:](NTKVideoPlayerArrayDataSource, "dataSourceForDevice:withPosterImage:order:endBehavior:andFilenames:", a3, a4, a5, 0, a6);
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 endBehavior:(unint64_t)a6 andFilenames:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        +[NTKVideoPlayerListing listingForDevice:withFilename:](NTKVideoPlayerListing, "listingForDevice:withFilename:", v10, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setEndBehavior:", a6);
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  +[NTKVideoPlayerArrayDataSource dataSourceForDevice:withPosterImage:order:andListings:](NTKVideoPlayerArrayDataSource, "dataSourceForDevice:withPosterImage:order:andListings:", v10, v11, a5, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 andListings:(id)a5
{
  return (id)objc_msgSend(a1, "dataSourceForDevice:withPosterImage:order:andListings:", a3, a4, 0, a5);
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 andListings:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[NTKVideoPlayerArrayDataSource initForDevice:withListings:]([NTKVideoPlayerArrayDataSource alloc], "initForDevice:withListings:", v11, v9);

  objc_msgSend(v12, "setPosterImage:", v10);
  objc_msgSend(v12, "setOrder:", a5);
  return v12;
}

- (id)initForDevice:(id)a3 withListings:(id)a4
{
  id v6;
  NTKVideoPlayerArrayDataSource *v7;
  NTKVideoPlayerArrayDataSource *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NTKVideoPlayerArrayDataSource;
  v7 = -[NTKVideoPlayerDataSource init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_currentListingIndex = -1;
    objc_storeStrong((id *)&v7->_listings, a4);
    v8->_order = 0;
  }

  return v8;
}

- (void)advanceToNextListing:(unint64_t)a3
{
  unint64_t order;
  unint64_t v4;

  order = self->_order;
  if (order == 1)
  {
    self->_currentListingIndex = (int)NTKRandomInt32InScope(0, -[NSArray count](self->_listings, "count", a3) - 1);
  }
  else if (!order)
  {
    v4 = self->_currentListingIndex + 1;
    self->_currentListingIndex = v4 % -[NSArray count](self->_listings, "count", a3);
  }
}

- (id)currentListing
{
  void *v3;

  if (self->_currentListingIndex == -1)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[NSArray count](self->_listings, "count");
    if (v3)
    {
      -[NSArray objectAtIndexedSubscript:](self->_listings, "objectAtIndexedSubscript:", self->_currentListingIndex);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listings, 0);
}

@end
