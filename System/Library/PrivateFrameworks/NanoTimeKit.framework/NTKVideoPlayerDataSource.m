@implementation NTKVideoPlayerDataSource

- (NTKVideoPlayerDataSource)init
{
  NTKVideoPlayerDataSource *v2;
  NTKVideoPlayerDataSource *v3;
  NTKVideoPlayerListing *currentListing;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKVideoPlayerDataSource;
  v2 = -[NTKVideoPlayerDataSource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    currentListing = v2->_currentListing;
    v2->_currentListing = 0;

  }
  return v3;
}

- (id)listingsToQueueAfterCurrent
{
  return 0;
}

- (id)listingToQueueOncePlaybackStarts
{
  return 0;
}

- (UIImage)posterImage
{
  return self->_posterImage;
}

- (void)setPosterImage:(id)a3
{
  objc_storeStrong((id *)&self->_posterImage, a3);
}

- (NTKVideoPlayerListing)currentListing
{
  return self->_currentListing;
}

- (void)setCurrentListing:(id)a3
{
  objc_storeStrong((id *)&self->_currentListing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListing, 0);
  objc_storeStrong((id *)&self->_posterImage, 0);
}

@end
