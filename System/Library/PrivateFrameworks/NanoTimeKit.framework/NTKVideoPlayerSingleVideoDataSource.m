@implementation NTKVideoPlayerSingleVideoDataSource

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 andListing:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NTKVideoPlayerSingleVideoDataSource initForDevice:listing:posterImage:]([NTKVideoPlayerSingleVideoDataSource alloc], "initForDevice:listing:posterImage:", v9, v7, v8);

  return v10;
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 endBehavior:(unint64_t)a5 andFilename:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v9 = a4;
  v10 = a3;
  +[NTKVideoPlayerListing listingForDevice:withFilename:](NTKVideoPlayerListing, "listingForDevice:withFilename:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEndBehavior:", a5);
  v12 = -[NTKVideoPlayerSingleVideoDataSource initForDevice:listing:posterImage:]([NTKVideoPlayerSingleVideoDataSource alloc], "initForDevice:listing:posterImage:", v10, v11, v9);

  return v12;
}

- (id)initForDevice:(id)a3 listing:(id)a4 posterImage:(id)a5
{
  id v8;
  id v9;
  NTKVideoPlayerSingleVideoDataSource *v10;
  NTKVideoPlayerSingleVideoDataSource *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NTKVideoPlayerSingleVideoDataSource;
  v10 = -[NTKVideoPlayerDataSource init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_listing, a4);
    -[NTKVideoPlayerDataSource setPosterImage:](v11, "setPosterImage:", v9);
  }

  return v11;
}

- (id)currentListing
{
  return self->_listing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listing, 0);
}

@end
