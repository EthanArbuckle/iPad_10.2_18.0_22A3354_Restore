@implementation JFXMediaReaderCreationAVAssetTrackAttributes

- (JFXMediaReaderCreationAVAssetTrackAttributes)initWithAssetTrack:(id)a3
{
  id v5;
  JFXMediaReaderCreationAVAssetTrackAttributes *v6;
  uint64_t v7;
  AVAsset *asset;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JFXMediaReaderCreationAVAssetTrackAttributes;
  v6 = -[JFXMediaReaderCreationAVAssetTrackAttributes init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "asset");
    v7 = objc_claimAutoreleasedReturnValue();
    asset = v6->_asset;
    v6->_asset = (AVAsset *)v7;

    objc_storeStrong((id *)&v6->_assetTrack, a3);
  }

  return v6;
}

- (AVAssetTrack)assetTrack
{
  return self->_assetTrack;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetTrack, 0);
}

@end
