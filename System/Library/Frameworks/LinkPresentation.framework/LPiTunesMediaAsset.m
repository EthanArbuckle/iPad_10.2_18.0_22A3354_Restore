@implementation LPiTunesMediaAsset

- (LPiTunesMediaAsset)initWithImageURL:(id)a3 colors:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  LPiTunesMediaAsset *v12;
  LPiTunesMediaAsset *v13;
  LPiTunesMediaAsset *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPiTunesMediaAsset;
  v12 = -[LPiTunesMediaAsset init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_colors, a4);
    objc_storeStrong((id *)&v13->_name, a5);
    v13->_type = 0;
    v14 = v13;
  }

  return v13;
}

- (LPiTunesMediaAsset)initWithVideoURL:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  LPiTunesMediaAsset *v9;
  LPiTunesMediaAsset *v10;
  LPiTunesMediaAsset *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPiTunesMediaAsset;
  v9 = -[LPiTunesMediaAsset init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    v10->_type = 1;
    v11 = v10;
  }

  return v10;
}

- (LPiTunesMediaAsset)initWithName:(id)a3 lyricComponents:(id)a4
{
  id v7;
  id v8;
  LPiTunesMediaAsset *v9;
  LPiTunesMediaAsset *v10;
  LPiTunesMediaAsset *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPiTunesMediaAsset;
  v9 = -[LPiTunesMediaAsset init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_lyricComponents, a4);
    v10->_type = 2;
    v11 = v10;
  }

  return v10;
}

- (LPiTunesMediaAsset)initWithName:(id)a3 curatorID:(id)a4
{
  id v7;
  id v8;
  LPiTunesMediaAsset *v9;
  LPiTunesMediaAsset *v10;
  LPiTunesMediaAsset *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPiTunesMediaAsset;
  v9 = -[LPiTunesMediaAsset init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_curatorID, a4);
    v10->_type = 3;
    v11 = v10;
  }

  return v10;
}

- (id)metadata
{
  LPArtworkMetadata *v3;

  v3 = objc_alloc_init(LPArtworkMetadata);
  -[LPArtworkMetadata setURL:](v3, "setURL:", self->_URL);
  -[LPArtworkMetadata setColors:](v3, "setColors:", self->_colors);
  return v3;
}

- (LPFetcher)fetcher
{
  LPImageFetcher *v2;

  switch(self->_type)
  {
    case 0:
      v2 = objc_alloc_init(LPImageFetcher);
      -[LPImageFetcher setURL:](v2, "setURL:", self->_URL);
      -[LPFetcher setUserData:](v2, "setUserData:", self);
      -[LPFetcher setResponseClass:](v2, "setResponseClass:", objc_opt_class());
      break;
    case 1:
      v2 = objc_alloc_init(LPMediaAssetFetcher);
      -[LPImageFetcher setURL:](v2, "setURL:", self->_URL);
      -[LPFetcher setUserData:](v2, "setUserData:", self);
      break;
    case 2:
      v2 = objc_alloc_init(LPAppleMusicLyricExcerptFetcher);
      -[LPImageFetcher setLyricComponents:](v2, "setLyricComponents:", self->_lyricComponents);
      -[LPFetcher setUserData:](v2, "setUserData:", self);
      break;
    case 3:
      v2 = -[LPiTunesCuratorProfileURLFetcher initWithCuratorID:]([LPiTunesCuratorProfileURLFetcher alloc], "initWithCuratorID:", self->_curatorID);
      -[LPFetcher setUserData:](v2, "setUserData:", self);
      break;
    default:
      return (LPFetcher *)v2;
  }
  return (LPFetcher *)v2;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_curatorID, 0);
  objc_storeStrong((id *)&self->_lyricComponents, 0);
}

@end
