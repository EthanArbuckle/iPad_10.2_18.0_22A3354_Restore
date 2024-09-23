@implementation AVFragmentedMovieMinder

+ (AVFragmentedMovieMinder)fragmentedMovieMinderWithMovie:(AVFragmentedMovie *)movie mindingInterval:(NSTimeInterval)mindingInterval
{
  AVFragmentedMovie *v5;
  void *v6;

  v5 = movie;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMovie:mindingInterval:", v5, mindingInterval);

  return (AVFragmentedMovieMinder *)v6;
}

- (AVFragmentedMovieMinder)initWithMovie:(AVFragmentedMovie *)movie mindingInterval:(NSTimeInterval)mindingInterval
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVFragmentedMovieMinder;
  return -[AVFragmentedAssetMinder initWithAsset:mindingInterval:](&v5, sel_initWithAsset_mindingInterval_, movie, mindingInterval);
}

- (BOOL)_throwsWhenAlreadyMindedAssetIsAdded
{
  return 0;
}

- (NSTimeInterval)mindingInterval
{
  NSTimeInterval result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  -[AVFragmentedAssetMinder mindingInterval](&v3, sel_mindingInterval);
  return result;
}

- (void)setMindingInterval:(NSTimeInterval)mindingInterval
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  -[AVFragmentedAssetMinder setMindingInterval:](&v3, sel_setMindingInterval_, mindingInterval);
}

- (NSArray)movies
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  -[AVFragmentedAssetMinder assets](&v3, sel_assets);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addFragmentedMovie:(AVFragmentedMovie *)movie
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  -[AVFragmentedAssetMinder addFragmentedAsset:](&v3, sel_addFragmentedAsset_, movie);
}

- (void)removeFragmentedMovie:(AVFragmentedMovie *)movie
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovieMinder;
  -[AVFragmentedAssetMinder removeFragmentedAsset:](&v3, sel_removeFragmentedAsset_, movie);
}

@end
