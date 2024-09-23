@implementation MusicKit_SoftLinking_MPModelAlbum

+ (id)trackPopularityForIdentifiers:(id)a3 underlyingModelAlbum:(id)a4 tracksPopularityBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(void *, id, id);
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = (void (**)(void *, id, id))_Block_copy(a5);
  v9[2](v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
